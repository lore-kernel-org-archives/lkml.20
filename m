Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CC3F076C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338701; cv=none; b=qrQFKx12ZWMHCUqVKjvOk7p0EXm9NnuYDRFAoQ8CU8Ye+MOFpl5VIRFEX45VtYTl+b1NfEStJBKb5oY+6UcrUE2WXRHLq0CTbyr+JwlzU2JuaLlb+hFKisV1pru3tCf5Uie6j7nLqxMYBcz6ooIQuAYoPU3aP0Y9t0/b6bXEL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338701; c=relaxed/simple;
	bh=hTfSR6lRRTgHCfvXNSsQon3UjqxmuaAmVRnqcmQJa+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Svmp0ZO9UmDcJbnXJtiBtv4jNj65OyJLQ6uV3YkZqpsg4Q52ITitoA1s1CF7QjgrDoMzwRt/gpitUfI3lBt3Bb8fQqgW2agrSVZQJ06YgGW9sB2BLj3X2rzkb7RHNpKsu8gVVJ+ufgEEPbZTokohOD0rnO/n8OQj8pQu4+oPFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmkr953q; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmkr953q"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso695320a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338696; x=1788943496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezxtdztmw1JvTNP/EpaDJJlpXXjoASMUAtdTi0A+/qQ=;
        b=Nmkr953qrCipNecQr3UqqT0DbcASU8ViUBU7LgRz+IUMpEgfctam35LjaGJTdm+mKn
         pH/PPW0/MICcLJBotE1ZxVbPIj6EWSbSGalTtp9i3FoiloTnz7k97xypvXx67mRmJd5K
         g+BpVN5fzC5PCMHEgW3UdNCRSM1Lbkgnw3K98BwhAeBNQyGPMlyQHuykuHHOWsdzzcGb
         OyQsBo6Brh6BwXxmYH7S7O8tyYW3fW9hKAxOMU1LcIVNMa67G+bny6eiuW0niic/LtRT
         Q8gne9EVuOe0ZzielKN7uG4ADHvTxvUz9v+M51mcuLdY7wgd93BYWLA3ODugCtytD9EG
         KpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338696; x=1788943496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezxtdztmw1JvTNP/EpaDJJlpXXjoASMUAtdTi0A+/qQ=;
        b=hS1weHvHNXuueEGoggnoWkC97qR8+dQSE4wmg80n12cT3OoiMtQpLpeHUpy3AjH6+L
         iRvCNC9l3I6JEmcDJw+fM6YjR/tkfAbSm8dsQ1Y2dunOLnDTx3GLhhW0B+wyWbTb/Svm
         LrcKTTWD/L4YkscKEb40/ecCPY2JJPRQH9YLnGyZC9eXL/esr79obJsaFKhbzBKJzHOr
         BahXSOOo2w5p0+BdkfTEu9eY1mUcD/uAsv6PAWMnlJVRqtrEQ1JkjKmdfT6KrT12rQFi
         mT44ywMu1Nkbn9UcHUC8OL9/089RhdKfXWAP3eVM4n8TNI4FO5vsFPXop3M6u32r7AFm
         IewA==
X-Forwarded-Encrypted: i=1; AKwUvBylblHYmj3seBTdo16SNFs+N9gXLk/uqQFJvCa8L0+CVrdjNbTZwkUygA9psIl7u/NacbkcbRA1dyhTQXw=@vger.kernel.org
X-Gm-Message-State: AFuF++lpR714WRSzCTqk+DJf6gVwfdyfTStZQUyg0SBFQLXLhbcPK8HZ
	8jwKPB7WS3MUkRMePJ9c1Cotw211Xl6+/N8WR7QDxKRIiH7t9f5VpRvC
