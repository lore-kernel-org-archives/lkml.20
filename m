Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433154;
	b=HobQcH91zpJyOmA7XM5vKBEua8mAuxH0lNOUjkG7rGHDiq+smZkkDq+rcc4D0JaLqpHS
	 UZLsSDstoknKpcf8p7lrniQjJPBG/xBVW6Moh1IBhf/TFCOVUB0f1kG+J27fcysQakoC1
	 HWrwK6zeZ1SBCGTzq6If7gZUgMzJIdzbAj1RIKkHnjf2mLuEYqpuD8XDtywGSFvhN4GZO
	 xy6FK/3VgKOmSdXN5tHfBDOX741K5eqh5DR1vU4Ilv8GFzetYmnO3GeCHQKfHdGaoYWdF
	 3CGoWudGJVA0PR7NzHbCwNoG7creV0qZp68OZKC1aFEqiFkoAqQUfELYHQuntaw2utg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433154;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Qkq91OyFnumsfXcaiuoMtgtyTPgeTLZlF2ptNh6RpA0=;
	b=ZhtzmkbgCHoyWEBGv9cVkyZS03NO3nwH/iBPsyT9ThEh3DVbgDLgYZ7mWvSIhpktp4nc
	 hZi9F2xR/qx/fTIuZHrQYMsp+Frw1mXyn71/CVYvznr2OcozmRQNMGh7I5uB+UGhKfKYX
	 TjevlWZ0uuTzrSP7Bf3hXotSjy8E8WQ5VvoQjsLfesR16TWk/DFeG4cwruu+cFA9GZKXe
	 N2jsldk5kfqYvet79Xu6pj4hdCrZoSV95ykuRSSh5F/FR298lsrV7OrMGd/UcU16nNbYW
	 Na5GnvzDMpG+G0ldzs4CXC0GFYJKopqGdnRvGZoaqVosT798vjKyLzaJw2qTa88Ahcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8qozB3I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F62606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8qozB3I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E131F00919;
	Sat, 31 Oct 2026 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433153;
	bh=Qkq91OyFnumsfXcaiuoMtgtyTPgeTLZlF2ptNh6RpA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d8qozB3I8yOOa/biZnW9qDfYRB32JdikUXl6mqhdMJxOdQeO7NeVOnARBvLiiVGnZ
	 Hr3tLW3KYsTiPoSLtpb1v4YbXOOvzvRwQJgQ1DEzp8tnlpavyPh9FVt4i3s1WSLKWS
	 LJBnrfYHVkszNCmFeAqQ9aJvMxgWjFjqm8+TZBVddnWtsYKC0Xqyjyfl51IJCSRpVe
	 ixiCV9XW9T6PUbrpnsd1wJtut05Zr5jFeGM9hYMHbguLPy+0irIUbnG7C7csX5kBGh
	 +UwyrJRzSjtnPB69hQ05aSg52ko2x8e6gKFPBlyzkAcxGzruzhE5JPgjvuIfvF1lib
	 XeF90ZiD12MKA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Sat, 31 Oct 2026 08:51:49 +0100
Subject: [PATCH 1/3] x86/mce: Add CPU_SUP_* dependencies for Intel/Zhaoxin
 MCE features
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
Message-Id: <20261031-processor_select_is_not_an_expert_feature-v1-1-6227bdbbe5a9@kernel.org>
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
In-Reply-To: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=B7VoyqEu0aohHrEheZchSSALmwMezyuIumVUKvY2mxA=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlP59numrBwZeHj6Zrxaat+3rjb2/pDNLT77591v7bwF
 wUZB7X97JjIwiDGxWAppsiyrJyTW6Gj0Dvs0F9LmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMWLg4hSAqZ4izcjwipvns+Tf7dldwdVhT/yn3GArPuT6+3ZehYwm95/p1U+/MzKc9WTb9Ml
 mzXQbj5oI7gtyH9tebFD3Cik7v/jepprbE3lZAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

Intel-style MCE features are only used on Intel and Zhaoxin CPUs.
Gate X86_MCE_INTEL on CPU_SUP_INTEL || CPU_SUP_ZHAOXIN.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..e09ec15a689a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1159,7 +1159,7 @@ config X86_MCELOG_LEGACY
 config X86_MCE_INTEL
 	def_bool y
 	prompt "Intel MCE features"
-	depends on X86_MCE && X86_LOCAL_APIC
+	depends on X86_MCE && X86_LOCAL_APIC && (CPU_SUP_INTEL || CPU_SUP_ZHAOXIN)
 	help
 	  Additional support for intel specific MCE features such as
 	  the thermal monitor.

-- 
2.56.0

