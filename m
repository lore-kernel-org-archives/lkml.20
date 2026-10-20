Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474507;
	b=Y3lc9jfd4bnw+n3lg7JEW3UIEnNDg9piGXgkzIK7O18VsN1372hNd8hdzoLkrn7EHb1O
	 wQnyPJOr4Y5/P91quca65Z/wsDZGzy8MuRNcMy4ZDYkkuSOz6As8D7ouDQW3mTpb0VMfv
	 L1rUkFKnWdZnZBnHpsEURQXSTuVQoqdF32BKPjh4M5EYhTSRWWlSmthJUl1lO20ShSurj
	 r0b/rIkJfieTJUy87zISNU/Or/c8YIHTGmzQqhvvGT+gckvbuub3jXxRDxXGasluoZ2Wy
	 GwzHJLQgKM14GOdR+rPJb+l7jTw7qwYwVSIOlc9/YMhPRLG3gHIynszAv0j7syVq6iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=47QGolyVJG7rJ7+E1J8PPA+rcCQGmFElB+S6NGZ8+EY=;
	b=lVtkUs9+Za/aryh4N/L7rW7+E7MtOuv7iQc2glnr7B+M5cE8+HvbG1E7DWenv3fY9N1J
	 /0IfKfABYP3nv9J+EHHtBPGB1mFVnrCXhNG+Tb1b9VZpac+uIJTAlEoBU/UK05jGAFmvy
	 SxpxY+tjwYD90NqFG5gewHuzTMmBO841b1V5uPGAIgUtvgTqF6lX7yPhhLsfAHgrlche3
	 LjEH3Y1Lv8snb6cxPdto7MjWrTcrn10IKJpd8QAhIO4SN2Z7HYDYNuf8zkOjsTXK/TIY7
	 E9psXJGZMzqPS1k/i8YSd3cMWvqDChrpDgivj5S1ltIYsu2Q3HzAtYpyRAz28DWXjeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="J7+/EzjD";
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FAE606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7+/EzjD
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9178d514951so23771096d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474506; x=1793079306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47QGolyVJG7rJ7+E1J8PPA+rcCQGmFElB+S6NGZ8+EY=;
        b=J7+/EzjDDM8MX6XLUBko7UFGVrBZkdBDyWc9qx5kP+tZ3KwDFE7D6q3CKD5cRrqacw
         CNcX4W8Pxj3/tTXQJhTaUVSswkK8BF6ADrYHSz+RIkOAm2gy0YL3ICdpZe10spqidpOw
         gkScM6CKVYusUSaaqw3n8biu8XFEboArnKEEHDRN2rL006ZCK6Xgx/YsLtFNqmO1qqmy
         3zR6vs7yqWK6+N1uFGV/bQ8JNdMGdlml8I0jxxAioL1+rbSL74AO4L6EQVa4fUZdoXVW
         njyaVsdfgkrouMxvfr0H6Lr1QR+dsPrUxDwchswSuq7c5PLGUE3CTclxqU5+ns6OBloB
         T4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474506; x=1793079306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47QGolyVJG7rJ7+E1J8PPA+rcCQGmFElB+S6NGZ8+EY=;
        b=DkM3SF9njaYaQyVn3Gey2qlJtOk7VyReqPMDHfTP/yX+53X6Bp1theV7Enqd6Gp58u
         lHNZFEulnYALEfD9ewTn2bC3XfKN0Hjuq7OVPzpLHrBmZVnm9EgEQUsXTWOwEbbEulVB
         MqYhb4xlQD/zw2ZD+La4cveIG7QVDVFtlQomC1PbQ95XjEFhjwt8TM4VIxlj9fona517
         yxofzsfkHYTNfyml+5/jk5rJUiz8Wzu2mA9aYYnZVFbt4dswsSt45KBV88ocU1BWbWSl
         iC567BLt3PlXM0qpgrvOQB1eE0w9OsjFOwit661+Pz8es52t+DR3aRHxWqJM8pWYDI3T
         +QLg==
X-Forwarded-Encrypted: i=1; AKwUvByjL6xA0qNEFH36bre+sBKc12Rm0j8XY9rTqiN7UBkX50AuHWf557bZwGSbopwjcZEHGEIn22zgfVHPTU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkLWKk0YtZIi7PlVSth/BUAgBzM5IRyPe7cH7uBOvXjaYnQeYc
	EIWo73IxDMuf7CXbmdLMXlmjwIpFVf2tWDcJ26R+ek+P4JX3QoCo7Diq
X-Gm-Gg: AYBFou0dOj7yUVDdaShXhdF3MwewlgzQLvoaVtixSXeZZ8xhKku1dN7K/Xe1Ao2E51m
	YLcXECbedZEJhng5oInt7thMW7EX+EssxH0qiN+b2yZsRRf8t4oKC5ykvUSHPzpRoRyomAT/VgQ
	Y6yUf2fxcSGjKnOb9WNrkZWgX8YFwANHT/OEb0RyAU801NBZ8cIcbHTrm8bJFojr4zd/Iw7FelH
	iVHUI8UoIONWgWb/LCwIEMq65ujt9SONtihmI9t1DN6TMhbDUSPKc/g5WB5czeEoqpwMP9vZlXn
	sGdwVa9T+LAakJ/nzi9iVXMKAZ33sYBhtC/w3a9Fd5r/vHpXvLfeyPb7zZjhIeBcDzAqxESInZs
	WbjO1rWtDDZ+VskcoSwI+0x7hb5qGpNXM4APocPDbp9Z/NG5mJytv0muA0nlhQYoM8klSmznAfh
	k1AeTX02HJ3RxRQVFwmAPHrnMoX/ghW/yPFz3Ly/Fyso5dPGXjQ1/xz33RV3HmGESP+vtVps2lT
	qBfv/ROhZCK78whmN+QVw==
