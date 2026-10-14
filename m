Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2940F747
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950361; cv=none; b=XD0/xhBwR25VR3yGkBupsoIKA6qYVRqOgkgwP8Sn3gahHf3UewWyoV1vrXsFJhwYD73+6Tci3+hf1ZTquCKpFOwCWqj+5IM8jyzCtuSQmtbrXNZEasD3e0V+xea7mXXHzHA7DY8s2MtmIvCyAD0yhAUjbeovuCxlHnM6qZBXg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950361; c=relaxed/simple;
	bh=eo2KS1rD2mthJFfkPWGzxyjARkBBzJ1ObzuNrYesD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpCEgyDNpo5JroxPiOd8zOo8cKtoKEm+0+7+0i0Skw2kpC3XKRP64MMn+zapZWLoI14moKy0HRQ/x7x4Djm5FU2G2Oi6GwJ/Nolm0UlLCloQbpvNUPglo80YQv6IPshkPMhKQ+Kshc0vGeyA2HHJQTywrATcHK0N1A8zB6XanTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ajkvbjk3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ajkvbjk3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2634749a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950358; x=1792555158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=ajkvbjk3kTPfvCqcZGv4EJqKjl+5/xxRCJuc52x+TJywPi/B9lU7YuQiSJvhgrdZFS
         ZCqGSfrf5efC82Vl+nSlFwfDM8PcreOEcIMxYFLkZrGBQinbjcZFV3cn95wzsuFAKNHu
         c9EXuJyOrgR43wPTICZCiqx5zbn10VaDruDFaTZfhr7STZmLeLqeWpOaTxV+GdLRUa+P
         LGG2A4hNTeO0nvLe6CVn+adZh+nalPuwJGwWWc9+5jMH2ejXNhIY1ByllNNuX1r2oUCu
         DgUfkyOmM15luwL/Gz0oEp/tEOp7ECgdgo6JMC9cruIIn3aGKDIvi7a1+d8e7OmPq/32
         gXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950358; x=1792555158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=QbIkFdobCB2IE6g4ESd1dpRES7qIyvPYoC6vy4WfvzxM9tk3RFZfnEMjhujV8UqpZN
         GCOLnkxii9n8XCYzlQf4rS7PPTifpjJ/T+vDD6CKbF5vpWvA0b+gwVAOo9GE6M/a7VlL
         EZ1qVAN2XccCbpMhrPtRrguINDV2KXy2aroWZBRU1GDQApa35QAds+a7dx8psfcY59pN
         mVQ1LH7358kn4zZ3D9PyRZdUtBk2Mny8jW+VPBMnSw+tJkEi3GdsvOmK6ePNQx2I2w7+
         zXaNI32ZBI0CbsGZlQmaGqwuE0m0tuiY4SMlXU1a3flfmM8LRtr5X56OiE8J2q/jDtO1
         witQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2ZPMczXatbJ+wtCh4ra03kjm7t+68lkGVTs0Fu1N2CCujjLp4XTQmtKigTp7XLE17lb95hGNfQen27+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOkVK5khX6CXWtX5oEandmzxlk0PetXJg7FfZnxbSvaXVsiJvv
	svhOrDu9cYhmYbxn6ZIZJ1yUk40OeNM0IQz8cEtTkmFS8/wjefxIPXTIA6/DZfqJURc=
X-Gm-Gg: AYBFou2AczIP4W9qlru9tOG835QjxnlWQ9IjItXA0MNJPavguuKGD6CgLjUNtn2Ajq2
	yKQkaGF6PdV+Z3maQItBl99oBHvw4aB4q5QUYd08scVtgWMF81XzrhT/c5A9gMhJwQXGdO9shCf
	NHu9zUEGIlFYrSrG32n7XpJbNljMYXUvgJkvlWv22vcjqQbFJGPSJj9VFsAqVqh3ub9zTvw99YM
	ta9qMf1X8La2968ZWOroWnTL4TUVmodCjNn6pXNYu3Ru59Bk2HxUAUxpv/JHVl2qjkQ8t1qmu6Y
	/m5n/JnTmkiiL7NyPWwQLUrJ7+wugOdxLVfZnGQSYgwP8ab0sC/BBrq2wF8Mwq8LLO5zFrxrydC
	JnL5pqJ65k4VjdHKKCiMl9swy3zY+eFPlqYUCWTZ3GEUKCz0TXF9KjqFlK8QEKrBe4/j2OtKikr
	mWa1MZumpMyqUgD8sJc1N3e/IiBLSxlH1UGtbs3vJwYAsw2CBwS1R9eLBON4VH8ZrzNyModDk7C
	rmr5wjmeWszxsgF7G0v
X-Received: by 2002:a17:90b:4c8a:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ac63bfe81amr1395913a91.41.1791950357376;
        Tue, 13 Oct 2026 20:59:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mm: Generalize page table allocation helpers
Date: Wed, 14 Oct 2026 11:59:07 +0800
Message-ID: <20261014035910.687847-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subsequent series will switch runtime vmemmap population to the
generic page-table allocators. Since vmemmap tables belong to init_mm,
the allocators must select GFP_PGTABLE_KERNEL and mark the ptdesc as a
kernel page table.

Some architecture-specific allocators do not preserve both semantics.
LoongArch and MIPS choose PMD/PUD GFP flags without checking the mm,
which can charge kernel PMD tables to a memcg and leave user PUD tables
unaccounted. The private PMD/PUD allocators also omit kernel ptdesc
marking.

Rather than duplicate this handling in each architecture, extend the
generic PTE, PMD and PUD allocators to support architecture
initialization hooks and non-zero table orders. LoongArch, MIPS and
parisc can then drop their private allocators and inherit the generic
GFP selection and ptdesc handling.

This series only prepares the allocation interfaces; the runtime
vmemmap conversion will be submitted separately.

Muchun Song (3):
  mm: generalize kernel PTE table allocation
  mm: generalize PMD page table allocation
  mm: generalize PUD page table allocation

 arch/loongarch/include/asm/pgalloc.h | 48 ----------------------------
 arch/mips/include/asm/pgalloc.h      | 40 -----------------------
 arch/parisc/include/asm/pgalloc.h    | 17 ----------
 include/asm-generic/pgalloc.h        | 29 ++++++++++++++---
 4 files changed, 24 insertions(+), 110 deletions(-)


base-commit: ad9f2d463666c64e94b04be5263c9bf8f9f96fb7
-- 
2.54.0

