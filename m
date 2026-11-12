Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501084;
	b=Dyz1NSfMbPTtCsymSx8r23dw0lxNuXpDtef9hHVjbzKhQj4MguOmw7NxIxbCQk+o0MUm
	 wVHLhF52oDKjQ1DzGWr2bahANPozIPwWuy5ilvfiKlqXQ7V9f+ljUF1JD0jVJS6/xBo/r
	 YZs5YijpHMnOJPMDrNFraSKRSrz3mKh4jaN5azhF6VVejKiWE55BddUrCtlEee0lUSwMT
	 UoHpP/CPGClRGUJ4C+QlS0u9t5o7WgyuwXWDPlnfU8/2uVBV9HEHx+uGp7NDYwbJ89LFC
	 lwzt9frm/TlgTI4x7pk1eGp+67iL6y/giy6aeB0ZeTIfg0gcW1HkWF8ZnUBCybp+D/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501084;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=t7FDNrKyK6VBQjLPAN2SUOn5Hj1rulITu1zeui1Iwx4=;
	b=RS77Q2O7b9HyDZVDLEkALUkVgh6wutU/exmN5Xuedg2rK5VDB8iFJsa4tdVoSXpYkH66
	 Gzx23RespbeY0Mz9uZm+Am5dXOqWaNt/ep5MNnf3sjPOdYV9aGbKtlWGh6xKrLDdI4JUk
	 FfOHBZwuU2CINTjI9zg16prB/A4j7fp6+o0ni94ZJchxoKRzVdSYchfs1nAaZ674WJ3Ls
	 yA8owS+aftEvFJVfo3kVXj9tL9i/EWDjq8VPLz4FZNzedYswFfchTPpyYmeHSSRdE4QJr
	 wgtzb0SHYkg0mVzJkNmVhyISQgMkz8vfJLOT1PK2tOnw9aYvngE7yX3a8MmRIkRSUvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LkL/j4VW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5061606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LkL/j4VW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B761F000C4;
	Thu, 12 Nov 2026 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501083;
	bh=t7FDNrKyK6VBQjLPAN2SUOn5Hj1rulITu1zeui1Iwx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LkL/j4VWFtp/M5086uW540o4bsa2YZ7DSm7VaXkncn4H6Av6iURspp1E9Kqn1WAMW
	 jcuOhd48+w0NU1/dk+Y3fNkxgaIUdmtzUquh2uOHLQXCmdwG/CM0yglBOLJm+NEUeS
	 3VwHZpBr21Y/vLD/ix9b3nAUTBE/14AiqZw9ZK7SB2Jl/Mlpea6mzIBzbs7agB+uNB
	 4jHNG3dhPl/TJu+zNqi2hhWVDhuMycDgvr5mhg2reraiauSCCgXeGR4X+NjVX7aU+3
	 1uwubRotW6/Q9XD8+bfjx0Q2RS3HdziDDQdqhrlTx/bSQYsgl0bmviCtPYxQO5vriN
	 LcHWZjodulIuA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:07 +0200
Subject: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
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
Message-Id: <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

mark_rodata_ro() ignores the result of write protecting the kernel text
and rodata. It can fail when CPA cannot allocate a page table to split a
large page, and then a part of the text and rodata stays writable.

kernel_set_to_readonly is set anyway, and CPA enforces the static
protections of rodata from then on. On 64-bit the next call,
set_memory_nx() for the data, may find the writable rodata and warn
about a conflict with the static protections, which does not say what
actually went wrong.

Report the failure and set kernel_set_to_readonly only when write
protecting succeeds.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/init_32.c | 8 ++++++--
 arch/x86/mm/init_64.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 0908c44d51e6f..8323c1f599f25 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -741,12 +741,16 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long size = (unsigned long)__end_rodata - start;
+	int err;
 
-	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
+	err = set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
 	pr_info("Write protecting kernel text and read-only data: %luk\n",
 		size >> 10);
+	if (err)
+		pr_err("Failed to write protect kernel text and read-only data: %d\n",
+		       err);
 
-	kernel_set_to_readonly = 1;
+	kernel_set_to_readonly = !err;
 
 #ifdef CONFIG_CPA_DEBUG
 	pr_info("Testing CPA: Reverting %lx-%lx\n", start, start + size);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 8b6d86fb5a42e..a68998f359bf3 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1365,12 +1365,16 @@ void mark_rodata_ro(void)
 	unsigned long text_end = PFN_ALIGN(_etext);
 	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
+	int err;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
 	       (end - start) >> 10);
-	set_memory_ro(start, (end - start) >> PAGE_SHIFT);
+	err = set_memory_ro(start, (end - start) >> PAGE_SHIFT);
+	if (err)
+		pr_err("Failed to write protect the kernel read-only data: %d\n",
+		       err);
 
-	kernel_set_to_readonly = 1;
+	kernel_set_to_readonly = !err;
 
 	/*
 	 * The rodata/data/bss/brk section (but not the kernel text!)

-- 
2.53.0