X-Received: by 2002:a05:620a:2990:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f29d69e08mr1677471085a.53.1792474506083;
        Mon, 19 Oct 2026 22:35:06 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:35:04 -0700 (PDT)
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
Subject: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB invalidation fails
Date: Tue, 20 Oct 2026 01:34:23 -0400
Message-ID: <20261020053435.1179054-5-oss.patchbox@gmail.com>
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

riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
right after riscv_iommu_iotlb_inval(), which does not report whether the
invalidation commands could be queued or whether IOFENCE.C completed.
If either fails, the pages go back to the page allocator while the IOMMU
may still hold cached entries pointing to them, and whatever their next
owner writes there can then be walked as page table entries.

The kernel-doc of struct iommu_iotlb_gather requires these pages to be
freed only after the cached references are gone. Return an error from
the command helpers and riscv_iommu_iotlb_inval(), and leak the freelist
with a one-time warning when the invalidation was not confirmed. The
other callers of these helpers keep ignoring the result.

This does not cover the pages freed by the dma-iommu flush queue after
flush_iotlb_all(), nor the data pages released by iommu_unmap() callers,
as the IOMMU core does not let those callbacks report a failure.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware or in an emulator.

 drivers/iommu/riscv/iommu.c | 63 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fe8e6d0f8a23..816d50c0f508 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -508,15 +508,15 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 }
 
 /* Send command to the IOMMU command queue */
-static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
-				 struct riscv_iommu_command *cmd)
+static int riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+				struct riscv_iommu_command *cmd)
 {
-	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
+	return riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
-static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-				 unsigned int timeout_us)
+static int riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
+				unsigned int timeout_us)
 {
 	struct riscv_iommu_command cmd;
 	unsigned int prod;
@@ -525,14 +525,17 @@ static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 	riscv_iommu_cmd_iofence(&cmd);
 	ret = riscv_iommu_queue_send(&iommu->cmdq, &cmd, sizeof(cmd), &prod);
 	if (ret)
-		return;
+		return ret;
 
 	if (!timeout_us)
-		return;
+		return 0;
 
-	if (riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us))
+	ret = riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us);
+	if (ret)
 		dev_err_once(iommu->dev,
 			     "Hardware error: command execution timeout\n");
+
+	return ret;
 }
 
 /*
@@ -1002,14 +1005,15 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
 	}
 }
 
-static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
-					  int pscid,
-					  struct riscv_iommu_tlbi *tlbi)
+static int riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
+					 int pscid,
+					 struct riscv_iommu_tlbi *tlbi)
 {
 	bool use_nl = tlbi->non_leaf &&
 		      (iommu->caps & RISCV_IOMMU_CAPABILITIES_NL);
 	struct riscv_iommu_command cmd;
 	unsigned int i;
+	int err, ret = 0;
 
 	riscv_iommu_cmd_inval_vma(&cmd);
 	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
@@ -1027,7 +1031,7 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 						tlbi->range.sz_lg2);
 		if (use_nl)
 			riscv_iommu_cmd_inval_set_nl(&cmd);
-		riscv_iommu_cmd_send(iommu, &cmd);
+		ret = riscv_iommu_cmd_send(iommu, &cmd);
 	} else {
 		unsigned long iova;
 
@@ -1039,21 +1043,24 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 			riscv_iommu_cmd_inval_set_addr(&cmd, iova);
 			if (use_nl)
 				riscv_iommu_cmd_inval_set_nl(&cmd);
-			riscv_iommu_cmd_send(iommu, &cmd);
+			err = riscv_iommu_cmd_send(iommu, &cmd);
+			if (err)
+				ret = err;
 			iova += 1ULL << tlbi->single.stride_lg2;
 		}
 	}
-	return;
+	return ret;
 global:
-	riscv_iommu_cmd_send(iommu, &cmd);
+	return riscv_iommu_cmd_send(iommu, &cmd);
 }
 
-static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
-				    struct iommu_iotlb_gather *gather)
+static int riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
+				   struct iommu_iotlb_gather *gather)
 {
 	struct riscv_iommu_device *iommu, *prev;
 	struct riscv_iommu_bond *bond;
 	struct riscv_iommu_tlbi tlbi;
+	int err, ret = 0;
 
 	riscv_iommu_tlbi_calc(&tlbi, gather);
 
@@ -1096,7 +1103,9 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
+		err = riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
+		if (err)
+			ret = err;
 		prev = iommu;
 	}
 
@@ -1106,10 +1115,14 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		err = riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		if (err)
+			ret = err;
 		prev = iommu;
 	}
 	rcu_read_unlock();
+
+	return ret;
 }
 
 #define RISCV_IOMMU_FSC_BARE 0
@@ -1270,7 +1283,17 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 
-	riscv_iommu_iotlb_inval(domain, gather);
+	/*
+	 * The IOMMU may keep walking the page table pages on the freelist
+	 * until the invalidation has completed. If that is not confirmed,
+	 * leak them instead of handing them back to the page allocator.
+	 */
+	if (riscv_iommu_iotlb_inval(domain, gather)) {
+		if (!iommu_pages_list_empty(&gather->freelist))
+			pr_warn_once("IOTLB invalidation failed, leaking page table pages\n");
+		return;
+	}
+
 	iommu_put_pages_list(&gather->freelist);
 }
 
-- 
2.43.0

