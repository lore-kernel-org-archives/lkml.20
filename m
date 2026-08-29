Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6263419F115
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963748; cv=none; b=JazWa502pzGVFMlaH9ctKjEEUHWrw3ER5MGqbNwxQeL68jc22AZQXy4cS8vyxLzu4Eqn6BoK67C0FWzLI3JGiSFf7PlMkHd4cGWLIY8Qsce3OFm1TELpFf9L8IhL+MUUJRAH8aoA5hmLqulQVWDIR8o/dsaw0hoPdDWAFPsmXgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963748; c=relaxed/simple;
	bh=Ve/qzsgaKdgGJhZdxyuDt2adphzy14h3BDOXwqZHhiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICTF8z7nx5PTFtLKqg3in9FKrdJqL54fwcQN5HcyxNnM0d5eXMdEdWu2s3h+KtL6Ic63Hg6n6iWnpe2P2BfhDelHFDthmQUhmuBA8ptq9GPHosXZmQAO2PK8v+WL5I5rH7vtg9fGaAhOP0XQrdGWemw5mbXPvdRyxCv7vvzicvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=fizYsxOR; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="fizYsxOR"
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 3C07620B7167; Fri, 28 Aug 2026 17:35:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3C07620B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787963713;
	bh=kF23c7Ig72GGT7YwqxDerQDqNIQdBDMomJyP16uKvYg=;
	h=From:To:Cc:Subject:Date:From;
	b=fizYsxOReY25OH5IA8tLb/XutVnxQymGg1xBQ6wKZTsvU10nYJfTBp+ocW9XfiOW4
	 54cwuJPvvAlg1LJDRi1IJvAWoRP8eWjID58I/yJv2lShwDq1u+UJhLndo5pB5bgsUH
	 Vflx6Q+AdLC1iRm8lMKJMVkKibmLeWIlfWGMrCqg=
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Rong Xu <xur@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Subject: [PATCH v7] x86/mm/64: free the gap between BSS_MAIN and BSS_DECRYPTED
Date: Fri, 28 Aug 2026 20:32:45 -0400
Message-ID: <20260829003245.2334947-1-hamzamahfooz@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This region is unused after mark_rodata_ro() and takes up, up to 2 MiB
of memory. So, free it in mark_rodata_ro().

Tested on a CoCo VM running on an AMD EPYC 7763v which generated the
following print:

Freeing unused kernel image (bss_decrypted gap) memory: 184K

Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
---
 arch/x86/include/asm/sections.h | 1 +
 arch/x86/kernel/vmlinux.lds.S   | 8 +++++++-
 arch/x86/mm/init_64.c           | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
index 30e8ee7006f9..49ef1428aa72 100644
--- a/arch/x86/include/asm/sections.h
+++ b/arch/x86/include/asm/sections.h
@@ -8,6 +8,7 @@
 extern char __relocate_kernel_start[], __relocate_kernel_end[];
 extern char __brk_base[], __brk_limit[];
 extern char __end_rodata_aligned[];
+extern char __start_bss_decrypted_gap[], __end_bss_decrypted_gap[];
 
 #if defined(CONFIG_X86_64)
 extern char __end_rodata_hpage_align[];
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620..825381b1ed33 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -94,8 +94,11 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
  * decrypted to avoid exposing more than we wish.
  */
 #define BSS_DECRYPTED						\
+	. = ALIGN(PAGE_SIZE);					\
+	__start_bss_decrypted_gap = .;				\
 	. = ALIGN(PMD_SIZE);					\
 	__start_bss_decrypted = .;				\
+	__end_bss_decrypted_gap = .;				\
 	__pi___start_bss_decrypted = .;				\
 	*(.bss..decrypted);					\
 	. = ALIGN(PAGE_SIZE);					\
@@ -105,7 +108,10 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
 	__pi___end_bss_decrypted = .;				\
 
 #else
-#define BSS_DECRYPTED
+#define BSS_DECRYPTED						\
+	. = ALIGN(PAGE_SIZE);					\
+	__start_bss_decrypted_gap = .;				\
+	__end_bss_decrypted_gap = .;
 #endif
 
 #if defined(CONFIG_X86_64) && defined(CONFIG_KEXEC_CORE)
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291..d2e1f087ef31 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1400,6 +1400,8 @@ void mark_rodata_ro(void)
 				(void *)text_end, (void *)rodata_start);
 	free_kernel_image_pages("unused kernel image (rodata/data gap)",
 				(void *)rodata_end, (void *)_sdata);
+	free_kernel_image_pages("unused kernel image (bss_decrypted gap)",
+				__start_bss_decrypted_gap, __end_bss_decrypted_gap);
 }
 
 /*
-- 
2.55.0

