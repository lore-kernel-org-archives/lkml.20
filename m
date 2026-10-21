Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626982;
	b=D9hLfdyqIhQBQkyz8JSbvOnxIjSsjtGF7b/xEXLo3R2X5x+LhGo8jZkI54vb5gmqZ79F
	 Gu4AyOw64B5D9h72jZwt9QLMSThHxss6VgHUHg8K2vxir8Kc4O3VY3klOjtPCl19+rXu0
	 Ike99olV4YYW3cP+R1Bs+s91Rw52lwUPfo3D8RdmBFxp9N7mcXmnU/tquLYG50Bs5tKvu
	 j5ekwb5Ashi+L1knn3Sx3JG4b0kZVVFZ7aeXbDUzO9NmLh1rtF0i+jAwYY7YCLOrP6skG
	 nIWEjrRDyTgC2blpREwbuwvq/uwC/Nkvc8jWjDdKMV15/nT3+4BV+WwYAJRtDk6f3vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pdvW81URxK+kguHARyBfUJeLatdEBh9Apj6t7huNpcI=;
	b=xB5dgsAsPljBTgiI79neHqnz8CtHKZ7en5sBGSJwZIuJUaIvPHEGE/kmlM0s/+o/vNUl
	 0oBMisqJYUvVlzX//QHP/7pLYkweCEgKdXy47QRz2rWFvi677f1WRUzL0pccSTiVoiT85
	 ALmrD/i346tcqo38TXZ7v1EJ+iR3/PxSm9zx2yrrYvMGfdcwADbrV0I6KM/fEahzStIWJ
	 ThJhew2RvUhjnkGpbTCmPfWfggyXYHkUh1Wqt5Vi703Qbc1RxlgR4mrwRdk+a1s7CipK4
	 k+u0dS5kwzKoE6NNtwwnFFtYYZ83GHTyxhiEu4iSt2irCjyvBctXjV7pwJFPVC+zt8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZynMVLpG;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA3C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZynMVLpG
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058f74a54so542608b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792626981; x=1793231781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdvW81URxK+kguHARyBfUJeLatdEBh9Apj6t7huNpcI=;
        b=ZynMVLpGxRSnw18VfVC7t0lMJCpiUrgGTv2buvJATgC4C5YHpVU/pZ9RCujIXxQ1cA
         A13vJMqLNwIaTEriORb0WGxBTVKRp44lkR5gGBerGa3M+3StxasxZTTYbZoiNJRdtgBE
         u3V3x8Vy5rf9/Nw6/E7t3oJhgv0WzoNBKeN+p4tjCXOTjU+XhjwDCZnVx2dU8CLOwQ6u
         crjxWlWgDWEU31lZMMLqtMrIJrTm8ROkyYhXEBa8MrFoptVvxPo8vqpQ9az+0iO835IZ
         2+zrld5O5OAjZKdCIFvGCkYyG5Bdy0VCx9l7ItLCyIyQfJFX2eHtHEHHB0zQJtHnGDzK
         ZW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626981; x=1793231781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdvW81URxK+kguHARyBfUJeLatdEBh9Apj6t7huNpcI=;
        b=t/tX5N0A8KU+lgsF7KGKPAFbyFXBZeVY1aB2qVeZOcj3HmKq7q8fFH52U/WZ6o/OXy
         3DKK2/Sp4aTP4m62cRsac/RdeU24Z/qvrkdKNjvQnM1t1tj3wYEhL72nKsBeVHIuCtBe
         uNPwvesRIS4N5GXcqJICnkRGPP4iCfdKHlFTkNMFEw6RNqJrZVSYXYnEfZAecZoFfATd
         eE1UVdS5yek0F5hO2Jha13ioFBzqksufMz4CsIPB/nDSdRVbTIYGKOLt7gs9SbbSBapF
         5tjOh/MyzmPomUa3R9QgF3tz6beRaJTyD9uZuBTZD2XKZlVInC9MF5mfZq8lDRuvCkNw
         VqIA==
