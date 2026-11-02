Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653656;
	b=YdCVFOFqBQ4vxdQjK4F94E9P/9MOiAr7bG0o2mPT0c/p1p0HWF0A2bxaKKgGz3gIDdYP
	 8x1j5wBZMEi0dIQ/3wELBibkPlJnz4Fz3PH/NIILGQocjYtUinUD1SHEU/Gh5NC+BVYMl
	 JFlC1i2lakyXGeBjRO6CUsq43C7AlQQrV/OvCV/oR5bF3WE9rjGSxysywCe8aQet+OpvF
	 KXYD4M4wlUFgEsHsbnD1TNqGEw1hBiQJeNJTg0PcLrOHeH+5LDINfu+747Y77iubGlreH
	 Ga1s7t1o7DdMO5tlMsT17C/RywQtE5kj9vud1JuIfuL0VvudkLcNtuBv0u4yMqD4LBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
	b=maNkCQjkt+NHUqBFdNSpuUP+XRycJZfeVDgUuSNN+OIpH0heqZJFWw57U68kJqo5UNdC
	 5oWS6izUZrYH7JIda+Edl7Ovw4wejYVfHE5DET6U0MeMfGeNJ2Ng6aG55+ovy9H+YcBFZ
	 6rbpD8FC+1mphbw+Zn2w4VsA5C0/qED/3YI3TDZaueETIoFkQnIPEt+54Worlg8kGcGAz
	 0g0LB1PID0iCFrwj4DzKuizrKed1TXdtxIg6VQurPeoqnkxNh3GExwkHGB86MRJYkgkA2
	 kaa1flxHnPmSvXm4nFT6IHUfO80GcjwwBaI6lUYuXIyFodHXX1/PbNh8XOPiEziiLGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lvga68i4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA51606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA51606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lvga68i4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so568535e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653654; x=1794258454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
        b=lvga68i49+EIGotxRfWbtJ/gVriERQYwYxYnEBh93QJ0MNdFH3a4JZdmVh7F64jQKK
         jIKqIfCLYu5pJmwZ9dRMSHeLd5nZWgyW1tS8yLOobaUw1CdNRP9hyuOEGbkX5HYW0yyu
         HzXreaG1LBXakTNKDNF3rGRG08uIruD/PN/ldh+ohFHqwcIUu6Qr9HGy9NtsM8cY4Jki
         GS8N93FZiAKkbLKXEo64mvQ5gZthujkHlsBUBHKrIX5kbFSu30M6pBNd4Iz7fgORjAhB
         1oXoivD2j1WfC7iZSbRgAo9YjV9jAPM3tu9q8EYQOMky0ECaJrsOikoLZGUYAmw1nx19
         Dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653654; x=1794258454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
        b=WZKMHh90oXYdUJh+mnCVsuvtuYWl26teJuGMIqxrxvv/czK9Yd3h8La+mdPaSrau1K
         BC5CU+3UD7qFgb230odTLN7hv1FhQWmSnnDn48SICgMvO5jY72bn+0k2lIzuIG7Cbj7o
         5RFVSR4iSces41Aac53lnWEXOZxWZTTvJYGdnoDpzwHrQUm0TUwE8Y99M6qJw/n4fB8K
         thl3XFZHbIZSLxiLBReOTZTMoXXUAlEHdwJH9GN3Do7p+J602YXDwRE4WmqYU6Csdjps
         GFJwiPTDGfE1467dG17sMuUgiDnOtSUQIeOKaLfZOUD9F1z6hPWtSyRDWn4KeYUYPRiM
         uR4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxflV6kXuCUbXDhngtPNs/R5ojEYtmyEPYYHF46RTb/RE4rHBZBxkci137ILIzvR3E8nr5VWSV8YHPpuW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrhEZVl98A+CLbl39XRwevTAGPmYs1ktFh6MvfFB7yAkxdnUcY
	2HBF3cL+jkvW6DC383wISI92Rd7fNPfaa/li3Kq7S7Zs89xCK2CTSwvfVFgKOsJAeKw=
X-Gm-Gg: AYBFou3a1zJFtgwCLpIkFTXjfi+FYC/M+JgKqPUAN5lv2goWsAqL1WeRxspzy6vOcvv
	6CY4qmkG4LA9BS4gOJtub3ngKPLZPiEOMSHsGuc8KRWsXy0SUS1TRCLsGCBM70Hrm8Us/2qZOTj
	YedJIbuvqAQTCPqL1XyS/7e0sd/Xy+3sQGXldB/2HLAr3FGXHBMMqdYD1Wf7DAS5tcKep+gPXgw
	LfzWV7wjR1q+ULzUCgalltWFRtTVNatZkQnwQNaXF3VT+62qUY49z+/zrE6ekjU+dr/q05MwSMR
	otcVP5m0hI85rj9G5s4OGiRgTulWrP1wxgpFHlHRzzmcym+1eqpPcTVdvXXkeXTh7jwi2SbrOMF
	EPMH1uHCGNR287FgJVDW94rZDUvR7pOxr0zHYe5uY8V8hbFLvDBImphVB9P3n0nqiHKA13F0JF2
	+uNGC2R/STsQTgr59O75XjKsRXIJPN12Vaosy73XJiS0yI/Q/L66qG8DVndhxoGGmZ03CmHAltx
	UfF6C7cFQWcNazEesGKRU4rJSK/JmCdb6GMJCvt7kn6ZiMwEDVBUpLoVWpozAzS37obca1BjbCW
	e523GTl6wxCIEYB4t77wzfxjTTMY+W0T+IJTcR1Nx6JOZv+rfwhVPfsxgzDTlED71HT2WBEs4GK
	bdekkzQNM2yzV4SXbgQ==
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr248630065e9.11.1793653654031;
        Mon, 02 Nov 2026 13:07:34 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 02 Nov 2026 22:07:20 +0100
Subject: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29 GHz
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
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

From: Sebastian Reichel <sebastian.reichel@collabora.com>

DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
PLL then computes a divisor of 7, not 1, for 5.94 GHz.

Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.

Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..a446abdedcd7 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -227,7 +227,7 @@ static int _div_round_up(const struct clk_div_table *table,
 			 unsigned long parent_rate, unsigned long rate,
 			 unsigned long flags)
 {
-	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	int div = DIV64_U64_ROUND_UP(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -244,7 +244,7 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
-	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	up = DIV64_U64_ROUND_UP(parent_rate, rate);
 	down = parent_rate / rate;
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
@@ -423,7 +423,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 {
 	unsigned int div, value;
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = DIV64_U64_ROUND_UP(parent_rate, rate);
 
 	if (!_is_valid_div(table, div, flags))
 		return -EINVAL;

-- 
2.56.0

