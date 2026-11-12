Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475613;
	b=PQ8JgnjkGL6QugYZ2r6WP6lpaPWZotgv4BAPzrHiqP6wSIjHGXtrWrkgQuFpiZ8T8C+l
	 X6IYU4NrD4y06LSehbVqu9+BagTy7AYImdDbRMuFJrUEElSaj8rYe0WH0syGodMlSIU/S
	 zWx1+Vc0Jpr7h2zS50N/t62ZZKiCUkWojIutxsxIdk1vwModxV+3PFlT+gzC35eS/6bzP
	 uX+0rg/otABZMywJDvSZrwgdo880boBXMbyQ57KA8Jy+eJQQ3QzRAfZ2XDgsoq0baVH5O
	 nAvSe/RXNeGs1wO2WXj1URTo9xOmySyWT0bK4W3pQtOnNwDb5xLI+ZchSYCJv3/CtEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475613;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+saM5MiugNdE2CGErf98jdTo3Oag6Z1ShvKqaDM+sxA=;
	b=THWf0EgVYkHbll8Mce9EfSIM48fADD/ao5cjvWEKWKIl3FPvuZE2R3PqhrArciUifJad
	 c0xyqzLmS1VenZPGreIcmQ97d5SEqHu2LZxvZxhUQnCandOuWNqlYhoxWHbyuNmFdIh6V
	 j68n93G0cQkCqejZfC4FPurenncFmP/xgosytlWXbtrsYbP5Pu187KKOI9p5kMafu5NEv
	 mfqiiIQrllu6s1eAmCNPGQ7eoGq84tGZdQVmgHC2Ga7qCBn4I5A4m5lq7XMc+qgKJ70UC
	 omIwoAeJ81CvHLrLWilq2siUO4CzxNr2W6LGlRPLWpLoWjgT6GFrOfu9EttVCbpCzbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXedrKnp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8E606A31C;
	Thu, 12 Nov 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXedrKnp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502641F00A0C;
	Thu, 12 Nov 2026 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475612;
	bh=+saM5MiugNdE2CGErf98jdTo3Oag6Z1ShvKqaDM+sxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YXedrKnpsd1GEYAgjnEwgQxTW4I/rR0GlaEICzeJCtUTeMT74+eAe0y40snTeCDZc
	 V2Z2IUWYxamT5sT1Nr07q2llqSe4nD3gaCDA1CV/YzzBI3TD+r8GSPQxkhDIOXy838
	 x9n0Z4ifJ4ZQ7WZ048ykThnq1jgatZ9chfbe/Z3Try2k1m1ZRI+ULlcObHj1CF8fjC
	 +WG4dxFgb/+/m1yhxQ6ChPStOPQCbaSZpKW9VnTdtIdGdVTUXmDrGnyQR0gtlDWipf
	 BaQtR4b83EM9IiRFcfylKuEzRstWOJ3cnJQWqa7cYSoaMMHCiY4YIrQCnvKru1982i
	 p8crz8BR3KUfA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath12k: add GENERIC_MSI_IRQ dependency
Date: Thu, 12 Nov 2026 10:26:31 +0100
Message-ID: <20261112092642.1144415-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112092642.1144415-1-arnd@kernel.org>
References: <20261112092642.1144415-1-arnd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The platform_device_msi_init_and_alloc_irqs() interface can be disabled
based on the configuration, though it is usually enabled. Without it,
the driver now fails to build:

drivers/net/wireless/ath/ath12k/pcic.c: In function 'ath12k_pcic_config_irq':
drivers/net/wireless/ath/ath12k/pcic.c:387:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Wimplicit-function-declaration]
  387 |         ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/pcic.c:424:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Wimplicit-function-declaration]
  424 |         platform_device_msi_free_irqs_all(&pdev->dev);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a Kconfig dependency for it.

Fixes: b9bc9ef941bd ("wifi: ath12k: Add platform MSI support for CE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Note that this patch applied cleanly on top of another Kconfig
fix that I sent a while ago that is also still required,
see
https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
---
 drivers/net/wireless/ath/ath12k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 4e8a301f2081..ed93ff36fbe2 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -18,6 +18,7 @@ config ATH12K_AHB
 	bool "Qualcomm ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
 	depends on QCOM_RPROC_COMMON=y || ATH12K=m
+	depends on GENERIC_MSI_IRQ
 	select QCOM_MDT_LOADER
 	select QCOM_PAS
 	help
-- 
2.53.0

