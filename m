Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282012;
	b=OMMWeTDHEp5Sv6dqY1NuxvDw25W/kFe68pj6U9gUkPbC/dF7BaELEMU8SOty3jwdLiZw
	 Og95NG0p8SBN/3fkVTf5gl0Dy0M2kM8yUDjfSowcbQJyc6+CpOpMCcbTDLUJKzHlhfdRS
	 n2Yfe+IAhELsJvBqSh1sU2kTz/TgeXdZi58kNT3gXu1CPOvIpSlZC2rtyjdFPjpw7dKy3
	 CiOmG1ehB1ML8PdQnX+qOiJaV2+/dxZChogz8aAjzGnDnn+fkGWzkPWbxFcr9NepaS/dU
	 8W6YajJam9c9vXtWiHrlB5g9F7GcJfdQPBqJcJntNOZZYQxiZFTpT59oAs+wmiV81ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
	b=zWhpnmYteV/iql/4km0Lr2t9BzXPXiK0BR+fB+tjfD4VQfSjDdK4YPme7/vSAa2rQi5d
	 FPSoD17YgNx+1lSaG/J4tzghsOMOm3raJVIGNueMlamZ5W31P8U9n2SUrYl7BhH5McOrn
	 t+d0c7RpVSXSOgsNbX5Pm7GVvpkqWwM/Fpek8NReLBYMXupxTLRgUPKSvY5bA2/G2b6UK
	 yOwkvYQ+SfLvRNQPG3zHo1JJpCeieo+kzcS368F5p1lrs9ZmYreMCeXljQF78DI2+9ncS
	 hOWCAPtxuoq8eeKWcnY8mJJG9p4GSHz7+svZF23xc3YhNyMvUccHPh0K6zBsojgmQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C560A6F61
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167C560A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e4831c028so1779518f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282010; x=1793886810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=nR4Hd7naazS+EkK9BRvkvpfhgyw1W3iQO0GoGhlyzRDAhkR91gO70ou7fj8Zwvlvi2
         X36owXIE1LnEiBPs9k//KLqCGNtFf/ulBJUskzvUAlt3dPtpnZXVSbApF7mcgLlJ63ir
         sNupJ/IIOFs0TwPlSaTn1rVLw4TzwJIFg955pGYb+u1+6QDa013aeXu2tkdGfkSd/pXZ
         DRoUGXd9mJOREyXl34hED5FWrL8m3MJ6B9ERpKLixvj9yZHV/vYad3A4X9Zdnk2C2jfy
         defHRAvr3An2qcAxtjS4gqQsJDEf8Pq8RhqQvR5Zd6HK/rSQpjkbWMIFofgLg9k/5xGY
         sS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282010; x=1793886810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=i4h9Enqp6uN/XbhYoz6OT0xDgVzQpQTS6AzaFH4FaeAmU2H3xEzDzrfhbS+T92FdOS
         dXmm7ctCoPjsw+rt/PD68Vwmf5SUiDPks8tSjJv8SG3HfamcbybDd43kGFF2TGXcY3IS
         5xftM1uVuyu4k+eYbY3p5Q74f+obVisEYYWD++tGyLEo2TE0S6FHxWe8Xa8J8g2nGfss
         KsULYaNrVB/8vNLMSJSVfDMfDeQqxQYobWQ3pmOMaCqOqptRH0VvPZxqwCiHzvucgfRS
         xvzpY7enMazn53etUKi9vvud4Nh8Tb/y4t+dUkoxC1CDYKIJ8ql6+RmeJ0c+CjtIT0KQ
         W8xg==
X-Forwarded-Encrypted: i=1; AKwUvByuM4mZWK9H/JEo0jY3TqsFOwWMI9JHi+EowbfsE55g+PvjqDN35mse66ekYi9J9cb+l8Wm1XJBOqMX42Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+K/OX7vNTPo78a6pvdLxyVtoiRKwi5m88b63hQ7qDiwjlzQ2e
	U+wITpOErmnBYQbM+Xv9QDtpHt4p4krEzciaq3KCSqtJWhSt3K1JQVc=
X-Gm-Gg: AYBFou1x4rVhz9cnxX3yKyVqXfUWV9bNDaiv8nnL8TJBDqv71x32+qreMO7IoxhQHuk
	B4VXU8WaLubdlafJexCKwtB/BEsW8EAa1fsG3i2BpW7ZM4F3y8NumlUBWLexWh1GuND6bp3H0g9
	HrKXX895LNLo8n9Qsq/iIjBKJ/2aIT6vE7tv8PApU2akTKwD+ix4+WPg6HEh3Hnd6p2igqKs6Ls
	UVM8zt1XQLJ1qxaTFzD3IGqYjG+GXbAlfFTJukC17mn0xb5Waw56TVi53aLxcCnfKrD4YGR8Jo2
	AgeG0g3JPk4Gdlv/es/xwa3dwAVezsGsm/pHv66HBNokRP96YbbJb0xuPGBZ8AOreOME+djfFXg
	/CJNBmPfOgFAuqqK0PSaoHj+q1bX2XDuBfJHD6pt4UjFd2qSLdDcffB3ZQBjt5T2o06i2GlnnJr
	9FgcKT5Jhr75337/jc/+MFRub7fpSA22liB+iuKSVZx6xWJ53mQuVRy29tEE0GcGmAth2wIPVh/
	5o9vt4xL9HK6pl1OHAmtDBWbsDMZlVaj12yi92/U7a/DaQ+4n/SbUcwUp3kt4AG0pon5oEj866q
	HIav7acjYOQyFvnWPrRqUEOAfX3YpeUgXk+QbtSGQXYbwQ==
X-Received: by 2002:a5d:5e03:0:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e5d468159mr13722390f8f.39.1793282010340;
        Thu, 29 Oct 2026 06:53:30 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:29 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:48 +0100
Subject: [PATCH RFC v2 11/14] drm/msm: set ctxbank and asid based on ring
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-11-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JeZ/oDOWBrzzXnhSTsaX5dWsSADptm5HwF/DPV1Xv4k=;
 b=4M7VMbDwjOepIjZPrdycOsvEBkNuot2Ltb1yMKAeV6IZ8onsZj759zJ8VBrGw6EwZ2ETpsOXr
 1DglU23L6d5AIGkk239c64rud6FZXnrAbBlSSiEjCojZ/rkF2k76XQ0
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e82d0c0bc10f..57fc4035a753 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.56.0

