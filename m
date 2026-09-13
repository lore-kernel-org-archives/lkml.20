Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2023FC5A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269213; cv=none; b=RsQGTOTHXOfsRrNJMIWWwk7PLrMo5TGfxY4AkHS6m1v+ZUGcTaMr0/cy8lt8eztMgrKvFhNExI40AUKb4hyMA82Q3td5FuU54FL6FGQ7OgkWOm01+WmwlHFsbhfESiR4oPg7swV/z2MY86/ED0eAqHx2qtndWm6jSb8SQXI0hfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269213; c=relaxed/simple;
	bh=IrK4RuTQd6Gh9ID4xjBsHXpyEVfmDXJk3B/kMTgF98w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pWN3oUj7sjtwCWPUWYM6xDhM/LbixJH9mJmuUGe2RhzEpjbBiLO5/f2HQjCxgfIdCpnB0qxsOAPV0GeS0hqwJenT39Alwn/XX0uslBX+zcEL/3nCMPhrBdEG3/zaLYRhzkW8+78VdqRaeGJTEfbV/603bkSewHKxQMV2VhnPev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShXR0WzS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShXR0WzS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so299040a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269211; x=1789874011; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IvPt/wZXxxujTbMZWfSIeh9piDl1KqYp+kykFsa0uBU=;
        b=ShXR0WzSEcjxRW8IiiqttXSxB9lMgaa2ZOk5lEz+lTJNnHlMo/FW3p7cxucgCPK4u/
         n6SajbtuhPkTtfV5dkLlkbzoxtYRDRs4pMoUkCJrQHaiLOf+udpzX14bUOgWgsl9KYQQ
         5eUodWSOBOaDoGroVtVTLBfZ2WIgt7sEk1kPqTMGRQXVFkSgtquLNqEmqlYLGw29Fugv
         2GwxkcDVRpEuVFofm05qOPXabW/X5qIJvV63h9ZBAuN84O1qScBxbqeekmdABtKHcgCm
         QJU5+aPzJQIB+R3munsbkEOa55ZxlHSoIlTxtR0BYutbzO98KzRVU18q+nAiVcuA70lb
         ohhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269211; x=1789874011;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvPt/wZXxxujTbMZWfSIeh9piDl1KqYp+kykFsa0uBU=;
        b=km0NrTI8IIfn3gd5gbGjrisZ4D5LwlvD3xen8IyZHOZ5i7w2M/7oYjMsaqPERax7xH
         GUWh/Vq+njtYAoezIUPtoGNfJZax7+kQsVx1zRucK1duLL/TvRGi1LmxeawaSwwdTK6W
         IbhxrTh7Gi9Uqd9ikptDWSwBJRQziMO7uNiwrYRdHOqNzVyf4zu/FfLrsmuCreNLJYSB
         HhWG6wfseBncSk8x9b7kUebxaY52UVbHfnAyWxDVmz0FrMTRkeLDjsxXGcPBqbpsCcMY
         5x7wj2VKNx0OurfjwOumClQy6dPCrHausGOWRebFJi3yh6TRDe9CbTrejrJojemJQidi
         0PIw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/UMxHEXfLZqL+MNdXEHe30CQX1L2Eda3sJDtaeWC5vMopVChlOthyHcHTYhfaVV/vQjj7pgK7nVMavY=@vger.kernel.org
X-Gm-Message-State: AFuF++lmTnVSeIRSdDcQ7NejmJTb8lpiXo/HfuBnREVFzZ2TeNo+Hsyj
	iYW/PrDXi8J1xj9Ou2D5vdRHrqXXTgMygsGRt8ZuF4XKxuTfavR5rI87
