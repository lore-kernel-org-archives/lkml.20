Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404220;
	b=TI6/q3VCuph/cyqbpfE4sMBoKSPalOxM2I2mTmsKc0ElpXnrEjvnlQeWKwn+xDVwHAKd
	 IsR/xEq0QoXA9aUwmO7UUQA/YILV43HyKq4iwEeB7iVJa5IRnisz06s5JQtFCB6w1wfiD
	 ZIR6Dw+0uphF4cW/bgxRkmd8C3z4PDmGasagnA0GC8ecBFcyW7ov9SRpoXkIrvc8i9KFF
	 En/n7QNGr6uh6gdx/X67Soqh2CTcaDJwu3qamQaLLhex9XXvY5c2DJ2JfCLNfkf04chUi
	 RCq5UUhYFd9+wMLhfbxACajLm77I0mz0sXpe3UhJxl2KFLpmQ2G65Ix+CrtZWvT84sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404220;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=WET0xlYV7rXuRE+d7+OZIC1CPgEIolv+NtAvCsaAG0w=;
	b=xLbjJQjye9SC3ARqJULbEIa3zDOei2FNrmc2/csNOoJ0o6e1wzhY4RHtsTKJ5DmwHQOt
	 BSjRfpPRfBloMo21cLV14AArAJdqR65Xf89xjLWR6+yMrHQp7QW1DmsRCwPcIfQHl+aoB
	 OXAiTbHu6gVF1GwlYPZJ1z0e8R/nmRtAztWq4cD+ntkk3GUzQ9xESBIbhxGJCLBiifgd7
	 WAEr/GQYbOY+A/EIf7Z/GV0GUmnjBcXnHd2zbcbtM0pdzjHM1+z7o+KYTEmbODiRjmWUf
	 5HPuJobCY0oTIaKH/tEvBSis9F5cB2TxRDPLJKmQ/TT2HgEpIoPy8GZTegPSKPkAIEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwyARJPd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwyARJPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE5F1F00A05;
	Wed, 11 Nov 2026 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404219;
	bh=WET0xlYV7rXuRE+d7+OZIC1CPgEIolv+NtAvCsaAG0w=;
	h=From:To:Cc:Subject:Date;
	b=mwyARJPdm3b3e5qMSPk95IYFuFI1WnwQMb3IrPTcBE5WoCX4vh+2wWDWdYIn5O/Ph
	 BZ/Ezk1c4FC8DzAxOWr+g97SyEhP9RHzHp3wah/d0ynIYmBkevQRHN87MDKJHy/sR4
	 pRjrOXNxj2tQuQQzanI1PbqRajLW/VtDQ32FWyOufB16qfVokKLfyhP9K6flcAJ3Ga
	 HKfcrD3bgirC4SUsVH0uKQTqUUSCqN14DqbfwfDQDwKkdfvUln7FrkBV7JkqZR4dJ0
	 6msArhbwLiVQo+7WbLGeOdNbIxYYz9rGN2mHXjamlWAM98ntYe/84soJUvbN8HH4wY
	 g+9340udv7E/Q==
From: Thorsten Blum <blum@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] x86/mm: Make highstart_pfn and highend_pfn local to initmem_init()
Date: Wed, 11 Nov 2026 14:36:34 +0100
Message-ID: <20261111133635.75044-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824; i=blum@kernel.org; h=from:subject; bh=J8CWfehBozpbvQSbVKv+hYbNyWna8OSl3L8/aXEoDOk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlf8pODPWQnyX2cXiuxwi5y1+4ZDx9IuEh2J+nNMN546 H3Enr0hHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRY/cYGX5n87UURf7IPVC3 YsITxbwVwV06tuqRF3c4OCQ2LdPSrmRkaPDJbnRXfhJyidFEbc7ahvKZH+9XFEpPY7S9IbfQqz6 AAQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since commit 35c3151a98a6 ("x86/mm: Consolidate initmem_init()") removed
arch/x86/mm/numa_32.c, highstart_pfn and highend_pfn are only used in
initmem_init().

Declare both variables locally and remove their unused extern
declaration. Use min() to initialize highstart_pfn.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/include/asm/highmem.h | 3 ---
 arch/x86/mm/init_32.c          | 8 +++-----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index decfaaf52326..31d6d2a556f6 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -27,9 +27,6 @@
 #include <asm/fixmap.h>
 #include <asm/pgtable_areas.h>
 
-/* declarations for highmem.c */
-extern unsigned long highstart_pfn, highend_pfn;
-
 /*
  * Right now we initialize only a single pte table. It can be extended
  * easily, subsequent pte tables have to be allocated in one physical
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 0908c44d51e6..9b0a3dd02da0 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -55,8 +55,6 @@
 
 #include "mm_internal.h"
 
-unsigned long highstart_pfn, highend_pfn;
-
 bool __read_mostly __vmalloc_start_set = false;
 
 /*
@@ -615,9 +613,9 @@ void __init find_low_pfn_range(void)
 void __init initmem_init(void)
 {
 #ifdef CONFIG_HIGHMEM
-	highstart_pfn = highend_pfn = max_pfn;
-	if (max_pfn > max_low_pfn)
-		highstart_pfn = max_low_pfn;
+	unsigned long highstart_pfn = min(max_pfn, max_low_pfn);
+	unsigned long highend_pfn = max_pfn;
+
 	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
 		pages_to_mb(highend_pfn - highstart_pfn));
 	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
