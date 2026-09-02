Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DC3EF0A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338691; cv=none; b=SVb8KWtnn2SD1OGomCNhBdwXfbb7zxSpJbs607zlx772bWu2chcndY+O6cAFgHzOdvfxfjHL8xOGpvs9swzma/BIaBRRrxp26C8mPit3n+B6gHSodWpD4W8pfiCu5Ttf9Owq+efTouxzxFdnw3Y571DuEGgcmOvEeo60mXP1FOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338691; c=relaxed/simple;
	bh=y3564IyB3FL0gx6xFJeHm1YTmss9kUj4skLIm9wvdhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH0yIAEPNrg0XcAjwoH5it+/2zF08iXF8mZXOpKMToMTEqiuZ7i23f1skzt4CPOb5KRspoTm57maShKPCAX6MvGTGJC2lfU5EN+8lTdn8CQ43UR2Dxbtp7DSk0w2P5nmQiVQ8c3JiHHJUQUBOAGZSnBQJz32PP4qGmg/gO459Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfbMlKeX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfbMlKeX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso695161a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338684; x=1788943484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEDK+6s8EUU2Oy7vTke/AIdPRfzFNyY3UuiurUasEcA=;
        b=VfbMlKeX6wUeZyjW3zBejfCjYMT1uYr2DJnVVaz6jJEmQuZe5c++F9e3BWu5XctUGK
         Xcwf75AI5qLUL44syDZ3FcsmzWWZ3LlVG+6SgQU71fXN/cIScoB5tSg2iHmT+m/Yz1pc
         0hV8DKlsK0DCvhT+vCoD/2e119PK/ephmZxVBZCAZG7lhlAwmEYVKAM52TWhMmtXIpqv
         eDuXVisYq0DdTugwKnooDZ9YTIgaB3FR8oRCHwwt1MKLqfjSyOxDa+HuzabfXKIajtL0
         tXv7g5TkxI6tc6OhAh/Ix4DW+VRXo6hwCKV33ck+Yma6Mlx6pTcoVYXA+d5zkrZRdZOC
         aIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338684; x=1788943484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEDK+6s8EUU2Oy7vTke/AIdPRfzFNyY3UuiurUasEcA=;
        b=ccbTq5ToyTwaCSFJiMrfrKCWvnobW/n1sAtIiG+ys/quQsXjF9NeiXl4GaHjlDbaYk
         D4GzUykmbp8edrbMnAUEGNn5r8RVFfPE9EJEg3j+aWPF+BXvc2C8QidirM7wpZdaihGL
         X9RUv7LElA8cCgfKUW403GnUf96d3NO4YO4k9E+Sjyq06vsamTW6E17d3e0nHRPMuALL
         ZoX40TqEEULrU/v850KVd9fwVtOEVvJAy4tiTRL6IPdNVlh2+3Gw0S8YsRfb1ZsHv8aT
         ALyjUgCzzhc1QzuLxBRalpzRnDBCTlHhLt7dTkgWXkDV39J3FhrNBJ/YMRkdRFkZq+HH
         Gm4w==
X-Forwarded-Encrypted: i=1; AKwUvBw1FJNsFeYJmIgo9vYUQGTCT42f3IQ3/OCBHthrGrT2udqxTUFsdSvBz9LTTh+Ns2fnP+HPDsY95k8aMic=@vger.kernel.org
X-Gm-Message-State: AFuF++kE+p2QcuDQs9EC8tIAQMpgEldolr2i7TvlMn/15zVka0c4dm2m
	SMvP37o8JZsUaFhouGx/L4QF2+pVWoh0tfSq79J61FfXajezIuy4rUid
