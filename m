Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605478;
	b=gTV1u+1qLjZ8et7q4Z+gjY35YP59riwW66rpNPrIdjwGKjvEHUdqjEEHNw46C0hbg6hL
	 PCOwOn/w4zW8VSpfrrGcVhhdy1vAvGdfdzr0+6zbHWOfkdb37Ql325xSDqiqC4k7BPp3g
	 dtrkzwsk4xBZHoXHn43XFpo0zw3L2clvuMl0bt8W6Cbco1y2BiuP72l7HJ1/3g+HSLgTy
	 z44fdX8nQS20uUykPAHY56iQ3wtzbdngfR6jrAgiX0d2W5leci35qfHf3RhimxtaPQemT
	 bMFazX9GwKjae9kjQwV4LaKwIQtqw2cUL3X4kCJPXaC1LsVqLOvOzmnCBmG/zcKubFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
	b=gQIsKiCXZ5vDH1QM66ywaY31XMS3ie96TeX0wjv2MOuBENvYn4f9ny+qFyMzXwO6+Uyz
	 a0goSiQrpwWsMvJvNe/7oTO0+IXzE2hSrAmiRM9UgvCGeXUtrUEosbi6x04gpSPcyG6T6
	 yE6MO10UHLOIrGiqF8SZ+HtLS8w4dU/P9ui7qR+Pll+pMp1CBFMR5Fp3gLQ/UC+rLuueA
	 WPlKpgCBDynl1k2NrT+lZAg7jfCDzDyCrpHInTJ4/oz5MIYXHIZa1QTVTyP5MucLNiH3r
	 WZcyGYVIq2Wf01RatGy+OuUsNyfXhY5V1xtJvXbPGTQygwEu/IU8IPgQi5CxA7YapMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="X/x5Z0i3";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3307606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3307606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X/x5Z0i3
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1856515f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605476; x=1795210276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=X/x5Z0i3mWJ4HQlPGT+1dulVZafouKGi9p+ya9B5VK6MbWSTMNUVSEnls6xAsmCwA+
         zkiqTM8vVw3hVD9wHvmvaLOif+Cr31wQA+6fVdEkJler8s4Ii+X0o7RXjGUJG74wTIHB
         rL/EtpkOyQnG9GNOs7R/97CurzOH5krl0jE1jO0+kLuiNHTFPe1VAWMnbXkExbzPjAkD
         IhQBUIr64Xm04jdi095l7QEHQJRHPKKcd3kJKy2dbs9UXzfXBeTxQ/TEs3CcLSSE424z
         dylASuG29qT0Zy2AySseh05vmAUm6X0aWu+AW4hkxGPgTv11/qJ+W2+xC6VTAgQMBf5v
         gqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605476; x=1795210276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=SzUQE3i1ITpI6rWnMrCipnPEGknLgLJPUZch2DFe/LZad35VwIC1SNxA2h5vUz5peo
         xlWSmYMoLKCffErcy33AZjZMqfoHR0mQ+1Ve0o/lsAYkaexHvSua0VHE7zF1/PP9SDzx
         980mL5zwE2uvlZgi+mSHlHZ9rKENqcZFdlFBg1d0Fivoa3AoGTUFxL8Etc7EMcT4YixU
         MKKMM9yU9bc7akfSjH/lTQATXcwivJ5EyViiKDYAx3wyreDc91JW2zbatZRfb2CezvK+
         jWNoyUy30j2sG+mTPDKgCq4ZJSabp7cvU4/sRiYM68Pp8DYx66t8wj/k9at7rp9f1c2u
         wFfA==
X-Forwarded-Encrypted: i=1; AL+hErFrZQdptZVLTUeYJkdjN4Eh98pqQxyoiIe+RqYwNx3SkqrhmHAho7X10g4xK432G9yjewe+zyp+hROiqII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z/ZMufdn29sXkR8xkQx62nQg3rzmIK33xDuJJSV805mQU6MrK
	wnDQeToDYs4+Vp2Nom9iGA11L4rxDQbih+Fb5Cl2FCTg2eTELylvJjHPfQifv6aqBH8=
