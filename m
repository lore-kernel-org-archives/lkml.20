Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7A4BEE4A;
	Sun, 13 Sep 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320655; cv=none; b=RAHH4uxfeVleZsrWED2gtNbZud0Ibd1cP7IZnu8Z07t/1ChXV8wf34XrV6YOFij0AKxM/NcH2i8Xn61cnXlcJcEtCA4c3pv2vS9qo2QAAiAbNNy+oNb1W0ENhFjJ7iUchtaKHaoKh+u1BAA+sSVSdkgHB1qTVPHf+COAGPktTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320655; c=relaxed/simple;
	bh=JCrB2UXI80SDTh9PAgR/JetaFVOnr/Mszdz9kdanAxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e381VICcKdRFn1rXhZUbnQtpDzCz/+GRIL+uzWqkGoslqNp2dVbeioNoNO6Lmu9uVtYyMy6+qqaWDVUMHGECOqGgjnntluG77QtvhbVC+wp0p4Jrlirg1+TNx4etSMU66ogUhZ5ICE94TtNWiJzir8I41l4R9bL7daYIYeuKAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7rFDWPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7rFDWPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B0E1F000FF;
	Sun, 13 Sep 2026 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789320654;
	bh=A6AUN94MAlxAX8IqgRMbzH0Yc/Vc1OmqedWomem2MAc=;
	h=From:To:Cc:Subject:Date;
	b=Q7rFDWPdyOS/hrSzM4jaWxQ3LIjInWyMLG1p4pPUXOyLvc0SOXJsVp2dv//dzxboA
	 p6g/c6zUV/vdXFPCeOwI3XXpJEj5tsRfOs8N/rZSDMH0VC85lu0cS+mnAhLJAg0TTo
	 Ho0kLH4c2g6wHimaaLt4KiAtzR2nCr5FQ1OQYi4eBeV9X7WahboiV81GESk35K3oMV
	 G/pWlPn3c7HcgjOFl+93M4cD2SRRKyHSVmahFQ8dLJZpjbMq4/eU1vmmTYFhlBDF4F
	 fsDvhSsKS9RhL1k/8DDkzfro0YlhDQBOGJ2gm4qL6CTWUfLTPFjy0h4d05uKGhQZeR
	 wbSoqhm8SvLkQ==
From: Sasha Levin <sashal@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sasha Levin <sashal@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QCOM
Date: Sun, 13 Sep 2026 13:30:49 -0400
Message-ID: <20260913173049.1168963-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_v6_v7_defconfig fails to link:

  arm-linux-gnueabihf-ld: drivers/firmware/qcom/qcom_scm.o: in function
  `qcom_scm_pas_init_image':
  qcom_scm.c:(.text+0xecc): undefined reference to `qcom_tzmem_alloc'
  qcom_scm.c:(.text+0x2b0): undefined reference to `qcom_tzmem_free'
  qcom_scm.c:(.text+0x1514): undefined reference to `qcom_tzmem_to_phys'

QCOM_SCM gained a "depends on ARCH_QCOM || COMPILE_TEST", but it is
selected from 20 places in the tree and several of those are reachable
without ARCH_QCOM. DRM_MSM is one of them, via SOC_IMX5, which is how
imx_v6_v7_defconfig ends up here:

  WARNING: unmet direct dependencies detected for QCOM_SCM
    Depends on [n]: ARCH_QCOM [=n] || COMPILE_TEST [=n]
    Selected by [y]:
    - DRM_MSM [=y] && ... && (ARCH_QCOM [=n] || SOC_IMX5 [=y] ||
      COMPILE_TEST [=n]) && ...

kconfig still honours the select and sets QCOM_SCM=y, but it does not
propagate the selects of a symbol whose own dependencies are unmet, so
QCOM_TZMEM is left unset, qcom_tzmem.c is not built, and the
unconditional qcom_tzmem_*() calls in qcom_scm.c and qcom_scm-smc.c
have nothing to bind to.

The point of the dependency was only to stop asking the user about
Qualcomm firmware interfaces when configuring a non-Qualcomm kernel.
Express that as a prompt condition, which is what the same commit
already did for QCOM_PAS: the symbol stays invisible, but it no longer
carries a dependency that silently drops its selects.

Found by KernelCI builds of the linus-next tree.

Fixes: 8fecd3194de3 ("firmware: QCOM interfaces should depend on ARCH_QCOM")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609120634.g0HMAp3g-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/qcom/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 691db0ded8e8c..b50e1309ced5f 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -26,8 +26,7 @@ config QCOM_PAS_TEE
 	  by the firmware TEE implementation as the backend.
 
 config QCOM_SCM
-	tristate "Qualcomm PAS SCM interface driver"
-	depends on ARCH_QCOM || COMPILE_TEST
+	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
 	select QCOM_TZMEM
 	default y if ARCH_QCOM
-- 
2.53.0

