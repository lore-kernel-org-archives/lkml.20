Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E5379ED6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482104; cv=none; b=hT9ebXM4RysV/Sn+eE+sKKcKFMJRCdoohkx4VpqGw0LpdYVp7hMrMJ5uSGdTGTjt0QT3O7tvIqbUMrI2zOJaSFzbbWT/GGnTEnXiQsgL6TM5ZEGWwh0JVmFPh5SPQFszCasfRn7ot8fVqUWfPmHoML0eZ4yJslfAeW4wrkKSoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482104; c=relaxed/simple;
	bh=Y9WQAR8Lh+In4wq8+NuwEc4j0TB9l99V6KjU9lr8QSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GH5O1ejNdtb8L0a8GZqFo/l+4SPtgdG1mrBg+agNVaMiH+N3I7jQhksELiyHgf5q4e8YBXcr5p3BA6xDKqyz5AkZbNASND2wvZHgxJvGtt5IvE9e4X5zU3W38xkAt2LvQaxeM1o622uj2sNM0gzJv+1yjKtYH3lBIsxH9iVJUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCZSdV/U; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCZSdV/U"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8694801b0c7so229138b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789482101; x=1790086901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uksxv0G7oUWTqhVGgX3sJotmgTQPm0ImKIhdPHYitd8=;
        b=lCZSdV/UIQceQU+P+8oCTgr5oAT0dLk11SCRWXWvO3ZtmKw3YSyGN01E/IQYs3fVCZ
         LNYDizIWOmGIZJgd+ToYrtR+C20AE/AVZWGEeFGpmdZQ55oNrE5E3+K8CHeNyCSixwvZ
         R+vSvFq3JGWP96eiZSAXGHOyudc/IrYfyVUGga3Eb2Za0UwlYR+vAUsb/ooyBFiWioln
         91S0aI83w/ueTSYF13ovFkKAUXj4roxp9x9DIZxyVlYEWrX/T2aBgOjG5GKrzSkRdQn+
         vawXAlibQSd+EXaUH9VdGbmIbjsI5wJ1nF2m3TwQZHO8zeHBNlOnx7SZczNwelBlk7PO
         epXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482101; x=1790086901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uksxv0G7oUWTqhVGgX3sJotmgTQPm0ImKIhdPHYitd8=;
        b=GGdqz9GUhuK0PcepibbFfY4VazHrOUtfHFmFhaA1lSNAx9fkQNOQ7wHhU8oWTk1oa9
         ZQxUI2WUNs14sNAvbcdzghplFuVXrJfHnD0yiKYiqltAsnBks72bp/3qa306B5dzWR0h
         QcJz+mwAyd/Hxhd+AD06vs+L2KpT+45wpXz1MGU5FpoNhRDFG1iIOIzvdQfG9OA22ILy
         ixzlxLT0dG2V+4rZTzR6jCucE8cJXOORwzmnMF2Kb6n+i3KS2Ow7snkOKGZ6uAyz9Vgs
         /vXnongwRd+mHwqYbhwDph63QXWEra/o1GB4Z16z9bdnqFS0blDt0Re9cfQOYrVFt8sD
         gLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz32bPkqL+qV6iIqxoHmNZShMdbiwdVh0HMHihGW1YWCjONGyP1duQDg2IybbDDKrrkNL7CitqHnfOrPuI=@vger.kernel.org
X-Gm-Message-State: AFuF++lB0n9wvKQ2Qg3ve4UCB3qdzMaaunRzKtoqmJQ1NnGYLCYokZC/
	6NlIzazfz2Qr0YMhQ0B83xsx2AD5DSzouQTf1Agvitsy6Uv0V7rV5cH2
