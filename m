Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389877;
	b=Q4Ho6eQwHRdU3a3JfOT780tDHXZjVanOn62hSfO/ns/QEipIanP+NnYk91sLcL8cqvCj
	 pbBt3rw5cEWmKj4wdhhksh5Dodgbgn26xPJHMEuyWFDIko1vPif0SQQeYni9PNn7sFz5Z
	 RZMSojvHxyep2Plpds0w8ynuH40tot5JxjR/DTpgbKFTvMnn1uQil/EIsOTO1lHHMXq4A
	 Gky1ARSk1obr0vQSZ//ahaRs0XWGvyhPKko9WGKSsR2Tr+GpLH0Hvje+vTeqqHKTxAn4N
	 Z/wkk7QtnTxA2s2Yl5+A34c80E2FkV1f/qordlm9oNFImbyyCpYMmkKeSgqh85+/tbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4WFlRFgv8TN9OKHijNxwxQB3kN5BVJ5WPlpTjOw36aM=;
	b=q5IwViabuks2RvsOv/PVga10oE53SYtKOBfa9QFBtPZIgVLADMtgbP+cLNAGANwUKinW
	 NOfcAEjJVw1kXeSIZEhq0vm6EtFzFl5c+t6hLtGj2I2uHFymeJgUJOQYMZYGgAK5uKGin
	 QeuiXPB55EdTxf0WiGdHemEzVgTaSd6VmqTdHJ/2yujgjzGrwu1EVmmKjbtGb6fh1LYjZ
	 6HYdEJjjvDVgVFG8PrdmCrAfUXRL45BVZ1SB/40kDKvJl+Lh9VarHVPEfDzwSljhnfiEm
	 WgPRterBNoqlIgzEouQBjY6rrN0i9H0VglCxF2wd8zyKLk7wC+rLNo2DVnvucodVa7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YxNIOc6A;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E9C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YxNIOc6A
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so2863001eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794389876; x=1794994676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WFlRFgv8TN9OKHijNxwxQB3kN5BVJ5WPlpTjOw36aM=;
        b=YxNIOc6AYFlG5HbqZb5/VXI9qxpqBxku3TOMAlfGuAY2n6nQrZAtSE9Z3iHAc7Ri7l
         N15D50fH/dqYAqReXjT1Ux1WM/4k+UaOCy3nSo6bO1kq8nThfMl/ucW7PBuJOtJckt0b
         qc/KE/AIDnJ8obmbzzgvP9Xhos/E8fkE5R+yfCLJs/w3w4/IoTcqtwPmBiyv86VXtdSb
         /VmkXRK1Vj59qgWx90GQ9AbDMae26+MhWrzKvMErHPEABqKynE3sSE63UW+7agide/VD
         +fMZVZBXLE7fWkUIg0kk/kisw/Q4yWl1lxI+UXCqo9V7TSiFpHAofvW0cFF+Q7LzxIbc
         6ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389876; x=1794994676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WFlRFgv8TN9OKHijNxwxQB3kN5BVJ5WPlpTjOw36aM=;
        b=vKYU3y8Fc+AFhs/jTrLM8XqVI+pfTYn5WTmLomsegXD16toQhfhdfUkyWHKQKtLqiM
         RPRWDpat6TOiRRVanVy65kphtWL+BwcejM8TqrBkTbfLDRJWsdtnQvQy/vRN248OwpWt
         FgU1nDrnG/FsLmVGu3orMkDeEu4RSfM68ERJA72oKN2mYAGggIL/e49XZV59G834EfQf
         Uy3O5a4DNoIOiJ80wv+SPiwR9kSQgM81YGYSs6iargYnFVB9B+rsHqGIdp76EpkpALb6
         Gm1bvPG3h0Y8205KRe6lwJBi/arQ7Tez4zrQeQgmdRAbUnxQ4yIs1Anqoud6ykaQPaLK
         Eftw==
