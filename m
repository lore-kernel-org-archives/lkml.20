Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463106;
	b=HezuB+OOgPgYNtKxXGr2DCSgDrENQ4an2r1aVY2Cg33PJmBb9BIO+hUJmHul0yu00Vuf
	 B85QG93OJHzFuduj2ynMdIYac5NFp0zi/5CF2B2aNnOOn5PmPr0VyI+sIwNQ1g2q8/Jc0
	 qf6rFNnThfnR1UX23Gf6VTFD3WAsfGfbj3hMcXruLVHf+1yWbjEnfdMDL3q63vEEq0Rdi
	 QVvJu0nL2glWf/J1vAeJ4Gf7Mk3WJjWA7jZujUcRhiZzP0maMAunl9Y59pjyNUZrl/Ipl
	 DBMO3dcARn7WO+NlyKTDmr+lNq2BEpoaTrzRb0Q9vlwNaHQo+/5JGuq85KLHQUvW9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
	b=prhj4N8RnUGzgpPDU14mMySZZcyNYR/XmAuHv0+Dd8nvRWg7y7v4h29T6Q6fPZ9wzhFY
	 rHxRNdIdCKnnzyMRvNQqZebNDP1W8L+GUSzgiL4vTAHycr/+Y73dI0dufoPgAomd1y8qZ
	 JJ7gMz1x1VfPH1qX9fNxtl20Q7hRs49egVFlZa3tM3qN8YstVewQJrKdBBX5qesZrvwBw
	 Lio4fn8/S7OavnbMUtQogffNpaKqcCnkGYtscS+MFzmLMwgMyh3ucHwjwLxpE2BzYAoco
	 nTqFrdl8Bpulaa4p6P5dXQ60OfWPDaLfcqW4lz782FGVqzOHbYrNbdR8LyT16uBOaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmfxdSXQ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ED5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmfxdSXQ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a17a332ecso2914285eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463105; x=1794067905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
        b=hmfxdSXQagFrJ/RPtvA0lmlfJqROZlewPSFHXlNCCaHmmNOK806nQsk6AQIsRyf5X/
         jmgFiNDskJpx9XTfsZ1wEFW9yM4HlVSO25EsersxA3hlXbfmPQkawUXi2yJqVTNfIL3U
         6MXc0cxMg0mvVYwWtxJ4Kcf4Ev4eUjns61ERrE97DXjMVFe3yHy5VUGs/N8uBQw8hBxb
         MVrdpcrS4sWZF0Ms5HaJNDM9787iLl4ydC50B4wLXx1iSXjNvNUKjjZOv78l+NdcRNO5
         6u69HTzN3heSc/o70KswsUVsb+sHoj4gmOY3qSQDexHLcHuhHbhLZpGC9i036X1/6jOM
         GxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463105; x=1794067905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
        b=arb+qnExl9sUqyFrm8qkwxUtoQMguY6T7WFWXCdZWNfrK+n9Et/xXstsMaiJN7VO2g
         biCsqNLp2Q105ELeRBy8KZa8UDWU4obHvV1aXZuK8+GE9rRGResS/VYbu3opNJ3qfYMA
         cEH1Yb+XyaEtOriVMZmDllgK1GGOdg+UqznIw8JepUd8Pc669MlJ2H5Vv1fvMhs8bF5q
         1P4HUMJ0AZfNyzAkStTAyuTcRS29XntYVSqUKwSQ2cnjw2G4XB+ejnK6sdvIzecU8u3f
         ICWo5BVV7NQV+7JBG9H2xUlySO+nA8GDYIpwg/3L7sxtOoGU0qJrx8YL+53pU8c1Qsxg
         7hBA==
X-Forwarded-Encrypted: i=1; AKwUvBzw19LsE1ljXdtQnuvrxj1RTSYUICR0adU3WnDunRCxoHnyHM/1q9E2R/H4pDhVDR5XNgYWazOqz185j/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSwpTQLSLugp9hZYuy3Zt+X1hm/9uQhas6P6db/gsWUzTXzmMs
	lBNZDcDIl9zj4wfDiZrkHsnhUjXx5CrLK/zIHJpa42jwUbUJ5bxcX8wdr4ql9sj9
X-Gm-Gg: AYBFou1sX16lJt66taR4clus0eR4SKFG7bD65XcpZq5g103Bl8vl9Zpb/tEQQ63aJB4
	pm5ij6DHHkooy1mNvFU57CXPlzSdInGVqMbPthqqqPscAnZ8ikSyZW+3Qur3GCuhANPJ1IYCAPN
	UWcppx37rmMAnVSJhN1U6G7P8gQJk9MCCfNrpTEH1IrFSKG67+Nn8aDG1Mlj3SVnsFhksyQJZVV
	Y+66p8ZrLBp5RbmclyewHy8mixkAnrVF/Pqj6DzKkvSlCnczFQ9i1FkVZjIRYX0+NMSDK4fhl0n
	ZeslIIFSiphIiwg9Yw9shN7aIIa6AqXzA7af23qQN2B2e5zbKCp/XNtqUShYyZYD5P1azvQlFYd
	/tuZh4CzNpLW/79AIhRDbiBEVi2aEHzbAq+osP7Ba7dsL+QcIa8PeUFdgQ7Z97W4XRW8+2dzuuy
	fnq4/XHnMADSDTCBpY+LINnXJUcnEG2gBiY30w85cQ9sW0NqtdsbwYTX7nHYkAEG3mZ3mBPAolB
	ZkDuEElL0y9XzoNDx4htoAi/SXQ/NixJeqvD9xVyMTyiJtXjJY3+JQttD2SyKtBg4VhlH9rl+5v
	hMiHkVpxd1zUVjk/39ElCmJlh/TH4hP/EpY=
X-Received: by 2002:a05:7301:82a:b0:351:dbc:b663 with SMTP id 5a478bee46e88-36a4244f9f6mr8782238eec.31.1793463104342;
        Sat, 31 Oct 2026 09:11:44 -0700 (PDT)
Received: from JMD ([112.133.220.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm20270364eec.20.2026.10.31.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:11:43 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH] remoteproc: core: fix integer overflow in rproc_da_to_va() bounds check
Date: Sat, 31 Oct 2026 21:41:30 +0530
Message-ID: <20261031161131.1647-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

offset is calculated as da - carveout->da and stored in a 32 bit
signed int, while da and carveout->da are both u64. For a
sufficiently small da, the 64bit difference is truncated into the
32 bit int, bypassing the offset < 0 underflow check with a small
positive value. Additionally, offset + len > carveout->len can
itself overflow when offset and len are both large, providing a
second bypass.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < carveout->da). Replace the
addition-based overflow check with a subtraction-based one
(len > carveout->len - offset) so no intermediate sum can wrap.

Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..d5fa9d23bd5c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -198,18 +198,20 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 	}
 
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		int offset = da - carveout->da;
+		u64 offset;
 
 		/*  Verify that carveout is allocated */
 		if (!carveout->va)
 			continue;
 
 		/* try next carveout if da is too small */
-		if (offset < 0)
+		if (da < carveout->da)
 			continue;
 
-		/* try next carveout if da is too large */
-		if (offset + len > carveout->len)
+		offset = da - carveout->da;
+
+		/* try next carveout if da or len is too large */
+		if (offset > carveout->len || len > carveout->len - offset)
 			continue;
 
 		ptr = carveout->va + offset;
-- 
2.43.0

