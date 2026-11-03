Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734693;
	b=BIleBurD02bO0m/Urw3xIpT7jbvs5n/amzg8kwaZMdgUha6QfyGNY0Vy49xjEc1NR1QO
	 Oudk7AjJxb+ykLYBfA2UrxW8DxwE4cOQvCgeRLy5Ap1ZZRDkb5G16RmoyC5mxZTOxHF/z
	 oAglpWT8vlUj3YZQdttk5fACjxdp3lT+FoPrzCwIpUU5l4WE0QsOZawnNOf4N6plQJP5w
	 ZGIl2VgtlQ+PJTV4i8mysOKQanrwrnDj0A0TBlj4Den+fFrHjjM2XAx4Qow3o2drgCFss
	 3wh/XxhNoGjLHr4OVCimLG0wRnmKW8DPt/skixR8Mi5+vK7DxYmRx+1KVz5cHmTH7TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
	b=054Qu885Sseiz71LlTn4ojlCeXBWf+w4py0hmDSdvtdtuH+nhfAOOPV5K1lKwFU9dlzZ
	 KRO//UiOgQdUh0xqAwodmu9dGMfe2/0wXSL3zb7RGBX/HyqiBoHHNE4okKMRzlMUhyL6C
	 8G5C60hSrvT+nQwVbyxeIKLyV16va5tJBStJSeW6z5Br9q0e/EdJdyQ4JhQvMLDlwt69z
	 I1MZNZ79+e2kZsqrdPIKdMPIWO7q2d5MuWhjwDIAGaesHveJ7gDOxqm1mEUWBMa1SdNih
	 15wJvtD578f7hKuyFkjKqRpV/j9RZ1EbeOkSC9UMSipDECFtwKRCMfSSRIk4iSiZLFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="GKRtY/xR";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A66606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A66606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GKRtY/xR
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2516756f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734691; x=1794339491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
        b=GKRtY/xRqxKE0icRGOY1BmyhxrRDxuz7CSnjvN1kQlWXikkvz0R3sFAz8EPh+B8BED
         VHYDvslWBn1s8MtghLOL4W6uzFOja+20OtOFQbOF7QwyCVzyykDJ5gnCXuYj60qiIWDO
         HU5FW5OdZXn1Y6X1hmQc4YAx+rjaMNbVGA+01AQ7JSakygrakPRCy6P7ezF7/f/7JidB
         P31QRfc4IITd5Dikbcf7f6t519fkGW02GVIJEDEJK8I/8i489SdL/z+fBSwSlo4aNUkB
         a9svGfTw4Gh55GeKCCczCqgKD4PVjZGCzK4jYgVuvw8Upd85z+B8RrWCVWBxkyEbXeEy
         185w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734691; x=1794339491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
        b=n1E4WYx4mf05l9JAjqRG/GV9h+k9vTQ+hXtl/Sx/L42htxM4EQxWH8dSiuRyXABKcp
         1asFJNJ8Otg0TmDsz9dB0nMs4Dt0CZuaz45SzfID4+mCSbcAcUBlVKVFze4bwKPoYJss
         qucCIRi0jEIcZdJiKcTk6WalG98ObVd/4OCgZrM49yG0lsCBVZNCHoMmvBUzLzLdlHde
         cbFcibv3FSxjSRT9kBHoN2tFrQ04l/74sfJVbTue2aT9Ao45WltSHQqNS0dcmjy1pb9O
         56PMZdI6EiLc9G4Hl6vWOsD3ztAYtyv3nPSHWMpRSk8W1ivOmZ1UInNyr1sti41v4XFh
         6L7w==
X-Forwarded-Encrypted: i=1; AKwUvByTaxX4myuNOUnTGyHmicM+A5LeUB95E6FoexcxLpETMVKWnsHrJGLP+g7y0+Rnmmk+frQT4rSjQxkfSWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XS/nXjb0hkMYh36WGIhunz/GPhCpdypwv2kbuMx0s/PN9wzGc
	WxJ5QawKCTa58BirDe6vBP4VlHs2DG3XlWztnGudvP+9pjg21Xl0xTeeQgychETpLp1ha4iFoSA
	Ljlrb
