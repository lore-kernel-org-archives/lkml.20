Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605481;
	b=bQoyD8AmcqFaSjhqbRjjY1PCg7uKFFH8YjjG6anMvHfjV38iBR6XFdVYFpdNgqGJC9UE
	 lQL88ck33K7Ll2Y/9fDXnr7s4QCo/9+wvJ0zw1bOMZjBh6RfYgbHKi3RNjRagpfyL+EeD
	 QSLWpmuXMdA610MZfGb8Qbs+fGmTsjZOUTMSjHHoKrtfAMX+mR+S4BpKG16Ak/0gC7utr
	 o+C0j8fWrOiVtFryzQheA+/LpvjrorMzLyFNhE/Co+ywd6TCiLR2ksMl9wUzvBa70HtEx
	 x5rCWOhqpAih5tM+e9R5gcofmfxhNT93UX26Gxw0ID7PZ1BdyYRTvH/gaBuozPYuD+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
	b=vs2e5mR2CSibzb/oN4lXp1aWbEAoXCQOdBFoM5/1/K/QETSfnGUyjT1EDtEk/9PRfaMo
	 k8+SXaGz5XyTQ5Xgikp4DdT2jLuX8p2lAEx2cMFnUJhwgbpgXbyvGYORedUnZL6adPF2c
	 TEBBQfjo/jaMumRUmymHKmfvfas6GO37UzY7tzXpF+wupZ4bHje2Ov8Uu+lXYzoOQSyAs
	 YGnca1ZLD2LqE9zS50ulgAjBOvX+s2E1ewqd8d2EL3jVYWdx8FTDZbgRsG9YmPDEJExZX
	 QFYHLLXgDm5eM665fKlOi6JEMOmM8CU+chPRrhMMR773zoV0sMpxJIenKOkvEIPWFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iXISRmA+;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC9606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FC9606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iXISRmA+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49d64a88222so421022f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605479; x=1795210279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=iXISRmA+oktDtrSv4kMbnArkrGEcskye3m/DKWMCHC3TWyVdckPnyUctcpisWOiEkB
         sMVbcaILkheEaGTGyIknfeMxWCMVG9EDCFoIxLwY8PZv/YW4/EybM5Z6VkGITfmSU0l/
         ymf5zvwoZur1gbqZef7QlNw+/jqJCae1/2e4E8jqEodtr9rrYIuh1WU4SVTTs9WV08R0
         VFiYpo8EX7uxwTjXipkDm94WVOLKYE4AWLtO3R1LZyr0QbXgpt9uHfy4nQlBnWSFUdBr
         hYLEUdFGx35sr04h5U5gbSECsGEKti1kElQ830u7UwVGVI2F1VZZjkS6TmWilQecauRs
         hMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605479; x=1795210279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=Bt/EYB62HR+ktgM/aw03O/PM4qUo4HSYa/6d/mQBkZFdolwvOGdJPVTiiVA+KNpwH6
         cIaYsKFg9SU9tOTDirjOhwh3896jUYwAXG4NYepxihQ+vY3Px3fKfvO3d7LWW1bmlXHP
         7AUVUk9gWLPB0W9CuiR1YO/Xz4me/W+gJ4OOLuJnmZX/qSPWzhHUyqegA5SsFw/AUZ2y
         9lHbNrb9x5hYF/079fGcsINbA9H2eaoX6wvgJZmuJNihin892bY10ZA1vwc49Qtlwk0x
         HtUNcN4O1U0IflXXIpWJ0bFWA72u65NQXwNBZDIF27hJwqjk9a6jW8iWV5NANe4VUbca
         kqDw==
X-Forwarded-Encrypted: i=1; AL+hErEa45MsoQb1nJREmfKp3k+VpkbQ58i24ubqHugyye/PzSp4bB7ME3KRI1gaMdAEE+5AYTaI62Nz9jiajgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hSHTnjTagfaBY5ZEbmsGASaufZGwFKHr+qLTA+oqdaEfBRxU5
	IHVhs4zRYHnq0GVJOZ/slFv21T1ecRfn2/2JXFzeZ+9bgJ08vcLGMuVj/PdE6WS/yHw=
