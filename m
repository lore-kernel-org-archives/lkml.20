Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEC3EF0BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338697; cv=none; b=nUeHp/rKIr7GDoHem2a2lWHCugaLRuhz8wsFCRXUFCZXSSX2zz7gnqS8g5AroUDH1cc5tBTia2jIJEPGBpSIwOTWePeUSwts1yJXUdUogWigBRqg8Er/2Fj82klCzXJd1v6uwfyM8qYOHP/zuxupY5Ku5R0uvuuHwpHURbreQr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338697; c=relaxed/simple;
	bh=z5iMusljCvnT4Da+gKyPl5dWGfWHAHZDl+AnXXtfb/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3nGLQFU+AFHUJS6qNygwXzJifa1MyNkmnPX+1XKqmDARAm2JuX4fwzzTdrfCVNsvKPEh5xcSDWvuhKIIO1BFL2kcuy2j0a+OgpPbIIQ3knh4KrzKupF9dCxrIIM9olYHundvEKKY1x8RAbWnzcjOufzScGIJKtM3L432k7DYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNrpfKxH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNrpfKxH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso979894a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338690; x=1788943490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQcGZ0F2oJgL1FAwfbiq3IvyL2PT64kaQuA2R1hyPdE=;
        b=aNrpfKxH4n/gP5Tu7rcAGHkW76H0Y9hAJ9KcUaRyXQxunueUEPyKFZvZcJrgvBDE/0
         kSD6yfPIcKyuMpNI9JvC4qz7QG2R5atvCmFVXwIDBdY+hBMtLmGG9N8OC4xIrT7GUp2f
         x9EzgWsSRvBwtp7hKQlGwPerbQh9Nc8pPtrdzgixUCopB+KVxaLijCyCSl5yPuxuC5Y2
         M5GhxdksPtM0jLoKWITeGEWqTziiEBMyDZG/Drss4Itg+CPHsFKvxvfO8fYfBDm1ikUD
         Gw6pU6rGWasT5FNcQpO8vb23w2QqPWWyjUB+eDH6JQwIZzA5Yjz6SVlIoy4/n1Zuwz3W
         Iazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338690; x=1788943490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQcGZ0F2oJgL1FAwfbiq3IvyL2PT64kaQuA2R1hyPdE=;
        b=ZxsKVXOVeQeUsLjeXsOi6H379JAakrAIJdQbWr7wOpduTTGMH2ivH6jtYOh1HgwTd+
         ua6yzStralJvWJ2zCvbCvRdvB+dt3eEv8cXvyekOV8DM7RmtvAF5enj5qSrMTohd6AS7
         A0qo4NanDHv9tULc3a4a/0ktNWcvM9qxsqd8qqkNUwT1JqlnzKGKuhSB2a9jKeQPET4F
         SERAgTxsI3xJPqmmMdcHJWPJmplHBUuMtgNFcb9dp6DR194scA4KNpp1uHYOuOmPqvze
         yw234ua9b/1l6EO9ebavOAllfy4ym6mEmCkC5HVaAqKn9e01SiK6gOBFyNpEGrk29uHp
         tMCw==
X-Forwarded-Encrypted: i=1; AKwUvBw/LUXTvIc8z9PZNic7mc7xiE7E6sGqwczNmBwLUKixXfafoPp1S18IT/aBe5v8tfH+w9QK7vKxmKRYlHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mfbtXu7KwfQ9vi1SSqCsEn6dnY0meArkyyK2YgJFpKK/WQZxxg
	xbPI1m5iZ6vC+jvD/Yt3iNygfb9A+coCZV4KExZejm9bcE0jNqULgjDk
