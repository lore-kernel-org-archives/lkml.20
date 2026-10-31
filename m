Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433158;
	b=uoD+jC+KwSKXTM7Cdm3zIizzkAUjksbms4AxU7SPV1jqDfYbHGKBi1G+WNZOZxi79QRZ
	 /T0afsUMfZELldVJ1N/Y7LoWyddYwSlx5+2yRGEdRal8JdYkjlzsXv5Aj5tRWwCLi9kH+
	 qA5ZyFKQiZdamdLUZbxVwV5K6zu31Q+QKN7tvDMH06oFR4p+qhROXcfZXXC/BgssLAqh/
	 Z6o/Ir95N7p9fMeg9JxMxl7LUdzdMUXCG4ZpZzHYsf3FCArmWYbEfZ+8eycywyydUl1/i
	 8BzPjV73fpLNdmjFDVwtctZb+Cc6J/MO/eF9fw8Mvb5sBNhEcPhJ7MTalzgTmfWD5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433158;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8pITuKdlTJC4Ag0BfsHAk3MEUQDerZpy0PTH+EYzwJ0=;
	b=KMWjd0sun8uakaWvSrPpSE6SCJyK1kLZohco0cgV3/KPHeKnG0o9YNsfxNZsisjLfQMf
	 kr3ZCsFtkqMUuc8p/FhytcuIhyd8OXb2irPBTP/sSsNPQyQjjdnHo9GpZ0VA/lHKFCN4l
	 GAC5L4eQetwbgcvZD8poHVBdTYncdtKbUlUO6rAZhGETFaULalsBPoxWBHjRL/5posIK+
	 tfbZilUsDhJRO1HWCmXiR4Utete8BkSvBlRbI1ujz3bXvSN5FulBCrHk0ElYP9GLxytf9
	 yHqL+xgoK/MjyHTH3Kt69SgprXlviKr+Vv4hYqJayS+p2m/BpXbLniZLnTVxk3lQyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkbvKOvA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A2606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkbvKOvA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0931F00A02;
	Sat, 31 Oct 2026 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433157;
	bh=8pITuKdlTJC4Ag0BfsHAk3MEUQDerZpy0PTH+EYzwJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WkbvKOvApT6z0vpsuuTh0ZDNitBcyjBYCBHpqSW7uXeKXvw90QXzHSS0T6rB6dGGE
	 zEhWjP7yojO6HCxrQ7jAJBb7OsuCKKLktXQJq3sV/rYdI7QebuhdGBpVcYwenpoWnm
	 Ifkx7RdovUF4y1WLUAIE0z5WwsI8Mbfih+oknnAr6/B7UXbk0ngLnXUREta8ehSJ8P
	 2HyhX272+Yak2mNZmXimoIev7X0EyOMmjOx9De+ubEx8noDMHiPCd/zUdMX/nnIAsk
	 2PN8cEd8BXvgsMYixjPM11hbpzBwfBSFKwtMeJ4nkrmYcb6LBk/HA7w9VZfs9uZFSy
	 0wiFRuhsmenvw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Sat, 31 Oct 2026 08:51:51 +0100
Subject: [PATCH 3/3] x86/cpu: don't gate PROCESSOR_SELECT with EXPERT
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
Message-Id: <20261031-processor_select_is_not_an_expert_feature-v1-3-6227bdbbe5a9@kernel.org>
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
In-Reply-To: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5377; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=aJjGVjUaitANt7oTx+RjYGs0Givkp7hRaUPxfyozaw8=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlP59luX32u4v+rWZeOuvk1Ct9I4ms2XrC+7VFiZ07yF
 a7ZcfoTOiayMIhxMViKKbIsK+fkVugo9A479NcSZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jBi4OAVgqietY/jv3cO6wlgvUaXs8sKghh7u4w6pm760v0zjXLbR6qPrrh5Lhn8W5Q/u/JN
 9+puTfWqn9BovGxWGehbpgz0G97om5v8QeMkPAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

When doing a make oldconfig, the user might get asked questions about
processor vendors. When the goal is to build a kernel for a specific
machine, those questions are irrelevant.

PROCESSOR_SELECT is a nice candidate to configure the CPU vendors once
and for all, but that feature is gated by EXPERT. It is unclear why this
menu should be hidden from the normal users. In comparison with the
other EXPERT features, knowing your CPU vendor does not require advanced
knowledge. After all, most machines even have a sticker on them to
remind you what is "inside".

Remove the EXPERT dependency from PROCESSOR_SELECT. Make the option N by
default so that all x86 CPU types remain supported by default.

