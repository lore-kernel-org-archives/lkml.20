Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655551;
	b=vFqCkmnVdMawm3VMjbBaHDkdA42GcxtVTuJ1/yh1+3eb7Gb7ER3l2QO/XQVZEcLCeCpw
	 /8La2pwqtcLJblQIL+DEfW3UdX9/fAkbMHTLXhE7KyyGbPEj0ZtJNKJSpu6TXQBnEfHH6
	 VKAkL62D8FbwMW/OU//1vLh1k3nmBQ1ohACESy3jXE7NfTdm+zdbKqettHX9Pl+lly7bI
	 FPfwvA+1QLxX7hB1Eep4yB36+Yv5a9bMcAprEBNghehkcNbHoxOmjwNAXbJyB4c7HlmhI
	 Vg3gBHLLHqb4DV3Nlcl3fQxytAiecc5hQbWjaZUCtiVBhYBwjstG+AOw7w7ALp63kXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YbMVc5P0tRqN8v0ioLIphiBpTqOVDwdaBT3lngdtRCc=;
	b=oP8FyYyKHand86TuwRlGjQ32bU7OKiX9UVIa8T0qqbZYCdvRhxI73c7prr1w+hIlFeQH
	 C7kzxn6sOOTQd8IG0iQl1DZ7decen+Kd0mL/dHCJoC8iOePtQ0CcMNJH57kYzDNSKuWul
	 b/6TO9FT1WSwDVbPYTOA+tOzVHA0ssH1/vRMLm9r8u/p0uWFV05k6o2wfig7/Hqvvhnpt
	 lvKcn+vnr+hlInFaRjj2hETYL2wkFzs4a7V4dtkmBgy7Zfk4sdCgrDkBmT1L9TPZyBkjO
	 IKqaPiaiMhCVfiRkQCthmOj0FTz+Ebgk2Yj3gqV5dZKGDutnyLGxOporQCIp1JSE8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ewPmq7Yh;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F2E606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F2E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ewPmq7Yh
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2409322eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794655549; x=1795260349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbMVc5P0tRqN8v0ioLIphiBpTqOVDwdaBT3lngdtRCc=;
        b=ewPmq7Yhcjfu9vTvSkbroSm5qRgQMtxC6fGTEPdh0bkglUhtjTf+XHzHUhhlRF9Y2W
         eoAmu+LX/PBi3rov2JlDMkkY2UMKq+0PR4aR/qkTewuqz0jouuObsSuOydr/0hQZizQG
         hpPNIhiK9YfeaKwpi4DK4EZj9uj73yuebsBX0MW769mUw+OoQS2y8m7MCUpnlfPYqsBV
         msWWwPah+ejLcAcLS5zM53sfDlOXNn49ewL9vOdjG/EvW8A4Qf+0JwJwqH9oL6NbSIbj
         CmrKBOONCryJGDHPiF7cUD6ubHVEEU3BEZ56cC8Q1af5sjwFX2ryYXp3flDN3FyjRB/U
         BrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655549; x=1795260349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbMVc5P0tRqN8v0ioLIphiBpTqOVDwdaBT3lngdtRCc=;
        b=y/SkZTHsPo7aCq5QWDIirN658GXSVuAyFl0kDQFq2tN0tdY+h30Kv0VreCDHby3Tha
         mWfSYWfYRpiiXmiuS7MkrUjI2L1l+FguKtu64QamRhOFTsK0CiTnQBc15RUbVqqahX75
         L52xnXT4sfK2VakGFyz+JgUePY/gv02a6agr8HRU4AD3c8caJuXgpnxME2CxKEqlYdUw
         d10jZHqYDA2ZgLAOTApyJdIzCMFbqQj5wkCscy46UIQIXihtJpQD5eVun8UBOheE8nF0
         oPZeVl4Ig6jgc9D7TKgsSoLuMqhb12kTiCvdygqkafiG76v8JxK0Ne7CwA/VSPOwDqG7
         Wtzw==
