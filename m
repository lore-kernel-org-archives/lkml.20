Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92155C328
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967332; cv=none; b=P2xb5gtiQrmRTwJRyGUMY9jvhgpG5TTaNFF12ZxL4vSvhvKWoWN0hB793HxdGdUWIj6vaGUFSiSfqv9yiLu3fmllGc6GXNsuaR+tlNP2Xj/AjefZ4AhiH04vMR1wFK01U/TJv98V+cZ3+OO2TI9CPVgOR/017Tdvh/nJ2hKeouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967332; c=relaxed/simple;
	bh=ee5L4TFSH+xrEy8uvpiVGNltqDEqeNPSyTSkhUCzV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tegk+Gyk/1b7uQOyekNFq0Rf86j9dtdoUARxzmYN4P2IR0gMGpWqti5kNla4te0U5dWm1Pbgqfoj41fXdAylHQNtxgHY4R+Z54yiNyiwLRWT7mSLK46yEH/b91tLLrjJTlhUYLpWITvdavm6J/t5M1tET5p/XaohHZvw2apqqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK9BNkKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK9BNkKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37FE1F00A3A;
	Wed,  9 Sep 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967331;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EK9BNkKZtVqYRYh4He/z6D+YLRADtblBeHfMl/W2EBp98Z61ChVdNf1IJku3p7oPT
	 XhAlMaVJgxX0NSTfg4q9DeQlfw+2MgQqgk6rb3zd9bxKD14EEeiifsACWaCd82NDWd
	 1w4nha37zTveERLr5uM72s1P3ci4ZkPbmS+br6EoaM1pnGtu3HBFEPhaqolfZuHR93
	 DXCe0IuFhz4eHoLxxTBP8niFzjQw4/l6ZNwfu4sy+LtVb7TqkrDy+0vofBTL21SVj4
	 yPMqg4jQNdKCJgKOku5dC20HzHS8vahxebPQIv3ZG4h2cN0vvzGwRl5AH7WxX2QXD9
	 oZwL1D+3Lpgxg==
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
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH v3 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Wed,  9 Sep 2026 23:01:58 +0800
Message-ID: <20260909150158.9313-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909150158.9313-1-jszhang@kernel.org>
References: <20260909150158.9313-1-jszhang@kernel.org>
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

