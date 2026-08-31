Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156FE3624B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210545; cv=none; b=ANBHUFAv810qZxKl7MM/u4YBJyw/PmVOgcuDl/NHcbhyY60M36Q1rpag+UzX5kTMCGVCy0Z3srPvenhXQI9zsHegRZFVeYdAid+DrEWNg6/mocEqWd003XnRFhHFTyCI8AVOVSV1unx4FsLwX+Iu1dkn8LKJ9X8J8+/aqtfjD9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210545; c=relaxed/simple;
	bh=S/iED6CcRs3G2JrnHMGX5aylswZ6peQQYu7/c/g6lCM=;
	h=Date:Message-ID:From:To:Cc:Subject; b=JM9TlM6ZXhaC3NjxU/MUKfsIy+VhiH8K/Hme6Ebht/9aDBoqqC2QUMMom8plc2Sjd2277V41HuUViKdm6hGHVR370xwFNXJb6x9bonWbABxmZdzWgJj8ZHaYVm6f/wIWcVm9BLIY+iJ+NxAUQD+hrDavbZr75vQpsm3x6k6XdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJjBWYEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJjBWYEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E91B1F000E9;
	Mon, 31 Aug 2026 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788210543;
	bh=H1md6kBHVSgvhYIEBgGAVNi3RPem16g1lwm5fwpQltU=;
	h=Date:From:To:Cc:Subject;
	b=HJjBWYEgqsr0s3QxZKexKtIkEGfg8BlcAAB5dwgZ3O4jc6PXzn4oMpXWprxufM3u+
	 V5kLkd1qAMLyepp6g/8tx2xVEztdEov9TsYjwa73dk9wpKKEU9DV6t5VfYK1rWUaW5
	 D8SAANEgqUJ46VqF3vxCo84TAQ9izo/QhOe0ppydY5dJKBJNLvgACWNFiMgdjCbFbY
	 fCedho2yLzGzYt3xQmqqfa6OXH2FsZi/9x06Jxy0mBztKMk84i/luicsnEegA2KMeN
	 CUk93UOeIuMzx2ACYqKv61aLVM6NUfB6AzKTrbeEqRkjC62AoUO57oUOGtn4DFlgoE
	 jyR9LNWph5zrQ==
Date: Mon, 31 Aug 2026 11:09:02 -1000
Message-ID: <7b9e0a733622fb1973f75eed11704042@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [GIT PULL] workqueue: Fixes for v7.3-rc1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Linus.

The following changes since commit 20a80e7f6b71bd664c98e95589f0cbc68804d200:

  workqueue: annotate racy p->wake_cpu accesses in kick_pool_pick() (2026-08-13 07:00:19 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc1-fixes

for you to fetch changes up to 93e257938aa67a6c957217db94091d9d9e5d403f:

  tools/workqueue/wq_dump.py: Support backward compatibility for wq->attrs rename (2026-08-31 10:17:08 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.3-rc1

- An unbound worker pool could be freed while still reachable through the
  pending-activation list, leading to a use-after-free. Unlink before
  dropping the reference.

- On PREEMPT_RT, the BH workqueue kick raised softirqs from preemptible
  context, tripping a lockdep assertion and possibly losing concurrently
  raised softirq bits.

- Draining BH work off a dead CPU nests two pools' callback locks, which
  lockdep misreported as recursive locking. The nesting cannot deadlock.
  Annotate it.

- Reject watchdog thresholds that overflow the conversion to jiffies.

- Make the drgn workqueue dump script work again on kernels and vmcores
  from before the workqueue attrs field rename.

----------------------------------------------------------------
Aaron Tomlin (1):
      tools/workqueue/wq_dump.py: Support backward compatibility for wq->attrs rename

Jiacheng Xu (1):
      workqueue: reject watchdog thresholds that overflow jiffies

Tejun Heo (1):
      workqueue: Annotate cb_lock nesting when draining a dead BH pool

Yao Kai (1):
      workqueue: Fix unbound pool lifetime for pending pwqs

Zqiang (1):
      workqueue: Use raise_softirq() to trigger softirq in irq_work handler

 kernel/workqueue.c         | 30 +++++++++++++++++++++---------
 tools/workqueue/wq_dump.py | 10 ++++++++--
 2 files changed, 29 insertions(+), 11 deletions(-)

Thanks.

-- 
tejun
