Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375709;
	b=F02Qemebpek86jqyLQNCNDpn4cqxYxID9W/axgL0JSnYWRS/DMB5wuSa5aXKxkFo8One
	 5NYZyvMhDwpuRaTaXvVxlaXE7SeIXiSd8H0UsVJ86M/QXs12KjfBxquaJkmkvm3aE5Ctq
	 vCBZYUOYTUXgRTkRIU4G+o1DtGQIJbDRp3NuCdNjLNG3ypIlAU935K3/CTKqvcxpTUB/n
	 CGV/5JVwHCFfdKRwiwZxwf7QLM1jv3iTG1+EzhrTxdDgmO1LNGfm0fay+hfEMRjGdd2Px
	 FEaYvblZRej9VxL43zv+hIp9QMmeurUwhijf3bHxKT4a4dRpTWGcL9V6kx0VRP1Vx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375709;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zB1JE1F5/NPbdZ8uf2VeAtXBtcoQPRdvvjEbfdw1aYg=;
	b=y7fQo36b/hvTK4nWbYvCZb2JQRio8LAcvXkQinqUC34+CJLzu85sNwf451tCTbxU+sF5
	 0OA8cdfH3JBHwfXbMhy2dskYa+NBGugopKWBwc2YJQ0Rh/wBLAd2elEHLMcM1ZAKb16yN
	 HdZ+vn5cAVAf+i4kncNzzEs+3Mk4qXfuCaWsZopPmBTUVEJt5MPVhluR+R7aaPtD7nZ2J
	 7JyWjc46u9whM+5KLp9wx+O6drB0ZFxtpFJCCS5w520heT6tFPc2NsDU/Vj1rcMIsp+jv
	 ZhvnjRH8XpoUge0vZ6fkD7I/kVz5LjHACbGy7b/z9BDRldKu/2d6eqx+PLdcx/LNCTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5668606A31F;
	Fri, 30 Oct 2026 15:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5668606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_XbTveRqO+pmAA--.5494S2;
	Fri, 30 Oct 2026 23:54:59 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnrzvNveRqGMoMAA--.22894S4;
	Fri, 30 Oct 2026 23:54:56 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2 2/2] docs: Correct comments in Sphinx dependency checker
Date: Fri, 30 Oct 2026 23:54:52 +0800
Message-ID: <5d3ab0955918e70da23a93660152fc04dd6b6913.1793375024.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1793375024.git.dzm91@hust.edu.cn>
References: <cover.1793375024.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDW_XbTveRqO+pmAA--.5494S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1fuFy7Kw15Wr4DXr1xAFb_yoWxWw15pF
	Z3Kw1j93WkGFy8Arsxuw1Ivr4rGrZ7CFW5J3ZxGr1vyw1aqF18tryagFWY9a47Aw40y3W0
	vw42grsrG3yDAw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUvYsjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Correct typos and awkward phrasing in the module, class, and method
docstrings and in source comments. Leave runtime behavior and user-visible
output unchanged.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/docs/sphinx-pre-install | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index d1af82e1466d..877a35c71563 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -10,14 +10,15 @@
 # incompatible python versions.
 
 """
-Dependency checker for Sphinx documentation Kernel build.
+Check Sphinx installation and Linux kernel documentation build dependencies.
 
-This module provides tools to check for all required dependencies needed to
-build documentation using Sphinx, including system packages, Python modules
-and LaTeX packages for PDF generation.
+This module checks whether Sphinx is available and verifies dependencies
+needed to build Linux kernel documentation, including system packages,
+Python modules, and LaTeX packages for PDF generation.
 
-It detect packages for a subset of Linux distributions used by Kernel
-maintainers, showing hints and missing dependencies.
+It reports missing dependencies and provides distribution-specific
+installation hints for a subset of Linux distributions used by kernel
+maintainers.
 
 The main class SphinxDependencyChecker handles the dependency checking logic
 and provides recommendations for installing missing packages. It supports both
@@ -51,8 +52,8 @@ class DepManager:
     - PDF: dependencies needed by PDF builds.
 
     Each dependency can be mandatory or optional. Not installing an optional
-    dependency won't break the build, but will cause degradation at the
-    docs output.
+    dependency won't break the build, but will degrade the generated
+    documentation.
     """
 
     # Internal types of dependencies. Don't use them outside DepManager class.
