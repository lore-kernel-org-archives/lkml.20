Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046383783A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338711; cv=none; b=enhnUbqFF3uTw+A10JWftecxg44O6HlV5ROOs6UToePL6LdFasntN5aLB33SpRVnkR0+8pSlrPEeH5MwaAqbXjjzeSlVQktmXAauwzuCD9/RYZGqUMY+AmzEk+cmSxcZ/OS5do/XNGm1jZcYwL8xQ4dOnZITx3EPSRrNFTjUP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338711; c=relaxed/simple;
	bh=xEZzpXeTW3vt1wTKKg79W/ieHGqqg0JRMuz4PZPsyC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXI6NSgGWNM1cMcM/MMz6pJdp0T2fo5ge7iqq89Iks20awO48aASPv8qDzdMX0W19LpROu4DAlKHoCZelDAxLhoBEE718/1FQmFvGiHrnk4wfUZUxHwokfZSi0gBlw/dUzDhM1LLCvbNgrGfWH+xBqOjlVoDI0qqNjHz7SgKQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqQ9EVyj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqQ9EVyj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9004f39d3so8759745ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338708; x=1788943508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTSGldNko/7onAQ09Dd0jKeRKM/xfLS6joKjag2qTGs=;
        b=qqQ9EVyjBJmLAS9SdpF8w8U5nnyxJS3CxjOCtcZ1JFf05enDhqR+0H1L1Qg0Q8aJ2d
         gILegmPdJ+2enajT2Q94+12ApZWU+QWJC/LOQo4yMBhECjvDrWQOBeu/yYUg+SXOoUoh
         JWv2+50RPsDo4etCp8KVvMdv7FrJgO/DSMywbTCMoB1jZQEeumvCgUSVbYgLwwQs+pk3
         vDju+aI7ax5QD9IEYnN0ghPES4iwSw/R8Yu7JfNVKh6ai8UKNUcmqNFF0wWBZCgSDJvz
         bjSDFo+5E4ZCgYtnd3FXnlaAiQWRM8KWaDwGzeLcFIQm1cIkdmRV1p90cTJd/2wjuiiA
         yQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338708; x=1788943508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTSGldNko/7onAQ09Dd0jKeRKM/xfLS6joKjag2qTGs=;
        b=pBAgqV38BnFI+nbrz8UJmFNhV5J8uPb3zR3kQ/udXgod0U7cjtjTztd/C0NIC1dhJv
         zdDCWepTzTEncLAgYY/wvtv9yLjnw/zebFRTRJPY7cKc+d+erf71lT2+cMNuGmXnSWok
         maS5JlH8HB5aBKdYIOJWDZZUmeuaLaHCxsOcSxc9hx9glgrCvg+Vp5jEvnmDThSbqS2Y
         Sz9TdBAX+PfI7wIybaEdsQCjAJRpEcGWEHXvFdGNOXs4KKhNJA5EPTlpNWL+ZZH1Tjxf
         XFmYU/B2E1kzfdZ8reAS8pfoP00+58L+c/pOinV8gqIMFR7xVQnN84o3LvO0jlFUBJHk
         +KFw==
X-Forwarded-Encrypted: i=1; AKwUvByHyy87fzEqW7QgsKxtTnosyftl/qU/763tG/+ABUxdkXwV6fEZHqhYUN9/oUrp+DkmpK+QxJMOssdOc0c=@vger.kernel.org
X-Gm-Message-State: AFuF++lg2vTL1CYZEvASp5Nevy6gBGrTQdgmf4fSOUY3lvvpioCURS0O
	eO0s/vX1BieRq9pOhpDQ3yEWKZPh8qYMZGWJNN9Wcy+rbvfkvVHn7ffg
X-Gm-Gg: AYBFou2ulsj4rGYB19rWCYurTAfhxEwhwwNkw+zRMUtyCKiAggDNDhgVZB72UqCl+qx
	P0L5QXDF3Svj5Gk5SBYckpoOUXNnk1KGYm8IP6CRRhepH+RGIX3/ZlhgJQ4yRfLsOptpv/WxzH5
	uWTFUHIkwuMiSsUlj2mgJKJTAqzcTgADG00Ng0DpNSNzaaJ+esZOfijTnrMFO0+CCt99vk9VgBw
	9Co7ZW+xnP8uNmI+rfDk7E953Juy/69koej3iCquk6qo0YZpzGHg5RZTVjZcCxo8Zv/RRsH+nQh
	LnEwFptraVA5lXEe4/MUNe1v1o8wOd1rHcp673abKGtYoVLLVo6fremIxK4q6yx249q3R0gXr2Y
	P2MUoBboMZSB9bNFkgkybzjaP9BkuOXEMt5lgE9zOs7tfPThfY1yOs9ejtYyxYBk+p6GVWOM9Ah
	FRAMe617EcuXswqTziAW3E8MOkmlXdWTFbF+gdhdMh8rNBFD/eiUkzx9K1alBjo4Q4j/Wqf8/6y
	NxYwBCibCjWSbZXC/M=