X-Gm-Gg: AYBFou1tA73mLyVXZO9V/tVmeeiBOFieY9XGWjRHmGuWh/EtBMraTOcz3DxCFnk/p1S
	R/jPWOCdiwgYagsK6BIOf3AIhVDZsnTbKEyR0NLIXGrFnDOj4082cyd5egjJ4Cl8X7LvGUvPzeo
	RbmdUHxrURoMMyErS//rJTdPBx3NNXQZexFoci3IFl3Iq4HASwUgMjoeUFGtir+SWttikFnD3oQ
	cc/3L/0PDgjyekyMdYY+cL9zCbD7QElOGZcdThP2MWz53a60J+7QTJDD7e62q05gEUXmxTYO9Vf
	XiOC8A5R5ffZf6aPVM2pfgJa3a/5LXaaJCSQaCfTB1iFM05f0zp4KS7I3YjNzESDuEyTnTd3Ah8
	nFZCD0DV8C0Nbtx61nm16l2q5YuAuGY+AXKgvXZKdVKNhZ3WiWevgsL2uTAOpWE3OVU89sXN9G5
	ymAvxwPKkidqWEByFi7bDbpCeBlhW10U8O/1nJvg1JlV82Gzm/PicFfITGfCO6N1BqwoeV8WmuX
	8kMBn2lrhmwg3KCesJ4JSAFYqbq/ze4GZi4io7rKW3ZlrvVi5Vfc5gDKcjUTozGZ4Xji3TKRTlO
	2POH75CRGZ8WOTLtqp1oE1vt+g==
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr302304865e9.16.1793734691196;
        Tue, 03 Nov 2026 11:38:11 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b413312b94sm2165015e9.3.2026.11.03.11.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:10 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:30 +0100
Subject: [PATCH 3/4] dmaengine: ti: cppi41: Restore QMGR_MEMCTRL in resume
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-3-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2614; i=msp@baylibre.com;
 h=from:subject:message-id; bh=T6rTeOj2mOVu4qd7MFS1jh/VVnFzsdhhla/rk3UZJo8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFsKpjQ9+x5c/rYm9/bl9wn7BJ3u/L6rfcPTZ9I6rX
 878iV27uKOUhUGMi0FWTJGlMzE07b/8zmPJi5ZthpnDygQyhIGLUwAmcu0RI8OC25+Ur8mGMu6Z
 89M0nvPsjc+vhZttq3+zVO1bryq3ze86w//QY618XK2+0keu63f1Pvog/bkr/Idl7j/PyFLnIN4
 d6hwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Currently only QMGR_MEMBASE is restored in resume, QMGR_MEMCTRL is left
at its default values.

Add a restore for QMGR_MEMCTRL. This introduces a helper function
cppi41_memctrl() to not duplicate this calcuation in init and resume.

Fixes: f97b98d6d02e ("dma: cppi41: add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index f5a824418fe7..e2a089066c6d 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -842,13 +842,22 @@ static void deinit_cppi41(struct device *dev, struct cppi41_dd *cdd)
 			cdd->scratch_phys);
 }
 
+static u32 cppi41_memctrl(int area)
+{
+	u32 reg;
+
+	reg = (area * ALLOC_DECS_NUM) << QMGR_MEMCTRL_IDX_SH;
+	reg |= (ilog2(sizeof(struct cppi41_desc)) - 5) << QMGR_MEMCTRL_DESC_SH;
+	reg |= ilog2(ALLOC_DECS_NUM) - 5;
+
+	return reg;
+}
+
 static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 {
 	unsigned int desc_size;
 	unsigned int mem_decs;
 	int i;
-	u32 reg;
-	u32 idx;
 
 	BUILD_BUG_ON(sizeof(struct cppi41_desc) &
 			(sizeof(struct cppi41_desc) - 1));
@@ -858,13 +867,7 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 	desc_size = sizeof(struct cppi41_desc);
 	mem_decs = ALLOC_DECS_NUM * desc_size;
 
-	idx = 0;
 	for (i = 0; i < DESCS_AREAS; i++) {
-
-		reg = idx << QMGR_MEMCTRL_IDX_SH;
-		reg |= (ilog2(desc_size) - 5) << QMGR_MEMCTRL_DESC_SH;
-		reg |= ilog2(ALLOC_DECS_NUM) - 5;
-
 		BUILD_BUG_ON(DESCS_AREAS != 1);
 		cdd->cd = dma_alloc_coherent(dev, mem_decs,
 				&cdd->descs_phys, GFP_KERNEL);
@@ -872,9 +875,7 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 			return -ENOMEM;
 
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(reg, cdd->qmgr_mem + QMGR_MEMCTRL(i));
-
-		idx += ALLOC_DECS_NUM;
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
 	}
 	return 0;
 }
@@ -1191,8 +1192,10 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	if (pm_runtime_status_suspended(dev))
 		return 0;
 
-	for (i = 0; i < DESCS_AREAS; i++)
+	for (i = 0; i < DESCS_AREAS; i++) {
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
+	}
 
 	list_for_each_entry(c, &cdd->ddev.channels, chan.device_node)
 		if (!c->is_tx)

-- 
2.55.0