X-Gm-Gg: AYBFou1XEOmMcA7PvCzHhh6EdgVz+m1ryrCDbW4yAwNqIoMZW+S3IzUYmCfT+GL/3kh
	jctGNM/37Re5zOErMGtmmPcCqPnYH08YQCjxfYXxeg7Bp6tQ32TtAxdLCMl20pMbVOWhsF2nD6x
	eP5vCsW2BGISdYSdB5DoEWx3XLQii2MnBylLS21G0mARCKDYB54TClBs3wEzoJfUHq5JPxC9XFt
	4eds4S05mMR8UXWdbDc9UHBZGvqDl/IEUX6MzUqL+Q05/6YNOHH76XAcKgAkS+Zull8N2N0S1+n
	BY2ctfKcaZ/8KMayZeQlLG8Ihh2cb3qAon97+k+nkmVzLVh/0ULs1LgzcbyL6KLbhFROW8apUTd
	UaHrhxoCzj0FRgiXsJa4P/tEv9UNocrQt8zHDJOnbWffklHdLqQlYJQrMHTfwKV6tfymwHbeam+
	BlRfOizzPI2qXYFREjSYHZ8HH3RC7jGIkje6Z0gxl5Z03bnPqD7DGFQqnSqlBLq8bK1DtDGRkpY
	eyTEtB83ilSgEAyC9a3e0/ZUVtDLQ==
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr5011923a91.18.1788338696036;
        Wed, 02 Sep 2026 01:44:56 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:54 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 3/5] Documentation: process: Refine language, tone, and grammar in subsequent files
Date: Wed,  2 Sep 2026 15:44:01 +0700
Message-ID: <20260902084430.17248-4-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902084430.17248-1-ducthinh100812@gmail.com>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply a sweep across four additional process documentation files.
Expand conversational contractions to their formal forms,
correct minor punctuation faults, and polish the phrasing to
ensure a clear, consistent tone.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/7.AdvancedTopics.rst   | 32 ++++++------
 Documentation/process/8.Conclusion.rst       |  4 +-
 Documentation/process/applying-patches.rst   | 20 ++++----
 Documentation/process/botching-up-ioctls.rst | 54 ++++++++++----------
 4 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/Documentation/process/7.AdvancedTopics.rst b/Documentation/process/7.AdvancedTopics.rst
index 066655e5d536c..e85a4f33795f1 100644
--- a/Documentation/process/7.AdvancedTopics.rst
+++ b/Documentation/process/7.AdvancedTopics.rst
@@ -5,7 +5,7 @@ Advanced topics
 
 At this point, hopefully, you have a handle on how the development process
 works.  There is still more to learn, however!  This section will cover a
-number of topics which can be helpful for developers wanting to become a
+number of topics that can be helpful for developers wanting to become a
 regular part of the Linux kernel development process.
 
 Managing patches with Git
@@ -52,23 +52,23 @@ exercise while coming up to speed.
 When you are ready to start putting up Git trees for others to look at, you
 will, of course, need a server that can be pulled from.  Setting up such a
 server with git-daemon is relatively straightforward if you have a system
-which is accessible to the Internet.  Otherwise, free, public hosting sites
+that is accessible to the Internet.  Otherwise, free, public hosting sites
 (GitHub, for example) are starting to appear on the net.  Established
 developers can get an account on kernel.org, but those are not easy to come
 by; see https://kernel.org/faq/ for more information.
 
 The normal Git workflow involves the use of a lot of branches.  Each line
 of development can be separated into a separate "topic branch" and
-maintained independently.  Branches in Git are cheap, there is no reason to
-not make free use of them.  And, in any case, you should not do your
-development in any branch which you intend to ask others to pull from.
+maintained independently.  Branches in Git are cheap, there is no reason not
+to make free use of them.  And, in any case, you should not do your
+development in any branch that you intend to ask others to pull from.
 Publicly-available branches should be created with care; merge in patches
 from development branches when they are in complete form and ready to go -
 not before.
 
 Git provides some powerful tools which can allow you to rewrite your
-development history.  An inconvenient patch (one which breaks bisection,
-say, or which has some other sort of obvious bug) can be fixed in place or
+development history.  An inconvenient patch (one that breaks bisection,
+say, or that has some other sort of obvious bug) can be fixed in place or
 made to disappear from the history entirely.  A patch series can be
 rewritten as if it had been written on top of today's mainline, even though
 you have been working on it for months.  Changes can be transparently
@@ -81,22 +81,22 @@ a simple obsession for the creation of the perfect project history.
 Rewriting history will rewrite the changes contained in that history,
 turning a tested (hopefully) kernel tree into an untested one.  But, beyond
 that, developers cannot easily collaborate if they do not have a shared
-view of the project history; if you rewrite history which other developers
+view of the project history; if you rewrite history that other developers
 have pulled into their repositories, you will make life much more difficult
 for those developers.  So a simple rule of thumb applies here: history
-which has been exported to others should generally be seen as immutable
+that has been exported to others should generally be seen as immutable
 thereafter.
 
 So, once you push a set of changes to your publicly-available server, those
 changes should not be rewritten.  Git will attempt to enforce this rule if