X-Gm-Gg: AYBFou2XnBgmJuUB1NaaaGzd8yRMJ5HokpiipGnnICX6VBJgsC0iSvk2qPYYnKFcuJk
	+FRKzHCBqYZZmKTlCw4O7UF7twCJGhTbjJ8WoX3smnDVe8gwV3mYDiWyOW9QZ6u8hS5qQPuxIdP
	TEVBT2rYIa2dF4v16EioRpjMcXz15aDVmSoEubd8SUf8+Em89PHaQV2UR6a3JvEOjQ8+V3dx0O3
	efc1y7OnJVFBzEXOsdIbVGI5yQnA+JeTEa1jy7SYS73eKHf1R49btkR4uOvUpL+1XGLpW3yvEkM
	mgE8fcstfW/LfSU7D9iGhmAZeJkBZeEtNXdLvoRKOrbt5BDrqfY2Oc5gD3LGgCDHK+at80/dUyl
	ExWZsH5WFV3LuwK5fkd5weXTHjObBUhhXd6bUUTMT7ab7xF1EELxLg5sQ7pnYcQHsrqMEC/5UV1
	rkodtieFB4NHdtzJF2d90ShYBR+JmJoLEJZLW5hJcKZKXJrhyD233mIh0g2Gr6iA5MmDQr2uzuH
	biQkahD
X-Received: by 2002:a17:90b:48cf:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39d9c359923mr11760988a91.3.1789269211221;
        Sat, 12 Sep 2026 20:13:31 -0700 (PDT)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d987e755fsm13251142a91.0.2026.09.12.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:13:30 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 13 Sep 2026 12:13:23 +0900
Subject: [PATCH] docs: sphinx-pre-install: warn about unsupported Docutils
 versions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QpAQBBFf0XzbGpnifgVedhYTG1LO0jJvxsez
 72ne28Qn9gLtNkNyZ8svEYFyjMYFhdnjzwqgzW2Mg0VOK6DoGwLxwu3pHWU3YXw5cfOQbCeqHS
 WjCkdgc6oNPH1X3T987zDx5TjcgAAAA==
X-Change-ID: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.3

Sphinx declares the range of Docutils versions it supports, but a
distribution can relax that upper bound when it wants to ship a newer
Docutils.  The pair then installs happily, and htmldocs builds without
a complaint, so nothing looks wrong until pdfdocs is run.

Fedora 44 ships such a pair: Sphinx 8.2.3 (which declares
"docutils>=0.20,<0.22") is patched to accept "<0.23" and is installed
alongside Docutils 0.22.4.  make pdfdocs then fails to produce four of
its books.  admin-guide runs out of TeX main memory 13 pages in:

  ! TeX capacity exceeded, sorry [main memory size=6000000].
  \sphinxafterbreak ->\copy \sphinxcontinuationbox

while arch, core-api and translations stop on

  ! Dimension too large.
  \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
  \end{sphinxVerbatim}

Both come from the large literal blocks those books include whole --
memory-barriers.txt, devices.txt, kernel-parameters.txt and
arch/sparc/oradax/dax-hv-api.txt.  Keeping everything else fixed and
varying only the two versions shows that neither component is at fault
on its own:

  sphinx   docutils   core-api   admin-guide
  ------------------------------------------
  8.1.3    0.21.2     ok         ok
  8.2.3    0.21.2     ok         ok
  8.2.3    0.22.4     FAILS      FAILS
  9.1.0    0.22.4     ok         ok

Sphinx gained Docutils 0.22 support in 9.0.0 and upstream decided not
to backport it to 8.2.x [1], so this pair will stay broken rather than
be fixed in a later 8.2 point release.

Check for it, since sphinx-pre-install exists precisely to catch a
documentation build environment that will not work.  Ask the
interpreter behind sphinx-build for its Docutils version -- a venv and
the system install can differ -- and warn when Sphinx is older than
9.0.0 while Docutils is 0.22 or newer.  Only warn: the build is left to
proceed, and htmldocs is unaffected.

Note that the bound Sphinx itself declares is of no use here, as that
is the very thing the distribution has changed.

[1]: https://github.com/orgs/sphinx-doc/discussions/14055

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Verified on Debian 13 over six Sphinx/Docutils combinations: the warning
appears for 8.2.3 with 0.22.4 and for nothing else, including the
boundaries at Sphinx 9.0.0 and Docutils 0.21.2.  Also checked on the
Fedora 44 host, where it fires as it should, and in a venv built from
Documentation/sphinx/requirements.txt, which resolves to Sphinx 9.1.0
and stays quiet.  make htmldocs and make pdfdocs are otherwise
untouched; the warning does not change the exit status.