This preserves the current default but now makes it easy to opt out when
configuring for a specific machine.

Finally, rephrase the menu guidance to make the description clearer:

  - Change the PROCESSOR_SELECT entry text from "Supported processor
    vendors" to "Customize supported processor vendors" to better
    describe what the option does.

  - Add a paragraph to PROCESSOR_SELECT help text to clarify that N is a
    safe default.

  - For each of the CPU_SUP_* entries, remove the "If unsure, say N"
    sentence from the help text.

As a side benefit, this also allows users to more easily trim their
kernel without having to activate the EXPERT option or navigate many
submenus. This is illustrated in the measurements below done with gcc
15.3.0, which compare three builds: an x86_64 defconfig, that same
defconfig with only CONFIG_CPU_SUP_INTEL kept, then only
CONFIG_CPU_SUP_AMD kept and the other CONFIG_CPU_SUP_* deselected:

  $ size vmlinux_{defconfig,intel_only,amd_only}.o
     text      data       bss       dec       hex       filename
  29927107   4934948    752852   35614907   21f70bb   vmlinux_defconfig.o
  29819807   4919587    752340   35491734   21d8f96   vmlinux_intel_only.o
  27452359   4252858    748692   32453909   1ef3515   vmlinux_amd_only.o

This shows a 0.35% reduction on an intel-only configuration and an 8.88%
reduction for an amd-only one.

The big difference in the amd-only build size is mostly explained by the
fact that CONFIG_MITIGATION_CALL_DEPTH_TRACKING gets automatically
disabled when removing CONFIG_CPU_SUP_INTEL.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/x86/Kconfig.cpu | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 6e7a366f0798..01eace1ea1f8 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -306,11 +306,15 @@ config X86_VMX_FEATURE_NAMES
 	depends on IA32_FEAT_CTL
 
 menuconfig PROCESSOR_SELECT
-	bool "Supported processor vendors" if EXPERT
+	default n
+	bool "Customize supported processor vendors"
 	help
 	  This lets you choose what x86 vendor support code your kernel
 	  will include.
 
+	  To compile a kernel that can run on all supported x86 CPU types,
+	  or if unsure, say N.
+
 config CPU_SUP_INTEL
 	default y
 	bool "Support Intel processors" if PROCESSOR_SELECT
@@ -322,8 +326,6 @@ config CPU_SUP_INTEL
 	  makes the kernel a tiny bit smaller. Disabling it on an Intel
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_CYRIX_32
 	default y
 	bool "Support Cyrix processors" if PROCESSOR_SELECT
@@ -336,8 +338,6 @@ config CPU_SUP_CYRIX_32
 	  makes the kernel a tiny bit smaller. Disabling it on a Cyrix
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_AMD
 	default y
 	bool "Support AMD processors" if PROCESSOR_SELECT
@@ -349,8 +349,6 @@ config CPU_SUP_AMD
 	  makes the kernel a tiny bit smaller. Disabling it on an AMD
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_HYGON
 	default y
 	bool "Support Hygon processors" if PROCESSOR_SELECT
@@ -363,8 +361,6 @@ config CPU_SUP_HYGON
 	  makes the kernel a tiny bit smaller. Disabling it on an Hygon
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_CENTAUR
 	default y
 	bool "Support Centaur processors" if PROCESSOR_SELECT
@@ -376,8 +372,6 @@ config CPU_SUP_CENTAUR
 	  makes the kernel a tiny bit smaller. Disabling it on a Centaur
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_TRANSMETA_32
 	default y
 	bool "Support Transmeta processors" if PROCESSOR_SELECT
@@ -390,8 +384,6 @@ config CPU_SUP_TRANSMETA_32
 	  makes the kernel a tiny bit smaller. Disabling it on a Transmeta
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_ZHAOXIN
 	default y
 	bool "Support Zhaoxin processors" if PROCESSOR_SELECT
@@ -403,8 +395,6 @@ config CPU_SUP_ZHAOXIN
 	  makes the kernel a tiny bit smaller. Disabling it on a Zhaoxin
 	  CPU might render the kernel unbootable.
 
-	  If unsure, say N.
-
 config CPU_SUP_VORTEX_32
 	default y
 	bool "Support Vortex processors" if PROCESSOR_SELECT
@@ -416,8 +406,6 @@ config CPU_SUP_VORTEX_32
 	  Vortex CPU. Disabling this option on other types of CPUs
 	  makes the kernel a tiny bit smaller.
 
-	  If unsure, say N.
-
 config BROADCAST_TLB_FLUSH
 	def_bool y
 	depends on CPU_SUP_AMD && 64BIT

-- 
2.56.0

