Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB637AA96
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631550; cv=none; b=VlJIznSl/NnkR9AMXEdAFAB9MbFtKbfruBv5WyIzoFh9LGTaJW6GUDsluz8XaivjjhYD5SQZXfl8ZfcmSQtB1/IDN2w0qWMLiS7/8OvrZU2V20d4ehV3yya2gvGluJBUToGEYKg2XNeESlxfF4sdf75NDv4RsHkOppuzllRti9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631550; c=relaxed/simple;
	bh=+/svH6Yt3TVOaA2Dmeuofm5tgchOQ23jAXlNQeiT4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k1XbuZN3qQuKeqtks3/LtRrzGLh/m+yMDmcEoGBasyriP6TMu5KqGKpDspTGIy4xc9ZnDtPziwWqQC/hFeHVYAMRXpjYT2wCVOMZd7XYbsBAm4UJxMu6kfhTJbbKCoOWK/dhplvG7FB0FlgH1pTFweTVta836Hmo8G6O1mnvYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a5kHxj13; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a5kHxj13"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a706146559so286341a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631548; x=1792236348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=a5kHxj13xWUBAg0t1ZNPDLbWodXHYpqAKjm5c8oxoVCN8CrlHKjiwHrV+bXeLXqcMA
         mk6o+z84diFN1C6OI5YsbfkAjLEa+KNd8UHFvYj3KWN+c44KGOEQ+LxxcADk2Fu9te/Z
         mw2ag8ZxzxKyvDHj4yVCRMuzp7RrFjE3kfW4UW0Pjvo7og9+2s+ksFw0IbJtbjbLpeb1
         mcKJhEG32SJDrvnzokGt3G633vKVGTTE+eHBuK2wlgcsPdTLrtwZmaipV/y4wEuVwtWn
         ftGFsAsVai1BN7b4sB+aYgVm2Rw+c79KpKbLFO63xlofx1UHAnQH8LtzzT415koA6cgH
         Jaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631548; x=1792236348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=v3u6C97rKUhMY0Uk3vyQBtGI2Q7dmZSu345hTU9sg4wXIt4m0BR0TTalNwneN4G+kb
         PkJUIiDGMheyOLPOvKIjn+oFJReWZ577DBks3KaSwi+2lP69hC/tPlbfnoT2TTwPYcH/
         dPZKeEtZHk30enFvjlCo8X1rum2rzcM/7MK+ByQ6LtIZF0Rv5r8MB8+s4k1j2pPyN6Jr
         mgugA5VtetkXjEBWX8j4KGpIHOpWCq4ZZTRmICvv2fTNlKjWV4R2YKvRtvVp19T8Q4ww
         rP+OA7Q/VSHdAvxKfgpcXDv71UnXQgm+InmkUZvZtZouPNFeJygmf+CdlATNAtHFyDWi
         LfwA==
X-Forwarded-Encrypted: i=1; AKwUvBzB+51Rh8Mtwyz5Ta9iJ8Gr47VEFvfhHX8zH//aOFIiEdVwr3BDhRDBJvVD3zx4sXcdARGQG6pAlzUYG7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPojAn0YwtZ5qVFKEwbyQ57vUiiSRtHO6xTV4vV+jCamk4DQUm
	XSIR5oPvVguD6D4e6kTTS60gHCagT5MYu4wUaY9QbqmwakEsdRLFP+uQYv+D2bwkmb0=
X-Gm-Gg: AYBFou0ofPwagLTAjJ3OSActYHM3XbQYxrtvVJ0BMl+HQ+KMcZuta7ujFIMFEir2IaV
	I9Pg9A4lROaIfj6ASWcq7eS7Bs616LVMWTji9GaJ0Shrbzmwr1ygyiezci5hvNOZSCt8tvcv7sK
	l4yMuF4OkXgVk13wlc/lIjm87UT9CyRswNKIjXcqvSIojC9BGZur2Uh6GA+mMxKiuxN3i2GxXog
	p9m1zOgArWGmEatHN4MPgwOgb37qdmE19YkjvtCZgJRIcKkPwfdTi0183QuME4khJcKyd2Qmzj7
	tv2SJLF2WYQf8xvPfo6JbEDmYHvSaEqNdDGiVhhNTSO+E6ik+/2urstju7pJhdOUl4yqpQTlYqt
	IyYysoU9IRluT1Abk+coddmKftq18JER4VAaCQNHz5dVT6UNiDeEc8Q57TkiRaR0YrsWt7yVUwz
	/AsGpFJFEuTaqoqCVbeu+U+eSnJlJjp58Dnb3Euetqp21H6yOYI1xV0iKeM5aObpiVize7hMGGd
	oRKBIU/VvEFPLfrAtJ1MBNTdfoMgj8vE6DUwg==
X-Received: by 2002:a17:90b:3a48:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3ab3a33db57mr4120069a91.3.1791631547298;
        Sat, 10 Oct 2026 04:25:47 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:45 -0700 (PDT)
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
Subject: [PATCH v2 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Sat, 10 Oct 2026 19:24:53 +0800
Message-ID: <20261010112457.49485-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory hot-remove can free page-table pages allocated through paths with
different constructor state. Some paths run the page-table constructor,
while generic sparse-vmemmap population may not. The x86, RISC-V, and
arm64 teardown paths did not handle that distinction consistently,
leaving constructor/destructor accounting unbalanced.

Make pagetable_free() test PageTable() and run the destructor only when
the constructor initialized the page. The RISC-V and arm64 fixes then
use this common helper for their memory-hot-remove paths.

The architecture fixes depend on the common MM change in patch 1, so
this remains a single series. I expect it to go through the MM tree,
with review or acks from the relevant architecture maintainers.

Changes since v1:
- Move the destructor decision from x86 into pagetable_free(), as
  suggested by David Hildenbrand.
- Use pagetable_free() for non-reserved RISC-V page-table pages and
  simplify reserved-page handling.
- Collect David Hildenbrand's Acked-by on the RISC-V PUD fix.
- Use pagetable_free() for arm64 intermediate page-table pages, as
  suggested by David Hildenbrand.
- Trim and update the commit messages, as requested by Dave Hansen.

Muchun Song (4):
  mm: fix missing page-table destructor in pagetable_free()
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c  |  3 +--
 arch/riscv/mm/init.c | 32 +++++++++++++-------------------
 include/linux/mm.h   | 37 ++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 38 deletions(-)


base-commit: 8b38ed9ab5b09c8ba168cbcc49524e9b380ee5c4
-- 
2.54.0

