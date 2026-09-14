Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B543B6C7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382211; cv=none; b=s2KQTzU/1P12OobnVdazAE2YrEGsAwIWq5jpFTkijYvnxgV/sdBKH7bbbYfbG/eIHZJRFRZ6Hwi4xPZrOQ+6GGbR/lN8+bl5FyD4YKyH59DXZclfcb0rKgs9UC7g3oXoWY91h/VO+43xmjLjeKBQcF7AYeJpuwQaA69b1wHsxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382211; c=relaxed/simple;
	bh=/Zaep6VvusTUO3xZNHx9LzK2p6WIQmumNosESfS8V7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M8b/O9YDhJqUiFoAph+vQbtNXNriHftHqps94Ec90wf2iZcjXvHrstjXE9mnE8oMDscwGqeAZEtiVGYuaXfZCRWhUAOD1BGZBRQwOHw09SPPyKM6exIQRf7RRDD6oHKtUKKmj3KPAkC+lUyRFvL/GVPDEzuzzlUfBS++fisiUbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbIAk1hb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbIAk1hb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c50so2239555ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382209; x=1789987009; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kVGXU10Gne+OrVKYEfORe7gfF0Z0oKeBdAYOBnXboT8=;
        b=dbIAk1hbSVuDVxN9vYKmiiTZ7fri6yGPjCjeP/3HkXxgJnAph7MLjxVRuvrR84es2k
         ivHwX7LAQjiJGFsDmrK5otZdDnElvi2dsgwebImkqJj+2RkxC+LAVfnR7+fLPJIMMq3N
         6zbBFDSNatYyyVMUSrPQgOX33hayEl3s0EMZTq0ooPCZ6vu62a9l1WRDBh1OC//maTKu
         CTAOU8mCbB4xR3PRQnen1b6Fq9OTy5AZxcTiEve/a8p4fgHEKWA3ycvjgAqImLOg+0tG
         N2WJRsxas6po+4Yvy0gcBft950CZAjO0LZtBabvbAfZxQ4i2JlzGJENyQ3qe999qS/t6
         hVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382209; x=1789987009;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kVGXU10Gne+OrVKYEfORe7gfF0Z0oKeBdAYOBnXboT8=;
        b=BJ2YHWiowlGVDuvUESc36/JCfRK4Wpp3pMutW38rp92sGtS6jdp0dS97OiUZt87WPM
         4KWg1C+4E+3smPTc5H35MQkezOXJZlE5VEPMbbV8babGvUdDQ3315sG4PVyvsgFwJcC9
         6pD5eS0H1iUxm2CXL4MMXx/7kfOjto5ZvB9FB2GvFjo/OgtSRFi39kwN4NPQ5PyCa8UU
         VT0Gu1GhJtSa737psmz0N2e5zUgJhCklZimuZHzvPDlTJ76EfhZb4n5rmfIHbynz3Cb1
         ko9fmt65zcQhKFOPSItmxy+DIDwYwU4YU6IsOr2/j0nR0EdesBihCgvWpIaniYWjsRv9
         BnGA==
X-Forwarded-Encrypted: i=1; AKwUvBzrfLWgatKQblz42gi+3OEEHViu7VlnSGzNVNVQr7JS7Hw+sfem68EpaynawZeEXpCv8Sj+MMLcQW5tmCE=@vger.kernel.org
X-Gm-Message-State: AFuF++kdOMK72S9LkgYfre9DIjRkfLgsmmglCCCCtN2Pa1n2CjG85zJs
	NHss1Ml/lYlisgXt/PJyXUFkfjzmm50yHkSwUveHS1KvTPiLuYJUYGqdl3UmWJKB
X-Gm-Gg: AYBFou3mjgXCkGPjy3zvHa1kbzh/9jUHICmQjxNFJCLEeQUJ495y6AhVCeoIc1aDfU9
	KC4+A5cP4gkrAOuYeYdenaXx0kA9Og+0ZQ6goOcKGEMlPNj+ILGTLtte1xpeAXhZfUO855SWVOT
	fvxq0fDl9MGu0zhvyf1l1epfxuOLMCYPnGeq3T0/MtVoA1bkh1BQigPmRA5TAetW47Rk/K+won5
	H46rs/g04jBsQnWZAYwPXo3+LV5JFI8ja2ERV0PRJpV/usinHpvmbicKwNFKE4pcQx5V4YnXYXH
	ROyMRFZrKCbsTbEz/Qr4OqltjpEG0ELHXXhYBlBtBy2asmNGp0idnBluaBEcBMf5ar7hIy3x/ST
	CefAMsUDOmADgPcDyq/zk5PRH2mKG3tnF5xOiMgpxFoa92b+pcMV8Lk2wKmtp/xy+cY2WC11CtH
	mPZKWrHqz8Dd4f6E7Lg0Qemmzbe3lCPJi92ugoEjZ9RUZc8ZJEYuQ2UZr4bA//f1s14h/SJig1x
	pGA9No=
