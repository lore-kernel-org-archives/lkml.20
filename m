Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B7471439
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795290; cv=none; b=gl8QDydu135B7iKHOvz9ghrVHVdpaH0JlQBm/dnIMmpdWanpUzNoWmy8M/8ERm28QynXu5eU8zVlE70L6S+2v9dL7V/E/YlqhiOg9IfRW30x4rNlnmCtgG9qpLVC30Ylc//yLhxhEQLEPj2a6M8NK5AP2kpH0VKmuQbmYCExDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795290; c=relaxed/simple;
	bh=HRopG0SjAFWAqjDfgeMCYjhPxT9GEmqSvnctlvCkhM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuScoLzE1CAAj8w6HLPSl49U5GKtR/AfhCQDxIJU1UwbDKlhauapGVmGsqyXtUvrO8pq7xZXobGEasGK2vW8/0eoQWT563RJpFj8UGj8H4t6A4IWZ6hJqA3Ef5cuF5CXNfxVRklezz78uSpUVpGAMmiaSht8vvJqKt3DHDhfilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jeq0YGq6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jeq0YGq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AB91F00A3A;
	Mon,  7 Sep 2026 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795287;
	bh=A1WMEWftQfe3FQuEVzWJAAShiADDVwkA0Mf0m9ZcbKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jeq0YGq6bhKq73IyNWav30rXrgwxrFcZlZSb8uJISuCW4zLxIjOaQSLDYNxzQvirr
	 No9pe5mXFeW64/rURB9fjvzy6xyBusMU4YYu1W8oLsLoeD+aWH9OISsB8VHh5s/fXO
	 OXDhk7Swbl2fxLB2gHF3jt34WhbUkbqUyNvkwEg9NwcMbuwSDymSKxe5K4RENv+faw
	 Pzz2pG4f/8PAGm9VM18EXzp/o90TwRRuMrKfNQpyz0klys9+7zYNdX42Sxeqo33kmg
	 pYbkBOYxbsIb+RsJJA728p1sfkRbOiBLXaVRbACUHyUS1xh8tEsFGMCzGxfCDuEYOJ
	 Bi3jTt2+5E+9w==
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
Subject: [PATCH v2 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Mon,  7 Sep 2026 23:14:37 +0800
Message-ID: <20260907151437.7603-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260907151437.7603-1-jszhang@kernel.org>
References: <20260907151437.7603-1-jszhang@kernel.org>
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
index 90bb85c5f167..ed800a4e0e8c 100644
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

