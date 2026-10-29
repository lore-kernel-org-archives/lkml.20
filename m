Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282010;
	b=Sa1XPzwSjur3DD/CqJC1t2jsrL9L2gQkQYPT42Jexj5z/Otw84Lf0YacgpF7pIZ45biR
	 +C0vFwc9monteYE3p3Yr42dM6QVkJBOGhCPsOeUxYzxdPEBYxM87pWAPEls4wbCJtiKb1
	 YloInp8sbJAQR9+LIUP3ZXSo3yz+PYg+sISw0g6HCDYvbwE/EEtIj3aVQr1YIf9noSue/
	 zr70H3qdynJci6gJvjR+berN7RvIRnJaY0s6/x8G0ntgC6HDPDR4UvbHIgiTVgrzgwZUF
	 6UHwPt9BJ8BJMHOAKGPh2vOmfBWCn3luRNt9Gh2/OKd4zeZBSUNXjT2nIcGY5ZN7e7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d4muoCURO4txmduRtzfsIk82oRRKuCzaLk324mt4aBA=;
	b=lBIQDpcsLEkb80mqOEFQ3xm5cPMZQmtpnyU2JymlUyzOyGn/+XoSwtwzRiTDYQYfD9WN
	 by+8nvhVcgIOuIrdqm8GvMu/TELjBxvPUM9L76gb3gsUiAD5/YrlWbH8Y4lNew9Qpges6
	 iVPi4Za5KmdBJhYptqN+MzHz+qY6fIOwd7EuWEib2rJZqyZRtoKVXqFoy/ygUW7Jo9W4k
	 jM/ilo2/NxfCzt028FHzYCTpmf9D4OwKtLKYdoqQ0cL7kKK3IUl/+PKHNvFDHfdAB6VTb
	 T4LbVsdGW1rOP/6WceuR/YpfVR5y66ka4eyWwrJjR1l6BonIdk520wvJgYD0LLDR4zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sII4Fe+3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E3260A6F4B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E3260A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sII4Fe+3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1785347f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282008; x=1793886808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4muoCURO4txmduRtzfsIk82oRRKuCzaLk324mt4aBA=;
        b=sII4Fe+3cutq0TltVTou1NmPEWgJFxLnSOqFr8L+8bYDGlzcFeQOEvqkboOJQmi1TZ
         SHor1M6TGGclRvzJkRlAYZYBH54d6tozrG3OCREM/mkClTQ7C41fhtnjpWEKfu8cDvAQ
         sEPq65QAIWLNxSJ9/ds1VLyOeDkmXO1su1ZkNlY4ljLmbpLKK+Pe98ed0YbqQzcf+JsJ
         KJfbaQXXiiKrYnXMGOkXUNP7SXr50J0GYdsFKf0sIhMa6nImy1NAthPOAXBSv2ye2dvL
         N5Z2I/fRhBlY+cjd3V6aVBDUd76iz32zRTdLpPdWpDiWeCI0vAnD4WMWTZd5SoJc9Gnw
         h0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282008; x=1793886808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4muoCURO4txmduRtzfsIk82oRRKuCzaLk324mt4aBA=;
        b=DY7eNYTzu8QW5NR2QVSvhUsKRgNgv5s39uR5/sd5GWlcWSTN8fe8zpelOzdnJgML/J
         TSimQ6Mdb87s0oskTVCkl2cEu4INiGM7yKfg8n2LgzFntEK//Lhgdg5cJfTPwtl2EySU
         kKTf+o/mT7pPyyOx6o1ApGglvFkNDbqSl8hbwxHLxmlj/rp26sQTPDw75Z0J89ZUtgHy
         8xU4hScp51/Twom9DiSG4kPspSx7G65XFB2zPVmfYym5qtJq2SqrK5ffOeE3DP5oRPE3
         IYmBc1xzTDchh0i+tqpBBQguDt24CsIcK6GKbIKMMHhROMQ3Sz7ozfwuXCWriIPuJSan
         BIDw==
X-Forwarded-Encrypted: i=1; AKwUvBxJyOWvQJOftKbRAvIyPr1c4G4KZyN4+rstEXEoUbKgaaLe6dLIeiUD6eB2K19FkUf50B4hsZanD8yvo/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYID2lCUrWimxe0xRygmQWODfDPhVQYi6kKtYs6YEcL9wVW/wADg
	IAWK8ma0F1BaTR+qmyFZUuuWhE3gN3X/II62dg6Xgg4TRydAYPjRrGo=