X-Gm-Gg: AYBFou3UjOA+6mujoyuyeJnc2ZlBqtzYxbXgZXOBwIQqqvtmdD+/dqd18PcB3F2jnNW
	ekpWNouLVn2lyhPQw9vHH0POjl7zaEz0ODDSa8qhNaNYcN/RpASBQPt8DCSqB3QwqvuE9ORIIIO
	u6OD0GSohm/lQgB+XIa/Z5oP6qd6k+3I0lbxItwK4lA4CPfrN+tPSdqQNQxtOiyIPOHWaSAtpyA
	jhYGWLJVZKUeW4y63/+C3eH2HdV7SSUgTFiJ1Zn6lonRhYG9mORIw0EvoeHoMCJaw4I1YAU/A8J
	arGdI/1fLU/gkDbBiFDlQm1lpvu0iz/z9ZrDPEEmHrio9isJwL6jz7A97b46FhXdixT/1ZIHvEo
	gq08B5HHKT3YhEhze9cw1N548aYgmwxk7zsx84sNToGwAJ7CLOmrOv74+X04ibTvZQPNSe1Fhfz
	TpXWMwSsRDgKPe90ozYAWjXzhp0+nVn20iMY5zQGfa5YGvZlHgfK/EFyNvDXNXV5aYPbPH+DPuO
	a5Z1sdcbA5k0OYoahCsQIXIl8DzXr2KLhfBGvm0O8BrbVPkmKivE3pwrcr4Cv3I47oKfOmFRytH
	xMgikcjVqb6DELBgmSEdKdsjxuxeB9yxIgGIGLxTZSM6odHGaUCt907MeGx8iHbuAHooYPW20ea
	74DkPkoAWLY4GgHAkkR/pvBsjtA==
X-Received: by 2002:a05:6000:4305:b0:49b:d8e6:1723 with SMTP id ffacd0b85a97d-49c6d452d42mr9891966f8f.2.1794605478667;
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:50 +0100
Subject: [PATCH v3 4/4] ARM: OMAP2+: ti81xx: use non-scalable voltage
 domains
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=1792;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IKFwMoPwqeJrJOd6paqyhsFrEgkIZs2drKUuLxdD8no=;
 b=AERHNgcVKZvhpwIQt1j4A6/AX353m/5rBEbtNJaMMfUtPJAmy0ZnFJTKThqFJVvq3htmRF3v/
 p2RyPKtI4iJBfzcDoXyR3witwvXGXrcp/sEgpjcxpBju2m8aSdYnfkN
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
domains are marked scalable and reference OMAP3 Voltage Controller and
Voltage Processor instances, which do not exist on DM814x/DM816x, and
no PMIC data is registered for these SoCs either.

As a result, omap_voltage_late_init() tries to set them up on every
boot and bails out early with:

  omap_voltage_late_init: Could not get sys clk.

Adding a "sys_ck" clock alias would only push the failure further into
omap_vc_init_channel() and omap_vp_init(), which then complain about
missing PMIC data.

TI81xx has no voltage scaling support in mainline, so, as done for
AM35xx in commit ddf536d0d7e1 ("ARM: OMAP: AM3517/3505: fix crash on
boot due to incorrect voltagedomain data"), register the non-scalable
voltage domains instead. They still provide the "mpu_iva", "core" and
"wkup" domains needed by the powerdomain data, and
omap_voltage_late_init() now skips them.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/voltagedomains3xxx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
index e98a3f289c27..478f5eb2a17f 100644
--- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
+++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
@@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
 	omap3_voltdm_mpu.vc_param = &omap3_mpu_vc_data;
 	omap3_voltdm_core.vc_param = &omap3_core_vc_data;
 
-	if (soc_is_am35xx())
+	if (soc_is_am35xx() || soc_is_ti81xx())
 		voltdms = voltagedomains_am35xx;
 	else
 		voltdms = voltagedomains_omap3;

-- 
2.56.1

