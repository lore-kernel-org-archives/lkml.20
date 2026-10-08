Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2653EF649
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444663; cv=none; b=B9XJ5sualMMu4CNHVOEq4rHImzHTURs+zGJqf8I8fokJ4Oc3NMgI7GS5hqe3BTZ4GlH7wAkHXYtCTn5olUTf1MnJ2NONEVwCGn8yiLi6u868z9jq1gu/MAt5X3tqdaW9ikZkG0IvMm4WYgkPISmb5hfoFJXJRF/SxEEIZuYWA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444663; c=relaxed/simple;
	bh=QoqC5FWDPTguiDUacor1rhogobE1ykW+PVHQtFAmfKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBESnuRI3CIwAKLZ90jaksh3X81IxELX5BLyZLI/ckjcSuKmqFYY5Hot/+u9h95tWQvE/V+iPtzUfZIkr+DIBhZHFWqwlpYrqvQyA4kuSK+Hb4aTfSDv5XMymGCA2vjx7cUJ6nOaDAnTguFIWjshw+UyseCpEZ2eUcWNgNIRBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RoLrBi5k; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RoLrBi5k"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so175691a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444654; x=1792049454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=RoLrBi5kBuiZ/K5MfYcTf89CF87DRixsB2FN3nC5+9gEFiIN9huoTPPcDeWNhldgFH
         lTgcOQMaKasNhr5kRzJh+1oXFAG4WwxYQO1LO6ph/1Wdt2X97+iriDG1uky+p2IzIrEj
         nFAwE8OGePwH3UUf0HEgaHte5kFCNv7vMrZu2NOdd3FHYoUICMRW6ZGpK9iC9mOCGsTS
         cW1AtmCGDrkmKCage4N5DswIs000wZhcXhRJyXeO6Fmk/vvEu8uIdZsV5RbV2nuRNK8I
         eeY5KiRgdLZ/rjZJC6Y/rQpjzdQvFEdcxFx8KLr0T4ssAo8+crZhGL2uIedNLQMMVHcf
         f0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444654; x=1792049454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=CipndVHvcFPFyKsj84cPfymzF0cf7l6WqqpmmD9Ui8azOq9mNv8b/dGrhlxt/vMrv6
         BPBngXKkxyEbB3c497ccB9/p2/c9gRXSxw5vuP3mBhrS/1KSpd/i4/+HyBaGNWndoApj
         zbHfMiw4cjK3sH8tFvjD2frBws/tVNp49P5S+kdc0IQnmXMfuShshY8O63t0IQgCElyS
         Gn/ckq56NZsses0hvKT4Ssywf+NrJxAE1su7Hbw8cbWOIFItkKGBOXuxMaXpY67+mo5z
         4Ri/nJqCaKK8KwHpHBY/rYjJgnOg1EvjzKfTmxkEeJCbqLDb6iNFqts4Fz5mgmAhuHnf
         B4zA==
X-Forwarded-Encrypted: i=1; AKwUvBwDZcdloie6wnysNiy/6vtU1FMUUW5PVijMVULV34nkUQRccndN4+I+9iUsx8SsLXqJ/7MlI/+s2O8zynQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb5wx4C049YlpEAYx41cUPgWHNe1cGuepLZtIxHbB9CorLAmsY
	570rBkB0zWwFtNdzmbflmpiODWcncQ1MU2XiTw7B6V/iOX66p9X0/ZDCIRTvqpCLCzY=
X-Gm-Gg: AYBFou18lk8AELDZ127oLLGEKSGVDB91wYZX2h/CNPPlsfwvY8lq92Z1iqvwRMpGuaW
	Vjty89YHwooSm+Q8QYH08dwWg36NutJhCzi1F2OkCozoLr3ij+StdZx3ym8KrtyFli6zHpLkXk2
	a7iwdsNe1Dp+sqQd9uZ+ogwXMooGeTOTxOyBcsczBls2IH7szP/OxBwxssOq0JVnjUre/PH+y15
	YHugtWbf30nk6/PrYqcBkTg7cHdCv5NTyCI4rqEPVRx+r9G5vqVtGG+S3pf+uOR+F/wbJJB2vnL
	W3HOJm+dtbLFnk4OcHuktE0plJiu9gRraYCVeYYj4WCwpQhBOq7b3NzlBRrd7wkqyfhauY75Uc/
	E9bTZeHbvWe54K5b3BPonfF9DVCAHHj2KBNkkkz3ey9EIte0D1PYk45eK3DuAAy+eBI8L9TS1Fr
	EQSTLeatnuuQOPzWrRfZrH1m/ThBnsM6QYJWqCfaNUoXbkmeRb2jocvJ+pB1eFv0HlYxvFNgGXB
	5FqGNi/Xq2g8zQam0oa
X-Received: by 2002:a17:90b:4a50:b0:39e:6c68:fd92 with SMTP id 98e67ed59e1d1-3aaed9a2992mr859363a91.39.1791444653999;
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Thu,  8 Oct 2026 15:30:20 +0800
Message-ID: <20261008073021.2512665-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pagetable() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 429a0b015ec1..62077539ee78 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1540,10 +1540,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pagetable(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0