X-Gm-Gg: AYBFou3dH8xy9wl6bpYTxBHoTGvdfpltYsBHo6zUPGt2jtHpv95DVmy89ZdsvDuREOG
	ZBDFUxZ+5cGF95O/Xa4yQ/AbMkUrkKkhqeQUFwu7EaK+4BEUlXE/fhXvCfM9mBBrA6YCQA4gRt/
	Et4Ho2K5Q8EusxtmMJQoDrj2q+SmBpzNN0eXg14NXNVzp0OL4W/W0EEIu1anV3mwHu0FmwWPocG
	caomcZNfoHxN6afqAKOpPJnh2WyhO+LE8fyuDUh5ckdKwCsoiJQOZesy4d6NqC7ktYAyHao+d8d
	MVjOxvIrUTAhYtEOW8C9feBf73o3zwKd1Vwxcnk7npnggop3wHpirL+9tBubbP39gaVbq9P+qjA
	z4FVFNaUbbZLf7jTdRFzJFonS+wbgd3wpY7FVwX87roYWzebsmegkdZxiQBm053F96tVJdgzakE
	8hr14y0QJ6U49Cg95cE5x9icPFclAIk8r2z18yRxN985HEb6rvjRCcovIV9vaMsxxRJkXEc+wfj
	kILAs6HZBNzKY+XyQ==
X-Received: by 2002:a05:6a20:2451:b0:3d1:1b5f:d802 with SMTP id adf61e73a8af0-3db400036d2mr10729062637.0.1789482101233;
        Tue, 15 Sep 2026 07:21:41 -0700 (PDT)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4f4e5aa58sm3067380a12.8.2026.09.15.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:21:40 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Tue, 15 Sep 2026 23:20:11 +0900
Subject: [PATCH v3] docs: report Sphinx/Docutils pairs that break PDF
 builds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-docs-sphinx-pre-install-docutils-v3-1-95ee86793673@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQQ6DIBAF0KsY1qVh0GjoqvdouiCAOglCw1hiY
 7x70ZXLdvn/TN5fGbmEjtitWllyGQljKKG+VMyMOgyOoy2ZSSFboaDmNhri9BoxLPyVyjnQrL3
 f+/eMnnjXQ6MlCNFoYIUpTz0ux8TjWfKINMf0ORYz7O0feAYO3CpZm65VuldwHyaN/mrixHY8y
 zPY/ADKArZa6tY6Zy2oM7ht2xdMQxQ/IQEAAA==
X-Change-ID: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.3

Sphinx declares the range of Docutils versions it supports, but that range
does not always describe what its LaTeX builder can take: a distribution
may relax the upper bound to ship a newer Docutils, and Sphinx 9.0.x
declares support for Docutils 0.22 by itself.  Either way the pair
installs happily and htmldocs builds without a complaint, so nothing looks
wrong until pdfdocs is run, where four of the books fail:

  ! Dimension too large.
  \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
  l.86321 \end{sphinxVerbatim}

That is arch, core-api and translations; admin-guide runs out of TeX
memory first and stops 13 pages in, and fails on the same boxes once given
more.  Each of the four includes a large literal file whole; the one in
core-api, memory-barriers.txt, is 3016 lines.  Docutils 0.22 is what puts
those blocks into sphinxVerbatim rather than sphinxalltt, and
sphinxVerbatim is framed, so they hit the size limit of
sphinx-doc/sphinx#3099 [1] -- open since 2016 and fixed only in Sphinx
9.1.0.  None of the three is at fault on its own: it takes the Docutils
version, the Sphinx version and blocks this large.

Keeping everything else fixed -- one Debian 13 container, one TeX Live, an
unmodified texmf.cnf, one kernel tree -- and varying only the two Python
packages:

  sphinx   docutils   core-api   admin-guide
  ------------------------------------------
  8.2.3    0.21.2     ok         ok
  8.2.3    0.22.4     FAILS      FAILS
  9.0.4    0.22.4     FAILS      FAILS
  9.1.0    0.22.4     ok         ok

