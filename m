Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267734;
	b=wQN17s57otJ7JQTVOySirwbG2CagsDXjpW79i3ey8BlSqcRZCeEGL3lBrc22//+B7YkX
	 g71wRi25IneoMG5S2YFz3rVFzp2frxraSAaXBzvpxDd/Yjj1y9SfVsCeMOFLcIh+++lpm
	 OHs0XunGF6PsH5y+uRtn433YgCvC0bePJdVNqmvqgIeWYKKLeVXLH9diBjKp1oG1GiOvT
	 OR/ZuuigmU6rChCCD8K5iMUulIuelkAVczNYfs1QZ605D87BuNaHnVySzNmbl2DjNRwdq
	 e9rjtN4RrjqIKxZi231GgOPS2AtLDyLpKRx1OOrj9hil7JrYoRgEEh75ZKlMPHkJByg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=O6/RPBdKJHpBtleCiaVzMZGq8mGT5hAui5T8ud6/kfgQ29IuPzGEIwTSqNBaSPPnfr4c
	 Fj25AqXI/2ib76DkU/OZW0u7hAf7JjFoTSQddv9R7k06uewv0/5efBe1u2aJPloI7mjIA
	 pc4RIIsbrc9T1z2fXVwqZ5wH9hUWWElG1Wrcnn8bBJDD2o/tP2JG7rr2wCE6bSXsz7LvY
	 FH1o4VzV1Nfb8wqp1QvC2mX2HLAQHlM6lxbkVLbYmT4eXTDODM4emuI+ZkCS/gO/v0guV
	 NlomBHAGOntgE3HcOTgjD5vK/JmtozwHYJ0kkM+B2LgHAZugkHHwwcc586wjMo6s59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C460A263A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734C460A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1512370f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267733; x=1793872533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=cXMMokD7mcfeH2AOuFyhj0i48INDwHmpExWFbj34kef61T201rUWCq2egO+Sas0o+f
         IbjuT4ao0gRrDFYhPtmpQjB1sNw1HSYXAz3wcA544TJQ5rdmdFbVsb3c334NEtivWSqQ
         PJjW5bBltS5K7lu3GtUkjzQ/veIAyJtWbETp16cxoJlh/Fr1hi3SzZVbeW+pRZ7yyI/R
         OUPX39mT1Hl5TpmOc8sk1O6KOLPqblSthDbRRigoqLWe7bQ0zk65VnaNn9i6e/aEkdvo
         Hjfrvlaoz68GUGchC+Y05/0P6kayJumcN4TLYW10u8W6xOvTP4fPj5ZA1td3u7Cvd/9l
         1nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267733; x=1793872533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=xjwq4k2tx0BZsOWlIUo2ddQWOIA8+ESaLRFcdy3hpTB+hNsWM5AjsJP/zlRTHicO3e
         /pjp7OMgvXp69u72/IYfwOltfMIhX8WGdvL7iJ+eAGBmFXlnLEXFZxuKQlY/fb2NjfQU
         zG/Z5xKL7iHZQzzQjNNSO9hGe59nqxW3KlWfRmYmh4CxG+LZPqmwaTC1n/UcNaW9gDPr
         tWaZG8yi1d7pFEGuQyYsEInYL7cdlWlbtzDY2Ndd4MGAo0/fbw9C0zfEGH52coiaLt/O
         l9xE5m4Vuw/I1iARsKfkI90HyWqpnMYWLHpRaZpXJDcQXU+98ut0TtuhltnsGimt8iF5
         2NZA==
X-Forwarded-Encrypted: i=1; AKwUvBxWLSWTG7Xa3nAIGCUa6H3V4AX47qffE9AFgBUF1Vv57RJRjagdlwuBqjXWUfCYENU7mLEuINJr3UewKao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFpwxJ5xigws+1hqK517NTMHNmS0kPLs8pI25PhQme59SKL1SK
	zMN090pxCKnVGN86KpFaR/dS1c3QUzyQ8nnQkDYAxC9u2MIrRH5vnh7HQOBizw4SsYs=
