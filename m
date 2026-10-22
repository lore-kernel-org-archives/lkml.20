Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699970;
	b=e6dgNluHK5qg5xjswmmCGzPyTbkUkYhTbyTIaRMaPuffET8sHt3FOT5kmBHMlVdNKK7m
	 ypvXa0SrSW/AsJsFixgU8OOMAZl4epRyJJxhoxtUoLOMKzPozkg6nAJ9dkX7CyjOjL9DZ
	 l3g1obCoOrJsiezAQ2AwvXKj2PsnGXti1LkMysl4EDBHVsYpWR6+i3fmynKmnuG7F0BTv
	 KVmt/3zITMh5auow21xRlZbUvlVT96hvOoRyTaEUUmWoVlWFLN0pXra6hk9N5bp0BjfZ9
	 hZOxOy32wSWrmJ6o6C1ssbgY+9E2rQskDt/w5rnAHCj4IsQUMf/clIgnLDNwM5uSxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
	b=I6oF8QrR3SFqJmXvnEJjcrwvq0mYh4wn5I40UElLON6d4sXF5s7J7rADyrW1PcbwvajV
	 pf30+wePb+fuyo4vdUsYO27ey683rXWCfOFNlvIxUCeQIPXZAjaQ3tS3I55uXt5WyOAfL
	 thKo71LFQxeVWYnyUyDi1+oZ5zYkHMatiExUWucSSjQfziu9AyLCgEckSIZ5KulW/ugG3
	 STPDJItqXFDYVvC84uwmc+z0HZ5NI8UbaPHauMq6UAmVCovE02gYeADIdC6Fy/6p2vQeT
	 uRKMet819cjRm1DlO4mrxl8QsGUbobtL/7mdCiXtvcnvD7+I37PDpsCxlJe4vvBnfBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nU+PpEIz;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D28606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D28606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nU+PpEIz
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so146820f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699967; x=1793304767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=nU+PpEIzZ8H5nbRuZhv/xDYqovUJf34S5LYnHZc45VibBRJJt0lzPa402KDRwRFLKs
         B06xC07RqRkOdfOAfvGVBq2sxER8WJ1/M1IPqSpN129Al63Y9PhitOQGbp3/XNSWGl42
         CBvD9ZdS20XEjXFTYUK17IgAU0itW4kkmuloroRzysDLcAS/lVSMty3E51g/Ljz4Qr3O
         81ehtvBlRXdZo/RphgN/jjyeNumUQbbEOQBzIrmJb4c9VuD9o64WcyrinPCBmDpewh9t
         wU5ppO3brxNlCV+ehqOHz8xLfpDFjoO3fuLhTBoC0vNk+i5rVbqfP5bZ38rzxDadfXDu
         BNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699967; x=1793304767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=ME9kDdP5yfQ2v1HRDGgrGj7zU+Eu/UqAWQgbGS3/CGprT6lwCEUxNsDm1BMC8Jv/sG
         /Gpa3NWG6hd2+I8ZDwPpb35G95e7fGRdKDOiu8PGtD0RVST7KKicKJosb50G8dSTazn5
         xWbXKCEt5DLbmR5EaDNLybyhqyh1DGp7dD8pofzavggyKzpRJK1HqmN0oK/ftbesoQwB
         3hTlGDSuYAO7ckSu+I3IjhaBodJsCqNQpj5o5oeyi2gQr0l3C9/AWh+x8QHoiqMVG7w/
         GShMkGnDX2DEonZ4ITWKCzfABs6GedXb8xv8EnIttXwEhJYbzI2Fw0bCT2txoAgwuSPa
         kPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNWRtYu3QeV6DHlLkKPljl7wVenRFdAD2958eve5ko6s9o4CYxhMKpruLngHJnUJYcjMlzit15QJoXtZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLDt8wTvZqDUOqJ2qQBT+HC5132Cwx4d7q6RWCB/fQaXXOcAEo
	s1+Lh+VJAH5/TUhxa1ORnTcLQGfgIOjc03aDb2oIhUAO0KePTmmyONpgaJhfUDT+wVY=
X-Gm-Gg: AYBFou04sjJr9FaSevhPEcmBRLirTFmdLf4LlYMIaaUKAGYmgPShGAWK549i+aHW6ok
	CS8+jGX/n7xpupXlAOEKAEXrpgJ3Z77HAN6tyTe/gVfak0gLFqsLikfbYbLt3kYiYW2nBH9bsKb
	OmNyGJasUvg2xgteuRNFv1YRUB+vtN1IxXK+V7UT9JBETsoIMczl8EX6nQazLNc5dg3b5Onr37x
	2ZhXnGgvMsm11vYNmssDVmg6lvaRqr5jLQ5z+oiDIiaRULKMg2dEOoWdWlU5TSaAyUliqk2LQX4
	biSTZaAHlHjSp345KZCaESBsOuA/RB3OD0midr/cmcslTTSuJTsVSGhD1xIcFdc8kn5X/9te5zj
	sb+Loht3wt/Wy4tExlJoaokGupyWkMWQ3hBuiVgnn8jAycSMHzRdpDXTEN6T2fgXTvPOAS68Id/
	YnBNnybLhwI9otmA7JQdPyFV/XzTzMkGRe3m5bxUX3anAq1aHGlGW85aCCTXbicnoLopd/APIRn
	emo76jNWRHk1KDwJdo1lYQqHOdf2SyhyL63EjS0TPplJANENaLc5ZzR4DNcHHkkMfpSnagsRv9t
	CFjvQJX1LAzE+yfmvg3H/drcU4LeU3HRICYnnmgpdcsyWB8dVNkL4PB/6mwGyHg=
X-Received: by 2002:a05:6000:230e:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e2649fb43mr12340934f8f.40.1792699967520;
        Thu, 22 Oct 2026 13:12:47 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:32 +0200
Subject: [PATCH 1/3] clk: meson: gxbb: fix ENCP clock selection
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
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-1-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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

