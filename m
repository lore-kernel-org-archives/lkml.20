Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438062;
	b=BTdTfcTE9/EC9MCywFUsIyu5U0vylUZqs92WUXxzT29p3FIoAOc5fDCY6HflkiksitfO
	 MkGhJ08pSzc/JQhykADemCFcnzor/KnaUy4+gW5eqxG2L51K9RNS8SkYRtHxBzSThh0Zq
	 eFyM5Vvm8VHOFSYAlGrk2DHJA1Nls2gHL/2gQbPYTT7IhmGzdOITcxdpuz9dSRBFBeLLF
	 Q6fe7IWbLEAJ+DwB3rCPsG43BhZMZBcfINKMN7wnXflIxg4LIjAtCnDWXv8qVQKela+uu
	 vlenrUGnwNpq+/mlC3lpFv9DV6ZaaFQjsJhIdggEym8vKXokZN4wouIsMxR+VT11E7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aYvMzR0aN37nQlnLtJnVAyPtC9Oir7A/+6zq96PEhL4=;
	b=MkQb89ZzhuV+aPht7qb/5QdOGSk9BAbzF2MBqTA03V4WTjY1xoaR9FfEeWJjXP11e2lN
	 UjtxO62vPd2jrBSY8k54IuVfderyMirQ09NKHD3lKsPJNKv5Cm5yjJX7mLQxZcjbJ6v9V
	 6qoFuxwX+gVP0bsp6y3W/hfpaBLxpoaH1l0IDa6oJqHjNJvhYRcOc5X3Iz/jUNObsRi1A
	 +bjxcBj8nC3FbY1mS6khp1VtKpPE0Fs45P4AQ+bNB9h1S6eKaZdidfbbKy+aGjegFM3do
	 UiHCp51HXnjl+Y6HVq7bMgw711CRFK7j+3jIZ3o2vuxYk2Npru/fBYZxBB2agPa0jJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=MVSGtbBY;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E3F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=MVSGtbBY
Received: from trampoline.thunk.org (pool-173-48-111-191.bstnma.fios.verizon.net [173.48.111.191])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6ABMxiH7026970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1794437992; bh=aYvMzR0aN37nQlnLtJnVAyPtC9Oir7A/+6zq96PEhL4=;
	h=From:Subject:Date:Message-ID:MIME-Version;
	b=MVSGtbBYUVv2VwDjz2PGO7YbpB8cCkHuNr7RZ2tWdjTyWqYA1nlBJx9+sKj8KivyE
	 DQmOT5ymQFM4l5C0DXZ0XnKhaUFZK3/HEIIim5fJJjJpimTwFVVBsEQd45Yq3vyqLH
	 NM9U9v8FHIrLykqscl7IvdtN42ZnMXX/zubEuYWWWVsNGmy4HmZMwNaRu8Yq8+qCds
	 9OZ+1ABybgY3Ur/qgLmCdIVC9jgDdaaKtdr++Z3vAUJtSCgNCVb+h3cPxK0RQuYSpH
	 DPH1giU2kDO9Ewbl2YsbyuHsdJDbCV1yeGBt6GUdQYhM+aH1/Hy3ViRKKIvhOisLDv
	 wkO5hyA1Zyrtg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id B68392E00BB; Wed, 11 Nov 2026 17:59:44 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: workflows@vger.kernel.org, ksummit@lists.linux.dev
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leon Romanovsky <leon@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
        Bradley Morgan <brads@mainlining.org>, Sasha Levin <sashal@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH v5 0/6] agents: add skills for Fixes tags, stable tags, similar bugs, and commit messages
Date: Wed, 11 Nov 2026 17:59:32 -0500
Message-ID: <20261111225940.1573565-1-tytso@mit.edu>
X-Mailer: git-send-email 2.53.0
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

This is an update of Sasha's v4 patchset with the following changes:

   * Rebased to v7.4-rc2
   * Removed references to Assisted-by: per the discussion at the
     Maintainers Summit
   * Addition of a new skill, writing-kunit-tests which I've been
     using to add full KUnit test coverage for ext4.

I've been using the prompt against Gemini Pro; would appreciate
comments about how well it works (or doesn't) when used with Claude
Code.

Sasha, could you consider updating your patch series with this set?
I'll assume that you will send this to Linus, since the bulk of the
work is yours.  Thanks!!

              	     	      	      - Ted

v4: https://lore.kernel.org/r/20261020161642.3713052-1-sashal@kernel.org
v3: https://lore.kernel.org/r/20261016152828.3765695-1-sashal@kernel.org
v2: https://lore.kernel.org/r/20261012213452.1863248-1-sashal@kernel.org
v1: https://lore.kernel.org/r/cover.1791499378.git.sashal@kernel.org


Sasha Levin (5):
  agents: add infrastructure for agent resources
  agents: add a skill to determine Fixes tags
  agents: add a skill to determine stable tags
  agents: add a skill to find other instances of a fixed bug
  agents: add a skill to write commit messages

Theodore Ts'o (1):
  agents: add a skill to write KUnit tests

 Documentation/process/coding-assistants.rst   |  37 +-
 MAINTAINERS                                   |   6 +
 agents/skills/commit-message/SKILL.md         |  45 +++
 agents/skills/find-fixes/SKILL.md             |  39 ++
 agents/skills/find-siblings/SKILL.md          |  36 ++
 .../find-siblings/references/coccinelle.md    |  66 ++++
 agents/skills/stable-tag/SKILL.md             |  72 ++++
 agents/skills/writing-kunit-tests/SKILL.md    | 344 ++++++++++++++++++
 8 files changed, 642 insertions(+), 3 deletions(-)
 create mode 100644 agents/skills/commit-message/SKILL.md
 create mode 100644 agents/skills/find-fixes/SKILL.md
 create mode 100644 agents/skills/find-siblings/SKILL.md
 create mode 100644 agents/skills/find-siblings/references/coccinelle.md
 create mode 100644 agents/skills/stable-tag/SKILL.md
 create mode 100644 agents/skills/writing-kunit-tests/SKILL.md

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

