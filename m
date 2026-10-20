Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474530;
	b=3T17bT/7LcmvVscpGorGf6lyp4fi3bbZPWyVuzhNxfIGmI/RKARGKuPfPv3idD2JNfbs
	 jSHwjXylFaM2fbYChhKBZZ6qcihNMty0c2nKXjf5f0cq6wTCO3It9jgjOCyr5gZnoxDT1
	 eePHZg1znenPlNeAFDFlZt+wOlxD2GSuZHi5rTqdZF4HtPMDatxmEVC0x77/n3E0gX+rv
	 t4O5MMkq9joMWnu/a3FlvctU9D7rhfJGKDvYBdok99WBBihsc37Q7zulD0FzWfyYi/jKc
	 hBsFBCv9GxQutzbZyfz+YlpLfY8diQNBLS2Trxtw2iCzLoZj+4EcDIUf/CrXq9TbfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UjLNCgx3WekQetaZqMO5VDYLOeTCT6zYxxBPC2GY2rk=;
	b=qoBByVVHQNSi1r5OhW/dUgjITy0dQ2JYqQLjXVHWZct+D0Tpbm0OQ9fSnqt1GwXN58uG
	 5T42gNY05RNVu8ybm+Uh1WHgC6NjGSAapZ0kPsZpQ4KRDNred6yhlf+LVw+MHTm9kVkC6
	 vg9mo6B/3mjL1k3vylaaVw++uu1yTw2AXtuKyuV7zpEW711rdXQ/QhhMrHpT/Pmw8WBXy
	 COpZJ8nuVJa4kmgCoJz6FRC+PHyAetg+HFOLMZOykJgptT6K40Q3fHKI27NCsKgvS1PgT
	 4ERlfRV+ZxpkWfw1GEBHxHV8KIrLgSaMfuygLTzhh3HlrF/MLV0myxpg9doa6Djc8yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CA4J2Xze;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC65606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CA4J2Xze
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f3c895a0eso152293185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474529; x=1793079329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjLNCgx3WekQetaZqMO5VDYLOeTCT6zYxxBPC2GY2rk=;
        b=CA4J2XzeXCFVB9Wz/2HnEcu7K2xn2YrJmkjga22U2kefbJdqXprckQme582npfZcLl
         HcEKm0aTc5uHZiCfwYuWRltveiRFxpmSWCgCdkrxh7Dd+JFCcu6SFXMvDYtT5CGyy0lj
         j1qifkaK6MKrO2IIU0cqyAdZa2/oGbSrRh7Kb3swpQhboog3wO9Pti+rhaYGUJNWJASv
         BNlrZnWVbpiQfekUxDDqDPhMXNQ0glkwPY6/w2hqa81oonl3YgELRjeiwL5+a1oIkI7+
         UjiiYH/9qdB6dXlhqrRwUwNNpHSMyT4FHL/LeIqgsCHZ7WDrKX3EkVZGTjphmpUzn6LJ
         PDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474529; x=1793079329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjLNCgx3WekQetaZqMO5VDYLOeTCT6zYxxBPC2GY2rk=;
        b=j/ovw3HtlH3abzSVfTkSBb8yY0mr7KxJCVnJxApc2p7ot4dTXv0uUrtzyY/QgSABqa
         iLeNVSL5RSz3auupsigcLQxikSSriS3v5/wrjwROwAg7SrMPRQ0Ovxm2Cij/e2a2AWBe
         G+DhSipOYRCbjCFnOSbJZ9MoFu16pmxHnvDikvah0oN+igB1ODaK1P5Jxkrv+U1usXIG
         086S4Ft6RAgQcDkpr7gVybHJnNI6UhcralKS8Ogwoeh8muW0TvVW+OCCSeJ8A4Q+fJLQ
         bvp0NoVzNhqAvM3vGWCNRrlweENDmBmw1ww87Z6R3/QNW1GYnvPcut1OT2eDdZB1t3XH
         rTbg==
X-Forwarded-Encrypted: i=1; AKwUvBwXSMlb1smIDilOq8yulxuwDDi749bX3+f2Ec50OT+t8Dbw+auz/wr2aQoUwKmwpGZr9vWa1DSjvgrLIxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb2keogv2IW71rh+Ho+KSEYC7ylvOYME5JQAxRtJ2XGIvimMME
	qvNP6HGXDDtKp5h5NoWfb+dMS8Xl9qo5Td3eZAl6WT/cOAbH642jbCj+