Two distributions ship the failing pair today.  Ubuntu 26.04 LTS has
Sphinx 8.2.3 with Docutils 0.22.4 and no upper bound at all in the
python3-sphinx dependency, and Fedora 44 reaches the same pair from the
other side: it patches the "docutils>=0.20,<0.22" that Sphinx 8.2.3
declares so that it accepts "<0.23".  Both fail identically here.  The
9.0.4 row needs no distribution's help: 9.0.0 through 9.0.4 declare
"docutils>=0.20,<0.23" themselves, so a plain "pip install sphinx==9.0.4"
resolves Docutils to 0.22.4.  Upstream ships this sort of work in a new
minor rather than backporting it [2], so neither 8.2.x nor 9.0.x will grow
the #3099 fix in a point release.

Report it where it is useful: once pdfdocs has actually failed, next to
the error, in the same place LatexFontChecker already explains the CJK
variable font failures.  Ask the interpreter behind sphinx-build for both
versions -- a venv and the system install can differ -- and name the two
ways out.  htmldocs never runs this and stays silent, which matters
because most people who build the documentation never build a PDF.

[1]: https://github.com/sphinx-doc/sphinx/issues/3099
[2]: https://github.com/orgs/sphinx-doc/discussions/14055

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Checked against the pairings in the commit message: the message appears
for the ones whose pdfdocs build fails and for none that build, with the
boundaries at Sphinx 9.1.0 and Docutils 0.22 exercised explicitly, and
with Docutils 0.23 as well.  Built on a Fedora 44 host and in Debian and
Ubuntu 26.04 containers; the Ubuntu and Fedora builds fail identically.
htmldocs prints nothing new and still exits 0, and a venv built from
Documentation/sphinx/requirements.txt resolves to Sphinx 9.1.0 and stays
quiet.  The check adds one subprocess call to a build that has already
failed.

This no longer touches sphinx-pre-install, but it adds an import to
sphinx-build-wrapper right where Chen Miao's series [1] adds one too;
whichever lands first, the other is a trivial rebase.

[1]: https://lore.kernel.org/linux-doc/20260814214419.49925-1-chenmiao.ku@gmail.com/
---
Changes in v3:
- Do the check after pdfdocs has actually failed, rather than on every
  run of sphinx-pre-install.  Warning during htmldocs annoys the many
  people who never build a PDF; suggested by Akira Yokosawa, and Mauro
  Carvalho Chehab agreed it reads better.
- The check now lives in tools/lib/python/kdoc/docutils_version.py and is
  called from sphinx-build-wrapper next to LatexFontChecker, which
  already explains the CJK variable font failures the same way.
  sphinx-pre-install is left untouched.
- Subject changed to match: this no longer belongs to sphinx-pre-install.
- Commit message: Ubuntu 26.04 LTS ships the failing pair too -- Sphinx
  8.2.3 with Docutils 0.22.4 and no upper bound at all in the
  python3-sphinx dependency -- and fails identically to Fedora 44.
  Pointed out by Akira Yokosawa; both are now measured and quoted.
- Link to v2: https://lore.kernel.org/r/20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com

Changes in v2:
- MIN_DOCUTILS_SPHINX is now 9.1.0 rather than 9.0.0.  The limit that
  breaks these builds is sphinx-doc/sphinx#3099, which was fixed in
  9.1.0, so v1 silently skipped the whole 9.0.x series -- which does
  fail.  Caught by Akira Yokosawa.
- Reword the warning: Sphinx 9.0.x does declare support for Docutils
  0.22, so saying it "does not support" it was wrong.  It now says what
  actually breaks, scopes the claim to this documentation's literal
  blocks rather than stating a general rule, names both ways out, and
  follows the "Warning:" wording and layout the rest of the script uses.
  The docstring now covers both routes into the pairing, not just the
  distribution one.
- Commit message: give the mechanism -- Docutils 0.22 routes large
  literal includes into sphinxVerbatim, which is framed and so subject
  to the #3099 size limit -- rather than attributing the failure to a
  single package, per Mauro Carvalho Chehab's review.
- Commit message: extend the matrix with Sphinx 9.0.0, 9.0.4 and
  Docutils 0.23, and state the fixed LaTeX configuration all rows were
  measured under, since the 9.0.x rows show the pairing arises from
  upstream metadata with no distribution involved.
