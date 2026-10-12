Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C34F96D3;
	Mon, 12 Oct 2026 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840903; cv=none; b=kt+EudTcT9Wx05pQVbBgm8QzOFQM3cwsbLgFiq2Hzpz/kuUOy5eV5fqnspdjxdeVu88teaEBjI5myw+01w6zo8vQg8uafItx7Gysrzc/jl52EVcxPrekrXbZgId+qlCaOlksq9/Ux/8G1K9MnagfPEkP/l01iTkTr9zB6EMX640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840903; c=relaxed/simple;
	bh=PKCV+jQJxyQWLAVFOF6wnjv1Xc47jQNtC6ZgAzTSJ58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbxWPqfpsZzmu6W4jV2T5tzxtNaHaPc40uRwBB7ey83tsLNIcs2Knt/pUHN3vnuCtW6dX3n1vC38LDFh6FFzM8ZKgCDw40E1mSg7RvMN7vHd15U25tvbAl4sNFKiGNi5Bqbn6jXesszGNO509y1lMwRQhg3Au5j7zz2/d0FfHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZOIMxTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZOIMxTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424A91F008A1;
	Mon, 12 Oct 2026 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840894;
	bh=JZhQ/do2ZcDQm/01Iuk17vs8su+Oo8mJ5ajSg/BN9CY=;
	h=From:To:Cc:Subject:Date;
	b=TZOIMxTljD88Mm3o+E+t3SnV0+E7ESPsw1MZsMvEkO4BuHn3IEP6mkuUGSmaJeN6a
	 eaIViVrKPO+J0voCrt80bIL3CUxVcWFDIbpOIK/6Fk4Nr8f+U5MUyK/XdkqTrrKw8Z
	 pSJ2Tss9Kdnl/b87kZ1Gh8MdS5typHZ6bTz5ilDQq/kNBI/r7DiLAdztGQmgRZFVse
	 xAJRr2FGpAJQGkvpRKqzqwdjz6ol0lFDSRse5OsoHKLUH1554vQ87Cm/l0+0vNrGKS
	 w9Oe0EeFqNl9CToOk34P5EKL7fTEmnTE1YVKvhWAMdyQY/Jb4AaYFuI+Iogt2z+Psz
	 FvXPv3h4Z/5Zw==
From: Sasha Levin <sashal@kernel.org>
To: workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags, similar bugs, and commit messages
Date: Mon, 12 Oct 2026 17:34:47 -0400
Message-ID: <20261012213452.1863248-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the Maintainers Summit, Ted asked whether the stable trees have a way
to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
are wrong, often because the author ran git blame and took the first
commit that touched the line [1]. We use LLM workflows to find the
commit that actually introduced a bug, and others asked us to share
them.

This series adds them as agent skills under agents/skills/, together
with a skill for writing commit messages:

 - find-fixes determines the commit for a Fixes tag, following the
   history past code moves and refactors.

 - stable-tag decides whether a fix should go to stable and generates the
   tag. It follows the criteria AUTOSEL applies in practice, finds the
   first release with the bug using git tag --contains, and checks that
   the fix applies there, adding prerequisites or a version floor if
   needed.

 - find-siblings looks for the same bug elsewhere in the tree and
   verifies each candidate.

 - commit-message writes, rewrites, or reviews a commit message or cover
   letter, and writes the signed tag and email text for a pull request.
   It follows the P: profiles that get_maintainer.pl reports for the
   changed files, reads the related list discussions with lei when it is
   available, and keeps the text short and in the imperative voice.

The skills are read-only and return a result with evidence. The calling
workflow writes the commit, creates the tag, and sends the mail.
coding-assistants.rst tells agents when to use each skill.

I tested the skills with two different agents on an array of upstream
commits and pull requests.

Changes since v1:
 - Switch the MAINTAINERS list to workflows@vger.kernel.org (Leon,
   Konstantin).
 - Add the stable-tag, find-siblings, and commit-message skills.
 - find-fixes: point to the stable-tag skill for stable decisions.

v1: https://lore.kernel.org/r/cover.1791499378.git.sashal@kernel.org
[1] https://lore.kernel.org/r/askTmFZC6RJKAE_p@mit.edu
[2] https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com

Sasha Levin (5):
  agents: add infrastructure for agent resources
  agents: add a skill to determine Fixes tags
  agents: add a skill to determine stable tags
  agents: add a skill to find other instances of a fixed bug
  agents: add a skill to write commit messages

 Documentation/process/coding-assistants.rst   |  79 +++++-
 MAINTAINERS                                   |   6 +
 agents/skills/commit-message/SKILL.md         |  29 +++
 agents/skills/commit-message/guide.rst        | 200 +++++++++++++++
 agents/skills/commit-message/pull-request.rst | 113 +++++++++
 agents/skills/find-fixes/SKILL.md             |  23 ++
 agents/skills/find-fixes/guide.rst            | 178 ++++++++++++++
 agents/skills/find-siblings/SKILL.md          |  22 ++
 agents/skills/find-siblings/guide.rst         | 138 +++++++++++
 agents/skills/stable-tag/SKILL.md             |  25 ++
 agents/skills/stable-tag/guide.rst            | 229 ++++++++++++++++++
 11 files changed, 1039 insertions(+), 3 deletions(-)
 create mode 100644 agents/skills/commit-message/SKILL.md
 create mode 100644 agents/skills/commit-message/guide.rst
 create mode 100644 agents/skills/commit-message/pull-request.rst
 create mode 100644 agents/skills/find-fixes/SKILL.md
 create mode 100644 agents/skills/find-fixes/guide.rst
 create mode 100644 agents/skills/find-siblings/SKILL.md
 create mode 100644 agents/skills/find-siblings/guide.rst
 create mode 100644 agents/skills/stable-tag/SKILL.md
 create mode 100644 agents/skills/stable-tag/guide.rst


base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
--
2.53.0

