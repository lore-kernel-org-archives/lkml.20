Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755760;
	b=bIipZdjPOVVSWg0CmgwFY0KDeu272f3WA7l+5CiIxyxcHcbUomcIRp0S/fVh/nHLcUAB
	 sVlKQU0jw8u0imhuKbtdJqtzhHw4bZj36wOeHHjGJBdYT6vqmChHlaMrXJtrTY4MX2qxE
	 q89eJP8AIdJ8jY21hoh2nUaV555UxYJuPf30AioJD9hLUdZLQil3QEb1sLjsvdonD1d1C
	 mF0HCKJ5pXO4wtiRL4X/GxgkEFdvYK9l438jxWPbHR3SRl90UK8rsC3E8hInC4zGNXIgI
	 ceCy4Nn2WjBgvrr2dtunVqufEM0ZJHabX+l1v6qICf/hmN1cQs21rJH6jWC5a6fvKNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755760;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=dL5O5DknMLkx5j0JLMvaB1VH/RRyL1r6IILjxXtakIU=;
	b=0LyyOmULpsIeRU1GvIJiWNBHVrEiXlY/vwcTUAnNlWL/ZPnj/voiJjKsTkSzIFySaohQ
	 ea39mZMGYfKLLeWeNqCPNRRveNi0sFJ3Z7Wo80V5qOu500ZTsrdHdxMjApSKFIA86LfXH
	 smn3b3l/63swEesdGXpjmEK8ghoAi/O/rossUUKeIC8nDZ/4DKOcmyJ3mN8CXu2e0wxmM
	 dswO52gyzurFet85BjT8OZgoOZNvL/Z5WzOo9HM9jPNlVSCXBLHVzUM7LIYe824PupXAi
	 ZGF398Nfsj9VMDltk4LVKaZEXLgcyyWDqHS/7oDb9ztfiRRarC7tzpe0GyyfPEqVg2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f5eEXaCn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m49t3E79;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD14606A32C;
	Wed,  4 Nov 2026 01:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f5eEXaCn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m49t3E79
Date: Wed, 04 Nov 2026 01:29:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793755757;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dL5O5DknMLkx5j0JLMvaB1VH/RRyL1r6IILjxXtakIU=;
	b=f5eEXaCn2XGjEyXKD6eLu1XkWxh0NUV6/Y52o3hs/HNIdjy6+ugOWDTH2zXtWBDpXdQ5/L
	SEhueubZLFz1q+Bua4jGcroL42FQNUWphcZ0fjHVIRbZ/cFzgdlOam5YyiXiP/FSpBr6ZQ
	MJWJWMB3mDeeO4aCZUy1i6TXKnT2v71nO0s7K1sXlvVpEisAIZhW+EEYn/R83LtYESjFfv
	sr1cM8qW39zq/2DX2CtulZg1deTOnaNDwSUfJY40ojUNYwPso0HfpDa1MzlkG2DY5TPuhq
	fckknFfx37G6CNfoLQ2Ae/GxoXznzIzv2maUTLoqka0gcP7oKxJeFuGrjpvVbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793755757;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dL5O5DknMLkx5j0JLMvaB1VH/RRyL1r6IILjxXtakIU=;
	b=m49t3E79JfINeFQZ5KFi6tCTmJ2SjA0j4ph2JFiaTePOeRSL2uF0l+FJ1GztaXVpjXsKTU
	e+7Uon2SkBzEuJCA==
From: "tip-bot2 for Naveen N Rao (AMD)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/apic] x86/apic: Use EILVT register count from APIC_EFEAT
Cc: "Naveen N Rao (AMD)" <naveen@kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008091850.1453093-1-naveen@kernel.org>
References: <20261008091850.1453093-1-naveen@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179375575581.1009794.6066003158834797904.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     f8e3789db8f8d4214da7a3fdfd936d23a9aa582d
Gitweb:        https://git.kernel.org/tip/f8e3789db8f8d4214da7a3fdfd936d23a9a=
a582d
Author:        Naveen N Rao (AMD) <naveen@kernel.org>
AuthorDate:    Thu, 08 Oct 2026 14:48:50 +05:30
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 03 Nov 2026 17:19:04 -08:00

x86/apic: Use EILVT register count from APIC_EFEAT