-you try to push changes which do not result in a fast-forward merge
+you try to push changes that do not result in a fast-forward merge
 (i.e. changes which do not share the same history).  It is possible to
 override this check, and there may be times when it is necessary to rewrite
 an exported tree.  Moving changesets between trees to avoid conflicts in
 linux-next is one example.  But such actions should be rare.  This is one
 of the reasons why development should be done in private branches (which
 can be rewritten if necessary) and only moved into public branches when
-it's in a reasonably advanced state.
+it is in a reasonably advanced state.
 
 As the mainline (or other tree upon which a set of changes is based)
 advances, it is tempting to merge with that tree to stay on the leading
@@ -109,11 +109,11 @@ generally only at specific release points (such as a mainline -rc
 release).  If you are nervous about specific changes, you can always
 perform test merges in a private branch.  The git "rerere" tool can be
 useful in such situations; it remembers how merge conflicts were resolved
-so that you don't have to do the same work twice.
+so that you do not have to do the same work twice.
 
 One of the biggest recurring complaints about tools like Git is this: the
 mass movement of patches from one repository to another makes it easy to
-slip in ill-advised changes which go into the mainline below the review
+slip in ill-advised changes that go into the mainline below the review
 radar.  Kernel developers tend to get unhappy when they see that kind of
 thing happening; putting up a Git tree with unreviewed or off-topic patches
 can affect your ability to get trees pulled in the future.  Quoting Linus:
@@ -135,7 +135,7 @@ occasional summary of the tree to the relevant list, and, when the time is
 right, request that the tree be included in linux-next.
 
 If and when others start to send patches for inclusion into your tree,
-don't forget to review them.  Also ensure that you maintain the correct
+do not forget to review them.  Also ensure that you maintain the correct
 authorship information; the git "am" tool does its best in this regard, but
 you may have to add a "From:" line to the patch if it has been relayed to
 you via a third party.
@@ -161,7 +161,7 @@ whole.
 
 Reviewing code can be an intimidating prospect, especially for a new kernel
 developer who may well feel nervous about questioning code - in public -
-which has been posted by those with more experience.  Even code written by
+that has been posted by those with more experience.  Even code written by
 the most experienced developers can be improved, though.  Perhaps the best
 piece of advice for reviewers (all reviewers) is this: phrase review
 comments as questions rather than criticisms.  Asking "how does the lock
@@ -191,6 +191,6 @@ submission and it looks good to me."
 Some form of a review message or reply is obviously necessary otherwise
 maintainers will not know that the reviewer has looked at the patch at all!
 
-Last but not least patch review may become a negative process, focused
+Last but not least, patch review may become a negative process, focused
 on pointing out problems. Please throw in a compliment once in a while,
 particularly for newbies!
diff --git a/Documentation/process/8.Conclusion.rst b/Documentation/process/8.Conclusion.rst
index 8c847dffe76b2..10b6fed20a4be 100644
--- a/Documentation/process/8.Conclusion.rst
+++ b/Documentation/process/8.Conclusion.rst
@@ -4,7 +4,7 @@ For more information
 ====================
 
 There are numerous sources of information on Linux kernel development and
-related topics.  First among those will always be the Documentation
+related topics.  First among these will always be the Documentation
 directory found in the kernel source distribution.  Start with the
 top-level :ref:`process/howto.rst <process_howto>`; also read
 :ref:`process/submitting-patches.rst <submittingpatches>`. Many internal
@@ -56,7 +56,7 @@ Congratulations to anybody who has made it through this long-winded
 document.  Hopefully it has provided a helpful understanding of how the
 Linux kernel is developed and how you can participate in that process.
 
-In the end, it's the participation that matters.  Any open source software
+In the end, it is the participation that matters.  Any open source software
 project is no more than the sum of what its contributors put into it.  The
 Linux kernel has progressed as quickly and as well as it has because it has
 been helped by an impressively large group of developers, all of whom are
diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3b..5b8cbf3375655 100644
--- a/Documentation/process/applying-patches.rst
+++ b/Documentation/process/applying-patches.rst
@@ -9,7 +9,7 @@ Original by:
 .. note::
 
    This document is obsolete.  In most cases, rather than using ``patch``
