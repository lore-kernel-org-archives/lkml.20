Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5C479869;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054660; cv=none; b=aAXzEvZnLrPihmZBU3AGc5BoXYr0o1PpKMcQo8+oqxPpVJe+3Z0+gq0NBI0ZGhHrAlbqBkfKgek5RYdMz5WvSeapl7I68Buh3CpggbcAVh0wmeJEvPCWhUt84eapRer15ukhb+Ftkc3Lxso6g2RSai9n5UXHs/ikjGXK9OM/Wng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054660; c=relaxed/simple;
	bh=5+cEQ/PF+ta6IgoIBYQpBk8oGsZM/5n1gnXXe7Rrwtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdRjn/wFn42UpfYgRVL24lSFwwB3w02waiBMkDORI/qNyDbcWzaQFrs+xLugW4WCsxmGTAds6Fhb2TvO6sAOD0FOaJVA7k/SBdp4C41NBPN9TuHsbMv6tHuogMaOuiYepuOb0eLeYI0nm5qDNadoadBIfJdOk4IC4vyvxFuX79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKcP5azB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKcP5azB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E0D1F000C8;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054653;
	bh=18dFr36xUFH5UiJnAqmaLxGXaMtXyYfjClSscW+YwNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MKcP5azBNn0rrJOXalCs+T+mnG/4Wh2zHNtWY2GapSgCPiba6bzKZkk/OP3bTpxyI
	 PGdgfFZ2hf0WKRLVHJVXUmO65UO6qC2ifcSe80wkGR93Uj7haj9rH+gsiBAF8gL62E
	 cXRwesUmMKvdvmI8X8nuo9/GrqL+pNw0rS4Tn6W/HQFhfRFkVWlhHQWyE/BEYq/4+8
	 Gs+qC6mjeeNjXrqviYHzpiYL+BVw8ec3+NBick+03TGkapOMJjMU42XduBh2fp3wEZ
	 We/64z64fhKyJrXgpeWqZvInKGoTuWf9uV4SpLUPjDut+6tFHON1CvELC3Gem91wUA
	 x2rD9rEXZeiRA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xHHHH-00000000Mio-0fsq;
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
Subject: [PATCH 1/4] docs: test_doc_build: better handle python version
Date: Thu, 15 Oct 2026 10:57:18 +0200
Message-ID: <871255ee391ceae0d24ed18f31c1e91589d139c7.1792053090.git.mchehab+huawei@kernel.org>
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

Make the python version logic more generic to allow adding more
python degradation changes on more recent Sphinx tools.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/test_doc_build.py | 70 ++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/tools/docs/test_doc_build.py b/tools/docs/test_doc_build.py
index 47b4606569f9..4082317d581d 100755
--- a/tools/docs/test_doc_build.py
+++ b/tools/docs/test_doc_build.py
@@ -11,29 +11,47 @@ and optionally test the build.
 
 import argparse
 import asyncio
+import glob
 import os.path
-import shutil
+import re
 import sys
 import time
 import subprocess
 
-# Minimal python version supported by the building system.
+MIN_PYTHON_SUBVER = 9  # Currently, Python 3.9 is the minimal supported version
 
-PYTHON = os.path.basename(sys.executable)
+RE_VERSION = re.compile(r"python3\.\d+$")
 
-min_python_bin = None
 
-for i in range(9, 13):
-    p = f"python3.{i}"
-    if shutil.which(p):
-        min_python_bin = p
-        break
+def get_min_python_bin(min_subver):
+    """Get minimal python binary since 3.MIN_PYTHON_SUBVER"""
+    bins = set()
 
-if not min_python_bin:
-    min_python_bin = PYTHON
+    paths = os.environ.get("PATH", "").split(os.pathsep)
+    for d in paths:
+        for p in glob.glob(os.path.join(d, "python3.[0-9]*")):
+            if not RE_VERSION.search(p):
+                continue
 
-# Starting from 8.0, Python 3.9 is not supported anymore.
-PYTHON_VER_CHANGES = {(8, 0, 0): PYTHON}
+            ver = int(p.split(".")[1])
+            if ver < min_subver:
+                continue
+
+            if os.path.isfile(p) and os.access(p, os.X_OK):
+                bins.add(p)
+
+    if not bins:
+        return None
+
+    return sorted(bins, key=lambda x: (3, int(x.split(".")[1])))[0]
+
+# Minimal python versions. Please notice that for 3.4.3, older python
+# versions would work with Sphinx, but kernel doc build is not compatible
+# with them anymore, due to Sphinx extensions and kernel-doc.
+PYTHON_VER_CHANGES = {
+    (3, 4, 3): (3, MIN_PYTHON_SUBVER),
+    (8, 0, 0): (3, 10),
+}
 
 DEFAULT_VERSIONS_TO_TEST = [
     (3, 4, 3),   # Minimal supported version
@@ -173,7 +191,7 @@ class AsyncCommands:
         self.output = None
         self.fp = fp
 
-    def log(self, out, verbose, is_info=True):
+    def log(self, out, verbose=True, is_info=True):
         out = out.removesuffix('\n')
 
         if verbose:
@@ -362,8 +380,19 @@ class SphinxVenv:
             if not args.verbose:
                 args.verbose = True
 
+        cmd = AsyncCommands(fp)
+
         cur_requirements = {}
-        python_bin = min_python_bin
+        python_bin = get_min_python_bin(MIN_PYTHON_SUBVER)
+        if not python_bin:
+            python_bin = os.path.basename(sys.executable)
+            python_ver = tuple(sys.version_info[:2])
+
+            if python_ver < (3, MIN_PYTHON_SUBVER):
+                sys.exit(f"Python {python_ver[0]}.{python_ver[1]} is too old.")
+        else:
+            ver = int(python_bin.split(".")[1])
+            python_ver = tuple([3, ver])
 
         vers = set(SPHINX_REQUIREMENTS.keys()) | set(args.versions)
 
@@ -372,8 +401,14 @@ class SphinxVenv:
                 new_reqs = SPHINX_REQUIREMENTS[cur_ver]
                 cur_requirements.update(new_reqs)
 
-            if cur_ver in PYTHON_VER_CHANGES:          # pylint: disable=R1715
-                python_bin = PYTHON_VER_CHANGES[cur_ver]
+            if cur_ver in PYTHON_VER_CHANGES:
+                new_ver = PYTHON_VER_CHANGES[cur_ver]
+                if python_ver < new_ver:
+                    python_bin = get_min_python_bin(new_ver[1])
+
+                    if not python_bin:
+                        cmd.log(f"Can't check {cur_ver}: {python_bin} not found.")
+                        break
 
             if cur_ver not in args.versions:
                 continue
@@ -390,7 +425,6 @@ class SphinxVenv:
                                        python_bin)
 
         if args.build:
-            cmd = AsyncCommands(fp)
             cmd.log("\nSummary:", verbose=True)
             for ver, elapsed_time in sorted(self.built_time.items()):
                 cmd.log(f"\tSphinx {ver} elapsed time: {elapsed_time}",
-- 
2.56.0

