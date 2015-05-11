<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes" />

  <!--
    A top leve <cudSubjects> and child <cudSubject> will always exist.
    the latter _may_ need a for-each loop, but that should be simple
    enough to add if necessary.
  -->

  <xsl:template match="/cudSubjects">
    <cudSubjects>
      <xsl:apply-templates select="cudSubject" />
    </cudSubjects>
  </xsl:template>

  <xsl:template match="cudSubject">
    <cudSubject>
      <xsl:apply-templates select="attributes" />
    </cudSubject>
  </xsl:template>

  <!--
    First a top-level template to catch some potential special cases and
    call out to templates for them where needed.
  -->

  <xsl:template match="attributes">
    <xsl:for-each select="cudAttribute">
      <!--
        replace all the colons from attribute names as it's an invalid
        character for an XML element name.

        Everything starts "cud:" so strip that off first, then strip off
        the what remains up to, including, the last colon.  This could
        possibly be done in one function, but this is clearer to read.
      -->
      <xsl:variable name="cudAttrStripped" select="substring(name,5)" />
      <xsl:variable name="cudAttrTrimmed" select="substring-after($cudAttrStripped,':')" />
      <xsl:choose>

        <xsl:when test="name = 'cud:uas_sits:contact_details'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:element name="{name}">
                <xsl:for-each select="value[@class='list']/cudAttribute">
                  <xsl:call-template name="generic_list_attr" />
                </xsl:for-each>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:nationalities'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:element name="{name}">
                <xsl:for-each select="value[@class='list']/cudAttribute">
                  <xsl:call-template name="generic_list_attr" />
                </xsl:for-each>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:addresses'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:element name="{name}">
                <xsl:for-each select="value[@class='list']/cudAttribute">
                  <xsl:call-template name="generic_list_attr" />
                </xsl:for-each>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:qualifications'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:call-template name="qualifications" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:external_ids'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:element name="{name}">
                <xsl:for-each select="value[@class='list']/cudAttribute">
                  <xsl:call-template name="generic_list_attr" />
                </xsl:for-each>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:disabilities'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:element name="{name}">
                <xsl:for-each select="value[@class='list']/cudAttribute">
                  <xsl:call-template name="generic_list_attr" />
                </xsl:for-each>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:student'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']">
              <xsl:call-template name="student_details" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:applicant'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']">
              <xsl:call-template name="applicant" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:co_owning_dept_code'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:value-of select="." />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:application_dept_codes'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:value-of select="." />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:uas_sits:application_college_codes'">
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:value-of select="." />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:fk:oak_person_id'">
          <xsl:element name="{$cudAttrTrimmed}s">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:element name="{$cudAttrTrimmed}">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="value[@class='string']">
              <xsl:element name="{$cudAttrTrimmed}">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:cas:current_affiliation'">
          <xsl:element name="{$cudAttrTrimmed}s">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:element name="{$cudAttrTrimmed}">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <xsl:when test="name = 'cud:cas:scoped_affiliation'">
          <xsl:element name="{$cudAttrTrimmed}s">
            <xsl:for-each select="value[@class='list']/string">
              <xsl:element name="{$cudAttrTrimmed}">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:when>

        <!--
          No more special cases, everything else just gets renamed to
          it's trimmed attribute name.
        -->
        <xsl:otherwise>
          <xsl:element name="{$cudAttrTrimmed}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>

      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <!--
    This generic template catches many cases, and just expands as necesary.
  -->

  <xsl:template name="generic_list_attr">
    <xsl:variable name="addrElement" select="name" />
    <xsl:element name="{$addrElement}">
      <xsl:value-of select="value" />
    </xsl:element>
  </xsl:template>

  <!--
    From here on down are the specific templates for the above matched
    special cases.  Some are almost identical, but XSLT doesn't make it
    that easy to make things any more generic.  There may well be a way,
    but I haven't found one that's any simpler or clearer that what we
    have below.
  -->

  <xsl:template name="applicant" match="string">
    <xsl:for-each select="cudAttribute">
      <xsl:variable name="ApplicantElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Applications'">
          <xsl:for-each select="value[@class='list']/cudAttribute">
            <xsl:call-template name="applications" />
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$ApplicantElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="qualifications" match="string">
    <xsl:element name="{name}">
      <xsl:for-each select="value[@class='list']/cudAttribute">
        <xsl:variable name="qualElement" select="name" />
        <xsl:choose>
          <xsl:when test="name = 'Subjects'">
            <xsl:call-template name="subjects" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="{$qualElement}">
              <xsl:value-of select="value" />
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name="applications" match="string">
    <xsl:element name="{name}">
      <xsl:for-each select="value[@class='list']/cudAttribute">
        <xsl:variable name="applElement" select="name" />
        <xsl:choose>
          <xsl:when test="name = 'AwdProg'">
            <xsl:element name="{name}">
              <xsl:for-each select="value[@class='list']/cudAttribute">
                <xsl:call-template name="generic_list_attr" />
              </xsl:for-each>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="{$applElement}">
              <xsl:value-of select="value" />
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name="subjects" match="string">
    <xsl:element name="{name}">
      <xsl:for-each select="value[@class='list']/cudAttribute">
        <xsl:variable name="subjsElement" select="name" />
        <xsl:choose>
          <xsl:when test="name = 'Subject'">
            <xsl:element name="{name}">
              <xsl:for-each select="value[@class='list']/cudAttribute">
                <xsl:call-template name="generic_list_attr" />
              </xsl:for-each>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="{$subjsElement}">
              <xsl:value-of select="value" />
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name="student_details" match="string">
    <xsl:for-each select="cudAttribute">
      <xsl:variable name="StudentElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Enrolments'">
          <xsl:for-each select="value[@class='list']/cudAttribute">
            <xsl:element name="{name}">
              <xsl:call-template name="enrolments" />
            </xsl:element>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="name = 'Suspensions'">
          <xsl:for-each select="value[@class='list']/cudAttribute">
            <xsl:element name="{name}">
              <xsl:for-each select="value[@class='list']/cudAttribute">
                <xsl:call-template name="generic_list_attr" />
              </xsl:for-each>
            </xsl:element>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$StudentElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="enrolments" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="enrolmentsElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'AwdProg'">
          <xsl:element name="{name}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:call-template name="generic_list_attr" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>
        <xsl:when test="name = 'YearsOfAwdProg'">
          <xsl:element name="{name}">
            <xsl:call-template name="year_of_award" />
          </xsl:element>
        </xsl:when>
        <xsl:when test="name = 'Supervisions'">
          <xsl:element name="{name}">
            <xsl:call-template name="supervisions" />
          </xsl:element>
        </xsl:when>
        <xsl:when test="name = 'AssessmentsEntered'">
          <xsl:element name="{name}">
            <xsl:call-template name="assmnts_entered" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$enrolmentsElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="year_of_award" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="yoAwardElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'YearAwdProg'">
          <xsl:element name="{name}">
            <xsl:call-template name="year_award" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$yoAwardElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="year_award" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="yAwardElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Co-OwningDepartments'">
          <xsl:element name="{name}">
            <xsl:call-template name="co_owning_departments" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$yAwardElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <!--  This calls itself, weird I know, but it works and it's tidy -->
  <xsl:template name="co_owning_departments" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="CODeptsElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Co-OwningDepartment'">
          <xsl:element name="{name}">
            <xsl:call-template name="co_owning_departments" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$CODeptsElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="supervisions" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="supvisElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Supervision'">
          <xsl:element name="{name}">
            <xsl:call-template name="supervision" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$supvisElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="supervision" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="supviElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'Supervision'">
          <xsl:element name="{name}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:call-template name="generic_list_attr" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$supviElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="assmnts_entered" match="string">
    <xsl:for-each select="value[@class='list']/cudAttribute">
      <xsl:variable name="assmntsElement" select="name" />
      <xsl:choose>
        <xsl:when test="name = 'AssessmentEntered'">
          <xsl:element name="{name}">
            <xsl:for-each select="value[@class='list']/cudAttribute">
              <xsl:call-template name="generic_list_attr" />
            </xsl:for-each>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{$assmntsElement}">
            <xsl:value-of select="value" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
