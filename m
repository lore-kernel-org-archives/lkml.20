Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299077;
	b=4ZbaJAlqOPAFCuPmotq9HheMmgfz/HfsD1QGqp3uDAA9SWLWhbU9XC2cjwTYXtmVlnt2
	 ijbFNWYJx9tQ712OUC5pS1uYDLQMm1vktwXSwvvNkSASxO4y9IT1xYUfKK+2sctwjRTwE
	 cJLbKivvzy4nz547bFTjAHa7BmELj0SJBct2XXe7jHIEdw8IttcoNusY1UELsRLtYfqVE
	 EguVIRMtHKzufpBeT0L6//H+hwFjyyhVS4gBtW6O1OwmHcErnUYui2dCudJPN6BJTMS36
	 AJWoR3Eee0WHtyNSvKxh1k/+Y3+gJiJumZs2jms7moxiHAPFbgVbio5zwExosMa0GeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
	b=2Mq2nHNQm3ekUKme9aR2tSGTLuyrywOFMRNbV1gx9ySMtkp4VNifETSoFCJOird9tstp
	 lgtCUKp+HGiuk1lkqaLuj3Fy5ru2toanu07y0QfvNDGpmr3tmQkpO70VvekwFvUZKd88d
	 1fkfRFe91EGNcwA79PC1ZOOs+WnORSvVmPejymI1JldePyHUSItcIFGytMLUbh8hJEEls
	 qVu7h28NF7VpKDzm0zEFEyuDa0EdCsvlc+SPLo8ECzyU/2vzmapFI+6FAh1lCjV62Y3CS
	 x0WuskuIoY52960B8r9Ra4R+05AQK3v4kwwGOKO3uTzYkaZ3bRRFZ0F+X5xqF9YW9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PtRlp9Hi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC08606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC08606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PtRlp9Hi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19483235e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299075; x=1793903875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=PtRlp9HitDBZUFMr/Mb1qE3zNnxZYXubCstEyiWpdLTsCbtOuug/umH9VSHiw4vl6u
         8tWV4xexXjwsu2qbHGIOgvKvq+t6rcxXZ53HidIIqS/LiEkYvUoL6oV08ynAKkwHDF5v
         w0/XvAaW4Brh+Gt81HKfzuaU6R9tQ95fq4vJJOqztZqw5s21NAMHAckqIZGjYAzDoZEn
         EpDH425E2W7CDVfDzrNCXxFIiCMM8P9/Zny32mKXCNd31GlLmEHWsNm9h7uI/FXCwNi3
         9ty9Qtr42YXgqhuvHCpEQ9ncTpFhBSMRL3qaRbN8txhQvxQah35JAby+D+APMus9Nmep
         4B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299075; x=1793903875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=h9IXQvwjWlD73zGaeX3W4k/JLKeWqyjROb+bkWeezI1eX10j/XyUQm0y6VnmnF0AK4
         yi4rjYuCh1S9EqziO5A2299M9q+CW/bDYcNOJIIJHLzGfUp+ePWXSBq0oHoJZZmRb7um
         l4fQJbHyAJQAudiQsjL0L5o4CajdrXi1v9bAskeZjco4qmWFiXInHZjSijOAs0ACnz5d
         olA3imI8QlaQki1ylSmsJPDzb0HRj7ZQ9SIHs20o7po2vFPNZYnYwTRISobEjVK0jmTJ
         aurjEjQIVtdpHpkMDB6GFc67XdOHa5BPlQv5c5kmxWuiZdGXFof5rdKVRwVt//y73eiT
         bYQg==
X-Forwarded-Encrypted: i=1; AKwUvBx5sHAa46tAIr4QEuH2zbuSBGpgQw9qZo50r6JLyk/vtThHs9L4Wj9LcZbphaHNdB1zbdqd1HlihzHO6R8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYSzxQGO6L5vCuXa7D0V1gwfqrKlt3/MUqMF4irq3EWbCt6gMf
	7G21O5V06jxL6D24gxYsbEntbiaSP5YRpNZKiuT5gG6uNpKwQGW2L2hKHreJjoa9QhQ=
X-Gm-Gg: AYBFou3CRjltjfyvod6/Or3n3GJ2V1tdUtW+kW35SNQ+3+vvStRGCiM5JlSEWy7lEjX
	ErbEB0yabEd5ushwgCFk4MDMHD8b3kKW0WKY4dvwrToisEDNPmslTPMe50Eszy8QQhwgGxu2np2
	SjkZTSn0GvDBq7hj7HQ+AqDUNOY3vqPppAHega1jns4nP2S/oYy7ogSO8HU5Sjkl0J52jo/C9+2
	+LxGNQtWE5acvN7us4L42Bn1b+gVgRmgnhEOXsombr6+ZvCVeD5hbcMdpI8NlYnMEN0Vlugcqnx
	3NfPVR+5XTqGlOMK2s+lb7QxsX1AwbroHTU3GofKZrRwUPKkisTFIVX3e3JYB+codC9QfWBeX06
	n6cscoSUo0HK/LTreUjGdEZVaRq/By57oHBhsRXNxoVBrTJgftoreHMC09uj+sTxcXGUri9fMxG
	Yug8HUJCzBblXAynrwRWgYPZAYipv69/zU1oxvVv/BDE4xF/p37mneApLS5yzX6uY5xQ6BCrQx7
	HSlBjdSetmELLLBKAxU5bw2EK1ryXo2MLRr+JsmAgu0LCxObRBWrRVgsNyAQjGxXlmB21UDQ8eb
	OlvuUaYTsdMpZPDvvSW99ficx1MoJ+9kWbHzEcocyBIPBNcJfBZCWxl3Cot5szZY4jhGDeyk3W1
	PKXcnMBwShZtU4wCu+2I=
X-Received: by 2002:a05:600c:c8f:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4a9661ab555mr157927155e9.7.1793299074975;
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:36 +0100
Subject: [PATCH v2 3/3] clk: meson: s4: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-3-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0

The ENCP clock uses the wrong selector bits. Change them from [23:20]
to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

