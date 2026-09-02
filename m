Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net [178.154.239.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465E9411F94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386617; cv=none; b=jc8/rndgt7u0HWeupRtE4WWovV7AHEfo1qfR/nkICDdk/DqReqf8WQ7Uz1jgrzmcbsDpxgRRfDnebj0zwwQ/lh0An1yOyU2F6bUjOTs6q51dIuR1BgSnUxeWQ/ToH0NL3kWD3DCpWJoJ5h+wESUbQ00bU3MmfxxiRJNCbru7KMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386617; c=relaxed/simple;
	bh=CvHS4caaRsdpF/glR/1M4L/BcgGiH9dJjQ6QlL/jM5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KiZbIWTqRmDIUYaXW74npMo4EYGm8oVAB3jK8diVCn3Y3Y2lgFS4tpO//L4r0GgjK5f3TEc9dG3N6HFugtmyA4LOBwiWLytq1f9xZgh1wSuu9879tfxruOZ+hd4o1DFjQpv1UohHlAhhfc5ZudGBjoA2gw95OmvpWEQgyjQ5kI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=Wi6gm59N; arc=none smtp.client-ip=178.154.239.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="Wi6gm59N"
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:fa2:0:640:41ee:0])
	by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 6ECC882A58;
	Thu, 03 Sep 2026 01:01:45 +0300 (MSK)
Received: from i101646577.yandex-team.ru (unknown [2a02:6bf:8080:b7b::1:1e])
	by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA id f1tkLusaZGk0-kej65A7h;
	Thu, 03 Sep 2026 01:01:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1788386504;
	bh=A+W/ldisppAArTMWvfAGcpzZiNRw0eu+MP0v6kAy3u0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Wi6gm59NEzp2vo7igIP4wMGOBA5JDhwbMgbrmCQJcm26eEPACPo8Ww+MQx0O2ajUo
	 GNZaCnfFFBbXfipCVNPREbtQ0fB6sFs6QMzMRxoQ20BCDqYmxyGuO14q0wj8glRV3b
	 yu3tGBD3zLmwI2yXUfey2ftjyUMIWWOnnEoEuHxs=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Steve Wahl <steve.wahl@hpe.com>,
	Justin Ernst <justin.ernst@hpe.com>,
	Kyle Meyer <kyle.meyer@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Russ Anderson <russ.anderson@hpe.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [PATCH] x86/apic: Remove dead disable_esr machinery
Date: Thu,  3 Sep 2026 01:01:23 +0300
Message-ID: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniil Tatianin <99danilt@gmail.com>

