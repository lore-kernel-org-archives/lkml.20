Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267737;
	b=cfKExQRJRaEIJkImZm6YQMrukn8PDpuK/G4PHKxS5+HUxJqL8UkmeRZANoOhryfnjcnj
	 hgw2G0qa9ajfekV9DVveqyQmwpVgUvXwEcPlIamNnWzwBO6wSjZiTlbzTO9TSlJJX6iAP
	 k/2FhXRn5X3D03wzXNy1RDWeU3IXnhh5mlLrr6OD+iJgXo/A7hNK0hkL9Hyi142K5EvEN
	 xRL2T8cw3mTQEe/+n6m7AmBPjMlGTW1AzAZEauxhPJR5QRcmaKcqdiq+LfL7L+jLmq+2u
	 Pt6Dvlfr9TDr6AHp/Iyo58jnfPkt89nZGkKPVHv6D9sFIc7gKszGrn+ZawS09onVJ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
	b=yG3R1t5y9f//P5NXr4Ciz3NXGMIV1RC6L1xEYJILOhDvWSMFdBBcEjDYlqzuGGY2Y0u/
	 Uuakmxfuq+BtRKD3iypTbl1+5psL6hvM3EYFADR6a1e9bNYjwmdnb3BiDry/k2ZAZH/x1
	 +ypsi7dc7+C6q8i2GMcMQ2YvkWhtx1BykeTA+lntlRQhhS36gEcO9hXFLVCgx6stDP60Y
	 uhOC4z308jVGEPuGkwl46L/tO4oEWhqgoQ6TpYjNTn0dCYFK1Vrenx6eEjVv867vaxR4s
	 44zWFZynppox8ccefP60R2P2QqFQv6vGFUgDPVonSj3a+9+NDmR5oYjPtsAripgh9xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="w/dWBbx+";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530560A383A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2530560A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w/dWBbx+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1477768f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267735; x=1793872535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=w/dWBbx+CovOJKWQFEnbdicxeJ5/ehGu7760QZ51KYotDAAc4mtgqCtarSBZH1/oAU
         ip+Xs2ydYAOcGXxMRQFcaxbzxFjOCnQcMQ/xe1UwBBgVdCW1j7UVY9khh2sFENYKRUpm
         +KOPpjGAKTOyLh+LXJEzWQiaeDS1UEAqMntso7a5ZE9TwqgKNer1AjnTtWCvuK9xrwXS
         1bQkFGhFiHY3JOk3jRN5y0CTSqO2HsletEYsx4PwtN5Kafne6vq8FTeq/PBp4BLozZls
         8h4pUao6y7Is+WS7EGHn2PNQtM4LMCZ9uNJAARU27ZlejYNasKJp6odIpME0h/6DdlrQ
         pDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267735; x=1793872535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=0UO0z01ZUVcVDxBfa8xitxwA0vhYFpZ8LGKe6BYlTuNs0IBz/Vz/cnPNilg6+FUUwS
         qcyveZMnCWAmtq+GPW1oigyMv+P50QNmmNGW3dqeJpaBqETC7WX14rWQgCbbqqWKzisS
         cbyyoCwJItljg+WN3gFkQzmvZ98M8mUpEhkf3FVhAA2Ivvnxf1mCNA5ueiTfD/9gLn7l
         CRYw2DYXlpl7rjOawrQ/akqmMv7eCl1oouW+iFqwaPkaEDK+2fJCQsUqMOUkxgjP5c3f
         dRTVsrrYE5kJP6zaZWpW/2P7lDsnGQInI2nTXO6gz2rTu/fT3AnqENY2S+1um+tkJP1C
         yofw==
X-Forwarded-Encrypted: i=1; AKwUvBzgCgHkOxKf2mf4w0JWQqKd6uF80DiV1RUWn5OGlWXsCumQS5dcaV1Yo+4SOeYXGSGrBn2R5nXLxPF8f9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQZPYLsfL1cQ3A5sRvPk2Ci9FGNORlONlQqZbisxKNuZXCRFsT
	rnd+xkb9aZEuvGhNB6sU2rH1x5PBML1dOXvkx9sdwFoR3N4xEpE7CVAPH3UVhfay6I8=
