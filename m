Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5503F322B6D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321949; cv=none; b=ZHeaTJfxLFVrqkV0uzLDMvV4vcJ/yLyu8vzglo/VJOlbs8Hb4YcIv+//07AwRxZF/oWyf6z/A9r3nfRkEzVpkFmOi/+YBUH0MowcUZD5XvUjhfTy9AfsF4lO8wQnPddHIiKZX1DrLMW6GbGMjcvol9APGnbzBFjWMsAmN1MX5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321949; c=relaxed/simple;
	bh=hiAPoWu2P1G0zUcYKifBIL2NV6eSXdce98xPjq6Oukc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P6MIq0qAkGYn9P2/Gj+i4OTiDat4EmLVJsmrGQl7fs32b3Bojo9Oj+N4icdf4I21aoc5ut8fknoi0zeIotWNjYMGGe9fFIIHttgG2jDmU+VZyxUAUCVEo7HxN58QBUJKvNAMb5JmWlEkfTwX5f9D+xbGxoQq6dr4gKHsIQN6DoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpUh1dPU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpUh1dPU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso3455875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321945; x=1788926745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D8ZXM9NvPNjn0CrmMZWIS02GT1iL8y1wk6OrYEe/DvQ=;
        b=dpUh1dPUF7Fv/oWQf18f8Bb2LAg3ufQUTm6M4MAsKz8IneKCG1f2GsnExX9C25G6jr
         TZ0mgAvXyjjNiPh4e/Q+dekAaUmeUjXmOgaxxjWSyfjay5CWjU1PdgvmebVdRW7YnWXD
         wvy/4sgRc+x+w44s3+4OlqojrnkUMUgpz7HL1eQBtINX8vwTLJByk1oIiCU620txvcmO
         WPKwbZZ3lK0oLnuVW6D2MPy8Q0/gar9dSsyD9YOsAGD9RBja0FpSiqgK/QwrEHvgtOxL
         vPy54cPCCjRNv8qKijO4hmD+tNrwanp742fArLriVrHBjx9hqxhK/zx99vOuATAnGtH5
         SXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321945; x=1788926745;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8ZXM9NvPNjn0CrmMZWIS02GT1iL8y1wk6OrYEe/DvQ=;
        b=NxFFrQ5mk807MtO8FlJIgLArdMcVz0EwWQ6J+lXdZHTO1kmkpO6OXdhKwGYU/aFzu0
         q20w5DOvso0DHH/cwrkwLom6QCNp4KIx22qcJt6vtObGcKs0NfGxeI9QQL4nkf9cp6mV
         DkSOPCzkizecXh45dRw5Oaty0ZOlUCPf2RnSjn91nrwAU3onWiq2/7MYDERtqdW0TW/1
         7aU3CWl8Zl/lqKoYnBuZJgg5E/4Xkrc/TaW6wwZdyvzkaKWE10y2VKP7HTm39ruHaFeJ
         eBnstgWJIqNdLNYPoc9ipLWQMSZGo0q8Ql2SnoLG2FSmWuCr1qlqjC3TxbBvZYK6uMvi
         FF+g==
X-Forwarded-Encrypted: i=1; AHgh+RrB7xcH8NZV5Krbr1AWJ0d4/IU58qjZTOnx85OOa4ITjpFHZHk1OgJZDD2cOSLKZ5TB8icN3z6NbCxwwBI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncq0ZIktu5AZh/+isaV5gV4MZBA8vJK+ZjFaVSJrptKALqPmY2
	9QiVYERqCSNZRcZkPG2qNLxoHgJQBz1ph5Lj0nekhMUAMRR1hNROnKUgwyN1puIrUdk=
X-Gm-Gg: AR+sD13xX4TrLrCQgNP7ZrcdjuRgSF4cSifLAqdLvmBL9WzodToCkYxSNPqh/q1u8wV
	CeS1yjBh2rSAkpfwwn/pMPR17N429iwN8t3LA3aEbejnJ1zY1Ac9uLK3tOZsf9PFVIALBF7TrOl
	B6kpVDiH/nrBfciS5vOMowvZrnBr1a4GezJc/v4OUZrQK5WSgwdUM2U0OV/TVHD6gJFmEObK58k
	JBJVODTyWmzwCZq68/LoeFX91ON0wvHLy/VNelsLeDwlznZvIIOPu9S9ikuCAvMreqZl89an6ng
	SGko7RlT4XurIqVPzQFnE0wbUo6ySM1x9cJDPnug2+VR1+kHuMvsDtHBa0SDwZ3bkd3kYi8J8HA
	RfHM9TLUXAP/1SvNWpIPu+ZaW/dzi3uXZxyXv23ixiQw9y1y2L8VV/luEt258n6+TyP1k2Ts9ad
	GZqUSRvbnONDxI4Dr0Mg37WNN+JWiHsryAecVM/hCJpCds9t0Vit6fz4oBhO3iY3l3VTlEDKKwy
	T9HsLMUQzUGaNZYq+NvRSxRKMZ6iAujtEfq1Kii9ZQY8Y0tiWrv
