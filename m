Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592832;
	b=YTnRlrQlli2nzU+jaKYLh6pHPieOrYXXyIrZ0T9CKNNRc5BzwLsajYqI0Yl0cH1NUEZT
	 T2KQC4zTqG9OIphYdi5lbnw3efYcJ4Ab3P0e6ryePSFzkGTM0363dKUP7kYVl1mqnBUfG
	 Qcrh2I7+ShyMGwh71jjMCs2uLP8fSVLOwULxnraeJWJ/x0Z7ZJad9wNN1vjErBhBxUDX6
	 BYQ+IsPnty7PIw0vuVF0NGMdoiMVKRp1V8RLZYCCdJa1IA+8uPhInMilKh/D40+vBFc+V
	 lce4DZrdAVUEOyb45+DO9yIp4falkQjFlP4XwRiRiOBViUbpIbPiq2Oz09PKDBvb2ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592832;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8th/Zw8FHEmb50c62OpuN9JvFsfC8MmCMY/Mc/aNpAw=;
	b=YgalkXDQdBgrO+SbcN4rD1F5oBdfj7h69RZ1YReNRFvTxxBxXxswUfpTk5BYMnBbDFS9
	 Nis3hbA+lollqk1NUjxiXdv+4diVeCtega/YP10dkcJGDpNbkGSSf95wEN9A4OKETgYhY
	 w1Qg66IwBAHgGEdnWO7kTvl9ZH4KQrh8fH4gt6131WxZa3hlxXPMR1hmdNv0VCoIzHVq2
	 /OqDZVLxLtEdqlYFCy/jsO1y+Mw02LLcn/444t0mcS3xSpDf/iO3aPEmZChexGz6SlkFb
	 OuJrQbuWA+ZaGHTH1ucL1fbWYJoz90QOKOcdxznG25tSkYtQY9Y+LhtXyTAqBzTuQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfJ4iO81;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1B606B343
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfJ4iO81
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA7A1F0093B;
	Fri, 13 Nov 2026 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592832;
	bh=8th/Zw8FHEmb50c62OpuN9JvFsfC8MmCMY/Mc/aNpAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BfJ4iO81R8KRxG+AHUeanGgiCF8u+Tfu538rY4tTeF3r9MUvqcrmNMDQ8Qg7bfap4
	 J+a8F1O1t6LDvDfHK48fave2WPIPEwBWJsceQDHSlb3zK/Xj2grzrj/3n/Ui10oZaV
	 LQdyKBOo8EFbjehev15MElRs80xhk9GbGD9n7TZ78m0ZSLHGd6D0EGD7cucjYaUIs6
	 gnI18N3B01jEzohbi3RJFV61lUoka0DDM5nD7UXII0rDIGF34uQP+y3bK+xzr0MXcE
	 Jqe6uRlSGO2pmJX2jfBeZIf1SQENsS+1jXRGzd+xVe7PMn/38e4bxy8eEZXxU/409T
	 7RqaPlZ3OMDUA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 13 Nov 2026 18:59:57 +0100
Subject: [PATCH v2 1/2] x86/mce: Add CPU_SUP_* dependencies for
 Intel/Zhaoxin MCE features
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
Message-Id: <20261113-processor_select_is_not_an_expert_feature-v2-1-ae630b1f2e28@kernel.org>
References: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
In-Reply-To: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=1Y6tt3GiALwvu5H9UxSpRIC0pTtTe4FLPIfc6iXui7M=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnfA2wi5nR2nZ/t1z1rUXLQc6nWiOkPOLkbNN590X8hs
 GvzhPVRHRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1fsyGf6nTEmLnxNtNrWOM/3mDN/ni0M6DH+s1nyjuOdR49FH+u+/MDLszFSrdta
 tLu5ceqhojaFmwp5VcpyFb3ynPT1hn71/SzInAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

Intel-style MCE features are only used on Intel and Zhaoxin CPUs.  Gate
X86_MCE_INTEL on CPU_SUP_INTEL || CPU_SUP_ZHAOXIN.

Update the prompt and help text to mention both supported CPU vendors.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/x86/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..91b3bc7deafd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1158,10 +1158,10 @@ config X86_MCELOG_LEGACY
 
 config X86_MCE_INTEL
 	def_bool y
-	prompt "Intel MCE features"
-	depends on X86_MCE && X86_LOCAL_APIC
+	prompt "Intel and Zhaoxin MCE features"
+	depends on X86_MCE && X86_LOCAL_APIC && (CPU_SUP_INTEL || CPU_SUP_ZHAOXIN)
 	help
-	  Additional support for intel specific MCE features such as
+	  Additional support for Intel and Zhaoxin MCE features such as
 	  the thermal monitor.
 
 config X86_MCE_AMD

-- 
2.56.1

