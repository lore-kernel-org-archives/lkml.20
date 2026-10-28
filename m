Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149141;
	b=SQ2YWhRCQ2f1Di3RtQrr74BUu+95ISn4jqalmxsCLmjKy9QrCodkMRucbwq5M9N0kZsV
	 7GkDlCJUSGzQvRbjy2hK/IXCIhhOb7xSUUq9ZghQarGp8122BADT1nhh/GZZMG1c6ohPW
	 jmsUpoUOgYVjs3dkkx6ZjJCWbWSOm4Zd8Mrw5Mm0a0sPAdmzfkfnIrrhMYeFgEb44r7a7
	 YYdtaUmqmoBUmnih6FpRew0qtqCA6iQOVSCpNclVTWM803MyK+AwxwbGrfeDiiNgXud2u
	 XrUP3jxmbURHzvvb/+/Cnft51J8kPyuMa1uKyl8I3FGvDXmCrsS3Xck0KIkiYoS5LHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149141;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1PI0CX+g/jnYntCSoP9ftFZ1ckHoubzQpUexb1gi9ZM=;
	b=sNOspNu8PIkQehgju7WKJ1BZWvqpUu/wrLC2eyBxQlvwCS3DoTEc3nURgTZzuUC4QeP1
	 MIrLXmkVARcvoB6uaQfSGmB1g6qCO7Pi8embsAY+Tvk2KkyhDmfS6jKLhffTn5seqi21X
	 Kd35KcY0e9pvkvabKmWib8X9ly6gmCiaEUmVzanI4hgrnE0rt23BBetJclARy7vBZU5CU
	 sQh4v40GKViuqouwDWyIDEftpBzpN7jORfxA3ScXTKLU+L3e1H3mmBh5/GVsSfAJGdAWR
	 iNw/vlxM9kYwUkp91+CyvszqByxqxf3Me6X9z5SdpGgc1nTkrdbelYu/ZQSVRhAmAAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhK1+oOu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD2606A31A;
	Wed, 28 Oct 2026 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhK1+oOu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8445B1F01825;
	Wed, 28 Oct 2026 00:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793149140;
	bh=1PI0CX+g/jnYntCSoP9ftFZ1ckHoubzQpUexb1gi9ZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WhK1+oOuzx6WXbFrfxum+s/HnxhpE/gGFzxCwL72oF3c3/z7o0vlgDycolwtDqQqH
	 hfbSLwnCUlPEshSB3lt2prcvs25WwibVwwckSuXW19LeN/s06gxUMl2cQ6ctdovvit
	 LMy03uDVETNn/YSXxUXZcfKJNS+haqsZ3OSmMqk8Xh0Enf3FdoIe7KF8sGD+m2q34I
	 Y9yeH9jOP2vVIkKU0OMA83mIlg8mOTXY9jtBmVt7UkjgJwx5N/puLnuXjiR/7ysu73
	 XuStEzRg1GTHj/5DBy5ELr4O/yZstwgmv6aC4vPt6rEoJIOGLnXI05b6OGC2ZJDrnq
	 hdl8PgyGmbrog==
Date: Wed, 28 Oct 2026 01:58:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: Improve wording in Sphinx dependency checker
Message-ID: <20261028015855.288f1905@foz.lan>
In-Reply-To: <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
References: <cover.1793119566.git.dzm91@hust.edu.cn>
	<13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 01:07:47 +0800
Dongliang Mu <dzm91@hust.edu.cn> wrote:

