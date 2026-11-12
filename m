Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476229;
	b=HwUPLn9DBOXk6zf3V8ZwWTwhex385eeRvWu6hU0rJ4ljQwiDPXOAcjU1A0uC6VHAQMBO
	 H/GZRhwyryNU48MVRenOUpJEOHFQkzLgd3cYZHHpYHYGPrYDPfjtJJm3gy7xaFFw75Vrt
	 ieg5e7/Ti9+XbKMHgfHIll6b+aT6cpDIUZSQriJMG4xjIbUGzfYH6BkmVEKZUgFsxYiiq
	 QGBpSFA0mqN5n5DVGC4h8/eZrEusehcYnQNiDefoHPLFMdKOj2J+Q06TmviuEGkxRr61P
	 co/4iZ53R+UyhGApY0BIXOjjz8GZ1wubuMq/M4fbGuJlAbpVk8H4NRqp0ZuU4Ty9flA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
	b=ceZieqQhcWvX8BB3hFeOZ1IhWrx/HnlO3RgtRyRnLdM3KQejW5dxa2+Ja5j6oEgKmYR7
	 wHF+29T7ehM497nwSTdR7JS0l9d0Oh+6WczDdrXn3nRaRbZx3z7HrXil4ly6nELGRKtDA
	 9Di1+oD4oPdS3QtyoGFi5Tn3qiV0E23gvEG4KrYz6nG942d34b/0ZSy4SPUSSETi3DhSu
	 2baS7uKJtm0pFL9WZG7iKon4HKpSmkrJzFJHoPxlVCE7gStPjg5st2MKdhBQ/Yvl3pIuU
	 YMitO/wJog1/EHJgo8qJeN9qKW6TKHHWairpWb49H8lxLvkDjlnDDkc+eHi72l2GyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFDpl0+N;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C4606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087C4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFDpl0+N
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so33913895e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476227; x=1795081027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
        b=UFDpl0+N5vzWNYV58Ztcil3f2Jd7ypdpRhJeG6e+ALPdPK8ME8T9r08+dT3nLMArxB
         6X/23rwTq+FAC5uAxVniHHe3my5snA8moGZoaORPNSz8WUuud1QHsw2X6OyMkote8cps
         YQ+JZG4jILvcyOHmbvX4JPedYmtxSKKjz4dPhT2SZDxq4tvSgrOzs8zFVF1siDzcJtYs
         lQEyIQan7I+ZN0iEnqcoQF/p0sGKuW4kwSKagvuw6Jiz5RQ3TKkb/YX+zyHT1pSWDvpb
         8oKXIc8vhH9c4R3IA6JA2hjavy4Slh7zR3L6MaDdvrGZjgzrODhaJW+gRVq5OJHKJLEU
         wB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476227; x=1795081027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
        b=YDVsgiVw9xBv4pR5YQwz6SzKmduxFNFa4Y3qnv7XVxmkMe0W8a8CsrdwZhiGovwBCs
         C2BDKsk4Y8WVWnXEwetLacMNbfBE9mLmljOP4LU/W3TVlI0VGLXbksZYYeG2+Xw3cknT
         Iq+CDl3CJCUj/uQT5xVHXdQ9M0gtFsIsDIAabAlulcwzRDxYU36wKWai+lL5FxihWmdr
         E3ROertnM52dp5IpWEpvCPhjMGxS18U450FIgh6xg2KIfC09GbN4hS1pN72YmXDagd8b
         MY0byj4P+e9D3SLNYCJcwE2qkNb6H2VI9igWz96Gs7ie4PeOlBmAkGDWK3/DhEjEJfOz
         fFcg==
X-Forwarded-Encrypted: i=1; AL+hErESUITuA/ZfA9KT+tmbvmL25dWdiTRxjTKNKXlHm4n8oooKn7Z/PjpzuzoS69GuAFE7SFa2hKr3cyzSg1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OFQTHTJSb1Q5dVAHWzk4J8ZUwDrXUCebTKPP30wvQZqB718n3
	xrEQ7+g2lpXrCTiOczDnCjHDNcGNY7E3SlQo2SR7L43XdG0ZyBks1q0PqOe7gSrOZgc=
X-Gm-Gg: AYBFou0E6Wf6Bnd/c8ErmFdAg4NWmL9Dm5+iBQDuOt1CzbBm8qMh6NYw2xaqMrg58Uv
	6Cv9ljnC9SAUBhlmREarq6XZiCB1cdHFznPRQxjFiIl/6r/G2D9hOHnTG0MIzKKxKXY0wPqLHSD
	p0Wn48GYchCfw8Ml4Q6YQLmgkgRZfkzoIG5HNd4DJuao9vQi72b3SpaILxAvdoa2k6ta+6Ep1IQ
	S3ieYt+xGJ6VdRdOaLtQ0BZox4Hh8wyp9KqrwdYM2ppqsXN/VQQx6RM61CrMiPPxybTpS5Sp4Xa
	zkjzrJBJqoKs29IbSrsO7/qdYwWYvwL01AucP8jxPKMiphyBWV16IGqTcVnRxJlpVQxd3VBHuDJ
	X4xoML2wLQCgWCQne39hAhDamoFzQaoQaYay+pFp0xH23YjLs1VxFXFCh4BlIa9bdWEfZXoniU+
	4hRfA6gqR4to/IFwAphGeiNJbfYCfBF8T7Ja7o/lMG4GQaJJqhv6axXshCwvYOLzp3PfmHRTi6n
	hPsD3J4d+Zb0sfx9G6aoOpyxNi+1sVU9f1iu+q3ju7aNXYKzHDMzg681ePmGvARili5KmZwGAjr
	IdqZA+OrVWE+n789XKKVrtJoQlKiQjJYCxbU4ajDDB3Xop5yC5iT3sXVlU4xZmlgpgtSbqvasV5
	tngChmMllOBDeqP3AadQolj+/Ny6Kj2DexkjdzChzWDgywg==
X-Received: by 2002:a05:600c:4513:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba0931d928mr83920415e9.3.1794476227449;
        Thu, 12 Nov 2026 01:37:07 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:07 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 12 Nov 2026 10:37:00 +0100
Subject: [PATCH v2 2/3] clk: divider: Fix round-closest for rates above the
 parent rate
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
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

When the requested rate is above the parent rate, _div_round_closest()
computes a down divider of 0 and divides the parent rate by it. Asking a
CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.

No divider goes above the parent rate, so the smallest one is the
closest. Return it before dividing.

Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when rounding to closest")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3f46f9ee451..ed60fa9b04fa 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -254,6 +254,11 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
+	/* No divider goes above the parent rate: the smallest one is the closest */
+	if (rate >= parent_rate)
+		return table && !(flags & CLK_DIVIDER_POWER_OF_TWO) ?
+		       _get_table_mindiv(table) : 1;
+
 	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 

-- 
2.56.0

