Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978158;
	b=2Gq1FCy8551h8RxJn+p3pCxBZo4GRpIgOLqVzrhZb07i6ls/PFGZ12xJI+lZ6mZUpoa6
	 g0Bo5j03sx/wmOUzIkqZ/N/OKuFADlnfaV5QNUdzJExmH0Uw2dYO7QLiValnEtkUNkrHI
	 u+f1EJvx9WCZG5ve1SPBFXY2vtJ08/s5mr2gMQ60zacRBZYrq3vbayAp/IcGhH4ZsbUn3
	 d6OMpyYISGXUT4twEHKXYnpViry5/iFimeMooO/OY5+zX00Flib422RtVmAhtr0RHKT2x
	 p/+2JFoIkQOnqHaBOfkUAYPHBFw2c+9uaIgbhPx5l/mJg5egelu/DYitHA7irWWNtXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
	b=xruYzBWJeJdZU9qL0Fn4zwJYKWGyt1Xf63UCe1RogQWaBWDJq3OBkKb3fnOq/CVO/SFV
	 5ENu5J2YF5c+DVwse5Wr81QBs5GYdiczJPXN4YSs5UoKOiE13GmFryvUWOFGYynjnVaAc
	 X6qL60P3XaDAYS97XzEYwnKLFTGUAMZqUdF0hNqi1+zyxk2P3qf4KKI2AMtjHJQ8166yb
	 jJWax5vfWVsTH668yuShS8gFzWV1UxvMTeIBr9VimjLlZU6krr7v8oXW273T4fhl53s0S
	 JGabGImYJ8sAVBM2GsydUV08aHqYmP+4eXmUsBnEvgV0sGd4sS4i9aTtnauIgzhV4NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtuXwGMI;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3858A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtuXwGMI
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e795af1d4so653831eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978156; x=1794582956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
        b=HtuXwGMII7Ff/y9lxqmSW3NEenh3zpjTFOfl/kpBqcID4jSvAEtXO8r7JbZxHtkKGG
         d2USAykXnQVkgwIMi2NasvMQstE62fRXj5NUnJMLStN1t8qngEgdU+Nks8ljrfd937lu
         JmqxtAz05iMJ1h1QdMdyRqOqorYBKYTXsqr8/5vnHj+wZl9+nncw8/C9NCoMxNNIF52N
         bHSOtHvpIay4G0TAuRuHXwWzoFfzBIY2UP1wSEqpc2Q7KtyO3DXapAhjLRxJ6GE7O70a
         V/ZGczEcTojYFBSzvcW08zzQHNAPT4G15zlpLZ/zYyR7cvKdVjrOPoKt/xhGIbsVPc89
         r0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978156; x=1794582956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
        b=rc2z+cdqOB4yVLAs8ko9I7YmDX0bp4GZLjzyMzG/JOvQdmCN26gbattyxnDyC/iniu
         HX74Or8NuBeDFMcPT1Q9IP2KWyzLfNuQ7E/x69GGdYO9pyRu/JPvVwjOoAOvuAwVBrzb
         pMDr5Qc797SPRLFRu3W7Vh5AhF97/7xWOURSpc+Ai35rBSsIvzXooarH1qxjPDAgjtG8
         Oo9X+hyN/sBwpD+6vV3b7QW/Q/SMnaPOBY5ldDK9ZT6KOMLh1bku8kSbbNsqipnMNfS3
         9BqcKPNYU0Z2Q0OqqWDaUHNyxo0EnRnS2/LP0gAg/pVgUSqP6V3xceyuLD7puB2hi5u3
         wPIw==
X-Forwarded-Encrypted: i=1; AL+hErEPK2TeEh6zoccNtej2MoJ0pFD9do8u/KCFkgB/laZqQt8qzSWjso3i6AiYdXn6WCtjLyNCTGIjkIuoAJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PUjRotmlYXORtbXqNnAB8tb6eIwgDpy8u0X+AXw/8ewsZrh23
	RIixsNcD6xTUAM7GqpXqaOo/Ng8eNhIylOXtoziS/2W0UaNOojzp7g8j
X-Gm-Gg: AYBFou1ezSM7zIovb8CJpQhSJ12XAkaD7T2tRv1mcIHxyClTHwMoZO8/seMGm1uVXcC
	JlQY+To2ziKbslqUc5g3Tz6Qr4fRXGhIT5JIBxj7Iq9XFcyfH5OP70kWbqGbwP4tLml6qyIIXOU
	ogGYupVYHAdYOUWQ9UlfmfKdr2DLbGkXex3nEfHjulGGnOzmDBl9vLcto8t1eJexmrVPIFyWHMo
	F1ov8vbPPzFPo4fKnp4/2xZw66OJDs+aeL7dRyvkjBrrQpqtVhqrtmvCGEVBPSufgTj3/fW10k5
	yBSV5WswagalyRZRNPTE5I8n+xakld9CPbonXrN0Ud2kg9vstLl4VAUHchoGIuMyT/kDUdO+oBx
	5m3JEteMKfFh0SHIuwxckpNgkTW9FgTr+uyKJAsn8ANE0/j7GMFxww9JvHYRv29ve0gWFR/ZC2j
	sfgFofBn0GZcEHiEgwrW2H1AbcRB9GbaJpeyq8UYnII49s7eOVngYTQ3X/mU4KQTWlH0jxO9o4z
	ByNhvuzcziUp9Q3XTmp5VNWguiSlTPNcfC49Pcz4w88eUkyvDyxvxO+8EwtlzUIi4fT2OPje9tG
	pJtWvEP2ghXSv4CqUGcA4HVc6VLB+RLzky3uJTrvbea0gsLvd/L9RY2+kzdK+eYgy5vta36MPNU
	krBv+/h5cYn5uMdQ7k3FNu/dONxH2
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr7904176eec.27.1793978156008;
        Fri, 06 Nov 2026 07:15:56 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:15:55 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v14 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 06 Nov 2026 15:15:35 +0000
Message-Id: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABfv7WoC/2WMQQ6CMBAAv0L2bM1urSV48h+GA7QLbGIpaQ3RE
 P5u5epxJpPZIHMSznCrNki8SpY4FyBzqsBN3TyyEl8EaNSWCK3KodZXVNw49mR6pgtCiZfEg7y
 P06MtPEl+xfQ5xiuZn/57FK9QoW76oSHrHdb3MXTyPLsYoN33/QvfYV5knwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=8021;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=Jdcg0FIRiPPS8y53623ewxFjt0O6itT2iFkpqT7Eqaw=;
 b=rMtnrqhcGqJnkxmXaLwxkxrJtbpP4pPh7Og41dSYThdyhvHW8ZTfF9MgfbvnKVrMEtH238WUt
 JH4cy4nxB8BBYD0FSU4nVEM1hPcV3EStVdteSxJatCcWzV78WhWGkNe
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
thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
dt-bindings: thermal: lmh: Document SM7250 LMh
thermal/qcom/lmh: Add support for Qualcomm SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v14]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v13-0-355b65c6f764%40gmail.com

Link [v13]: https://lore.kernel.org/linux-arm-msm/20261104-master-v13-0-355b65c6f764@gmail.com/t/#t
Changelog [v13]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
[PATCH v13 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
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

---
Sreeshankar K (8):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
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
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261106-sm7250-e9ced14be130

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

