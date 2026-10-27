Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120875;
	b=jnnzfBRQiidJ41VsJr+Kp3877mO++APC2jrFMPPLjh2lwkHQEoJ/S4p2aDH96nkyu7hd
	 iJLNsaEv+F74P9jq2jAxtCNCm3NiqAnJttK9QcbNY/3OG7yFD+8Mpc+yHs9RG3WA9WV7L
	 wz7JSCs8fl6qT79sOmQ1ATD6A66WddaT4s0mOAwOFcOQ44NVCdrKi1JUrn0HsQAfZQ9wE
	 tAcaRxEA2hgLzH7Oq4tMfYqCH5CM5QQD80Xt3rPsRWxVdFbTa3/7P/3o46KKMSuHaND1f
	 TLuMkQ+NWIRoIhkWRrqKaoO86S1gFYmKVet1kaeQP44AmtcOHCY+S4Ffhb7Ktt7A6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120875;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=u9oA4WbTEewM6HuFQTfW5+AilxWeVNBbE2glAWXMnxI=;
	b=AW4vHMRdarpUqL+lhDZwZ70TNhuMKANz56v+QW0LqQpmMIEbsMqZwnKTTblGp/4ip3Sl
	 E64ccYn43XMAqEPZwUkXiOYKpDPLNsELuFTyHYwN7FO2fOqPr/WBHCDZSNsEI3N5/Rz9y
	 0Hj0Jg3D3GLIc6TCjzuCbwPFm1Jg59taKyhWCTrXfsO9vvEHlFVQQi1vBgz4PzUIzGjLJ
	 QMTxbWODtz5FJlACWoxPve3wZIdv15L/QEdAri7CeOAJZINA8BmOwXg56NuD2s903o+cE
	 2H0++VHWqm/tnRE/b/NvNx9D8GZIo/ZaQ1WKoX8oj5BClbfhuvzMn+gZiY5/wiGDawA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8FD606A322;
	Tue, 27 Oct 2026 17:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8FD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAmTndm2uBqEt5fAA--.42777S2;
	Wed, 28 Oct 2026 01:07:50 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHkrpj2uBqunDEAA--.19242S2;
	Wed, 28 Oct 2026 01:07:48 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH 2/2] docs: Improve wording in Sphinx dependency checker
Date: Wed, 28 Oct 2026 01:07:47 +0800
Message-ID: <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1793119566.git.dzm91@hust.edu.cn>
References: <cover.1793119566.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMAmTndm2uBqEt5fAA--.42777S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3ur45Kr4xWw1fZryxuF48JFb_yoW8Gw1UCo
	WrZrWDGa9rKr17JF10vas5CFyUWa10kF4fJr1Utr45Ka10va43Gw1rZ3y8Ja43AFn2kr9r
	Was8G340yrs5JF93n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOW7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
	x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1ln4kS14
	v26r126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF
	6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7
	AKxVW8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_
	Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAV
	WUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1U
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYcID3UUUU
	U==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Correct typos and awkward phrasing in user-facing installation hints,
command-line help, and docstrings. Leave dependency checks and package
mappings unchanged.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 tools/docs/sphinx-pre-install | 115 +++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 58 deletions(-)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index d1af82e1466d..00a8a42ca7d9 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -10,19 +10,19 @@
 # incompatible python versions.
 
 """
-Dependency checker for Sphinx documentation Kernel build.
+Check Sphinx installation and Linux kernel documentation build dependencies.
 
-This module provides tools to check for all required dependencies needed to
-build documentation using Sphinx, including system packages, Python modules
-and LaTeX packages for PDF generation.
+This module checks whether Sphinx is available and verifies dependencies
+needed to build Linux kernel documentation, including system programs,
+Python modules, and LaTeX packages for PDF output.
 
-It detect packages for a subset of Linux distributions used by Kernel
-maintainers, showing hints and missing dependencies.
+It reports missing dependencies and provides distribution-specific
+installation hints for a subset of Linux distributions used by kernel
+maintainers.
 
 The main class SphinxDependencyChecker handles the dependency checking logic
-and provides recommendations for installing missing packages. It supports both
-system package installations and  Python virtual environments. By default,
-system pacage install is recommended.
+and provides recommendations for installing missing packages. When Sphinx is
+missing, it can suggest a Python virtual environment or a distribution package.
 """
 
 import argparse
