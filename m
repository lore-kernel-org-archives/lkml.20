Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905635;
	b=nEom0tCXpJf76W9l5ulA9Q+7hlp4n8dEZTm9a6Hd0Qg5JEGckiudPUY00XZdNigcnArq
	 OltW34RVbNR99B5X2gSvKoLU3K9ML3Vii1rRpk0jTBGH8TH9jGVYZkvII9A9v1mL3WsgS
	 SK+FqDoBStS3hVKiuX0HdTvobDj655QpCmZuqGbsszQTI1HpvoAb2eSDMqDdLAXAZ5wCA
	 3xSqcrg24pMlqB0XnHEcxmyNqW9UFIH3dmntIiBOHJfXbrzIDxuEDtcaSo5ZjSCqqWQ2n
	 q8tzDc6wIfDi1QUw0xhZRw4WVAitGiuOQvYIF1Rp7J3ms+Q3/DpuU4ktEgMeAk+imeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905635;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=lRyfmzG1t8XS2YlDbsF0CIx18v5yITYWX+C2nYSc6Jo=;
	b=JLW9jvvr45gZcsaVf0P76UBbXQVdhTnqaQEOEum5QJq0UXTCW/Bkhi0TL0XquuIuPNw9
	 MbR5qtTE1e+fF8IYvhg6Ee33FJQ2tb9WgG6r4sUWu/XZ4bpdsM5u5v0SUuYhDoesHZkvL
	 eXf0tNQSxxxbv4zUxgGOwfohxo8LGcmfTIRXiH7JBlUoyTmxp8c02txKi2LLuuFA6xrnt
	 RuainOxR7l0P8CWjmuWrkS0ZX8ChCivCnICzJDE6Xd3Q1Ikp5GNXnpOV8J5DQCZexmpPW
	 CgAV0TnrEIxg0HggZPt49YoSP4POKOK4BSg1EdEzJhVTlppRzAhMHj0TzpuVAONTV/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CrRqzTPb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6+YEHH1X;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D6B606A32F;
	Thu,  5 Nov 2026 19:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D6B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CrRqzTPb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6+YEHH1X
Date: Thu, 05 Nov 2026 19:07:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793905633;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRyfmzG1t8XS2YlDbsF0CIx18v5yITYWX+C2nYSc6Jo=;
	b=CrRqzTPbdZG9w7Xmu8VSXSdlF43COm3UoiENhBHTAWcK497PBOUrGPzDnBwT6zUIhbyN8z
	3y5qyMClqjgNJ6gJKPnSkrGTBaFLU7G8+IKA4HnLdzZbRlni0QuOonlLZOfUIC1Vy5efwm
	AzAKTrj7t6q9dpfiXeEP+A0a+I6wgS4gVpO1cqw/hWZSeW0cQ90sk5yaPs5w9oeyPqzr23
	InzzphWe1Nl4vThpZjzbCeKn+JT5pYh2NXa2MEvA1bpwLOQaIEVs9ixXy/A1cBvDCXoiC0
	o9MYyuOO+PoAEGV7lWhQPOEdCE+riko0Wvr4hLYPijWQ+mESNlQGfRlxemkkbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793905633;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRyfmzG1t8XS2YlDbsF0CIx18v5yITYWX+C2nYSc6Jo=;
	b=6+YEHH1XY8FlXTPQfG2ItCUpEqEl36EIXzC+Sge2p3XgO8GB4qooStO/Zj9HmwwJY2Vesv
	oW397CIui1SbjzDw==
From: "tip-bot2 for Thorsten Blum" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/boot: Fix off-by-one error in sme_clear_pgd()
Cc: Thorsten Blum <blum@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918142714.242711-2-blum@kernel.org>
References: <20260918142714.242711-2-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179390563139.1009794.13747974597045025516.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     8523d938dce836fbe7ea33fcc98d8460b094ef81
Gitweb:        https://git.kernel.org/tip/8523d938dce836fbe7ea33fcc98d8460b09=
4ef81
Author:        Thorsten Blum <blum@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 16:27:13 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 05 Nov 2026 10:21:38 -08:00

x86/boot: Fix off-by-one error in sme_clear_pgd()

The mapping helpers __sme_map_range_pmd() and __sme_map_range_pte(), and
therefore sme_encrypt_kernel(), use exclusive end addresses and stop
before vaddr reaches vaddr_end.

However, sme_clear_pgd() treats vaddr_end as inclusive when calculating
the last PGD entry to clear. If vaddr_end is PGD-aligned, the first PGD
entry outside the range is cleared too.

Use vaddr_end - 1 to calculate the last PGD entry within the range.

Fixes: 6ebcb060713f ("x86/mm: Add support to encrypt the kernel in-place")
Signed-off-by: Thorsten Blum <blum@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://patch.msgid.link/20260918142714.242711-2-blum@kernel.org
---
 arch/x86/boot/startup/sme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index c07a2c3..2d5cb3f 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -99,7 +99,7 @@ static void __init sme_clear_pgd(struct sme_populate_pgd_da=
ta *ppd)
 	pgd_t *pgd_p;
=20
 	pgd_start =3D ppd->vaddr & PGDIR_MASK;
-	pgd_end =3D ppd->vaddr_end & PGDIR_MASK;
+	pgd_end =3D (ppd->vaddr_end - 1) & PGDIR_MASK;
=20
 	pgd_size =3D (((pgd_end - pgd_start) / PGDIR_SIZE) + 1) * sizeof(pgd_t);
=20