X-Received: by 2002:a17:903:240c:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2dd6c47a605mr27755505ad.0.1789382208586;
        Mon, 14 Sep 2026 03:36:48 -0700 (PDT)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f8ebbdfsm5428765ad.38.2026.09.14.03.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:36:48 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Mon, 14 Sep 2026 19:35:40 +0900
Subject: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQqDMBBFryKzbkomipKueg9xEWLUgZhIxopFv
 HujN+jyvf/5/wB2iRzDqzgguY2YYsigHgXYyYTRCeozg5KqlhpL0UfLgpeJwi6WlOPAq/H+8p+
 VPItmwMoolLIyCHkmlwba74u2yzwRrzF978cNL/vH+IYCRa9VaZtam0Hje5wN+aeNM3Tnef4AM
 vt1HtAAAAA=
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
declares support for a Docutils its LaTeX builder cannot cope with. Either
way the pair installs happily and htmldocs builds without a complaint, so
nothing looks wrong until pdfdocs is run, where four of the books fail:

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

The 9.0.4 row needs no help from a distribution: 9.0.0 through 9.0.4
declare "docutils>=0.20,<0.23" themselves, so a plain "pip install
sphinx==9.0.4" resolves Docutils to 0.22.4.  Fedora 44 reaches the same
state from the other direction, shipping Sphinx 8.2.3 -- which declares
"docutils>=0.20,<0.22" -- patched to accept "<0.23".  Upstream ships this
sort of work in a new minor rather than backporting it -- the Docutils
0.22 support went out as 9.0.0 after a backport to 8.2.x was asked for and
declined [2] -- so neither 8.2.x nor 9.0.x will grow the #3099 fix in a
point release.

Check for it, since sphinx-pre-install exists precisely to catch a
documentation build environment that will not work.  Ask the interpreter
behind sphinx-build for its Docutils version -- a venv and the system
install can differ -- and warn when Sphinx is older than 9.1.0 while
Docutils is 0.22 or newer, naming both ways out -- a newer Sphinx or an
older Docutils.  Only warn: the build is left to proceed, and htmldocs is
unaffected.  The bound Sphinx declares is no use here: it is either what
the distribution changed, or, for 9.0.x, wider than what the LaTeX builder
delivers.

[1]: https://github.com/sphinx-doc/sphinx/issues/3099
[2]: https://github.com/orgs/sphinx-doc/discussions/14055

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Verified on Debian 13 against the Sphinx/Docutils pairings listed in the
commit message: the warning fires for the ones whose pdfdocs build fails
and stays quiet for the ones that build, with the boundaries at Sphinx
9.1.0 and Docutils 0.21.2 checked explicitly.  Also checked on the
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
 tools/docs/sphinx-pre-install | 79 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093a41..fc024556f38c 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -41,6 +41,17 @@ from kdoc.python_version import PythonVersion
 RECOMMENDED_VERSION = PythonVersion("3.4.3").version
 MIN_PYTHON_VERSION = PythonVersion("3.7").version
 
+# Docutils 0.22 renders large literal blocks into sphinxVerbatim rather than
+# sphinxalltt, which puts them through framed.sty.  Sphinx's size limit on
+# that path is sphinx-doc/sphinx#3099, fixed only in the 9.1.0 release:
+#     https://github.com/sphinx-doc/sphinx/issues/3099
+# Upstream ships this sort of work in a new minor rather than backporting it:
+# the Docutils 0.22 support went out as 9.0.0 after a backport to 8.2.x was
+# asked for and declined:
+#     https://github.com/orgs/sphinx-doc/discussions/14055
+MIN_DOCUTILS_SPHINX = PythonVersion("9.1.0").version
+DOCUTILS_BREAKS_AT = PythonVersion("0.22").version
+
 
 class DepManager:
     """
@@ -490,10 +501,78 @@ class MissingCheckers(AncillaryMethods):
             self.need_sphinx = 1
             return
 
+        # Check this before the version_check exit below: htmldocs invokes
+        # this script in that mode, and the warning has to reach it.
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
+        Warn when Sphinx is paired with a Docutils its LaTeX builder
+        cannot take at the sizes this documentation uses.
+
+        The pair arrives either way round: a distribution may relax the
+        upper bound Sphinx declares in order to ship a newer Docutils, and
+        Sphinx 9.0.x declares support for Docutils 0.22 itself while still
+        carrying the size limit that breaks these builds. Both still build
+        HTML, so nothing looks wrong until pdfdocs is run.
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
+        breakver = PythonVersion.ver_str(DOCUTILS_BREAKS_AT)
+
+        print(f"Warning: Sphinx {curver} with Docutils {docver} produces\n" \
+              "   broken LaTeX for the large literal blocks in this\n" \
+              "   documentation: pdfdocs will fail. Building them needs\n" \
+              f"   Sphinx {minver} or later, or Docutils below {breakver}.\n" \
+              "   HTML builds are unaffected.")
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