@@ -51,8 +51,8 @@ class DepManager:
     - PDF: dependencies needed by PDF builds.
 
     Each dependency can be mandatory or optional. Not installing an optional
-    dependency won't break the build, but will cause degradation at the
-    docs output.
+    dependency won't break the build, but may degrade the generated
+    documentation.
     """
 
     # Internal types of dependencies. Don't use them outside DepManager class.
@@ -148,7 +148,7 @@ class DepManager:
         """
         Clear dependencies without changing needed/optional.
 
-        This is an ackward way to have a separate section to recommend
+        This is an awkward way to have a separate section to recommend
         a package after system main dependencies.
 
         TODO: rework the logic to prevent needing it.
@@ -162,8 +162,8 @@ class DepManager:
         Update self.missing_pkg, using progs dict to convert from the
         agnostic package name to distro-specific one.
 
-        Returns an string with the packages to be installed, sorted and
-        with eventual duplicates removed.
+        Returns a string with the packages to be installed, sorted and
+        with duplicates removed.
         """
 
         self.missing_pkg = {}
@@ -211,8 +211,7 @@ class DepManager:
 
 class AncillaryMethods:
     """
-    Ancillary methods that checks for missing dependencies for different
-    types of types, like binaries, python modules, rpm deps, etc.
+    Common helpers for locating and running programs.
     """
 
     @staticmethod
@@ -232,7 +231,7 @@ class AncillaryMethods:
     @staticmethod
     def run(*args, **kwargs):
         """
-        Excecute a command, hiding its output by default.
+        Execute a command, hiding its output by default.
         Preserve compatibility with older Python versions.
         """
 
@@ -288,7 +287,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_missing_file(self, files, package, dtype):
         """
-        Does the file exists? If not, add it to missing dependencies.
+        Check whether any listed file exists; otherwise, record the missing package.
         """
         for f in files:
             if os.path.exists(f):
@@ -297,8 +296,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_program(self, prog, dtype):
         """
-        Does the program exists and it is at the PATH?
-        If not, add it to missing dependencies.
+        Check whether the program is in PATH; otherwise, record it as missing.
         """
         found = self.which(prog)
         if found:
@@ -310,8 +308,8 @@ class MissingCheckers(AncillaryMethods):
 
     def check_perl_module(self, prog, dtype):
         """
-        Does perl have a dependency? Is it available?
-        If not, add it to missing dependencies.
+        Check whether Perl and the specified module are available;
+        otherwise, record the missing dependency.
 
         Right now, we still need Perl for doc build, as it is required
         by some tools called at docs or kernel build time, like:
@@ -340,8 +338,8 @@ class MissingCheckers(AncillaryMethods):
 
     def check_python_module(self, module, is_optional=False):
         """
-        Does a python module exists outside venv? If not, add it to missing
-        dependencies.
+        Check whether the Python module is available; otherwise, record it
+        as missing.
         """
         if is_optional:
             dtype = DepManager.PYTHON_OPTIONAL
@@ -355,7 +353,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_rpm_missing(self, pkgs, dtype):
         """
-        Does a rpm package exists? If not, add it to missing dependencies.
+        Check whether each RPM package is installed; record any that are missing.
         """
         for prog in pkgs:
             try:
@@ -365,7 +363,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_pacman_missing(self, pkgs, dtype):
         """
-        Does a pacman package exists? If not, add it to missing dependencies.
+        Check whether each pacman package is installed; record any that are missing.
         """
         for prog in pkgs:
             try:
@@ -375,7 +373,7 @@ class MissingCheckers(AncillaryMethods):
 
     def check_missing_tex(self, is_optional=False):
         """
-        Does a LaTeX package exists? If not, add it to missing dependencies.
+        Check whether each TeX resource is available; record missing packages.
         """
         if is_optional:
             dtype = DepManager.PDF_OPTIONAL
@@ -511,7 +509,7 @@ class MissingCheckers(AncillaryMethods):
         methods are used here.
 
         By default, it will use lsb_release function. If not available, it will
-        fail back to reading the known different places where the distro name
+        fall back to reading the known locations where the distro name
         is stored.
 
         Several modern distros now have /etc/os-release, which usually have
@@ -784,10 +782,10 @@ class SphinxDependencyChecker(MissingCheckers):
             if not self.distro_msg:
                 self.distro_msg = \
                     "Note: RHEL-based distros typically require extra repositories.\n" \