X-Gm-Gg: AYBFou0woR0W1RXomMWyFbSLc0GhXoG454BmCDtAgjLEUjqaTuZ0eoWgU3Wmyt2ybaY
	Qog+xoQgHLE4zioVSg/CukyFno5ZABv/FOREXjFQfgSjV9hqFD3was4t2na2XRTbrIqAMCkfpex
	s9wb5+zWA1ATn0OVjdJZLR+haeH81g8Qn9FdLxQ1Lz4cy1sHk4XoOt8PmBjVW3a5IxPuWRCLV4M
	fXt1tFyeXwDRxYgVcfdx6tdROdpcAUNGtLjqOefESesje5r1wFsPW+ZAvA07tTgedJoPk13AZhK
	UvtKcy6/l2/DAURlbclW1HT+crHL50GVg194elNqdvbIByaiQ9e+7QvXilwx3mJ9bj3rLcfOg30
	Xrd5s75jOhqqWb06Nxce/m0t9Mwgry7fOOnS3lYTrG6TKUulQWbC05jyyumUlL6J9tcYd0lyeW+
	9xVjQkDq107FKSorzV4dQtD3Cg1j4aQFxBT6cOVo0YrCECCzJGi/9a3k+Cv/ZdORXPW9eVu9NQH
	2zFq5neMjwo7ucR70WOvopMNPL8YHSo
X-Received: by 2002:a05:620a:2602:b0:93f:5ac:14a3 with SMTP id af79cd13be357-93f29df1d42mr1601610185a.73.1792474528522;
        Mon, 19 Oct 2026 22:35:28 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:35:27 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1 2/2] iommu/riscv: Do not report a stalled command queue as completed
Date: Tue, 20 Oct 2026 01:34:24 -0400
Message-ID: <20261020053435.1179054-6-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020053435.1179054-4-oss.patchbox@gmail.com>
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
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

Since commit b2e5684558ed ("iommu/riscv: Stop polling when CQCSR reports
an error"), riscv_iommu_queue_wait() stops polling when CQCSR has cqmf,
cmd_to or cmd_ill set, but then returns 0 as if the waited-for command
had been executed. The hardware stops processing the queue at the
faulting command, so an IOFENCE.C queued behind it has not completed,
yet riscv_iommu_iotlb_sync() goes on to free the page table pages.

Return -EIO when the queue stopped before reaching the waited-for entry,
and keep the "command execution timeout" message for real timeouts; the
interrupt handler already reports the CQCSR error bits.

Fixes: b2e5684558ed ("iommu/riscv: Stop polling when CQCSR reports an error")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware or in an emulator.

 drivers/iommu/riscv/iommu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 816d50c0f508..2a95cb8c9e4c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -371,15 +371,24 @@ static int riscv_iommu_queue_wait(struct riscv_iommu_queue *queue,
 	unsigned int cons = atomic_read(&queue->head);
 	unsigned int flags = RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
 			     RISCV_IOMMU_CQCSR_CMD_ILL;
+	int ret;
 
 	/* Already processed by the consumer */
 	if ((int)(cons - index) > 0)
 		return 0;
 
 	/* Monitor consumer index */
-	return readx_poll_timeout(riscv_iommu_queue_cons, queue, cons,
+	ret = readx_poll_timeout(riscv_iommu_queue_cons, queue, cons,
 				 (riscv_iommu_readl(queue->iommu, queue->qcr) & flags) ||
 				 (int)(cons - index) > 0, 0, timeout_us);
+	if (ret)
+		return ret;
+
+	/* The queue stopped on an error before it reached the item. */
+	if ((int)(cons - index) <= 0)
+		return -EIO;
+
+	return 0;
 }
 
 static int riscv_iommu_queue_wait_for_space(struct riscv_iommu_queue *queue,
@@ -531,7 +540,7 @@ static int riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 		return 0;
 
 	ret = riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us);
-	if (ret)
+	if (ret == -ETIMEDOUT)
 		dev_err_once(iommu->dev,
 			     "Hardware error: command execution timeout\n");
 
-- 
2.43.0