- Link to v1: https://lore.kernel.org/r/20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com
---
 tools/docs/sphinx-build-wrapper           |  19 ++--
 tools/lib/python/kdoc/docutils_version.py | 143 ++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 6 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 6f1163333a47..8b8cd61c832f 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -64,6 +64,7 @@ sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
 from kdoc.python_version import PythonVersion
 from kdoc.latex_fonts import LatexFontChecker
+from kdoc.docutils_version import DocutilsVersionChecker
 from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
 
 #
@@ -466,6 +467,8 @@ class SphinxBuilder:
         max_len = 0
         tex_suffix = ".tex"
         tex_files = []
+        sphinx_build_path = shutil.which(self.sphinxbuild,
+                                         path=self.env["PATH"])
 
         #
         # Since early 2024, Fedora and openSUSE tumbleweed have started
@@ -554,9 +557,11 @@ class SphinxBuilder:
 
             print()
             if build_failed:
-                msg = LatexFontChecker().check()
-                if msg:
-                    print(msg)
+                for checker in (DocutilsVersionChecker(sphinx_build_path),
+                                LatexFontChecker()):
+                    msg = checker.check()
+                    if msg:
+                        print(msg)
 
                 sys.exit("Error: not all PDF files were created.")
 
@@ -564,9 +569,11 @@ class SphinxBuilder:
             n_failures = len(builds)
             failures = ", ".join(builds.keys())
 
-            msg = LatexFontChecker().check()
-            if msg:
-                print(msg)
+            for checker in (DocutilsVersionChecker(sphinx_build_path),
+                            LatexFontChecker()):
+                msg = checker.check()
+                if msg:
+                    print(msg)
 
             sys.exit(f"Error: Can't build {n_failures} PDF file(s): {failures}")
 