X-Gm-Gg: AYBFou0vavpIT77Czmyqu2R6pba+xJ88CrFai+z7OzyDBi58A9DdRfLmU0rIBhHNLyr
	oel5pK8Ve+g2J0Gf4AJsI+Q1vMdKpYG1kFFW8A8zrJAH3fObDv4JEZv0p97jGuHkULbGDviQ7/M
	Rg17xFflQO9N3l7XDswdm32K/dNvEoQe9UMaQb7UolD/7hGmH40ssN8+9I1FkBagimlxvpmtFnS
	3tK/hlKOcp5Hm95hLjgkiOiENLzxU4RkEAAUv46fgHBWwmW+6cp3IMg/DLLsVYanrNHafUdXsrZ
	FG6O6SMXzIyTBtPeg3zfQZrEhsutQlXSfAeFQZJKlHmMt/FYZRaV230eAsFThtSWBledcbaswkM
	Mi+A8Qj4rL5i7qqZBdMM/KpMijOP9tLkgJCSJ6NUc+b0nG9+ARbxaqOZ0g9T/5xAJEzj/Pe0bby
	gkvkpybymQwKFFNHLmLLysMN/BeXAqew8DXYfjx4hgSZE/V8gupFwvaQEUhLkD0ur3WPJgatZ68
	nrvkuurL2xS7Q1NKiuZ0jJedvvOPuzYmUI/tc/Ge5Uy3GBMxHjWeDLuF5XKvWSx3o3kQUW91+4N
	GcLYpndzlR336w/M1zyEZyCJBKG9l3uoGfzce/4QKVOFtUVfnNkRd/DnfGYABUzV2NcZVWfAT1T
	yMERbLi2zG9bA3ZiKLthDJiVCH2VfxDfQmbf5/LRVS//q2Cg=
X-Received: by 2002:a5d:5d86:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-49c712ac267mr8339076f8f.23.1794605476337;
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:48 +0100
Subject: [PATCH v3 2/4] clk: ti: fapll: Fix clock speed calculation
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-2-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2057;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=bJxNSt/zFq6q9Q5K6PZzIH2KeHUpZXrPEV90BgzuB40=;
 b=ub/Fkko/9cdU1xB2SS84DwJW77+/KJo6ucHf9cDfX6Hu7I0tGYXyJkBRy7PAiK87L6mzAvsmP
 eiiq7z63229A76yfsrbOWWdpzecTrq3XfZ7QxxNMvWHOTF9rv11QNs2
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The fractional part of the divider was being treated as 1/10000000
whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
speeds being reported when a fractional divider was in use. Correct it.
As well as fixing the clock speed calculation when read, also update the
calculation on set in a similar manner.

Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f6..bb9986508578 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -54,6 +54,9 @@
 #define SYNTH_MAX_INT_DIV	0xf
 #define SYNTH_MAX_DIV_M		0xff
 
+#define SYNTH_FRAC_DIV_BITS	24
+#define SYNTH_FRAC_DIV_SCALE	BIT(SYNTH_FRAC_DIV_BITS)
+
 struct fapll_data {
 	struct clk_hw hw;
 	void __iomem *base;
@@ -336,8 +339,9 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 		v = readl_relaxed(synth->freq);
 		synth_int_div = (v >> 24) & 0xf;
 		synth_frac_div = v & 0xffffff;
-		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
-		rate *= 10000000;
+		synth_div_freq = (synth_int_div * SYNTH_FRAC_DIV_SCALE)
+				  + synth_frac_div;
+		rate *= SYNTH_FRAC_DIV_SCALE;
 		do_div(rate, synth_div_freq);
 		rate *= SYNTH_PHASE_K;
 	}
@@ -378,10 +382,10 @@ static u32 ti_fapll_synth_set_frac_rate(struct fapll_synth *synth,
 	for (; post_div_m < SYNTH_MAX_DIV_M; post_div_m++) {
 		synth_int_div = DIV_ROUND_UP_ULL((u64)parent_rate *
 						 SYNTH_PHASE_K *
-						 10000000,
+						 SYNTH_FRAC_DIV_SCALE,
 						 rate * post_div_m);
-		synth_frac_div = synth_int_div % 10000000;
-		synth_int_div /= 10000000;
+		synth_frac_div = synth_int_div % SYNTH_FRAC_DIV_SCALE;
+		synth_int_div /= SYNTH_FRAC_DIV_SCALE;
 
 		if (synth_int_div <= SYNTH_MAX_INT_DIV)
 			break;

-- 
2.56.1

