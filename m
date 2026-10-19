Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426768;
	b=GVJJ9pgVCg2TnqRTiJvhUaTCXkO+mFMSHD9QW/2Ymv5FPNqkikeK7aYIDA5qyDdxkl7Z
	 vTexf9H1y0CS51PfTBqYJpB3iaF5GSs34azePKkBhIY6dzaihCzaISYBECnhObhBoktfc
	 jzhs8ZAKT782Ch2e08eCE/5kdBVuar29B2T6N/wg9+b5+LK3lBm3VVVPzqyRwfbKGB/xH
	 4ifUqpyPKxt2g1TFFvDgpAv3SWKsxml/pBy74NFw2ZnHLAGE4OMV8uA+VdNwG7570uZdJ
	 2p4tk7OiqeXeqJRut+VTNhqYL26CAdNvIkNoiaTKBwrJIcmzUHx72XY9SvzMFi8lLhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426768;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject;
	bh=3ZxazHgcG9LDN7P1YjaHMHAXpAYfHZvUKbKslACh0ig=;
	b=H7keS87g6bSZqN4aSaGK1DVRA7ydIkgXelzbuGDfTrHfQuKrnUqOAdb9oLDrS/70QB9R
	 +tADJO1+cc38xNmJP3cmR4icarZdaL/IMGL22J7ZXB7kEbss6X6QZdGBwRSisp9NTbW3c
	 Xbl9fCJI/LFHd4U2ECADALv3c5DvgReIuoNQNWg2bp1yagGD0r0PXOwy7+y0itK56oHwX
	 yYl09cp0qsfVeJwxwb1bIkl4bgRuDBUmIUuyFpQUso9K9+dtpVVWvle6hzxOtIczkcdwn
	 0DQTACEg24a0yQVum4O7Jt3SJLUS33jG4+NeaBOa1X47Vg1m4hfssWN7rIG5akk4mMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRC9f88k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E7606A335
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRC9f88k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657071F000C7;
	Mon, 19 Oct 2026 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426767;
	bh=3ZxazHgcG9LDN7P1YjaHMHAXpAYfHZvUKbKslACh0ig=;
	h=Date:From:To:Cc:Subject;
	b=CRC9f88k50jHB0R7OEwM4W0H1w3hVWg1pXLTmjU4MoBoi+RNQXhRU8DeVz7Wk1ejX
	 idFChhBopWwcmKHBReiDT/rXO5Zd2wifuJkO31cDMIhyLVjyzEiZBr8vTNiI4XnN78
	 OjDe4S17AWWvU7L/j7AWJ55VVHsjrE2v4ckb+lIIC76LlxYmhPXb04qEd2dktppO5j
	 oYCO6brpv/4N5iNZvgA+96BRgA7v5ADHIXCTVEOCDSR2lYFJFbXNLCtGJGF5juGtbl
	 5mCzv64YrWtCW/bKlN+FAuhdTRTWWxcBAuZH62Ur4hKW9wareCicq2U7OLPC/lFVum
	 YJBNSudAHL08w==
Date: Mon, 19 Oct 2026 06:19:26 -1000
Message-ID: <d4910dda3c8d655e1a8ccaeef64662e9@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Changes for v7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello,

The following changes since commit 93e257938aa67a6c957217db94091d9d9e5d403f:

  tools/workqueue/wq_dump.py: Support backward compatibility for wq->attrs rename (2026-08-31 10:17:08 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4

for you to fetch changes up to bda345b3fc59f2899c50379c64a0734a3e720683:

  workqueue: mark pool->nr_running as __data_racy (2026-10-14 07:03:54 -1000)

----------------------------------------------------------------
workqueue: Changes for v7.4

- Flushing a workqueue now visits only the queues used since the last flush
  instead of one per possible CPU. Idle flushes get 10 to 100 times faster
  on large machines, which XFS hits on every log force.

- Per-cpu workqueues are built through the same attribute path as unbound
  ones and get a max_active of their own, continuing the work to turn them
  into an affinity scope of unbound workqueues.

- New tracepoints for work items turning CPU-intensive, rescuer mayday and
  rescue events, and BH workers yielding with work pending.

- A KCSAN annotation and small cleanups.

----------------------------------------------------------------
Aaron Tomlin (3):
      workqueue: Add workqueue_cpu_intensive tracepoint
      workqueue: Add workqueue_mayday and workqueue_rescued tracepoints
      workqueue: Add workqueue_bh_budget_yield tracepoint

Breno Leitao (8):
      workqueue: move the unbound-only attrs check to apply_workqueue_attrs()
      workqueue: resolve the backing pool in alloc_pwq()
      workqueue: make the default pwq optional
      workqueue: build percpu pwqs through the attrs path
      workqueue: rename the pwq slot helpers shared with percpu
      workqueue: Give percpu workqueues their own max_active
      workqueue: Derive the standard attrs from the workqueue flags
      workqueue: BUG_ON() a pwq release before workqueue_init()

Hemanth Selam (1):
      workqueue: Fix typo "upto" in comment

Nguyen Ngoc Thang (1):
      workqueue: mark pool->nr_running as __data_racy

Tejun Heo (3):
      workqueue: Add for_each_node_with_fallback()
      workqueue: Maintain pwq->total_in_flight
      workqueue: Make flush_workqueue() visit only pwqs active since the last flush

 include/trace/events/workqueue.h | 146 ++++++++++
 kernel/workqueue.c               | 593 ++++++++++++++++++++++++++-------------
 2 files changed, 542 insertions(+), 197 deletions(-)

-- 
tejun
