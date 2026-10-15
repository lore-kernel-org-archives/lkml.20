Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F94E1C67;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054666; cv=none; b=Oic+e3BRcPaeSTzX8bqQ9sk75J/ei29r7oALIeSUmRPP0l0ORT6qtSULEzq2UECuJSFcd5TLwAnBE55Ic5fWm8ggyUUWoXG9VTUIgg9uDZM7YcwOjsV6SsrLWaz9XJNgUzg26QqsSDOIrUFk80i6ZUy+XDD3hoCtPCAwX2jzaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054666; c=relaxed/simple;
	bh=udyyd3dQdxeod5m2t8DdBAnDk5/RwP9vf/ZMiiTSNg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=euDPk2Z1JSs3yRK5UH2uqbsP8OIezMPi/t5rlgLEt418tzijMEquBGPfmz2jM8WEYGDhId4m7fTLq6mAZ2H+UcTOXB5V8qXgsASXoBcWLl0IgPgAtcC3QB2/evyGp+0mTS/58It1mXs1Z7k2WIWjtDAWrWt5+JgxGTmZnPgBPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4LCJAtg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4LCJAtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC181F000C7;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054653;
	bh=4KFyePyuep2GlaTPeORCG5nD0zpj6EWkzFQfEhk1QHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P4LCJAtgg4EKIwkI53FJksrfhdhkBB9M9jJ8S+QFoypLzT+l2bJkYmQw1NW0OHqis
	 SZav/tz8t/DF9Aie9Y8OmtvoGJjwuxgF1pq3TOBEdHH165+JiBzA8jJFI7P659k2ZM
	 Bo5RofqDKNP6ZoLg6H+oxzIEspje4eWuFyhw+isg0CQ2CwMErwDZo9ZJSPt44UFACw
	 9Ew26zXZ5l3Lj+hGzKSVMycAAqeeQVHMIGSfGcnymbRyqo/1DcmJf87nFB7v2rnrN4
	 aQXetWA2j4SQyfkYZwyvCrS55bizbA0DwnnXSy2njaOgQYuLcdh5105iWDOCXSex0j
	 v8KTR3gTAr1DA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xHHHH-00000000Miw-0tJF;
	Thu, 15 Oct 2026 10:57:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 3/4] docs: test_doc_build: address pylint warnings
Date: Thu, 15 Oct 2026 10:57:20 +0200
Message-ID: <1a790b550a158bb3b00e5471ba7351eac5185ece.1792053090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792053090.git.mchehab+huawei@kernel.org>
References: <cover.1792053090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Address existing pylint issues.

