Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095363;
	b=P4hBbQ7VGWJggAVLbq3Xm47NCXrEoyHP4g2n37FksUw/xOgwZO2RlNTSNjLCNoxGN+DT
	 +u940U2JYm8DCAW1y7iIYp7wiAwOANxHGfu5LV+nIPVgHKPL/7unYL6gPr6mY+AR5e9uk
	 05gasYu53GwG3JPOEDjUOTqE/bYG6Wpz95ekJytRr7CY6XDIQOVbuojjbq+hR0DHv6GNq
	 TjTK5ZEjSX9VPiPEGZxG9OW2kHo6qKBHqTv+nFtGjSe/chqwCJu73m+DnV87yYL6q5Qza
	 Bjlrr9a0UWeyUBvVZ85HvxJVGwYV+2Ha6gNf6CmS56KtgQXcModA+Qe1qNDJjHcnXnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=;
	b=RHYMv9rdfT1KlGrZVlnz0UPXq6b9m2PDsCBVv8nQvi8REI1pW729gziBjh76kKVfPLGH
	 CmQ8Tv6c9/VMgC7EmyP35m4pq4e9zRmoy+TTAEv6NJ3gMlBjfWSDCEIYuis91hTOHMhEN
	 e81xkQP4MV+KjfWAKxSNrwQDAqYNQq4pl0kS2GLZMwoYHMoJX9zWOqDWR6TtgUBYT88j4
	 Yged2MjEWsycTHq5ssOzOWgkIJS8oOx0V2ymlwCTwfw+CaWC/O/ZinILusozbzdfw7E+b
	 mo/45tJ0BuFGqTEfH99Uf/9EZhVIlwb3qLWcBxVrvZSdUg2c2dWEarExuH4mL/Ccr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UqkKt1xQ;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21321606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21321606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UqkKt1xQ
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso34933515ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793095362; x=1793700162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=;
        b=UqkKt1xQfUNMyUdLqOO4NqK3gqYAvB3AShLTMnUcsqoQCtKUYzBViEyuyiiVskDvTB
         eUEN25HA4GqaQ9D529KkPaWr57j1veiif2v9GONo9enN/EeKegp38JFYL7ivDLB/Aus4
         7nIrWRPCaYRsc+4O4zWwj7p6yc7pz45FtywPxwsgUd7LTk7t790SGE8/hOMX5RwrOlgY
         +VFE/FVM8bpMO9DxIUkAmh1THWCgrLA3mYyfQ/Mff35OvEVafWR2r8v3z2zmxtVIwi9Q
         yDgLk/mpXnZlx/B5Xghq8yzMKK7AmAeuatgNyfLCi/CXMpVNL65e3+0QmO8hNycEI5pt
         XR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095362; x=1793700162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=;
        b=myBnCen++sbCwuS+ZfIESNAeuT9Ex8kt27yC4mgd6tRG95D0hGjYwXzoUDwsXbql4z
         2hja4dqZ+gpwS1ydBpCuKN59gaORQHqtBecWGH6Zuz/F61VQs1hlmLbG817KA7rNG2bF
         +E6O4PPvuShxXi+jK1m9nD/i0b+XieEIVdF1x2dacjyqRkj3lFI8Ehte1Gebovw5ylv6
         qWqo2gehYO42Y+a7J3tBrHPkLHzAr07+Nj5Ach9CGz/ibtKfFp70+xzj3WMPddVcNcIa
         NnIJ2SmXrpATwHPVK95J4QuSjoK8ovlB6LLPtVXL6w7JX2SJhLQ3O3PnA79Yi771LLLF
         b1gQ==
X-Gm-Message-State: AFq9FYKvZet9R0U52ppWNTRjXa6Sr77ODwz7cYw6HHhmum5OcAjuZj4A
	VklE/h9OqXT3Osz+314qqOm9oynepBoVUreOSd5UqXOUJQwtSaKqaooIJiMU1Q==
X-Gm-Gg: AYBFou2lqh8aPEoKlIHwUrN2EmkjRaAAJtSKeAgpUnpsxYtQkXgW4HD8EUM4T3ktkj+
	MRB5NpbD738qK7yekn0G1uHbKUWaNostB2wTaYcB4ROeNbmJ/fsZc52uq+3Up3HoDHI2SquPK6s
	P5GU3mGzvZ9/4Oa1G3XTRVPujLGG2JxBRwmtZRjnTQNCREDJlP2xjAXaabqtuSphUErcaiiUbDt
	3gudAhcED2opOqc4iVC4o0yohSTtIABd/nUWuk2scDmDJr0LiM3wp5H6ipp2SsFoy4obGHyE/Z8
	Ywc4hRXSZF18qdlsDBvmgeCvvGs1LcWyd2JJq4AgV9Byst6XdeNneBQKKdIDutKZgHtifG6Kc/U
	HI3I0IgMzQFDZELbuevlxUrfetMMMGVmEIqRLWrPs4HJCtAakjc1MoGHzBNE11nBn2bo0EICJK3
	RRNCtNrnuKVM45CMiZa7xm+0hn6er/cetP4g7VTt4K6oMH0phAmY92B53u0V7sQl65JQjIP1r2r
	xnrxztSrlXMZG0uSoUnztd0879DccJt3GR3ldhneI2mi47SdlgjtEp7qVD4QhMTsyhz2Ti3pyEr
	yZkoqckutzVCP06lZmJOl0ItxukGL/s=
X-Received: by 2002:a17:902:e5c3:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea9c68c6fdmr88394985ad.16.1793095362449;
        Tue, 27 Oct 2026 03:02:42 -0700 (PDT)
Received: from localhost ([47.88.78.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm7074135ad.5.2026.10.27.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:02:41 -0700 (PDT)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Date: Tue, 27 Oct 2026 18:02:27 +0800
Message-Id: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

From: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Switching to init_mm should prevent further accesses through the
previous address space's translations.

Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
to the init_mm") avoided installing init_mm.pgd as a user page table.
At the time, the ASID was held in TTBR0, so installing the reserved
TTBR0 also switched to ASID 0.

Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
installing the reserved TTBR0 no longer changes the active ASID.
Consequently, switching to init_mm leaves the CPU using the previous
address space's ASID. An empty page table does not prevent TLB hits
for that ASID.

This can retain access beyond the lifetime of the backing pages.
During fullmm teardown, user data pages can be freed before their
cached translations are invalidated. If those pages are subsequently
reused for kernel data, an erroneous uaccess that hits a surviving
translation can read or corrupt that data instead of faulting.

Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..7e56099c5fbb 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 
 static inline void __switch_mm(struct mm_struct *next)
 {
-	/*
-	 * init_mm.pgd does not contain any user mappings and it is always
-	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
-	 */
-	if (next == &init_mm) {
-		cpu_set_reserved_ttbr0();
-		return;
-	}
-
 	check_and_switch_context(next);
 }
 
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..a96ebe904dd7 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
 	unsigned int cpu;
 	u64 asid, old_active_asid;
 
+	/*
+	 * init_mm.pgd contains kernel mappings, so use the reserved page
+	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
+	 * unchanged to preserve the ASID rollover bookkeeping.
+	 */
+	if (mm == &init_mm) {
+		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
+		return;
+	}
+
 	if (system_supports_cnp())
 		cpu_set_reserved_ttbr0();
 
-- 
2.39.5 (Apple Git-154)

