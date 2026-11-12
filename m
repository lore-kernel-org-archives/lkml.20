Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490948;
	b=JPqgJJ3wmi65MkwKmAAEh3sCT+j3aFxj7FP/VCOWZkEMD3nyNAWVHZo2F9pIOCl9GJA5
	 VwergqK6gX0BvPuRJScwbJathy+Qgo9c9NVdeutndP3KIxZBy4jzphTv5MfJAlGZmRAUM
	 Mm8GwZFwNRd2DTYgQwlxABRB0oKokGzmdkCsIpPpCmW79yR7dIXMe+k4oZNglM6Od1GHl
	 hfQP+M/4ev/d6PNlKKSeAlJZVcWZrcF43ynTej4vmtDB5rKfi/JIrEsOb7SYCUG5uUKfK
	 /ijxilpB846CzRLsLSrK3ihV5nrMJqFvJaLq5EuqbETs1DEW6l22xjTG41O5I9Y/Rqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490948;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dqbquVni/DMcAyJArGqCAVcIns69uQDK2R6VFLb3mps=;
	b=WaDjMLc17NWIjzNGmt1bZ82Y+e/Dn4yMV/lT+55qgG+bahGRKhN+avgF7kEYYyEKrqSz
	 GTD1mZ/oehLHouAE3PaOWMCM+dPGqi7YKcVwkCC77DpHstsOYIGkuN1/RX4AEus1LNGG9
	 3NVWqeAUUeP6SJRVUIHAoGcUmyTTkDM/glpJJHi5dJvjzLUfVFe6GJLXQNmuCJVqScxka
	 TAMoXXL7ad6Plpx0o7fNOhL/UlNzMxSUMvI0KiOMSyxxhRXLW0x91nhPC6a95LRikFlaP
	 lgLZM4ldBAc9jylSR9rJMh3y57zZFVXCJ3eRU3+JdtNqipAeblfJCyE9PHBclFxYKBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8uPEVg5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96F606A8AD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8uPEVg5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B721F00A08;
	Thu, 12 Nov 2026 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490948;
	bh=dqbquVni/DMcAyJArGqCAVcIns69uQDK2R6VFLb3mps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h8uPEVg5/1VEkawZC7BHaxlQMaekT/tQlfN9hKtYXU1g+YP0qKcGKdVof/sA5bx4A
	 QWkJw8J7z6Wtc6krH+2hJGBzWRFbY2zxuAo+SEDHx9zBKBZ1HkoU0XDW+x0z2iyHj5
	 wvRwRR1kpvnWPGr1j5NFRUm7MBTrZwCCHQ+ABgouxA6N1yc93pOKJgQLueP1KYRYo+
	 jG7VAEhdpw1aWvuIKELc6eD21Nao+tU/RCKTuqsq7522eqSNgHFqrhoJjOxrmH3lUV
	 J2xS+yqX7LZTiGn8IjCUK5nWATF3jm2d6amqHG1O3bZIEWkqoGbg9KBEAhcYtbX2qK
	 cVKXnMPNe4m/g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 15:42:19 +0200
Subject: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
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
Message-Id: <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
In-Reply-To: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
return true for the invalidated entry. kernel_page_present() then reports
that an unmapped page is mapped, and hibernation copies it without
remapping it first.

Test _PAGE_PRESENT directly for PMD and PTE leaves.

Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index b138113755359..62fbcf7cf36b6 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
 	if (!pmd_present(pmdp_get(pmd)))
 		return false;
 	if (pmd_leaf(pmdp_get(pmd)))
-		return true;
+		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;
 
+	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
 	pte = pte_offset_kernel(pmd, addr);
-	return pte_present(ptep_get(pte));
+	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
 }

-- 
2.53.0

