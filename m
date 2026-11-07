Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065834;
	b=CJg6UDbxyGV5Wn3yhgs2KLK42WAkrRAtAyeyu9LVE+LYkWDnPs/U2ArmRR9nfxesJXH2
	 GdwmbY2b/oGJW9uNPBLEsLOc74KWYOYKmKyzZ0mmKrE38iuhVV3eNLwG/5qDKs9mRKroD
	 sMSqW0MUxKtgXzsX9QT1YJGQCLEsvxxQkjTLnpDCnlutisQK0IOLhvU8O2towV6pN49qF
	 sIR6fVEUXYxS7nnwEEx2gEMpUU/nzHtN4HyO60YliL4/OjdTVlaBK5bk3AZeUT7jr2g7w
	 cMFOzHD2qfZVYBPZ3ff0auIrMQFrX0KHf2mGadFYNjpB0aXEOcSD1/1tg2Gr3s+yKFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=;
	b=Wf9BVtiWKY1udq1oI4+Phs7hPXkSsiexO60tRgB/k8N4f50Ym8YCZSNy6pL8KUmrEKUo
	 49jcIMCXe1jUWPj3z2OFhKUU3gXgK448WlGg04myFzDWH1BWk85ZruNPKGyKqnttnpAEN
	 QjN8d7hrn2y4uujJgc9jZ/i51ZspFaagBqh8y35TobfNfIz4uUSjBACFE4iGJJkDr4goR
	 DgSGUCMducx/PRE9Hwm/0ba7I3QpXWHSh0D2kxd9r+OiXNvjnioCciwJrKppxUv1sgzxB
	 SdQklOkDPo9NNsQ4XWgPwNGXrFec0nQbClQ/LflOT4GYd/l3y83f0xSb1RavG1J9cRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l0U+Ne2A;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9575606D81E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9575606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l0U+Ne2A
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25edb54d22so223161966b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065832; x=1794670632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=;
        b=l0U+Ne2AXOvx7n2zSaA9xASIBTpTWMGiozx+msMkaVj6IkIeIzu2mIR073zlhBdgIY
         lvRd7F++qT8wpZxE/yL/7oBl7dJAVrwlJeJSi5DoryUtoIGBZKP3iM9Xv6yC8/M+ds0m
         tby/VmIRUv+9IMRcD1Y+BLqgIlqPGQF6C1M1R2fRPcgkamYThaap2tEUrTH/NwpKegMI
         2PVG/jbuAB4WkDJr6deSMYRCrSZsk4eTm643NVfQnYKWjHZ8UsjXCxvP8MLYmvY6Yqkg
         7PaLooWV+SpNscmTjxGNKfzfaW/BH48L8BS6dh9mCEJWzHgWskreTNYqilK87PBbQLM7
         SvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065832; x=1794670632;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=;
        b=xCyHFlMbdwbTEP9oX70UgvZF/HhVIsJH47o0SYv+AoDS34u3mPGMAxu3J6exOgQ9CZ
         DgYXo16mMTskgl4Pctn49vUFX6yRuu6A0ekyIUnPINaFMYy07CVkM0eo4JE1m369NfD6
         V1kp628UxFICFYWVJ+7CKpWl4fCvzggpHJijNaFHfqVNPn6tJPGa9r7l/rjlStYcymGv
         RcHg5r+Uq3noAIFBi5vRJGoihYSmGs6h+eWMHRl/AKw97F2AeJ5nhKWyL/tNrt5yYsLi
         1B9Z4PalrdNS//toq2256Bz9y5AvsHDB75kok+OGl+Rn9tE3zZrYRJd2LyJbOJJSg6wc
         4ENg==
X-Forwarded-Encrypted: i=1; AKwUvBwN8t6IdbRkO+d8WQQrzWIItO8bh1jsEK+UuwL6ahs5VmlOfQ2ksYI0r/qfjKHnad3IxrvSt/HkoHGTO40=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R/5tCmllA4DIQd3WrGD5iwtz/UrCnG6U82KTlvXBHtjgygt2X
	dSDY2mGP68DHTWT/I9M4cH76ZQXZn3oD5O6Pw81koTBjHOf6oHvIt4mCaVIzfvjfECoCvG8Ajf1
	t2w==
