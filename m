Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552465;
	b=X+sUGY3nz6r30Bj1BN0lyhB0LS+gVsrtJ7WRs/BNowBFDVyVZWZPsKtYuZPhPLri+tIV
	 SAba3ZndAA8zDGOtwTS2vaSEi9CQtO9/WGqq9g43ImlxEEgrM0TFXA9yjHXrleSsQYQ0o
	 wk8jZ/HFnc+JSg1JQgbybrAWfnpMEMUgKmrlGrODDFkOUEuSVj7yULV0yHqVAfQUqwaJq
	 oxgrC9uDcc0vzDlOgMsoEVrHvsq5/2A1ywUBMBGyd43cZ5dkUQEDk6bg0aBymkW/q3JJe
	 /lP054Cj+cfRmymMBNCQdL/FqylAXksqcW/wR95mQxAMY3S0wWxJoxPgB/eUpPe4MOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ROsDDi/peHhOy6BynZJX3N2nHlHF3d+geUaRBvCkIfc=;
	b=y0DAosqlEP+S/873jYlbUowGs4/lhZTQoEM29Hf0d8kbuKxugc42ZJKChMIBHCi/TVFQ
	 rBvmzm7ceYrQ39PxaxMo2U9JJVKI0/No9r56kzn/zEUu8rYy2adYhGKzr7HWDA1EXlb0W
	 TCWN18VPqw0A+MclMNwfWyTrhjNSeRI+SZSly+HSCrbYHtCblrEfgjx3RID+3PiZRfgMO
	 7RzZuAh/vTWCBO+Wd7a1I1zNA0xHsuvrpNuA+YDN5w4Y5Fio2+xcUg5hmXD0kQkyViizV
	 Zzbd6aPxcKoP63lG7uMmkfwQJZzS0UEliHKY81PuEUYXfwuuQTByEaJBIQvvEcIXsvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1TsPBwM;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECA606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8ECA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1TsPBwM
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so2754696c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793552464; x=1794157264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROsDDi/peHhOy6BynZJX3N2nHlHF3d+geUaRBvCkIfc=;
        b=F1TsPBwMoLjgBx5CuDe4M/U6iY84TGXhDM8ujtQ+4MsBnfzmb67AOTiiRi9DcLBoxD
         VzIQ7xBJLUolpKZBW3gzsaA1dOtO4FahVvzIU9PW1nI8MqM8jAN8xHWQMbAjiK1/4Rnu
         POPpuVhrhLvoksaEiEkhCxYqyvh9+8iXxmhY6BkPneTHenqbg1HCFYjF54eArH+HK+mw
         y5IkOonyGBExt2XlJHdeTp8Bkq/R2w59rbVEqiaFxXsVOmS3ZkJO2MvyereEc9OuHdcE
         zlzgK05D3i5izmXqsDBUAOe9+3iCXFLgbqSu2jkilq25RSAggW5yA/W31bsLX9VqbwHw
         Shzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552464; x=1794157264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROsDDi/peHhOy6BynZJX3N2nHlHF3d+geUaRBvCkIfc=;
        b=rm4WnzWAGFZpaV4i17OziOi22giCSaQVssJSkTNAR3D6eYxWk+i/p8mAe/rJ8fRUPJ
         URL+vS2cXPIDRf0JMy3BOpAJQTykARI7iK1q8ywB++Gs8ngMyV7M1CpZMfskZQmXZxKv
         BEWGxpP5NYNMY1qduT4eUhFDYOgdAPM5DzvDuVcsQ/0bmRuH/yOplreJGn6XPEHKOOV3
         EyhUuhqwCp0w8U3MvnMEKNWwJ0G/ea5hrpyxl12DcFNiq9wE5OGxDs+qrcGzOTbrvPAQ
         W2rMk8EU4VPLu/F2hs0Io2MQlQyhXnIB8FxftK//vQv6fDHInmlOSWwMhpqvLuH20ws7
         6xFg==
X-Forwarded-Encrypted: i=1; AKwUvBxHu5ROGErYmHdiWUGVDvc3W4+kerhJBU+Eon15kvNc/AYa8ypcBDApj0d/7RUlb5oYXHvYKBlaP9QGgxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPXjwsORAzQIPsD5REW89bwsyq8NUU77rLoV8pTw+l62INd/Fu
	GKJZtea/hqZ3aMCrnuYSkPYiG64kHIKJLerkqvagZ5+KtJqYArLGU0oY
