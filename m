Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447157;
	b=1tIizF4VV9brdAwIHyQmOytXikIu2HhN5Sjojz1o8BISYNliUlMynyXt4cgaHDZa25Yo
	 pBS8FyCnTw31z5X63Y6Ep1MpM71A3+rHoIYxqRkAfJG+8qc8H6wYmDgZzYrgsxCmNd+Mi
	 FIUEUz/UZQ+CvE8QbY4u8YKg18Zz6onCghcERViLmUA99hSqCkMFY6zSBhbSM13JGUfly
	 3SDoHgDSxM38uot3twA2fVce1IA7uKVypMDPEsAbITIAjjhCWx05c3EB3uPrOLp+3dF4R
	 SgnP2liykSzXxq0P6AbzD8C78dMSB2/50rUtS/8Vtte8403xgIQWXXiWlGsiH9XJVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447157;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=96+MiFGPO2U7PNuJNe4GvGKx5aN5k6zWtMq8p7nurjU=;
	b=Pn2PRIT81qQ+ZRph5io5Af5yyeQ6Z3dkNRIGTG4K1tkbmM7vYbx/zkPQTF/XH6Me/nAF
	 qyZAOk9LWAT5kvSM80/BpWgMK5Llov77tq7DYaqsJszChbOpW50K1Iz29slBM71cDCew/
	 moOJI3zcGF6IhVv2RJWr8RXlTFE6elQxaNaVgF9YXUchchMvHW9cOYio7uVzsjTJRZxY2
	 EZNEg7Vn5/E+pNHQ7sYEwr9LJCjJNPqvN90i9MKm4JBb2W8Nz3GuZpO3bTWz5Ori55xC3
	 JUbiaixTpvIYcvyjc7BDJH1GWW6EbkxOBWz5AOeHwamckQ//cTcTxdcwtY8ZSxr6mNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P5GQvKtD;
	arc=none smtp.remote-ip=91.218.175.240
Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B9F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P5GQvKtD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sPpIa3e7L1mAcoyZ9LAbz3c730yx9yguIyx0GpYaPmo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794447154; v=1; x=1795051954;
 b=P5GQvKtDgYWwg6294JBP/iDUfSd3unmRBLbU2Q5X1Rn/CSrNJYczu1Z8Gy84DaPexwIfgMU1
 BdbcQM0Fkzo1e348QZXhaIs7ZnYdhG56sIg66zAwH4r4lv06/xkkrJ1AjGpG0eLCf7rSGmr1KxW
 HSr1FPIPPWW142PpSm8xYCSo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ade9aa4cce312ce;
	Thu, 12 Nov 2026 01:32:33 +0000
X-Mizu-Trace-ID: 4ade9aa4cce312ce
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] memcg: flush nr_charged_bytes when the obj stock trylock fails
Date: Wed, 11 Nov 2026 17:32:20 -0800
Message-ID: <20261112013220.4064478-1-shakeel.butt@linux.dev>
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

When interrupt code, such as an RCU callback in softirq, runs on top of
a task that holds the obj stock lock, its trylock fails and the bytes go
to objcg->nr_charged_bytes. Nothing empties that counter while every CPU
using the objcg keeps it in its stock, so it can grow without limit.

Users see memory.current and the "kernel" field of memory.stat keep
growing while the cgroup's real usage does not. With memory.high or
memory.max set, the cgroup is reclaimed, throttled or even OOM-killed
for memory it does not use. The counter is 32-bit, so after 4 GiB it
wraps, and those 4 GiB stay charged to the cgroup and its ancestors
until reboot, even after the cgroup is removed.

Fix it by uncharging the whole pages in nr_charged_bytes whenever the
trylock fails.

Fixes: 200577f69f29 ("memcg: objcg stock trylock without irq disabling")
Reported-by: Chris Mason <mason@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
Cc: stable@vger.kernel.org
---
 mm/memcontrol.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index f5f567f7d4a9..091401cecf39 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3553,6 +3553,8 @@ static void __refill_obj_stock(struct obj_cgroup *objcg,
 	int i, slot = -1, empty_slot = -1;
 
 	if (!stock) {
+		nr_bytes += atomic_read(&objcg->nr_charged_bytes)
+			? atomic_xchg(&objcg->nr_charged_bytes, 0) : 0;
 		nr_pages = nr_bytes >> PAGE_SHIFT;
 		nr_bytes = nr_bytes & (PAGE_SIZE - 1);
 		atomic_add(nr_bytes, &objcg->nr_charged_bytes);
-- 
2.53.0-Meta