Future AMD processors will increase the number of EILVT registers. Track
the EILVT register max count in a variable. Use the current default of 4
EILVT max count from AMD F10h times as the fallback.

Use the APIC_EILVT_NR_AMD_10H macro only in force_ibs_eilvt_setup()
which is F10-specific anyway.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20261008091850.1453093-1-naveen@kernel.org
---
 arch/x86/events/amd/ibs.c      |  4 ++--
 arch/x86/include/asm/apic.h    |  2 ++
 arch/x86/include/asm/apicdef.h |  2 +-
 arch/x86/kernel/apic/apic.c    | 16 ++++++++++++++--
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c..555912a 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1839,13 +1839,13 @@ static void force_ibs_eilvt_setup(void)
=20
 	preempt_disable();
 	/* find the next free available EILVT entry, skip offset 0 */
-	for (offset =3D 1; offset < APIC_EILVT_NR_MAX; offset++) {
+	for (offset =3D 1; offset < APIC_EILVT_NR_AMD_10H; offset++) {
 		if (get_eilvt(offset))
 			break;
 	}
 	preempt_enable();
=20
-	if (offset =3D=3D APIC_EILVT_NR_MAX) {
+	if (offset =3D=3D APIC_EILVT_NR_AMD_10H) {
 		pr_debug("No EILVT entry available\n");
 		return;
 	}
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 0b11b70..452cce4 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -318,6 +318,8 @@ struct apic {
=20
 	void	(*update_vector)(unsigned int cpu, unsigned int vector, bool set);
=20
+	u32	eilvt_regs_count;
+
 	char	*name;
 };
=20
diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
index bc125c4..32a242a 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -134,12 +134,12 @@
 #define		APIC_TDR_DIV_64		0x9
 #define		APIC_TDR_DIV_128	0xA
 #define	APIC_EFEAT	0x400
+#define		APIC_EFEAT_XLC(x)	(((x) >> 16) & 0xff)
 #define	APIC_ECTRL	0x410
 #define APIC_SEOI	0x420
 #define APIC_IER	0x480
 #define APIC_EILVTn(n)	(0x500 + 0x10 * n)
 #define		APIC_EILVT_NR_AMD_10H	4
-#define		APIC_EILVT_NR_MAX	APIC_EILVT_NR_AMD_10H
=20
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
 #define APIC_BASE_MSR		0x800
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 3583fcd..b2a23e5 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -341,7 +341,7 @@ static void __setup_APIC_LVTT(unsigned int clocks, int on=
eshot, int irqen)
  * necessarily a BIOS bug.
  */
=20
-static atomic_t eilvt_offsets[APIC_EILVT_NR_MAX];
+static atomic_t *eilvt_offsets;
=20
 static inline int eilvt_entry_is_changeable(unsigned int old, unsigned int n=
ew)
 {
@@ -354,7 +354,7 @@ static unsigned int reserve_eilvt_offset(int offset, unsi=
gned int new)
 {
 	unsigned int rsvd, vector;
=20
-	if (offset >=3D APIC_EILVT_NR_MAX)
+	if (!eilvt_offsets || offset >=3D apic->eilvt_regs_count)
 		return ~0;
=20
 	rsvd =3D atomic_read(&eilvt_offsets[offset]);
@@ -410,6 +410,17 @@ int setup_APIC_eilvt(u8 offset, u8 vector, u8 msg_type, =
u8 mask)
 }
 EXPORT_SYMBOL_GPL(setup_APIC_eilvt);
=20
+static __init void init_eilvt(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
+		apic->eilvt_regs_count =3D APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
+	else if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD)
+		apic->eilvt_regs_count =3D APIC_EILVT_NR_AMD_10H;
+
+	if (apic->eilvt_regs_count)
+		eilvt_offsets =3D kzalloc_objs(atomic_t, apic->eilvt_regs_count);
+}
+
 /*
  * Program the next event, relative to now
  */
@@ -2364,6 +2375,7 @@ static void __init apic_bsp_setup(bool upmode)
 	if (upmode)
 		apic_bsp_up_setup();
 	setup_local_APIC();
+	init_eilvt();
=20
 	enable_IO_APIC();
 	end_local_APIC_setup();