diff --git a/tools/lib/python/kdoc/docutils_version.py b/tools/lib/python/kdoc/docutils_version.py
new file mode 100644
index 000000000000..75890ae22658
--- /dev/null
+++ b/tools/lib/python/kdoc/docutils_version.py
@@ -0,0 +1,143 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (c) Masaharu Noguchi, 2026
+
+"""
+Detect Sphinx and Docutils pairs that break PDF builds
+======================================================
+
+Sphinx declares the range of Docutils versions it supports, but that range
+does not always describe what its LaTeX builder can take.  A distribution
+may relax the upper bound in order to ship a newer Docutils, and Sphinx
+9.0.x declares support for Docutils 0.22 by itself.  Either way the pair
+installs happily and ``make htmldocs`` builds without a complaint, so
+nothing looks wrong until ``make pdfdocs`` is run, where several books fail
+with::
+
+    ! Dimension too large.
+    \\fb@put@frame ...p \\ifdim \\dimen@ >\\ht \\@tempboxa
+
+It takes Docutils, Sphinx and this documentation's largest literal blocks
+together.  Docutils 0.22 renders a literal include into ``sphinxVerbatim``
+rather than ``sphinxalltt``; ``sphinxVerbatim`` is framed, so it goes
+through framed.sty and meets the size limit of sphinx-doc/sphinx#3099 [1]_,
+which was fixed only in Sphinx 9.1.0.  memory-barriers.txt alone is over
+3000 lines, well past what that path accepts.
+
+admin-guide runs out of TeX main memory before it reaches those boxes and
+reports that instead; given more memory it fails on them too.
+
+Distributions reach the pair from either side.  Fedora 44 ships Sphinx
+8.2.3 -- which declares ``docutils>=0.20,<0.22`` -- patched to accept
+``<0.23`` alongside Docutils 0.22.4, and Ubuntu 26.04 LTS ships the same
+two versions.  Upstream releases this sort of work in a new minor rather
+than backporting it [2]_, so neither 8.2.x nor 9.0.x will grow the fix in a
+point release.
+
+.. [1] https://github.com/sphinx-doc/sphinx/issues/3099
+.. [2] https://github.com/orgs/sphinx-doc/discussions/14055
+"""
+
+import re
+import subprocess
+import sys
+import textwrap
+
+from kdoc.python_version import PythonVersion
+
+# Sphinx releases before this one carry the sphinx-doc/sphinx#3099 size
+# limit; Docutils from this one on routes the blocks into the framed
+# environment that hits it.
+MIN_SPHINX = PythonVersion("9.1.0").version
+DOCUTILS_BREAKS_AT = PythonVersion("0.22").version
+
+
+class DocutilsVersionChecker:
+    """
+    Detect a Sphinx and Docutils pair whose LaTeX output cannot be built.
+    """
+
+    def __init__(self, sphinx_build=None):
+        self.sphinx_build = sphinx_build
+
+    def get_versions(self):
+        """
+        Get the Sphinx and Docutils versions a sphinx-build command uses.
+
+        Both are Python modules rather than programs, so they have to be
+        asked of the very interpreter that runs sphinx-build: a venv and the
+        system install can hold different versions. Take it from the
+        script's shebang, falling back to the interpreter running this.
+        """
+        python = sys.executable
+
+        if self.sphinx_build:
+            try:
+                with open(self.sphinx_build, "r", encoding="utf-8") as f:
+                    match = re.match(r"^#!\s*(\S+)", f.readline())
+                    if match:
+                        python = match.group(1)
+            except (OSError, UnicodeDecodeError):
+                pass
+
+        script = "import sphinx, docutils; " \
+                 "print(sphinx.__version__); print(docutils.__version__)"
+
+        try:
+            result = subprocess.run([python, "-c", script],
+                                    stdout=subprocess.PIPE,
+                                    stderr=subprocess.PIPE,
+                                    text=True, check=True)
+        except (OSError, subprocess.CalledProcessError):
+            return None, None
+
+        versions = []
+        for line in result.stdout.splitlines()[:2]:
+            match = re.match(r"^\s*([0-9]+(?:\.[0-9]+)*)", line)
+            if not match:
+                return None, None
+            versions.append(PythonVersion.parse_version(match.group(1)))
+
+        if len(versions) != 2:
+            return None, None
+
+        return versions[0], versions[1]
+
+    def check(self):
+        """
+        Check for a Sphinx and Docutils pair that breaks PDF builds.
+        """
+
+        sphinx_ver, docutils_ver = self.get_versions()
+
+        if not sphinx_ver or sphinx_ver >= MIN_SPHINX:
+            return None
+
+        if not docutils_ver or docutils_ver < DOCUTILS_BREAKS_AT:
+            return None
+
+        sphinx_str = PythonVersion.ver_str(sphinx_ver)
+        docutils_str = PythonVersion.ver_str(docutils_ver)
+        min_str = PythonVersion.ver_str(MIN_SPHINX)
+        breaks_str = PythonVersion.ver_str(DOCUTILS_BREAKS_AT)
+
+        head = (f"Sphinx {sphinx_str} with Docutils {docutils_str} cannot "
+                f"build the largest literal blocks in this documentation.")
+
+        body = (f"Docutils {breaks_str} and later render them into a framed "
+                f"LaTeX environment, and Sphinx below {min_str} limits how "
+                f"large that environment may get.")
+
+        ways_out = (f"Either upgrade Sphinx to {min_str} or later, or use a "
+                    f"Docutils below {breaks_str}.  A virtual environment "
+                    f"built from Documentation/sphinx/requirements.txt gives "
+                    f"a working pair.")
+
+        msg = "=" * 77 + "\n"
+        msg += textwrap.fill(head, width=77) + "\n\n"
+        msg += textwrap.fill(body, width=77) + "\n\n"
+        msg += textwrap.fill(ways_out, width=77) + "\n\n"
+        msg += "HTML builds are unaffected.\n"
+        msg += "=" * 77
+
+        return msg

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260913-docs-sphinx-pre-install-docutils-7f14a21004a1

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

