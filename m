Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299075;
	b=sLD3O8u+JRC56Q9PbG/1wZi+wagUEZLbXyWtJZ9JKgfeisaDusA+SGtTvwf4DUtjMI7e
	 UFmPVKiGohOwgH3gX2p70ZkRjWaSZ5d/Ve2aYYguM5/M7uVWgxZ6qWhRzdKqukmzOKZ3g
	 ZForNsJ71XpQkQe9xnKLtcrUQmhWoQ3XCqMD+bYQSSx0QnLLKBZaGDOBZXVWT0NDJJxQM
	 G2NQpdy/49CZusrJqPtlmAgMvpIC90N04Mt4jpWpxgZB7YCe80LjQYvjttAt7jIU/j7CL
	 YZZOwi4GTZ6xzxnAeKg1DqLAW47o8cpVuVpSkGHHOa46GhmTBKvbMkzC5zjJHDESbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
	b=lruYurVvwxIuZDICs4xxxs+Sx1wW2EywGOHYQyG+skRBin5pvw9gdnMnBjcTK1/0uj84
	 sl7Jz2ZQu4P389IHCdT4Oaq/UKv5IbeaXDXGOtx4hQjrEbgIhX6XutmF2BEh4DklB+x2G
	 ktHjatOTwUrLFPMB9hYO+HCH2668RuTKJ+oi61xK8L2weeST/3WHfzIBbrBze9Sv76aV2
	 EjpvYqBMa+pbylE//y3xo5I3O0b7LnBSb2ItUzoCDhdhh6uNsYUMItohMJdFzotWfF5GX
	 O8E938YcGMnE6GHV8LhkBgVJy69tDU9SEnCaOZf2d/5OHd3s0eOFYJtJCfsveJsVWeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idDCvlZw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4678F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idDCvlZw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6160285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299074; x=1793903874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=idDCvlZwrzH1AQ6Td0GOxF3Jb5TUSS7FOB513TUv9EjRdA2DxJcbGJnW7qKTxi1GQU
         tCsKkdfG3Z48ISliOrQEBTZQSYMnoG2H67Na3sNocMvnohQvZg0ljV5DMQrpYqq+eMqo
         qN+AMiH+WuaOsTxuxHnCkagjX4NNDLswzloxnuLXEUFJVAQWxUiz8ijqdZN6MmxV2CTb
         h26zOWOJNH6RCESgJyedRpEei4jtN7DBBS89fjzN5wyJ8Ou9zsVgJGTlTbGnQXL0+T//
         +/fNYvyR23H0coOi4yVYegYqFLF7QtzRUahZLe+aC/cObuMHaWYGXitp4wT0KB/OozSl
         IqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299074; x=1793903874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=DydN3yNEQiZRd0T2ufw6cphcSa5meifqCMo6MSlFzqhXIq+OA59worleNjQ0n1jmb1
         sxeSnikvBc5/HU/lLqA8UYrhTIyMEqDzHRBXITCrrNaVcN1rO092QAvDDTaI3/TKEcq0
         t5AWS3ATbDFhDq8hZ+Lc9IDjoyPKX5NmglAB7++pLpZeAGqnBUjJ2Qd8DkYeBIoVfWcC
         3ujmMvlHplEtcRrhO9DCm++OYBLSxo7CH9wtAqKJ5aggwkiLkYf0KJ48AscYqYtANMpn
         2ChtEzhPyQ7vqS+Vyw051xbF06Z5AOISnlTwW5nQdRbF6u/MD6qgNuiHCYbSpbR20hsI
         0xqg==
X-Forwarded-Encrypted: i=1; AKwUvBy4UoQz8yxIZIDMREG5XK7VioFoa51geaHQT4Hk03Y54+6VZMIU/wtOV7loX3XaZIqY8iI0JY50vMs86Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwbo3cDGHkClKqylGPB0rgi14/uWlpJDEZKFAd3aPSgjn1PPtr
	hvD4yVWBGI68Jagsh9HpkBwwjsfGYyPtzbGnlT53n8kfSx/RE2hMDid9MoCySAZ9q9s=
X-Gm-Gg: AYBFou11xcr3Y8CD3tNWxu+2B9Dx0lZu2GRyR3QL0NLtpuqwkPbJ9mZsAwoNZEkSssI
	db8nUu7B8Uo4FiVGMK87z2WadoIF2F7+dcQI1nBGXMFqwTyO+DPQEFc3zSvYAUWJIn65zVkHYL3
	QdcaxWKua/ECXTAX5elxi7d0yVfujxvA2YyEjktPhuAwkEpcgLGXl734B+ZGzZoiT0P6+v+ucqY
	oUVFlKTIOEXqT7gPJ6sfpnZBhqBivOwEdwShLpNTsclWSN9ALZgeWMbgVV63J3WiKAGJ1gdSWFj
	Lw+wj4ZaN+qW9xmS/gZVB/SGD1C4EJvY5a0XY5wULMni6mhDNhM2Te+lgMO8SHJ29w8b5MviLmz
	J6lbgtAOXAfyrxqBkDQrhzgmebWGzABKLIi+eh28MxwmvWciPcjNAdvhJWz2LUT9LRNYxg214fv
	ZzXGKBxHxIZIEqwhfOz1EAahgNgSFGnFH77zA97m3fpb0UjPx+b1H+udqANonopoV0J597LHuhC
	ri6QR2eUH1oOrUBNOHt9HqfjV3iWmPyg9TCxSQc9u+ZktVSkeXR4wJra7iYwDpnLPYaoBhDiv1/
	W7uFI0uZC4TaBmiDKLBiz4EY4hoo5QsAt4kJzk7ouS1v6jtDmziir5hKD3iPEytUK6rmrtWKkIz
	sx2s2MncEok1BklCyOg==
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr85280425e9.16.1793299073743;
        Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:35 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-2-31ffbb6b82af@baylibre.com>
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

See the S905D3 datasheet 0.2, Table 6-109.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..fdf41572be84 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3666,7 +3666,7 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

