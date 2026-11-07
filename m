Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065842;
	b=Zha1Y/GKvEwiZLIrnusBzLSjfdeVvGwljGVORD2ktcN9xu3+S4vVJFfxfDQRIfwnmtgy
	 bp/QT9TaJWmT/4wOgtwKuI1uhvP9J502/zMnJ9YXzQVJdRutiWhpJgD0PhSC67o0zQrUQ
	 Y8aPmhybfJma9mQLn4p83FdVTZtJmKnViod9pSIp6V8N2X055vj3AdugbWfgurKI3pr8+
	 XoiBWZCbXwALOqOIJwVWMTjMHdxIwonXrAJYUlMRhkzRmu7lYjWoE5kZ9tZ0RREu9ATPC
	 mF9nd7YW2YGdtZBOcVxa6R/ASYHH/HpRJz9mk1YGl9PxYnYDpcEsCXicJR6Kg1DM53Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=;
	b=jhCyp3GHaw2PHXt1wS0vcxrOMvnoVhuckt4G5qCtg3LHkiZH6PdLRNkQupN4SM38s6rB
	 6AOpdmGALFUrLcZl55bc7EvMbiQ45sopQbIFXOTYrs10hlIVaC7HPpMx4qNWLE57AFsBB
	 HFMkT61JEjXQr+iHMeghYwfzpeKI+SWSuYz+wGmYkqUkx8oD8BFpXUQPAcJF8y2MRAe/B
	 aif6dqAog4hAp55EAkBlNw/SC579sqpz08BK3IKhlUrNmrJZmnHMEb2l2YZTe4dJI6yfk
	 VpCFhvAC5WaGyk2o/cGa8bNvme/eSngyOUajFSQr7b/asfPBew9gPo6OHP8ZruV6CkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XTidIXuK;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C60606EEA5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C60606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XTidIXuK
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29c391bd2fso166006066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065840; x=1794670640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=;
        b=XTidIXuKEj7vJeeW7dS54k26C0uM557FP7KnMTs6G6mVBhK57W/v7quFWKu5v/deII
         owPcVXaqKSNjcU5Kx4KjOJ2NyBORhHuvHA/yotZTgwJ4X7cW9ZMdKLn0nFIZNucx6ZSW
         IBz0ON6dtJTQn/AY2REfDArC+zyJ/zXXAYUk8LWtsO2mp0Bp3jSdbDXfvtqJDoNJExEi
         bmx2ctq169FLllKQG+gnN7bEaMAs4Ulajzcfc7G2PzOH7zR+qA5slvctd0nFpZY6HtTE
         mWH6o8bNl06CZNybpyvnrDd1b0kwBZEw6wdFbuzIxH/JMxc22R+xoM8Jgtbh7FPwnOfD
         sS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065840; x=1794670640;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=;
        b=k0SfkfGA8gi5EvQCMNcORTaEKKnA94wPX2UGtPqV1oxFEnH9qulB8VfJ8FDegk/I7c
         Tx7UCjlnudgRVcQNzL6yb/ULLoNEtEBAiIPhjUCrBq6s3VKaFtbq00RZvskowThNr1IN
         umjnxG+zqnp1UsNFPmkxQEO52k53tp7rfJR5hmQEI2AwQyTepA5mdEmFTOL6LEOYpA0l
         auRheMLdH1DRqLrXpvyEPNJCSjETme6FKw7xQ5C6cdtnZjV9j29oEFvyZrU9g/Mgym6t
         SiQK2uARiJ4I9oNsU/X82orufC4+p1kEbfSBdWyZnYiufjf0CYUfwfJxgq7+YgH4OGGH
         TJwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVXOa0uV/fGzUw61L9ZuY90R3vjZNvrukz2LeWLNZGgtaVdBDM+hXuKw5B87Hm8EIk3pYxQDw1wBT4tSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z90oowOphAFviMlFjtjRXOLvoMFk3lo6+lOAOMFS5Wkl9TeU4dO
	0HtoCFeJ3nsP+z01eycEuIiSQQsyGHxeIw7pzyusaq61WBaASMpGICwz6Yco5NG7xuwQiZ9Ntmu
	53g==
X-Received: from ejblu34.prod.google.com ([2002:a17:906:fae2:b0:c4d:356c:195b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:9fd0:b0:c40:80eb:c54e
 with SMTP id a640c23a62f3a-c4d3449c0c7mr421982466b.4.1794065840288; Sat, 07
 Nov 2026 07:37:20 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:15 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-9-d84ea5f30f94@google.com>
Subject: [PATCH 09/24] kasan: rework hw_{force=>flush}_async_tag_fault()
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

Separate common arch-agnostic KASAN policy (fault reporting) from arch
HW details (fault flushing) by reworking the function's signature.

Update its only definition (in arm64) accordingly.

This resolves #include challenges arising from the circular dependency:

  mte_check_tfsr_exit() =3D=3D> kasan_report_async()
    kasan_report_async() =3D=3D> <linux/kasan.h>
      <linux/kasan.h> =3D=3D> hw_force_async_tag_fault()
        hw_force_async_tag_fault() =3D=3D> arch_force_async_tag_fault()
          arch_force_async_tag_fault() =3D=3D> mte_check_tfsr_exit()

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h | 2 +-
 mm/kasan/hw_tags.c              | 3 ++-
 mm/kasan/kasan.h                | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index a2b7a33966ff..8e751b56d20c 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -316,7 +316,7 @@ static inline const void *__tag_set(const void *addr, u=
8 tag)
 #define arch_enable_tag_checks_write_only()	mte_enable_kernel_store_only()
 #define arch_suppress_tag_checks_start()	mte_enable_tco()
 #define arch_suppress_tag_checks_stop()		mte_disable_tco()
-#define arch_force_async_tag_fault()		mte_check_tfsr_exit()
+#define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
 #define arch_get_random_tag()			mte_get_random_tag()
 #define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
 #define arch_set_mem_tag_range(addr, size, tag, init)	\
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index a848eb2f9910..c4772eebb80d 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -428,7 +428,8 @@ EXPORT_SYMBOL_IF_KUNIT(kasan_enable_hw_tags);
=20
 VISIBLE_IF_KUNIT void kasan_force_async_fault(void)
 {
-	hw_force_async_tag_fault();
+	if (hw_flush_async_tag_fault())
+		kasan_report_async();
 }
 EXPORT_SYMBOL_IF_KUNIT(kasan_force_async_fault);
=20
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a54766..be5dcf6b052c 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -431,7 +431,7 @@ static inline const void *arch_kasan_set_tag(const void=
 *addr, u8 tag)
 #define hw_enable_tag_checks_asymm()		arch_enable_tag_checks_asymm()
 #define hw_suppress_tag_checks_start()		arch_suppress_tag_checks_start()
 #define hw_suppress_tag_checks_stop()		arch_suppress_tag_checks_stop()
-#define hw_force_async_tag_fault()		arch_force_async_tag_fault()
+#define hw_flush_async_tag_fault()		arch_flush_async_tag_fault()
 #define hw_enable_tag_checks_write_only()	arch_enable_tag_checks_write_onl=
y()
 #define hw_get_random_tag()			arch_get_random_tag()
 #define hw_get_mem_tag(addr)			arch_get_mem_tag(addr)

--=20
2.56.0.455.g6c5a503b38-goog