-   manually, you'll almost certainly want to look at using Git instead.
+   manually, you will almost certainly want to look at using Git instead.
 
 A frequently asked question on the Linux Kernel Mailing List is how to apply
 a patch to the kernel or, more specifically, what base kernel a patch for
@@ -28,7 +28,7 @@ A patch is a small text document containing a delta of changes between two
 different versions of a source tree. Patches are created with the ``diff``
 program.
 
-To correctly apply a patch you need to know what base it was generated from
+To correctly apply a patch, you need to know what base it was generated from
 and what new version the patch will change the source tree into. These
 should both be present in the patch file metadata or be possible to deduce
 from the filename.
@@ -75,7 +75,7 @@ via stdin using the following syntax::
 
 	patch -p1 < path/to/patch-x.y.z
 
-If you just want to be able to follow the examples below and don't want to
+If you just want to be able to follow the examples below and do not want to
 know of more than one way to use patch, then you can stop reading this
 section here.
 
@@ -84,7 +84,7 @@ this::
 
 	patch -p1 -i path/to/patch-x.y.z
 
-If your patch file is compressed with gzip or xz and you don't want to
+If your patch file is compressed with gzip or xz and you do not want to
 uncompress it before applying it, then you can feed it to patch like this
 instead::
 
@@ -104,7 +104,7 @@ patch via stdin or the ``-i`` argument, as you prefer.
 A few other nice arguments for patch are ``-s`` which causes patch to be silent
 except for errors which is nice to prevent errors from scrolling out of the
 screen too fast, and ``--dry-run`` which causes patch to just print a listing of
-what would happen, but doesn't actually make any changes. Finally ``--verbose``
+what would happen, but does not actually make any changes. Finally ``--verbose``
 tells patch to print more information about the work being done.
 
 
@@ -118,7 +118,7 @@ Checking that the file looks like a valid patch file and checking the code
 around the bits being modified matches the context provided in the patch are
 just two of the basic sanity checks patch does.
 
-If patch encounters something that doesn't look quite right it has two
+If patch encounters something that does not look quite right it has two
 options. It can either refuse to apply the changes and abort or it can try
 to find a way to make the patch apply with a few minor changes.
 
@@ -133,7 +133,7 @@ usually adjust the line numbers and apply the patch.
 Whenever patch applies a patch that it had to modify a bit to make it fit
 it'll tell you about it by saying the patch applied with **fuzz**.
 You should be wary of such changes since even though patch probably got it
-right it doesn't /always/ get it right, and the result will sometimes be
+right it does not /always/ get it right, and the result will sometimes be
 wrong.
 
 When patch encounters a change that it can't fix up with fuzz it rejects it
@@ -141,7 +141,7 @@ outright and leaves a file with a ``.rej`` extension (a reject file). You can
 read this file to see exactly what change couldn't be applied, so you can
 go fix it up by hand if you wish.
 
-If you don't have any third-party patches applied to your kernel source, but
+If you do not have any third-party patches applied to your kernel source, but
 only patches from kernel.org and you apply the patches in the correct order,
 and have made no modifications yourself to the source files, then you should
 never see a fuzz or reject message from patch. If you do see such messages
@@ -154,7 +154,7 @@ Let's look a bit more at some of the messages patch can produce.
 
 If patch stops and presents a ``File to patch:`` prompt, then patch could not
 find a file to be patched. Most likely you forgot to specify -p1 or you are
-in the wrong directory. Less often, you'll find patches that need to be
+in the wrong directory. Less often, you will find patches that need to be
 applied with ``-p0`` instead of ``-p1`` (reading the patch file should reveal if
 this is the case -- if so, then this is an error by the person who created
 the patch but is not fatal).
@@ -412,7 +412,7 @@ tree. The Subsystem maintainers push their patches first to linux-next,
 and, during the merge window, sends them directly to Linus.
 
 The -mm patches serve as a sort of proving ground for new features and other
-experimental patches that aren't merged via a subsystem tree.
+experimental patches that are not merged via a subsystem tree.
 Once such patches has proved its worth in -mm for a while Andrew pushes
 it on to Linus for inclusion in mainline.
 
diff --git a/Documentation/process/botching-up-ioctls.rst b/Documentation/process/botching-up-ioctls.rst
index a05e8401de1c7..d9f9d4450debb 100644
--- a/Documentation/process/botching-up-ioctls.rst
+++ b/Documentation/process/botching-up-ioctls.rst
@@ -10,8 +10,8 @@ One clear insight kernel graphics hackers gained in the past few years is that
 trying to come up with a unified interface to manage the execution units and
 memory on completely different GPUs is a futile effort. So nowadays every
 driver has its own set of ioctls to allocate memory and submit work to the GPU.