> Correct typos and awkward phrasing in user-facing installation hints,
> command-line help, and docstrings. Leave dependency checks and package
> mappings unchanged.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  tools/docs/sphinx-pre-install | 115 +++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 58 deletions(-)
> 
> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index d1af82e1466d..00a8a42ca7d9 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -10,19 +10,19 @@
>  # incompatible python versions.
>  
>  """
> -Dependency checker for Sphinx documentation Kernel build.
> +Check Sphinx installation and Linux kernel documentation build dependencies.
>  
> -This module provides tools to check for all required dependencies needed to
> -build documentation using Sphinx, including system packages, Python modules
> -and LaTeX packages for PDF generation.
> +This module checks whether Sphinx is available and verifies dependencies
> +needed to build Linux kernel documentation, including system programs,
> +Python modules, and LaTeX packages for PDF output.
>  
> -It detect packages for a subset of Linux distributions used by Kernel
> -maintainers, showing hints and missing dependencies.
> +It reports missing dependencies and provides distribution-specific
> +installation hints for a subset of Linux distributions used by kernel
> +maintainers.
>  
>  The main class SphinxDependencyChecker handles the dependency checking logic
> -and provides recommendations for installing missing packages. It supports both
> -system package installations and  Python virtual environments. By default,
> -system pacage install is recommended.
> +and provides recommendations for installing missing packages. When Sphinx is
> +missing, it can suggest a Python virtual environment or a distribution package.
>  """
>  
>  import argparse
> @@ -51,8 +51,8 @@ class DepManager:
>      - PDF: dependencies needed by PDF builds.
>  
>      Each dependency can be mandatory or optional. Not installing an optional
> -    dependency won't break the build, but will cause degradation at the
> -    docs output.
> +    dependency won't break the build, but may degrade the generated
> +    documentation.
>      """
>  
>      # Internal types of dependencies. Don't use them outside DepManager class.
> @@ -148,7 +148,7 @@ class DepManager:
>          """
>          Clear dependencies without changing needed/optional.
>  
> -        This is an ackward way to have a separate section to recommend
> +        This is an awkward way to have a separate section to recommend
>          a package after system main dependencies.
>  
>          TODO: rework the logic to prevent needing it.
> @@ -162,8 +162,8 @@ class DepManager:
>          Update self.missing_pkg, using progs dict to convert from the
>          agnostic package name to distro-specific one.
>  
> -        Returns an string with the packages to be installed, sorted and
> -        with eventual duplicates removed.
> +        Returns a string with the packages to be installed, sorted and
> +        with duplicates removed.
>          """
>  
>          self.missing_pkg = {}
> @@ -211,8 +211,7 @@ class DepManager:
>  
>  class AncillaryMethods:
>      """
> -    Ancillary methods that checks for missing dependencies for different
> -    types of types, like binaries, python modules, rpm deps, etc.
> +    Common helpers for locating and running programs.
>      """
>  
>      @staticmethod
> @@ -232,7 +231,7 @@ class AncillaryMethods:
>      @staticmethod
>      def run(*args, **kwargs):
>          """
> -        Excecute a command, hiding its output by default.
> +        Execute a command, hiding its output by default.
>          Preserve compatibility with older Python versions.
>          """
>  
> @@ -288,7 +287,7 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_missing_file(self, files, package, dtype):
>          """
> -        Does the file exists? If not, add it to missing dependencies.
> +        Check whether any listed file exists; otherwise, record the missing package.
>          """
>          for f in files:
>              if os.path.exists(f):
> @@ -297,8 +296,7 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_program(self, prog, dtype):
>          """
> -        Does the program exists and it is at the PATH?
> -        If not, add it to missing dependencies.
> +        Check whether the program is in PATH; otherwise, record it as missing.
>          """
>          found = self.which(prog)
>          if found:
> @@ -310,8 +308,8 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_perl_module(self, prog, dtype):
>          """
> -        Does perl have a dependency? Is it available?
> -        If not, add it to missing dependencies.
> +        Check whether Perl and the specified module are available;
> +        otherwise, record the missing dependency.
>  
>          Right now, we still need Perl for doc build, as it is required
>          by some tools called at docs or kernel build time, like:
> @@ -340,8 +338,8 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_python_module(self, module, is_optional=False):
>          """
> -        Does a python module exists outside venv? If not, add it to missing
> -        dependencies.
> +        Check whether the Python module is available; otherwise, record it
> +        as missing.
>          """
>          if is_optional:
>              dtype = DepManager.PYTHON_OPTIONAL
> @@ -355,7 +353,7 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_rpm_missing(self, pkgs, dtype):
>          """
> -        Does a rpm package exists? If not, add it to missing dependencies.
> +        Check whether each RPM package is installed; record any that are missing.
>          """
>          for prog in pkgs:
>              try:
> @@ -365,7 +363,7 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_pacman_missing(self, pkgs, dtype):
>          """
> -        Does a pacman package exists? If not, add it to missing dependencies.
> +        Check whether each pacman package is installed; record any that are missing.
>          """
>          for prog in pkgs:
>              try:
> @@ -375,7 +373,7 @@ class MissingCheckers(AncillaryMethods):
>  
>      def check_missing_tex(self, is_optional=False):
>          """
> -        Does a LaTeX package exists? If not, add it to missing dependencies.
> +        Check whether each TeX resource is available; record missing packages.
>          """
>          if is_optional:
>              dtype = DepManager.PDF_OPTIONAL
> @@ -511,7 +509,7 @@ class MissingCheckers(AncillaryMethods):
>          methods are used here.
>  
>          By default, it will use lsb_release function. If not available, it will
> -        fail back to reading the known different places where the distro name
> +        fall back to reading the known locations where the distro name
>          is stored.
>  
>          Several modern distros now have /etc/os-release, which usually have
> @@ -784,10 +782,10 @@ class SphinxDependencyChecker(MissingCheckers):
>              if not self.distro_msg:
>                  self.distro_msg = \
>                      "Note: RHEL-based distros typically require extra repositories.\n" \
> -                    "For most, enabling epel and crb are enough:\n" \
> +                    "For most, enabling EPEL and CRB is enough:\n" \