apic::disable_esr was a quirk for the 32-bit NUMA-Q, Summit, ES7000 and
bigsmp platforms, which left the local APIC error status register alone
because "something untraceable" produced bad interrupts on those
machines. NUMA-Q, Summit and ES7000 went away in 2014 with commit
b5660ba76b41 ("x86, platforms: Remove NUMAQ"), commit 7cf6c94591bb
("x86, apic: Remove support for IBM Summit/EXA chipset") and commit
58f5d2d44883 ("x86, apic: Remove support for ia32-based Unisys ES7000"),
and the last setter went with commit 0abf508675c0 ("x86/smp: Drop
32-bit "bigsmp" machine support"). Every remaining APIC driver
initializes the flag to zero.

Remove the flag, the ESR setup bypass keyed on it and the 32-bit only
ESR clearing hammer in setup_local_APIC(), which was gated on the same
flag and therefore equally dead.

No functional changes.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 arch/x86/include/asm/apic.h           |  3 +--
 arch/x86/kernel/apic/apic.c           | 20 --------------------
 arch/x86/kernel/apic/apic_flat_64.c   |  2 --
 arch/x86/kernel/apic/apic_noop.c      |  2 --
 arch/x86/kernel/apic/apic_numachip.c  |  4 ----
 arch/x86/kernel/apic/probe_32.c       |  2 --
 arch/x86/kernel/apic/x2apic_cluster.c |  2 --
 arch/x86/kernel/apic/x2apic_phys.c    |  2 --
 arch/x86/kernel/apic/x2apic_savic.c   |  2 --
 arch/x86/kernel/apic/x2apic_uv_x.c    |  2 --
 arch/x86/xen/apic.c                   |  2 --
 11 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d467d4..5025b8413799 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -285,8 +285,7 @@ struct apic {
 	void	(*send_IPI_all)(int vector);
 	void	(*send_IPI_self)(int vector);
 
-	u32	disable_esr		: 1,
-		dest_mode_logical	: 1,
+	u32	dest_mode_logical	: 1,
 		x2apic_set_max_apicid	: 1,
 		nmi_to_offline_cpu	: 1;
 
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2..2b2a3d2d166e 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1402,17 +1402,6 @@ static void lapic_setup_esr(void)
 		return;
 	}
 
-	if (apic->disable_esr) {
-		/*
-		 * Something untraceable is creating bad interrupts on
-		 * secondary quads ... for the moment, just leave the
-		 * ESR disabled - we can't do anything useful with the
-		 * errors anyway - mbligh
-		 */
-		pr_info("Leaving ESR disabled.\n");
-		return;
-	}
-
 	maxlvt = lapic_get_maxlvt();
 	if (maxlvt > 3)		/* Due to the Pentium erratum 3AP. */
 		apic_write(APIC_ESR, 0);
@@ -1527,15 +1516,6 @@ static void setup_local_APIC(void)
 	value &= ~APIC_SPIV_APIC_ENABLED;
 	apic_write(APIC_SPIV, value);
 
-#ifdef CONFIG_X86_32
-	/* Pound the ESR really hard over the head with a big hammer - mbligh */
-	if (lapic_is_integrated() && apic->disable_esr) {
-		apic_write(APIC_ESR, 0);
-		apic_write(APIC_ESR, 0);
-		apic_write(APIC_ESR, 0);
-		apic_write(APIC_ESR, 0);
-	}
-#endif
 	/*
 	 * Intel recommends to set DFR, LDR and TPR before enabling
 	 * an APIC.  See e.g. "AP-388 82489DX User's Manual" (Intel
diff --git a/arch/x86/kernel/apic/apic_flat_64.c b/arch/x86/kernel/apic/apic_flat_64.c
index e0308d8c4e6c..f65e82c6e750 100644
--- a/arch/x86/kernel/apic/apic_flat_64.c
+++ b/arch/x86/kernel/apic/apic_flat_64.c
@@ -37,8 +37,6 @@ static struct apic apic_physflat __ro_after_init = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= 0xFE,
diff --git a/arch/x86/kernel/apic/apic_noop.c b/arch/x86/kernel/apic/apic_noop.c
index 58abb941c45b..0661cb008459 100644
--- a/arch/x86/kernel/apic/apic_noop.c
+++ b/arch/x86/kernel/apic/apic_noop.c
@@ -54,8 +54,6 @@ struct apic apic_noop __ro_after_init = {
 
 	.dest_mode_logical		= true,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= 0xFE,
diff --git a/arch/x86/kernel/apic/apic_numachip.c b/arch/x86/kernel/apic/apic_numachip.c
index a60c8960bbfd..27a9a5b33f63 100644
--- a/arch/x86/kernel/apic/apic_numachip.c
+++ b/arch/x86/kernel/apic/apic_numachip.c
@@ -210,8 +210,6 @@ static const struct apic apic_numachip1 __refconst = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
@@ -244,8 +242,6 @@ static const struct apic apic_numachip2 __refconst = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
diff --git a/arch/x86/kernel/apic/probe_32.c b/arch/x86/kernel/apic/probe_32.c
index 87bc9e7ca5d6..00ee033ede14 100644
--- a/arch/x86/kernel/apic/probe_32.c
+++ b/arch/x86/kernel/apic/probe_32.c
@@ -41,8 +41,6 @@ static struct apic apic_default __ro_after_init = {
 
 	.dest_mode_logical		= true,
 
-	.disable_esr			= 0,
-
 	.init_apic_ldr			= default_init_apic_ldr,
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
diff --git a/arch/x86/kernel/apic/x2apic_cluster.c b/arch/x86/kernel/apic/x2apic_cluster.c
index 7db83212effb..0c8257cfa3fa 100644
--- a/arch/x86/kernel/apic/x2apic_cluster.c
+++ b/arch/x86/kernel/apic/x2apic_cluster.c
@@ -232,8 +232,6 @@ static struct apic apic_x2apic_cluster __ro_after_init = {
 
 	.dest_mode_logical		= true,
 
-	.disable_esr			= 0,
-
 	.init_apic_ldr			= init_x2apic_ldr,
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic_phys.c
index 090647cc5a78..653ef67b42eb 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -129,8 +129,6 @@ static struct apic apic_x2apic_phys __ro_after_init = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
diff --git a/arch/x86/kernel/apic/x2apic_savic.c b/arch/x86/kernel/apic/x2apic_savic.c
index 4bc6d7e018a5..f116dc7ecb01 100644
--- a/arch/x86/kernel/apic/x2apic_savic.c
+++ b/arch/x86/kernel/apic/x2apic_savic.c
@@ -394,8 +394,6 @@ static struct apic apic_x2apic_savic __ro_after_init = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
index 42568ceec481..bc8709893676 100644
--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -758,8 +758,6 @@ static struct apic apic_x2apic_uv_x __ro_after_init = {
 
 	.dest_mode_logical		= false,
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
diff --git a/arch/x86/xen/apic.c b/arch/x86/xen/apic.c
index bb0f3f368446..23db95dd3411 100644
--- a/arch/x86/xen/apic.c
+++ b/arch/x86/xen/apic.c
@@ -117,8 +117,6 @@ static struct apic xen_pv_apic __ro_after_init = {
 
 	/* .delivery_mode and .dest_mode_logical not used by XENPV */
 
-	.disable_esr			= 0,
-
 	.cpu_present_to_apicid		= xen_cpu_present_to_apicid,
 
 	.max_apic_id			= UINT_MAX,
-- 
2.53.0

