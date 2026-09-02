Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812B3F1AB7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338704; cv=none; b=r3fSRcCXvSrsC8LBFbKWT/f6dFXtkw2k7wN09G95CG5HAxU1isrcrdZdD0KeQO0qaAiR7pb0v+7X0Hak43C+pWQOWfLy5GLpzkGyOqmYp0nUlpRfoEb0yN+FkL/RfPxdnr9pLYXdmDqGnCXB12Tc2ybENoJ6CDg24VgsP60W6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338704; c=relaxed/simple;
	bh=FgKjhz3mUeEjERAksccr4wk8eWplMtPAxYkqd3ZlHP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTdq3jizlETdUBh4INFw0fk1do0DVYFF4yxJE/Ut56IRti0qHhZSsfHU9pbXAJSK5MpiMp37YBVR2kCYYfqGrmp/8TrRPmLbIbc2Gll5EY+rdnIVrU8IH+IdKk4byqFSGLKC0Th8f97Ac3U6f00CrMkOEmiIPT+7lKQQHCJ+1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2bWowsY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2bWowsY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e58034d05so647295a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338702; x=1788943502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEzbEUhsLIbV0F6Tu7BYGASiUv49dSXTrGmhReWfJSU=;
        b=U2bWowsY4mtRhL/iO6NihP8BP5r/wGiYwn1nBQPQBRFQaW4IG1WTT+vifYJkJJ4SE3
         lI6qU/nrgty/DSbB2HuaSb7NNLi8v90heBu9JwwB0t2g1oR3rXMvBypHJy2mDsKd1DY/
         ZwvVzlqULZiLpUJ2qYaVhHTTeFofFH4abciAGJ+wh7VAxopcZ8xvZPsN785+FCw52VLm
         R4NJkPrCzqX7LFrhi8F5QMEjKxUZPPAMRkLZdsQH4Yz2+lzTjPRyzQxqL2nVu/E2Mz1X
         iw82bYiqr7OUtVKvwaM+oBAGYjkWjcG+zDTsyiAEPYLfor+jyITrWHUp2th2z7cBbP4M
         VAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338702; x=1788943502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEzbEUhsLIbV0F6Tu7BYGASiUv49dSXTrGmhReWfJSU=;
        b=X/4Kl3tlFl2qYWxVIVKCgWoMSFn3BlP/2hP22Z004AOj30GZbVd5i0B6fQTxP9SH2i
         IPZhTrNXkOOL7+LXytRowoqV8gPmoS0lVt3MklnS+beN3c3WphhRro0RX/JxrukmKTYT
         dLfpeoKLyBcB+VBaFckaW2aPP1k0x3PSmZkd0Ujgn/umckBQhYyDY03M7+dC3awy88DL
         dF3iIbxX4fA4qCPUfeV6SycNGShejXrV1oDKCTg1Q7cLcpkcMX18duif9wFQuyyEGBd9
         Z6mu0s0GGnItq9E1zhIrE/1wS3pWPY1Aoh0yChq0+2dhSLThP/u1Y9z2hjSQ3NczQECb
         askA==
X-Forwarded-Encrypted: i=1; AKwUvBzCiWsuZc60TZ8KSi0zeW7NP5f5rJ+lhH0aEkmst5ruYG9IejoyJh+roeT4A1kjndUiRaz5l0kigWz9yYU=@vger.kernel.org
X-Gm-Message-State: AFuF++lHwXnH6/0gBmwPDahado+ZQrvUUr8Uk8tllYvcSPZVHCuv6qVG
	mIMOyg9jD3HVFEBc/BoMGDXgtK7lI83De1iDyYScmymVLlCVQScEuCGxAhWpn3Rt
X-Gm-Gg: AYBFou3wSDZ9/r1wMfteYwkpOaC+vBR4TsmAFGIzbzabPj93iLjZfjy0HnmKl1C+VMf
	aClj34oxxvAerezgJtisuUXuYnhNN9j4A2XjTtdTslIkfRuwGU3UqmDneZTVBfX18Pt4I+sHqso
	/zEHYxpUh/cVTIijgPPS/wRmFMgF3t5aGqWI+/Hi/RA+UwlbTrCQbWDCdpnJqiBH75gWC6pj7NH
	hvLqs7RLrzDFEwZZvS6cjwidNv3CrraWXgb72D76w8jNq38rWvPaZLls9YbbFbvwKlPFFzznQpX
	18kd9MNXSryq8SIi4Wa7aN6lO1C6p1r7JcKwn4//W35IeRE1OktzGEWUJWcziMt66Ajw0XGi5NY
	nfTKDxAcKEtdOtnPxzgS70q0FnbIHLtOgXBm565eSIBZ1paL07UrnImKBP9tM0NEcC2mzCSocbW
	7zW+bOKtLwSlJAfeOxvuJXymwBtGNCy5W7VLKCzAvX/r/0Bw6msyMyF6R3BfBSAkV9AlaWOexPw
	MnYqV34t1a1N0HE55w=