@@ -148,7 +149,7 @@ class DepManager:
         """
         Clear dependencies without changing needed/optional.
 
-        This is an ackward way to have a separate section to recommend
+        This is an awkward way to have a separate section to recommend
         a package after system main dependencies.
 
         TODO: rework the logic to prevent needing it.
@@ -162,8 +163,8 @@ class DepManager:
         Update self.missing_pkg, using progs dict to convert from the
         agnostic package name to distro-specific one.
 
-        Returns an string with the packages to be installed, sorted and
-        with eventual duplicates removed.
+        Returns a string with the packages to be installed, sorted and
+        with duplicates removed.
         """
 
         self.missing_pkg = {}
@@ -232,7 +233,7 @@ class AncillaryMethods:
     @staticmethod
     def run(*args, **kwargs):
         """
-        Excecute a command, hiding its output by default.
+        Execute a command, hiding its output by default.
         Preserve compatibility with older Python versions.
         """
 
@@ -288,7 +289,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_missing_file(self, files, package, dtype):
         """
-        Does the file exists? If not, add it to missing dependencies.
+        Check whether any listed file exists; otherwise, record the missing package.
         """
         for f in files:
             if os.path.exists(f):
@@ -297,8 +298,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_program(self, prog, dtype):
         """
-        Does the program exists and it is at the PATH?
-        If not, add it to missing dependencies.
+        Check whether the program is in PATH; otherwise, record it as missing.
         """
         found = self.which(prog)
         if found:
@@ -310,8 +310,8 @@ class MissingCheckers(AncillaryMethods):
 
     def check_perl_module(self, prog, dtype):
         """
-        Does perl have a dependency? Is it available?
-        If not, add it to missing dependencies.
+        Check whether Perl and the specified module are available;
+        otherwise, record the missing dependency.
 
         Right now, we still need Perl for doc build, as it is required
         by some tools called at docs or kernel build time, like:
@@ -340,8 +340,8 @@ class MissingCheckers(AncillaryMethods):
 
     def check_python_module(self, module, is_optional=False):
         """
-        Does a python module exists outside venv? If not, add it to missing
-        dependencies.
+        Check whether the Python module is available; otherwise, record it
+        as missing.
         """
         if is_optional:
             dtype = DepManager.PYTHON_OPTIONAL
@@ -355,7 +355,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_rpm_missing(self, pkgs, dtype):
         """
-        Does a rpm package exists? If not, add it to missing dependencies.
+        Check whether each RPM package is installed; record any that are missing.
         """
         for prog in pkgs:
             try:
@@ -365,7 +365,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_pacman_missing(self, pkgs, dtype):
         """
-        Does a pacman package exists? If not, add it to missing dependencies.
+        Check whether each pacman package is installed; record any that are missing.
         """
         for prog in pkgs:
             try:
@@ -375,7 +375,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_missing_tex(self, is_optional=False):
         """
-        Does a LaTeX package exists? If not, add it to missing dependencies.
+        Check whether each LaTeX resource is available; record missing packages.
         """
         if is_optional:
             dtype = DepManager.PDF_OPTIONAL
@@ -511,7 +511,7 @@ class MissingCheckers(AncillaryMethods):
         methods are used here.
 
         By default, it will use lsb_release function. If not available, it will
-        fail back to reading the known different places where the distro name
+        fall back to reading the known locations where the distro name
         is stored.
 
         Several modern distros now have /etc/os-release, which usually have
@@ -1155,7 +1155,7 @@ class SphinxDependencyChecker(MissingCheckers):
 
         #
         # Fall-back to generic hint code for other distros
-        # That's far from ideal, specially for LaTeX dependencies.
+        # That's far from ideal, especially for LaTeX dependencies.
         #
         progs = {"sphinx-build": "sphinx"}
         if self.pdf:
@@ -1184,8 +1184,8 @@ class SphinxDependencyChecker(MissingCheckers):
         Give a hint about how to activate an already-existing virtual
         environment containing sphinx-build.
 
-        Returns a tuble with (activate_cmd_path, sphinx_version) with
-        the newest available virtual env.
+        Returns (activate_cmd_path, sphinx_version) for a selected virtual
+        environment, or an empty activation path if none is selected.
         """
 
         cwd = os.getcwd()
-- 
2.51.0

