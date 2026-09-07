Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D464398EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799107; cv=none; b=DLjZc8SMb74FR+Sfwtkp+wKhLt3zYctrsnKgFAEYLP+kTF1lUP/rOr99f2+TzS0PzqQklBSyU4b0SjUsm2lZxP42hUbNkyvkOVMMqdmbRsZNnMUtZwvvCjT4ZqgWLHMsw3J1jNRpGfmcRaHyuOmheM1LvhvvH0Tf/mk7MoMMlNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799107; c=relaxed/simple;
	bh=W5UwLSfWc9QDDceRAm4JfS+roNCeZvLDiHeD4TXui+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsPcuzRAxKk/VWso92rb2N9sRxQQv6D/C/RQWq+AKljKwBo0VhXVvVVwinQ17g+Jx7rk2WOcXcTqva6Mbjl4+9jTwLKyKuIo/6zDeTeBgmyFw3kXl+OpHweeHBlnLZdCrMmA2qJm0QPUFZr7pWXh0w64I8zuYKSlmFW4pArCS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFMGgLBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFMGgLBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81481F00A3A;
	Mon,  7 Sep 2026 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799102;
	bh=6pHk/hPGGOdk5BOs4bGnqFo2AynNXfu7gPSxw1mavzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FFMGgLBda19SYh+eB9lpR3Gr82pybmSpXdCjzi4fW+gISsVPxsXUxFFOfmz9/o/nh
	 qGgGeqkioOUKV1/VE32SZ7s1YaofJwzfMphhx5awWoawF2z4pAgMZ1yDEt4No7Q3Zy
	 Wn+cKHWYa5+0gNZE+FKL1Jkn8RidPOM59kK1L158qLYdPWxp+4FVNQBlCrzJ44HwPm
	 dnQ/a1Tyr5vIdTveEOMvn0RBdM6NTU474XsyjLP9T/Nzytn6DKkRW1XljcKlbEUKTW
	 tVmKLdCB5v0DdsPB0hixaj/hb2cu5VN+gzVIctIeBOc5oSFt3u/g62i0rwAsQPwziK
	 Hw6UVnj9JEQHw==
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
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 14/14] drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
Date: Mon,  7 Sep 2026 17:37:25 +0100
Message-ID: <20260907163726.17104-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