As Randy already pointed: "are enough": both EPEL and CRB are needed
to have all packages needed by the LaTeX builder (which outputs PDF).
That actually varies: CentOS, Unbreakable Oracle, AlmaLinux ... may have 
different repositories for the extra packages needed for PDF output.

>                      "\tsudo dnf install -y epel-release\n" \
>                      "\tsudo dnf config-manager --set-enabled crb\n" \
> -                    "Yet, some may have other required repositories. Those commands could be useful:\n" \
> +                    "Some may require other repositories. These commands may help:\n" \
>                      "\tsudo dnf repolist all\n" \
>                      "\tsudo dnf repoquery --available --info <pkgs>\n" \
>                      "\tsudo dnf config-manager --set-enabled '*' # enable all - probably not what you want"
> @@ -934,8 +932,8 @@ class SphinxDependencyChecker(MissingCheckers):
>              if not self.distro_msg:
>                  self.distro_msg = \
>                      "Notes:\n"\
> -                    "1. for venv, ensurepip could be broken, preventing its install method.\n" \
> -                    "2. at least on OpenMandriva LX 4.3, texlive packages seem broken"
> +                    "1. ensurepip may fail while creating a Python virtual environment.\n" \
> +                    "2. At least on OpenMandriva LX 4.3, TeX Live packages appear broken."

I'm almost sure the packages on OpenMandriva are named "texlive*".