X-Forwarded-Encrypted: i=1; AKwUvBxp2Ag0N9g7jU479P8y+Yzrdink2WTDMgb+IjJtJRUWDbeiw9uqAzxfEtBT6VqH0Rd1E4PuQevg+mHovyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbvrcnhD8ofS6cfIsk2dM/U/YPljxL/sjNKjuPOsRGIXT9outH
	l9CDMBmBUW6Z1wpWIV12iKsc66jvwrTQtvR3saNpr96KEM/1gGuErIQK
X-Gm-Gg: AYBFou3/TywF8mWLxZOM6hqNOGglSNa1oZLU6v6SjMJR6l7pFe25M4vqYTUtv2rrmmT
	1XRP+hM1Vm+R2t/UcADPsmZ9mZ+Xr6uEODsIRdtcGQw9Ft0vLSWOdVrbIyqVM1JNzoNKXCT0L2e
	aCmafpRA4OhQMwEBv2mwU0G/UT3hhfX6J6Fms15HERB8fkLV4XSYPT+PUowwYrUHNOCcHEGAd5A
	+bP/zwW5eMjK+vq3LFEIgVzK2/ctQ/gBiSNCZ0oCFnD+BLtDMnwOl1UxREMo7iOTXyJeitWtC4u
	QY6XTFo1paH+rsp+eLIpqO7prsoKPOu9dxHhsd2HDzZrKEqZG/spUVkhBa+xDdEho9zszqhYSd4
	BC6n53qmiq2TcEHlr6kINh0TURJ9jAs84pndbG2nXptLXe0yp+vo7E08ES7yhjjEKZn1svx49Tx
	yw7V0P/6nEImifyudl/q5GCVSQnSUwQhIZ5wzs4yCwHSbqY0QqkV2k5SnBwzdvQyKkTwaD98WQ9
	Tqbj5Iit3KeiBTA4zww3aZ3F/jmRgU2CNY9rOGwt3cDfjJaH+b7dlBgWjSNwV9iP2EEk5sVXhBP
	fQblPyOt8oO4Jg7Bf/ymZuou6sAV0xeOxDrxRRKs6AOWeEbtNE4hy0AVB8IL25DIaxG7Sla2FVH
	rbcLhfbu2NRklg+d4i08FrFRdC6kBRT4fPWY3ojKU87FZKWdp0dxhSyz3rBqNC32bDbU=
X-Received: by 2002:a05:6a21:3406:b0:3e1:482c:77ca with SMTP id adf61e73a8af0-3e287b9f8f7mr3134349637.5.1792626981460;
        Wed, 21 Oct 2026 16:56:21 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fa696sm1366733b3a.45.2026.10.21.16.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:56:20 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Hardik Garg <hargar@linux.microsoft.com>
Subject: [PATCH v1 1/2] mm: multi-gen LRU: use mem_cgroup_lruvec() in get_lruvec()
Date: Wed, 21 Oct 2026 23:56:05 +0000
Message-ID: <20261021235606.89545-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Andrew Morton noted that get_lruvec() has the same pattern as
lru_gen_shrink_node(): when memcg is disabled on the command line
(cgroup_disable=memory), it returns &pgdat->__lruvec directly instead of
going through mem_cgroup_lruvec(), which initializes lruvec->pgdat.

In practice all callers of get_lruvec() run after kswapd_init() has
already initialized pgdat->__lruvec.pgdat on every N_MEMORY node, so
this is not a runtime bug. Have get_lruvec() delegate to
mem_cgroup_lruvec() directly.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
---
 mm/vmscan.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0c57e4f1eb15..99e9f07fa2e1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2745,20 +2745,9 @@ static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
 {
 	struct pglist_data *pgdat = NODE_DATA(nid);
 
-#ifdef CONFIG_MEMCG
-	if (memcg) {
-		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
-
-		/* see the comment in mem_cgroup_lruvec() */
-		if (!lruvec->pgdat)
-			lruvec->pgdat = pgdat;
-
-		return lruvec;
-	}
-#endif
-	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+	VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
 
-	return &pgdat->__lruvec;
+	return mem_cgroup_lruvec(memcg, pgdat);
 }
 
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
-- 
2.45.4

