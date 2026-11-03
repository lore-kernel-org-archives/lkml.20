Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716430;
	b=3DrKnP84ORr+Yh99IMTpQLA2I4UgwBaF8Moiu+ggDrWGY+4Yz4GbqjGUh6KbQZIrrgu1
	 M6b5czk409dmpBD0SZVCzDt+h9QMrHKT5vBtYcCTMu7fYxTdDiLTrD1l4STHx8L2gNl3Q
	 E2AOWmVAX+A9ALV9w4lS3E2DuTUOWa1cRpQu2LLTCOHhcFATMa7TeZarIKdvM5S8pnIa4
	 QEqdFLutFyZIUnE9kUQrNtSfF4Kri8kFea2+3y67C8dABY/Pf0sZ1fvrIA3VTgnAvKssE
	 R6ukoDuH2dq0LX1XZN5LR7EIWQ7L6WhgaK3hTCxajqk4zL1IyuBVRFdzH+k1EP7a8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716430;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-SRS-Rewrite;
	bh=QKIr2Lmc99Ed3YUlMDYRhCaWMe8tCOeGZig27dNb9wo=;
	b=RxBBmIvC71A5T4VC+8MnYHLu7m6Dr/Zg1aetdBnj9zHJi/Zs146IEkT8ZgSU+yMM6gXw
	 tznQ9qR/2DJbhgt6pBcAc3oDWUSvAAtIOu5A47l56FOGR1W2xSRP2bJKRljP9tYu1eFEW
	 REOsEfV46yFm3Ux/JNPYIu/h2F8n3XGVqncdz0Bn/LxAKibGGv5F2OW3GIpdb2H+xxN35
	 KDGHhxytOmXNhx9j19df4tsMfhpAdQ6LqBhtIERTXNWSBNQW2subpXp86BUbmexpAKFoB
	 ptoE8OA3qUhtp92BWde7Zs53/CM1ZI+drANpLqHHUe2X+QN1f0Hpo76MnudSgMlCkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=lst.de;
	spf=none smtp.mailfrom=bombadil.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZsGFShj;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A7606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596A7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZsGFShj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QKIr2Lmc99Ed3YUlMDYRhCaWMe8tCOeGZig27dNb9wo=; b=hZsGFShjrHWYr0c7atavZ5Nd3u
	iUSCexyGy3qhOUIMeZIZnsmy/Akuk9WwEjyX9o/CjFWZ3VeW/dqBM29T70XcDhf75m7SRDHum2f1l
	9g3ZsKP0/R8NJMZDtQCC04eolLBmAQ6lQYcnt7p1PH5+g29WEQCO6Ubp2JOSzDx+gxFCTzzkdtEJV
	E84d4Sn7SptYIycAqWfx5vj3QArgGiaKi4rG95aiLVOEkzT3q+2O9mM4ub/o6wYdXoWS23yTim1nj
	Q6ujwGhJzYb0K5pny8+CoCqznDcxo9Ks+A4rR5Ajb8ZomuTo/qNax0ujSl/mb801SWGkyCF+lCcZp
	aDW2M4hA==;
Received: from 2a02-8389-2301-9f00-31e8-efb6-e973-61ca.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:31e8:efb6:e973:61ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFa8-00000002jWN-2747;
	Tue, 03 Nov 2026 14:33:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: tj@kernel.org
Cc: jiangshanlai@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] workqueue: improve the draining/destroying warning in __queue_work
Date: Tue,  3 Nov 2026 15:33:45 +0100
Message-ID: <20261103143345.3803307-1-hch@lst.de>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Tell which of the two conditions hit.  And to avoid makign the code even
harder to read, move the WARN_ONCE out of the condition triggering it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/workqueue.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f2e8071a6f4e..bea294b00d1f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2428,15 +2428,19 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	lockdep_assert_irqs_disabled();
 
 	/*
-	 * For a draining wq, only works from the same workqueue are
-	 * allowed. The __WQ_DESTROYING helps to spot the issue that
-	 * queues a new work item to a wq after destroy_workqueue(wq).
+	 * For a draining wq, only works from the same workqueue are allowed.
+	 * The __WQ_DESTROYING helps to spot the issue that queues a new work
+	 * item to a wq after destroy_workqueue(wq).
 	 */
 	if (unlikely(wq->flags & (__WQ_DESTROYING | __WQ_DRAINING) &&
-		     WARN_ONCE(!is_chained_work(wq), "workqueue: cannot queue %ps on wq %s\n",
-			       work->func, wq->name))) {
+			!is_chained_work(wq))) {
 		struct work_offq_data offqd;
 
+		WARN_ONCE(1, "workqueue: cannot queue %ps on %s wq %s\n",
+			work->func, (wq->flags & __WQ_DESTROYING) ?
+				"destroying" : "draining",
+			wq->name);
+
 		/*
 		 * State on entry: PENDING is set, work is off-queue (no
 		 * insert_work() has run).
-- 
2.53.0

