Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896515;
	b=RrnCt0kAJqiNV+M4OpqEpLePOBgPoeD973QNeKl0rmCVsG7u/EuERSkgtgTc9sRXyaTP
	 kIBop9/4O7nbIebW2gxwp1MDqCQiLkggUQf2hPJv31y7aQSOwLPqGSehHM33iZWewc6dF
	 N4wQ67AxN7NLd+SQKhXsRXX8KOifUh3kJpRbLpcenUImke4Z2Rqn69wRd+bcSAI+b/rCG
	 E9kR1lQhAuiAJLNLlc/CAAIN/oOKEgcmp39QUdLrxfQlpwaL3YV42N8ksWH2bgnxeDyW+
	 37mXvFt0PaQrcnfJ50eUc/Sx5vF5q9Rv+Nil2t/F6sxTGHUqod9e2XlW+Sed8rIWQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896515;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5KJ6eV8CwRFrce/nsRU3xf8dfm2BrAfBMI23/cbPj44=;
	b=CyDMMlk0NRrsqJtVcCRMoCtnSCJO1ldo7rIqFIHWPbTMRzAXcjOBHM4hxtJoklA5tgDd
	 6J11HaydGMxKpZtR/uG36ANonnWNpBw1WbmZOCpGicLESwrd2EKZ6X3jsdZP1nkqlm2lV
	 Q6K0IuRuujsNt/oDyfIQsumLsW2Fs200ItxlJ7AUL3FtTxW6j8mf4TblY/EMs8zc2XqNy
	 +D5q5+JmLb4pDgouZrMnvJ1sb+4UGGZ0bXP0dn/5C26zJAZeDHSAtOPnycmhq6pDkJ6Wo
	 yqRVXpUBp9ZFB4bH4nqAQw/+j4xNVZ/OyV18W8KCdhElv+WqtUPXOoigU4aIUl/gfeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCN2Kp7m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BC60726F8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCN2Kp7m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EA21F000C1;
	Thu,  5 Nov 2026 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896514;
	bh=5KJ6eV8CwRFrce/nsRU3xf8dfm2BrAfBMI23/cbPj44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RCN2Kp7mimblpNJ22ntY3FYW87qgecqG+csfpDP6Nf/G+gBipiZnb7ma2xn0PsmTn
	 CTynqIYhn4+Zk78mpZ2UUqQGqqCdsm7aju90C5llkt9M/BZSxFp+c0rU6O2YjtSgWz
	 kHGbqO4bKa+PFj4b4oLqYiBa/iXy1v1WLhOK9fmeMbRlmfH77u3zAA+cJDMoKXiQjg
	 BZORfCdqjdoqR1pwWzP+Qlo+1POlOm8R7XUTRxhfapBODLCWdfHPCsvUifatx6wca7
	 S67fGkbtbVOX5HxRgiqMTXAZpKRQzLkkJoCASk6mO1zXLZNtBZyUSwlIpMkkldWXY4
	 ys5Ou7ld5iYQw==
From: Arnd Bergmann <arnd@kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH 5/7] x86: remove dependencies on CONFIG_M... CPU options
Date: Thu,  5 Nov 2026 17:34:36 +0100
Message-ID: <20261105163440.2381661-6-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163440.2381661-1-arnd@kernel.org>
References: <20261105163440.2381661-1-arnd@kernel.org>
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

CPU specific features should generally be controlled by
CPU_SUP_xxx options rather than CONFIG_Mxxx, to allow
generic kernels to be built that work with all of them.

Replace the few options that don't follow this scheme
with checks on either CPU_SUP_xxx or X86_PAE by itself.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/tsc.c    | 2 +-
 arch/x86/xen/Kconfig     | 1 -
 drivers/misc/mei/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 02269dcbde1f..d8b79d1151da 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1212,7 +1212,7 @@ static void __init tsc_disable_clocksource_watchdog(void)
 
 static void __init check_system_tsc_reliable(void)
 {
-#if defined(CONFIG_MGEODEGX1) || defined(CONFIG_MGEODE_LX) || defined(CONFIG_X86_GENERIC)
+#if defined(CONFIG_CPU_SUP_CYRIX_32)
 	if (is_geode_lx()) {
 		/* RTSC counts during suspend */
 #define RTSC_SUSP 0x100
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 609e79942fcb..0655ddd6fd39 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -10,7 +10,6 @@ config XEN
 	select X86_HV_CALLBACK_VECTOR
 	select HIBERNATE_CALLBACKS
 	depends on X86_64 || (X86_32 && X86_PAE)
-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 2d1bc5b4d11b..faa451584002 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -4,7 +4,7 @@ config INTEL_MEI
 	tristate "Intel Management Engine Interface"
 	depends on PCI
 	depends on X86 || DRM_XE!=n || COMPILE_TEST
-	default X86_64 || MATOM
+	default X86_64 || CPU_SUP_INTEL
 	help
 	  The Intel Management Engine (Intel ME) provides Manageability,
 	  Security and Media services for system containing Intel chipsets.
-- 
2.53.0

