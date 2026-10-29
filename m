Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282014;
	b=nb4D0gPOcDN0QCfw1mZ/W+CeTX9jTm7mpgntL7vTgm8KqzTMLWrsZC7vvTNQs4/mfiH3
	 Pb2dqJfyaShAHclyUevKrWc4eeSSl4Jf8TRjOhJemp8kvWzWhD1trIple3vt3MMzgeTlb
	 0RunxlHI3XPM0wuo1ZLCBYHX7FK35i17OcQxjFv/FIuR/P4fv+RQ/gjunpHfCEttTxk8q
	 o7AKNRTO+rr5K7CIjE94fJmfcFbcixvCDPGFhlMkXFLPUs32I2/WFOvvFmHqtqbotSyDp
	 soVUDxy5viNEIqSQPm3YmcRAT6A//ftIm4d2IpH/K3Ktdae/e9d4ulJ2lQlwwVm159Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
	b=oGGniu91SyN5zvNWL8dzrJmSIII8eHFCXYtnE032jrETX0qtWGx7FSwUdswGDQcfBN12
	 weQTfowXr8c/zLodpP1TfZNTsqnofLQZU8P2/aNhO3bco5QfKKVeE/z6GG7odXJIcdKBE
	 omu7uEJIMCxSseMybHNrRFatMoUxJfSL8g5oi2KtbtIHs8h2dzUKNHPdW/vY2k3s8ABfY
	 Odln/dQ43mE+W2KlFVP40AeIR0SiJjy2q3dJOB5HY+Hvy7CJz3BaUNb47dR8y24NR0N8X
	 8bDjJrm1DRRWperZ5NXMY8Wmeo60i7oOzcOBlFkBBS+/HMrPyiyTBzAAVmguCSgePiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3466960A6F7E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3466960A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19776045e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282012; x=1793886812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=jA+IduUUd+0hPug1YrCr2hXnLaqTuQd1EZv9dP7d4Sc8lmFIx2vkY+aa9kMfSFwUYr
         eurhjOp0+aypsWUWPZn884DphWWF7ztUHl4GwspHS2YYjZyHRNZRF0M9YVjkmLDDn6H3
         8tfdykAeOkHCWYqwf0Mef/gNymZ+4U/xnV7I9HLX4G9xOezzU3gbAUH2+ditvx7X3n56
         Fz8c/IV3qFpCkXIGkQmO3IJTeJ3O0223lT9P3mZsewgSRVzlU/lyCLaMMwCkkqi99fL/
         ZqOhp/OZo+ewreqSL9tmfITtu6nY9T66VGVBr6Gj8RqsfGT3lciOFidl1wvy84/+xrap
         yWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282012; x=1793886812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=dJxSQO+pkfvGdTOjVOHkt1WZPsVUDQU2Y4XN24iiUNb3tpwYA1jShCcv277jOLM8rp
         7W0lMflOSjuoQTaz9N1hpM2mJwlwSx2wTcyjfoj8LyX8KE/IhRcyxa3BWXrJRtTau18K
         5Y3xkGfuLUbA552MJ4dShYg3em+4jycKHeMThgw6zeT6IXV+08ZCa2E1FzA26bj8QmTI
         2J/ufjxwazTBswSZOHKSuwIpTi/7UIqpWAo9mqdDfDhi9b14EaqDmMGim/1QrrXs/rzE
         yhdodJxC1E3kYygHwcNJZ7tGEuvZpiKK0AchotRQD/DIffw71TQV3HjxrPr/zjJrJnNG
         Vdxg==
X-Forwarded-Encrypted: i=1; AKwUvBxvptYtSb/KJvWVH+n7BUeuPWw2wIt6VYUZ44sMka0WJXw6ZsUghpVQCr33HnXWLQ7mBdRXsfXp3K2doCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4OYEvsXZm+lw928GbrG65BlPw85Zbn2USu7WQmb2Cv3mqN1a8
	MDh1MRGQU+2mAC0MZOXd1nh7IKaR+8x96P67p5emmd9rKPW/15J0X5Q=
X-Gm-Gg: AYBFou3/fuSf+b94rpBoapEAP6oMhjvcHNEC+RTva/ZsYtLod40wqonOeIUrYMfN8zW
	oxPaTV4/OnoLW4rfejpu3NJVryizwq/mOqMi6A4ZiqHB62hIsety9qA23ellIk+Sw48wpHvWbA4
	fOKhkxf4cYwx7GtxW7KdyoRK4hmTBitlpaWUEE6aWny3DB7anL/lW5V76gwiQvq2L5TJpqyCIhn
	xhYmpLLGfnz2LRIix6JtoOkwdFu45NWOCNqXivMu4QSz/9YyVodtnDN1RuXne+FTy+qCizVSWR2
	TT46UL5CNGtISLrLqJY39S7rKKBsZJT7cQtjnap6NG5TRUQvKwAfzjRwEV+y6JD40AEEmM5Knjn
	ktO0EcINyS6ZBCBuPOUynRCZUM+KalKQIP8I1BD1Y4p3uMuNyji1ljwmdJfYguCr1LiaYmAUnBz
	QZESL9zxbNekwhEdWFFX6jM6ZSm7g8Skag6bVYUdr9tD++LrrBG0ENlXZ77a49tDo2jOBb1Ywe4
	vnlb7Ni7YrVjNpZmWcPhazPcTkT2jRosOSBTIenoFWT8yuD8+3Log9myIidFwWBl2wwmOST11Nn
	x9IYGmvu1acnHichwPn9XPUzEghsMCXF/s6XyHu8RGk0kw==
X-Received: by 2002:a05:600c:8b38:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a966c4062fmr131340985e9.14.1793282012331;
        Thu, 29 Oct 2026 06:53:32 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:49 +0100
Subject: [PATCH RFC v2 12/14] drm/msm: add lpac ring to devcoredump
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-12-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SjlYjQ7B06EmsCE9KnnMd2bONmqc/uyNMNAcvp2x0Ec=;
 b=Y4u2ENL4nkbD0aM3WvJ/ELGPfCSRXNJvoXA78hkmUU4GFxXHhBZNuc0iEh6bPVi314GSCwW/2
 pbbFXwlzl23AkJnsI3vrmGEICHfTAEqdZf+4MgQRM3PA140b5G6lp9N
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 085e1b9044bc..1ce172e5f73a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -785,25 +785,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1004,7 +1005,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 877f88ef90d9..6b05c2d45bb3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -640,7 +640,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.56.0