X-Received: from ejczw11-n1.prod.google.com ([2002:a17:907:e00b:10b0:c46:6df1:aa6e])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4788:b0:c41:1750:59a2
 with SMTP id a640c23a62f3a-c4d3522aadamr458981866b.12.1794065831931; Sat, 07
 Nov 2026 07:37:11 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:10 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-4-d84ea5f30f94@google.com>
Subject: [PATCH 04/24] arm64: Skip TCO on privileged uaccess without kMTE
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

PSTATE.TCO toggling can be expensive but uaccess_*_privileged() (used in
futex()) were doing it unconditionally when built with KASAN_HW_TAGS and
running on MTE-capable CPUs, due to mte_{enable,disable}_tco(). This was
unnecessary when 'kasan=3Doff', adding overhead despite the care taken in
mte_disable_tco_entry() to keep TCO set.

Instead, only toggle TCO if EL1 accesses risk triggering tag faults.

Name the new helpers by following the example of __uaccess_*_hw_pan().
Specifically, this favors a simpler terminology ("re-enabling MTE")
over confusing double-negations ("disabling the override").

Move the comment intended to document this out of a shared KASAN header,
to be next to the code it explains.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 17 -----------------
 arch/arm64/include/asm/uaccess.h   | 21 +++++++++++++++++++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 43510341b965..467d1d41a392 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -34,23 +34,6 @@ static inline bool system_uses_mte_async_or_asymm_mode(v=
oid)
=20
 #ifdef CONFIG_ARM64_MTE
=20
-/*
- * The Tag Check Flag (TCF) mode for MTE is per EL, hence TCF0
- * affects EL0 and TCF affects EL1 irrespective of which TTBR is
- * used.
- * The kernel accesses TTBR0 usually with LDTR/STTR instructions
- * when UAO is available, so these would act as EL0 accesses using
- * TCF0.
- * However futex.h code uses exclusives which would be executed as
- * EL1, this can potentially cause a tag check fault even if the
- * user disables TCF0.
- *
- * To address the problem we set the PSTATE.TCO bit in uaccess_enable()
- * and reset it in uaccess_disable().
- *
- * The Tag check override (TCO) bit disables temporarily the tag checking
- * preventing the issue.
- */
 static inline void mte_disable_tco(void)
 {
 	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index 9f5bd9c69c24..f0924dc0bd64 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -16,6 +16,7 @@
  */
 #include <linux/bitops.h>
 #include <linux/kasan-checks.h>
+#include <linux/kasan-enabled.h>
 #include <linux/string.h>
=20
 #include <asm/asm-extable.h>
@@ -132,9 +133,25 @@ static inline void __uaccess_enable_hw_pan(void)
 	asm(ALTERNATIVE("nop", SET_PSTATE_PAN(1), ARM64_HAS_PAN));
 }
=20
+static inline void __uaccess_disable_mte(void)
+{
+	/*
+	 * Unlike get_user(), privileged uaccess (TTBR0) uses TCF (not TCF0)
+	 * such that a bad user address tag could trigger a kernel MTE fault.
+	 */
+	if (kasan_hw_tags_enabled())
+		asm volatile(SET_PSTATE_TCO(1));
+}
+
+static inline void __uaccess_enable_mte(void)
+{
+	if (kasan_hw_tags_enabled())
+		asm volatile(SET_PSTATE_TCO(0));
+}
+
 static inline void uaccess_disable_privileged(void)
 {
-	mte_disable_tco();
+	__uaccess_enable_mte();
=20
 	if (uaccess_ttbr0_disable())
 		return;
@@ -144,7 +161,7 @@ static inline void uaccess_disable_privileged(void)
=20
 static inline void uaccess_enable_privileged(void)
 {
-	mte_enable_tco();
+	__uaccess_disable_mte();
=20
 	if (uaccess_ttbr0_enable())
 		return;

--=20
2.56.0.455.g6c5a503b38-goog

