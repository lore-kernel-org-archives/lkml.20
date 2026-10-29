Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267736;
	b=ZZoKrlRyEPXxfjQy4+fDUuKMMVIoiV7tnCo683Vje4O8fDIG94IwN3XAAc4G8bS0EoDw
	 UNF+CaNq2LfjG7dBacUxfQLwDWG5mmgHhHey/HSaxYWooTZ7Kdjlg4JgKF0aym0iyUcXp
	 bip1ukbkyoCXxtSl72d9RgCkCi1LLLH5VrnNHCLzjvNktrp7F8cJGaZPlLompIKxSXJ3O
	 C1fuXxCGpypag1bfj2kBOysku7IykMQGqSNRZcTP2caDaOZvpGwGreRNkCGOxB5nSOOGg
	 FA8Pz5OL/jejjj0F57ub1tJpHKfD29raNFMOE7kFiWUID37yeYcGeM5VPRL7a1MiNxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
	b=bKVOanS1sEDX6iIX26TfkJhxjWiVybZwDdQmjsRKb+lu5an7Y2Xa4bUanyVmEUMJ6q4x
	 mJPae9Z4+sL1owQZ3M3m2eRS4D+SL+6lA9cE2UQsfJJ3r/rD7BEr8YeZ31cDNVNH1DfYq
	 FarPZavqCzzrJ/RblUhktN695k2EMBD+3YLsX3YEEiiD0W+1R0aGU3KkadlX2KTwv2VvC
	 Wp2+2qJlQzRRUs5oaRr/KEW55OAAKamuvM3VAOWQtNG5snfyTIhv5AtWoy4SqW4//j1fT
	 BzEzZ2HBavx5y0OgCC6Bdys7N0WswVHPvItxIXr9OlATo63xNqYo+HyxFIdGomwBGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="CGMUh/mk";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35D60A382B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D35D60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CGMUh/mk
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1405619f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267735; x=1793872535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=CGMUh/mk8Rdot8aWrDqkerskWgkN1ZWGTn+KNcvoW7PSLUH5L01ik6TMFJ8Xe5qLlF
         J/7wxzL/Qrvb6be16BQPsKJ1BDpMpgRwBbGGyskXymZ2yX0WkNJImR0laaDQOfuvc3yN
         hZZnV29Ai6/AkdrP+VtJa+6KF0+J9pHgIw0U7al0N1F6GiZTxWTylLG35otQKPeO9d6s
         OrIkNBSE4L7uyZvtm8vCPzolIQB0DlH2I86j3x7ZCj8x1DS28diXZD7jES7kj32fgDe8
         10eUPH4p3FpB9oKR6OB7q3MaXR7xfJsUA9l4aVOoxdaQZH2qE7yZSK54cFk9L9nMEMKa
         CHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267735; x=1793872535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=u5DRrqHIAopNpOjWJSrmR9uzqGDfsRXDcb9g92k5wc3hSmySA6S1tnWmwkVIJyKsWY
         79kJyblE8ViqWkNBCcOoRWKyx8iQAk7AfXH6v9fWuC0OkQsnGCGBWx93aU2jSO9KT2PB
         nEvH92GbpvEfBL3QMpeju6RHmK4qrlwefwyQ7vkNjZposjKGoV4MQFm1hNp/ePNmyiFT
         JWM9kSpsL8XwjoQKv8aeaMwZAYQB7qXWV4f4nt4rPyp4Q1pZb+kfZVUXTgZ5TIwGX01j
         hAYnPucbdRWNPlVM+HMHlEDpxRVT4/UdCB9kIkoNiJa5saxBiwWZ3n1Lynrf4atZshAE
         0QXg==
X-Forwarded-Encrypted: i=1; AKwUvBzQxBe36EBxFNXdtqNLOGTUFqAAcb4WXOu5IP1XURtpEF5vKauAqe34tQYU3jD+b0CdKLJ6eg39wPrjuxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7R6HhNqLpz8XQMks0a8sCcFEG2JVpsgjq/ErrX3KfMozOUaMF
	k17xSwLdXQoB88Xdbd1b5WffgoYw299NY/zb1fmTD0ml7qH/4T6OFTEx4b/ORwcoDRc=
