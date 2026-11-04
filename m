Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810809;
	b=UFNnQU1Rg/0qmols+n+xSx62QUD68JWLM2eG93ZZYfoiGWEwtgCDqJK5FelBI4Nnq83k
	 LfKeMJhcX3HsWf/1X2gEwOLktBKDXKelDRn/WTKy/f7c7ykTAGybNQC2OCW5wI2G7v6ag
	 w3dSnvkiAucCQJWyfevZcbzCLGyMCoM0raDU4D3HkMyPY2hpwoSEBRS9xXO+ALwddlEX0
	 RelaNYDyOogM/AzA30ioyk7KKsG5rSaeP23Iz4lcXN1sUX/tSqelerrRfQYf7xnITNCs8
	 ZpISiIqY+fTBwRTCY661/bkq/ynhvJQsLqPrY/h5xI45qtE3R3AJGPzXQtow2ovn17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
	b=HBnb/CsEebz9Xnnt7fFPUGqcZn54Ptw0v+o5nstNzBfzNsBs631q9t0Hj1UjYm+sgQR+
	 H4s1kYEdvnDYiggVFKh03voM2C0SJOj6uDai/u/l7/HNGq5O+3XJw1z/zaEMO1KJpyH51
	 tSVShVRGngmNlKYQldZbBffWgGWkF2Yo7P76liR/1tre8yZCD+kkly+ZF7V5EjsUzrJoV
	 cON31aL69mja42lb61mI83oo0QIQh9sd8NWJjrdbPoS69IAlPZRcElr0ynOR1sFrsazDa
	 C+bykreIFdUEvI5h526suGNSegK3Ta+OjbFqw8JpNmldLqlBgobDLq0O50hbHPANsHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBP5At19;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFD606EEA5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EFD606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBP5At19
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35829219da8so2206090eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810808; x=1794415608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
        b=XBP5At19jSXF2Ymsq2H63T2GyP6w2zu5Qk8AUyQ6tXi2X8yWgIDxtBDzbozKNSkXBL
         Zz2ElqzcqYMJ+cHXeoeG2nAvzf/xr4U55S61+RO5zRTZCCDeJoAJiyXFtcB0FgQKa+hG
         5zQTz4hsXvYRDzKPDnDmDzAkYApNWFr8GpMkugeupeYlsEwm/WxpqShs0lmXYTi6sx4i
         vrwyLBwhacO2O1ZVv1owM8V/XoS9VgGOo8CdWEGBB0co0cQAV6cw/bZ8ONCaHZuTkkXl
         IFcH0IEI6dt27oV44JblEL+s0cI29qR7RJSzbvkg9r9byLEo58pzqcFI2Bt0nBS9m6z8
         2vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810808; x=1794415608;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
        b=gIr8GjQyN6FBuJjTuJ4xmIM+z3IvUlBc+h6FUu6EvN79v2z4QWoyRIskLmRbi5+xQq
         iqzVJOPU2SDUPP3uSiUBSiDNPET2ESJcIipHwO13J3Xi2jzXpa4DVQSQ25bQ91bxGtM6
         tzG5oU27yKjpeXnd5vXvFrTZbtpzI+t9WUPWpAPWQy3+zB/x7MLqdu2sv3cr9lCiBJ34
         qEQ3QQoAl1MuouejSxctFApjn3i0ysQ4WDrnASlGSbk3mzD+3Zkbk/llEur20SGRUa17
         ZNUNjmt5XA+ohYN6FVuWLzG1pOQAYSv2O1dPYmVPudv2nyMgHZRAWwP8xwsU+U5wpg8e
         Jc1Q==
X-Forwarded-Encrypted: i=1; AKwUvByCg6j+d+K7lCd2vs7Np1rqoAwTgKK4dj3JUA4i7Li9j9rN5Ws+nGoBIek5seHwvEpyY0CFqUl/HYm+cmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mDRNOfwWVzIfScD09aUrAJIYfMCEG3CU+t2h3vHZg7+DvuvIx
	c3535Bg8+dxf4QBpVLcaryXXa3Uwq1p+xDKaLDAJsLWYiwLL4F94pKBl
X-Gm-Gg: AYBFou0uUcwqWi687veqBS2XFufR9O5P5BMe5zzZIbqpFZ+b7S+wCHcp62/ttVWRTt3
	l4NQF9KHehByGynAO9X8hwwvUFnLDpnpp0SpjvjjfbkBH2IOlF1kVxeVJ6LCATEhEItOCit1PF3
	UFimsBasVBHVAcVah0HmqkrOkwwLJxtx8VE856tGuuZ9vPEUzw1zTCv9I64T4l3+TqFNhdYZb1C
	/YDyCcj57hMA6e9mLF3ZnOoo4hy2vaHrVfdbKzF7Rx8BGQMrDjqIoUapdcPSi5FJCrlxCtwJX7C
	fqndoDdka7yikrTTMea+hxjKZJ5n7iK6jGq5UkCPk8Xgzbvy5lO4hvCEmJXSq+tCzKv58S43eCK
	wzTsKhB4oTEg43UDhBsJSp4VCByfsrJAlygZRZefZy44vbzTFSDYgDEXmGvFBvVG2Wc2UTdYq/+
	dUOI46KmcldCWvLdwRSv7iVd+bNicdi2QT86uILkQalnk9LR7nd1ooTqFG1vFtDHXoTrIHPGTwB
	f/e2sHYz5H4EFZ6RKnV6g50PUPmypyu0H5oCi8opsPP7HnWXIFRH+4aDZbFe6FNA/7m7IR1u2qR
	npxOZAUNTR8gXSvaWiiUElNC0fMXOoKG3UPRXAN4Pwqdnvgh04fkWSYYk+gvR4Q1d6/ZPwmNqzR
	wQF0Im/k=
X-Received: by 2002:a05:7022:ea8a:b0:159:f192:5290 with SMTP id a92af1059eb24-1b24f4bbb6fmr26685c88.13.1793810807054;
        Wed, 04 Nov 2026 08:46:47 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:46:46 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v13 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 04 Nov 2026 16:46:32 +0000
Message-Id: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAGhh62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI11FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGJrq5icUlqUW6liYpyQZmpmnmxqYmSkDFBUWpaZkVYJOiY2trAa7
 qdUdZAAAA
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=7848;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=uPzqsnBTSTy5j8CzURIR/JxJhIk24GZEHjkBYenwv7M=;
 b=j47drGptocIm5nmgMwnduUwrjp77y/xGZ8CsPAov6BfHh5+B0PsqUlETbwVa6Ya2s/RXCGBbf
 jPokhHoLf5JBwfEi+3JY0rCVnzwcnHPo05/DmJ6VI/0WiDgrLjjet3b
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
thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
dt-bindings: thermal: lmh: Document SM7250 LMh
thermal/qcom/lmh: Add support for Qualcomm SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v13]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
[PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> Switch to match data mapping instead of hardcoded 4-4 cpu configuration.
[PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
> Add 6-2 cpu configuration LMh support for SM7250 SoC.
[PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
> Place the nodes in acesending order.

Link [v12]: https://lore.kernel.org/linux-arm-msm/20261104-master-v12-0-57fbe9eef978@gmail.com/T/#t
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
Sreeshankar K (8):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
      dt-bindings: thermal: lmh: Document SM7250 LMh
      thermal/qcom/lmh: Add support for Qualcomm SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  803 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 drivers/thermal/qcom/lmh.c                         |   84 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 10 files changed, 3332 insertions(+), 24 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-master-94dc065f7354

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