X-Received: by 2002:a17:90a:e7c9:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39aee219f45mr4475927a91.17.1788338707963;
        Wed, 02 Sep 2026 01:45:07 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:45:07 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 5/5] Documentation: process: Clean up grammar and tone across multiple files
Date: Wed,  2 Sep 2026 15:44:03 +0700
Message-ID: <20260902084430.17248-6-ducthinh100812@gmail.com>
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

Perform an extensive pass across eight process
documentation files. Expand conversational contractions to
their formal equivalents, correct minor punctuation faults, and
polish the writing style to ensure a clear, consistent tone.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/backporting.rst         | 68 +++++++++----------
 Documentation/process/coding-assistants.rst   | 12 ++--
 Documentation/process/conclave.rst            |  6 +-
 .../process/contribution-maturity-model.rst   |  4 +-
 Documentation/process/cve.rst                 |  8 +--
 Documentation/process/deprecated.rst          | 14 ++--
 Documentation/process/development-process.rst |  6 +-
 Documentation/process/email-clients.rst       | 32 ++++-----
 8 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
index abc5f8925a789..1ba583c89b973 100644
--- a/Documentation/process/backporting.rst
+++ b/Documentation/process/backporting.rst
@@ -28,14 +28,14 @@ Applying the patch to a tree
 ============================
 
 Sometimes the patch you are backporting already exists as a git commit,
-in which case you just cherry-pick it directly using
+in that case you just cherry-pick it directly using
 ``git cherry-pick``. However, if the patch comes from an email, as it
 often does for the Linux kernel, you will need to apply it to a tree
 using ``git am``.
 
-If you've ever used ``git am``, you probably already know that it is
+If you have ever used ``git am``, you probably already know that it is
 quite picky about the patch applying perfectly to your source tree. In
-fact, you've probably had nightmares about ``.rej`` files and trying to
+fact, you have probably had nightmares about ``.rej`` files and trying to
 edit the patch to make it apply.
 
 It is strongly recommended to instead find an appropriate base version
@@ -47,9 +47,9 @@ apply a patch that just arrived on LKML to an older stable kernel, you
 can apply it to the most recent mainline kernel and then cherry-pick it
 to your older stable branch.
 
-It's generally better to use the exact same base as the one the patch
-was generated from, but it doesn't really matter that much as long as it
-applies cleanly and isn't too far from the original base. The only
+It is generally better to use the exact same base as the one the patch
+was generated from, but it does not really matter that much as long as it
+applies cleanly and is not too far from the original base. The only
 problem with applying the patch to the "wrong" base is that it may pull
 in more unrelated changes in the context of the diff when cherry-picking
 it to the older branch.
@@ -70,7 +70,7 @@ article will assume that you are doing a plain ``git cherry-pick``.
 .. _b4 presentation: https://youtu.be/mF10hgVIx9o?t=2996
 
 Once you have the patch in Git, you can go ahead and cherry-pick it into
-your source tree. Don't forget to cherry-pick with ``-x`` if you want a
+your source tree. Do not forget to cherry-pick with ``-x`` if you want a
 written record of where the patch came from!
 
 Note that if you are submitting a patch for stable, the format is
@@ -93,8 +93,8 @@ Uh-oh; the cherry-pick failed with a vaguely threatening message::
 What to do now?
 
 In general, conflicts appear when the context of the patch (i.e., the
-lines being changed and/or the lines surrounding the changes) doesn't
-match what's in the tree you are trying to apply the patch *to*.
+lines being changed and/or the lines surrounding the changes) does not
+match what is in the tree you are trying to apply the patch *to*.
 
 For backports, what likely happened was that the branch you are
 backporting from contains patches not in the branch you are backporting
