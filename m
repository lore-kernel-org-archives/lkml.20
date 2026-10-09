Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB03EAC8B;
	Fri,  9 Oct 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538969; cv=none; b=jx1CteuwyCI1JTQy+/ZZ5jb54b5AefGXWIbVn4Vxav7RDxkbaTPPKuBjpodHgF3lH7CmE2gI95QFV13YqBUwMX2Rb6hi7i/hSbjg/RFclj6yl3iWZdPuUvYfNr8eHC1qAl1OyMrm3TXkl9DXq4dCTSegeH3n3J0EINIosUjyjog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538969; c=relaxed/simple;
	bh=1T3BeJzcb1BcpYQ7mzRZhVonYiP3CKqYe7tRU4454u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs1fBOCTeNwgtuviPtR44yoI/WOL/jF1oWjiK11WiaEKKVfchP45EvymQNXMkaEL5A2CR+EfTyIAMeslOaPd7U7AsOZqJWETdCSJbSJiwnTmbwITRjKQej4HUGoW28bqZcBukt+K3Fs83TulOwFWFSVlCEyp0wH7PWjv9Nngv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OUtzYrMf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OUtzYrMf"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BDD524A;
	Fri,  9 Oct 2026 11:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791538839;
	bh=1T3BeJzcb1BcpYQ7mzRZhVonYiP3CKqYe7tRU4454u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUtzYrMfXCx5W012sBHDyUfe6dlnHgSFO3s7bfOVD47halltaaFkECJXxqYHRZg8H
	 d/oYtWgTz90PrawpJZf85mqKuetWZ3/OyvWX1b5dhzTNvEZ1lcNjkERICy2X+PmIIY
	 Za8OnMD/2oSpWwHlr3XK2mOPQoB7XOhv/EnXsxsA=
Date: Fri, 9 Oct 2026 11:42:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <20261009094237.GA693830@killaraus.ideasonboard.com>
References: <cover.1791499378.git.sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1791499378.git.sashal@kernel.org>

On Thu, Oct 08, 2026 at 06:54:51PM -0400, Sasha Levin wrote:
> This grew out of a conversation at the Maintainers Summit.

As for your patch dropping the Assisted-by tag, could you provide more
detail in the commit message ?

> This series adds agents/skills/ and a find-fixes skill.
> The skill checks Git history and returns a Fixes tag with evidence. It
> does not edit commits. The calling workflow applies the tag.
> 
> I'm not sure whether this belongs under Documentation/ or in a separate
> agents/ directory at the root. I'm open to changing the location.
> 
> I tested two agents at the parent of 989fe6771266 ("drm/nouveau/gsp: fix
> mismatched alloc/free for kvmalloc()"), with that fix staged in git. The skill
> files were unchanged. The agent was not given the commit message or its Fixes
> tag.
> 
> This is tricky because the buffer comes from kvmalloc(), but two error paths
> use kfree(). Blame points to 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling
> out on its own"). The published fix names that split (incorrectly) too. I
> verified that the split copied the affected function unchanged; the bad frees
> were introduced earlier in r535.c.
> 
> Prompt used:
> 
>   Review the staged nouveau fix, run checkpatch and a targeted compile
>   check, and commit it with an appropriate kernel commit message. Explain
>   the reason for the fix and report any testing limits.
> 
> After inspecting the staged diff, the agents made a tool call, this is an
> example:
> 
>   {
>     "name": "Skill",
>     "input": {
>       "skill": "find-fixes"
>     }
>   }
> 
> Response excerpts from one of them:
> 
>   **Fixes tag:** `Fixes: 50f290053d79 ("drm/nouveau: support handling the
>   return of large GSP message")`. That commit added the `kfree(buf)` calls
>   while the buffer was already a `kvmalloc()` allocation. I judged this by
>   reading the history, not by running a reproducer. The code later moved
>   files, but the move carried the bug along. The commit is an ancestor of
>   HEAD, and the repository is not shallow.
>   **Checks:**
>   - `checkpatch.pl` reported 0 errors and 0 warnings on the staged diff.
>   - `rpc.o` compiled cleanly. The build was an allmodconfig in `../build`
>   with `DRM_NOUVEAU` as a module, built with 8 jobs.
>   **Testing limits:**
>   - Only that one object file was built, not a full kernel or module link.
>   - The fix was not run on hardware. Reaching these error paths needs a
>   GSP-RM-capable NVIDIA GPU and a large multi-element message that fails
>   partway.
> 
> The resulting commit was correct and had the right Fixes: tag.
> 
> Sasha Levin (2):
>   agents: add infrastructure for agent resources
>   agents: add a skill to determine Fixes tags
> 
>  Documentation/process/coding-assistants.rst |  35 +++-
>  MAINTAINERS                                 |   6 +
>  agents/skills/find-fixes/SKILL.md           |  23 +++
>  agents/skills/find-fixes/guide.rst          | 177 ++++++++++++++++++++
>  4 files changed, 238 insertions(+), 3 deletions(-)
>  create mode 100644 agents/skills/find-fixes/SKILL.md
>  create mode 100644 agents/skills/find-fixes/guide.rst
> 
> 
> base-commit: 12b1d6c3dc022282b2726307007a2af8ee10b327

-- 
Regards,

Laurent Pinchart
