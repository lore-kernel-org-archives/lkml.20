Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065844;
	b=tYFfkjg0icVHVkrOtNRfoxnxm5oKJ1l1ZqaxPN6g6CtWOj9ZfQ/PZDUVZEN5q8v951EL
	 0UQ+rBLa9tBAurnLZnpbUCMpXUArUDrDesUwykW6abRVi5HhMEhnczIPQlGL7ocgTELze
	 0mN+M3D5zOoPWxKQAAKLSZB+mUyI68gBqYiEAMPfvCAcWAlYjEcLCFyIZ4IWwUi7MqQL9
	 cpHF4td4HbHsfuDbQmjRXLI5kXJttq7DTavqsyY+jJ2JXTfvnStFegIECDIc8YuYQsOvZ
	 +/ffasqmwdD1BHE+SDwp9QyfobwNkmsN4ELrqE9G/M8YjAswdJZTTepHaSp9AcL/biQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=;
	b=ONBiAsOwgvFogtomSGS0s5xwhOabtB6XXGbRDxdPKaWKYxymBJXo6vW6294K+65zC17t
	 FvyxlatqNPtgpU2PuUEcWl1fJQS/avHZcXG6dVjAZzx7CoUx5vn9YmBXPxa/hTSKreUq9
	 5ikzHTg2Nzp3yAhEfkIWOEgSv3mGtmCwjflyqYu0ugWfB/mByzb4VYtceYZIZJ4+3Zqzw
	 f3P9UwrbeyHC2EuJ7qLkaEktfEhi1NbNLwuP8HaO22WEQtYrHVGYdXzUqRjGa7Gz0eCmH
	 C+dizGw5k5qOME6I4negpxsCIMaMscUe1Kq9oxUMLwih4Zgu0ypXGi8eL20VzRoPylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A4bV+ApY;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9746082BCA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9746082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A4bV+ApY
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b5e0ce4132so1484077a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065842; x=1794670642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=;
        b=A4bV+ApY053BLbS36Vpsgvyn3ZoTMtnWfk7aant8xnWMrhZstgBtJRyDwMsr1RGdz3
         HWCEMvqdYKTeZthdNLUz1lFSvzNQBeS9j4Wpak1aFCxXnzH9NAgA3eZY2GGAgHSeu75j
         nNUazhy9bldc1E5eEbwCz1x1n7ojWW8PpVWlgpquaq9f5EadeZbYgS7/2mKBwEYjvRoJ
         6IvzkBvuOdDPK7ic1frhrjXlgBoYvSeJQsNj6UrHH0md25zalIr0RUlMcGTQyJV/DzcE
         5RKsZfc5NzI8ZC80GoSR790oOxvPYOiRFaRHVbZP2yJ7tU710pc4RPSBz05UIYnBmy9k
         c/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065842; x=1794670642;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=;
        b=gHotwVRKJmuxJ2Y00Svixay8aECP5EXYXiXWZPvo88xZ+i4kZxGIa/KElafzz8ZxE+
         cnDeF75JSH9mD18KK85AYgEEoetu2SHxDz9NI2vQCdqSCSVkukv7+wV7vKDFXeQKO0f9
         RWIMTKa/yuNPN4isQk0nIR4d5EUlr/Jv5NeFfRc37k13sjlfl6tUsDSe4Ms2zj+xajeM
         pjHl/ECnIOtjeaVFscXBdmS0K+mwbRq0ogBkJaZT8i46QpsMNEW5kQKvlyuilBWHvqwD
         gDtMFfifi29ZYnPBnHCaZSdbUZXxtluZFPnHhN0nWCbKZ23RKfFs4DD3z1Uyh9vvdh6S
         4B4w==
X-Forwarded-Encrypted: i=1; AL+hErEOGvCZc8kpyltiDO60fITDHFy0n26LiVG77iCrhF1O4YRAJWU6QhOvrBiU39oYTLpOK82SfzjTCdsDfEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tB6GcfMwSedyzqx2bX7se3kqGPZMo8QPUX9BZqRVfMItErcCJ
	HmoxvplhFV713GdDuFG7rwlQEyxtSGbDOcUr4eVlFIibZAyAj4MQQJFcgIi/OHa5pkrYpGPqwre
	aoQ==
X-Received: from ejebc11-n2.prod.google.com ([2002:a05:6938:e08b:20b0:c41:2fad:5f39])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:dc8b:b0:c49:cdc8:10cf
 with SMTP id a640c23a62f3a-c4d35531e7fmr425425766b.40.1794065841807; Sat, 07
 Nov 2026 07:37:21 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:16 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-10-d84ea5f30f94@google.com>
