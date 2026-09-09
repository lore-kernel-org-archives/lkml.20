Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D40582BA5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971610; cv=none; b=MeK8ArSrPFlz9/AHyzvo9hsDTcO31WGrQcFXOqxkxvscTDRgWruKSmrQRYV9au07pnjsxyLsmGP27sdeN/UQJmuJ0si+BdhNuyUarzl3YKzDRoR2zSkiGoYcKhEMnSekBoqvTsbhqTV06gwnK5FL8tVBDyD9jivjAdV47ysT5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971610; c=relaxed/simple;
	bh=Zb22GaGbRhopfYeJUI+9j456YQOkVoQCe1lrRewUaEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pEVLVv6Xwz34keN1WGrbzKXsFz7rXDAa7PjmIc0NpBwOThHHo0xcpd9iVXeMo86bitiywRzCqAtduxytNYFxssLAITC5yD//+ugjjxmlVtjubpHTIf3Aj/S2grUicIrlK99MEaGHGmcmox8ohVHr22RcD3owCGNdoE1AOGKE3XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S7JS0Vty; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S7JS0Vty"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so5206192f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971607; x=1789576407; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEDz6/RueJDQSwY6RDBaKtCBKg56j+hFHYBq38ixiTA=;
        b=S7JS0Vtykj/XRhEHfxcqLA+pJJGG7CI3UQbQndLtHqYRkhREIxZl5cNLcqAy5Mi32e
         j1pvhdzGcmemPiBakX6i2coK6/gyWPm7f+ADK+StLUCnMrRQZr2NEIdah39KR/KREcFg
         IVPtrUfpfqceDDCFK6Gpov7lh52izZvAvaT+hUorqUytBvueSBTEH25L5U7WT5GOn9w2
         YxaFy7sCwkON623DH25i9mgaKsUDGczwFwWuhw9Btv4dmgwEH37QHICbZnm2VY9e4379
         /CYJuZnltxNr/Ox8Iy8jyJp359vq/fPTA/rQbFA36YSC3vgeCfiG1i8ueue9mlJ8PMLr
         12mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971607; x=1789576407;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEDz6/RueJDQSwY6RDBaKtCBKg56j+hFHYBq38ixiTA=;
        b=FWiYz1L8O4v4mmU3c7JEC5YA7Nc0ax38GsjOjbCtxiX5sotVRj58on1SAmlUuiUkG9
         aK7FXsG4jjPeX2SYN7EjTRd0sHgkXhFKXMyRjH6THcNJ9/sa7KgCEymEsdRlG/FpJmXo
         0b5V8nXnKgf7DtFWpRWbKpAOp0AY5beuoT/UxmpttIhiTWi512bMh6KpF0U9tnrpmJMV
         dRFmvvl7MS1hzGRRdbdlqD1n7BBiPACaAf2k7V2cgEIotdT97+JE7/2sZGn5HSRN8m1g
         XIWanROok0xbYcQVQV0fPiEMDozUbz0SvFdIsLEvUqSib1GXZgQcmL69yJOPThWVQeK1
         mW2g==
X-Gm-Message-State: AFuF++l2mJ+yDGohA6xtUoZLl7frPIZuBWkRoJ0gJF0bj5eqFyokT+QE
	E4NBKv5fc5HvJTOtJNyHFKPpFTvjXBg7wcUEanb+gHNTUIx+CTk/tnJLdfawOvzRQePStkoXBg=
	=
X-Received: from wrbes13.prod.google.com ([2002:a05:6000:44cd:b0:484:3663:d996])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40cc:b0:485:8393:215a
 with SMTP id ffacd0b85a97d-4858703f4bamr40073275f8f.5.1788971607084; Wed, 09
 Sep 2026 09:33:27 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:22 +0200
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909163319.2116279-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=ardb@kernel.org;
 h=from:subject; bh=VFd3n5XWAvyNP0BemPakDTs/m7Yonl3YbzM8kBIsNGE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV9CEBsd7tl/SVKK31t74xlEjtNvq4c5TzeYcUTfeL
 tWf3uXWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaib8bwV1pw1zOX5NfazneO
 eL59c7fcZGdmUs3uqvv3k5xTr0kn5DD8d/YTt25IUH8dd+Tyofgl4qv4mS0S7eV9BUK3W/dZHpr LDgA=
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-6-ardb+git@google.com>
Subject: [PATCH 2/2] ARM: Remove hacked-up asm/types.h header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

ARM has a special version of asm/types.h which contains overrides for
certain #define's related to the C types used to back C99 types such as
uint32_t and uintptr_t.

This is only needed when pulling in system headers such as stdint.h
during the build, and this only happens when using NEON intrinsics,
for which there is now a dedicated header file.

So drop this header entirely, and revert to the asm-generic one.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/uapi/asm/types.h | 41 --------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/arm/include/uapi/asm/types.h b/arch/arm/include/uapi/asm/types.h
deleted file mode 100644
index 1a667bc26510..000000000000
--- a/arch/arm/include/uapi/asm/types.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_TYPES_H
-#define _UAPI_ASM_TYPES_H
-
-#include <asm-generic/int-ll64.h>
-
-/*
- * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
- * unambiguous on ARM as you would expect. For the types below, there is a
- * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
- * and the kernel itself, which results in build errors if you try to build with
- * -ffreestanding and include 'stdint.h' (such as when you include 'arm_neon.h'
- * in order to use NEON intrinsics)
- *
- * As the typedefs for these types in 'stdint.h' are based on builtin defines
- * supplied by GCC, we can tweak these to align with the kernel's idea of those
- * types, so 'linux/types.h' and 'stdint.h' can be safely included from the same
- * source file (provided that -ffreestanding is used).
- *
- *                    int32_t         uint32_t               uintptr_t
- * bare metal GCC     long            unsigned long          unsigned int
- * glibc GCC          int             unsigned int           unsigned int
- * kernel             int             unsigned int           unsigned long
- */
-
-#ifdef __INT32_TYPE__
-#undef __INT32_TYPE__
-#define __INT32_TYPE__		int
-#endif
-
-#ifdef __UINT32_TYPE__
-#undef __UINT32_TYPE__
-#define __UINT32_TYPE__	unsigned int
-#endif
-
-#ifdef __UINTPTR_TYPE__
-#undef __UINTPTR_TYPE__
-#define __UINTPTR_TYPE__	unsigned long
-#endif
-
-#endif /* _UAPI_ASM_TYPES_H */
-- 
2.55.0.1003.g10538fe699-goog

