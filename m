Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B382192F9;
	Fri,  2 Oct 2026 01:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790906081; cv=none; b=nX67YxcMOE2CAhzp4jsY5rumwxAGZW7CIbpqesgIFw01Wqcvn2fZsHLytEoWWCufpUs6ctxAuayk6l7Gz2zTx38VWDwjnQI7eS+gnb0/434SZlBBru20gtqZjb9CFYKAOz2layk3mW8wUEGDPMD9TCQs1G2Ixi42XLubLIB05Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790906081; c=relaxed/simple;
	bh=SikJUF9s0W5tbbadeDcFRnnL62IsTqcRRy54Oy3QoGg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WrUkwcOPKpYecwfNP0+6gx9IlHnoMaDVl+GipqhNYRBz6RyVwEV1DcsF9qU2K/SgMoUCo4hX4eKuVrINC4n+pifnfHTiidiFmxYj9q76i7XmN99kNWmVms+khdl8yhtbMrqxRMGSz6ZIrZqcV8kGM6KrOhh2IYX3/RmHCtpMazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=De14zIsx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K9SolLuW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="De14zIsx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K9SolLuW"
Date: Fri, 02 Oct 2026 01:54:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790906077;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrxywkiUxqf115T7+dtY1GssM4qhHvR+T3u1DCJkO3U=;
	b=De14zIsxjAgFP8B3KJAsczOSFP4RFzut8CknTAarWOLjqvX5zlEXsf9URJMgeDeNqHLuxV
	O8HU51VjieMT8LiXOZI8fqB38w7faWeauGGErKrtHPNzpHAW0Si4YT9EU2XyKHXprwjvmo
	4nvM1Wb2Rf0v3oEvvPm95kzMO7E7oxAcU5yjabxAMv67OofWnR0dRJko5loQIwzT5NBjMF
	N23JizA9zW6gwH5gQsrpiFtApL+hHuTfBzFr592ZLnWApNypi4opGJ4gsOMMBxj0PJp+/L
	v0hm9/j1WcmEFkMqh+yDFZ0yeGOlZv+UMiRbTf/qFjGMPIehyTHD0r7Fbulvpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790906077;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrxywkiUxqf115T7+dtY1GssM4qhHvR+T3u1DCJkO3U=;
	b=K9SolLuWhrBJTf2TBi5b27NngUE48ZCj6lzFx+r24+xQQlEASsmSGFYeW73gHd7XJ9gEvK
	fxGoZQfq2WfKVSAg==
From: "tip-bot2 for Brian Gerst" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cleanups] x86/asm: Remove CR4 read fault handler
Cc: Brian Gerst <brgerst@gmail.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260905225519.1002976-1-brgerst@gmail.com>
References: <20260905225519.1002976-1-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179090607545.3910103.1809258617237617452.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     27441d76b3d6604de9162c4c24d034bcfe3249de
Gitweb:        https://git.kernel.org/tip/27441d76b3d6604de9162c4c24d034bcfe3=
249de
Author:        Brian Gerst <brgerst@gmail.com>
AuthorDate:    Sat, 05 Sep 2026 18:55:19 -04:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 01 Oct 2026 18:04:49 -07:00

x86/asm: Remove CR4 read fault handler

Remove the fault handler from native_read_cr4() since 486 support has
been removed.

Signed-off-by: Brian Gerst <brgerst@gmail.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260905225519.1002976-1-brgerst@gmail.com
---
 arch/x86/include/asm/special_insns.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/spec=
ial_insns.h
index 46aa2c9..6c80f69 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -46,20 +46,7 @@ static __always_inline void native_write_cr3(unsigned long=
 val)
 static inline unsigned long native_read_cr4(void)
 {
 	unsigned long val;
-#ifdef CONFIG_X86_32
-	/*
-	 * This could fault if CR4 does not exist.  Non-existent CR4
-	 * is functionally equivalent to CR4 =3D=3D 0.  Keep it simple and pretend
-	 * that CR4 =3D=3D 0 on CPUs that don't have CR4.
-	 */
-	asm volatile("1: mov %%cr4, %0\n"
-		     "2:\n"
-		     _ASM_EXTABLE(1b, 2b)
-		     : "=3Dr" (val) : "0" (0));
-#else
-	/* CR4 always exists on x86_64. */
 	asm volatile("mov %%cr4,%0" : "=3Dr" (val));
-#endif
 	return val;
 }
=20
