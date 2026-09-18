Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9A502559
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743190; cv=none; b=YaHwWhSf9P2K95qkVYuBKXr/ewveh6a2C2rHifawqBVtBkfeCbSLDWA5N6hxNYLeBS4WXKqCDPQ4FrowKGvO0x7pGVcQh/0YBPuxnvtFx37Rhk7Wn4CoswruNxTVE0Py+dnB5l/7JV9Z5F/puU6/dOUzU7BoB9+/Ln2bq/3JmPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743190; c=relaxed/simple;
	bh=be/D3i8Rt3Gxt3jkMPf4MKSN6HuuCSR7lBEp2DloW7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUlTP2Od6aG32h/LaKBj8wKFVk+JHYVf5QG1VwcnbxxIIxyT4Xnfodg7fEH9QfoC+y7dF198KexgUhFX+sZ/0AFer8XKuQhdi9ABk8r/i0Gt9b9+ZKzRi5QHcNlRhpUBXBzmnDqfN6FziOPyTmtm/2WkyYlpAERclPP6Yy8tmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvLj/88A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvLj/88A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1478C1F000FF;
	Fri, 18 Sep 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743185;
	bh=4ojc02aemqoLwNxvvZsv+b8G2yi1V858/hEEaqJeGoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WvLj/88Ac8AnU5yMp8ElZgGdcWNko+AR8s1xotTG/QtyLGZ8hdyhjlM/gI6Qax3W6
	 QiH8qK79Q4fJPl6a9WD+2h079wY9BFb23wxcwm11+pY2JSCqmUCOSadQXY5x+6/6Kq
	 w5Fc3/HwGp8yuvQojwzsXytalEhBmpPC3wtakK/4szdOMI5/CGmf20XXGwyO4ceD+v
	 TYtxh44DL4nQBC1W2QsThi/EJpGRGP9T5FmNn/cfJp8b4xsnT/CFxkH/IEenf2F0YU
	 wSMKB0JtXQpcqibfQK9MCh6tN1uvreg5AggNolcfXMkdy3HdApn4LX+JVDrWCqGXCi
	 2+6Dw/+Aun/zw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v3 13/13] drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
Date: Fri, 18 Sep 2026 15:52:15 +0100
Message-ID: <20260918145217.1669-14-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that arm64 no longer supports a big-endian kernel, simplify some
driver Kconfig entries so that the dependency on a little-endian kernel
no longer needs to be called out explicitly.

Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/hv/Kconfig                     | 3 +--
 drivers/misc/vmw_vmci/Kconfig          | 2 +-
 drivers/net/ethernet/microsoft/Kconfig | 2 +-
 drivers/soc/tegra/Kconfig              | 5 -----
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index aa11bcefddf2..36445c2619ed 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -4,8 +4,7 @@ menu "Microsoft Hyper-V guest support"
 
 config HYPERV
 	bool "Microsoft Hyper-V core hypervisor support"
-	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
-		|| (ARM64 && !CPU_BIG_ENDIAN)
+	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) || ARM64
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
diff --git a/drivers/misc/vmw_vmci/Kconfig b/drivers/misc/vmw_vmci/Kconfig
index b6d4d7fd686a..ca03cbfdab1e 100644
--- a/drivers/misc/vmw_vmci/Kconfig
+++ b/drivers/misc/vmw_vmci/Kconfig
@@ -5,7 +5,7 @@
 
 config VMWARE_VMCI
 	tristate "VMware VMCI Driver"
-	depends on (X86 || ARM64) && !CPU_BIG_ENDIAN && PCI
+	depends on (X86 || ARM64) && PCI
 	help
 	  This is VMware's Virtual Machine Communication Interface.  It enables
 	  high-speed communication between host and guest in a virtual
diff --git a/drivers/net/ethernet/microsoft/Kconfig b/drivers/net/ethernet/microsoft/Kconfig
index e9be18c92ca5..c4ad3d85875a 100644
--- a/drivers/net/ethernet/microsoft/Kconfig
+++ b/drivers/net/ethernet/microsoft/Kconfig
@@ -18,7 +18,7 @@ if NET_VENDOR_MICROSOFT
 config MICROSOFT_MANA
 	tristate "Microsoft Azure Network Adapter (MANA) support"
 	depends on PCI_MSI
-	depends on X86_64 || (ARM64 && !CPU_BIG_ENDIAN)
+	depends on X86_64 || ARM64
 	depends on PCI_HYPERV
 	select AUXILIARY_BUS
 	select DIMLIB
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b6fdb9ad1ea..318e7b604342 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -102,7 +102,6 @@ config ARCH_TEGRA_210_SOC
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select PINCTRL_TEGRA186
 	select MAILBOX
 	select SOC_TEGRA_PMC
@@ -117,7 +116,6 @@ config ARCH_TEGRA_186_SOC
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
 	select SOC_TEGRA_PMC
@@ -127,7 +125,6 @@ config ARCH_TEGRA_194_SOC
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
 	select SOC_TEGRA_PMC
@@ -137,7 +134,6 @@ config ARCH_TEGRA_234_SOC
 config ARCH_TEGRA_238_SOC
 	bool "NVIDIA Tegra238 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
@@ -152,7 +148,6 @@ config ARCH_TEGRA_241_SOC
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
-- 
2.55.0.1082.g2b9226bbc0-goog

