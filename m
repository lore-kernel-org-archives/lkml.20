Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68873D3D05
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651467; cv=none; b=Mj4sQAKjlc1xJ2t1JRiPpxRt5i6M6HERrUvOuTDjk7NSZozcdnOGURrglNDNWY5IAs/Mmaq3BIwWmo7+m7yXQWloMvxzHdV2q+4EsLGKom8EoP6zV0qPq+cx052+6ompM4GH+uvacxWDlnWFiQh0+6GEoI99VrHOUwYxr44F6tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651467; c=relaxed/simple;
	bh=PgS4RWXIzX4J5ZODDned5fwArxiriGg4fP50uyte/zE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yq0kDR0bqAmSF3FA7ntWDWFZ87G7A+7dDCN7wgeI9j0u9hnccyAeI/Zreu7BWYImNhF2zu/C81R2DxO/7YgH3+dkJKuigRhX76VBvo2jggX/AgDZNmxgrgzwt2zhRvsWrp7+nkEnkT1txeiTRvc4RHWICuwbIcr6M10XgX9YOXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWNJk7vd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWNJk7vd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso11874765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=UWNJk7vdkBMrfcmHA1uUdxOl+rdlF1R980gSzitUMv903VasG0FcPAxHGspHLtvZe4
         COOdFrswZKpNeW/ptBZ79RdPQ77GFT5krbeU+4A5WgwcTpXimMlCdHShILVTLvWrlBUf
         nOP9a7t1B7i6WuNhKzGge6j0AP+5GcXT8ePCRiJJStOBUG97qu9pBZer9hlpX5cMBm/x
         gLMq4Gwa9pdScY7M5+OlQ+7cqsmlFfzbY52+JOArFVw82s+rE1SjBE4w91+fD0euxAWj
         +6IuS62KoZwlSzi2w+J11SFWLGjjCb/3MjiMI/4Ixy15ryd5S7BcnnliZE3WCl5tW9ID
         Wx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=sFwe7bJT7fdugTa96rUbmNiF2y0+pqnpydgbYnqpmdkxEj/Zt+HS3pwJHUcRpFqlxE
         Nh5kHVwrXzMp8Lyiu+lxgZ49lI2hGwDH7qZROs9MziNmRV3Mz4jCsGhxrVvUBhqK/lc/
         X86zBmDNo9bUMMwdM2TjfXmW3HQc7K5qPjqrjxa+qq+VzbJ307N8ZGvFO4RvxDgCdcHX
         k47/HtMN7GarQGhHQrmMgSJCns6AHysaFhTFKicTosb2FzPpCMfacYDr8Kqhyt3CTfEh
         OF5xU6mi37HJsPpfg5QGh7FIYpXglLuIHsbRg/Ag3tZpwade245CMYoRy7ZzbJavWaf6
         tAgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp0ETNOhgcOXSU/GFItWt5rTHwei+XFqpR77Ix/PGAIAXY+zC/bo+5fyDuBVOdMryI9rZsJOsEFukhuaI=@vger.kernel.org
X-Gm-Message-State: AFuF++lIrqc1FBVtCpwhHoZ2bbI0gBxJOSZbc9swd6jAZbod3FOF/bN2
	PqXbOOYihWAeCmLapDGV1yoSeKUHOkvL4H3Pax5+GWqBBjVPFo/Mv5V9gCrCtbFK9KI=
