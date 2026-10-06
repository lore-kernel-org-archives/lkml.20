Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6E313547
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310227; cv=none; b=rOzQ+xu1fS6KN/d/uniU+FwRQTZ4oWh03pccXMJLRumIQrFHKw2dnAIvfAsqqO4lqfX3UngoZ5w0z8ZsQJ9Ocz6mTBKfy5CuIaka3fB/D4pRxe2lSWR82zb1M2CkEEFtyf1QtcboiJSXH7tKcxSgXdiLtLoFANSbpYBLVkmIFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310227; c=relaxed/simple;
	bh=DbeIVKz13TzT1MwJgQfOvMZzsTiao7rLjBhyw/Tak1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4On3gHe+y8TN6pclnz/JI0AcSj04Tcd82AG1TfC5sywNVjjOY+UiZE64B+uwokW5bYtAQhylRkSjMAItwYrzqdVB+CCd9iplpoFwl6ncF1rlzrUW/huOKviUfiU5TLguP9miCZkgP998MmJi/wM7NaUh5rCgF0XDK82SGX7Xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeuoHonr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeuoHonr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94DC0C4AF60;
	Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791310226;
	bh=DbeIVKz13TzT1MwJgQfOvMZzsTiao7rLjBhyw/Tak1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OeuoHonrxX2vsuUC/j7DeVZ/oUhbD+eJckrC++fDOB6fJROKk4SUkN+9o2ISj1v4p
	 CQp7d2FhjVNd5gSwXgZJB1uCeD8rAI/IPAxkLokwLa3UQrt4gXgkQ/2+lYj+3NYKAr
	 EiYg8hJIu/d2XW7NuKSJ8KRL2QRlAMRkdxF4S7HB/5nj/HOuqmOesBmyhaNRw04g0q
	 mxxvI8i6DrkkAYlgjyQl0P8GHFs1NZryTcqV2aUFpJk6Tt96gtRzRWqPdbL5rWUoIo
	 YYsa3J8hcuCX/9e6Z4SI7+qs0Lfr5mP1XPCM5LqXr17QQQpWXEFEp/akEpxgLQFRNG
	 IRcbarEwR+Y+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7479ECA5FED;
	Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 21:10:22 +0300
Subject: [PATCH 1/2] x86/kmsan: Fix CPU entry area metadata lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-kmsan-serie-v1-1-07fa860ef3de@gmail.com>
References: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com>
In-Reply-To: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, Viorel Cernateanu <vrilutza@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791310224; l=3306;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=N3m+fbIk2kyGBiXGLaUfAlrCuXw8P3s3ub1NW70+ovA=;
 b=1d5VwNUI08730DhFWPH7pVs9PezgdqBniw1njuhfTs/jjT4ogVN29LeE28Fp3J2dpG5Z8b02s
 cBM+4N4ukB/Di87lpPLlsQOFvAJwK5xsgR3lNX6kSodGh5EHb7S+gzx
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com

From: Viorel Cernateanu <vrilutza@gmail.com>

arch_kmsan_get_meta_or_null() works out which CPU owns an address in the
CPU entry area as (addr - CPU_ENTRY_AREA_BASE) / CPU_ENTRY_AREA_SIZE.
That is wrong in two ways:

 - With KASLR, init_cea_offsets() puts each CPU's area in a random slot,
   so the result is a slot number, usually far above NR_CPUS, and
   get_cpu_entry_area() reads past the end of __per_cpu_offset[].

 - The per-CPU areas start one page higher, at CPU_ENTRY_AREA_PER_CPU.
   Even without KASLR, the last page of each area is attributed to the
   next CPU, so KMSAN loses that page, and for the last CPU the lookup
   uses a CPU that does not exist.

On an Ivy Bridge laptop, a KMSAN kernel with KASLR oopses at boot when
the hard lockup detector sets up its perf event. In QEMU, a module that
reads one byte of the current CPU's GDT alias hits the same bug:

  UBSAN: array-index-out-of-bounds in arch/x86/mm/cpu_entry_area.c:25:9
  index 2100006 is out of range for type 'unsigned long[64]'
  Oops: general protection fault, probably for non-canonical address
  RIP: 0010:get_cpu_entry_area+0x14/0x50
  Call Trace:
   kmsan_get_metadata+0xb2/0x150
   kmsan_get_shadow_origin_ptr+0x31/0xa0
   __msan_metadata_ptr_for_load_1+0x22/0x40
   init_module+0x139/0xff0 [cea_repro]

Find the CPU whose entry area contains the address instead.

Fixes: ce732a7520b0 ("x86: kmsan: handle CPU entry area")
Fixes: 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area")
Signed-off-by: Viorel Cernateanu <vrilutza@gmail.com>
---
 arch/x86/include/asm/kmsan.h | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kmsan.h b/arch/x86/include/asm/kmsan.h
index d91b37f5b4bb..a71e84d6abab 100644
--- a/arch/x86/include/asm/kmsan.h
+++ b/arch/x86/include/asm/kmsan.h
@@ -13,6 +13,7 @@
 
 #include <asm/cpu_entry_area.h>
 #include <asm/processor.h>
+#include <linux/cpumask.h>
 #include <linux/mmzone.h>
 
 DECLARE_PER_CPU(char[CPU_ENTRY_AREA_SIZE], cpu_entry_area_shadow);
@@ -32,18 +33,28 @@ static inline void *arch_kmsan_get_meta_or_null(void *addr, bool is_origin)
 	unsigned long addr64 = (unsigned long)addr;
 	char *metadata_array;
 	unsigned long off;
-	int cpu;
+	unsigned int cpu;
 
 	if ((addr64 < CPU_ENTRY_AREA_BASE) ||
 	    (addr64 >= (CPU_ENTRY_AREA_BASE + CPU_ENTRY_AREA_MAP_SIZE)))
 		return NULL;
-	cpu = (addr64 - CPU_ENTRY_AREA_BASE) / CPU_ENTRY_AREA_SIZE;
-	off = addr64 - (unsigned long)get_cpu_entry_area(cpu);
-	if ((off < 0) || (off >= CPU_ENTRY_AREA_SIZE))
-		return NULL;
-	metadata_array = is_origin ? cpu_entry_area_origin :
-				     cpu_entry_area_shadow;
-	return &per_cpu(metadata_array[off], cpu);
+
+	/*
+	 * The per-CPU entry areas are not necessarily laid out in CPU order
+	 * (see init_cea_offsets()), so find the area containing @addr instead
+	 * of computing the CPU from the offset.
+	 */
+	for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
+		if (!cpu_possible(cpu))
+			continue;
+		off = addr64 - (unsigned long)get_cpu_entry_area(cpu);
+		if (off >= CPU_ENTRY_AREA_SIZE)
+			continue;
+		metadata_array = is_origin ? cpu_entry_area_origin :
+					     cpu_entry_area_shadow;
+		return &per_cpu(metadata_array[off], cpu);
+	}
+	return NULL;
 }
 
 /*

-- 
2.53.0