-                    "For most, enabling epel and crb are enough:\n" \
+                    "For most, enabling EPEL and CRB is enough:\n" \
                     "\tsudo dnf install -y epel-release\n" \
                     "\tsudo dnf config-manager --set-enabled crb\n" \
-                    "Yet, some may have other required repositories. Those commands could be useful:\n" \
+                    "Some may require other repositories. These commands may help:\n" \
                     "\tsudo dnf repolist all\n" \
                     "\tsudo dnf repoquery --available --info <pkgs>\n" \
                     "\tsudo dnf config-manager --set-enabled '*' # enable all - probably not what you want"
@@ -934,8 +932,8 @@ class SphinxDependencyChecker(MissingCheckers):
             if not self.distro_msg:
                 self.distro_msg = \
                     "Notes:\n"\
-                    "1. for venv, ensurepip could be broken, preventing its install method.\n" \
-                    "2. at least on OpenMandriva LX 4.3, texlive packages seem broken"
+                    "1. ensurepip may fail while creating a Python virtual environment.\n" \
+                    "2. At least on OpenMandriva LX 4.3, TeX Live packages appear broken."
 
         else:
             packager_cmd = "urpmi"
@@ -1155,16 +1153,16 @@ class SphinxDependencyChecker(MissingCheckers):
 
         #
         # Fall-back to generic hint code for other distros
-        # That's far from ideal, specially for LaTeX dependencies.
+        # That's far from ideal, especially for LaTeX dependencies.
         #
         progs = {"sphinx-build": "sphinx"}
         if self.pdf:
             self.check_missing_tex()
 
         self.distro_msg = \
-            f"I don't know distro {self.system_release}.\n" \
-            "So, I can't provide you a hint with the install procedure.\n" \
-            "There are likely missing dependencies."
+            f"I don't recognize the distribution: {self.system_release}.\n" \
+            "I can't suggest a package installation command.\n" \
+            "Some dependencies may be missing."
 
         return self.get_install_progs(progs, None)
 
@@ -1184,8 +1182,8 @@ class SphinxDependencyChecker(MissingCheckers):
         Give a hint about how to activate an already-existing virtual
         environment containing sphinx-build.
 
-        Returns a tuble with (activate_cmd_path, sphinx_version) with
-        the newest available virtual env.
+        Returns (activate_cmd_path, sphinx_version) for a suitable virtual
+        environment, or an empty path if none is found.
         """
 
         cwd = os.getcwd()
@@ -1220,8 +1218,8 @@ class SphinxDependencyChecker(MissingCheckers):
 
             if not ver:
                 venv_dir = f.replace("/bin/activate", "")
-                print(f"Warning: virtual environment {venv_dir} is not working.\n" \
-                      "Python version upgrade? Remove it with:\n\n" \
+                print(f"Warning: virtual environment {venv_dir} is unusable,\n" \
+                      "possibly after a Python upgrade. To remove it, run:\n\n" \
                       "\trm -rf {venv_dir}\n\n")
             else:
                 if self.need_sphinx and ver >= self.min_version:
@@ -1235,9 +1233,8 @@ class SphinxDependencyChecker(MissingCheckers):
         """
         Check if Sphinx needs to be upgraded.
 
-        Returns a tuple with the higest available Sphinx version if found.
-        Otherwise, returns None to indicate either that no upgrade is needed
-        or no venv was found.
+        Returns a version tuple for the upgrade recommendation, or None when
+        the current Sphinx version is already sufficient.
         """
 
         # Avoid running sphinx-builds from venv if cur_version is good
@@ -1284,7 +1281,7 @@ class SphinxDependencyChecker(MissingCheckers):
         Recommend installing Sphinx as a distro-specific package.
         """
 
-        print("\n2) As a package with:")
+        print("\n2) From a distribution package:")
 
         old_need = self.deps.need
         old_optional = self.deps.optional
@@ -1375,7 +1372,7 @@ class SphinxDependencyChecker(MissingCheckers):
         # Suggest newer versions if current ones are too old
         if self.latest_avail_ver and self.latest_avail_ver >= self.min_version:
             if self.latest_avail_ver >= RECOMMENDED_VERSION:
