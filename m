Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720220;
	b=ynO2SnJkZJ+lETha+qaJtQw17NuIOlocL7ydpLVL0VNKdZdnUy2ltF1s0kW+vVjojIXI
	 JnrjUFlTpamg71igcVlaH+fADMlj9HXV9SqFIyedaK4rOU8pJyF1c0y1gLsLkKcTPPOX4
	 OX22clvLLZusakHGgPL0glS5f/DDxblhJ/XmHIF8cKYYVumubbRfjzGwKPV5gM9xMSoBG
	 CXFvT5fP25AJO+sl/R3kTs0Mn4Z2QxWm5fyGXaKm2wc8ypJ9+DhE76/EgEJICyUNe/u0+
	 Gg9UvWtXYgQHeUzA/9eoTc0EWAlJ2LSb3YsRwR0P/L8AyfuJPLcUdE1DZJ28zcqshGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
	b=YaydV/U/WvVbD47vTFPM1SWFl//rw588tZjyVACD3FKGSmsyvAZXvHrLdyDlIf23JlZX
	 UAByPAb1DhBjWqIIl9Gkyp6GDpTZDRXHxQuf6lz4OkQsXiiCI81aLm0AuN4CEhg+TOd5n
	 e9RPaknIo16ISD9EgutXx7cTkV9LdkQTYmbMOEJDJeGmbmdqxNkCwEWVuY/uv1KBybiub
	 xf8Ue2wRI+9srPu1JHWiZTrXCINmIfGNDlWJilq/KwD7CDmO6CcL5WliCXZ61r3Ae2x0M
	 fJtFT/KTQsAqcwbdBqN9VB6jSyVwfWdJ+BGyNoP/nmSj67eSG6QyhoeLXbYsW+IeIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rp8a0nB0;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63524606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63524606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rp8a0nB0
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-368581df789so369538eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720218; x=1793325018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=Rp8a0nB0sJ+TJDR4hlmpgIpdVyGie5oBwLC0PFdydmMtqnyLfTvFup4nWx4OJIpd2D
         /0nqKXWsIu5jqq4imY11lyfjYev/8OExuK7Q/OxHuhOu+pzzZpTTeTiYx/F49RMSUzmt
         GccSr96gdC2DqGPOsPztHQgBSqn1ACJig8rztK0kgxx6Gea9Ck+5Xlj61UOtcZIedsp9
         2K8Mmg1SrottEj+86QdTk9X5iO+xMAXf8q0Rsd1uy/ZXcFhOOPsyHifwcG2ONoxKcfEW
         CpkDdF+5YUGAXHkpwXQORt34Ay1acS1LK0wiHEEbMpZhAYUW7HX3YNCtZr6OkoJjolGz
         H5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720218; x=1793325018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=DjoyKfq+h/YerKp4xsWERXXc9mmhXAPK9qIJin+TvLIdtp7Vzvnj8o5EQZLptV6cbJ
         eSKYQegTUvoBDMexIMeMAhgUB5K3HgK94LaTG9bxJrQaWVNlomSnxz7QyOwsqGrSOG5F
         QF6K0pvLF9oiJJGgJKG2PYuqfJb47j2x0jB529aHLFiIjLJAGzlftZEAynYDm1suVUf8
         aZsqOkPWoZwFLsp8j8WPR73LNSf/u+eYzwKUicrRupOI7+7EWQHscmrOetzZ6Fh8Kaf6
         NkyV87kv7ReDMFAIARhU/OEBbpCpRPch0uwL44fVMfx1PT6fo31vZLSLFbEl4NIxzOp9
         ZXEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTWx12GPFzpXpW4Y+1dtb+4hRs1Uh/q/ARIw3+ZK4Due4knXJrjMjYIAMkJhLlpzIDXmJ+b5/DqcNu//M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfYbCL1v6fLxV9Csxrv15rwHN4lXA1K9BKam0cKIhMHYsvJ9Il
	LGFyOjzTFoQaIn5XlYwsjhGzgHXlbT9OYwGL5GzFnPsGn9vgOxSPBDsB
X-Gm-Gg: AYBFou3+Q+CH/m744+73U6l9fhrU/pPPsXaWnLbGkZS5ow51nEGDl6xfWUJV5EiHZg+
	2geTPChUTRTLn9WUui88QkPz4nDhBfVPSdEdSAjsaoA77IlfZHmdFHTboAgCuKDG8WFX93ZmgRe
	0xWuh0cXYC36PhrPk73jtnxgBT1xjDufezlhpkfeIOCpHPiUl6J1W9nbhYESKjXOo3EbMX7NmoL
	aj1cy5CkYnNalvDLmNPEnKk5QlXbQjwKCHwhwJvy2DpJ2KNDb8q6tPZRcy5jkizOkr7Kpk2WgNa
	Rbau7+/tLig3jaJXlqnEakauvBjEnNQhX+GV2+RfTw/Ggw0ZG0jhbPuxJOwZRdQCGFn6FgkMErc
	OULmJbBAOmGecpK89Od1LsKArh2ni66ZVq34ahzcC5yQN++1t099ClnlGpxl+RXap8TJZsG1hOu
	Y2U2TdIK99+jM62fxqiAKd1z5qkge0tv35XhShMWpc7EJDtTgzr4Jvw3QhyuqBE2PLAAxldaU+u
	Ah8KNA8qDp5tQ0YR+H6rQJ10kbTlyM2MSeKcTriup9HRHzVLv0=
X-Received: by 2002:a05:693c:69c3:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-368afd86765mr4796119eec.9.1792720218428;
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 23 Oct 2026 09:49:49 +0800
Subject: [PATCH v2 2/2] kasan/test: cover load_unaligned_zeropad()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-2-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
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
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
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

