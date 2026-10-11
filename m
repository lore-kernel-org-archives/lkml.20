Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B545D918
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748674; cv=none; b=Q4NObgYaGZn6J8aMr4hYTzpWN48yCgWmtRzLgy6Int443ohgUzSkbN9ljwAJqlRbLKt/9xMkVCMeUcuYMIhXSTsYSMnZUyLxPa+tqIMYmryciQXECkWwFU+xdreJvZ/hFTWB6ZkZZibHuYM7BnLie8PKLtM6YE72KaPC38HQoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748674; c=relaxed/simple;
	bh=9F9PqYLol8RYefMryvIE9X8WcFhHN+25KlDi07fHopY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BL+05BI/ifhby7bC8MvtNAf2k3bQ8Z1fdlF4Q/z6Rnr6Sc6aBE9FAAcOQoY5n6o/ryQMqBDE6jl/oPBYqPyLXQL+ndE4EU7XU7/Bora1OHEOUJXVG4/u32w5IV+hECi2yhwrQnL6DCmKAc0vRUcej1nB6B+PFh+G0cQzVMe1yjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu6MxJgG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu6MxJgG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e3846d1caso220300366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748672; x=1792353472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey4LJMK8RV+MV7vSZrPUmikamurNbFQxbI2le0bK+bM=;
        b=gu6MxJgGhJ5fAuNey0baEcOvMpS/TXv1PMlzICuUjfuRcIWwg7oXnNfZbT2TBx+8oH
         zghvz02xttXd3lmZDw/J2j2tb2Tnx09itP7Hx8INrhakLgmg+MhFOXExPokaZo4pBaK/
         gvN+PlzsAbR/5z0JjcZRUb5rFA+UyZI4RbNUfVBHSm/oGlGtSFcJeJIHKjJXamzbj/Xn
         q9FLJMUiYdkWphP+YOUeamzsHFX7Cfd6dWZ2Jm66Ki51kGI5vWpdz/8rom54bV/j70CY
         r1Y674ahs10SCFMtmngXAhDdwDwwPga6G6N/x/8yduQA5bTv+XwAm3zPUPGpYJ2W1FLi
         ChCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748672; x=1792353472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey4LJMK8RV+MV7vSZrPUmikamurNbFQxbI2le0bK+bM=;
        b=Z55jt14m2+ry+78V8aiQI6bELd+2y/6Oq0DJkY0i9xQfAv4HJBz1n5nuKzTJbq5ak+
         OLWLWonBl0T9vpRrKwNW07AF0d+iAHD0khKUSY501fZ99t73qEwdH3+nBFi5e6RkUq3a
         i1U+ACU8GaHFfxns+JmL3QWJjhkhjFnHRYthylKKYOLhuqUiCKQoB6sNp0RoHAyL4Pkx
         g/joklNCYhOYfmZhhluOs7OD9x0tsdwkv6Fs4km/TllSFXD/m9ipXvaeRslOsjhmRLtL
         VbayLs9OzVqBwShyW/8EK8zguMP1s9/TkE18YKADQ5sCOPYFRcMqsw9z0ER8r8GenqVM
         UZAw==
X-Gm-Message-State: AFq9FYK+gUzirB5756WOgy9xUFwqJQa3HR/t0+XUyGl+aWBboUkkoIDc
	Hfkx1fdANytp0O4Bff4VZfEWQlY7GEoxmQi6NiN0O3A9bF/dQUt6zRt5
X-Gm-Gg: AYBFou2PHLkSjI+NBciYjlYBr6BSSe/Qt0vpnHRaQEz87pU6NvAVnEAN2ZvAgbhpWyp
	DCBQsendHT+akm/ZdQ/P4RkH4vVji9jWGNO7yXg/4LWprrgUNvuM9bBmEHnV54ZujHlRr5GMHRq
	qlYMiW5HJKCP7FVJAq2ekYQmPZ7NcvdJqmkIZiiJ2mNN59zdVc3Fi58YshjHzk43cJgATpedWK9
	pJzYU9c1FbnRDQHe9iReq2Tw23oWUeB6BDR7hGveHg8WJ91+0aMVt1tYDZtlnYci94Vq/kjfKTr
	QtsfuGCCxbn+QzOBzzL0ExkkbW8DzAc4CRV7wf5J1KrqWfVtOO0pjOZahnHkaHUGpUxpkKTd0iC
	Xl72scW6sbULAWAwZsDBp/uswOP2oyd9/jRTDXZEJGJrBiFJOJi2S8oXY83un7hL6afyUXSNYNb
	Tz74w64hAYxGhvgMbUZ/fL5mZxmWouXaVol8DqJXMFQ1KXlF85TbkTkee3iowHYNsMS7FD3jrrm
	aiLOfVUQQILqE67GPirheNX5Irkd9Da5lkxl4b7
X-Received: by 2002:a17:907:7fab:b0:c26:1691:b368 with SMTP id a640c23a62f3a-c31a9f6b728mr805802966b.33.1791748671740;
        Sun, 11 Oct 2026 12:57:51 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae9fsm381315566b.26.2026.10.11.12.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:50 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 3/6] sparc64: avoid huge kernel PUD mappings on sun4u
Date: Sun, 11 Oct 2026 21:55:55 +0200
Message-ID: <20261011195729.981243-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011195729.981243-1-linmag7@gmail.com>
References: <20261011195729.981243-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel PUD refill path merges virtual address bits 32:28 into a
TTE, requiring a hardware page size of at least 256MB. On sun4u,
kern_linear_pte_xor[2] and [3] instead select the 4MB fallback TTE.
Consequently address bits 27:22 are lost when refilling a huge PUD.

Keep the kernel linear mapping at PMD granularity on sun4u. Its refill
path preserves bit 22, as required by the 4MB TTE. Leave the sun4v
mapping selection unchanged.

Fixes: 0dd5b7b09e13 ("sparc64: Fix physical memory management regressions with large max_phys_bits.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 103db4683b16..0ae97e616435 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1696,6 +1696,14 @@ static unsigned long __ref kernel_map_hugepud(unsigned long vstart,
 static bool kernel_can_map_hugepud(unsigned long vstart, unsigned long vend,
 				   bool guard)
 {
+	/*
+	 * The PUD miss path propagates VA bits 32:28, assuming at least
+	 * 256MB hardware pages. Sun4u uses 4MB pages here: retain PMD
+	 * mappings so bits 27:22 are not lost during TLB refill.
+	 */
+	if (tlb_type != hypervisor)
+		return false;
+
 	if (guard && !(vstart & ~PUD_MASK) && (vend - vstart) >= PUD_SIZE)
 		return true;
 
-- 
2.43.0

