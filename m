Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323651;
	b=dwQkDc3ZyJa9H4i4ugxHV4Nb1XDd7NNZZuOjDSCQkzskW8KYkVCMRJLjzU4SOS2AoZdG
	 DY2n+wyvEhdjaehmee1Qc4ZHh3xMjaWDk8Oz6D69klVCZpWHRI+/JqTJZWx1S6MKppo6A
	 NW05DrJ6J9K1AGagp+gTJa6L1k2Ud86w5aZ9DAwMKYW6f37akarXdueKvd7050Q29huFJ
	 WHeHlp0DM9+dfkV3k4z1RVDdszcUgPhF6U+VoD4bAX9JnU/WevWv714n5Cbadme8amfNz
	 KOL2e5o5UuPtUO+sDfJ4m1neILOVClVgykzW9SNaRGum4iDVpxTj57n8BD0/f+lYTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PTKAikpOW4Bp9RpuUyN+Xdo5TM7yPMjwYf3IanAnUzs=;
	b=dja/bzpcALH5EBe4RHqASpjoqkYdRnNtGNl7sVCgqy9cGC6CKMaqwx8xietrKFXSMdvZ
	 oN5UnIXgNOyWzSvxcYBk3HMfjx3enBC0Jlo1PVpAa7Fwu5502lQ54D/MyvTHnoMxNF1SP
	 fy4jKaJ6IvlXensK2184tMYWQ18XMwmUYT3I422yhyPW28iumAjZMQmXN7pZt3jGhTVyC
	 i5s/+ju166PNnPslH222FZE8ztp6F/tb223Onh7jouZIJ6zP+DefQzkiHIcnqAMFxJwfJ
	 fpvS5LWSGXhk3KUdWGwxh5Ourbp7K1yu8iYwKY8YK7dcahI6M3TlhlXvYJup4G0U7GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ht4GuGHU;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D760A2600
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5D760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ht4GuGHU
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c02c106e6so2390602d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323650; x=1794928450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTKAikpOW4Bp9RpuUyN+Xdo5TM7yPMjwYf3IanAnUzs=;
        b=Ht4GuGHUahIZlpl8lDxoufAxmKNEqsNTOP4bJF8EvWABgAZjxRTtLS5QuvGR4MMZNw
         O71bgPUaVnF8WVbDc/Wmv2Hf2Bb14R7IjbiuodKnJqPsowQysEeWInw44StAegtnhclZ
         RoT5Mpq6YGL3kmAWRlEiNYVF6imv7sJmTAlSbWvtb5HcuAdWj7IzZfzMVk4WWYSMz13P
         bvftDXMOHbdH8YWbu1wqk/+ViYR7ytGVS7A/UwNTlYbQA5+J76rYDm1vQw7YU128ucpB
         6OS/Tzy1C9KNm+woaLNZejdy0IJze/5M66cTzzytTeoaAEmFIDIpBnDqymJFeF9mnkmD
         /ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323650; x=1794928450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTKAikpOW4Bp9RpuUyN+Xdo5TM7yPMjwYf3IanAnUzs=;
        b=TqrfuC+9Lwoa2+yseMMzfn5uVsMFusrS3OGYvnOFKybPAFB/Y/aH6Xhf5gI6QFJF4j
         u1uSkoD3/2L+FHjoRU5mB7/Z7U8/LyIST7E7b3rY4iHlzlxUDxlZv+Cs2AbmHr0L3U3g
         SyrOampy9BJemWgQs97SlREwmUys5YgskZVTvpVVIULF3Vap2uMsEGY52tDZAy9WHXkY
         Mp+OB81bKBAe8nddIj5AQYsVBudWWHY0zqnk9CN/nTWLMnWT4GycZH8rdpAGzf7xPjvN
         MC0U8r2zI2qgdaDolwtXls3pok911ZF2MvUeYGRZMgSZMPXwc/ECJ0QYmV1pZ1LuVkFL
         UCSg==