@@ -113,7 +113,7 @@ editor or using a dedicated conflict resolution tool.
 Many people prefer to use their regular text editor and edit the
 conflict directly, as it may be easier to understand what you're doing
 and to control the final result. There are definitely pros and cons to
-each method, and sometimes there's value in using both.
+each method, and sometimes there is value in using both.
 
 We will not cover using dedicated merge tools here beyond providing some
 pointers to various tools that you could use:
@@ -144,7 +144,7 @@ simply diverged -- perhaps your older branch had some other backports
 applied to it that themselves needed conflict resolutions, causing a
 divergence.
 
-It's important to always identify the commit or commits that caused the
+It is important to always identify the commit or commits that caused the
 conflict, as otherwise you cannot be confident in the correctness of
 your resolution. As an added bonus, especially if the patch is in an
 area you're not that familiar with, the changelogs of these commits will
@@ -155,7 +155,7 @@ git log
 ~~~~~~~
 
 A good first step is to look at ``git log`` for the file that has the
-conflict -- this is usually sufficient when there aren't a lot of
+conflict -- this is usually sufficient when there are not a lot of
 patches to the file, but may get confusing if the file is big and
 frequently patched. You should run ``git log`` on the range of commits
 between your currently checked-out branch (``HEAD``) and the parent of
@@ -164,7 +164,7 @@ the patch you are picking (``<commit>``), i.e.::
     git log HEAD..<commit>^ -- <path>
 
 Even better, if you want to restrict this output to a single function
-(because that's where the conflict appears), you can use the following
+(because that is where the conflict appears), you can use the following
 syntax::
 
     git log -L:'\<function\>':<path> HEAD..<commit>^
@@ -236,8 +236,8 @@ not be incidental at all and you need to carefully consider whether the
 patch adding the function should be cherry-picked first.
 
 If you find that there is a necessary prerequisite patch, then you need
-to stop and cherry-pick that instead. If you've already resolved some
-conflicts in a different file and don't want to do it again, you can
+to stop and cherry-pick that instead. If you have already resolved some
+conflicts in a different file and do not want to do it again, you can
 create a temporary copy of that file.
 
 To abort the current cherry-pick, go ahead and run
@@ -250,7 +250,7 @@ Understanding conflict markers
 Combined diffs
 ~~~~~~~~~~~~~~
 
-Let's say you've decided against picking (or reverting) additional
+Let's say you have decided against picking (or reverting) additional
 patches and you just want to resolve the conflict. Git will have
 inserted conflict markers into your file. Out of the box, this will look
 something like::
@@ -365,10 +365,10 @@ part of the conflict, leaving the file essentially unchanged, and apply
 the changes by hand. Perhaps the patch is changing a function call
 argument from ``0`` to ``1`` while a conflicting change added an
 entirely new (and insignificant) parameter to the end of the parameter
-list; in that case, it's easy enough to change the argument from ``0``
+list; in that case, it is easy enough to change the argument from ``0``
 to ``1`` by hand and leave the rest of the arguments alone. This
 technique of manually applying changes is mostly useful if the conflict
-pulled in a lot of unrelated context that you don't really need to care
+pulled in a lot of unrelated context that you do not really need to care
 about.
 
 For particularly nasty conflicts with many conflict markers, you can use
@@ -382,14 +382,14 @@ Dealing with file renames
 
 One of the most annoying things that can happen while backporting a
 patch is discovering that one of the files being patched has been
-renamed, as that typically means Git won't even put in conflict markers,
+renamed, as that typically means Git will not even put in conflict markers,
 but will just throw up its hands and say (paraphrased): "Unmerged path!
 You do the work..."
 
 There are generally a few ways to deal with this. If the patch to the
 renamed file is small, like a one-line change, the easiest thing is to
 just go ahead and apply the change by hand and be done with it. On the
-other hand, if the change is big or complicated, you definitely don't
+other hand, if the change is big or complicated, you definitely do not
 want to do it by hand.
 
 As a first pass, you can try something like this, which will lower the
@@ -400,7 +400,7 @@ an add-delete pair to be a potential rename)::
   git cherry-pick -strategy=recursive -Xrename-threshold=30
 
 Sometimes the right thing to do will be to also backport the patch that
