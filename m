Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830A33CEBD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375113; cv=none; b=ZnpHdtloO+R/bGMntGbcU5aUzFm/089+fjnNlbTpKC26A+VFAKGBXkCj0SNc5Kn6otz0J1Q+Jb45OfIWbtlG14UTyKkCXbA0vf1Al1CzIpiDIifZg4F9Gb1fWtsiv6IbO3NWxEWRM/lf7+t6Z6kc5W4kNjgi79vc6I/bnledK2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375113; c=relaxed/simple;
	bh=+oaAjyEp6ftj/PHhQbqAgc3i6WKxrkECzgHtOsHcZvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0vTIZhvBURqunGyNyYu0gHcNq/5PMiCL2hyf4nP4CJFi5fvzEV8MDjDu4Z2dDmNdWrQxFYg4P4FONsry28LGPQiODIgJvaNyC61SRrCER4AzpygCkvKFicJ1JYsZFKxucEiLTw1WHhvCZSHu2LI6cVPEtiygHroSZX93LCQyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGFJS24G; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGFJS24G"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35d0be18c71so2911721eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375111; x=1792979911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wabN2RpcS9yTy4X+yFbisN0o21RKH0fyf1fEhCrMYgc=;
        b=dGFJS24G2+8l24MB8KPvSCel5scwCuISJ6K+2U/au9gRu4U5UA4FX+BHl5Axj8QA+B
         ZQk7JlxxsBt/YSZ2Wp9j+9MhxrISRoQaouiIQMeqhgNeZtMXcV7kb1xSM4l8LZ/AAHTx
         X94NdGfVcYN5mDGea33VPkdL1Gv0ikgDZXURN0l+ZAwUkjj7y9saxcLKc24sxrWBUzDq
         aUDY0/pT5zDLPTEO7LkpJAzASQWxqMeKEMy7M6q3YM6woibjV4gw46l7H6sERo+yYZeI
         HS6GA9Xo8/ulxmdKMFSUFOof8poRLLpZlYjN9h++KSUJ83tfH5AeTJWHq2dwoaCo3P7x
         ZFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375111; x=1792979911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wabN2RpcS9yTy4X+yFbisN0o21RKH0fyf1fEhCrMYgc=;
        b=ZAt2RXfccGyP2TRtf7NJN9BPAW+ZfU5CCQZdWuJJ1j17Vq07DJUilBOAYZqa28Hqll
         rOaFNcaP5ErhAwmtSvbLL0PA96SBS9v+uCHtotrwA04S3XxlW/QjzrHSiiKCk+tU+W+Q
         dVl7Q0+TaGenFI78YXBvkHwge44nndkcMI3j9Q/xJUKJdzRw7ReErRc+7A1ib/8+0FFL
         fW4zazbtDnxkh2UOmk5E7Bq4TQxFvAcOUiAblw5I40dXjXgJLsZjK3dGcZlwt4pC51f7
         ztiLWHYIet3luWhMWPBHvc3txCpB2mFUyBzN5uytuUyspIpLklfcI2VtwtUc8bSJo/7C
         J0xA==
X-Forwarded-Encrypted: i=1; AKwUvBwT+PEkG4fMYCOWutAkg/TAGztETImAq95FcFogW/rDCzxs6G1YQ0wXPOwoBw/dedrfvszySY2fjfll/VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeq7nbrjQUckGYqX6Ndjdyg8g4MoziciYMhVnzJvqZ2oWaxbaK
	0lLchZ3dGkfIEUgGTJmtECy48G3dwwvXUdrSkmZaVAUZ8hSEF9BqqH3Y
X-Gm-Gg: AYBFou2cuPiFzOjWDk1rrbGK8+6L/Le/Usmly8xYGkhLZn5UgCDA0j6Z+vpttLwCrYX
	8inRIyl3c453Qtvj0oXaCoOz0GKTBQC6gA7zaAbPISlLiDjwnhqJg1dEX6fnXmEUh0iU5Iod6Bo
	RDptDSKHAn2Erc9pFc3HmDpbcO/EJVXPMmkFI3WTKh3xhSSCvP9d7Ak/4OzG+b0AOM8TbprsSn9
	M8HLZbe+UkJPiqRwBFATVfryfKy3bvf7LmHraGK36YXOhgRgLPXzYwsQXTJnpkkijVePk50EaPX
	cyVeTfmZN0AVBVZv7gIeIknSeQzibbKNPUBkiivjje/sEr9VmAE4yX7P8Dnm7WoEcp8auF+r6kd
	J3xTsZseiDMNeiM7u1KnFaDaX4EQ/oJ8nqTTUJV93F3uZ53k/YSg6t73fvGpxWulkUbQmQAJGHT
	UkfasT8G0Qznk6VkPrO8mHxF1PmstQK1Nap4v7djC8ItyrJ+omd1XybUINamyPR0BDny1tDHVjA
	mUA
