Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633341;
	b=NltfJMhADGwK5x8USP6HOQ7boAzGXokWymo/qg3SKPepB4JiaG1G6/pCSPzgP0rGbFiP
	 tkg9mbP85bARK5ZcRXDcayELKoZcUMuX5BnYbP1ir/N1yZVsf1/YXhMQZVZ2nxUKXf5Gg
	 DUKf2jJbzrXfKnl9hFe5au/CzNotGVekzFUsGHcy+m3PFNJNtX/bLGYXP+aDuSsiYPWwY
	 LHzxoyO22e5w3M1KCKYuXMxweuS4AcyVMxFbu/tJ0pHTBxG6tFXAJlCd4cbWscmVhvgIm
	 PTxgn86D9YxwV9rKR/TavVhUxOPngxRWJIxcupgYIvEqbNJheVBbgg1C/yOJkppVvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
	b=oWVft3ZJA82kip5PyPEDOTHMJLls/fNISSsPXN5SCPbcG/WljlxXDzIs9oEtqyScsc0W
	 M878fGJO2Z20BiFfALior13+JhPKX4PC3PbOdOVSn4GZEiIq1T8y1t+bWTdVpCn/RgqOZ
	 NhzcdR9GPOLan03udu6AWUSgTKR5s8escwyv5PRIhyuQ3cY6Xt8zkaBBj4LCryDVy2gAW
	 Yk7vP5lLzZmJGKFl2e9Q8/iC7Wx8DMhjRdHgEUL4ORe5R5XI3ApXywEfzkkHe/E/ceD/q
	 5FQ4P4Rusnsi2Hx2V72w3lE1BqLNhxQZTN7Fy3NWxb6dmsE0YFSwx8NgSZxr9D1VCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RTTSir3R;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919B60D01C3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6919B60D01C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RTTSir3R
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so19258175e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633339; x=1794238139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=RTTSir3RL0u4FwfzJlXdc/GSHCIh4YqIPOVifKs669enMpxHfOhVq31kuGk5ELU2an
         Iye6agOg1ySFwnedfPXavffzwNjf2EP7aXCmHREzvpIpaHkPGNiCrgzKek628Urgo39/
         Whswk/kx88CqVTkmWR3h4fsJ9rQj5gxnfLzYM+1z8Y1pjih6u04F99ER8uRPe6J9Q6PE
         hTRyVEgAA58dNHx3fyvLEcSFNIaUQeWlUTwEm2DQf6mw5QIGI8HGkXeGgMXJiRF0Wut/
         jfvT45oc+p4pNPKOsBjygyqFu8NLU+RwmLQ3CpRceRXlvPH9YITkRGknjc2rs3kgWflC
         CF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633339; x=1794238139;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=I/+1vvp9Y6eSPB/GZzBSiV9SorjchtDuaeu8G2TWZsVLSu64JhngWnl9+H6lnCVMz6
         qroeG71k4ohEY8bOGmarI3h2j5mzuOG6zTP+eblicK9cBe6PfbsOE8kQJNPqesTkv4S1
         V7LOL0KKCEubYpr1c4vVIa03S8b2Zj6HwcTEdcTS1DjmzE7ZbsLQ5r5PRPcXqYy2IcFf
         AMGdMI88aGm9qt8jNLVrWV6o5KWoZ41i6vKk1IfsQ85/UvyS2TMylpWz5iNBVgatq9t6
         yeaqw4H1GvhGqEuQ15+6I/E6poqoVp6E2LUrCuXQNy2kRQyeep1VnU08MdsWqPTzQ5Md
         0MMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOoiFgPF8S8WdVh3+4BLQaOURFGme+o/MpW7XS0oich03lfMMRDSZ2gA5j+AcMv3NH/Wm87zEhKveUQ3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWE/mDT+r5xOVDsOhE8tU50lzyrV8jSlMXNjaIBlebmVGYYth
	otB2JqeehxMCt/jQq0ShrNYOuoCKWx1M7JHXBEVn2/WdMSACRMSgu2GKZRuUBDut5aA=
X-Gm-Gg: AYBFou2Fy9cy8pyscJMq8GH6A+b2c+bonTFQhsuZ9FfaF8Qc5Zmopd7YkCBRXGYaM9T
	e/VQNyRpaOkR5nxeHUHKaif5dKqi2G75+D5EgehPluPtU38B2XbsQ4iLg5hYGZoCODLxD9QMAvv
	fp5hEPhSHhb61zLjF7wO5lzE4BN9O+Jy67ZD+C4013vS6ix7xIfOGWgw7Oil48FcokJaE9IQTrk
	k4TGW9UyZtYL8S8Va7dNdIpUqNaSFlAj5HvNIEQo0dylC3jizpaeofStbreU9JbBBWyxSQ93spA
	2abM3Hrd6zPv4uWmDNtdMSzfXFGh2ElJ8gR8+1OxuDJkzgn5N1XWMtUqz0te41XIKIUcUs+boJt
	tpD9rww6dB0BcrWYjr7rmo31nLzsQXVfdiKxW+J/q0oMjVBrQ6VroysZyQ2CYYfqMACl3lNLc8t
	4BHBEA7fxHZXZeef9LP9SnRTUztvD47pVU0F6NLaCUXq36SSFOfmIQoC1MjlxDBgaEMyJUBDi3d
	EgkqlWLtcVO0q8XV1TVkyn8K2gSh+5rldlDJSDoVdz+kGWqESEXPh2BVT8Gwf9J2s8rCSALsKhx
	dQfhOs8rs6zUfKaf2d+i3cvvO2kL6Ux0DHjaOsgnCA4OtWaF
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr225316555e9.32.1793633338944;
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm21907349f8f.34.2026.11.02.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
Subject: Re: [PATCH v2 0/3] clk: meson: g12a: fix a few clock definition
 errors
Message-Id: <179363333450.2870673.5521256341441057002.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:28:54 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=475; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UHmtYAda0lGZObY89vb/eGPORt1iA91FW+pe6vRHRPY=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrorDmjByjJBe5tD6E7zTW8n2IfF2kAowjccC0RauvXZtFJ9
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrorDkACgkQrRk/eyua5RdrYgD+LgqT
 qJyhqFLLMsiGPmZJS71z+tbVLAhGGnJjxQ01/0MBANcj2HeO4569Ea1fKVqMVdwkzp6fy5qRmfB
 qRRwtdUYI
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      https://git.kernel.org/clk/linux/c/9458f994b92f
[2/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      https://git.kernel.org/clk/linux/c/c56b8550e390
[3/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1
      https://git.kernel.org/clk/linux/c/5ca65bc758dd

Best regards,
--
Jerome

