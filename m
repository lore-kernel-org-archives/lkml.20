Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F01E5B63
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791678666; cv=none; b=druAatczwDrg4R6ofyzhVPZ0HL/1wAb+lUrkZ+3BLMgbr5gJreyFAohlAe5eyLUGTK4pmiLeOAKpoEhZFUi1LeTRRBoUvjuzYwOFzGRxnYZmdGHni6/NYaFXbduo1ArlsSbTsbooSMAXp4Dy0GCCiLovRyz4TF750y0bRTPUazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791678666; c=relaxed/simple;
	bh=livfjoHBpMZ2I9rsAu760FCHWhyj23URGY3nYYzdO9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0WPWtCKt5e+HhI9SuX3sFMO6UKNgu9ngTWXIjSO3veQ+rUz3MFr7LrlRIaekUVHLdInw5lEJdVh3ajDx1h/fSzn+P9LYaYngj/qcjfLZZO3iUxU3A2YK/xvbSQ7t8EWMtWcaVN9xjfqMDGZh6l4q7THPNNSpmtc5neRBP8ZYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVqMegzb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVqMegzb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so321887a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791678664; x=1792283464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ip1A6CngHiq2WamXxahtB2LL7CsCqEsAKWuGP1PVcRQ=;
        b=dVqMegzb71m2ZHEdx9DdTvTnF8bMpqNB9DgLxXTgw6QxTj/cm4ymwj+NYNcWl60oUw
         pWwFtyMQVSe31L02ikJxr7l9iJ9rbzbWmR/SgLCLOnkjyu3EZJiwEGpZSUpwOA5r0kUc
         NecbgXmj+aknTNhyu53U70zqPkMEJBBsImz74KbLAvImbaYqme9sHBKPcqGMBlovItNr
         v4Mwy740mCCpDX3EtxoBpgiL7h38mS908cJPY8q/4GqzStONrwBveLzXGYEqBRcgUn2w
         9k1KJHcM8McG9dKgZLxYoMYjLd5EFFTMC9WDvKQLcUSNdxEaOfN6GaqLVXk2HEispthJ
         Qejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791678664; x=1792283464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ip1A6CngHiq2WamXxahtB2LL7CsCqEsAKWuGP1PVcRQ=;
        b=pIph7ogNnWyBly9Dhmj6e+0rYi7KwG8fHBK4WEmfs3EdjTvdgynXg1i7pOXKuJM5zk
         RiD+SiefTGncWb9zQXy69lgl6lujst3GJ1SMAGwXpENJpA3nTVy4PuLxSCHULtrDyIwX
         yR6UC4LxbWfG0PHKyxYvulSBPqSrPAqJqvU2QFi7tblhrGNFH4rX5m76xrZ2QrqgQ9B/
         1TKH2Z/M62T7wk/N2t4GrjlGaZ7pFeE+SemxgYtDDpwLMVClwYq4a3LvRUESzvLdvNno
         5br6RYtXOG62lSHZb8PkGDC1cL/79oN4jHl/LpLL2LRDOAJ+R0/tWAdlYAEVA2O3S7Gm
         U8nQ==
X-Forwarded-Encrypted: i=1; AKwUvBycPSGNPn+iCoV9x9a3j1frL1MHMCKk/PoYN9cW1r63pMYZWdup8au1Y+iFR2uQDsWvuh8Q6mzVlS2MX7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRouAd3p9b3iPqyqk99AR6H2qjnH8Im5H6ZV8wRUGuDbwsixed
	sHEFr+zuubFJVonLpYJYqaQ6WglyNpBftAzX0xExI+zim7afN8Uul7t7
X-Gm-Gg: AYBFou3LtbWx4cr7y7qu4VmccdJxr4uYGgZ40V/ebwQIXymHV22gW3ZIibb3NGMJzTW
	3s0fxUbl0Ke7JlUz/28ms9ItmlJRzA1Oqvu83+cSOJLaWzR2AA6ggja2co+7rc5j7fyG+Lx8/Pn
	RHM8clhgk00HAQMJK/PSj6ESXgBRmA5KpkWX05bsNCju42L7ouh0t+z794dK25ub1zBYPwLZLLb
	HnRg/HpLbbAZGhAy+d0Eqm2ndbq+AI7BDA9bz5SpZFzrML1e9osaLmT1DFnYmx0M6P/KmnP76uQ
	bgR7InBKdVBazcgcU9Onf7SypnJPX/IQzttn4E593/4AvUJl7Os8J/ZUzZqU1wTiu4oqZ5IRkVN
	Bas2laH39/92/84eo/X1x1LsglpLcBvdNuQZIXiy6gl6+2ynlPwb6xAimIiYFIVx9bumraL0k9b
	qXm0xYDr2x/0gYMebguoaY8wadQaHkbVHFK5zhUMn8/c+huqOSv8uxAgM7i6excU5cIWsI0UrnW
	cojzwNXGsEiQ5nDhWV0Bvxp8k17rd/dvILOm0Km12WhoQvgDi3Cg48FZO7OlDk=
X-Received: by 2002:a17:90b:4fcd:b0:3a1:8b70:d46b with SMTP id 98e67ed59e1d1-3ab3ad2b1damr4674660a91.42.1791678664191;
        Sat, 10 Oct 2026 17:31:04 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm9681761a91.16.2026.10.10.17.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:31:03 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm/cma: fix list_insert_sorted() ordering
Date: Sat, 10 Oct 2026 18:30:58 -0600
Message-ID: <20261011003059.169430-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_declare_contiguous_multi() uses list_insert_sorted() to keep its
candidate ranges sorted by size, largest first (revsizecmp()), and by
base address, lowest first (basecmp()). Both comparators return true
when the first argument sorts before the second.

The helper stops at the first existing entry for which cmp(entry, new)
is true and inserts the new range before it, which is the reverse of
what is needed. If no entry matches, mlp is left pointing at the last
entry and the new range is inserted before it instead of being
appended. With revsizecmp(), inserting sizes 1 2 3 4 yields 2 3 4 1
and inserting 4 3 2 1 yields 1 2 3 4. The first range inserted always
stays at the tail.

The caller relies on list_last_entry() being the smallest recorded
range when deciding whether to skip or replace a candidate, and on
walking the list largest first when picking the final ranges. With the
list misordered, a candidate larger than some recorded ranges can be
skipped because it is smaller than the first range found, so the
function can fail or reserve less than requested where a valid layout
exists. For example, free ranges of 4G, 7 x 1G and 2G, in address
order, with a request of 12G: the 2G range is dropped instead of
replacing a 1G one.

Insert before the first entry the new range sorts before, and append
when there is none.

Found by code inspection and checked with a userspace copy of the
helper and the selection loop.

Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
Cc: <stable@vger.kernel.org> # 6.15+
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 mm/cma.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index a10ea37a261d..527b2d894f3e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -348,16 +348,12 @@ static void __init list_insert_sorted(
 	struct list_head *mp;
 	struct cma_init_memrange *mlp;
 
-	if (list_empty(ranges))
-		list_add(&mrp->list, ranges);
-	else {
-		list_for_each(mp, ranges) {
-			mlp = list_entry(mp, struct cma_init_memrange, list);
-			if (cmp(mlp, mrp))
-				break;
-		}
-		__list_add(&mrp->list, mlp->list.prev, &mlp->list);
+	list_for_each(mp, ranges) {
+		mlp = list_entry(mp, struct cma_init_memrange, list);
+		if (cmp(mrp, mlp))
+			break;
 	}
+	list_add_tail(&mrp->list, mp);
 }
 
 static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
-- 
2.56.0

