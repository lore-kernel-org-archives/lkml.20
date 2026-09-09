Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC153D0BC;
	Wed,  9 Sep 2026 23:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998293; cv=none; b=rKoPztuEsipHZzIknEUf0/PQpEGrZBAf5L2IXbutaJcpe8h45DMbUz8YW5rDnzMkSKD5EksfaqgJdfdwtRU4gTum0rnwMan5mjDS3j/4fo/QJmmNzNvbPczSHdB34gsQTFj0SMDaj/2mzXXqtRUzVD3Jzdc8K3i0Zp+/EM24UPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998293; c=relaxed/simple;
	bh=5AbxDxnl0gJjsxzzwM3Huo530Yd70sFnyObGz2PBSN4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=u3I3sQ7YT52X3abZwMTw/0Q2LbeIQx+9qksI/rkP7HVdsvQ5gs8PXJNaXdX3BxJP6c90W6UhZ4uMQeRs18yFoxI37Sf4IalRaD5DCiLc1KWGWeC9RCjtdzieOZsjhVvjuJKevczVaX4LxjWcMqLS3e4W6bWNDJu1Zu6tF1L4zyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o6FggQl8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yzSiZ98S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o6FggQl8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yzSiZ98S"
Date: Wed, 09 Sep 2026 23:58:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998284;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHBGIDQ61aXoaODIEobnvnQfK2zvK98XYIulSEWAe1g=;
	b=o6FggQl8PzdzmNO/OJ3PuwpG+v7VhmlpwSkOMkUmGuLh5E3JW9bcSmvFc/AWpNeAqFkEKo
	bhQRgOFsl4P0n5kx8n2SFDQH5qBctuwskDzdE8ixqlMczmQQdX8o0JofIiwl+TpREZ+G4K
	/kN8r5OFe76tTcekj1jfn6e2eaen6rQ678ShqYKxSe/UG2vYLL5Wg0ThYQZYMvLFIVcoHo
	mLmaz8kTjGzZBqtkdOsZOVr/7l4MEde7rQu78yDxKOp4jneKzjRWHukGw5csHpiPqyozWq
	bHbqTFIYhb3zgy8DuIiDrnh8GoewVsxomvVUdHAXzEjkh/y+CH0KWm+61YXIIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998284;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHBGIDQ61aXoaODIEobnvnQfK2zvK98XYIulSEWAe1g=;
	b=yzSiZ98S9hDJ4ZJpWvqJjTG/+WnCxXk+6NZ8+EtVgpSYpI7mHVf/eFVQV3L3iBOxJISsea
	C9fHMsrJUVoBzyDQ==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] um: Check for missing AVX and AVX-512 xstate bits
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-3-ebiggers@kernel.org>
References: <20260901145740.42337-3-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899828270.623050.7421120434095232253.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     19c5d90800a24096697dd6c66237218b7ea417ee
Gitweb:        https://git.kernel.org/tip/19c5d90800a24096697dd6c66237218b7ea=
417ee
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:34 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sat, 05 Sep 2026 08:16:47 -07:00

um: Check for missing AVX and AVX-512 xstate bits

If the CPU declares AVX or AVX-512 support, verify that all the
corresponding bits are set in the XCR0 register.  If any are missing,
warn and don't set the corresponding X86_FEATURE_* flags.

This eliminates the perceived need for UML-supporting AVX and AVX-512
optimized code in the kernel (that is, lib/raid/ currently) to start
checking the XCR0 bits in addition to X86_FEATURE_AVX*.

This aligns UML with the vast majority of userspace programs, which
check the XCR0 bits before considering AVX and AVX-512 to be supported,
as per the procedure documented in Intel's CPU manual.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-3-ebiggers@kernel.org
---
 arch/um/kernel/um_arch.c | 78 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index e4ee693..9d53cc6 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -264,12 +264,88 @@ unsigned long brk_start;
=20
 #define MIN_VMALLOC (32 * 1024 * 1024)
=20
+static u64 __init read_xcr0(void)
+{
+	u32 a, b, c, d;
+
+	asm volatile("cpuid"
+		     : "=3Da"(a), "=3Db"(b), "=3Dc"(c), "=3Dd"(d)
+		     : "a"(0), "c"(0));
+	if (a >=3D 1) { /* max_leaf >=3D 1 */
+		asm volatile("cpuid"
+			     : "=3Da"(a), "=3Db"(b), "=3Dc"(c), "=3Dd"(d)
+			     : "a"(1), "c"(0));
+		if (c & (1 << 27)) { /* XSAVE enabled by OS */
+			asm volatile("xgetbv" : "=3Dd"(d), "=3Da"(a) : "c"(0));
+			return ((u64)d << 32) | a;
+		}
+	}
+	return 0;
+}
+
+static void __init validate_and_set_cpu_cap(int cap, u64 xcr0)
+{
+	/*
+	 * Check for missing xstate features right away, so that there's no
+	 * perceived need for all optimized code in the kernel to do so.
+	 */
+	switch (cap) {
+	case X86_FEATURE_AVX:
+	case X86_FEATURE_AVX2:
+	case X86_FEATURE_AVX_VNNI:
+	case X86_FEATURE_FMA:
+	case X86_FEATURE_VAES:
+	case X86_FEATURE_VPCLMULQDQ:
+		if ((xcr0 & 0x7) !=3D 0x7) {
+			static bool warned;
+
+			if (!warned) {
+				os_warn("Disabling AVX support due to missing xstate features\n");
+				warned =3D true;
+			}
+			return;
+		}
+		break;
+	case X86_FEATURE_AVX512F:
+	case X86_FEATURE_AVX512BW:
+	case X86_FEATURE_AVX512CD:
+	case X86_FEATURE_AVX512DQ:
+	case X86_FEATURE_AVX512ER:
+	case X86_FEATURE_AVX512IFMA:
+	case X86_FEATURE_AVX512PF:
+	case X86_FEATURE_AVX512VBMI:
+	case X86_FEATURE_AVX512VL:
+	case X86_FEATURE_AVX512_4FMAPS:
+	case X86_FEATURE_AVX512_4VNNIW:
+	case X86_FEATURE_AVX512_BF16:
+	case X86_FEATURE_AVX512_BITALG:
+	case X86_FEATURE_AVX512_FP16:
+	case X86_FEATURE_AVX512_VBMI2:
+	case X86_FEATURE_AVX512_VNNI:
+	case X86_FEATURE_AVX512_VP2INTERSECT:
+	case X86_FEATURE_AVX512_VPOPCNTDQ:
+		if ((xcr0 & 0xe7) !=3D 0xe7) {
+			static bool warned;
+
+			if (!warned) {
+				os_warn("Disabling AVX-512 support due to missing xstate features\n");
+				warned =3D true;
+			}
+			return;
+		}
+		break;
+	}
+	set_cpu_cap(&boot_cpu_data, cap);
+}
+
 static void __init parse_host_cpu_flags(char *line)
 {
+	u64 xcr0 =3D read_xcr0();
 	int i;
+
 	for (i =3D 0; i < 32*NCAPINTS; i++) {
 		if ((x86_cap_flags[i] !=3D NULL) && strstr(line, x86_cap_flags[i]))
-			set_cpu_cap(&boot_cpu_data, i);
+			validate_and_set_cpu_cap(i, xcr0);
 	}
 }
=20
