Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708953;
	b=IwomeOVlmphOnYG/RVNDxWicGHp12AC76xLLgdyOe7iWOE3PrmmAIzBQD0Z46MC7rMwr
	 rWuhIamdw/iWNEX/ymUaUT3oF1qhBOBxQ0IANDaqj7UDO+FItKiI9JIfgfdlgFey8Gbk1
	 CidZKQ9apn54sfn16pF39ckeAWuNWeKSWBVsKubGsiGNXY0R+95jNW+Ub0WVNni14vSHp
	 F9gh7VrRfnYBQDXWSwbhnMIXVFrOiZJL/3MEQ1SxOGud/Z//5Qq4yq57pjNmp1QUYPpuu
	 ItF7DEoqAZxqXDIo0iuoNPQRSIaK5Xf6YuqWo1jhsy2KCAY31d0bxglU53hixlMb3+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=8AUMAeaBpyNOsmFgWdnd2rtuFWotkqg/Z9hQF5Wti4s=;
	b=MevQFq/otLIbQgI2uBTm4n+VhP24jZxRcuU7MJo5d1iGr0D0D3t2REjJx4QzZjt3Outl
	 cQYVdYfF/UxmKKk6NJdms9/jAgU4+wP0Nwvhmszy0ffK+klNvwCUHGUIzT6D1Z2InMOu0
	 8eXInzSECk45XTkdWuR9gJdgegJIioAIUjXSv/oDYcxGF+aiG+mKrOInc4QAB8btbw6cB
	 Asr7EpsSV6RTSXNW6oLFIO3NqthbeuYF1ENyz+tXDpkAFQYTlL5DIyPQ+n+/eJZGRR6d4
	 eJz7wIiMezF1akz5Db4QH3Z3PgyVEMKFCpU7IWUjag1245qshXFluhPSETccZaSgL8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wYv+fPno;
	arc=none smtp.remote-ip=91.218.175.147
Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBCF606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBCF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wYv+fPno
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9/8G2LjUUlHPlw5gdjS0rjihOShSck/9PxHol6w9Ts8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794708950; v=1; x=1795313750;
 b=wYv+fPnoJur7Ny04Dmj9zxkRo8/bwqfrpuDxWFyDphzfdRViLaFYYy0QPfAaPlU6pC6h3Uhg
 gW57j+862BjysGxw/CB5agpl9E8sKEm6jZIExqQ8A6GzBHO2Xo/0rUmtVZM/+Gw7PYrbHyn4FDE
 CTUOV5qsiseZz0YeApXMfJ68=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfbb94a456fa27d0;
	Sun, 15 Nov 2026 02:15:50 +0000
X-Mizu-Trace-ID: bfbb94a456fa27d0
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 14 Nov 2026 21:15:38 -0500
Subject: [PATCH v3 1/2] nvme-multipath: apply delayed_removal_secs changes
 to a pending removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-bug-nvme-mpath-set-live-srcu-v3-1-d84651de6334@linux.dev>
References: <20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev>
In-Reply-To: <20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

With delayed_removal_secs set, removing the last path of a namespace
head doesn't delete the head right away. nvme_mpath_remove_disk()
queues remove_work with the configured delay, and bios submitted in the
meantime wait on head->requeue_list in case a path comes back.

A write to delayed_removal_secs only takes effect for removals that
start later. A removal that is already pending keeps the old delay, so
clearing the attribute leaves the queued bios waiting until that delay
expires instead of failing them, and lowering or raising it doesn't
move the pending removal either.

Requeue a pending remove_work with the new delay when the attribute is
written. Cancel it first so that the module reference taken for it
carries over, as nvme_init_ns_head() does when a path comes back.

With delayed_removal_secs set and no path left, the attribute is
changed two seconds later and the head is removed after (mean of two
runs, min-max in parentheses):

  delay (s)  before (ms)            after (ms)             change
  30 -> 0    26510 (26053-26967)        8 (8-8)            -99.97%
  30 -> 5    27994 (27457-28531)     6194 (5589-6798)      -78%
  10 -> 30    8131 (8086-8176)      29802 (29522-30082)    +267%

A direct read queued before the 30 -> 0 write fails after:

  before (ms)            after (ms)   change
  26466 (26017-26915)    4 (4-4)      -99.98%

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/multipath.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..35278b9c4de60 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1242,6 +1242,9 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	mutex_lock(&head->subsys->lock);
 	head->delayed_removal_secs = sec;
 	assign_bit(NVME_NSHEAD_QUEUE_IF_NO_PATH, &head->flags, sec);
+	/* Apply the new delay to a removal that is already pending */
+	if (cancel_delayed_work(&head->remove_work))
+		queue_delayed_work(nvme_wq, &head->remove_work, sec * HZ);
 	mutex_unlock(&head->subsys->lock);
 	/*
 	 * Ensure that update to NVME_NSHEAD_QUEUE_IF_NO_PATH is seen

-- 
2.43.0