X-Gm-Gg: AYBFou2cm/SFYRdTUd1qbAHJO+yyTa/Q3fi1C3L2unCVcWYgHcbaODwX03pU/93khSp
	7gasvEqazBGHIlKApZ9RcUm7+5HjMyClLgRkiWKAsVbdpqiG+qzgIPSObrI5nfbCU5TaUtz7XpI
	DHi6/jAoL7/QeWrC9OHgU1u7yhQnZW7VX5pSqCmHWgCBNb9TicHx1Dp+bmmOcjTwJH5sM8DKmbD
	wPp9YEDK5DbCfqCvtiqBPKMaEP8UfcjvZFCL5Bwb8pVtHNC09EbxizYTeuOpjRfNKgBsQNPNwAn
	g3pcEvy4Rffz1Rz411saBEwCz7mRA2ltN7bgjluR9rC2pO1Z2PoyUNa1dCE/H5ShZJ/jajOcNxN
	vDna1I/wivIVBaRRk50l2w6foxMQqHmQvQPqt6nWdkYp2yt7bAECbut8AIdZ6kxlEdxYIFnPjNu
	V0BlwgcL9lkWjuzat3TftLboREDznIq5WR1sAY4olNeKfuw3lABYEiHaXWlCOnHUY3i48YuXmR1
	jvKb3UOsNMD6pBuLfA=
X-Received: by 2002:a17:90b:1d4c:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39aedf0956bmr4779488a91.6.1788338684396;
        Wed, 02 Sep 2026 01:44:44 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:43 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 1/5] Documentation: process: Clean up grammar, tone, and contractions in core files
Date: Wed,  2 Sep 2026 15:43:59 +0700
Message-ID: <20260902084430.17248-2-ducthinh100812@gmail.com>
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

Update three process documentation files to improve text consistency and
professional tone. Expand informal contractions like "don't" to "do
not", resolve minor punctuation errors, and refine the voice for better
readability.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/1.Intro.rst         | 18 +++++++++---------
 Documentation/process/3.Early-stage.rst   | 14 +++++++-------
 Documentation/process/6.Followthrough.rst | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/process/1.Intro.rst b/Documentation/process/1.Intro.rst
index 847fbe76b6a44..0c95239eadda8 100644
--- a/Documentation/process/1.Intro.rst
+++ b/Documentation/process/1.Intro.rst
@@ -24,7 +24,7 @@ initial exercise.
 :ref:`development_early_stage` covers early-stage project planning, with an
 emphasis on involving the development community as soon as possible.
 
-:ref:`development_coding` is about the coding process; several pitfalls which
+:ref:`development_coding` is about the coding process; several pitfalls that
 have been encountered by other developers are discussed.  Some requirements for
 patches are covered, and there is an introduction to some of the tools
 which can help to ensure that kernel patches are correct.
@@ -53,7 +53,7 @@ What this document is about
 The Linux kernel, at over 8 million lines of code and well over 1000
 contributors to each release, is one of the largest and most active free
 software projects in existence.  Since its humble beginning in 1991, this
-kernel has evolved into a best-of-breed operating system component which
+kernel has evolved into a best-of-breed operating system component that
 runs on pocket-sized digital music players, desktop PCs, the largest
 supercomputers in existence, and all types of systems in between.  It is a
 robust, efficient, and scalable solution for almost any situation.
@@ -84,7 +84,7 @@ difficulties when trying to do kernel work.  The kernel community has
 evolved its own distinct ways of operating which allow it to function
 smoothly (and produce a high-quality product) in an environment where
 thousands of lines of code are being changed every day.  So it is not
-surprising that Linux kernel development process differs greatly from
+surprising that the Linux kernel development process differs greatly from
 proprietary development methods.
 
 The kernel's development process may come across as strange and
@@ -95,8 +95,8 @@ have a frustrating experience in store.  The development community, while
 being helpful to those who are trying to learn, has little time for those
 who will not listen or who do not care about the development process.
 
-It is hoped that those who read this document will be able to avoid that
-frustrating experience.  There is a lot of material here, but the effort
+Those who read this document should be able to avoid that frustrating
+experience.  There is a lot of material here, but the effort
 involved in reading it will be repaid in short order.  The development
 community is always in need of developers who will help to make the kernel
 better; the following text should help you - or those who work for you -
@@ -145,7 +145,7 @@ discussed in greater detail later in this document.  Consider:
   out-of-tree code requires significant amounts of work just to keep that
   code working.
 
