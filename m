Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C872140802B;
	Thu,  8 Oct 2026 22:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500099; cv=none; b=flW32MeAYdqOWe843Xza/R6y/ERYpFLtSweX+YTxKL+beZJjsu/lxDjp3c9tnq3J182wdFFVM+2xiJiKPHoLIUjrO+uk8sHK6ACQdo8tf4rgxCJ5hvFSx9BeJphI7lQtnKmKVFqPh2+nWHBL6rL7QrPs9CytkJxzoinT4r/f/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500099; c=relaxed/simple;
	bh=HN+6bj/WEe7JikXBepZ6VycNJtw7A2Uf1mhsNVBIkNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwdsIuXO1oHjH2YhD9+E9O0Xryva8um2zh94yvFRBC7XkBYq3jykHiwQ+4evTbQcuCLiRoKbGO1T1MMjNi54yA145wpJ0i5OT2xWOTTocqid10ZvkGqKADmf/ssjFGMNhYT/FD9gkz96q5d6+GFiPKmcCYA3b1dSDZa8X3Yt2U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcceuPV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcceuPV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9FF1F000FF;
	Thu,  8 Oct 2026 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791500098;
	bh=u39mT4IOTdHp/fuN7VkF/gaA1F9Utx0zho7tvXeN1JM=;
	h=From:To:Cc:Subject:Date;
	b=TcceuPV4ls15EFHexXmSXDQalT1qVqvV8TdO5xPk/qs6RulTsXng09pjfTRRKJavi
	 cEpVp9c3+sHO6WhRn1uXSZIw0MCuNkVCU2opf2ra1Iu2/aZoVstJ9ACdxOCYdjrbCf
	 U9nlzZQAj2jbKNUTh3FhenDgOnyj+BK4qT8iX4edjz4YOIlGoAC7Y2/UPMLDWMHlLs
	 EtfMdHHYEdu2K+cGPMxFQoMdYNanJjzC5Zylv6NyJWp+CpZ3OoaNvMng03BOWmMuht
	 8bj/k/b5oYakxiu5Vz8HyQZ7DfVzMjXcMZX/gtz+B7DDAf2KDj+SJuaQxqGGXG770o
	 /e213N952bndQ==
From: Sasha Levin <sashal@kernel.org>
To: workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	broonie@kernel.org,
	tytso@mit.edu,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
Date: Thu,  8 Oct 2026 18:54:51 -0400
Message-ID: <cover.1791499378.git.sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This grew out of a conversation at the Maintainers Summit.

This series adds agents/skills/ and a find-fixes skill.
The skill checks Git history and returns a Fixes tag with evidence. It
does not edit commits. The calling workflow applies the tag.

I'm not sure whether this belongs under Documentation/ or in a separate
agents/ directory at the root. I'm open to changing the location.

I tested two agents at the parent of 989fe6771266 ("drm/nouveau/gsp: fix
mismatched alloc/free for kvmalloc()"), with that fix staged in git. The skill
files were unchanged. The agent was not given the commit message or its Fixes
tag.

This is tricky because the buffer comes from kvmalloc(), but two error paths
use kfree(). Blame points to 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling
out on its own"). The published fix names that split (incorrectly) too. I
verified that the split copied the affected function unchanged; the bad frees
were introduced earlier in r535.c.

Prompt used:

  Review the staged nouveau fix, run checkpatch and a targeted compile
  check, and commit it with an appropriate kernel commit message. Explain
  the reason for the fix and report any testing limits.

After inspecting the staged diff, the agents made a tool call, this is an
example:

  {
    "name": "Skill",
    "input": {
      "skill": "find-fixes"
    }
  }

Response excerpts from one of them:

  **Fixes tag:** `Fixes: 50f290053d79 ("drm/nouveau: support handling the
  return of large GSP message")`. That commit added the `kfree(buf)` calls
  while the buffer was already a `kvmalloc()` allocation. I judged this by
  reading the history, not by running a reproducer. The code later moved
  files, but the move carried the bug along. The commit is an ancestor of
  HEAD, and the repository is not shallow.
  **Checks:**
  - `checkpatch.pl` reported 0 errors and 0 warnings on the staged diff.
  - `rpc.o` compiled cleanly. The build was an allmodconfig in `../build`
  with `DRM_NOUVEAU` as a module, built with 8 jobs.
  **Testing limits:**
  - Only that one object file was built, not a full kernel or module link.
  - The fix was not run on hardware. Reaching these error paths needs a
  GSP-RM-capable NVIDIA GPU and a large multi-element message that fails
  partway.

The resulting commit was correct and had the right Fixes: tag.

Sasha Levin (2):
  agents: add infrastructure for agent resources
  agents: add a skill to determine Fixes tags

 Documentation/process/coding-assistants.rst |  35 +++-
 MAINTAINERS                                 |   6 +
 agents/skills/find-fixes/SKILL.md           |  23 +++
 agents/skills/find-fixes/guide.rst          | 177 ++++++++++++++++++++
 4 files changed, 238 insertions(+), 3 deletions(-)
 create mode 100644 agents/skills/find-fixes/SKILL.md
 create mode 100644 agents/skills/find-fixes/guide.rst


base-commit: 12b1d6c3dc022282b2726307007a2af8ee10b327