X-Received: by 2002:a05:701b:4202:20b0:146:5f73:d45b with SMTP id a92af1059eb24-1850be495b5mr8924712c88.3.1792375110248;
        Sun, 18 Oct 2026 18:58:30 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 09:58:09 +0800
Subject: [PATCH 1/2] word-at-a-time: check the first byte in
 load_unaligned_zeropad()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
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
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0

load_unaligned_zeropad() reads a word that may run into an unmapped
page and recovers through an exception fixup. It does the word loads of
sized_strscpy() and of the name compare in dentry_string_cmp(), path
components in hash_name() and hashlen_string(), and the trailing bytes
in x86's csum_partial().

It is inline assembly on every architecture that implements it, so
KASAN and KCSAN never see these loads, while read_word_at_a_time() at
least checks the first byte of each word. A use-after-free or
out-of-bounds read of a name handed to path lookup goes unreported, and
so does strscpy() reading from a bad source, which the kasan_strings
KUnit case expects to be reported. On x86_64 with generic KASAN:

  KASAN and string KUnit suites      failures
                                  before    after
  CONFIG_FORTIFY_SOURCE=n              1        0
  CONFIG_FORTIFY_SOURCE=y              1        0

Check the first byte at the start of load_unaligned_zeropad() on every
architecture, as read_word_at_a_time() does. All callers only load a
word whose first byte belongs to the string or buffer they read, so
the check does not flag their intended reads past the end. Add no-op
stubs for the powerpc selftest that builds the header in user space.

Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 arch/arm/include/asm/word-at-a-time.h                           | 7 +++++++
 arch/arm64/include/asm/word-at-a-time.h                         | 7 +++++++
 arch/powerpc/include/asm/word-at-a-time.h                       | 6 ++++++
 arch/riscv/include/asm/word-at-a-time.h                         | 6 ++++++
 arch/s390/include/asm/word-at-a-time.h                          | 6 ++++++
 arch/x86/include/asm/word-at-a-time.h                           | 6 ++++++
 tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h | 3 +++
 tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h | 3 +++
 8 files changed, 44 insertions(+)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293d..f672aad2e30e6 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
@@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, [%2]\n"
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index 824ca6987a516..11ecca99057aa 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -40,6 +40,9 @@ static inline unsigned long zero_bytemask(unsigned long bits)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
 /*
  * Load an unaligned word from kernel space.
  *
@@ -51,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	__mte_enable_tco_async();
 
 	/* Load word from unaligned pointer addr */
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 54653a8634149..49c6a1f65c493 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -5,6 +5,8 @@
  * Word-at-a-time interfaces for PowerPC.
  */
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
@@ -168,6 +170,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, offset, tmp;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm(
 	"1:	" PPC_LL "%[ret], 0(%[addr])\n"
 	"2:\n"
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7e..fb7e2904dd7fd 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -11,6 +11,8 @@
 
 #include <asm/asm-extable.h>
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -60,6 +62,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	" REG_L " %0, %2\n"
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index eaa19dee76994..59393cf065964 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -3,6 +3,8 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
@@ -52,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long data;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm_inline volatile(
 		"0:	lg	%[data],0(%[addr])\n"
 		"1:	nopr	%%r7\n"
diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 422a47746657a..1319e1d87a9c4 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -3,6 +3,8 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -71,6 +73,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm volatile(
 		"1:	mov %[mem], %[ret]\n"
 		"2:\n"
diff --git a/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
new file mode 100644
index 0000000000000..000c92de6baf2
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KASAN to check in user space. */
+#define kasan_check_read(p, size)	((void)(p), (void)(size))
diff --git a/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
new file mode 100644
index 0000000000000..39c97bc15531e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KCSAN to check in user space. */
+#define kcsan_check_read(p, size)	((void)(p), (void)(size))

-- 
2.43.0