-Which is nice, since there's no more insanity in the form of fake-generic, but
-actually only used once interfaces. But the clear downside is that there's much
+Which is nice, since there is no more insanity in the form of fake-generic 
+interfaces that are actually used only once. But the clear downside is that there is much
 more potential to screw things up.
 
 To avoid repeating all the same mistakes again I've written up some of the
@@ -24,14 +24,14 @@ something every GPU driver has to do on its own.
 Prerequisites
 -------------
 
-First the prerequisites. Without these you have already failed, because you
+First, the prerequisites. Without these you have already failed, because you
 will need to add a 32-bit compat layer:
 
  * Only use fixed sized integers. To avoid conflicts with typedefs in userspace
    the kernel has special types like __u32, __s64. Use them.
 
  * Align everything to the natural size and use explicit padding. 32-bit
-   platforms don't necessarily align 64-bit values to 64-bit boundaries, but
+   platforms do not necessarily align 64-bit values to 64-bit boundaries, but
    64-bit platforms do. So we always need padding to the natural size to get
    this right.
 
@@ -58,18 +58,18 @@ pain. And since getting things wrong on the first attempt is guaranteed you
 will have a second iteration or at least an extension for any given interface.
 
  * Have a clear way for userspace to figure out whether your new ioctl or ioctl
-   extension is supported on a given kernel. If you can't rely on old kernels
+   extension is supported on a given kernel. If you cannot rely on old kernels
    rejecting the new flags/modes or ioctls (since doing that was botched in the
    past) then you need a driver feature flag or revision number somewhere.
 
  * Have a plan for extending ioctls with new flags or new fields at the end of
    the structure. The drm core checks the passed-in size for each ioctl call
    and zero-extends any mismatches between kernel and userspace. That helps,
-   but isn't a complete solution since newer userspace on older kernels won't
-   notice that the newly added fields at the end get ignored. So this still
+   but is not a complete solution since newer userspace on older kernels won't
+   notice that the newly added fields at the end that get ignored. So this still
    needs a new driver feature flags.
 
- * Check all unused fields and flags and all the padding for whether it's 0,
+ * Check all unused fields, flags and padding to verify that they are 0,
    and reject the ioctl if that's not the case. Otherwise your nice plan for
    future extensions is going right down the gutters since someone will submit
    an ioctl struct with random stack garbage in the yet unused parts. Which
@@ -84,7 +84,7 @@ will have a second iteration or at least an extension for any given interface.
 Fun with Error Paths
 --------------------
 
-Nowadays we don't have any excuse left any more for drm drivers being neat
+Nowadays we do not have any excuse left any more for drm drivers being neat
 little root exploits. This means we both need full input validation and solid
 error handling paths - GPUs will die eventually in the oddmost corner cases
 anyway:
@@ -100,27 +100,27 @@ anyway:
    Check that the error code matches your expectations. And finally make sure
    that you only test for one single error path in each subtest by submitting
    otherwise perfectly valid data. Without this an earlier check might reject
-   the ioctl already and shadow the codepath you actually want to test, hiding
+   the ioctl already and shadow the code path that you actually want to test, hiding
    bugs and regressions.
 
  * Make all your ioctls restartable. First X really loves signals and second
    this will allow you to test 90% of all error handling paths by just
    interrupting your main test suite constantly with signals. Thanks to X's
-   love for signal you'll get an excellent base coverage of all your error
+   love for signal you will get an excellent base coverage of all your error
    paths pretty much for free for graphics drivers. Also, be consistent with
    how you handle ioctl restarting - e.g. drm has a tiny drmIoctl helper in its
    userspace library. The i915 driver botched this with the set_tiling ioctl,
    now we're stuck forever with some arcane semantics in both the kernel and
    userspace.
 
- * If you can't make a given codepath restartable make a stuck task at least
-   killable. GPUs just die and your users won't like you more if you hang their
+ * If you cannot make a given codepath restartable make a stuck task at least
+   killable. GPUs just die and your users will not like you more if you hang their
    entire box (by means of an unkillable X process). If the state recovery is
    still too tricky have a timeout or hangcheck safety net as a last-ditch
    effort in case the hardware has gone bananas.
 
  * Have testcases for the really tricky corner cases in your error recovery code