-                print(f"\nNeed to activate Sphinx (version {latest_avail_ver}) on virtualenv with:")
+                print(f"\nActivate Sphinx {latest_avail_ver} in the virtual environment with:")
                 print(f"\t. {self.activate_cmd}")
                 self.deactivate_help()
                 return
@@ -1383,21 +1380,23 @@ class SphinxDependencyChecker(MissingCheckers):
             # Version is above the minimal required one, but may be
             # below the recommended one. So, print warnings/notes
             if self.latest_avail_ver < RECOMMENDED_VERSION:
-                print(f"Warning: It is recommended at least Sphinx version {RECOMMENDED_VERSION}.")
+                print(f"Warning: Sphinx {PythonVersion.ver_str(RECOMMENDED_VERSION)} "
+                      "or newer is recommended.")
 
         # At this point, either it needs Sphinx or upgrade is recommended,
         # both via pip
 
         if self.rec_sphinx_upgrade:
             if not self.virtualenv:
-                print("Instead of install/upgrade Python Sphinx pkg, you could use pip/pypi with:\n\n")
+                print("Instead of installing or upgrading the distribution's "
+                      "Sphinx package, you can use PyPI:\n\n")
             else:
                 print("To upgrade Sphinx, use:\n\n")
         else:
-            print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
+            print("\nInstall Sphinx with:\n1) A Python virtual environment:\n")
 
         if not virtualenv_cmd:
-            print("   Currently not possible.\n")
+            print("   A virtual environment is not available with this Python version.\n")
             print("   Please upgrade Python to a newer version and run this script again")
         else:
             print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
@@ -1409,9 +1408,9 @@ class SphinxDependencyChecker(MissingCheckers):
             self.recommend_package()
 
         print("\n" \
-              "   Please note that Sphinx currentlys produce false-positive\n" \
+              "   Please note that Sphinx currently produces false-positive\n" \
               "   warnings when the same name is used for more than one type (functions,\n" \
-              "   structs, enums,...). This is known Sphinx bug. For more details, see:\n" \
+              "   structs, enums, ...). This is a known Sphinx bug. For details, see:\n" \
               "\thttps://github.com/sphinx-doc/sphinx/pull/8313")
 
     def check_needs(self):
@@ -1437,7 +1436,7 @@ class SphinxDependencyChecker(MissingCheckers):
 
         if sys.version_info < MIN_PYTHON_VERSION:
             min_ver = ver_str(MIN_PYTHON_VERSION)
-            print(f"ERROR: at least python {min_ver} is required to build the kernel docs")
+            print(f"ERROR: Python {min_ver} or newer is required to build the kernel docs")
             self.need_sphinx = 1
 
         self.venv_ver = self.recommend_sphinx_upgrade()
@@ -1445,7 +1444,7 @@ class SphinxDependencyChecker(MissingCheckers):
         if self.need_pip:
             if sys.version_info < MIN_PYTHON_VERSION:
                 self.need_pip = False
-                print("Warning: python version is not supported.")
+                print("Warning: this Python version is not supported.")
             else:
                 virtualenv_cmd = f"{self.python_cmd} -m venv"
                 self.check_python_module("ensurepip")
@@ -1499,10 +1498,10 @@ class SphinxDependencyChecker(MissingCheckers):
         elif self.deps.need:
             sys.exit(f"Can't build as {self.deps.need} mandatory dependencies are missing")
 
-        print("Needed package dependencies are met.")
+        print("All checked mandatory package dependencies are available.")
 
 DESCRIPTION = """
-Process some flags related to Sphinx installation and documentation build.
+Check Sphinx installation and dependencies for building kernel documentation.
 """
 
 
@@ -1514,21 +1513,21 @@ def main():
         "--no-virtualenv",
         action="store_false",
         dest="virtualenv",
-        help="Recommend installing Sphinx instead of using a virtualenv",
+        help="Do not suggest creating a new virtual environment",
     )
 
     parser.add_argument(
         "--no-pdf",
         action="store_false",
         dest="pdf",
-        help="Don't check for dependencies required to build PDF docs",
+        help="Skip dependency checks for PDF documentation",
     )
 
     parser.add_argument(
         "--version-check",
         action="store_true",
         dest="version_check",
-        help="If version is compatible, don't check for missing dependencies",
+        help="Skip dependency checks if Sphinx meets the recommended version",
     )
 
     args = parser.parse_args()
-- 
2.51.0

