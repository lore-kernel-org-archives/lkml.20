Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51E7301709
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675494; cv=none; b=EFplXrPtCHq1lfnyj26PxF/2qAmRK89FdMnCJEWMm23D+lZlssfUp4rzSH5Lu9u4HC0pSrKYZWzumW47Lx1AJ70gl2Py+K218px/lbIhzXToLJb3Y+F5dyxM2atHJGhK6uJKr0Ch7C2+1+6gknNftl7eXtOK+QVtD2neZefFWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675494; c=relaxed/simple;
	bh=xJ/1fdf2VHcAZoRO8dB70h+8smMnxhwjaZxtxBrqS3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFPpOczkZ/fsU9hdRnDqlGAMC3ibnZFWu80pJ7kPtPH7LN5IDzj83ysirIS4RiuuxGMd4U1dpH8LsUcwsnU1yTrpcYhR78MOKijqFe6oCsmBSKl8r+UbPMvRpqSUH+Kgg+zihQKkdCM+4ZgNWNmoIB4fZ0dBFp2zgtI8ELG9WGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOlv7tS2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOlv7tS2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2621099a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675492; x=1789280292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=mOlv7tS2XWt/kbXh5VhCrrMHo6JgR+ck5xw3sp52fmgmhltGg3VahV+VZyR9HMKVmO
         QQTmBgWCfFLkKCx7QuBhYWHMVO1yE2EqD8aLOLRgiFEABeV5vVUn/Drn/0AvhspxYuii
         Vxua7AHD/G8JR9YwSPdm4AGdFxO7CS4SuQ8nV8Zp3Zq9uWK9P43qHNPc77vdpyW5Ef6K
         DnTJgo1ScEMvHycfTy1fB1C6whkzVy+Tb31OPeSYseF7cp3G8czQG/APEKSll5BMJ7Cw
         Wcozx4+jbOqNUaLpN2f0g36VrmuGd1NZkJ8bhCSbvS+JgoZAhiRTNZkx+qYMrHLYhw8b
         rEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675492; x=1789280292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=Tp0oqf5szhaGjaAtashBG0VDr4VHUgfd5KebIPI1MVvC+tGnXRRMwMI4BvcWtQeQvl
         iGk0rVuC03PZaYAVFofIe6hWUCrcetzA5MF78SVE4P+lUa21kLanBTUk/8jjktCTsJOR
         mLYQcUIVDEE0Il/cR+KyrGgdXYovVMczqHy3O2HIDRE28CpMAD0MW/PKKMHrcglvQkpS
         mmZ3cHTSo95ha3/R+I9AdONM34BVjzsLhrXn8BDr8+P44ZIxXlX23LJxaDfbnzyj4mjG
         Y9IzZ6MQ+V/A2aiYD9STe8gKIG/NGzRCq3wD0zN+7HRe/ctQrivEdtGRgrYuGdXgVmfZ
         Z9fg==
X-Forwarded-Encrypted: i=1; AKwUvByOXMER3bVel0TkybhQQ/q2HMDnXistCck7t1M7TmwRDniWRIM8XKViqn2Ci220c4mCi0bjaFjbIEUwloE=@vger.kernel.org
X-Gm-Message-State: AFuF++m71gMZgML0x/vwZbumVrZt7dYewF/A1xu9KjVvvxj7azkK9pCt
	K0UN9MHj0TMcayu3dVLO+Qxxx/VOo5bEAGZRmuDeecKi4HPwz7b6qxfh
X-Gm-Gg: AYBFou3mg7ARDsFdD8BJSMvZJjV/4h6IDFu+vAzDS0RBBxb1uqhaN+RQq1X7MkF3jnd
	P/ka8+ghmNb+ZM1FWmd61y9MXbYLMJk3KZdSqQ1GMUStBvsWEG24heAerNealRBU+mOARQ6lmmt
	rdlep2QdFsroSzMai0VE94ckQZdm+UoDXT7kCOw9+z8OK7obS1f+U0bz2p1JK/ZJ4J300+QzDMM
	OK6O362cuGFw+k0pCEHBXm6IHDR7gEXXLHHlzXyeHq60U+xFPPaRgOqJCPQXpyI6DVbYrL23Q1q
	8wK1zOrp1voTd/RG/NXLQytZoW2cwMfbJ5CtUuIelWFg11j12fNuHYDvRpCHO+tGRc6wCp1iOLK
	jDJ1bgU/+Rp+B1Y4/CZAow8ulVpvKeLw2wqx0DeNG0rsN7CON1U3569zWWijRU/8LzMjLr8nKfw
	wXdLXBD9bbaCDUmzeDF2kbOhM2ufHBYckFA2lQ8qxPDs3kTkGgYbexlYNF9/DA
X-Received: by 2002:a05:6a20:9c11:b0:3d2:3e73:29eb with SMTP id adf61e73a8af0-3da39bb596fmr24951780637.1.1788675491987;
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:49 +0530
Message-ID: <20260906061755.5103-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a cleanup for subsystems under power management
(linux-pm) that converts several instances of error pointer printing
to use the `%pe` format specifier instead of explicitly casting with
`PTR_ERR()`.

Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
print error codes returned as pointers. By switching to `%pe` and passing
the error pointer directly, the logging subsystem will automatically
print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
`CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
numeric value otherwise.

This change significantly improves the readability of kernel logs and
dmesg traces during debugging, without introducing any functional changes
or side effects.

The cleanup has been applied across the following PM subsystems/drivers:
* powercap (intel_rapl_msr, intel_rapl_tpmi)
* thermal (core, cpufreq_cooling, devfreq_cooling, mmio, etc.)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc, mtk-cci)
* power/supply (various battery and charger drivers)


Sumeet Pawnikar (5):
  powercap: intel_rapl: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  power: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c          | 4 ++--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c         | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 drivers/thermal/thermal_mmio.c             | 3 +--
 drivers/thermal/uniphier_thermal.c         | 3 +--
 20 files changed, 35 insertions(+), 39 deletions(-)

-- 
2.43.0