X-Received: by 2002:a17:90b:55ce:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39aee066e9fmr5203335a91.16.1788338702036;
        Wed, 02 Sep 2026 01:45:02 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:45:01 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 4/5] Documentation: process: Refine language, tone, and grammar in subsequent files
Date: Wed,  2 Sep 2026 15:44:02 +0700
Message-ID: <20260902084430.17248-5-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902084430.17248-1-ducthinh100812@gmail.com>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Conduct a sweep across four more process documentation
files. Replace informal contractions with formal expressions and fix
minor grammatical bugs to ensure a highly professional and accessible
tone.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/botching-up-ioctls.rst  |  2 +-
 Documentation/process/changes.rst             | 20 +++++++++----------
 .../code-of-conduct-interpretation.rst        | 14 ++++++-------
 Documentation/process/code-of-conduct.rst     |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/botching-up-ioctls.rst b/Documentation/process/botching-up-ioctls.rst
index d9f9d4450debb..186749c443fcd 100644
--- a/Documentation/process/botching-up-ioctls.rst
+++ b/Documentation/process/botching-up-ioctls.rst
@@ -65,7 +65,7 @@ will have a second iteration or at least an extension for any given interface.
  * Have a plan for extending ioctls with new flags or new fields at the end of
    the structure. The drm core checks the passed-in size for each ioctl call
    and zero-extends any mismatches between kernel and userspace. That helps,
-   but is not a complete solution since newer userspace on older kernels won't
+   but is not a complete solution since newer userspace on older kernels will not
    notice that the newly added fields at the end that get ignored. So this still
    needs a new driver feature flags.
 
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b117b54..f9957a5d46edb 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -17,14 +17,14 @@ Axel Boldt, Alessandro Sigala, and countless other users all over the
 Current Minimal Requirements
 ****************************
 
-Upgrade to at **least** these software revisions before thinking you've
-encountered a bug!  If you're unsure what version you're currently
+Upgrade to at **least** these software revisions before thinking you have
+encountered a bug!  If you are unsure what version you are currently
 running, the suggested command should tell you. For a list of the programs
-on your system including their version execute ./scripts/ver_linux
+on your system, including their versions, execute ./scripts/ver_linux
 
 Again, keep in mind that this list assumes you are already functionally
 running a Linux kernel.  Also, not all tools are necessary on all
-systems; obviously, if you don't have any PC Card hardware, for example,
+systems; obviously, if you do not have any PC Card hardware, for example,
 you probably do not need to concern yourself with pcmciautils.
 
 ====================== ===============  ========================================
@@ -83,7 +83,7 @@ Clang/LLVM (optional)
 
 The latest formal release of clang and LLVM utils (according to
 `releases.llvm.org <https://releases.llvm.org>`_) are supported for building
-kernels. Older releases aren't guaranteed to work, and we may drop workarounds
+kernels. Older releases are not guaranteed to work, and we may drop workarounds
 from the kernel that were used to support older versions. Please see additional
 docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
@@ -222,7 +222,7 @@ documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
 files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
-In order to convert from ReST format to a format of your choice, you'll need
+In order to convert from ReST format to a format of your choice, you will need
 Sphinx.
 
 Util-linux
@@ -231,13 +231,13 @@ Util-linux
 New versions of util-linux provide ``fdisk`` support for larger disks,
 support new options to mount, recognize more supported partition
 types, and similar goodies.
-You'll probably want to upgrade.
+You will probably want to upgrade.
 
 Ksymoops
 --------
 
 If the unthinkable happens and your kernel oopses, you may need the
-ksymoops tool to decode it, but in most cases you don't.
+ksymoops tool to decode it, but in most cases you do not.
 It is generally preferred to build the kernel with ``CONFIG_KALLSYMS`` so
 that it produces readable dumps that can be used as-is (this also
 produces better output than ksymoops).  If for some reason your kernel