X-Forwarded-Encrypted: i=1; AL+hErFJHH/glOz1MyGHO1gwwFyVYvkByOXpjqyrEZS8bExuu9Ha66udG0CzaR3ulAosVJuLCa4ZkBDynG/oC7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z88nZiq/GuvbdXKVmstsfB2YX9RVyA/EVmo6DVqr9aZTiUYPCIe
	69NjBaeQQiyDCwIfH/zWg8tjH54FN7ARGTRC1aVOgxXzPp1IYZI/pzKnvi5V+AsqskQ=
X-Gm-Gg: AYBFou2cP9FyMOJaZ8hX8D0BXGGYhsSSkvPyBkhfZZYp4tLzGrt1MMiuQf36tz6ZjZq
	SDfgScuU2iiz++fEN79AsKDAGdt9jaX7kd7rK9Yq5hcvBWMOzmk7qfnJytY/sfkXNZ1nR4GdTxa
	fU02ZSLUyLHtx8zHgakB6hzdafuhILCSrjJhUN78mqqKN891K0hRkNAPnQIBS1uXVKM6LW8RqZq
	O5VDPHLAuMrBNEe6WbV3FYGt8ybxWGWNGaFaxZJR53U1WPqWFB6gRfzcdfg8h7qL6ujgRW2IKtN
	vW8EHXvukMjPKAajVbwsEzb+rtrZRPSdgZXRJ+BKjJ1CIUDlm/rcRycGk9LvKZgJFw61XsceMYt
	YxReqNRAzQsquQSqMGufMildPFc/8RRrM1hMz0TvfhEo9NNvRV30YlJKD5Cv4CfeBXK62sYzINY
	YPpBuYObeMIZGT+Ijjb3zVD0sRRXg6L2YlHkO/QZR+zR1qKVMg9+9sKR9H7cCLH5YJQkVhW8aPN
	p9nhhgOQMHVm46F1eDSwwtIKpgfShgoWdJbgrs0ptCFQEaP852matdwuujDnAqkgFbagkDDFtGO
	cgF8hTmXY/NiL2rReu2OeU9EM0kHJ++6GZpBPUgr3mdjaLcarHx48qonQ2qWhQ==
X-Received: by 2002:a05:7301:795:b0:36e:1fbe:357a with SMTP id 5a478bee46e88-37685a8396amr2265557eec.13.1794389875856;
        Wed, 11 Nov 2026 01:37:55 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm29016749eec.23.2026.11.11.01.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 01:37:55 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/3] mm/hugetlb_vmemmap: Fix HVO races and deadlock
Date: Wed, 11 Nov 2026 17:37:43 +0800
Message-ID: <20261111093747.50048-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This series fixes three HVO issues reported by Sashiko.

The first patch serializes HWPoison updates against HVO remapping so
raw_hwp_page state is not lost while a replacement vmemmap head page is
being installed.  The second patch uses an HVO-private rwsem to prevent
deferred PMD splits from racing with PTE remapping before the TLB flush.
The last patch switches the vmemmap walk to the lockless walker so a PMD
split allocation cannot recurse into init_mm.mmap_lock through reclaim.

v2:
- Add the HWPoison serialization fix reported by Sashiko.
- Use an HVO-private rwsem for deferred PMD split serialization.
- Add the lockless page-table walk fix for the PMD split deadlock.

v1: https://lore.kernel.org/20261110112456.62827-1-songmuchun@bytedance.com/

Muchun Song (3):
  mm/hugetlb_vmemmap: fix lost HWPoison state during optimization
  mm/hugetlb_vmemmap: fix PMD split TLB flush race
  mm/hugetlb_vmemmap: fix deadlock during PMD split

 mm/hugetlb_vmemmap.c | 28 +++++++++++++++++++++++-----
 mm/hugetlb_vmemmap.h | 24 ++++++++++++++++++++++++
 mm/memory-failure.c  |  2 ++
 3 files changed, 49 insertions(+), 5 deletions(-)


base-commit: 2dc0136b1fdac153434ab02778fcdb32db5d0dae
-- 
2.54.0