X-Gm-Gg: AYBFou1VzbbXz2ZR+GYHXjxlJTQywyyN7RF/Vr4E1R+2XCTnSJtPX0W0pazHVkWohhC
	opnEFK0gdfxViEKbAp3T84knQAwLPn9vtVEwc+3qkBQTgZQ57AML+xUo1NZQQw725I8iPJ+R95g
	BqByGrcmJeKV1SJ/4y46bQG+5aUc+yhzfj3q/k4SprXIHaXd3xfCgEBDBlASyhDb5NXoyA9ug4H
	IcDBB1gBvW9ZgIWKHPBOck2NQ0hm6BcErti984SRiy0YY3BXa+h4SmFTwOcBtebnmSylcP17eXl
	x8CbBZlal1STY+lMHSllSLmDeeAzxCFMzaCbSsphQkHMQTsK8OEZAmSD5FFtYL8bsmc+GGVLVDy
	9Y2FNjVVehgwNKpeY1kV1lTlK0QmPrzEwBmVBhzu/+b49Sn9xLe7xe2OVC17B6fIl5jQzKxUs4i
	g0gPQWGwd7+6XHYiVCxIcG8sCSI7l4t9s69xQuc65VQk8PAYao8RhamD51C1mwmbJ80mDhzi8N/
	njGHm85uPGZdP6UrsayvTPYyFbD1BC9W4/VjrVn2iBV7BrqPJy/Sld+NZZJX13lIlZAmgskXT/f
	NvJCP86KPrRcpj1+nSE=
X-Received: by 2002:a05:6000:4007:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e5d2f1f5fmr12175285f8f.25.1793267735461;
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:17 +0000
Subject: [PATCH 08/14] media: qcom: camss: csid-680: Enable RDI EOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-8-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=bod@kernel.org;
 h=from:subject:message-id; bh=dXv09uQCEs8qUF2K5KWFAC6wPULB4r2M9kbjuOqOpSU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgMmujgVpNlGYSXf65flgvekHI0BhlteX5PA
 vkLV+9gUsWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDAAKCRAicTuzoY3I
 OhGxEADBYyhwfefWhvg1ebub1C1XooYs4mQe53MG7nHMeZa2El09YtafgxMVfqLcF6e6Jrm56ev
 kZi550Ck0+6H9Gka8eUMJes90PUbtu9Sh6RtBWV/gqLGWuF0mgu/NYjVhKIoWnIynXKyxoxI3Gm
 53UrwXcJeQNGl9Ve/f5+gcsl7rjYc55VtK+x1nYTGseFiSlXCsn/VMX2UjCLFzlJdfXhH+SXJG8
 b5oQImi32ku1ZGZfaCWKwoyn83ynhDYih4FPgvjtJwsLCybjc4GU+1mBKsX+VsujWtlE0YcDssf
 EPOseSPFrSBrRbbZeQjPPHLoHZO4oKqQtl2ELE6HcQ+qQ90rwFsmoBkx8fFxjZajQ89cD2eDHE+
 bxJdnj91e2CxfzB/sIRANZWho0Me4JYH/zOTSq4hcmM8SzM6kQp1XhYUtPvFqe5NV8LyR4IhUWp
 KM5EP1cW/R54IWRssFCkJyM6ZUzn6E1z0vaighKba4JZ6BRv4KTzabAZL8xoeKxlrLm9PpKbQem
 kV3gao7gboLykWFoMlLm7DLhmWFvvTJQnuArgtzLNZvpk5XQdoo7zZpTqLi5ynTDWGLqzLXpNwP
 BgbcrpYr0Usw2SHhZyrdX9DYyLjB6bu5yr4J8iu4TzbT4pKU6hu8cWQ7+XnYzT1ljZcqQu8Fn8f
 Na8cQamoqlOZIPw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5..2113ce13eb56f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -303,9 +303,9 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 
 	if (enable)
-		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF;
 	else
-		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val &= ~(CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF);
 
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -413,6 +413,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
 			csid_sof_event(csid, i);
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_EOF)
+			csid_eof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

