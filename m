Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592834;
	b=bL97WmDUHIqnXrQ0H87OIPx3lx154ORGa2yqwYn79FfvsZ/GmfELMDaDznka0Rv4KVr4
	 kviHA+/7C7VZ0KyNp/uZrQcSUPdXAml9g8FXknAO3WUSNsdZ0tIIj4uQHU1K/qvIHCqHM
	 tAwE3hKYq9nBiemxpPsYV6pyv6cfmisV70E2IA/zk2IIn4UixHDN00Vq+QWt0mDliOOpF
	 IqT/brl1oIVmLF99foOCvE90qOIMfwM1Okvve0B8yMCebhc2iFypt2OVY7JZwPt2DZZHv
	 Y06ZsjqpnvvS7clsvNq1VlQTe05h8ATmMeQF7Jm2ZFAinM0pzr1CZYEmZMkJnBwULgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592834;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wffAUGeXkpM9DBN00xj3RLADzpErFXu9VnwWWNZmffA=;
	b=xu6/Wdl6vyfEh3Spc+rvYb2nWbxXMGS8nzWE/6UpOuwbneg8VBDPjTrWEoxptuOvdhv9
	 7PfR0aTP9JdVfVsTXJ7Oaw96g30cxcLpU9H2u1/e/O+/xSUajQK2r6lkRUvFzeETLPSrr
	 5q8xaPOtYbut6Ur5zNInjfEWm6k0Vi/iMFiYQBTWZpovjMj2OahhqlvCE/WyQAg83VB4x
	 JnS4Cc68X3vCrRu8h3cuWUnNm8jDtmwAz9HYxeqeRcD3ILZ/P4wHY2tCdgMY4tmOfF4/K
	 izdHkRM9rZO6c9q7OjOrx670o9McHlLfbp+ox8gEe+LDm71wXbYcJBj7WTETLzG1APA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoG+fQx5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A84606B447
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoG+fQx5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD711F00ADB;
	Fri, 13 Nov 2026 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592834;
	bh=wffAUGeXkpM9DBN00xj3RLADzpErFXu9VnwWWNZmffA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YoG+fQx5cqRfBHjchRbUDm9q1z2QKTCNzt/tyV2FGSinVNusSFLlus8oMeE9zAVtw
	 sjtQDI1ONN5/ck80FBckICwM519oY1msHI0PfdA3HUPsNlVQJBGtrGj3I5v/rxjXOV
	 SMaHjLQIKpjbybTM7JTMP31iOEDUquLi3ni4A3STGSB/TH0bOPIyIgPU09ARYesYUJ
	 P0/Rmmz1/NGijSvTQwj39iSfBsM4HDLdG52NMYh/FNPhb2f/ELQF19FdO3otR6/wES
	 9NZz34kGXHHSJdG1MBhrnh/Jlxknvwpq8FZy0QlsoABMWEt5gf8m382b1dG3jFTOCK
	 jCP2/+nJg8duw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 13 Nov 2026 18:59:58 +0100
Subject: [PATCH v2 2/2] x86/numa: Add CPU_SUP_AMD dependency for legacy AMD
 NUMA
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
Message-Id: <20261113-processor_select_is_not_an_expert_feature-v2-2-ae630b1f2e28@kernel.org>
References: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
In-Reply-To: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=+91VWgNSx8kEfb2jmxHYqUHRvGsH7Fo42sk1AkY3SE0=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnfA2w+lZ7oPRKx7LD1KrGyvY/lqk80xS+/mVs4v6NAc
 rP2/h/pHRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1bf5GBkO8b81DAk0+rYv8vP1tacl9T60KZTIaoho3wrwV21ePHEuwz87rv0iMUK
 u2vYH73QvyJv6elvcnXsJ+zi3iM1rLI7Wm8sJAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The legacy AMD NUMA probe reads topology from an Opteron northbridge.

It is only useful when AMD CPUs are supported, so gate it with
CPU_SUP_AMD.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 91b3bc7deafd..1bf39880d3fc 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1524,7 +1524,7 @@ config NUMA
 config AMD_NUMA
 	def_bool y
 	prompt "Old style AMD Opteron NUMA detection"
-	depends on X86_64 && NUMA && PCI
+	depends on X86_64 && NUMA && PCI && CPU_SUP_AMD
 	help
 	  Enable AMD NUMA node topology detection.  You should say Y here if
 	  you have a multi processor AMD system. This uses an old method to

-- 
2.56.1