-  Code which is in the mainline, instead, does not require this work as the
+  By contrast, code in the mainline does not require this work as the
   result of a simple rule requiring any developer who makes an API change
   to also fix any code that breaks as the result of that change.  So code
   which has been merged into the mainline has significantly lower
@@ -176,7 +176,7 @@ discussed in greater detail later in this document.  Consider:
   out of tree indefinitely, or (2) abandoning your code and migrating your
   users over to the in-tree version.
 
-- Contribution of code is the fundamental action which makes the whole
+- Contribution of code is the fundamental action that makes the whole
   process work.  By contributing your code you can add new functionality to
   the kernel and provide capabilities and examples which are of use to
   other kernel developers.  If you have developed code for Linux (or are
@@ -194,7 +194,7 @@ include:
   are cloudy at best; quite a few kernel copyright holders believe that
   most binary-only modules are derived products of the kernel and that, as
   a result, their distribution is a violation of the GNU General Public
-  License (about which more will be said below).  Your author is not a
+  License (about which more will be said below).  The author is not a 
   lawyer, and nothing in this document can possibly be considered to be
   legal advice.  The true legal status of closed-source modules can only be
   determined by the courts.  But the uncertainty which haunts those modules
@@ -233,7 +233,7 @@ Licensing
 Code is contributed to the Linux kernel under a number of licenses, but all
 code must be compatible with version 2 of the GNU General Public License
 (GPLv2), which is the license covering the kernel distribution as a whole.
-In practice, that means that all code contributions are covered either by
+In practice, this means all code contributions are covered either by
 GPLv2 (with, optionally, language allowing distribution under later
 versions of the GPL) or the three-clause BSD license.  Any contributions
 which are not covered by a compatible license will not be accepted into the
diff --git a/Documentation/process/3.Early-stage.rst b/Documentation/process/3.Early-stage.rst
index 87fa7875e3369..06f9adcd1f833 100644
--- a/Documentation/process/3.Early-stage.rst
+++ b/Documentation/process/3.Early-stage.rst
@@ -58,7 +58,7 @@ creation of a body of code.
 So, when contemplating a kernel development project, one should obtain
 answers to a short set of questions:
 
- - What, exactly, is the problem which needs to be solved?
+ - What, exactly, is the problem that needs to be solved?
 
  - Who are the users affected by this problem?  Which use cases should the
    solution address?
@@ -75,7 +75,7 @@ When planning a kernel development project, it makes great sense to hold
 discussions with the community before launching into implementation.  Early
 communication can save time and trouble in a number of ways:
 
- - It may well be that the problem is addressed by the kernel in ways which
+ - It may well be that the problem is addressed by the kernel in ways that
    you have not understood.  The Linux kernel is large and has a number of
    features and capabilities which are not immediately obvious.  Not all
    kernel capabilities are documented as well as one might like, and it is
@@ -136,7 +136,7 @@ relevant subsystem and the environment may be more supportive.
 Finding maintainers can be a bit harder.  Again, the MAINTAINERS file is
 the place to start.  That file tends to not always be up to date, though,
 and not all subsystems are represented there.  The person listed in the
-MAINTAINERS file may, in fact, not be the person who is actually acting in
+MAINTAINERS file may not, in fact, be the person who is actually acting in
 that role currently.  So, when there is doubt about who to contact, a
 useful trick is to use Git (and "git log" in particular) to see who is
 currently active within the subsystem of interest.  Look at who is writing
@@ -168,12 +168,12 @@ When to post?
 -------------
 
 If possible, posting your plans during the early stages can only be
-helpful.  Describe the problem being solved and any plans that have been
-made on how the implementation will be done.  Any information you can
+helpful.  Describe the problem being solved and how you plan to
+implement the solution. Any information you can
 provide can help the development community provide useful input on the
 project.
 
-One discouraging thing which can happen at this stage is not a hostile
+One discouraging thing that can happen at this stage is not a hostile
 reaction, but, instead, little or no reaction at all.  The sad truth of the
 matter is (1) kernel developers tend to be busy, (2) there is no shortage
 of people with grand plans and little code (or even prospect of code) to
@@ -217,7 +217,7 @@ a non-disclosure agreement.  The Linux Foundation operates an NDA program
 designed to help with this sort of situation; more information can be found
 at:
 
-    https://www.linuxfoundation.org/nda/
+    https://www.linuxfoundation.org/legal/nda/
 
 This kind of review is often enough to avoid serious problems later on
 without requiring public disclosure of the project.
diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 66fa400c6d940..ba145b705df02 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -10,7 +10,7 @@ developers can make is to conclude that their work is now done.  In truth,
 posting patches indicates a transition into the next stage of the process,
 with, possibly, quite a bit of work yet to be done.
 
-It is a rare patch which is so good at its first posting that there is no
+It is a rare patch that is so good at its first posting that there is no
 room for improvement.  The kernel development process recognizes this fact,
 and, as a result, is heavily oriented toward the improvement of posted
 code.  You, as the author of that code, will be expected to work with the
@@ -60,8 +60,8 @@ mind:
 
 What all of this comes down to is that, when reviewers send you comments,
 you need to pay attention to the technical observations that they are
-making.  Do not let their form of expression or your own pride keep that
-from happening.  When you get review comments on a patch, take the time to
+making.  Do not let their tone or your own pride prevent that.
+When you get review comments on a patch, take the time to
 understand what the reviewer is trying to say.  If possible, fix the things
 that the reviewer is asking you to fix.  And respond back to the reviewer:
 thank them, and describe how you will answer their questions.
@@ -96,7 +96,7 @@ through list archives to familiarize themselves with what was said last
 time; if you help them get a running start, they will be in a better mood
 when they revisit your code.
 
-What if you've tried to do everything right and things still aren't going
+What if you've tried to do everything right and things still are not going
 anywhere?  Most technical disagreements can be resolved through discussion,
 but there are times when somebody simply has to make a decision.  If you
 honestly believe that this decision is going against you wrongly, you can
@@ -128,7 +128,7 @@ Inclusion into a subsystem tree can bring a higher level of visibility to a
 patch.  Now other developers working with that tree will get the patch by
 default.  Subsystem trees typically feed linux-next as well, making their
 contents visible to the development community as a whole.  At this point,
-there's a good chance that you will get more comments from a new set of
+there is a good chance that you will get more comments from a new set of
 reviewers; these comments need to be answered as in the previous round.
 
 What may also happen at this point, depending on the nature of your patch,
@@ -142,7 +142,7 @@ blessings: before the advent of the linux-next tree, these conflicts often
 only turned up during the merge window and had to be addressed in a hurry.
 Now they can be resolved at leisure, before the merge window opens.
 
-Some day, if all goes well, you'll log on and see that your patch has been
+Someday, if all goes well, you will log on and see that your patch has been
 merged into the mainline kernel.  Congratulations!  Once the celebration is
 complete (and you have added yourself to the MAINTAINERS file), though, it
 is worth remembering an important little fact: the job still is not done.
@@ -174,7 +174,7 @@ After any regressions have been dealt with, there may be other, ordinary
 bugs to deal with.  The stabilization period is your best opportunity to
 fix these bugs and ensure that your code's debut in a mainline kernel
 release is as solid as possible.  So, please, answer bug reports, and fix
-the problems if at all possible.  That's what the stabilization period is
+the problems if at all possible.  That is what the stabilization period is
 for; you can start creating cool new patches once any problems with the old
 ones have been taken care of.
 
@@ -208,7 +208,7 @@ far.  If you are seen as needlessly blocking good work, those patches will
 eventually flow around you and get into the mainline anyway.  In the Linux
 kernel, nobody has absolute veto power over any code.  Except maybe Linus.
 
-On very rare occasion, you may see something completely different: another
+On very rare occasions, you may see something completely different: another
 developer posts a different solution to your problem.  At that point,
 chances are that one of the two patches will not be merged, and "mine was
 here first" is not considered to be a compelling technical argument.  If
-- 
2.50.1 (Apple Git-155)