While here, adjust some line breaks using black suggestions.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/test_doc_build.py | 43 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/tools/docs/test_doc_build.py b/tools/docs/test_doc_build.py
index 8b57d896c666..9db77ba9b6e2 100755
--- a/tools/docs/test_doc_build.py
+++ b/tools/docs/test_doc_build.py
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 #
-# pylint: disable=R0903,R0912,R0913,R0914,R0917,C0301
+# pylint: disable=R0903,R0912,R0913,R0914,R0915,R0917,C0301
 
 """
 Install minimal supported requirements for different Sphinx versions
@@ -18,6 +18,8 @@ import sys
 import time
 import subprocess
 
+from textwrap import indent
+
 MIN_PYTHON_SUBVER = 9  # Currently, Python 3.9 is the minimal supported version
 
 RE_VERSION = re.compile(r"python3\.\d+$")
@@ -45,6 +47,7 @@ def get_min_python_bin(min_subver):
 
     return sorted(bins, key=lambda x: (3, int(x.split(".")[1])))[0]
 
+
 # Minimal python versions. Please notice that for 3.4.3, older python
 # versions would work with Sphinx, but kernel doc build is not compatible
 # with them anymore, due to Sphinx extensions and kernel-doc.
@@ -56,16 +59,16 @@ PYTHON_VER_CHANGES = {
 }
 
 DEFAULT_VERSIONS_TO_TEST = [
-    (3, 4, 3),   # Minimal supported version
-    (5, 3, 0),   # CentOS Stream 9 / AlmaLinux 9
-    (6, 1, 1),   # Debian 12
-    (7, 2, 1),   # openSUSE Leap 15.6
-    (7, 2, 6),   # Ubuntu 24.04 LTS
-    (7, 4, 7),   # Ubuntu 24.10
-    (7, 3, 0),   # openSUSE Tumbleweed
-    (8, 1, 3),   # Debian 13
-    (8, 2, 3),   # Ubuntu 26.04 LTS / Fedora 44
-    (9, 1, 0),   # Latest version
+    (3, 4, 3),  # Minimal supported version
+    (5, 3, 0),  # CentOS Stream 9 / AlmaLinux 9
+    (6, 1, 1),  # Debian 12
+    (7, 2, 1),  # openSUSE Leap 15.6
+    (7, 2, 6),  # Ubuntu 24.04 LTS
+    (7, 4, 7),  # Ubuntu 24.10
+    (7, 3, 0),  # openSUSE Tumbleweed
+    (8, 1, 3),  # Debian 13
+    (8, 2, 3),  # Ubuntu 26.04 LTS / Fedora 44
+    (9, 1, 0),  # Latest version
 ]
 
 # Sphinx versions to be installed and their incremental requirements
@@ -76,7 +79,6 @@ SPHINX_REQUIREMENTS = {
         "alabaster": "0.7.12",
         "babel": "2.8.0",
         "certifi": "2020.6.20",
-        "docutils": "0.16",
         "idna": "2.10",
         "imagesize": "1.2.0",
         "Jinja2": "2.11.2",
@@ -199,6 +201,7 @@ class AsyncCommands:
         self.fp = fp
 
     def log(self, out, verbose=True, is_info=True):
+        """Ancillary routine to output a message"""
         out = out.removesuffix('\n')
 
         if verbose:
@@ -227,7 +230,6 @@ class AsyncCommands:
 
     async def run(self, cmd, capture_output=False, check=False,
                   env=None, verbose=True):
-
         """
         Execute an arbitrary command, handling errors.
 
@@ -326,8 +328,8 @@ class SphinxVenv:
 
         # Pip install succeeded. Write requirements file
         if args.req_file:
-            with open(req_file, "w", encoding="utf-8") as fp:
-                fp.write(result.stdout)
+            with open(req_file, "w", encoding="utf-8") as fout:
+                fout.write(result.stdout)
 
         if args.build:
             start_time = time.time()
@@ -379,7 +381,7 @@ class SphinxVenv:
         """
 
         if args.log:
-            fp = open(args.log, "w", encoding="utf-8")
+            fp = open(args.log, "w", encoding="utf-8") # pylint: disable=R1732
             if not args.verbose:
                 args.verbose = False
         else:
@@ -440,15 +442,15 @@ class SphinxVenv:
         if fp:
             fp.close()
 
+
 def parse_version(ver_str):
     """Convert a version string into a tuple."""
 
     return tuple(map(int, ver_str.split(".")))
 
 
-DEFAULT_VERS = "    - "
-DEFAULT_VERS += "\n    - ".join(map(lambda v: f"{v[0]}.{v[1]}.{v[2]}",
-                                    DEFAULT_VERSIONS_TO_TEST))
+DEFAULT_VERS = indent("\n".join(map(lambda v: f"{v[0]}.{v[1]}.{v[2]}",
+                                    DEFAULT_VERSIONS_TO_TEST)), "    - ")
 
 SCRIPT = os.path.relpath(__file__)
 
@@ -493,6 +495,7 @@ MAKE_TARGETS = [
     "xmldocs",
 ]
 
+
 async def main():
     """Main program"""
 
@@ -540,8 +543,6 @@ async def main():
     if not args.make_args:
         args.make_args = []
 
-    sphinx_versions = sorted(list(SPHINX_REQUIREMENTS.keys()))
-
     if args.full:
         args.versions += list(SPHINX_REQUIREMENTS.keys())
 
-- 
2.56.0