X-Gm-Gg: AYBFou0MzVQQ7LchKWbpsfyon+fl2x5aE5O1bOeqX8cSdCLWUUBIpfx78o8yTEQvZtD
	RVAzXEGEE0FTHcjnp0qnUKsiXuEwrufQLNRFk9SWPJRL1O0rKhP9i078YX4Dnhg93XAmM0LA0bz
	nwV9dJi9OxBE6nC5GntieeSb4wyeViu5ep09WobrPv7oSAjB+evQHSRDPzyoHqc4sF5DvPnZCaN
	LvN5kyBjn/meXsaSEtyk4nrGgUQlrsXfmVEpN0rvtmrqIlCrCODWNxPNhQ6DUtLN1GkZY9lT1Aq
	SRaq1WvfJR9M7mrYucRAmxxdJCncX1PRX4myk3GWnDY5NqFe1umWBr7MzqvSsabSJPGCRBGrJci
	Qhe4BMpQ/bphwot7j4Z7ApNd0f+57Lfb9h0/G021AjhdWsXBdAvkrRIMeQjvqIv6P1JM2UzU1S3
	pcC5GBujnueCF31Wl+HVt41B9s13rqDdDQcipXrBRZNvRgmRDioTyspcm7YsqLVpGzINPCe+I9Q
	fETW0TdrIZzMWtc3fenvcm1KKj9uzOt7haPwtjykVo9WhWY0Zjl7J67pSjWkSuF3uDfQF+C0t73
	mwZMZaum7c4VzGsCxmk64+vXhN30hTYf8sLGo7kVvAeWjD+CVAocDnKS
X-Received: by 2002:a05:7022:f50a:b0:144:eb46:be0 with SMTP id a92af1059eb24-1ac5cb19684mr9393895c88.13.1793552463413;
        Sun, 01 Nov 2026 09:01:03 -0800 (PST)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:b5a0:ac44:5583:ef02])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm25456350c88.8.2026.11.01.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:01:02 -0800 (PST)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Kelvin Zhang <zhangxp1998@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Kalesh Singh <kaleshsingh@google.com>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/proc/task_mmu: check THP exclusivity for each subpage
Date: Sun,  1 Nov 2026 09:01:00 -0800
Message-ID: <4c1b393a4b04bd94e4f1c7879ae04e1793eb0931.1793552446.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A PMD-mapped THP can contain subpages with different mapcounts. For
example, after fork(), the child can unmap only part of the THP. The
parent retains its PMD mapping, while the remaining child mappings
are PTE mappings.

pagemap_pmd_range_thp() passes the same initial page to
__folio_page_mapped_exclusively() for every pagemap entry. With
CONFIG_PAGE_MAPCOUNT=y, this applies the first subpage's exclusivity
to all entries, falsely setting or clearing PM_MMAP_EXCLUSIVE for
subpages with different sharing.

Pass page + idx to check the subpage corresponding to each entry, as
was done before converting to __folio_page_mapped_exclusively(). The
index already accounts for reads starting partway through the PMD.
The conservative whole-folio check without CONFIG_PAGE_MAPCOUNT is
unchanged.

Fixes: eb16876971ea ("fs/proc/task_mmu: remove per-page mapcount dependency for PM_MMAP_EXCLUSIVE (CONFIG_NO_PAGE_MAPCOUNT)")
Cc: stable@vger.kernel.org # 6.15+
Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
Tested on x86-64 under QEMU/KVM with CONFIG_TRANSPARENT_HUGEPAGE=y
and CONFIG_PAGE_MAPCOUNT=y, using the same test binary before and after
this change. After fork(), the child unmaps the first, second, middle,
or last 4 KiB subpage, while the parent retains a PMD mapping. Both
bulk pagemap reads and reads starting inside the PMD are checked.

Across three repetitions (12 cases), the unmodified kernel fails 24 of
84 assertions; with this change all 84 pass. Fully private and fully
shared PMD controls pass before and after the fix.

 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index b87d3e86442d..da4319d972e4 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2038,7 +2038,7 @@ static int pagemap_pmd_range_thp(pmd_t *pmdp, unsigned long addr,
 		pagemap_entry_t pme;
 
 		if (folio && (flags & PM_PRESENT) &&
-		    __folio_page_mapped_exclusively(folio, page))
+		    __folio_page_mapped_exclusively(folio, page + idx))
 			cur_flags |= PM_MMAP_EXCLUSIVE;
 
 		pme = make_pme(frame, cur_flags);

base-commit: 64703f0fee7421f0ddfcbd8ee1bfa53b25ffc4ca
-- 
2.53.0

