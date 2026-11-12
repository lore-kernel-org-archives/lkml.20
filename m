Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490946;
	b=xcNg+44N/QHzbkmSwXGkGwZS7wB+47sEtFwLq0fCZXDIxQmm25fqTo/ukmSQpaYEqVGD
	 AEhHmHEl7cCxx5IP8otiWQrSCavsxFEScDQpu6lmYu8hBsSJxaopX0Eg174DqyuDH00KS
	 K4RX4/92gZU4c09jtkfrwQvChA6WlRODFZ2RZdf+Z5rP8j4GeHdQ2nni311EH55LSaHNi
	 VmptAklbbztkyjocIu/Jmm9raJ+Vhdi32fBLO43yLPaG2OXgAcc8Ty0JbpEqi3iK7MVRw
	 YZ3EdvAbS8SfXhZHXtow/ITkDA3TMgKHC6KtF2I9oPaHkt170ZEfWxq2EBef12WiN8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490946;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=aib6Hm+ujUboCG2A2/egmpnhtp1eRYPkFTf7G8C56mk=;
	b=UCTfJpgczPni1LHtuu7LVtow2UCBjHp+kn0px9Vt5stCrvXAvR+sxzjS7WFidBBfO9/m
	 Q899XeDkQ0WRIMFFHdAeY9rU6PTpRNqgiS2YjuveEA3rXMxO7h7ZzU0N8fvu0Pax0Vh4I
	 gfSRhARyTrUloa05rYED4MUNWC/xbeAPRjqdUxrZ+mNJAunF3mRi45jQpyZhEUpkXqn7j
	 c4lajCCzC5jQiY2l0PsLQCKs5YYM/reIwO87ghmXMYJv2APCBY2uOXL8qKDs+mzhhIWq9
	 sC5RvBmdYSL1xOIzg8H73/94rDdJf7Wk33Io7NmSQg4uwmpwsWdv4n71zwNx1a5iAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MDfo/vgO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823A606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDfo/vgO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F33E1F00A06;
	Thu, 12 Nov 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490946;
	bh=aib6Hm+ujUboCG2A2/egmpnhtp1eRYPkFTf7G8C56mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MDfo/vgOeIeckTKqRhHyXQqshvy6mWJslcJ+lmykZeZzkP2cy7s9pVGmm2TN/4Nvs
	 PKzMjpqHf2IBWoepSvTczMJOs0Z/a0J/oEYRucWjpMUlo5pfPwVjuOpp5vj+2BSLjB
	 2RQSbwAqxwMbMV2+Vjy+NEBMxXgnecDV4+1/LrtKxgWSqNLpwL20JT8l9RXazPNcQn
	 O+1tEgmPwTfLeyWelgbcLmgvemGhqZEHQX3rdwUmED2Ubj+r+04cx2y5TWye4JwjFV
	 /IsGns/gd7JSeKTUOPGkgcJ6sQzZEcSetl1TmZl/5YweuUpX1d4P5svKF38JHG8ujm
	 5DxAiKIYep4og==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 15:42:18 +0200
Subject: [PATCH 1/2] riscv: do not make the linear map alias executable in
 set_memory_*()
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
Message-Id: <20261112-fixes-riscv-v1-1-1caac19897b5@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
In-Reply-To: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

set_memory_*() applies the requested change to the linear map alias of the
range. For set_memory_x() that makes the linear map alias of module text
and of BPF programs executable, although nothing should ever execute that
code through the linear map.

Keep _PAGE_EXEC out of the bits set_memory_*() sets on the linear map
alias.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5b3cf326455db..b138113755359 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -271,6 +271,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		.set_mask = set_mask,
 		.clear_mask = clear_mask
 	};
+	struct pageattr_masks __maybe_unused lm_masks = {
+		.set_mask = __pgprot(pgprot_val(set_mask) & ~_PAGE_EXEC),
+		.clear_mask = clear_mask
+	};
 
 	if (!numpages)
 		return 0;
@@ -300,7 +304,8 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 				goto unlock;
 
 			ret = walk_kernel_page_table_range(lm_start, lm_end,
-						    &pageattr_ops, NULL, &masks);
+						    &pageattr_ops, NULL,
+						    &lm_masks);
 			if (ret)
 				goto unlock;
 		}
@@ -318,7 +323,7 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 			goto unlock;
 
 		ret = walk_kernel_page_table_range(lm_start, lm_end,
-					    &pageattr_ops, NULL, &masks);
+					    &pageattr_ops, NULL, &lm_masks);
 		if (ret)
 			goto unlock;
 	}

-- 
2.53.0

