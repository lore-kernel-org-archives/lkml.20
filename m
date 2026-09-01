Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515536A364
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245066; cv=none; b=fZE6qOkxL6PRx8zf+Sy6ASyaGod7ZthsaPHfrmYkwGBBXd5ZgBkmhQXYdZ36H/ysRtXR+/OsX3OyvEEpciDmQguGdrvIJkqB/umUcswniFv61gQssku1O+lWAeLRynFjldUUXkZwoA1Axza6XFFb0T5rWkvrgF18Z7PNKvyJ81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245066; c=relaxed/simple;
	bh=hvl+0bAgRYzWOF9f6YHJQyy9sBDMhoZs6nvEmWk5JUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tR6JmGLB2/OEj5I0kADDPJmZ5LvHR/XwdR70taxRhMbwPQsUX1paLHIVmFjFbu9Uu0cd5okej/KqsmlmXNwhz6HXY2xJE38szL3E0wvMdtIzQjvrntBqroGpYRx7L77eHkr126MtjbAMEDo6CByJflu8JfQQBqUgdM9QMciA6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qigs73FM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qigs73FM"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3712181a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245064; x=1788849864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MxhfVXHrtYBbqB+Lo9AOFdGcFZRIzv055R5MqEdCuA4=;
        b=Qigs73FMIgfgJvrzC/ZZ8ZM1kxLXzWnYYjP1Okwlg1Q4fQ+qZ9Qp4S4/aL5Xmci34z
         qHqOrGCigrBDrbZbheqzQkDVuidEVdHu4umOOvKH6zbiBDvAOMOdEWbC4j+aKc+iGGM6
         B2HuvzNqjcorJKExtZicyH3dcH1s+vM4oY4dsWLyKgmXJ+IFBXJRI8sFlDR0v3IHG8h3
         ei3ZWcSfqgjNYtme1oRbZNhkEpv2h+GatC8TjHU+03aJicE+sqkiBZ+kf1iL97c/yx4s
         niZopJuISXAZm2WaufKgfW+aU+1QoQ3moP65vpUjVimAxHtahRXQnlGNchPWCm26MSl7
         6zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245064; x=1788849864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxhfVXHrtYBbqB+Lo9AOFdGcFZRIzv055R5MqEdCuA4=;
        b=hYLMjbnchZcW0P2vuHdo+HmFGQOCmuZnMK4qHKzVdLRT3vt2MGDUtAoiche/CpZ1k8
         TY1RSlvzHDRsSznD8SY/Hujiy+ust73xKSqMkWuxYm/bMLApho2C1necKzOs6bjmH1AF
         CwXSAepF+hNHABPD0hLmI8lZ/vW/15ONTjvqHYIwy4W4+frttk9CdeQU8P5h6wSzHuZt
         aPKhgLPyIkVQ4kRRXYqAK02xPx283TDYnHHRpr/5TaeHk/5KBVkMu9CFAMYMsWhYZGaD
         OCwE2F9UnMhE72SJ/Mwo5i2ADUslRuomWlRmfb1fhRplNh0wGC8JGeMGCXdWuNrUlBCj
         pNMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCWB7iDXSXyhUeRH9KkQA7kowMiYKVKEV8b5YUdn5NiydvtL79l080euz17sjwyvx8SxhQLfDMg51fuuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++luppMwVDrob37PFAJejUp6LLduJajZZH0BBbPfKdvi/CITOfeJ
	bNCDX3DV4pIvMAcAKcM0hAqB9zQFz7avDx7YYcayzxiaHxRuvU77g4qx
X-Gm-Gg: AR+sD13iMmqUOP0CKAe6UhTba/tjc/P3ITtkRepMuezov5YEcOfwAOnrLm1wTeVKZ1S
	NnyW6/S2tmL8uUk5j3Q7HOwfg2/zb3CG/G/BckdSiIEJCE9y7rn/wPG2Hy4MzHTFkl6zcpj3jHN
	wj/eeNDiyHQM5pm/BbSECZe6kWaN0UnC/66fXn/gQmE9RqdAnw9AkMvxbOos8tMhxL/H/xKMdPS
	EDphZ8X4IGgfw80kwjHU0uwtPlQb/8P8W4jurb34bwtc2njkMiFFTDHrXdh7mCvqE5WhoJ9qURN
	Kr4RdLhfRIRQ0Uht/HlyM+vbxXbMkXV/He9ElirZiFmcapkIO13G/6VmmxYRh/fYDtXwuU96N8P
	E2t9oYWoTzZqXZmrppY9J+GPDmp47Azz8084xwBs0Fs3uXWGVXySLXW7Al/MYgL6Ay2NCxHcidD
	FdBxaCNc9VuJ2doY5hI8eBCsWvkOkiJzp8H/Ft6J6hhCPf+ImzeXcm7pvWGIMUhyrFIR3rwAKxs
	XIlTpQXbjUi
X-Received: by 2002:a05:6a21:a34c:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d7afe3b13amr10060658637.18.1788245063507;
        Mon, 31 Aug 2026 23:44:23 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:22 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v7 00/12] Add initial support for Qualcomm SM7250 SoC
Date: Tue,  1 Sep 2026 06:43:45 +0000
Message-ID: <20260901064357.20055-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t

Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
Added missing (struct device *dev) in gcc_sm7250_clk_regs_configure
Fixes: https://lore.kernel.org/linux-arm-msm/apYNXZ9TJEC6rVVf@baldur
> Drop applied patches
1) [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs (commit: 1c8fe8863780705aba77893fade65f728e82b67a)
Link: https://lore.kernel.org/linux-arm-msm/178822856275.1835959.3848131517961346933.b4-ty@kernel.org

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
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
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

Sreeshankar K (12):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2275 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 15 files changed, 3272 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

