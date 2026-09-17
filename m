Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95A381AEF;
	Thu, 17 Sep 2026 02:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610419; cv=none; b=BN1d1klQnYUVn1N9DN971F7WfZ1QAogZX49lRGikE5Pded86KaRnSlsAr3ZDj7avUAKhkyIxI1weMk0j9hPURcoU8mSkReDXqVmkkIRGnx1F4/laQFueDnEKfjtlIv9IGqlhzjxwrLwBLlu6Ong6bddCqYxSa030bTmc4eD7uJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610419; c=relaxed/simple;
	bh=OF5egg613kqHktq3U/BVNDWvMYfT6D9PmggBvDcJyQQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=say+oA3DI1n5kPyzCz8YFMhHajHqSYBfXXmmdkxBQ3KnTya7XydkpSh2gm2nyIOUshKD52mRTSeEKakbQ41dkGNoTHem73N4gaLaWwiPXUbTIVp72uvLMWbcy3xhpAkNvZVGzgRDlzp73v+t3ro8v3D9Q9asNzBWjEwqSr8LYB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XGDoWU+0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p0XbBmLU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XGDoWU+0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p0XbBmLU"
Date: Thu, 17 Sep 2026 02:00:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789610415;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+hKVuXXQ0qrGZGC8vllWdfa2h46zE/QH6KhtE0IQZA=;
	b=XGDoWU+05zf0KUcTMO4g+SjTGIYv7BrR72V7Ky3P5bxb6rY0ophQsJI3sy05zIn9sQ+j9+
	d+XN1hDfkcwOxqLvfV/Iy6paxE+mDNzt0egXh/M/dls4smUOLWLvkJyVD+Bva5FnSNYIAa
	oJc0N7+sw5qIO0zRDiU6bvedWEU+1YeX+JX1H8AWxKPXcmrHgF06yTJMSmXuXJHkDolW2/
	6DRkcgidABBA8ZHUWEh74n5W8PhJoPBti59TkBn2x/1AiekwVqR8nqKGbLWpTMr0Qp/TFh
	XDyrL+ZqPva2sg2Lajbel+l92NVW6KWiyxGExC/o9XL0VtjaNnDjWmX5dDYN8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789610415;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+hKVuXXQ0qrGZGC8vllWdfa2h46zE/QH6KhtE0IQZA=;
	b=p0XbBmLUDz5ChKkQJubjDCus8X2dBXgu3YBXo/7zgiTIQKolbEgqR7yHjuPbw4wCsOMmPq
	4GBv0a6WBJzYbyBQ==
From: "tip-bot2 for Ihor Solodrai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/cpu: Factor init_cpu_info() out of identify_cpu()
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916195203.1099646-2-ihor.solodrai@linux.dev>
References: <20260916195203.1099646-2-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178961041342.1720534.13720266956954176734.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     54a2882ab9f75ab8a77a4f113145d4d709d2387c
Gitweb:        https://git.kernel.org/tip/54a2882ab9f75ab8a77a4f113145d4d709d=
2387c
Author:        Ihor Solodrai <ihor.solodrai@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 12:51:59 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 01:54:28 +02:00

x86/cpu: Factor init_cpu_info() out of identify_cpu()

identify_cpu() unconditionally resets the struct cpuinfo_x86 fields to
their default values and clears the capability arrays with memset()
before rescanning the CPU to fill it in again.

However the boot CPU capabilities have already been scanned by
early_identify_cpu(), with interrupts disabled.

Introduce init_cpu_info() helper in preparation for letting the
callers decide whether the reset is needed.

No functional changes.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260916195203.1099646-2-ihor.solodrai@linux.d=
ev
---
 arch/x86/kernel/cpu/common.c | 51 +++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3716a6a..173748a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1784,6 +1784,32 @@ static void __init cpu_parse_early_param(void)
 	}
 }
=20
+static void init_cpu_info(struct cpuinfo_x86 *c)
+{
+	c->x86_cache_size =3D 0;
+	c->x86_vendor =3D X86_VENDOR_UNKNOWN;
+	c->x86_model =3D c->x86_stepping =3D 0;	/* So far unknown... */
+	c->x86_vendor_id[0] =3D '\0'; /* Unset */
+	c->x86_model_id[0] =3D '\0';  /* Unset */
+#ifdef CONFIG_X86_64
+	c->x86_clflush_size =3D 64;
+	c->x86_phys_bits =3D 36;
+	c->x86_virt_bits =3D 48;
+#else
+	c->cpuid_level =3D -1;	/* CPUID not detected */
+	c->x86_clflush_size =3D 32;
+	c->x86_phys_bits =3D 32;
+	c->x86_virt_bits =3D 32;
+#endif
+	c->x86_cache_alignment =3D c->x86_clflush_size;
+	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
+	memset(&c->cpuid, 0, sizeof(c->cpuid));
+#ifdef CONFIG_X86_VMX_FEATURE_NAMES
+	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
+#endif
+	c->extended_cpuid_level =3D 0;
+}
+
 /*
  * Do minimum CPU detection early.
  * Fields really needed: vendor, cpuid_level, family, model, mask,
@@ -1968,8 +1994,6 @@ void check_null_seg_clears_base(struct cpuinfo_x86 *c)
=20
 static void generic_identify(struct cpuinfo_x86 *c)
 {
-	c->extended_cpuid_level =3D 0;
-
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
=20
@@ -2013,27 +2037,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	int i;
=20
 	c->loops_per_jiffy =3D loops_per_jiffy;
-	c->x86_cache_size =3D 0;
-	c->x86_vendor =3D X86_VENDOR_UNKNOWN;
-	c->x86_model =3D c->x86_stepping =3D 0;	/* So far unknown... */
-	c->x86_vendor_id[0] =3D '\0'; /* Unset */
-	c->x86_model_id[0] =3D '\0';  /* Unset */
-#ifdef CONFIG_X86_64
-	c->x86_clflush_size =3D 64;
-	c->x86_phys_bits =3D 36;
-	c->x86_virt_bits =3D 48;
-#else
-	c->cpuid_level =3D -1;	/* CPUID not detected */
-	c->x86_clflush_size =3D 32;
-	c->x86_phys_bits =3D 32;
-	c->x86_virt_bits =3D 32;
-#endif
-	c->x86_cache_alignment =3D c->x86_clflush_size;
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
-	memset(&c->cpuid, 0, sizeof(c->cpuid));
-#ifdef CONFIG_X86_VMX_FEATURE_NAMES
-	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
-#endif
+
+	init_cpu_info(c);
=20
 	generic_identify(c);
=20
