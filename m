Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356837;
	b=hatGTah1QEY6/+bW+A5YjjRkhZqaMwbu5qvQ/rHv7QEA5ZmC2OOzV5nnK0gPjNrz7UHr
	 XqwlrN8Nr4aMxWWHlKjwtUl7mwQGwjkHqwdpG/e2e3DuZ6CSRO0y401JQqD6ny/Br+Jnk
	 PRx4nCDIxXWFisdSm1bvg5pfQCFVpa8jCzc+4XGIPZF8iItC4QeQtobLxK3G4ZWcpPgAr
	 76yuJW9aoxDgsDsjQ0bf6n4y6AW28+m+VLUsG9LfEm+rllb9fYR0y0QAHzio3U5j7eJUf
	 9Q9e+x8OE3uMjdaXkP3VvszTUvUEHrDFl23t++s6C4BR2HzQ6Bu/Wzs/L5eqvn3+zzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=;
	b=O90AZQIs0TQtvwVWJFXCGq5PNxyLbSmN7Nk2QpxDGZQVekXa8kwiJsgSapQnYRLgGEfU
	 7UQa7zOjuLcQ502+HOy09E9BNKbNjAMgC5R5JORUqOivqvXWuq22Qw3bWJTSOcFfCpdkM
	 RJRpxfQwdQcpqMl2BZCvo+pG27X8c0Q8nNZMflrP67cK7ntk8pKg/uft4ODR3LIiss/Yk
	 6rJiErq72uPCvMi5UiskDki+Ckx+ucDT3wn0SxbWl3X/XzgXkePs2baVdTAbLqB+uFkv8
	 Qs7s9RnQIK4vDb3vDDbtPJYPYV+R7Q6gTmVOjz+JGqR5vpmtk3d7HNMpshA79VQVNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fyeRihqv;
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30348606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30348606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fyeRihqv
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b0a195dbcso28411f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793356835; x=1793961635; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=;
        b=fyeRihqvtIyW3JW9mdFT1KgJ0Enpjqpzy59ZzvSWqO6bHvlbro6C5QJduVM370/jWv
         eyhzwbuq1jv8DQX4AuNtPJcbQ+lhvDt3F5QHOPsmtFCUSnm5QkKAab/P7r/u6rLGdTHX
         YFgVUhmGuxvaVsqvGmEkbbX/Sd7JzpgjeO+nCJb7pbTM0gmES29yV4uY2n4Z7Mcay5wu
         cBfEvmocAWGPnCoQPe1jjpZwxVEsC9UnYGILN2EfpcrMzLjtKtWGqOqdmxHcLkvnMszp
         b81AHgePItYfSEN7UtM8UD2Z/JVFdAhfNXZmXjyrXF6O6oM4/1w6Kc6V17rLCca3yeZO
         V8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356835; x=1793961635;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=;
        b=SqJXLg0BiOPLDd9v/esyVlw7VVkiyhj4t1FMwlDF3DuJeu2891xNjiTp44vVoq3bbJ
         CBNGBpAQiUVcBD71JgymP+Cr3cOpvfolHqGWrroqGaKQzW0jbaVaIR0DSuKrEmyGtKvH
         +hG629hGNas4CjLfhrKnnvO10q+DKMLPH/eaInIgGwvLyB54icnVn3xIVK/6Heq0wzLY
         Zdh1T/1VGLtUISrK8f9ARRPbaZqwu6+x+B9PgtkYYL8UGzZ64fBprDfDNBrcB7rzaVKw
         qSECJCs3pqd7tawLdLpY4lmjEfoA1c2phHR27td7jvORMa1LOpX338+EA+pMLh/+O9PH
         xSNw==
X-Forwarded-Encrypted: i=1; AKwUvBwcbiAKTlVLEttp/LvwIwEJV054aemVchyNcd/BPyhD0gn24oZsNTgyepf517hLY1l/9k1ud53h2f7lWOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoUtLi+4ynbIzsdG3MRZrOpJO3i4pvGXgNTkukPuRAnHAo4uK+
	IMxWbxZ4vFQTLzlVjwNuRCPW8HizA3Jw/jV4ZfSGQToMA1OGMz2SSXFHFtlpkkVGkt8=
X-Gm-Gg: AYBFou29Z8IUp+p+fIOrGRFRqRsBAs6JVei7fWIemlMeBSyTP/Dx0h1PC29Tii8TSMU
	GfCeJUOxGzdTnDjuMq/MCMMHFqN10T01rKMWqdi4ah09jW16MKIaAVkG8oZx1R3SBrCM2nZuo6w
	HeU0l8wZlKfSMoVLY63q5/d1ZroLkcc4pdI5hd1E7gOysi242Qf+/XxTemo2kHwqwYIQtXO37eZ
	F1YHV8wzKaaUipIJKa/6Tec44sxQvKpdZmqtJg+ihX5wMoBFVvAKyEfwzAdYyvSLD46CB1Md7mD
	fuDFm2ctqPLmakOpW3wXVzai+vqNt3N+4o4M6JppjRmdfvk6HvyoQBx0D/p10Pc8LasKmFbG4Nd
	AWOxFY+GfVWZoRNouoKaWyG22IHMWurXmd8KgFIJTXDGMgIfno49S4b8RTLTBEBDUsSMHIn/DPt
	2BclX0wQ/kUHs9hlVyGStjz8yUEhcTt0Pp1yrV8mFTue1kp8A0HJ7ZjYLh3MSRlvotmvlLUea+I
	HEKBO5lK3ZICRUXZevVaTFoEdiSOtpauAbh4ZDUxx4G0A5aZgpI2F9kn3MYnfyT11JlFS+tm7uG
	0cmDy9PayS1iERSatLMFoKGj9EWnj4Q0107FX03ntfKbjmANon9DIUDgIaKZEC9vlHKV7jtTDg2
	8no8ctf1ClVTtZn4zxcENliO+AYE0h8hNpExjV5LoJLqJvFA=
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr43924345e9.9.1793356835493;
        Fri, 30 Oct 2026 03:40:35 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm128054145e9.1.2026.10.30.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:40:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 30 Oct 2026 11:40:30 +0100
Subject: [PATCH] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
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
Message-Id: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s3YSoKLoVYyLAoMdjS0B2pA0v
 buoy7f4f4NMiSnDtdsg0cqZ56lBHjpw4zA9CNk3gxLqJEUvMA7FjUivMieN/m1krbh6NEL7o7K
 Xsw0GWhwTBa6/8e3+d17sk1z53mDfP5nUuDB6AAAA
X-Change-ID: 20261030-patch-ektor5-dm81xx-vd-805d42b97bf8
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793356832; l=2174;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fW7+0/WXEVB4unwZegY0rWJvXAG1+Sm+jd3ooJSV6oE=;
 b=oBDmhYYvqpRgRr++FtlQcR0z2LNcib+56DwS5KNiU4zDkyTp3TRXHEVXIBVFdwnKuwGqasWY8
 MfXTTatdE9LAITQKNQgQKdE0Sd1c2Jhbzs++0H3zLwYKN3G4EJQI+Yl
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

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
This patch has been tested on DM8168-EVM only. It will affect also
DM814x boards, but seems that the problem probably affects every DM81xx
SoC.
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

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261030-patch-ektor5-dm81xx-vd-805d42b97bf8

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