-   - it's way too easy to create a deadlock between your hangcheck code and
+   - it is way too easy to create a deadlock between your hangcheck code and
    waiters.
 
 
@@ -129,10 +129,10 @@ Time, Waiting and Missing it
 
 GPUs do most everything asynchronously, so we have a need to time operations and
 wait for outstanding ones. This is really tricky business; at the moment none of
-the ioctls supported by the drm/i915 get this fully right, which means there's
-still tons more lessons to learn here.
+the ioctls supported by the drm/i915 get this fully right, which means there are
+still many lessons to learn here.
 
- * Use CLOCK_MONOTONIC as your reference time, always. It's what alsa, drm and
+ * Use CLOCK_MONOTONIC as your reference time, always. It is what alsa, drm and
    v4l use by default nowadays. But let userspace know which timestamps are
    derived from different clock domains like your main system clock (provided
    by the kernel) or some independent hardware counter somewhere else. Clocks
@@ -141,8 +141,8 @@ still tons more lessons to learn here.
    get at the raw values of some clocks (e.g. through in-command-stream
    performance counter sampling instructions) consider exposing those also.
 
- * Use __s64 seconds plus __u64 nanoseconds to specify time. It's not the most
-   convenient time specification, but it's mostly the standard.
+ * Use __s64 seconds plus __u64 nanoseconds to specify time. It is not the most
+   convenient time specification, but it is mostly the standard.
 
  * Check that input time values are normalized and reject them if not. Note
    that the kernel native struct ktime has a signed integer for both seconds
@@ -152,7 +152,7 @@ still tons more lessons to learn here.
    ioctl restartable relative timeouts tend to be too coarse and can
    indefinitely extend your wait time due to rounding on each restart.
    Especially if your reference clock is something really slow like the display
-   frame counter. With a spec lawyer hat on this isn't a bug since timeouts can
+   frame counter. With a spec lawyer hat on this is not a bug since timeouts can
    always be extended - but users will surely hate you if their neat animations
    starts to stutter due to this.
 
@@ -185,17 +185,17 @@ entails its own little set of pitfalls:
    explicitly. Only go with a more global per-device namespace if the objects
    are truly device-unique. One counterexample in the drm modeset interfaces is
    that the per-device modeset objects like connectors share a namespace with
-   framebuffer objects, which mostly are not shared at all. A separate
+   framebuffer objects that are generally not shared at all. A separate
    namespace, private by default, for framebuffers would have been more
    suitable.
 
  * Think about uniqueness requirements for userspace handles. E.g. for most drm
-   drivers it's a userspace bug to submit the same object twice in the same
+   drivers it is a userspace bug to submit the same object twice in the same
    command submission ioctl. But then if objects are shareable userspace needs
    to know whether it has seen an imported object from a different process
-   already or not. I haven't tried this myself yet due to lack of a new class
+   already or not. I have not tried this myself yet due to lack of a new class
    of objects, but consider using inode numbers on your shared file descriptors
-   as unique identifiers - it's how real files are told apart, too.
+   as unique identifiers - it is how real files are told apart, too.
    Unfortunately this requires a full-blown virtual filesystem in the kernel.
 
 
@@ -205,10 +205,10 @@ Last, but not Least
 Not every problem needs a new ioctl:
 
  * Think hard whether you really want a driver-private interface. Of course
-   it's much quicker to push a driver-private interface than engaging in
+   it is much quicker to push a driver-private interface than engaging in
    lengthy discussions for a more generic solution. And occasionally doing a
    private interface to spearhead a new concept is what's required. But in the
-   end, once the generic interface comes around you'll end up maintaining two
+   end, once the generic interface comes around you will end up maintaining two
    interfaces. Indefinitely.
 
  * Consider other interfaces than ioctls. A sysfs attribute is much better for
@@ -218,7 +218,7 @@ Not every problem needs a new ioctl:
    disclaimer of not having a stable ABI would be better.
 
 Finally, the name of the game is to get it right on the first attempt, since if
-your driver proves popular and your hardware platforms long-lived then you'll
+your driver proves popular and your hardware platforms long-lived then you will
 be stuck with a given ioctl essentially forever. You can try to deprecate
 horrible ioctls on newer iterations of your hardware, but generally it takes
 years to accomplish this. And then again years until the last user able to
-- 
2.50.1 (Apple Git-155)