X-Gm-Gg: AYBFou26PQZGlzUmQzkI7hZ3wApy1Wyb44KwAxo0Dru/jPJhh+QBc/QJLWG/0LuvGro
	upB4DtMaLF+HMDzWM1fUbY6J32Jn8AB/LnfoujCXljB/MjWjLortIb0XydEaDu3G9i3GMyAouZX
	480KBB5+PB056JlTAkBdPfOcnCUpIPOZqlNr3yDisnHxbGGdFJgnmAmT6NGPMdwNrKU4NPF23IB
	qJV/VsnHD8n7QB2QSsjVWIz8HoAozSTNzNDD6bE3y9sXre8Kv5iXjZqfCUmqvTuHAekaJb+k3Z+
	5sOVDG4AJKBaY5z5Yjsy6oSZDz87E+PwNHF9EL/nYC/0HG88bfkILi2uILLyQhsMGtByPWecwR7
	h4Hf28EiffX2uS5iuPwTI3mLS6x4e4f6ySOf2oGbqWbP11priBGElvjo0w2LDw56zjXOLI6UK93
	Vfm6agYnXtZWdwOW4Cgg2+6xZ+eCLaJaMl35pk7mr3f9KqYPtj34vkl6xdi9Sb3KU1uR401Puci
	mU3NZ+iHaUkqoMATsqXhHRdQw3WvbQW37GQEqbgkYbsq98p50WjvQvbzIhXPAWxK21V87wHiGnL
	n5Ju+n8cKfFqyv304BRkh8YO4k3ZFHYME1YuoXLv7FQa8w==
X-Received: by 2002:a5d:6f0e:0:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e5d56d6d6mr12550769f8f.55.1793282007466;
        Thu, 29 Oct 2026 06:53:27 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:26 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:47 +0100
Subject: [PATCH RFC v2 10/14] drm/msm: Add LPAC submitqueue
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-10-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=12665;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=Vudb/cxCObLS3HWW52CK/cv5tchjqlb2SOL5lEFP4J8=;
 b=UUojngUfhed+XShhn5U0h0uHuRHT+5idiUzPWzFKx4s6uAsn9/vuYKwavuyXf2CKe5jkrYfRV
 nLWbVGTFJxsDIXeZTKgTCQR+ZK4PcXbxFQ5iIf74mMfVj/v5RI6y/ls
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add UAPI and infostructure to support sending submission to the LPAC
ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 86 ++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c  |  6 ++-
 drivers/gpu/drm/msm/msm_gpu.c         |  8 ++--
 drivers/gpu/drm/msm/msm_gpu.h         |  4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 14 +++++-
 include/uapi/drm/msm_drm.h            |  2 +
 7 files changed, 81 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e7bc12de650c..e82d0c0bc10f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -204,8 +204,10 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 void
 a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
+	bool is_lpac = ring == gpu->lpac_rb;
+
 	/* If preemption is enabled */
-	if (gpu->nr_rings > 1) {
+	if (gpu->nr_rings > 1 && !is_lpac) {
 		/* Yield the floor on command completion */
 		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
 
@@ -244,6 +246,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
+	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
@@ -261,25 +264,27 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 		OUT_RING(ring, submit->seqno - 1);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+		if (!is_lpac) {
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
-		/* Reset state used to synchronize BR and BV */
-		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
-		OUT_RING(ring,
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
-			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
+			/* Reset state used to synchronize BR and BV */
+			OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
+			OUT_RING(ring,
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
+				 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
-		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-		OUT_RING(ring, LRZ_FLUSH_INVALIDATE);
+			OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+			OUT_RING(ring, LRZ_FLUSH_INVALIDATE);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
+		}
 	}
 
 	if (!sysprof) {
@@ -493,7 +498,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
-	u32 rbbm_perfctr_cp0, cp_always_on_context;
+	u32 rbbm_perfctr_cp0, cp_always_on_context,
+	    cp_always_on_counter;
+	bool is_lpac = ring == gpu->lpac_rb;
+	u64 timestamp_iova;
 	unsigned int i, ibs = 0;
 
 	adreno_check_and_reenable_stall(adreno_gpu);
@@ -511,19 +519,24 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	 * If preemption is enabled, then set the pseudo register for the save
 	 * sequence
 	 */
-	if (gpu->nr_rings > 1)
+	if (gpu->nr_rings > 1 && !is_lpac)
 		a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
 		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
 		cp_always_on_context = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
+		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
 	} else {
 		rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
 		cp_always_on_context = REG_A6XX_CP_ALWAYS_ON_CONTEXT;
+		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
 	}
 
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
-	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
+	if (is_lpac)
+		get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
+	else
+		get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BOTH);
@@ -582,17 +595,19 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		OUT_RING(ring, submit->seqno);
 	}
 
-	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-	OUT_RING(ring, CP_SET_THREAD_BR);
+	if (!is_lpac) {
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BR);
 
-	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, CCU_INVALIDATE_DEPTH);
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, CCU_INVALIDATE_DEPTH);
 
