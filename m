Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCD13FEE;
	Sat, 19 Sep 2026 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776053; cv=none; b=cHc78nBcX15j4GIYKRDLyf0aAnF5qUlH16XOk2zCp1/AremcySGGmEqUAkvxD+s0xLltW8S4hEW4b1Yb2WBRzf/mwxTvwSopRGAHyLNjoaI0Z3TGMjzGqMrqUCFta23tM64M3sQStT3GESIgBD3VRUfbx6MmooIWPAhbm1JGL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776053; c=relaxed/simple;
	bh=CM8t/2r5zpvxP/TIw1rxFeeqDSqqeTNRP2efP52Gg54=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MXczwAdht7Rm5jHgRyK6nduEn4H05eaLXB7jzo6hG3U2PtvCbSZo24wpg59LNTsrkb1g9RT0nchCZmp4hWmYcSxglOZx18oC7U6eAOPH+Qp4aaUoIf1h5eqVLaUcpGZ/amLQkZVXGyO3VqBsWP2n13qH3lGBz23llcR4GEMNonE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TGbO5qwl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gAYQyGe9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TGbO5qwl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gAYQyGe9"
Date: Sat, 19 Sep 2026 00:00:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789776049;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaY4U1vV0TkgZKNx+cRGNSvgFxonKFr8F+Cm/+H8PtU=;
	b=TGbO5qwlHCncJhpMAcc0mZmt+FKwhFE8mW7UzpeOOxyoBuwEVzAxNFCS4uN45hTM0+4M8y
	eSUoPNQAJIOtUQHpg3cxBfnA31qIo94b3kINtIrKbjflehPixAX6X1Enxtk/4TlGbwhd9/
	EY77X7kc6msDJlfp9wAXMaL+pAvxxJnl+Dziprbo/y+z+kqRYSGepQGc1iA9/DGBOboovq
	vUpJIVcFnfpNoXlW7FivM9lSsKwL+uorsWkzRUYKPQNouq/bzPQArjRgcUIQsPuRydLME1
	jhPWFUK6g90RlDBkFB9leg3ujiElhvtUl7Ji1jYsXRR6/mFutEzCsLFnM8Yjjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789776049;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaY4U1vV0TkgZKNx+cRGNSvgFxonKFr8F+Cm/+H8PtU=;
	b=gAYQyGe9pLScYDGkGAcc/t3TbwXB7BZNjWA1ElWRTSbK7WEcZTM5YP+jwczucGQghHnycd
	CCSlMNg8T8jnAYCg==
From: "tip-bot2 for Mauricio Faria de Oliveira" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cleanups] x86/asm/string_64: Remove unused
 linux/jump_label.h include
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824-x86-inc-asm-str64-jmplbl-v2-1-df4d7bec9616@igalia.com>
References: <20260824-x86-inc-asm-str64-jmplbl-v2-1-df4d7bec9616@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178977604769.1720534.8867204559032824916.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     975809caf4b0e07330110b56ca2d8a3fa7e16ff5
Gitweb:        https://git.kernel.org/tip/975809caf4b0e07330110b56ca2d8a3fa7e=
16ff5
Author:        Mauricio Faria de Oliveira <mfo@igalia.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:23 -03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 18 Sep 2026 15:54:44 -07:00

x86/asm/string_64: Remove unused linux/jump_label.h include

Remove the <linux/jump_label.h> include from <asm/string_64.h> since it is
no longer required.

This include was introduced for the static key declaration first added by

  3637efb00864 ("x86/mce: Add PCI quirks to identify Xeons with machine check=
 recovery").

However, it was left when the static key declaration was later removed by

  ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, ke=
rnel}()").

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260824-x86-inc-asm-str64-jmplbl-v2-1-df4d7be=
c9616@igalia.com
---
 arch/x86/include/asm/string_64.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_6=
4.h
index 4635616..0ea680b 100644
--- a/arch/x86/include/asm/string_64.h
+++ b/arch/x86/include/asm/string_64.h
@@ -3,7 +3,6 @@
 #define _ASM_X86_STRING_64_H
=20
 #ifdef __KERNEL__
-#include <linux/jump_label.h>
=20
 /* Written 2002 by Andi Kleen */
=20
