Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FB38DC65
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472870; cv=none; b=lOb0gB3w9ylxaPapuQJep2rWkQrf1KaL32WjjhoAYp0FT2Kis8/buxeaJxd8jYr1VZtOm/may2ci8himfjnipdBfReTyP1HNgZDdFVe21rwTmZ8r3KpWUH523fIZR0Dmt6E4GMaLothGsZUwY51YUOfQb88kX03eu+3vHpjpXpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472870; c=relaxed/simple;
	bh=ee5L4TFSH+xrEy8uvpiVGNltqDEqeNPSyTSkhUCzV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQaNIIc9p8t1LmJaKqTqPMt3JCrhkQf7sfmjMq8omrRkDo3/YtUOs1XmvbjOJ8W4eLqZggKsctay6qGguzP9/wEd+i0XUKWOUbiHpGP2cDZVmhEDQGVFhmTBxTAVWxaKx27LyzWs8na51RqQLRRKrVcgDp/PFg0fvDvH0Y2CPm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjXZv1vp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjXZv1vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586FD1F00893;
	Thu,  8 Oct 2026 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472867;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AjXZv1vpJX7GhaYYfjxgJkIW2LO+I6HbFxS/iSP7b0heDsreWRNcJtSLFUTsHG89q
	 HDN4y4Gbelr4WVSOdwOtvkYkdKqOCN66mlaj6bNt8ksQRpdm3iGlcC5x2DoEyilpMY
	 ew7vQXONJOI+IvtDnhjd7AH5KGRh4P8dtWf3qyqkC0qX4P56oV3SS9y7k1eN5hL2HA
	 Zcy703FrUtAkCyQcUOQKzTGwiePOgCDWCAFhjH1oOZg923rYtMiroJPNQaSjndck/8
	 WXQeGSMchNuF3Aw9OvunbdBQtUO7UokQAuHDewW4kQdulFJ/wIz40Q7smR/WvlcN91
	 WkyWt3HtB/7dA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Thu,  8 Oct 2026 23:00:45 +0800
Message-ID: <20261008150045.28905-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261008150045.28905-1-jszhang@kernel.org>
References: <20261008150045.28905-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, these two vars are only used by kernel itself, especially the code
before MMU on. No modules users any more, unexport them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6f51f265fb85..0d409acf9be0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,8 +59,6 @@ EXPORT_SYMBOL(satp_mode);
 #ifdef CONFIG_64BIT
 bool _pgtable_l4_enabled __ro_after_init = true;
 bool _pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(_pgtable_l4_enabled);
-EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
-- 
2.53.0