-	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, CCU_INVALIDATE_COLOR);
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, CCU_INVALIDATE_COLOR);
 
-	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-	OUT_RING(ring, CP_SET_THREAD_BV);
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BV);
+	}
 
 	/*
 	 * Make sure the timestamp is committed once BV pipe is
@@ -638,10 +653,12 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
-	if (adreno_is_a8xx(adreno_gpu))
-		a8xx_preempt_trigger(gpu);
-	else
-		a6xx_preempt_trigger(gpu);
+	if (!is_lpac) {
+		if (adreno_is_a8xx(adreno_gpu))
+			a8xx_preempt_trigger(gpu);
+		else
+			a6xx_preempt_trigger(gpu);
+	}
 }
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
@@ -1220,6 +1237,7 @@ int a6xx_zap_shader_init(struct msm_gpu *gpu)
 		       A6XX_RBBM_INT_0_MASK_PM4CPINTERRUPT | \
 		       A6XX_RBBM_INT_0_MASK_CP_RB_DONE_TS | \
 		       A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS | \
+		       A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS_LPAC | \
 		       A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW | \
 		       A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
@@ -2039,6 +2057,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 		a6xx_preempt_trigger(gpu);
 	}
 
+	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS_LPAC)
+		msm_gpu_retire(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
@@ -2509,6 +2530,9 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
 		return true;
 
+	if (ring == gpu->lpac_rb)
+		return true;
+
 	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b50c57f427b4..d85f2536551c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -75,7 +75,7 @@ struct a6xx_gpu {
 	struct drm_gem_object *preempt_smmu_bo[MSM_GPU_MAX_RINGS];
 	void *preempt_smmu[MSM_GPU_MAX_RINGS];
 	uint64_t preempt_smmu_iova[MSM_GPU_MAX_RINGS];
-	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
+	uint32_t last_seqno[MSM_GPU_MAX_RINGS + 1];
 
 	atomic_t preempt_state;
 	spinlock_t eval_lock;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 26ea8a28be47..45e7f8b72dc9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -71,7 +71,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->pid = get_pid(task_pid(current));
-	submit->ring = gpu->rb[queue->ring_nr];
+	submit->ring = queue->ring_nr == gpu->nr_rings ?
+		gpu->lpac_rb : gpu->rb[queue->ring_nr];
 	submit->fault_dumped = false;
 
 	/* Get a unique identifier for the submission for logging purposes */
@@ -599,7 +600,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out_post_unlock;
 	}
 
-	ring = gpu->rb[queue->ring_nr];
+	ring = queue->ring_nr == gpu->nr_rings ?
+		gpu->lpac_rb : gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index aa3d6ff456fd..4244d9324cda 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -537,8 +537,8 @@ static void recover_worker(struct kthread_work *work)
 	 * needs to happen after msm_rd_dump_submit() to ensure that the
 	 * bo's referenced by the offending submit are still around.
 	 */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 
 		uint32_t fence = ring->memptrs->fence;
 
@@ -561,8 +561,8 @@ static void recover_worker(struct kthread_work *work)
 	 * Replay all remaining submits starting with highest priority
 	 * ring
 	 */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ring->submit_lock, flags);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2f6a96e560b9..877f88ef90d9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -491,9 +491,11 @@ struct msm_context {
 	 * create at most one &drm_sched_entity per-process per-priority-
 	 * level.
 	 */
-	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * (MSM_GPU_MAX_RINGS + 1)];
+
 	/**
 	 * @ctx_mem:
+	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
 	 */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 1a5a77b28016..a0249430bd00 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -175,6 +175,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
+	struct msm_ringbuffer *ring;
 	unsigned ring_nr;
 	int ret;
 
@@ -209,6 +210,16 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 			return ret;
 
 		queue = kzalloc_obj(*queue);
+
+		if (flags & MSM_SUBMITQUEUE_LPAC) {
+			ring_nr = priv->gpu->nr_rings;
+			ring = priv->gpu->lpac_rb;
+		} else {
+			ring = priv->gpu->rb[ring_nr];
+		}
+
+		if (!ring)
+			return -EINVAL;
 	}
 
 	if (!queue)
@@ -227,8 +238,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	} else {
 		queue->ring_nr = ring_nr;
 
-		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-						 ring_nr, sched_prio);
+		queue->entity = get_sched_entity(ctx, ring, ring_nr, sched_prio);
 	}
 
 	if (IS_ERR(queue->entity)) {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 7f2e594be4eb..058228a56213 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -465,10 +465,12 @@ struct drm_msm_gem_madvise {
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
 #define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+#define MSM_SUBMITQUEUE_LPAC	0x00000004
 
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
 		MSM_SUBMITQUEUE_VM_BIND | \
+		MSM_SUBMITQUEUE_LPAC | \
 		0)
 
 /*

-- 
2.56.0

