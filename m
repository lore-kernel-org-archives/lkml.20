Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494996;
	b=4grt7guZubKkbWV2Nf6kwTc5M2sMG40PGs1fk+d5CUOyilPWIbM2FWcreHqUWZdKDzkH
	 ggV7+D+yO1konwVdD9bT4xZ3cQ2gKJDwv03Jfj8QY6E09hpafb4QR9fAVvPHHfBLuR3kw
	 /SPnrMWTwAlPUI0ilV7jpRl2RbkvuPINu66uIXuCpNt0IGdvt/90KDs2gZ7i7KNGWTIkM
	 OFjjnZxV6ZTyhKJgyYZoFhOOvJNhyn35TVi7w9vji/SbiyFCYmUNQU1q3DHoVNj+t9gZS
	 7pvWczG21jNbqfAp0tkcL1Kck0rhQ2ErMVXdXvZtcuIFToBPLg9/ZFfwS9h/BKFLAXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494996;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jAT9uzZN4CHxink0sOWnNuooJmxzLwbXbcUHNUyhvls=;
	b=RHreCD8Mfxb3vvMU4YQ2yOOr3nlENsLdVV1HE6B+uD7wCiajAdwyAzjDYqsa0G42iTSA
	 ZCcfD65pKmF6GeWQbyxIZ1FKU/v+8gKg6LaxEa/tofTbdoV76wDNvPr8BPpJmY7kHv+p1
	 VKwzSxe+ynxtIp7JQ34M8iqKppQiHm052QsPnuZROKVYl9ep2cHxs0/JOEqGpxuyLi55s
	 yy4+WdRwlyIiMEqe/PspNG9KFDmKa1Ei617OmO0PTl9rxDUZXeXXEP99UEWOQw/JxgQrg
	 npcQmuwM01D4oBk8/UFQU+sm6yxepKNEwz86Mrtocg7/BwqkJWKUcf90wh/96UeaWqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="dOFZ/OV/";
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dOFZ/OV/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QylnOTCLVuW+y4dsWIYbQEgIFWSTXK6eCnnqIoOQp5c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794494992; v=1; x=1795099792;
 b=dOFZ/OV/ttunqUnkH5nm/NDIRwl74rRY4i1fMgxhyqMAaIw50mcAG4yxE7OddMc5o7INuJKe
 RXClRuvuNoLF8EixYvlqWXu4g+SKsvHoRNY78EsbzHWiYOmqd1WNg+HXdGUm8+cy3rU251TjMM2
 IfBle4rqxhPn2DhUnXwdXS3Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 40af8fb229db3720;
	Thu, 12 Nov 2026 14:49:52 +0000
X-Mizu-Trace-ID: 40af8fb229db3720
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	mingo@redhat.com,
	peterz@infradead.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 0/2] sched_ext: Fix entry-path contract breaks in core.c
Date: Thu, 12 Nov 2026 22:49:33 +0800
Message-ID: <20261112144935.583937-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

Hello,

wake_up_new_task() consults select_task_rq() but activates the new task
without ENQUEUE_RQ_SELECTED, so on the fork path ops.enqueue() never
sees SCX_ENQ_CPU_SELECTED and SCX_EV_SELECT_CPU_FALLBACK never counts a
fork-path fallback; pass the flag on the initial enqueue to match the
wakeup path. rt_mutex_setprio() is the only entry path into sched_ext
that does not call sched_proxy_block_task(): an ext task PI-boosted by
an rt waiter and blocked on a second kernel mutex is routed back to ext
on deboost carrying the queued+blocked state that
scx_prepare_setscheduler() promises never happens; block a retained
donor before the deboost routes it back.

0001 passes the flag on the initial enqueue to match the wakeup path,
and 0002 blocks a retained donor before the deboost routes it back to
ext.

Verified in qemu on tj/sched_ext for-next (5b740a72b55c), same kernel
and config with and without each patch, comparing stock and patched
binaries; the touched core.c regions are byte-identical on this base,
so the runs carry over: with a probe forcing select_cpu() fallbacks,
40k forks produce 0 fallback events on the baseline kernel while the
wakeup side counts normally, and fork and wakeup paths both count 1:1
with patch 1; and a driver-model trigger hands the scheduler ~39966
queued+blocked donors across 40000 PI cycles on the baseline kernel
with 0 with patch 2, PI chain traffic unchanged.

Based on sched_ext/for-next (5b740a72b55c).

Tao Cui (2):
  sched/core: Pass ENQUEUE_RQ_SELECTED on initial enqueue
  sched_ext: Block a retained donor before PI deboost routes it back to
    sched_ext

 kernel/sched/core.c    | 17 ++++++++++++++++-
 kernel/sched/ext/ext.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.53.0