X-Forwarded-Encrypted: i=1; AL+hErH++OgPLG+rISunx+cDks++AqgaV64hp6F4NZeyQsD3pMEBRGZaaBxEiCThyX26ZvmCmpcyy38wZzLWgsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9M/s8XI1xTeMRuYeLYdcxut07oVy+AcsbIlxEErz+gz8iC3cn
	BHUTfyYCvzfVFmc8lRwAaFMeoGmFE2xXhpgix7PXtafPrq0F1zjcBIHMNoV1HGlb
X-Gm-Gg: AYBFou2UcYXa7BNWjIdbP+ddIEY/c40dGPYE1UEbhTjbZTHcUfk4GbtiUwKwX1vu7eR
	Wjnakm+/BsgvwV34+QtqhGq4IHJrgRXu0qqROIj76D04RgsUhFRIHBrP0Y/4pIWsuEQeyBAb00H
	YfJaZN2gSTQujdhQSleIG06NS8f8+Ao0CTW3MjsS3ZUn2E4ergo+d5EjSFg4zUhalszd/fN2Jtj
	xDKTlHjwWSrDyrux6rNaS631EsAsWGdwUS0DrnL7NCg+KDt/PHN9UmN+yVqWARHw0SYIawh/+60
	uxD1LttZ6smpf/GBQVd7AqGROwAeHIbaDlxJCajz6hUlrD3/N085i0m/mMTyrTUWpjp3/CeeAiO
	YH8GE8oGwJDQPPs0u4bjvX+RxtzWY4NdVzYkLFIHNGKuLu6kubYalA9FtgN8PZB+qM0UO3ZFKCp
	535gQh2z9g74lmdagEhcnhrAqVfCLAtl+o5at4IafBWqWiPP1pqgg4It69XFABk6+8oTtj6X9xD
	+GFKZ/sHIc/iFRo2kz/z55MAp60Ca9g3XmPaNrOoFAl3Fp3wBORJtvwl+DyuMVXnLSj4N6Ak+0H
	uuuqMdETA44KhPgDgX2HmY5+wrjRM1l7SPX0cm6ogvM7MVXMEd2EpqEoxhARYnCiTAewgfColyn
	Jg9Wnh9/k9NhW+OPnBGHR1r4i2GdCEtoXhWBqs0GyP06CBGxWqer/qqmK83g=
X-Received: by 2002:a05:690e:488d:20b0:67c:17fb:eca8 with SMTP id 956f58d0204a3-67c56751129mr1182083d50.32.1794323649911;
        Tue, 10 Nov 2026 07:14:09 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c5860c429sm2138674d50.0.2026.11.10.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:14:08 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	willy@infradead.org,
	brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	youngjun.park@lge.com,
	ryncsn@gmail.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/3] mm: fix swapcache writeout and cluster table races
Date: Tue, 10 Nov 2026 07:14:04 -0800
Message-ID: <20261110151407.789960-1-nphamcs@gmail.com>
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

Reviews of vswap and v1 of this series found bugs in existing swap code.
Allow swapcache writeout without anon mappings, publish cluster tables
with the allocator locks held, and leave tableless clusters to the
allocator.

Changes in v2:
- Rebase onto the current mm-unstable tree.
- Use Suggested-by for Kairui in patch 2, as he requested.
- Add patch 3 to prevent stale tableless-cluster relocation, addressing
  both scenarios in Sashiko's review.

v1: https://lore.kernel.org/all/20261106160432.2552507-1-nphamcs@gmail.com/

Nhat Pham (3):
  mm: vmscan: allow writeout of swapcache folios without anon mappings
  mm/swap: publish cluster tables after reacquiring allocator locks
  mm/swap: skip relocation of tableless clusters

 mm/swapfile.c | 113 ++++++++++++++++++++++++++++++++++++--------------
 mm/vmscan.c   |   3 +-
 2 files changed, 83 insertions(+), 33 deletions(-)


base-commit: b024a51b0184b1efb6f55b11aaf7b15a490a6307
-- 
2.53.0-Meta

