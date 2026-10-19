Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282733D6F7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375123; cv=none; b=Pl0pWg8VD7KdhIoR+8FapzdB6aUY3UepsCA6l59beFzgzckkV5caWm9wLmcSgmmPsp+x5MhzdyWOPvvpRrLQRBkCDUKyqmTVw1xDNJkGrO/PDIbBaeGVcxlYFVYRDHneufSC31pfO5kyUjEjutcIZD4H7penfJzREii3/vf91Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375123; c=relaxed/simple;
	bh=J5mMuI/2gP0v9ch0ANotvYhKJbiRS7t/s9fMyFsvGlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnP4D6SP1Qvp9k9DpXiANpfM6fShdKAXRnGm80LdqqWhuiMg3D3Xxn+jIvPqQt+n1nJuG493RiX+b+J97C9Q/goP3tn2rq6UgGiS5f/qQoUxKH0ndN1I/82qlFTdJVTBy2SnZhubXBGYAjcmS3J4E7qZ7m5GXFyQCO9Uph5HmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEm+MKtx; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEm+MKtx"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15168a20b47so505972c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375120; x=1792979920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX3gFXGtK0qFC1+jmqNQ0ZBmFVgyc6CU75RzS6mT9B0=;
        b=hEm+MKtxGYdBQVuoQgTh2WX0Qa0qpPJ96tGhdiMZijcVuKqWcUXJukO24kGlJtGQEv
         MVoUQ7B/kzItelKX7K1NFaQ3F9zVcqEW+P50ei1uqv8YgBbl4iEeWLw/bdFfPFWXOGFJ
         e28i6BB+2w/qbWoWARaJvQOE4axLFJHuhO4nuKNzXUy/j7fjL9721/eKTBi+9mPPRPqV
         +2Wo3jE21ypjO6F2tfwQqMBlr1U1X+NDZXDikosaZWjfmDAXDxhyrf8aUcQZexT/kid8
         Cb+aymvn3O6EiAX2KdlRV7+22yqA0N316FiFJ156HqNQDUA/vkw92ZkrkAvmgPIeP/kL
         WN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375120; x=1792979920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX3gFXGtK0qFC1+jmqNQ0ZBmFVgyc6CU75RzS6mT9B0=;
        b=IfnhMwCYhs3KVghSPYt9sCiN59xOEH+Np7Ua0up5u0dv9fL8Pqy/PSa6IinIyXtuXp
         0t7Z/JX1VbXyPJp4lQaXk1WSlF8Va4ua2fcVZc91xwGDOwmsO+evfph483dS1mZ4YP0/
         YClEIIu/8+ylP6184lQHd/mf4ybP+gC5fHG1rhGXlny7aYgb903r206tLyxwHQDi3x+u
         K2WH6hLNXAu322EqG5lRUDRUSp7LNjy0JmTWdOPEJsxugOJ6HFOtcnYCz2NpgRBfgxAt
         Ng21EtFJso8WZqVpqlAS+oh4v3LXyfsRJahzT1KlpI49eS6I2YYOE51dsMM50liBcQ1p
         f81g==
X-Forwarded-Encrypted: i=1; AKwUvBxhyUFsH79Kh0mUYV+pObNX/dSIVTBBEpQiI1lB+rIa+RUbjJmJOG0taF+y46YDlKmpgUbrKJ+14T4889I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/nugzeCSA81eQwu6EaMS2QtTIFn+d/1LkUmffJdlA8tx6RwNI
	fRBQ2bxh1S80I0TNWr66eXp5LepOamhU0u7/PFnXacyDoLfg5zToh/Hx
X-Gm-Gg: AYBFou1tx9AVLA3O2lbN4Yvbk0TT0m7FpqPjVCd+SQAc0VwTFd7Tl+ao15rpI/EUAC4
	bCCOG/cHHjVjqhu+QV4eyaRr02ZUv0G1WfxmULtXU0i+etLDQNbr9r+JpjJQ0dmMnWK4UJf5GMd
	qQztKT5PwfaNMdDMrQK715Pao1L+MTuRaVEwQLWGvDEoAjIx77+m6Ba8rARzi/Pf95J+616orjC
	n0V62Qu7GctdQTokR1u42mPS2p7YNxcFjFKnnqbLX2QCJ7uGo/QAfF1y0JZSmUvE6CVirtf8v2N
	qt3WfgJAlXlNfY5pGYQYq3BA9p5Pt9LLf6Ob/e0ZrXiSdbANJK9/6Y1+5uj06+GjtL+1CX4rQI2
	raRKU+xP+jrFC8orEU8A5dUgBXOoOv4PktLgbU0Nqui3HouLZ7+UEfAGbDZiZnroeA/WPB/yFMW
	N0jdltX6IF4DKIeaasOr7MEIJC4OsNdYXUF6a/fhitOfJi95X5qYw8yDsB3VIkaohIdA==
X-Received: by 2002:a05:7022:b057:20b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-18ad0b5ffc8mr1432273c88.19.1792375119985;
        Sun, 18 Oct 2026 18:58:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:39 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 09:58:10 +0800
Subject: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
does the word loads of the dcache name compare and of path name
hashing.

None of the KASAN test cases reads memory through it, so nothing
noticed that KASAN did not check these loads at all.

Add a case that reads a freed object through load_unaligned_zeropad()
and expects a report. Skip it with hardware tag-based KASAN, since
arm64 turns tag checking off for this load:

  kasan_load_unaligned_zeropad, x86_64, generic KASAN
  without "word-at-a-time: check the first byte in
  load_unaligned_zeropad()"                                 FAILED
  with it                                                   PASSED

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/kasan/kasan_test_c.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index b9e167ed5be32..c791512f6fc49 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -28,6 +28,9 @@
 #include <trace/events/printk.h>
 
 #include <asm/page.h>
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+#include <asm/word-at-a-time.h>
+#endif
 
 #include "kasan.h"
 
@@ -1673,6 +1676,26 @@ static void kasan_memcmp(struct kunit *test)
 	kfree(ptr);
 }
 
+static void kasan_load_unaligned_zeropad(struct kunit *test)
+{
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+	char *ptr;
+
+	/* The tag check is turned off for this load on arm64 with MTE. */
+	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_HW_TAGS);
+
+	ptr = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
+	kfree(ptr);
+
+	OPTIMIZER_HIDE_VAR(ptr);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test,
+		kasan_int_result = load_unaligned_zeropad(ptr));
+#else
+	kunit_skip(test, "Test requires CONFIG_DCACHE_WORD_ACCESS=y");
+#endif
+}
+
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
@@ -2264,6 +2287,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kasan_alloca_oob_right),
 	KUNIT_CASE(kasan_memchr),
 	KUNIT_CASE(kasan_memcmp),
+	KUNIT_CASE(kasan_load_unaligned_zeropad),
 	KUNIT_CASE(kasan_strings),
 	KUNIT_CASE(kasan_bitops_generic),
 	KUNIT_CASE(kasan_bitops_tags),

-- 
2.43.0