X-Received: by 2002:a05:600c:4e49:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49ce58388d2mr33540405e9.9.1788321945432;
        Tue, 01 Sep 2026 21:05:45 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v6 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 02 Sep 2026 05:05:37 +0100
Message-Id: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKgl2oC/4XRS27DIBAG4KtYrEs1vHFWvUfVBYYhQYofNbaVK
 MrdS5xKSRVZXQ6Ib5h/LiTjmDCTXXUhIy4pp74rhX6riD+4bo80hVITDlwD55ri6dz12Sqgfpg
 P/TQc5z3VdWS10YjRWVKeDiPGdFrZz69SH1Ke+vG8dlnY7fQfcGEUqGHBeAlaCMs/jqlzY//ej
 3tyExf+UCSwDYUXxStnNDiBXNUvinhSBGwooigxaK5YAO6YeVHkQ1FMbCiyKEpG9CpqJfTrROq
 haKg3FFUUKzn30UKQovmjXO/Rj/g9l0VO9/xJizm7dZG7atUtt786Hdp55Ydye0S6Lu0eG+jGo
 2ZgmqCfm5QWjctIfd+2adpVIlhhlJWCNwo1hlqBUQBOGYwNROGiZIgmlN9dfwCWzXgcbgIAAA=
 =
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it
(if we get our hands on corrected firmware).

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series wants Exynos PMU "fixes" series first to make Sashiko bot
happy. This "dependency" describes sequential order of commits.
Sashiko bot reported issues here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

The are basically no updates in this v6 series, just a rebase and
correct function call placements to be aligned with dependency "fixes" series:
https://lore.kernel.org/linux-samsung-soc/20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org/

This series was again re-validated and re-tested on Exynos850 WinLink
E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I tried to implement it in way to not break anything for gs101, thanks to
Peter for testing.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v6:
- rebase on top -next and "fixes" series, basically no other updates;
- Link to v5: https://lore.kernel.org/r/20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org

Changes in v5:
- updated the commit message of ("soc: samsung: exynos-pmu: add Exynos850
  CPU hotplug support");
- the if-check for the presense of pmu_data->cpu_pmu_{offline,online}
  callbacks in setup_cpuhp_and_cpuidle() was moved to before acquiring ref
  counter to intr_gen_node (the initial issue was reported by Sashiko);
- added pr_fmt to exynos850-pmu.c to have more meaningful error
  messages;
- added parentheses around the `cl` in `EXYNOS850_CLUSTER_CPU_OFFSET` macro
  (as suggested by Sashiko bot);
- custom syscon regmap with raw_spinlocks for pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- using topology_cluster_id() and topology_core_id() in exynos850-pmu.c
  (the initial issue was reported by Sashiko);
- removed smp_processor_id() usage fomr pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- added/resorted headers in exynos850-pmu.c;
- Link to v4: https://lore.kernel.org/r/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org

Changes in v4:
- remove blank line in file exynos850-pmu.c, commit (as suggested by Krzysztof);
- only update trailers/tags in commit messages;
- Link to v3: https://lore.kernel.org/r/20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org

Changes in v3:
- dropped two commits where samsung,pmu-intr-gen phandle is introduced and
  where google,pmu-intr-gen-syscon is deprecated (as suggested by Rob Herring);
- addtion to maintainers file was moved to separate entry, change commit message;
- commit message in "generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs"
  was updated since it no longer touches samsung,pmu-intr-gen-syscon;
- added missing asm/cputype.h header to exynos850-pmu.h
  (reported by Henrik Grimler);
- new commit "dt-bindings: soc: samsung: exynos-pmu: Require
  pmu-intr-gen-syscon for Exynos850";
- Link to v2: https://lore.kernel.org/r/20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org

Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (6):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: Require pmu-intr-gen-syscon for Exynos850
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add Exynos850 PMU entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   9 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 149 +++++++--------------
 drivers/soc/samsung/exynos-pmu.h                   |  34 +++++
 drivers/soc/samsung/exynos850-pmu.c                |  95 +++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  51 +++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 260 insertions(+), 110 deletions(-)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org
prerequisite-patch-id: c4a05942975a21b8e817edcd0891ce0da77ed677
prerequisite-patch-id: 694fae0b7b8ae73161e67f49599235c80c30c392

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

