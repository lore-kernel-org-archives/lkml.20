Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA04EB866;
	Fri, 16 Oct 2026 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166635; cv=none; b=UbS/UIT0m5xCip0N1lps7P75EhRqeVdKP6LbR8LSQHulpLCx6FjqLF9ZdblTYexCIvTFSRLd6GTrLLP6EJXPEEy3i7HaKt29YlNY5XkBKequV2RL/auCSjaol82nCRiv05q4kVD9rvx58PKMnW99rrkH+HaQ5hpGogoZk5r/hr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166635; c=relaxed/simple;
	bh=YuJNtPFMJf1ZlLospzoFwG7XMO8l8ZaCzUAO0iew8uc=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=RwlCiZyrByPNXqwj0rsQ1WCKbDfhKD/tZkgwzSrExreq8stRV8yogfjiCOEkxApJaGMFCagGQjUTQX6LM3KD0FyddkPHT85xWctGPuQ8PjuzPmNoKEMtxcndY67g7nSlW/77U/uFW4OwTu3y5tbIxgznDpvaxr6ZLGE3wfVjDzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Fri, 16 Oct 2026 17:03:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: sashal@kernel.org
CC: broonie@kernel.org, corbet@lwn.net, error27@gmail.com, geert@linux-m68k.org,
 gregkh@linuxfoundation.org, kees@kernel.org, konstantin@linuxfoundation.org,
 ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com, leon@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@leemhuis.info,
 mst@redhat.com, ojeda@kernel.org, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/7=5D_docs=3A_submitting-pat?=
 =?US-ASCII?Q?ches=3A_say_which_commit_a_Fixes_tag_names?=
In-Reply-To: <20261016152828.3765695-3-sashal@kernel.org>
Message-ID: <BEF3ABD8-B94B-4EA6-BB1D-40B702DDFF84@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 October 2026 16:28:22 BST, Sasha Levin <sashal@kernel.org> wrote:
>The description of the Fixes: tag does not say which commit to name when
>a later commit made an older bug reachable, or when more than one commit
>introduced the same bug, and both questions come up regularly. The
>commit that blame points at is also often one that only moved the code.
>
>Say that the tag names the commit that introduced the bug, that the
>commit that exposed it may get a second tag, and that each commit that
>introduced the bug gets its own tag. Say that the tags tell the stable
>team which trees need the fix, and that trees without any of the tagged
>commits do not.

Hi, this would make finding fixes tags better.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>
>Link: https://lore.kernel.org/r/c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info
>Link: https://lore.kernel.org/r/20261013003535-mutt-send-email-mst@kernel.org
>Link: https://lore.kernel.org/r/atCI4q2HvqVXOag1@stanley.mountain
>Assisted-by: LLM
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> Documentation/process/submitting-patches.rst | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>index 7ae79452e1b46..7c4e3c8272d2a 100644
>--- a/Documentation/process/submitting-patches.rst
>+++ b/Documentation/process/submitting-patches.rst
>@@ -608,6 +608,15 @@ which stable kernel versions should receive your fix. This is the preferred
> method for indicating a bug fixed by the patch. See
> :ref:`describe_changes`
> for more details.
> 
>+Name the commit that introduced the bug. ``git blame`` and ``git bisect`` can
>+point at a commit that only moved the code, or that made an older bug
>+reachable. If a later commit made an older bug reachable, name the commit that
>+introduced the bug; a second Fixes: tag for the later commit is fine. If the
>+same bug was introduced separately by more than one commit, add a Fixes: tag
>+for each, but do not add tags for commits that are only suspected. The Fixes:
>+tags tell the stable team which trees need the fix: those that contain one of
>+the tagged commits. Trees that contain none of them do not need it.
>+
> Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> process nor the requirement to Cc: stable@vger.kernel.org on all stable
> patch candidates. For more information, please read
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
