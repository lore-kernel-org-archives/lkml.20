Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985334;
	b=Oe49ZKwVSs2G1HIcx03QlOzHxImuEy3h4aLwLn1f+yXPFhV3CLpBWBNdE51+vVTJdVbE
	 CWiTCFAn8UzLd0fQHkLQZxUd/gQrE6K+AJdVQxN79uDq9BN9yn17YD5yQ9LJiJXOAas6m
	 9qPaiWqGbc+NMSgi+cG6+pUGv53YFs4VxkW4Mwg9jOCDVLuz5K72MNM6jWP9ZOYuvyFZo
	 2YF2nkMUIGNGIOA9tvITlEkywQ2UrOAv3fkD756U4gUe4KmKlOMz1B+crvoDbaNIPkm5a
	 L9T/Hir6xCZaZoiuNzXN2FVmiyI7i9gcBbssVMkGp7tWXZE2I1/C/NxQhI6J+6hqYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985334;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vTfnuw27HR9wSYzFdSD9jh3MWvPBNZdFx0YlamNkp/0=;
	b=3MpY7xhVAhFSd3OjphEw/8FAzlRClLyEtRlwSuhMg7NZX6DquRdyiPC+L154/lZKdNbu
	 gYHdFTcc0c6bX4xHdpqY9KdfbKOgi7J6Ptc6mJYoOQetXeQ2VtuNmSbLUHq7lTSUUhwre
	 lcMVtUlFElx5DNLgoQenMysz4UiNDJfcXya5cGFZ5IU3CFQaT57czTswMpub5UmpQlGxt
	 JNY6KAZYCAl5utmDFchzRhEBUROOIRHTKtH/51Mvy+PGPza8g74NBaA6awWZdmGBPsV4X
	 zhlmC/zqGfg6iHmngmy/4haJw0vqxFSfguyOClR6fWKzrWu5VaV+etyJ+1pcz3e/mFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mxunYXl8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=njhtufA6;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CB606D802;
	Fri,  6 Nov 2026 17:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436CB606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mxunYXl8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=njhtufA6
Date: Fri, 06 Nov 2026 17:15:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793985331;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTfnuw27HR9wSYzFdSD9jh3MWvPBNZdFx0YlamNkp/0=;
	b=mxunYXl8OETDN09FL2ZzlmPVqIrRzPt1hTXeW7YvlaqRuTlt4hehBXWTXv1GlNK2gPX1ww
	72bNs3WKeEYA+CsMAdeSdDm+h4vK1UaN1rqQaDCPVSvMcMmaWuV/1oI1r7gEMlPTih0AaC
	X151gzBsXY4FEMcioe+FqmY6PVmOQo+VH/d6M94u7O8K8u+H9srF4SN10W7Iisc6xqJIoO
	qUlOUqrLnopNr31zhLDbkUUDdJSnqGN3LnozdlBdIFF8htOYmaM1rRSTktQDMf13nZ3bFa
	IA7Ls3EhZGNiqIUaZ5yBDAF8RrCnVL/irNSEAANBxYdgfJHgNHy0F7ThBWWtHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793985331;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTfnuw27HR9wSYzFdSD9jh3MWvPBNZdFx0YlamNkp/0=;
	b=njhtufA6NCpUweyuUUakqxnx6/Mo6KhSs6VqFgKt7Y14UnATNXIhxmcvHFk5zyvhIEE9BR
	Uj239mrKDzw9FpCg==
From: "tip-bot2 for Thorsten Blum" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/boot: Fix off-by-one error in sme_clear_pgd()
Cc: Thorsten Blum <blum@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,  <stable@kernel.org>, x86@kernel.org,
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
Message-ID: <179398532889.1009794.17292361248484122730.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     cb319926808b1cca522d2087a13205e840beb45b
Gitweb:        https://git.kernel.org/tip/cb319926808b1cca522d2087a13205e840b=
eb45b
Author:        Thorsten Blum <blum@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 16:27:13 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 06 Nov 2026 09:05:23 -08:00

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
Cc: <stable@kernel.org>
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