This lands in the same area as Chen Miao's "docs: sphinx-pre-install:
improve dependency checks" series [1], which adds a GNU Make version
check alongside the existing Sphinx one.  It applies cleanly to mainline
today, but I am happy to rebase if that series goes in first.

[1]: https://lore.kernel.org/linux-doc/20260814214419.49925-1-chenmiao.ku@gmail.com/
---
 tools/docs/sphinx-pre-install | 69 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093a41..d22287451e9b 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -41,6 +41,13 @@ from kdoc.python_version import PythonVersion
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
 
+# Sphinx only learned to cope with Docutils 0.22 on its 9.0.0 release, and
+# upstream chose not to backport that to the 8.2.x series:
+#     https://github.com/orgs/sphinx-doc/discussions/14055
+# So the pair below is broken for good, not just until the next point release.
+MIN_DOCUTILS_SPHINX = PythonVersion("9.0.0").version
+DOCUTILS_BREAKS_AT = PythonVersion("0.22").version
+
 
 class DepManager:
     """
@@ -490,10 +497,72 @@ class MissingCheckers(AncillaryMethods):
             self.need_sphinx = 1
             return
 
+        self.check_docutils(sphinx)
+
         # On version check mode, just assume Sphinx has all mandatory deps
         if self.version_check and self.cur_version >= RECOMMENDED_VERSION:
             sys.exit(0)
 
+    def get_docutils_version(self, cmd):
+        """
+        Get the Docutils version a sphinx-build command would use.
+
+        Docutils is a Python module rather than a program, so it has to be
+        asked of the very interpreter that runs sphinx-build: a venv and the
+        system install can hold different versions. Take it from the script's
+        shebang, falling back to the interpreter running this script.
+        """
+        python = sys.executable
+
+        try:
+            with open(cmd, "r", encoding="utf-8") as f:
+                match = re.match(r"^#!\s*(\S+)", f.readline())
+                if match:
+                    python = match.group(1)
+        except (OSError, UnicodeDecodeError):
+            pass
+
+        try:
+            result = self.run(
+                [python, "-c", "import docutils; print(docutils.__version__)"],
+                capture_output=True,
+                text=True,
+                check=True,
+            )
+        except (OSError, subprocess.CalledProcessError):
+            return None
+
+        match = re.match(r"^\s*([0-9]+(?:\.[0-9]+)*)", result.stdout)
+        if not match:
+            return None
+
+        return PythonVersion.parse_version(match.group(1))
+
+    def check_docutils(self, sphinx):
+        """
+        Warn when Sphinx is paired with a Docutils it cannot handle.
+
+        Sphinx declares the Docutils range it supports, but distributions
+        sometimes relax that upper bound to ship a newer Docutils. The pair
+        still builds HTML, so nothing looks wrong until pdfdocs is run and
+        the LaTeX output turns out to be broken.
+        """
+        if not self.cur_version or self.cur_version >= MIN_DOCUTILS_SPHINX:
+            return
+
+        docutils_version = self.get_docutils_version(sphinx)
+        if not docutils_version or docutils_version < DOCUTILS_BREAKS_AT:
+            return
+
+        curver = PythonVersion.ver_str(self.cur_version)
+        docver = PythonVersion.ver_str(docutils_version)
+        minver = PythonVersion.ver_str(MIN_DOCUTILS_SPHINX)
+
+        print(f"WARNING: Sphinx {curver} does not support Docutils {docver}.")
+        print(f"         Docutils 0.22 and above need Sphinx {minver} or later.")
+        print("         PDF builds are known to produce broken LaTeX with this")
+        print("         combination, even though HTML builds fine.")
+
     def catcheck(self, filename):
         """
         Reads a file if it exists, returning as string.

---
base-commit: 5225b8eec4c9bb21aecff6295fab6346a3c3738e
change-id: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