-did the rename, but that's definitely not the most common case. Instead,
+did the rename, but that is definitely not the most common case. Instead,
 what you can do is to temporarily rename the file in the branch you're
 backporting to (using ``git mv`` and committing the result), restart the
 attempt to cherry-pick the patch, rename the file back (``git mv`` and
@@ -416,7 +416,7 @@ Gotchas
 Function arguments
 ~~~~~~~~~~~~~~~~~~
 
-Pay attention to changing function arguments! It's easy to gloss over
+Pay attention to changing function arguments! It is easy to gloss over
 details and think that two lines are the same but actually they differ
 in some small detail like which variable was passed as an argument
 (especially if the two variables are both a single character that look
@@ -438,7 +438,7 @@ other patches.
 A good way to ensure that you review the error paths is to always use
 ``git diff -W`` and ``git show -W`` (AKA ``--function-context``) when
 inspecting your changes.  For C code, this will show you the whole
-function that's being changed in a patch. One of the things that often
+function that is being changed in a patch. One of the things that often
 go wrong during backports is that something else in the function changed
 on either of the branches that you're backporting from or to. By
 including the whole function in the diff you get more context and can
@@ -453,22 +453,22 @@ function. When backporting patches to an area where such a refactoring
 has taken place, you effectively need to do the reverse when
 backporting: a patch to a single location may need to be applied to
 multiple locations in the backported version. (One giveaway for this
-scenario is that a function was renamed -- but that's not always the
+scenario is that a function was renamed -- but that is not always the
 case.)
 
-To avoid incomplete backports, it's worth trying to figure out if the
+To avoid incomplete backports, it is worth trying to figure out if the
 patch fixes a bug that appears in more than one place. One way to do
 this would be to use ``git grep``. (This is actually a good idea to do
 in general, not just for backports.) If you do find that the same kind
-of fix would apply to other places, it's also worth seeing if those
-places exist upstream -- if they don't, it's likely the patch may need
+of fix would apply to other places, it is also worth seeing if those
+places exist upstream -- if they do not, it is likely the patch may need
 to be adjusted. ``git log`` is your friend to figure out what happened
-to these areas as ``git blame`` won't show you code that has been
+to these areas as ``git blame`` will not show you code that has been
 removed.
 
 If you do find other instances of the same pattern in the upstream tree
-and you're not sure whether it's also a bug, it may be worth asking the
-patch author. It's not uncommon to find new bugs during backporting!
+and you're not sure whether it is also a bug, it may be worth asking the
+patch author. It is not uncommon to find new bugs during backporting!
 
 Verifying the result
 ====================
@@ -513,17 +513,17 @@ and running the patched kernel (or program).
 Build testing
 -------------
 
-We won't cover runtime testing here, but it can be a good idea to build
+We will not cover runtime testing here, but it can be a good idea to build
 just the files touched by the patch as a quick sanity check. For the
 Linux kernel you can build single files like this, assuming you have the
 ``.config`` and build environment set up correctly::
 
     make path/to/file.o
 
-Note that this won't discover linker errors, so you should still do a
+Note that this will not discover linker errors, so you should still do a
 full build after verifying that the single file compiles. By compiling
 the single file first you can avoid having to wait for a full build *in
-case* there are compiler errors in any of the files you've changed.
+case* there are compiler errors in any of the files you have changed.
 
 Runtime testing
 ---------------
@@ -571,7 +571,7 @@ format::
   Signed-off-by: <your name and email>
 
 The "Upstream commit" line is sometimes slightly different depending on
-the stable version. Older version used this format::
+the stable version. Older versions used this format::
 
   commit <mainline rev> upstream.
 
diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 051f0d819f68e..f01c15afe6fe4 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -15,7 +15,7 @@ kernel development process:
 * Documentation/process/coding-style.rst
 * Documentation/process/submitting-patches.rst
 
-For guidelines on content generated by AI coding assistants see:
+For guidelines on content generated by AI coding assistants, see:
 
 * Documentation/process/generated-content.rst
 
@@ -73,12 +73,12 @@ these steps:
    the report to be ignored, as many unverified bug reports sent to maintainers
    happen to be invalid. Stop here if it finally looks wrong.
 4. Write a fix for the bug. This part is not optional: except in a few very
-   rare cases, an AI assistant able to find a bug is able to fix it. Note that
-   fixes written in the same session as used to find the bug will generally
-   lead to better and more accurate fixes as the LLM's reasoning context
-   remains present.
+   rare cases, an AI assistant capable of finding a bug is capable of fixing it. 
+   Fixes written within the same session used to identify the bug will 
+   generally lead to better and more accurate fixes as the LLM's reasoning 
+   context remains present.
 5. Build and verify that the fix works either using the reproducer or by
-   re-running a complete analysis; drop any fix that doesn't work and try
+   re-running a complete analysis; drop any fix that does not work and try
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
 6. Commit the working fix with a detailed message describing the problem, the
diff --git a/Documentation/process/conclave.rst b/Documentation/process/conclave.rst
index 6a1234f546124..44324d285ed49 100644
--- a/Documentation/process/conclave.rst
+++ b/Documentation/process/conclave.rst
@@ -33,9 +33,9 @@ Technical Advisory Board (TAB) Chair as a backup.
   the expectation that it maximizes the long term health of the project
   and its community.
 
-- Within two weeks, a representative of this group will communicate to the
-  broader community, using the ksummit@lists.linux.dev mailing list, what
-  the next steps will be.
+- Within two weeks, a representative of this group will communicate the 
+  next steps to the broader community via the ksummit@lists.linux.dev
+  mailing list.
 
 The Linux Foundation, as guided by the TAB, will take the steps
 necessary to support and implement this plan.
diff --git a/Documentation/process/contribution-maturity-model.rst b/Documentation/process/contribution-maturity-model.rst
index b87ab34de22ce..8b7e9ab6c9e82 100644
--- a/Documentation/process/contribution-maturity-model.rst
+++ b/Documentation/process/contribution-maturity-model.rst
@@ -11,7 +11,7 @@ Background
 As a part of the 2021 Linux Kernel Maintainers’ Summit, there was a
 `discussion <https://lwn.net/Articles/870581/>`_ about the challenges in
 recruiting kernel maintainers as well as maintainer succession.  Some of
-the conclusions from that discussion included that companies which are a
+the conclusions from that discussion included that companies that are a
 part of the Linux Kernel community need to allow engineers to be
 maintainers as part of their job, so they can grow into becoming
 respected leaders and eventually, kernel maintainers.  To support a
@@ -65,7 +65,7 @@ Level 3
   authored by engineers from other companies) as part of their job
   responsibilities
 * Contributing presentations or papers to Linux-related or academic
-  conferences (such those organized by the Linux Foundation, Usenix,
+  conferences (such as those organized by the Linux Foundation, Usenix,
   ACM, etc.), are considered part of an engineer’s work.
 * A Software Engineer’s community contributions will be considered in
   promotion and performance reviews.
diff --git a/Documentation/process/cve.rst b/Documentation/process/cve.rst
index 5e2753eff7294..69b20b2ecfb25 100644
--- a/Documentation/process/cve.rst
+++ b/Documentation/process/cve.rst
@@ -33,11 +33,11 @@ for CVE number assignments and have CVE numbers automatically assigned
 to them.  These assignments are published on the linux-cve-announce
 mailing list as announcements on a frequent basis.
 
-Note, due to the layer at which the Linux kernel is in a system, almost
+Note, due to the layer where the Linux kernel is in a system, almost
 any bug might be exploitable to compromise the security of the kernel,
 but the possibility of exploitation is often not evident when the bug is
 fixed.  Because of this, the CVE assignment team is overly cautious and
-assign CVE numbers to any bugfix that they identify.  This
+assigns CVE numbers to any bugfix that they identify.  This
 explains the seemingly large number of CVEs that are issued by the Linux
 kernel team.
 
@@ -53,7 +53,7 @@ process<../process/security-bugs>`.
 No CVEs will be automatically assigned for unfixed security issues in
 the Linux kernel; assignment will only automatically happen after a fix
 is available and applied to a stable kernel tree, and it will be tracked
-that way by the git commit id of the original fix.  If anyone wishes to
+by the Git commit ID of the original fix.  If anyone wishes to
 have a CVE assigned before an issue is resolved with a commit, please
 contact the kernel CVE assignment team at <cve@kernel.org> to get an
 identifier assigned from their batch of reserved identifiers.
@@ -83,7 +83,7 @@ If a security issue is found in a Linux kernel that is only supported by
 a Linux distribution due to the changes that have been made by that
 distribution, or due to the distribution supporting a kernel version
 that is no longer one of the kernel.org supported releases, then a CVE
-can not be assigned by the Linux kernel CVE team, and must be asked for
+cannot be assigned by the Linux kernel CVE team, and must be asked for
 from that Linux distribution itself.
 
 Any CVE that is assigned against the Linux kernel for an actively
diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 22a5e62c92eaf..b8f15c761ed08 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -9,7 +9,7 @@ Deprecated Interfaces, Language Features, Attributes, and Conventions
 In a perfect world, it would be possible to convert all instances of
 some deprecated API into the new API and entirely remove the old API in
 a single development cycle. However, due to the size of the kernel, the
-maintainership hierarchy, and timing, it's not always feasible to do these
+maintainership hierarchy, and timing, it is not always feasible to do these
 kinds of conversions at once. This means that new instances may sneak into
 the kernel while old ones are being removed, only making the amount of
 work to remove the API grow. In order to educate developers about what
@@ -20,12 +20,12 @@ kernel.
 __deprecated
 ------------
 While this attribute does visually mark an interface as deprecated,
-it `does not produce warnings during builds any more
+it `does not produce warnings during builds anymore
 <https://git.kernel.org/linus/771c035372a036f83353eef46dbb829780330234>`_
 because one of the standing goals of the kernel is to build without
-warnings and no one was actually doing anything to remove these deprecated
+warnings and no effort was made to remove these deprecated
 interfaces. While using `__deprecated` is nice to note an old API in
-a header file, it isn't the full solution. Such interfaces must either
+a header file, it is not the full solution. Such interfaces must either
 be fully removed from the kernel, or added to this file to discourage
 others from using them in the future.
 
@@ -206,8 +206,8 @@ Implicit switch case fall-through
 ---------------------------------
 The C language allows switch cases to fall through to the next case
 when a "break" statement is missing at the end of a case. This, however,
-introduces ambiguity in the code, as it's not always clear if the missing
-break is intentional or a bug. For example, it's not obvious just from
+introduces ambiguity in the code, as it is not always clear if the missing
+break is intentional or a bug. For example, it is not obvious just from
 looking at the code if `STATE_ONE` is intentionally designed to fall
 through into `STATE_TWO`::
 
@@ -266,7 +266,7 @@ size problems::
                 struct foo items[0];
         };
 
-But this led to other problems, and didn't solve some problems shared by
+But this led to other problems, and did not solve some problems shared by
 both styles, like not being able to detect when such an array is accidentally
 being used _not_ at the end of a structure (which could happen directly, or
 when such a struct was in unions, structs of structs, etc).
diff --git a/Documentation/process/development-process.rst b/Documentation/process/development-process.rst
index e34d7da58b7ff..6c40831bf45f7 100644
--- a/Documentation/process/development-process.rst
+++ b/Documentation/process/development-process.rst
@@ -4,12 +4,12 @@ A guide to the Kernel Development Process
 =========================================
 
 The purpose of this document is to help developers (and their managers)
-work with the development community with a minimum of frustration.  It is
-an attempt to document how this community works in a way which is
+work with the development community with a minimum of frustration. It is
+an attempt to document how this community works in a way that is
 accessible to those who are not intimately familiar with Linux kernel
 development (or, indeed, free software development in general).  While
 there is some technical material here, this is very much a process-oriented
-discussion which does not require a deep knowledge of kernel programming to
+discussion that does not require a deep knowledge of kernel programming to
 understand.
 
 .. toctree::
diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
index b5377630a648a..88246203a9e99 100644
--- a/Documentation/process/email-clients.rst
+++ b/Documentation/process/email-clients.rst
@@ -25,7 +25,7 @@ attachments, but then the attachments should have content-type
 it makes quoting portions of the patch more difficult in the patch
 review process.
 
-It's also strongly recommended that you use plain text in your email body,
+It is also strongly recommended that you use plain text in your email body,
 for patches and other emails alike. https://useplaintext.email may be useful
 for information on how to configure your preferred email client, as well as
 listing recommended email clients should you not already have a preference.
@@ -34,10 +34,10 @@ Email clients that are used for Linux kernel patches should send the
 patch text untouched.  For example, they should not modify or delete tabs
 or spaces, even at the beginning or end of lines.
 
-Don't send patches with ``format=flowed``.  This can cause unexpected
+Do not send patches with ``format=flowed``.  This can cause unexpected
 and unwanted line breaks.
 
-Don't let your email client do automatic word wrapping for you.
+Do not let your email client do automatic word wrapping for you.
 This can also corrupt your patch.
 
 Email clients should not modify the character set encoding of the text.
@@ -50,14 +50,14 @@ headers so that mail threading is not broken.
 
 Copy-and-paste (or cut-and-paste) usually does not work for patches
 because tabs are converted to spaces.  Using xclipboard, xclip, and/or
-xcutsel may work, but it's best to test this for yourself or just avoid
+xcutsel may work, but it is best to test this for yourself or just avoid
 copy-and-paste.
 
-Don't use PGP/GPG signatures in mail that contains patches.
+Do not use PGP/GPG signatures in mail that contains patches.
 This breaks many scripts that read and apply the patches.
 (This should be fixable.)
 
-It's a good idea to send a patch to yourself, save the received message,
+It is a good idea to send a patch to yourself, save the received message,
 and successfully apply it with 'patch' before sending patches to Linux
 mailing lists.
 
@@ -86,7 +86,7 @@ In the :menuselection:`Sending Preferences` section:
 - :menuselection:`Strip Whitespace Before Sending` must be ``disabled``
 
 When composing the message, the cursor should be placed where the patch
-should appear, and then pressing `CTRL-R` let you specify the patch file
+should appear, and then pressing `CTRL-R` lets you specify the patch file
 to insert into the message.
 
 Claws Mail (GUI)
@@ -180,7 +180,7 @@ Mutt (TUI)
 
 Plenty of Linux developers use ``mutt``, so it must work pretty well.
 
-Mutt doesn't come with an editor, so whatever editor you use should be
+Mutt does not come with an editor, so whatever editor you use should be
 used in a way that there are no automatic linebreaks.  Most editors have
 an :menuselection:`insert file` option that inserts the contents of a file
 unaltered.
@@ -208,7 +208,7 @@ to send them::
 Config options:
 
 It should work with default settings.
-However, it's a good idea to set the ``send_charset`` to::
+However, it is a good idea to set the ``send_charset`` to::
 
   set send_charset="us-ascii:utf-8"
 
@@ -266,9 +266,9 @@ Sylpheed (GUI)
 - Works well for inlining text (or using attachments).
 - Allows use of an external editor.
 - Is slow on large folders.
-- Won't do TLS SMTP auth over a non-SSL connection.
+- Will not do TLS SMTP auth over a non-SSL connection.
 - Has a helpful ruler bar in the compose window.
-- Adding addresses to address book doesn't understand the display name
+- Adding addresses to address book does not understand the display name
   properly.
 
 Thunderbird (GUI)
@@ -283,7 +283,7 @@ you need to restart Thunderbird.
 - Allow use of an external editor:
 
   The easiest thing to do with Thunderbird and patches is to use extensions
-  which open your favorite external editor.
+  that open your favorite external editor.
 
   Here are some example extensions which are capable of doing this.
 
@@ -294,7 +294,7 @@ you need to restart Thunderbird.
     https://addons.thunderbird.net/en-GB/thunderbird/addon/external-editor-revived/
 
     It requires installing a "native messaging host".
-    Please read the wiki which can be found here:
+    Please read the wiki that can be found here:
     https://github.com/Frederick888/external-editor-revived/wiki
 
   - "External Editor"
@@ -317,7 +317,7 @@ you need to restart Thunderbird.
 
 To beat some sense out of the internal editor, do this:
 
-- Edit your Thunderbird config settings so that it won't use ``format=flowed``!
+- Edit your Thunderbird config settings so that it will not use ``format=flowed``!
   Go to your main window and find the button for your main dropdown menu.
   :menuselection:`Main Menu-->Preferences-->General-->Config Editor...`
   to bring up the thunderbird's registry editor.
@@ -333,7 +333,7 @@ To beat some sense out of the internal editor, do this:
 
     to control this registry on the fly.
 
-- Don't write HTML messages! Go to the main window
+- Do not write HTML messages! Go to the main window
   :menuselection:`Main Menu-->Account Settings-->youracc@server.something-->Composition & Addressing`!
   There you can disable the option "Compose messages in HTML format".
 
@@ -362,7 +362,7 @@ HacKerMaiL (TUI)
 ****************
 
 HacKerMaiL (hkml) is a public-inbox based simple mails management tool that
-doesn't require subscription of mailing lists.  It is developed and maintained
+does not require subscription of mailing lists.  It is developed and maintained
 by the DAMON maintainer and aims to support simple development workflows for
 DAMON and general kernel subsystems.  Refer to the README
 (https://github.com/sjp38/hackermail/blob/master/README.md) for details.
-- 
2.50.1 (Apple Git-155)

