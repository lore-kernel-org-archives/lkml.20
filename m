Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433156;
	b=1EV+f360y3nxnCECFKDFIZI1wv9rhXUpfZFI4LJIYTNPSDwAkGLjRb8ad0V60MGl5JEx
	 wQ9TG0SUNA63GMj/Ny47L5LSGm9LpHl6ZxvCSojifF0x+XKim7OZXEU2uhBMVoA0mX5qb
	 8T2gSVEvqa3tBR/qIhcCnnBeq2HqNHXwEhvbGI4CdQhHsLiBzPjdmLnMefOHOh4I6lQem
	 7bQUdUH5sWYjFeHjz6qDB2Yvjj3nUxLo0IzqqglNtG7nZahIpQfklsYBTsbBT4840m0f3
	 aM3LVz8hwYlYpvn6vUR5fNE7vlqqreCK881Du/H80B2FpnIESrXeNTbMS1EmVApguIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433156;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xk6JFEc5S8U0ON/VKNslbDN7uy3qw8GwhaioWxaPuYs=;
	b=tln8LW697x7uLXqdq4quU1q8NYH1YHDZCdraxXr15bWAxPf0FgC1j7XtA6KODeJHQqcT
	 mIuuVkUePsXtJF212iV28v+L5KijiPICAFSbjwNjAz3+kk46Yd9LGQqHbvErBUNmyq2q5
	 za73k8ibzHwXAmSEmalhzAFQ+TL/qXcsa99NATqGu0bN4BoPyOrwqr/Yyc0rzF7IC1jKT
	 xRgII2qARV/NL13nGtxiDCNQcOewt7fOS2x9QxhY4Fu6M0dXJkJnstFKSFoK4Dy7Jb93M
	 aHjHCzoKRu6Htmc9ip/ujlPCM4E95vCgbUHkj1B0pMGipSd7cirmfGULwPHk5SkaRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O4DskQb/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E5E606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4DskQb/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87A31F000C1;
	Sat, 31 Oct 2026 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433155;
	bh=xk6JFEc5S8U0ON/VKNslbDN7uy3qw8GwhaioWxaPuYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O4DskQb/dPWq53VgGBawtzCdra6nBslgxrlMx1N7WzWLtoeJ2wagsdjm456jlEEY1
	 eYciMFNqAuAGldzahQk9MA9i3Z+evc5hipUzIqhle/9eRA5vRvH1FJf4CEnwfeuYhQ
	 Y17fBH6jVYKxa9OBa4Gi/jm7T7Y1zrZYqgn/3HHsPcn9NzGSnSuEF61iQA0YRj/aEx
	 jvFjUiNoTHXKrZ/o5ntlEEZascmIq6wlFbkxVEtEJlJyEuId3qp2D7HsPMKDAdfIuY
	 ALdAvhF8xsCtZdgSsnlloxNpP/Oe+3EYO2lJ2miGxPI6HOCcyr1H4Yhj9/Dell0z9i
	 JtBJbV3lI9N/w==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Sat, 31 Oct 2026 08:51:50 +0100
Subject: [PATCH 2/3] x86/numa: Add CPU_SUP_AMD dependency for legacy AMD
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
Message-Id: <20261031-processor_select_is_not_an_expert_feature-v1-2-6227bdbbe5a9@kernel.org>
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
In-Reply-To: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=3RaAs2e2dihqvcAi3wkyj7i7K2JTM7n3Z6DPWaAeazE=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlP59lO2MPen7L/A3vox6qlv4/L6bi85DT1n/Bri8BB/
 qdOs37pdExkYRDjYrAUU2RZVs7JrdBR6B126K8lzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGDFwcQrAVLN1MvwVYbdxk5ZpbLYry+Nl3L0scGuG1Ldb066HPKl/czl48iNbRoZNd4IPTPl
 2519K9jnjyzEejGsF2/pjarfzGErsm6l38BkTAA==
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
index e09ec15a689a..6ee0265b5483 100644
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
2.56.0

