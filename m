Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AD3AFCFA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631577; cv=none; b=R0WoJXKiiE5zvLDcDqyRB16kNdT8QKQJnJIoueZiAIAQ1ZcvX4WtiThmSMr0SyH7l8SHN/niVPKp3yqMOyot0lb+DBzOTZbebJw1VfxEFb+QQcWw+fmk1/mrOGm+KsMgWL/J8MENm9ga/JwTXPTLGkYdiRuTU+WLFngZY3MIVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631577; c=relaxed/simple;
	bh=yTr3LJcYkZmsCzJ8FbObXApgQ9HaUkr4rcHlXE7XEw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVc860NKKaJe1710Uagl4aXkByq2jYy7Ei0Agn15ojdl4z1RdSLuBhNFkJxRFAwDAWUe1nw9CmNMvYAY5gIX4gxXbBSvybj0Rx8e9IzvrohqZjZvStGbDdMddtKZH4ZV2c63zk/HWWGUFm28Ej5t8R1r5jJamI/8HwOLSMXXuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RfTOz5c8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RfTOz5c8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so342523a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631576; x=1792236376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=RfTOz5c80lCizIPy92oWGoZQ+Pq7doHQbFqm9cThd9/n4H5LdtT7YXR9iY1zI/yhmw
         /2A+tqe80SIPVRPdkRt05pftBt/SBIVC80gY9RrELUN1DPTi3x24QNK462uVz4UoVzR1
         4QTcgh51n4Cz9plv8NxtdlEenfYJAQwh1S7dpuguJdrVuodCRgHtrOxAeMl9dCLJgzzG
         24QWty3r/DZ68WAb4XyeIbix/9FU6MBj7V+f+eVoN1gclYX8PtoEbi7B8184cc30jK7N
         wu6xw56bdpCctbC8N45d27buaibu33+klwt+YcaWKjby8QHx00vQ3OUYVqB9gG7ZGj+3
         TiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631576; x=1792236376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=kTQta4UOruTWU81QQVDJ8s+vYTnKNLb0CJY0P4LwIk/nAphnvkFmHBhxO0fZAtDs9l
         5btJvG0XCMREJuE3d8Pl82kGabz+8ylMgBvkmdsi1ceJu7rMduIWQsU+P2LL3qJ0DmiI
         3Dxr49en98RWpkxCr60k62SEwvYXUDEHLJs+aLt5xwOPp0XaFCBTC2ddUUwPGfupvX8y
         J3bS1X8IOMROiwL4ID9tjFUYqbp7P1PCeX3wzm9YFN9iRyoUnO7+Ifthm+8PVf0mcF9d
         F0UWrGyQmkXrPWvVvxzUzlZ3b3gM3NtgGWR354M56RX2n3+Uy2A6rywUpCF6s9pvbbV1
         SOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIiCvP2aCweFDlOOwVzjGnwujP77W2/3s2lE7HBtbqrvslkNvwPDEDy50T5O9tff2xgBMxP3uZfHLrfio=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVTPxjVZG1OkbPAFxkqOqaeljXCwXnMms7BCp1PZEQMO4hCu3t
	zGq1ZOXSWxbe++J5BrwPSlQJWkUJKOB0i3AyORSMmzqIoMgwvmhoLJvgXcS8k/JhwwY=
X-Gm-Gg: AYBFou3ApQwxJDM1n+xBh0hTIOSVtWYktbvGJdHO621YuFXqP8WWeIfA2Kv3kTxLPJz
	8lJbgIvKk1IP6dAb/sWImyZoeou8IfZcbFfVCXDhDzGOTDeGBLBPeamoORwXg/L+DmmGYiEKcxW
	UWVGzr+fQfTpgJmXba3wzsbdu0Rns8qWlingWyFyd/NXM21toqYmqAJNQMltaQuHbSGcKAhGqwU
	k9wS6QLs3iKYYp6q3o7KRtecQycVOPyjcW4tZdfY4FS3Y/RmFnlDV2ObZUgO5PxyTohN8e3OJWj
	hNRSXzs9nvYF8cRZidHGFRP5uzGQUVHvdMu3LGuVhKw7q2v2zKvsKXiTw+nrNjT57mHeYmhzd3E
	TSkoOhrrBcxxgz/Xtyw+1Np6gD9NdL2MHvWwOMDFwrGjYOZGRcx8sBmUmn85l0GhP/BJ4a7+d7u
	FhC2E/8Z1+M9UER08SDotRtXXex79UQmFKB2CVFHudQaRuIZAwuDWPQKx47iepRDiOcvmU1v7Bc
	9w3njt6ibVZxXc1LLuoieFMte6hvhnLdAaTUg==
X-Received: by 2002:a17:90b:1dc1:b0:3a8:96cb:fe8 with SMTP id 98e67ed59e1d1-3ab3a2fe583mr3989437a91.9.1791631575680;
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.26.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Sat, 10 Oct 2026 19:24:56 +0800
Message-ID: <20261010112457.49485-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
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

Free PUD tables through the common free_pgtable_page() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v2:
- Collect Acked-by from David Hildenbrand
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 151eb197cb09..4914864cb350 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1538,10 +1538,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pgtable_page(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0

