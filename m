Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778383;
	b=xvzL2P/GXbOruXjM6iRsagMht+JTrrJWKBnx1Z5MuHzmJBY1NjRGFWna7s2/+/YlgVzo
	 du3NSDGV5C3xEVPALF8dSeZJuUZdnq6JwJObm66V3aXvElps8cwVR9wloOU0mIO9U34H3
	 Vz/qkxzJoDs3BGd7atdsOlW0YCcuPAkDH+D8AADseTVT9deeTWmSdPbbi4J64Yp+CzNLR
	 d3VigUys7Jq3UTo7Kz6NmpcA5Ado63UNlewWjhFWVXRtHV7OnpnvPRBy8o117SsWvC6LB
	 QHv65Vd9/ZG2i1bG+J9u/ILk5QyY6UEjt0kvHpLJWhycxqPyfcw+EYq8uH5lY8soloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
	b=BR+g5bvghu/SDAr3syWBm4sUeblhYp/h5+KZlU64lNgasniL/+DQr61ZGb9sqc0daogK
	 SmNgIP3qE3w9rjWYgrgmOvVEl1vETIEDjmQEW4sb9bpi5dX9cMILmASRxMYKFTkWOEg0c
	 vYmiUnbf9PF+bUKLLTP1UxjUHn9lbv6pZ3i5fUjraXN+7eE/xdbfOgWA4K0WLG6RUeafy
	 XYHJLWL9MW3DtCvfnAvu415+5bTnFL5DJhC4QierBEP6FJy7CeEm5fbTRrReT9Gy6ejCf
	 rBu5ksbbIJn+q5gLJJsYcLVDVnOnYNMRP1AcA/7PREdxNTl7A3jJDMn9Jcwx5pcTzbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKjeO91b;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B00606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B00606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKjeO91b
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so354358eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778382; x=1794383182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=vKjeO91brMOhWH0G2bNublIAkYOXoviG+bCJEIC1QcoQfAr0YJiWlJUDHh/Bsqyiz5
         is3H3yjYhPJBC5EQyCkOAuFcAE7s6424sZ8ULsL8skVXJZseeCPHthGwQwgoSPqkWV+z
         Tg5TNfcLkwT+45J2Zr1AaHpJfkxQ18PGrdHjFx/Xfk0tO4PVCdBUco7wbNxqIy4m4LLp
         0gzV88PXEwtPkBXMxwMXjVjiGBI4hxe0YB0/g35KG6cfRZGg0owGm/GFja6pxpQQQfiw
         IOYxMyhPtVjXaZHeEDe917jgUGVeZddAyPdHCT9RsGvCb/4g/rD0jvArJGfK0WE0W3rD
         VSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778382; x=1794383182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=vKobaLbACglwsBOV2lCG5ZtFCMF2kxwzJefEBuq8HjBIz6KRor8qfu85kr73Y8/j3O
         0D8EcC8n67Gf1oZ/HjNBYODaDqV8nrYe2n814Rqrn3Za4qBYdCMD+yIxyic8lnpsSpO8
         7CrPQUNzYR/L/voHIVgaGpbKDLJvkTXKgRTUkYlaMchOafkxQ2aZ8mKBlQJ1JYkSzIEC
         wYs8TiliBoib2Ms8VBANK02xkUO8I+XmTytagFJTsNLSevLprmau1DehJ1Pq81vi6UvE
         P+FQ5KPb/jpXcVqrbZpJIqbAJjaqHlwCfvZb86vrb2ysszZEd5VGZW5+j1KV9J9ZUhFI
         mpcA==
X-Forwarded-Encrypted: i=1; AKwUvBwRWTldXhjym0/LXCPfIM9nwkmrizLhttyJlb3tAxcezt2JpGxfVykBDjqR1+YXSTw4QRsB9YHyR1oTtrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w7Dvt2WK/IvSdqDidd5PRE14l1RktqlZoTk9UCRIQhEqpi2YB
	AGWPjuIj5bz1zJFLvt2QHbbU26BbMC9zLw5AAL1Yow9Mywm0FkUroBAGl8dcGw==