@@ -255,7 +255,7 @@ E2fsprogs
 ---------
 
 The latest version of ``e2fsprogs`` fixes several bugs in fsck and
-debugfs.  Obviously, it's a good idea to upgrade.
+debugfs.  Obviously, it is a good idea to upgrade.
 
 JFSutils
 --------
@@ -306,7 +306,7 @@ udev you may need to::
   mknod /dev/cpu/microcode c 10 184
   chmod 0644 /dev/cpu/microcode
 
-as root before you can use this.  You'll probably also want to
+as root before you can use this.  You will probably also want to
 get the user-space microcode_ctl utility to use with this.
 
 udev
diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
index 4cdef83606986..2f070ca1880ec 100644
--- a/Documentation/process/code-of-conduct-interpretation.rst
+++ b/Documentation/process/code-of-conduct-interpretation.rst
@@ -47,7 +47,7 @@ regarding conduct issues.
 
 Maintainers should be willing to help when problems occur, and work with
 others in the community when needed.  Do not be afraid to reach out to
-the Technical Advisory Board (TAB) or other maintainers if you're
+the Technical Advisory Board (TAB) or other maintainers if you are
 uncertain how to handle situations that come up.  It will not be
 considered a violation report unless you want it to be.  If you are
 uncertain about approaching the TAB or any other maintainers, please
@@ -78,7 +78,7 @@ rejecting unsuitable contributions are not viewed as a violation of the
 Code of Conduct.
 
 While maintainers are in general welcoming to newcomers, their capacity
-of helping contributors overcome the entry hurdles is limited, so they
+to help contributors overcome the entry hurdles is limited, so they
 have to set priorities.  This, also, is not to be seen as a violation of
 the Code of Conduct.  The kernel community is aware of that and provides
 entry level programs in various forms like kernelnewbies.org.
@@ -123,8 +123,8 @@ Enforcement
 
 The address listed in the Code of Conduct goes to the Code of Conduct
 Committee.  The exact members receiving these emails at any given time
-are listed at https://kernel.org/code-of-conduct.html.  Members can not
-access reports made before they joined or after they have left the
+are listed at https://kernel.org/code-of-conduct.html.  Members cannot
+access reports submitted before they joined or after they left the
 committee.
 
 The Code of Conduct Committee consists of volunteer community members
@@ -147,7 +147,7 @@ Any decisions regarding enforcement recommendations will be brought to
 the TAB for implementation of enforcement with the relevant maintainers
 if needed.  Once the TAB approves one or more of the measures outlined
 in the scope of the ban by two-thirds of the members voting for the
-measures, the Code of Conduct Committee will enforce the TAB approved
+measures, the Code of Conduct Committee will enforce the TAB-approved
 measures.  Any Code of Conduct Committee members serving on the TAB will
 not vote on the measures.
 
@@ -177,7 +177,7 @@ Unacceptable behaviors often get resolved when individuals acknowledge their
 behavior and make amends for it in the setting the violation has taken place.
 
 The Code of Conduct Committee receives reports about unacceptable behaviors
-when they don't get resolved through community discussions. The Code of
+when they do not get resolved through community discussions. The Code of
 Conduct committee takes measures to restore productive and respectful
 collaboration when an unacceptable behavior has negatively impacted that
 relationship.
@@ -237,7 +237,7 @@ administrators.  Any Code of Conduct Committee members serving on the TAB
 will not vote on the measures.
 
 The Code of Conduct Committee is mindful of the negative impact of seeking
-public apology and instituting ban could have on individuals. It is also
+a public apology and instituting a ban could have on individuals. It is also
 mindful of the longer term harm to the community that could result from
 not taking action when such serious public violations occur.
 
diff --git a/Documentation/process/code-of-conduct.rst b/Documentation/process/code-of-conduct.rst
index be50294aebd5d..e5e29c068f2b5 100644
--- a/Documentation/process/code-of-conduct.rst
+++ b/Documentation/process/code-of-conduct.rst
@@ -34,7 +34,7 @@ Examples of unacceptable behavior by participants include:
 * Public or private harassment
 * Publishing others’ private information, such as a physical or electronic
   address, without explicit permission
-* Other conduct which could reasonably be considered inappropriate in a
+* Other conduct that could reasonably be considered inappropriate in a
   professional setting
 
 
-- 
2.50.1 (Apple Git-155)

