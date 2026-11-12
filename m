Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501087;
	b=Kiups8FLBmZl9/6e5xUhMO1GyZgd0xw2W5ZJ8a4ZsFt+Cb5vOpt3oyVdp3NhSPPyoQzv
	 7byil4BnMMzEJZBjETtT2PdYGrZlVVjLrYgIHQyBE0Uif87ru3xLhXYRcVpqBSVHMGcRK
	 e56jDVb84XZ29OBOkI3BhdJr8ok1fDBWvGV7fDB1w7i4LhEsHWeNmyQKMPH1HUdITikFh
	 gcC5YLhsPhh5A3kK2D6CWE0fI6Cg8paFwI7LWVbIWXmbNtE9G/SeTMWdGZ95t72/NYWFa
	 PvdPBqNLoWIbLjsQ5uKSRc1orUgv2IY6VIEGzm5pfEzeEFHjDSfHIfLb9dv9A4FD1pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501087;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Var0wb81EXIoiRwlJho2Y50Ag0AbgPDq38QwDWVENoc=;
	b=Q6b/RA8G6flAol50yIQbCBPKAlN0Or2SoOdz3MB/NbKQQAhLzOufxp81W+hrzHEb00Pa
	 SIFsEYnzPd3+PTdUos0HTMv1ZOjLywHxxKtvKwNyOXTLo52i3CJz1ozsYAhFldFOpEPgS
	 2jK2HLUrvhj98q4kK7cO8DprHEiMpwb7a8brP/P2uGiFaCFUJTXpEL+fkgV63ASTimSna
	 ptB4Y+99Wjq1OaIYqkPq3dApWZDyYTcGHS1tavhpx6XXTz8BcNKJe3tqNeKE+otXEUir8
	 KOrkQqNwxcjKr98KVAJHcfMgMnViRiRVg0EhmECekGS/YHyUeyNOC2UXKb0Dx+1erLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EBSoXkXd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B65606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EBSoXkXd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C51F000C6;
	Thu, 12 Nov 2026 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501086;
	bh=Var0wb81EXIoiRwlJho2Y50Ag0AbgPDq38QwDWVENoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EBSoXkXd8E6yPyRZ7L8eVBIHC5CihFeL3Z/tG4B2r9o6l21Y6dmkDdLY2iQA2tXri
	 8t3EpMRuX4JjVEuCiEYwMFFa1KDfbdTpGomyrGUW9cMG0vF0ZPKisXuHDGkVG9uxgw
	 rhld6qQ8CH9u1AhBO1/O8hJHdoAoLSPjeOSPICZvGOvW0O8PCZwxlRQkLDfiqUd8aa
	 e5xzKMMHiZD1Lifq1p0c8gtMjsABcFEX30fF621tHj0JTnSkaAEEDCRqS2miqzkPIC
	 km0kSpFEAjzN8AfkP9EFcS3s/3Fx2hObupvHFTRxzbJEtvYu6NUY7Foz0h9OGTwdjt
	 NK9eN8izUs1RQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:08 +0200
Subject: [PATCH 3/9] x86/mm/pat: don't populate page tables in
 set_memory_{en,de}crypted()
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
Message-Id: <20261112-fixes-x86-v1-3-791adb8d6670@kernel.org>
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

__set_memory_enc_pgtable() sets cpa.pgd to init_mm.pgd. With cpa.pgd
set, CPA populates holes in init_mm instead of failing, and
__cpa_process_fault() says that only EFI does that.

So when an address in the range is not mapped, the request does not
fail. populate_pgd() maps the physical memory at cpa.pfn there, with
_KERNPG_TABLE and the encryption bits: present, writable and executable.

A caller that passes an unmapped address is buggy, but it must not get a
new mapping of some random physical memory.

Drop the assignment. The request then walks init_mm as usual: a hole in
the direct map is skipped and any other unmapped address fails with
-EFAULT, as for the other set_memory APIs.

Fixes: 77bd2342d430 ("x86/mm: Add support for changing the memory encryption attribute")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index fb2413cb8d314..aa7052d247e60 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2457,7 +2457,6 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
 	cpa.numpages = numpages;
 	cpa.mask_set = enc ? pgprot_encrypted(empty) : pgprot_decrypted(empty);
 	cpa.mask_clr = enc ? pgprot_decrypted(empty) : pgprot_encrypted(empty);
-	cpa.pgd = init_mm.pgd;
 
 	/* Must avoid aliasing mappings in the highmem code */
 	kmap_flush_unused();

-- 
2.53.0

