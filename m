Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792531419;
	b=zspixP35eSfniqEfeJ6Lr6PYi5xwbebPLUJWgCouf7I9N/jF6C+bqnU92pe9dXynmnis
	 +arWqZSX3CDJM6woUz3E8OpFC+aGcY4q9130RAfv9AD4mFoTQ3INXE4gbcMpOcTjhTYX1
	 Ezp/leeZIKXN328zo8Fb/lHZ8ts9ePEYKrOcqGlo2OlPOhhcz7c4Y542nMCCGBNmEASnQ
	 KYCdzEog1dSk7b4lbjRa6mHPO9MUnTIcGvLifybKc5dnShGuosKjyHOvnt6ETKMd7INo1
	 brUeOMOwx8DSapMCj7AL8/vTCYtRNMtVWvc4oLxRQAjN/0L4ZP5E4h+ircd3MznPR+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531419;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H5HColMS0ZeP1R0gE6aC7hhAzMMaRNCd5L/+8VZBmRg=;
	b=UpE+dMIVpxeqvmY80zIuVnSF0k9u6SbSzfnKC6ZuVHGmC00KRXFcMJGMI5xqy6uowQO3
	 aoOi3ts++Pl0SA8FXhT0QPt392JSnrXTzt6cbhXlAJPjAvlaVnmlVhC+7o5qRxVPuh03j
	 fwm5LvfRhnJvyn07zERRTKX01e3APIevs2xD6zelFSD7XH5GbHbtJXFNgXfeEj2dQ5ZSr
	 RtlCCmK9sTQwnf9zYU+GtoYzoF2o9j7AB5m9vW40vCcutfxCKIjjd4gS2i80Re5YsSPil
	 gwznosIt845nzFjdz6MUiFpAv2NCOqL9dhssTns3fa2koGrsiP6XSTT56K/9HYltbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrbbBPOC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31396606A319;
	Tue, 20 Oct 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrbbBPOC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627221F000C9;
	Tue, 20 Oct 2026 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792531418;
	bh=H5HColMS0ZeP1R0gE6aC7hhAzMMaRNCd5L/+8VZBmRg=;
	h=From:To:Cc:Subject:Date;
	b=TrbbBPOCmSU2EoPdFdn4TWw9UhXnCTI4uS5210ZQjDLS5AoAsUeWyqxR5q54lur27
	 bj50As9vTBZa9bmhNqIZTj+uaL9Lvoty7vt5DvNprZPnSDSwhnkiwr4LKCTg4WMcxB
	 Yd1xkp+yzhm52R5dWb3Vjmtx6/k1gVtumtV8apODYom5qXmz85LM8GjCboi57Crr7K
	 VPyvFlyfKqQh90Nbe+ImurTZka+qtpk/w0xgXO1M+uwERvqc+BhjETHtl7+JqFver6
	 WOKHZOHkBpHcNNoibrmvAFMQRX4w0urb1muROrYeERjq7Ti9wmdXQucMqkHRqkqAs9
	 Tc6KcJzUhcEVw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] docs: submitting-patches: Require base tree information
Date: Tue, 20 Oct 2026 21:22:35 +0000
Message-ID: <20261020212235.1143086-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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

Many patches still don't include base tree information and can't be
applied.  Such patches can't be properly reviewed or tested, nor can
they be accepted.  submitting-patches.rst already describes how to
include base tree information, but it's characterized as optional,
appears only towards the end of the document, and is missing details.

Make some tweaks to hopefully increase the number of patches that
include base tree information:

- Characterize base tree information as required, not optional.

- Mention it in the "The canonical patch format" section too.

- Clarify what commits are acceptable to use as base commits.  Also use
  origin/master instead of master in the example.

- Mention how to handle prerequisite patches.

- Suggest setting the format.useAutoBase=true git configuration option.

- Mention falling back to free-form text as a last resort.

- Don't say base-commit can go "below the '---' line", since that
  implied it could go before the diff, which is an unnecessary
  alternative that differs from what 'git format-patch' produces.

- Free up some space for the new information by dropping the mention of
  needing at least git v2.9.0 (since that's quite old by now) and the
  example of 'git am' (since that isn't directly relevant to submitting
  patches, which is the topic of submitting-patches.rst).

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/process/submitting-patches.rst | 92 ++++++++++++--------
 1 file changed, 58 insertions(+), 34 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b46..ef211c9a63794 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -25,6 +25,8 @@ Some subsystems and maintainer trees have additional information about
 their workflow and expectations, see
 Documentation/process/maintainer-handbooks.rst.
 
+.. _obtain_a_current_source_tree:
+
 Obtain a current source tree
 ----------------------------
 
@@ -678,6 +680,10 @@ The canonical patch message body contains the following:
 
   - The actual patch (``diff`` output).
 
+  - A ``base-commit`` line and zero or more ``prerequisite-patch-id``
+    lines. (For a series, these are needed only in the cover letter or
+    first patch.) See :ref:`providing_base_tree_information`.
+
 The Subject line format makes it very easy to sort the emails
 alphabetically by subject line - pretty much any email reader will
 support that - since because the sequence number is zero-padded,
@@ -847,6 +853,7 @@ unmanageable forest of references in email clients.  If a link is
 helpful, you can use the https://lore.kernel.org/ redirector (e.g., in
 the cover email text) to link to an earlier version of the patch series.
 