>  
>          else:
>              packager_cmd = "urpmi"
> @@ -1155,16 +1153,16 @@ class SphinxDependencyChecker(MissingCheckers):
>  
>          #
>          # Fall-back to generic hint code for other distros
> -        # That's far from ideal, specially for LaTeX dependencies.
> +        # That's far from ideal, especially for LaTeX dependencies.
>          #
>          progs = {"sphinx-build": "sphinx"}
>          if self.pdf:
>              self.check_missing_tex()
>  
>          self.distro_msg = \
> -            f"I don't know distro {self.system_release}.\n" \
> -            "So, I can't provide you a hint with the install procedure.\n" \
> -            "There are likely missing dependencies."
> +            f"I don't recognize the distribution: {self.system_release}.\n" \
> +            "I can't suggest a package installation command.\n" \
> +            "Some dependencies may be missing."
>  
>          return self.get_install_progs(progs, None)
>  
> @@ -1184,8 +1182,8 @@ class SphinxDependencyChecker(MissingCheckers):
>          Give a hint about how to activate an already-existing virtual
>          environment containing sphinx-build.
>  
> -        Returns a tuble with (activate_cmd_path, sphinx_version) with
> -        the newest available virtual env.
> +        Returns (activate_cmd_path, sphinx_version) for a suitable virtual
> +        environment, or an empty path if none is found.
>          """
>  
>          cwd = os.getcwd()
> @@ -1220,8 +1218,8 @@ class SphinxDependencyChecker(MissingCheckers):
>  
>              if not ver:
>                  venv_dir = f.replace("/bin/activate", "")
> -                print(f"Warning: virtual environment {venv_dir} is not working.\n" \
> -                      "Python version upgrade? Remove it with:\n\n" \
> +                print(f"Warning: virtual environment {venv_dir} is unusable,\n" \
> +                      "possibly after a Python upgrade. To remove it, run:\n\n" \

I don't think "possibly" is the best choice. It could be an incomplete pip
environment, for instance, if one stops pip before the end. 

I mentioned "Python version upgrade?" here because this is something that
people may end forgetting to update/recreate venv after distro upgrades.

This is common for ones using a distro like Fedora, where upgrades happen
on every 6 months - not so common for people using LTS distros.

>                        "\trm -rf {venv_dir}\n\n")
>              else:
>                  if self.need_sphinx and ver >= self.min_version:
> @@ -1235,9 +1233,8 @@ class SphinxDependencyChecker(MissingCheckers):
>          """
>          Check if Sphinx needs to be upgraded.
>  
> -        Returns a tuple with the higest available Sphinx version if found.
> -        Otherwise, returns None to indicate either that no upgrade is needed
> -        or no venv was found.
> +        Returns a version tuple for the upgrade recommendation, or None when
> +        the current Sphinx version is already sufficient.
>          """
>  
>          # Avoid running sphinx-builds from venv if cur_version is good
> @@ -1284,7 +1281,7 @@ class SphinxDependencyChecker(MissingCheckers):
>          Recommend installing Sphinx as a distro-specific package.
>          """
>  
> -        print("\n2) As a package with:")
> +        print("\n2) From a distribution package:")

You may need to update documentation if you're touching print messages.

>  
>          old_need = self.deps.need
>          old_optional = self.deps.optional
> @@ -1375,7 +1372,7 @@ class SphinxDependencyChecker(MissingCheckers):
>          # Suggest newer versions if current ones are too old
>          if self.latest_avail_ver and self.latest_avail_ver >= self.min_version:
>              if self.latest_avail_ver >= RECOMMENDED_VERSION:
> -                print(f"\nNeed to activate Sphinx (version {latest_avail_ver}) on virtualenv with:")
> +                print(f"\nActivate Sphinx {latest_avail_ver} in the virtual environment with:")
>                  print(f"\t. {self.activate_cmd}")
>                  self.deactivate_help()
>                  return
> @@ -1383,21 +1380,23 @@ class SphinxDependencyChecker(MissingCheckers):
>              # Version is above the minimal required one, but may be
>              # below the recommended one. So, print warnings/notes
>              if self.latest_avail_ver < RECOMMENDED_VERSION:
> -                print(f"Warning: It is recommended at least Sphinx version {RECOMMENDED_VERSION}.")
> +                print(f"Warning: Sphinx {PythonVersion.ver_str(RECOMMENDED_VERSION)} "
> +                      "or newer is recommended.")
>  
>          # At this point, either it needs Sphinx or upgrade is recommended,
>          # both via pip
>  
>          if self.rec_sphinx_upgrade:
>              if not self.virtualenv:
> -                print("Instead of install/upgrade Python Sphinx pkg, you could use pip/pypi with:\n\n")
> +                print("Instead of installing or upgrading the distribution's "
> +                      "Sphinx package, you can use PyPI:\n\n")

