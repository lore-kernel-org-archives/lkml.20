Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C772E7F39;
	Fri, 11 Sep 2026 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144587; cv=none; b=hicGG2wLd3fDl9jokpL8TioU9h/zy9N7UtQ75aGhlUkdUKINNDanMqGaEnJMst4xgUqdJCiKDcQYnMT5yEBmTMYnBvU4HE+54dGZo8C1OiRwiBs8XKHaIzjwIf3eOWIIo6R8Gc36HnrzNeLDaMVmBTZmhI/FvozL/CwIH/XXMUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144587; c=relaxed/simple;
	bh=D4N2CYpqGur60EJ1BjNnNqN5DBpOGqb3/wXKxHx+xQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDScN8/QmVpr3LzpAX1ekx+E/gkOHW5/nyPAfe+D+kb8iM16HA4DzF+pnx7U4rUncNim/PGroutwcYTRJXLvN6iuywy9MzRrTBS7jlQ5Bptxa/mIHCxWZ92/FOTqjUPFqWtbhzYFh+ElzJwL3EezcHO0uGVqOpjIzjuYJbLySrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kZ9mqL+9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kZ9mqL+9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D572B16F2;
	Fri, 11 Sep 2026 09:36:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE6143F7B4;
	Fri, 11 Sep 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144584; bh=D4N2CYpqGur60EJ1BjNnNqN5DBpOGqb3/wXKxHx+xQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=kZ9mqL+9GLLtVycu6xZF9AIp3+Fog/4VSLxTviBivJQuKDEZiWAu7H3HTyE72AKvT
	 ooXeRwaSZ+i5DlfIsCpRDUZRMokU72uchgIi89zkPR33SdTQlPgcpS1l6XcMNeQR7t
	 2ewIZKQ8NJ/EXAEUght7EvzDq3e1kkilBMC603dQ=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v6 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Fri, 11 Sep 2026 17:36:10 +0100
Message-ID: <20260911163613.1131447-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a small documentation change found by sashiko since v5.

The patches should stay together so please could this all go via tip.

Changelogs in patches.

From cover letter of v3:

This is a new version of Dave Martin's patch [1] to delegate rounding of
bandwidth control user values to the arch code. As there is now more than one
architecture using resctrl, I split the original patch into two, a core resctrl
patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
break down and ordering is sensible and whether the pattern should be followed
for any future similar changes.

This does have a user visible effect on MB schema when using MPAM hardware
with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
coarse controls exists in the wild but it is spec compliant and I've tested it
on a model.

[1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/

v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
v5: https://lore.kernel.org/lkml/a2a7d988-339c-45f6-b910-5d7dd893b45c@arm.com/

Based on v7.3-rc2

Ben Horgan (1):
  arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (2):
  x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
  fs/resctrl: Factor MBA parse-time conversion to be per-arch

 Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.43.0