Subject: [PATCH 10/24] kasan: rework hw_{get=>set}_random_tag()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

With MTE, the IRG instruction tags a pointer in-place, so that

    set_tag(ptr, hw_get_random_tag())

can conceptually be synthesized as a single "IRG %[ptr], %[ptr], 0".

However, with the way the API is currently defined, we confuse the
compiler into generating a random tag with invalid address bits, to then
bitfield-extract the tag and shift-and-mask it into another pointer.

Furthermore, every single (indirect or direct) use-case for a random tag
in arch-agnostic KASAN ends up passing it to set_tag(), which likely is
an indicator of a suboptimal API design.

Therefore, make the function clearer and more optimization-friendly by
directly taking the pointer to be randomly tagged.

Update the only definition (in arm64) accordingly.

Intentionally keep this patch minimal (and limited to KASAN_HW_TAGS) to
reduce its associated risks and make it as uncontentious as possible. A
future patch will refactor the arch-agnostic KASAN code to enable the
optimization mentioned above.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h    |  2 +-
 arch/arm64/include/asm/mte-kasan.h | 14 +++++++-------
 mm/kasan/kasan.h                   |  7 +++++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 8e751b56d20c..29e7537f5e58 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -317,7 +317,7 @@ static inline const void *__tag_set(const void *addr, u=
8 tag)
 #define arch_suppress_tag_checks_start()	mte_enable_tco()
 #define arch_suppress_tag_checks_stop()		mte_disable_tco()
 #define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
-#define arch_get_random_tag()			mte_get_random_tag()
+#define arch_set_random_tag(addr)		mte_set_random_tag(addr)
 #define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
 #define arch_set_mem_tag_range(addr, size, tag, init)	\
 			mte_set_mem_tag_range((addr), (size), (tag), (init))
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index b474fca3ea56..17e4155781fc 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -73,14 +73,14 @@ static inline u8 mte_get_mem_tag(void *addr)
 }
=20
 /* Generate a random tag. */
-static inline u8 mte_get_random_tag(void)
+static inline void *mte_set_random_tag(const void *addr)
 {
-	void *addr;
-
+	/* Writes the random MTE tag in bits [59:56]. */
 	asm volatile(__MTE_PREAMBLE "irg %0, %0"
-		: "=3Dr" (addr));
+		: "+r" (addr));
=20
-	return mte_get_ptr_tag(addr);
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, mte_get_ptr_tag((void *)addr));
 }
=20
 static inline u64 __stg_post(u64 p)
@@ -190,9 +190,9 @@ static inline u8 mte_get_mem_tag(void *addr)
 	return 0xFF;
 }
=20
-static inline u8 mte_get_random_tag(void)
+static inline void *mte_set_random_tag(const void *addr)
 {
-	return 0xFF;
+	return (void *)__tag_set(addr, 0xFF);
 }
=20
 static inline void mte_set_mem_tag_range(void *addr, size_t size,
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index be5dcf6b052c..0df7daee1864 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -433,7 +433,7 @@ static inline const void *arch_kasan_set_tag(const void=
 *addr, u8 tag)
 #define hw_suppress_tag_checks_stop()		arch_suppress_tag_checks_stop()
 #define hw_flush_async_tag_fault()		arch_flush_async_tag_fault()
 #define hw_enable_tag_checks_write_only()	arch_enable_tag_checks_write_onl=
y()
-#define hw_get_random_tag()			arch_get_random_tag()
+#define hw_set_random_tag(addr)			arch_set_random_tag(addr)
 #define hw_get_mem_tag(addr)			arch_get_mem_tag(addr)
 #define hw_set_mem_tag_range(addr, size, tag, init) \
 			arch_set_mem_tag_range((addr), (size), (tag), (init))
@@ -469,7 +469,10 @@ static inline bool kasan_write_only_enabled(void)
 #ifdef CONFIG_KASAN_SW_TAGS
 u8 kasan_random_tag(void);
 #elif defined(CONFIG_KASAN_HW_TAGS)
-static inline u8 kasan_random_tag(void) { return hw_get_random_tag(); }
+static inline u8 kasan_random_tag(void)
+{
+	return get_tag(hw_set_random_tag(NULL));
+}
 #else
 static inline u8 kasan_random_tag(void) { return 0; }
 #endif

--=20
2.56.0.455.g6c5a503b38-goog

