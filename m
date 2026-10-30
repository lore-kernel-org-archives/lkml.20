Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398444;
	b=vXwbQvXny1/pL4oUkZnreaSwZ21+nTerrbGQJ3OH8C/W9pNADyLMWpn96FjZjbSQfj7R
	 vq17n+IaPPrAfffh6SLowjd28bcNm22XjlxUP4BTDocDSAjfhCiyQbHOJyCYLj7hhNSEu
	 brxj6Zm0RV278+oDzkNArEH1Znk04d6ENzhIiwIRssZr78VY2/YXCJizbR6RmwhECwmfP
	 44CN1ONzn2M3FrEUC4I+cLzc5XV0MfrofHo0geBM92bt+XyPTK/pwn/zTNr/m/JCn+giA
	 xhWHItXvDgA29r+Dk4Pxg66Wt8Sf4h/9q5L356WQu9gkNdwehsCMovoSKCMF+XFrDlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398444;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v96p8NzzJuOeaoy5WFJozQBW1mtjfbl/LCeCCkWteFs=;
	b=gCc78tThhalIftTLInW4hRbgVxYZT2T/VW+rujgDHY2ePvWIytW6A9Tiyir1M+scCnaK
	 CLN7qKJ8qS0yrKYfJ11pOpL8lTBodpwz54m/eXQxnoWwpbXAGcAyFzv1S4YlbOjaLzJwH
	 2gNKiD2Kb6Y5PxfChLul34GCeIKjY3LY3ClqJvOhjRzSU50IuRBTOMWSMkeqDm4T5SF3A
	 Ll2yYP85Fye7CwCzcDeeQWNGwumbJm1vAyFU2gxaJj8d0ytqN86Z4eGDfMIgQnyZHs8F0
	 LRqv9byWrKHoe9aCtB9K8e+BM4kgqzJohTkpQY8SLmwYk17qeTKNtOQ07CYmLzEyqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyowhQHe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE97606A31A;
	Fri, 30 Oct 2026 22:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyowhQHe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDEC1F000C1;
	Fri, 30 Oct 2026 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398443;
	bh=v96p8NzzJuOeaoy5WFJozQBW1mtjfbl/LCeCCkWteFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CyowhQHe5fz4QAIGy6UHWgpltzIXUiXysdD2zazgsYDuqVolAp8VEcVMJNz1JVKba
	 G3UhLW+RCtqEVyWmzcpxKNJwBgwccXe2sihbaeDYMA7MjdbidCftV/5OoZc76BSbyb
	 y2iRRlafgM01L2L8TsLcZ56b49Qnl0dGDvVzz+KIcD2TPd5kTknhkyKP75XIgelBs6
	 Fp9fcLeWhbVYWlosxpMyDGz97/a4U+3Hhw0XpDpqnAGg8jqm0JaHA8hAYuvjezZHq6
	 FF3Mq19qpYc7s91TQiVW+hQiNY4LNp8eRD91TALZiTojpOSKiyxuWG2YDqR8yAkJYi
	 BEPTYBmwV53nw==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of free_pmd_table()
Date: Fri, 30 Oct 2026 18:14:01 -0400
Message-ID: <20261030221401.155797-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <as0D2sHzh_UnNF5L@sirena.org.uk>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mm-fixes merge reuses an older resolution of the conflict in
remove_pud_mapping() and keeps the free_pmd_table() call that passes
is_vmemmap. Commit f998a21c2ba5 ("riscv/mm: fix hotplug page-table
destructor handling") in mm-fixes removed that argument, so a riscv
build with CONFIG_MEMORY_HOTPLUG fails:

  arch/riscv/mm/init.c:1657:35: error: too many arguments to function call, expected 2, have 3

Drop the argument to match the mm-fixes version of the call.

Fixes: f383866da287 ("Merge branch 'for-next-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this applies on top of next-20261030 and is meant to be folded into
the mm-fixes merge resolution. Next/merge.log says it was resolved using
a previous resolution, I think the one from the risc-v/mm conflict on
2026-10-12, which had the same problem (next-20261012 has it too).

Build tested with clang: riscv defconfig plus MEMORY_HOTPLUG and
MEMORY_HOTREMOVE, W=1 build of arch/riscv/mm/ (also mm/memory_hotplug.o and
mm/sparse-vmemmap.o), and plain defconfig.

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2400537a01215..e822fce0af4b0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1654,7 +1654,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled())
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.53.0