+.. _providing_base_tree_information:
 
 Providing base tree information
 -------------------------------
@@ -861,50 +868,67 @@ This is even more important for automated CI processes that attempt to
 run a series of tests in order to establish the quality of your
 submission before the maintainer starts the review.
 
-If you are using ``git format-patch`` to generate your patches, you can
-automatically include the base tree information in your submission by
-using the ``--base`` flag. The easiest and most convenient way to use
-this option is with topical branches::
+Therefore, with only rare exceptions, patches must include structured
+base tree information in the form of a
+``base-commit: <full commit hash>`` line naming a public commit, and
+zero or more ``prerequisite-patch-id: <patch-id>`` lines. They go in
+the first patch, or in the cover letter if one is present. Put them at
+the very bottom, after the diff (or, in a cover letter, after the
+diffstat) and just before the ``--`` signature delimiter if present.
+
+To make ``git format-patch`` generate this information, pass ``--base``.
+It's easiest to use topical branches and ``--base=auto``::
 
-    $ git checkout -t -b my-topical-branch master
-    Branch 'my-topical-branch' set up to track local branch 'master'.
+    $ git checkout -t -b my-topical-branch origin/master
+    branch 'my-topical-branch' set up to track 'origin/master'.
     Switched to a new branch 'my-topical-branch'
 
     [perform your edits and commits]
 
-    $ git format-patch --base=auto --cover-letter -o outgoing/ master
-    outgoing/0000-cover-letter.patch
-    outgoing/0001-First-Commit.patch
-    outgoing/...
+    $ git format-patch --base=auto --cover-letter origin/master
+    0000-cover-letter.patch
+    0001-First-Commit.patch
+    ...
 
-When you open ``outgoing/0000-cover-letter.patch`` for editing, you will
-notice that it will have the ``base-commit:`` trailer at the very
-bottom, which provides the reviewer and the CI tools enough information
-to properly perform ``git am`` without worrying about conflicts::
+For more information about ``--base``, see ``man git-format-patch``.
 
-    $ git checkout -b patch-review [base-commit-id]
-    Switched to a new branch 'patch-review'
-    $ git am patches.mbox
-    Applying: First Commit
-    Applying: ...
-
-Please see ``man git-format-patch`` for more information about this
-option.
+To ensure you don't forget to use ``--base``, consider setting the
+``format.useAutoBase=true`` git configuration option to make
+``git format-patch`` default to ``--base=auto``.
 
 .. note::
 
-    The ``--base`` feature was introduced in git version 2.9.0.
-
-If you are not using git to format your patches, you can still include
-the same ``base-commit`` trailer to indicate the commit hash of the tree
-on which your work is based. You should add it either in the cover
-letter or in the first patch of the series and it should be placed
-either below the ``---`` line or at the very bottom of all other
-content, right before your email signature.
-
-Make sure that base commit is in an official maintainer/mainline tree
-and not in some internal, accessible only to you tree - otherwise it
-would be worthless.
+    If ``git format-patch`` with ``--base=auto`` (or
+    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
+    the current branch having no upstream tracking branch, it exits with
+    an error. In such cases, pass an explicit base commit to ``--base``
+    instead. This is also needed if git detects the wrong base commit,
+    such as when the upstream branch has local, unpublished commits.
+
+The base commit must be in a well-known public tree, such as the
+subsystem development branch the patch is targeting. See
+:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
+can also be acceptable bases, depending on the subsystem.
+
+If your patch(es) depend on unmerged patches that were sent separately,
+then use the same base commit as those prerequisite patches. In your
+local git branch, apply the prerequisite patches directly on top of the
+desired base commit, then commit your new changes on top of that. Then,
+run a command like the following::
+
+    $ git format-patch --base=<base> --cover-letter <last-prereq>..HEAD
+
+That makes ``git format-patch`` generate a ``base-commit`` line as well
+as ``prerequisite-patch-id`` lines for the dependencies.
+
+In rare cases where the structured base tree information isn't flexible
+enough (such as when prerequisite patches weren't sent publicly, were
+modified from what was sent publicly, or weren't sent with the default 3
+lines of context that git uses to compute patch IDs), as a last resort
+use free-form text in the cover letter or below the ``---`` line to
+describe how to apply your patch(es). Giving a link to your patches in a
+publicly accessible git branch can help in this case. However, note that
+CI systems may be unable to apply your patch(es).
 
 Tooling
 -------

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.56.0.212.g129ede20d9-goog