X-Gm-Gg: AYBFou3EwvePHzFvOlLT3/3IIKTpz9DndjM2N2CHIpiaP/sXGAb+283hB7VU+NZanvg
	X2qFKpJ9v36sS1rTeTcTb2TbIwzuPI170/+mkCAc6+E7f+RoT7N0UR2AoRa0xAwaRuGzfIi+6Rg
	BtzGzJNJ49CBApCa+YqdKG/zaB1b8j71eXYDPw10sdPO9x8FYYtRAkCNv7pBh0NTrZXvyRXbTc7
	Yp8bfYpUXhXAInLoQXXa/zm03s8tRDXbfS2j8oJjLXNk40fmheRJTBecdOSVjpGRjrxiUPcZebQ
	yfiU6WLn/a0ij21B9fOAxJiOZpV6n0iJdO1cHixACAi7+t5oT+gtJkfK5oEe2Sd2x6wtS576rFJ
	8UG7gD8naeRWyN/pZxWNNBvLWJT/cUd6HyIEKi8yR5XNJrXulbr/yUcwlbQ7LZlAmWsA8p54GSb
	vfnHEUn4GEGOVhJxE341q+yrgHAkHz7OwHo4r6A4LHBNIVazcEEiycq4PRlzjxR3XzTDwL1gvgm
	Q3WnwVE59RqAJdfbsU=
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39aee023191mr5375943a91.10.1788338690056;
        Wed, 02 Sep 2026 01:44:50 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:49 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 2/5] Documentation: process: Clean up grammar and tone in next guide files
Date: Wed,  2 Sep 2026 15:44:00 +0700
Message-ID: <20260902084430.17248-3-ducthinh100812@gmail.com>
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