X-Forwarded-Encrypted: i=1; AL+hErEKfN+xp0kmI0vslBscX4bwu5SfjUW/V2bSSZGzUvcOVXTt+ntNCC2PFUwIkCeUyJ8CKg5nm6AmqWO3AC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZG9eSqMthrtD1n9EFXn16ecIQSU8i7HmNGWWifXdZTYPcTcul
	ECjbEl+TK/KJEa7slQo7ZUXTqPjo3y8dbYv02Sr3t5y68H6pQEXVhmBys4FPHOjb5LQ=
X-Gm-Gg: AYBFou0Hhoo9beWWStZVoDVvIopFGff6VMXqUJ7An2EsIfbw7peLMTqjPnNWdOXZdJv
	lP0TxHT24HC13gU/uXaMjfFNEIoaYwLA2hurJl8AUWlQt3PXWXUKzrjSrgzXo1pDyyakuB+ulvY
	zlxwbGCjCJeIcjMVO1YgUIY525kwP36MA7b743GZqQkI9XFMThS6ii3CWZjtdjQ2ANLwuKXjfVv
	DScMq5rEtmKAPBl5t96gY8l8XGZtp8pbz7f/RXY5Jn4wa+P4Xqj4zGnJorbizzYRolPWRU+NiQ9
	ffzetP6GJHJFumbEezvhvN/NvComx4iNpSaeaxkdT0eG7tRfeQgjN8sWU1uO1By4K2Fa4ok9l//
	rWnJL5ysw6EWvysHiWOtHTwebK2a4uY45Hb30N8ftOWQrUXI0UoDHgDTNus97H5PGScrSpvAzzp
	Iqu7ARj8W0YcJUDpih0EDjq29t0rBu34bIBqDAFPl4Y9oDhVrjX/Yjpz8GB2bzpIgy0PGEPwFaj
	fHaoTbJsADhV78G1QSg4sgDWY35XLNI/X48qlG8Hl/nZIi/Z0zwDwbtOWSlnWXkEOkdzeEZNzIh
	ByyuQV1VbEcCsbgsbEzYBrlyQFgTHwZbyoCeJFROAPThSi4hSNhAQiivBhNXttq3X7I2By54wSe
	f1IpZ/Q==
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr4631308eec.34.1794655549376;
        Sat, 14 Nov 2026 03:25:49 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm16190627eec.5.2026.11.14.03.25.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:25:48 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Jiaqi Yan <jiaqiyan@google.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 0/3] mm/hugetlb_vmemmap: Fix HVO races and deadlock
Date: Sat, 14 Nov 2026 19:25:20 +0800
Message-ID: <20261114112523.75208-1-songmuchun@bytedance.com>
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

The first patch serializes HWPoison updates and removal against HVO
remapping so raw_hwp_page state cannot be lost or freed while a
replacement vmemmap head page is being installed. The second patch uses
an HVO-private rwsem to prevent deferred PMD splits from racing with PTE
remapping before the TLB flush. The last patch switches the vmemmap walk
to the lockless walker so a PMD split allocation cannot recurse into
init_mm.mmap_lock through reclaim.

v3:
- Serialize unpoison_memory() against HVO head remapping.
- Update the first patch subject and description for the unpoison race.
- Collect Reviewed-by tags from Jiaqi Yan and
  Jose A. Perez de Azpillaga.
- Rebase onto mm/mm-new.

v2: https://lore.kernel.org/20261111093747.50048-1-songmuchun@bytedance.com/
- Add the HWPoison serialization fix reported by Sashiko.
- Use an HVO-private rwsem for deferred PMD split serialization.
- Add the lockless page-table walk fix for the PMD split deadlock.

v1: https://lore.kernel.org/20261110112456.62827-1-songmuchun@bytedance.com/

Muchun Song (3):
  mm/hugetlb_vmemmap: fix HWPoison state races during optimization
  mm/hugetlb_vmemmap: fix PMD split TLB flush race
  mm/hugetlb_vmemmap: fix deadlock during PMD split

 mm/hugetlb_vmemmap.c | 28 +++++++++++++++++++++++-----
 mm/hugetlb_vmemmap.h | 24 ++++++++++++++++++++++++
 mm/memory-failure.c  |  3 +++
 3 files changed, 50 insertions(+), 5 deletions(-)


base-commit: 6ec534d64f85e949a5d58070678dcd7711875a7c
-- 
2.54.0