X-Gm-Gg: AYBFou39GDQY/MYwMNcnQNLo9vs9j0Zay9FzV0wGPPrplc4UhBPHtztmcJtkEW+gXOD
	dvVywii0F2MG6zfQj6v8pVbn66ZW02qC80iwGxjswuh/scIkJRh7MrQD+wDw+iEFyJyMpC8JHRK
	+3ZPAhvqy2I1f40899iXr5u8sefK0mfD2TWs2Ve1AlbQ7KNwIkW6QZw5Sd6Z3qqbvVW2UemmQAh
	DW3q+0QCw0CHNojdy/RrbkdaYDpsCQYwI2Yje+FaFg7vD4XultC90vFr7bWeiEieJvHCamqyg+t
	TAXcF9HKw0M5nraIDuIjrdieE5aurGS41vxTzWq8Pv7F1kjmkLXNXCfmDtWUM/Qmm5Cr0Y5b8ZD
	AxCy/8esm0JvGIiWr8+S6tBeiWPPn6ycIAGlzMZhkyO3QUvOyrBbmtl90kMyLONKP/C44orQc76
	2QgNpEhNvHTEZt1zVv/QIxQ0YoF3YVh523E5dhQikLOvw/r52xEBYg6slWuYhJALoJKOW+UBoNd
	HVHD26Ez0ajByR+FVIxKygm6ruGRwgqy24/oD6WW2AHyEudtMVg3WEhCfptaIdi4IAwFGQJ3PQo
	INBoWjbsmoPOcUZWMmk=
X-Received: by 2002:a05:6000:4281:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48e5d5c7104mr10359040f8f.26.1793267734616;
        Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:16 +0000
Subject: [PATCH 07/14] media: qcom: camss: csid-680: Enable RDI SOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-7-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=bod@kernel.org;
 h=from:subject:message-id; bh=akubu0rGSbK8Bi55Bu6Z8+I5lQw1Ol8/ItTGES6zVpo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLFgesLqwuGjFWWlQwZXxMNo/ISsxJqcmXv
 HII85wXXZKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 OsRzEACdcOEGVv8/MUuatktqnQOB1z7ppKozXH/zCqjTbd3hSK8Nx15HnQb/Jz/ibaTGNjXmj0w
 3BE9wwV598sHQqKGK5oNb3qQwXJVUlfkUO9IW8jEg01HDwSdiemAi2EHSdQuDpr5MA4155cw5Cu
 dXb9hWv1WCQ+/vt+bl82lJfS8RPxhmErB29eG4e5wnFSj1Ejkyz+GV8cR+wK8vjGenhR0h3h2Zd
 gQjkRnT3ltYVVfHpTTBHdiQlfkhrTfmkBESWGAriaKGf2hFEgnkWH6dFdWyT6b8pStwRKMIB3Ty
 cQOQOfuXk64kCtelBJEJMp4P7YiPcxvJ0ISFpOFfSJWKyj9X6BUlBhoNuUMidBd2zfxsBHAVf8l
 fWHZJT6NQQPe0Am3mrLpK/GcXfLczhqfpHOqEOBnesQXON1tChcTw51VntvpDIZVa1cQdeqQPDz
 82Y1eh4j0HjVtf0tS4UOaOkjRyDE4UnVWhBNyxU3lvRHRlJY6uqRutm8bPF0HOYePpO8dbGwBQc
 SmOcIBRO3Cy4uQ5+tw4LuNDQT7R0ZPydS99r94xfKzerJEnuJKyJcgHz+LjQa2JkmHvGEI2+NZV
 MnTQIyXNrj9d3FvOpD7YeZ+L+6fgFOT1pn8RrU3l3Q8Hy4Y4ijwPL3SEpNLR5lBOn7diUKOyWHp
 w3AjDem/w8H89TA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

