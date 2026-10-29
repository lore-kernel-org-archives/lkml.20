Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299074;
	b=CRgjqcKxySeglC+7fQNRb8tmisLNUEEwVY5Zd3h+zVxvyaqoasBXvVd4F0LYL2AeyXjX
	 hLiiBfrGW6a+4qVt0gcfUM7d5G6nXnPbL0awB7zszux+DsPTOGKId9Z9ByJSmgt3uX+HX
	 yHwzAZvn9Q4+1A7nloU2KSph6aezPbpSiz9fO6z75vuhWqzOLIxzLG6dhGq5kER0yVedY
	 lsu5fwQbnRjVa5S+ovV56cjiPaUvqemOVnlFXbVUP1b9rtLUdShfDQ5HK/VbdlJKh7BeV
	 mxXmi7Me72y4PKvAJSkpYzmIFzr48U2iWClL7PD6mxiiDIj/B7eQGivzk2QEy1EbgWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
	b=2U3YE7XD5I01UoOiRaV+MG1/exPVoMqhlWwqc86Hc0+as5ln6zm4GF6OO57XVu1I4xKU
	 ikYaOWfyriHUwSmkyFTwEX5Vo1Ys8iIu3CkM/XMD4jNmArNJnfuS+ewqbD6yCEYDHv2Ob
	 G/WiLF5y7baYKUHPpKH8mEkxwSCQ+alrr0Sc2O965XZyIXcN54hjSmmk8YTPg//Y58Fi3
	 QbsLt4vHjVJhaChZZbCSS/jnKFYZYuUlAFNOVbJD/8cIX1CNaskiKjIB6JbK2PbtukdHP
	 yznYuHeb06XkA12QY57T10XRHICpURQImf1Y9CQSdHTNfObovPlyaPq/82yGRqrJPMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NTlodnS2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9696E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NTlodnS2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso23080995e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299072; x=1793903872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=NTlodnS2oSU84Puy/IEsLdT0knsN+ztnjItgmuXAXnalsMCxRDqLB/9SR8+Fz/XKI8
         xhTLVr+xna8cV9nn9rYSVtquckbXdF5IxUvoasu+73NNFOGg3desvqkr0ux9jrLfR1in
         0t9n5ZJBqTd/5SzPHBDyZJP3WzCAmsPT81fftHkPUcUViftKq5USUBEyIEu+EPBRUUMg
         u1Y88YxYawevGYAKN2rvVw0LZFaU/kxuVUrIPLJ0ensuRrLTGTD++DqRrVcA5/pKT/iY
         UmIUDXbzlJSm8NvOiWyWMNmAiHsIko3C1CxQlIxZaOC+1/90N7vEJCsaPRwd+wunmC8k
         Tj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299072; x=1793903872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=zeSKy1f1KmEk5SiGWv4jzNNCSC4fPIeA5Md5MxwFlkFHaW//GtG6cUbxfrrjT3xiV5
         h7A31t3PS1k8j2crMyngwywIhoWkCvQgILj25doKrA59WrQfNNf2lh08SM0g2iNMd4H/
         JGcd1z3ukHzUWbxus2A5fvslrcu1oeFpoGPOwxIf/3dE73c8TciPxlE+wmE/nwSe5Ptj
         8dWTAlMZQnLPmQ3ae674T2OZd/NJT7C3p13GoZEvFbU8aNBm1yh7krPPQw2EOQkjaXT1
         MOpYwlxCQuGUr6LaRDBTCgWH13wPlBI4CWwoI5zoB4op9zjUG2zWn6L3M7+pC/FTAuD8
         ceQw==
X-Forwarded-Encrypted: i=1; AKwUvBxICy7xgCQpQNz+FjDFEpDfl43mYfTNY2a5gYMnhY+MeVKHmSsXDUrDvE2IIcCyi9TWSF1t8fwgKiBcqFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT4zWL4vt5Tv8vI89+whQEnBR13ZM66Rg3czt+Whck7d8fdrhn
	Eaam+GnQy8LTVC+vezagOH6817ykWFNzK2R5x+tMS83GNd5bEUrW7lAEXnwtEUGUpaU=
X-Gm-Gg: AYBFou0gvZtejPUYUSZpcN017vPSI07mPe1c00ziLMSIRHy9niZdzlM+sAq3mszGkkh
	u/LWZYbkryeciu2aef4ogDq2phdLtuydQxHGngoOmwMYConWbBFpVC7c35u4oixMEbo3hsQU9g5
	uk5uVnkjUB48yLvCUm+wViBSX8GVX2kl/j3Bm5gltwD07+F/xIW3LFhZ5uXjtKJ86DHQo/gzqtc
	5lZZRo/vQvFXIfWdf9kqNuIe3wHNc6ejyoirQx+4XnR18WR4BI9fsA5r0x3og4gmaPUMt+2Hb9k
	snx1bFleD59tRJUiCh7n+y1sqa0q1QNrfMP2eP3vuyeyct8o9/5FskYcgtRMic0soQ9asLexUxS
	AxUs4CDOWPCEB58+APQmzzMzLGgLnOcCai79UL3lOoFd8/jxsbsExy5JO0fUwqRsvmIr/Ymvqcq
	Vae3JFpj3lM1iTruXZVcMkcgjafiAmtrRZZ/js8Dq/aezxhY9132nbiR8bSMpXINqHUqcwEa1QI
	GMyTBtUC+gApzxClA6DN4Zctovh6GHoXEcgpq4IR0Z2dkkdhImGX3cceh47wkZweL6YM57UbpZy
	mlt2h3/KdC80TFdN8nakfRyDfmyPND+s6n8Qs0UYuPONOczpDRA2+4sYUHQh5miKFzjnTtgkTjQ
	j2iWJUxCsvlV2acVTkA==
X-Received: by 2002:a05:600c:4705:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a966587157mr144058185e9.16.1793299072008;
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:34 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-1-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