X-Gm-Gg: AYBFou2jrY9+lc+j5SRkifaStchmOMmbovbaLpwyI1E3i/VV+pSP5l4vfcQoLEFGL2H
	aRMXjRqICjOljbXNptECWK8AhDTM6jrXVxE1k8ddPu2TagZahau7Q3rRDb1+IvYq6+9WxlPBFoN
	SBofGKt4WEvZQMEts7f3trLTp4+tNC7+P+8Ol3eFr9xTXCy85fDraoUc/w6Rn5x/tREilRH72Cd
	jNfHg1PaPK90m5hZpLBlbLU5HVUU8T/0l5QRzrhKKMMOavZ9i/4intlEoQ4MMYCawjOLhyqd9ua
	iy+G3Dfl2HRP2TwcSYynOAWCfyvRrtY+jvsVOysF6zt+995BXLZFRnt86WhGCFlVT5cVp33T23G
	1AhHltl13pWFbPeeYq65HVhmRU/SUftqNmonkU4V6ZKsjTvB/sHub2O8UvKl/IgGNMJfMI2MJCn
	5mZzkk5QQstD6CWnustjxgkkdikrlwh2oZaXVuYZiW5m6d4yVdW4HKriQltHwI5AozjedrDfndY
	0yezSzwIBn4uKPxs/LibqyQNq7a7LN8BdoRjDbBUP6NvzIzG9p1P9kootkGdUDjD3oXUliGOtMJ
	QP8V5vPSmG2QSGqV6Dg=
X-Received: by 2002:a05:6000:4a0f:b0:48e:64e3:e923 with SMTP id ffacd0b85a97d-48e64e3eac0mr4729613f8f.28.1793267732733;
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:14 +0000
Subject: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
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
Message-Id: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLpTHdwbJ4RtkNN2neiyQX0O2KMdWh7Elly
 Uu053FBHDSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 Ot+wEACc+UqdBo/XlkBNjOV2Awsxijpo4r+lFLn9HbCpa4lp8yDmyg3yVTcMjgHTrzvkP2fjS/K
 HMAleA48S8gpbz3iCRLaEg78HZAs7tufiaV0PJScOhu7GrxzrfWOjiJ8m736JaRywRX4WOEny3E
 hO/WrgWaSqEMUiyN9Gilu00lI0iQ0muI2r1itia9oO+Zgx/3L1taJE3bKuvE28oNzVOn4plEMEq
 UCG47xyAcF6oPZrGDGtlzRyS2F+6BqORfy7CCJBXnlfNTjiIp0ZK3dVB8FFyawaziFah1LduT1D
 ar1BYVOIpFoT4thgXsZlC1ORj40Qm0faf/gWtWZr26exNp/gQpfNfYiT2mS25UOkgfgnTH6j7bj
 l6GihOpghINipjMzCgA37HgZECe+4L+3so/PC4f74XTlAn+3y26wFySo40ylJ+xdoxKXGWgTbHd
 RvHdOe/CihBsIyGvd9Cf21rbnDCLcgETlp/vMsIqpmZzJGPNouiPucd841fyi/tQYg4U5GY+sl2
 T3K3DXDdf+Td4g0KVUVy9RDRJsi/EUnCZbhh5m/f+mOwlRFAa4rZaqb3mgJ3fxG6618jIo9M1m5
 7hv3k++f5BFMrQYHpDjffGVSqcKoqzpxLJL/xPM10Oi48um2xNAVkTEoOTPpR35i5UEFUY8Ik6F
 owrW8qs5c2h/vig==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..6a538d825f78b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -34,6 +34,7 @@
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
+#define		TOP_IRQ_RDI(rdi)		BIT(8 + (rdi))
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
 
 #define CSID_TOP_IRQ_MASK		0x80
@@ -58,6 +59,9 @@
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
 
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
+#define		INFO_INPUT_SOF_IRQ		BIT(12)
+
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
 
@@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = INFO_INPUT_SOF_IRQ;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	val = readl(csid->base + CSID_TOP_IRQ_MASK);
+
+	if (enable)
+		val |= TOP_IRQ_RDI(rdi);
+	else
+		val &= ~TOP_IRQ_RDI(rdi);
+
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+			if (val & INFO_INPUT_SOF_IRQ)
+				csid_sof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