X-Gm-Gg: AYBFou35sE/77C4RSCxmPYlIsAQ0TDFpIBpFo9UnALNapq/F78J41mQCyjE5gbV+6Xr
	cREymtgfppGA0meuYPBNAA4fh3eZ8BCO4T4I3LqbGl/UhT3FtdpDdMcdI7CkmP78jsosSYYZ3+/
	hYg8CrYsDE35ZRcdGXKzXyWx09Uo1Je4s+bgOrwsY3fVXM2busAALPllSXLaVnNcQ9tT5fat4cM
	6tb/agj3iGzpRkQ36MM45lhq7EQnLuCa1ELe2OxjWYMbEMc51o7ADc/iBpIs008gENKCcR8Sx0G
	9s1AD99XoYzdS7by9fy3ZdunF5s8RKc6QGQQvXed6dRFhfut6hhtdULHK+IqRjNyFLSZSp4P3Ly
	Asdd4nONK+zTvYJgFA/FTsfH0Q0xNuPOzksrPI5M3fSK8X7EAYuvcuxf98m6JYNXItqAyShXj4Y
	wqHufQW9Fu3gxs+qkiqxYmSr6js4aXX9W601UkuzYY4HanaEoQ0zN/l+HD1SPLuyQZMCrh5eRLE
	vhEnop7WmkC5J0lqAyuABEXM7rCSkHvCl5CEaCeqTOUKtOJFfWrzVIOBrXsyu+796ZUAOlR
X-Received: by 2002:a05:600c:1394:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fe66bdefcmr278754015e9.15.1790651459537;
        Mon, 28 Sep 2026 20:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:10:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Exynos850: Add ACPM node and enable cpufreq
Date: Tue, 29 Sep 2026 04:10:46 +0100
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYsu2oC/3WOy27DIBREf8ViXSoMBhuv+h9VFjeXS4pUHgU7T
 RTl30OTdZdnNJozN9aoBmpsHW6s0jm0kFOH8W1g+AXpRDy4zkwKaYSVltPlmnJbtOCAJfKUHXE
 su6/0w5VaRiuURT8p1hdKJR8uz/XPw4t7be+S7RWySK3BU7IO/yl8qPEXKvG2l5Lrxs+KCz7NC
 oz1uIByH98hQc3vuZ7+tEdo/VOOMWzroMFq4xxpLQ0YNTmEGRGcnFHokY6IShixWHa43x/4Jam
 NDgEAAA==
X-Change-ID: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds the ACPM IPC firmware node and CPUs operating performance
points for the Exynos850 SoC, switching CPU clock sources to the ACPM DVFS
clocks to enable cpufreq. Exynos850 has two clusters with four Cortex-A55
cores each with identical OPPs.

In theory, we could have two OPPs above known nominal max frequency (2Ghz)
but in practice the board becomes unstable with fully loaded CPU-bound
tasks and hangs pretty quickly on OPPs above 2 Ghz:

	opp-2106000000 {
		opp-hz = /bits/ 64 <2106000000>;
		opp-microvolt = <1106250>;
		clock-latency-ns = <500000>;
	};

	opp-2210000000 {
		opp-hz = /bits/ 64 <2210000000>;
		opp-microvolt = <1181250>;
		clock-latency-ns = <500000>;
	};

with random data aborts and illegal instructions. Maybe SoC can survive
short bursts to these frequencies but this requires a bit more messing
around with cpufreq_dt.

Also, it is currently unstable on 2.002 GHz OPP as well so this one
excluded from the series too:

	opp-2002000000 {
		opp-hz = /bits/ 64 <2002000000>;
		opp-microvolt = <1050000>;
		clock-latency-ns = <500000>;
	};

with the same symptoms but takes much longer (~1..2 hr) to reproduce on
E850-96 WinLink board.

Sustained testing overnight confirmed stability up to 1.846 GHz
(opp-1846000000). Higher OPPs are omitted for now and can be evaluated
when we will have thermal zones.

The dependency for this series is:
https://lore.kernel.org/linux-samsung-soc/20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      arm64: dts: exynos850: Add ACPM firmware node
      arm64: dts: exynos850: Add operating points for CPUs and enable cpufreq

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 237 +++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 4 deletions(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
prerequisite-message-id: 20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org
prerequisite-patch-id: 5a3c87e368d6bac968f16a0e56fcff5eaec60dea
prerequisite-patch-id: 8d6d1564a919eca361aef19af5dbe1cf3205198e

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