X-Gm-Gg: AYBFou2Y7or9RGkd+skuFfgAnpQX8Y5ru/YNwB9N9Bof8iXYJMn4Mc4lqhk+SOI/fPi
	pNff9ONk3NF5AftxeuEx4ua1ZsWmA5s3/AJYFCeewtNhZ87kp72IDxHxJ203SJRIhebFIdvPEIQ
	kBichWigNYrH1uH/sYpbfuisyh1A01SUpY/2GLQpOeiOivOwPhXdwzAkTQVV7//9zXzJ7ziXQAo
	8JD4rkPX4gr8gLsoKUDCvR6ISdWF87rdnj2x4bM1ExuTQu1uoNfdyIL68RTh8giBPwyH+6w1J0C
	jA/XWOeiITiD+Q9mqnWyqVk4oGFKRom0tSlICXfu17dTjHe3rOWgTU2SxW2KYjxmttGzY1ef+xi
	bcn9WPsMsHOdPtZgQxQ8wTeMqrSW7GbaGEs41oZES5v1twlGQDrSNWmByYIOyihwycVFBwHAR7P
	z3ZGBcyhQABtjn5Zi2GnfAfCITzgxxQVe2hc4wF584Yom5Lf8kKlHDdam5gqwTeI3vuYF0+37cJ
	J04EEJBCvp1fudoD6l/NMf4WN7quLHtdhD9fOJy80CqcqS74aiu/C64ZiiEJzSyHNQySAlmq1Ku
	dFRmaHnC0xd7eG8fiuJAJKRFR29bCP6p5SK3cEH74Lk066HW3vkqgOdS+/3hPG3iM6N4l1M9lmy
	60KQyPA==
X-Received: by 2002:a05:7301:23a6:b0:36c:a39e:fcf9 with SMTP id 5a478bee46e88-36ca39f00ecmr2531535eec.8.1793778381456;
        Tue, 03 Nov 2026 23:46:21 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:20 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v12 0/6] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 04 Nov 2026 07:46:03 +0000
Message-Id: <20261104-master-v12-0-57fbe9eef978@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALzi6moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI10FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGJrq5icUlqUW6pskpRimWyUkGickWSkDFBUWpaZkVYJOiY2trAWA
 Gv35ZAAAA
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=6866;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=R1dhX5JbUMHvKu/MupaHu+YfQPZ+VXmXHq+cGAjavtA=;
 b=wTe5JCMSJDIBrfir08X+CflO5XCH+38PYn1/dbIo7kqXlXBKhfzYT0p6fZA4vBcS1d+x8ZviW
 ap932+ga3SoCl4nQUY2POWiiy16YDK+rlegZDJZCvMnr5sSYRVQnA23
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

>-----------------------------------------------------------------------------<
Merged patches:
dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
soc: qcom: socinfo: Add SM7250 SoC ID
dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
clk: qcom: rpmh: Add SM7250 rpmh clocks
dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
pmdomain: qcom: rpmhpd: Add RPMh power domains
dt-bindings: arm: cpus: Document Kryo 475 CPUs
dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

Pending patches:
dt-bindings: clock: Add SM7250 global clock controller
clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
dt-bindings: thermal: lmh: Document SM7250 LMh
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v12]:
[PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
schema of SM7250 matches with SM8250 for clock-controller node.
[PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> Add LMh compatible.
[PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> Remove cluster wise sorting of cpus.
> Add LMh node.

Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
Changelog [v11]:
[PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> Drop hw_ctl clock branches
> Populate default values for GDSCs

Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
Changelog [v10]:
[PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> Update .halt_check and .ops are per the review.

Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
Changelog [v9]:
[PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
[PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure

Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
Changelog [v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
Changelog [v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
  to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
Changelog [v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
Changelog [v3]:
[PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Updated the way of registering critical clocks.
> Made some more clock critical.
        GCC_VIDEO_XO_CLK
        GCC_CAMERA_XO_CLK
        GCC_DISP_XO_CLK
        GCC_NPU_CFG_AHB_CLK
        GCC_CPUSS_AHB_CLK
        GCC_NPU_BWMON_CFG_AHB_CLK
  These clocks are flagged as critical in gcc-lito.c

Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
Changelog [v2]:
[PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
[PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added SM7250 cpufreq hardware

Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
Sreeshankar K (6):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      dt-bindings: thermal: lmh: Document SM7250 LMh
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    4 +-
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  795 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 9 files changed, 3262 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-master-5cd2d9cb0ac8

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