Don't break strings, except if they have "\n".

>              else:
>                  print("To upgrade Sphinx, use:\n\n")
>          else:
> -            print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
> +            print("\nInstall Sphinx with:\n1) A Python virtual environment:\n")
>  
>          if not virtualenv_cmd:
> -            print("   Currently not possible.\n")
> +            print("   A virtual environment is not available with this Python version.\n")
>              print("   Please upgrade Python to a newer version and run this script again")
>          else:
>              print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
> @@ -1409,9 +1408,9 @@ class SphinxDependencyChecker(MissingCheckers):
>              self.recommend_package()
>  
>          print("\n" \
> -              "   Please note that Sphinx currentlys produce false-positive\n" \
> +              "   Please note that Sphinx currently produces false-positive\n" \
>                "   warnings when the same name is used for more than one type (functions,\n" \
> -              "   structs, enums,...). This is known Sphinx bug. For more details, see:\n" \
> +              "   structs, enums, ...). This is a known Sphinx bug. For details, see:\n" \
>                "\thttps://github.com/sphinx-doc/sphinx/pull/8313")
>  
>      def check_needs(self):
> @@ -1437,7 +1436,7 @@ class SphinxDependencyChecker(MissingCheckers):
>  
>          if sys.version_info < MIN_PYTHON_VERSION:
>              min_ver = ver_str(MIN_PYTHON_VERSION)
> -            print(f"ERROR: at least python {min_ver} is required to build the kernel docs")
> +            print(f"ERROR: Python {min_ver} or newer is required to build the kernel docs")
>              self.need_sphinx = 1
>  
>          self.venv_ver = self.recommend_sphinx_upgrade()
> @@ -1445,7 +1444,7 @@ class SphinxDependencyChecker(MissingCheckers):
>          if self.need_pip:
>              if sys.version_info < MIN_PYTHON_VERSION:
>                  self.need_pip = False
> -                print("Warning: python version is not supported.")
> +                print("Warning: this Python version is not supported.")
>              else:
>                  virtualenv_cmd = f"{self.python_cmd} -m venv"
>                  self.check_python_module("ensurepip")
> @@ -1499,10 +1498,10 @@ class SphinxDependencyChecker(MissingCheckers):
>          elif self.deps.need:
>              sys.exit(f"Can't build as {self.deps.need} mandatory dependencies are missing")
>  
> -        print("Needed package dependencies are met.")
> +        print("All checked mandatory package dependencies are available.")
>  
>  DESCRIPTION = """
> -Process some flags related to Sphinx installation and documentation build.
> +Check Sphinx installation and dependencies for building kernel documentation.
>  """
>  
>  
> @@ -1514,21 +1513,21 @@ def main():
>          "--no-virtualenv",
>          action="store_false",
>          dest="virtualenv",
> -        help="Recommend installing Sphinx instead of using a virtualenv",
> +        help="Do not suggest creating a new virtual environment",
>      )
>  
>      parser.add_argument(
>          "--no-pdf",
>          action="store_false",
>          dest="pdf",
> -        help="Don't check for dependencies required to build PDF docs",
> +        help="Skip dependency checks for PDF documentation",
>      )
>  
>      parser.add_argument(
>          "--version-check",
>          action="store_true",
>          dest="version_check",
> -        help="If version is compatible, don't check for missing dependencies",
> +        help="Skip dependency checks if Sphinx meets the recommended version",
>      )
>  
>      args = parser.parse_args()



Thanks,
Mauro