Perform a thorough copy-editing pass across three more files in the
process documentation directory. Expand informal contractions, correct
minor punctuation oversights, and refine the voice to maintain a
professional tone, especially replacing "which" with "that" in
restrictive clauses.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/2.Process.rst | 22 ++++++-------
 Documentation/process/4.Coding.rst  | 48 ++++++++++++++---------------
 Documentation/process/5.Posting.rst | 34 ++++++++++----------
 3 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index d09fa23d6c42a..2443e0eca3525 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -29,7 +29,7 @@ releases, along with their dates, can be found at `Wikipedia
 
 A relatively straightforward discipline is followed with regard to the
 merging of patches for each release.  At the beginning of each development
-cycle, the "merge window" is said to be open.  At that time, code which is
+cycle, the "merge window" is said to be open.  At that time, code that is
 deemed to be sufficiently stable (and which is accepted by the development
 community) is merged into the mainline kernel.  The bulk of changes for a
 new development cycle (and all of the major changes) will be merged during
@@ -49,7 +49,7 @@ be called 9.x-rc1.  The -rc1 release is the signal that the time to
 merge new features has passed, and that the time to stabilize the next
 kernel has begun.
 
-Over the next six to ten weeks, only patches which fix problems should be
+Over the next six to ten weeks, only patches that fix problems should be
 submitted to the mainline.  On occasion a more significant change will be
 allowed, but such occasions are rare; developers who try to merge new
 features outside of the merge window tend to get an unfriendly reception.
@@ -99,7 +99,7 @@ go out with a handful of known regressions, though, hopefully, none of them
 are serious.
 
 Once a stable release is made, its ongoing maintenance is passed off to the
-"stable team," currently consists of Greg Kroah-Hartman and Sasha Levin. The
+"stable team," which currently consists of Greg Kroah-Hartman and Sasha Levin. The
 stable team will release occasional updates to the stable release using the
 9.x.y numbering scheme.
 
@@ -140,7 +140,7 @@ The lifecycle of a patch
 Patches do not go directly from the developer's keyboard into the mainline
 kernel.  There is, instead, a somewhat involved (if somewhat informal)
 process designed to ensure that each patch is reviewed for quality and that
-each patch implements a change which is desirable to have in the mainline.
+each patch implements a change that is desirable to have in the mainline.
 This process can happen quickly for minor fixes, or, in the case of large
 and controversial changes, go on for years.  Much developer frustration
 comes from a lack of understanding of this process or from attempts to
@@ -185,7 +185,7 @@ The stages that a patch goes through are, generally:
  - Merging into the mainline.  Eventually, a successful patch will be
    merged into the mainline repository managed by Linus Torvalds.  More
    comments and/or problems may surface at this time; it is important that
-   the developer be responsive to these and fix any issues which arise.
+   the developer be responsive to these and fix any issues that arise.
 
  - Stable release.  The number of users potentially affected by the patch
    is now large, so, once again, new problems may arise.
@@ -208,7 +208,7 @@ How patches get into the Kernel
 
 There is exactly one person who can merge patches into the mainline kernel
 repository: Linus Torvalds. But, for example, of the over 9,500 patches
-which went into the 2.6.38 kernel, only 112 (around 1.3%) were directly
+that went into the 2.6.38 kernel, only 112 (around 1.3%) were directly
 chosen by Linus himself. The kernel project has long since grown to a size
 where no single developer could possibly inspect and select every patch
 unassisted. The way the kernel developers have addressed this growth is
@@ -235,7 +235,7 @@ Linus agrees, the stream of patches will flow up into his repository,
 becoming part of the mainline kernel.  The amount of attention that Linus
 pays to specific patches received in a pull operation varies.  It is clear
 that, sometimes, he looks quite closely.  But, as a general rule, Linus
-trusts the subsystem maintainers to not send bad patches upstream.
+trusts subsystem maintainers not to send bad patches upstream.
 
 Subsystem maintainers, in turn, can pull patches from other maintainers.
 For example, the networking tree is built from patches which accumulated
@@ -255,7 +255,7 @@ Next trees
 
 The chain of subsystem trees guides the flow of patches into the kernel,
 but it also raises an interesting question: what if somebody wants to look
-at all of the patches which are being prepared for the next merge window?
+at all of the patches that are being prepared for the next merge window?
 Developers will be interested in what other changes are pending to see
 whether there are any conflicts to worry about; a patch which changes a
 core kernel function prototype, for example, will conflict with any other
@@ -310,7 +310,7 @@ The kernel source tree contains the drivers/staging/ directory, where
 many sub-directories for drivers or filesystems that are on their way to
 being added to the kernel tree live.  They remain in drivers/staging while
 they still need more work; once complete, they can be moved into the
-kernel proper.  This is a way to keep track of drivers that aren't
+kernel proper.  This is a way to keep track of drivers that are not
 up to Linux kernel coding or quality standards, but people may want to use
 them and track development.
 
@@ -349,7 +349,7 @@ for kernel development, in that it performs quite well when dealing with
 large repositories and large numbers of patches.  It also has a reputation
 for being difficult to learn and use, though it has gotten better over
 time.  Some sort of familiarity with Git is almost a requirement for kernel
-developers; even if they do not use it for their own work, they'll need Git
+developers; even if they do not use it for their own work, they will need Git
 to keep up with what other developers (and the mainline) are doing.
 
 Git is now packaged by almost all Linux distributions.  There is a home
@@ -483,7 +483,7 @@ Andrew Morton gives this advice for aspiring kernel developers
 	that the kernel runs perfectly at all times on all machines which
 	you can lay your hands on".  Usually the way to do this is to work
 	with others on getting things fixed up (this can require
-	persistence!) but that's fine - it's a part of kernel development.
+	persistence!) but that is fine - it is a part of kernel development.
 
 (https://lwn.net/Articles/283982/).
 
diff --git a/Documentation/process/4.Coding.rst b/Documentation/process/4.Coding.rst
index c0f57d0c4f733..bdc389f164a0e 100644
--- a/Documentation/process/4.Coding.rst
+++ b/Documentation/process/4.Coding.rst
@@ -5,11 +5,11 @@ Getting the code right
 
 While there is much to be said for a solid and community-oriented design
 process, the proof of any kernel development project is in the resulting
-code.  It is the code which will be examined by other developers and merged
-(or not) into the mainline tree.  So it is the quality of this code which
+code.  It is the code that will be examined by other developers and merged
+(or not) into the mainline tree.  So it is the quality of this code that
 will determine the ultimate success of the project.
 
-This section will examine the coding process.  We'll start with a look at a
+This section will examine the coding process.  We will start with a look at a
 number of ways in which kernel developers can go wrong.  Then the focus
 will shift toward doing things right and the tools which can help in that
 quest.
@@ -25,7 +25,7 @@ The kernel has long had a standard coding style, described in
 :ref:`Documentation/process/coding-style.rst <codingstyle>`.  For much of
 that time, the policies described in that file were taken as being, at most,
 advisory.  As a result, there is a substantial amount of code in the kernel
-which does not meet the coding style guidelines.  The presence of that code
+that does not meet the coding style guidelines.  The presence of that code
 leads to two independent hazards for kernel developers.
 
 The first of these is to believe that the kernel coding standards do not
@@ -43,7 +43,7 @@ win before the code can be merged.  Putting code into the kernel means
 giving up a degree of control in a number of ways - including control over
 how the code is formatted.
 
-The other trap is to assume that code which is already in the kernel is
+The other trap is to assume that code that is already in the kernel is
 urgently in need of coding style fixes.  Developers may start to generate
 reformatting patches as a way of gaining familiarity with the process, or
 as a way of getting their name into the kernel changelogs - or both.  But
@@ -82,10 +82,10 @@ But experience has shown that excessive or premature abstraction can be
 just as harmful as premature optimization.  Abstraction should be used to
 the level required and no further.
 
-At a simple level, consider a function which has an argument which is
+At a simple level, consider a function that has an argument that is
 always passed as zero by all callers.  One could retain that argument just
 in case somebody eventually needs to use the extra flexibility that it
-provides.  By that time, though, chances are good that the code which
+provides.  By that time, though, chances are good that the code that
 implements this extra argument has been broken in some subtle way which was
 never noticed - because it has never been used.  Or, when the need for
 extra flexibility arises, it does not do so in a way which matches the
@@ -111,12 +111,12 @@ replicating the same code throughout the kernel.
 The C preprocessor seems to present a powerful temptation to some C
 programmers, who see it as a way to efficiently encode a great deal of
 flexibility into a source file.  But the preprocessor is not C, and heavy
-use of it results in code which is much harder for others to read and
+use of it results in code that is much harder for others to read and
 harder for the compiler to check for correctness.  Heavy preprocessor use
-is almost always a sign of code which needs some cleanup work.
+is almost always a sign of code that needs some cleanup work.
 
 Conditional compilation with #ifdef is, indeed, a powerful feature, and it
-is used within the kernel.  But there is little desire to see code which is
+is used within the kernel.  But there is little desire to see code that is
 sprinkled liberally with #ifdef blocks.  As a general rule, #ifdef use
 should be confined to header files whenever possible.
 Conditionally-compiled code can be confined to functions which, if the code
@@ -127,7 +127,7 @@ code which is easier to follow.
 C preprocessor macros present a number of hazards, including possible
 multiple evaluation of expressions with side effects and no type safety.
 If you are tempted to define a macro, consider creating an inline function
-instead.  The code which results will be the same, but inline functions are
+instead.  The code that results will be the same, but inline functions are
 easier to read, do not evaluate their arguments multiple times, and allow
 the compiler to perform type checking on the arguments and return value.
 
@@ -149,7 +149,7 @@ example of premature optimization.
 In general, kernel programmers ignore cache effects at their peril.  The
 classic time/space tradeoff taught in beginning data structures classes
 often does not apply to contemporary hardware.  Space *is* time, in that a
-larger program will run slower than one which is more compact.
+larger program will run slower than one that is more compact.
 
 More recent compilers take an increasingly active role in deciding whether
 a given function should actually be inlined or not.  So the liberal
@@ -181,12 +181,12 @@ single-processor systems, work being done to improve responsiveness will
 raise the level of concurrency within the kernel.  The days when kernel
 code could be written without thinking about locking are long past.
 
-Any resource (data structures, hardware registers, etc.) which could be
+Any resource (data structures, hardware registers, etc.) that could be
 accessed concurrently by more than one thread must be protected by a lock.
 New code should be written with this requirement in mind; retrofitting
 locking after the fact is a rather more difficult task.  Kernel developers
 should take the time to understand the available locking primitives well
-enough to pick the right tool for the job.  Code which shows a lack of
+enough to pick the right tool for the job.  Code that shows a lack of
 attention to concurrency will have a difficult path into the mainline.
 
 
@@ -194,10 +194,10 @@ Regressions
 ***********
 
 One final hazard worth mentioning is this: it can be tempting to make a
-change (which may bring big improvements) which causes something to break
+change (which may bring big improvements) that causes something to break
 for existing users.  This kind of change is called a "regression," and
 regressions have become most unwelcome in the mainline kernel.  With few
-exceptions, changes which cause regressions will be backed out if the
+exceptions, changes that cause regressions will be backed out if the
 regression cannot be fixed in a timely manner.  Far better to avoid the
 regression in the first place.
 
@@ -232,8 +232,8 @@ For now, at least, the writing of error-free code remains an ideal that few
 of us can reach.  What we can hope to do, though, is to catch and fix as
 many of those errors as possible before our code goes into the mainline
 kernel.  To that end, the kernel developers have put together an impressive
-array of tools which can catch a wide variety of obscure problems in an
-automated way.  Any problem caught by the computer is a problem which will
+array of tools that can catch a wide variety of obscure problems in an
+automated way.  Any problem caught by the computer is a problem that will
 not afflict a user later on, so it stands to reason that the automated
 tools should be used whenever possible.
 
@@ -248,7 +248,7 @@ its cause.
 Note that not all compiler warnings are enabled by default.  Build the
 kernel with "make KCFLAGS=-W" to get the full set.
 
-The kernel provides several configuration options which turn on debugging
+The kernel provides several configuration options that turn on debugging
 features; most of these are found in the "kernel hacking" submenu.  Several
 of these options should be turned on for any kernel used for development or
 testing purposes.  In particular, you should turn on:
@@ -259,7 +259,7 @@ testing purposes.  In particular, you should turn on:
 
  - DEBUG_OBJECTS will add code to track the lifetime of various objects
    created by the kernel and warn when things are done out of order.  If
-   you are adding a subsystem which creates (and exports) complex objects
+   you are adding a subsystem that creates (and exports) complex objects
    of its own, consider adding support for the object debugging
    infrastructure.
 
@@ -288,13 +288,13 @@ locking should be run with lockdep enabled before being submitted for
 inclusion.
 
 As a diligent kernel programmer, you will, beyond doubt, check the return
-status of any operation (such as a memory allocation) which can fail.  The
+status of any operation (such as a memory allocation) that can fail.  The
 fact of the matter, though, is that the resulting failure recovery paths
 are, probably, completely untested.  Untested code tends to be broken code;
 you could be much more confident of your code if all those error-handling
 paths had been exercised a few times.
 
-The kernel provides a fault injection framework which can do exactly that,
+The kernel provides a fault injection framework that can do exactly that,
 especially where memory allocations are involved.  With fault injection
 enabled, a configurable percentage of memory allocations will be made to
 fail; these failures can be restricted to a specific range of code.
@@ -348,7 +348,7 @@ understand the patch.  Be sure that the changelog says *why* the patch is
 worth applying; a surprising number of developers fail to provide that
 information.
 
-Any code which adds a new user-space interface - including new sysfs or
+Any code that adds a new user-space interface - including new sysfs or
 /proc files - should include documentation of that interface which enables
 user-space developers to know what they are working with.  See
 Documentation/ABI/README for a description of how this documentation should
@@ -385,7 +385,7 @@ be accompanied by a line explaining why the barrier is necessary.  The
 locking rules for data structures generally need to be explained somewhere.
 Major data structures need comprehensive documentation in general.
 Non-obvious dependencies between separate bits of code should be pointed
-out.  Anything which might tempt a code janitor to make an incorrect
+out.  Anything that might tempt a code janitor to make an incorrect
 "cleanup" needs a comment saying why it is done the way it is.  And so on.
 
 
diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index b8a449980452e..b33d9563f69bb 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -6,7 +6,7 @@ Posting patches
 Sooner or later, the time comes when your work is ready to be presented to
 the community for review and, eventually, inclusion into the mainline
 kernel.  Unsurprisingly, the kernel development community has evolved a set
-of conventions and procedures which are used in the posting of patches;
+of conventions and procedures that are used in the posting of patches;
 following them will make life much easier for everybody involved.  This
 document will attempt to cover these expectations in reasonable detail;
 more information can also be found in the files
@@ -24,17 +24,17 @@ feedback from the community before the work is complete.  So you should
 consider posting in-progress work, or even making a Git tree available so
 that interested developers can catch up with your work at any time.
 
-When posting code which is not yet considered ready for inclusion, it is a
+When posting code that is not yet considered ready for inclusion, it is a
 good idea to say so in the posting itself.  Also mention any major work
-which remains to be done and any known problems.  Fewer people will look at
-patches which are known to be half-baked, but those who do will come in
+that remains to be done and any known problems.  Fewer people will look at
+patches that are known to be half-baked, but those who do will come in
 with the idea that they can help you drive the work in the right direction.
 
 
 Before creating patches
 -----------------------
 
-There are a number of things which should be done before you consider
+There are a number of things that should be done before you consider
 sending patches to the development community.  These include:
 
  - Test the code to the extent that you can.  Make use of the kernel's
@@ -85,12 +85,12 @@ Only the most simple changes should be formatted as a single patch;
 everything else should be made as a logical series of changes.  Splitting
 up patches is a bit of an art; some developers spend a long time figuring
 out how to do it in the way that the community expects.  There are a few
-rules of thumb, however, which can help considerably:
+rules of thumb, however, that can help considerably:
 
  - The patch series you post will almost certainly not be the series of
    changes found in your working revision control system.  Instead, the
    changes you have made need to be considered in their final form, then
-   split apart in ways which make sense.  The developers are interested in
+   split apart in ways that make sense.  The developers are interested in
    discrete, self-contained changes, not the path you took to get to those
    changes.
 
@@ -98,7 +98,7 @@ rules of thumb, however, which can help considerably:
    patch.  These changes can be small ("add a field to this structure") or
    large (adding a significant new driver, for example), but they should be
    conceptually small and amenable to a one-line description.  Each patch
-   should make a specific change which can be reviewed on its own and
+   should make a specific change that can be reviewed on its own and
    verified to do what it says it does.
 
  - As a way of restating the guideline above: do not mix different types of
@@ -107,7 +107,7 @@ rules of thumb, however, which can help considerably:
    good chance that it will be passed over and the important fix will be
    lost.
 
- - Each patch should yield a kernel which builds and runs properly; if your
+ - Each patch should yield a kernel that builds and runs properly; if your
    patch series is interrupted in the middle, the result should still be a
    working kernel.  Partial application of a patch series is a common
    scenario when the "git bisect" tool is used to find regressions; if the
@@ -115,7 +115,7 @@ rules of thumb, however, which can help considerably:
    users who are engaging in the noble work of tracking down problems.
 
  - Do not overdo it, though.  One developer once posted a set of edits
-   to a single file as 500 separate patches - an act which did not make him
+   to a single file as 500 separate patches - an act that did not make him
    the most popular person on the kernel mailing list.  A single patch can
    be reasonably large as long as it still contains a single *logical*
    change.
@@ -125,11 +125,11 @@ rules of thumb, however, which can help considerably:
    in the series enables the whole thing.  This temptation should be
    avoided if possible; if that series adds regressions, bisection will
    finger the last patch as the one which caused the problem, even though
-   the real bug is elsewhere.  Whenever possible, a patch which adds new
+   the real bug is elsewhere.  Whenever possible, a patch that adds new
    code should make that code active immediately.
 
 Working to create the perfect patch series can be a frustrating process
-which takes quite a bit of time and thought after the "real work" has been
+that takes quite a bit of time and thought after the "real work" has been
 done.  When done properly, though, it is time well spent.
 
 
@@ -137,7 +137,7 @@ Patch formatting and changelogs
 -------------------------------
 
 So now you have a perfect series of patches for posting, but the work is
-not done quite yet.  Each patch needs to be formatted into a message which
+not done quite yet.  Each patch needs to be formatted into a message that
 quickly and clearly communicates its purpose to the rest of the world.  To
 that end, each patch will be composed of the following:
 
@@ -164,7 +164,7 @@ that end, each patch will be composed of the following:
    the author of the patch.  Tags will be described in more detail below.
 
 The items above, together, form the changelog for the patch.  Writing good
-changelogs is a crucial but often-neglected art; it's worth spending
+changelogs is a crucial but often-neglected art; it is worth spending
 another moment discussing this issue.  When writing a changelog, you should
 bear in mind that a number of different people will be reading your words.
 These include subsystem maintainers and reviewers who need to decide
@@ -274,7 +274,7 @@ The tags in common use are:
 
 Be careful in the addition of the aforementioned tags to your patches, as all
 except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
-person named. For those three implicit permission is sufficient if the person
+person named. For those three, implicit permission is sufficient if the person
 contributed to the Linux kernel using that name and email address according
 to the lore archives or the commit history -- and in case of Reported-by:
 and Suggested-by: did the reporting or suggestion in public. Note,
@@ -303,7 +303,7 @@ take care of:
    comes up with.  Please bear in mind that checkpatch.pl, while being the
    embodiment of a fair amount of thought about what kernel patches should
    look like, is not smarter than you.  If fixing a checkpatch.pl complaint
-   would make the code worse, don't do it.
+   would make the code worse, do not do it.
 
 Patches should always be sent as plain text.  Please do not send them as
 attachments; that makes it much harder for reviewers to quote sections of
@@ -312,7 +312,7 @@ message.
 
 When mailing patches, it is important to send copies to anybody who might
 be interested in it.  Unlike some other projects, the kernel encourages
-people to err on the side of sending too many copies; don't assume that the
+people to err on the side of sending too many copies; do not assume that the
 relevant people will see your posting on the mailing lists.  In particular,
 copies should go to:
 
-- 
2.50.1 (Apple Git-155)

