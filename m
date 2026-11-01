Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496865;
	b=XDAKF47n73PFZ8ElIRnNyqPeS0XI2p9f4q63NKHdoWyyYY4W489lWKMjxo50LD3HIi4N
	 GVjl9NJazCFypfj08g4dvtYrsz371OxxaoELfc1vxmPb64QhjZqTsazo8B6LKKuRTySEF
	 b0UINinIoclY1QLPLcLroJIERsYTumwi6GQfuftn3Fp+O9UXrpNAuQ8XXi3pSuEDrlyus
	 n/PiBSp9KrwJPPLJDEZdpaws0JbrJuUSvFDHATQpSoKi5I/wg+N4hi61wq+leUW+hpBu7
	 mhNCJXkS6WqTL1isFYcxFC/tsB0Blu4knp/V7mKogjHeXI/CmVL7UPS6kXRs1aNl/2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gvIJq7cqiBSNyGJy8QuDdz9gWAMdkSaGppG7j3VrUKI=;
	b=qWl/cbPY0PMqzk31qadpML5yNMe/NUYC14jr+8icJtopUJ0rtaklK0SRt5Gmyflvtmyw
	 nPZ1AFqvD+pt4Tqrfstl6GNzWdmuGUTf1yvDkgHn/XTZ2x9qBpRUdvlCUhf4pBu/089je
	 KPHHJgQxxaHcjGLUpulh6IdFi1O+FfE16HEvqPqINIqrU1PwqaSE7SMxuk3szMDFkFd0W
	 7XJteQFrqzfgUYlS0J6C35LzxYYgi20oVsWTUOI6QN+9LDDdFQlR2VRu4S47mLcNrxygI
	 2WbURVryEkYM56dNtzn/L2wWR/DSElSac/1H+dj0l4xjuyAghOy8rgy0rUBSWVUAaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35F606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA35F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e940d5d2beso6939095ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496864; x=1794101664;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gvIJq7cqiBSNyGJy8QuDdz9gWAMdkSaGppG7j3VrUKI=;
        b=o3dQZ6fBxh/aKj1/w5CAcFfed89+zPf0I/XP8l7e+l2/qNKbBo+818WCV9ai4C3eh8
         Ixk13wAIkJwWf8rFehXjvv7cCXV/KlsKOhk9Sf7wen33FJteyD1dcSaAMxjXse8JLpA+
         0cBLIMhhEt7NfawrRTdvPRYRME1Nq537OJTYee4MgHcjO16unF+Q0G5ueEacWJ0hWhfD
         LMnbiWFkdconXwCZ2tJHVw+o9/kSxajRxcnlRaxN7+/TR2qnRcpaclO7MdZTAnDH946u
         ElbU7lS6T3m9xYj5d38/rr8tUhk7eddvKiPY36veec+VJWpFx9XDzK+Fkv9vjE3wAA03
         HxbA==
X-Forwarded-Encrypted: i=1; AKwUvByt/KJlMAjkyVeieWEUYMrc76I5CsbkK/5McaELvwVa1Lw2WIbsaTE2iY8434MQJGW7sgNLInTDPnO13F4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xcDmVdO+0YqYDcuV6bIzSYkPtgSrz4jV81OYF43IADexzlc1z
	HQ3NCPRhzuXiR0FvezjjxuwLwF+6fUzsAcYYPoCnr/SaTyfAL5dylQkcdKyahkblpfITD01Nj4t
	4bZQb5wl0nnChVA==
X-Gm-Gg: AYBFou33S2KOa2rpy1Ho536EWFgYx2tU9aElvW9iKvU7XTcajjykEGEbt4PYNdIMopi
	jvj15MXMUS1I9wfg5tmeCSRVYp3RdDMp7d+45xa31eaL8v8MmTZwPuCR5Lwlfpm08gAUd7mngpi
	0wjb0AXkLaFXpxoKZHKTFIh9vcrQReO9JyyVwpEJgpzeuzgGZ53TDKv3gDuaCw/GKHItpscPkBb
	hGnleyNGep1HvLbvKnnIAPEXRHuZ5ERCXtENUlRxYehUjB6CUjPuUU3EV02X+fRHtmKWksLkd2c
	xfOOXVOTMUBB4fXZFD710en1y0vAu5bfAZls/fc1RUgk3HAPl9gk0h8oundtUvLYzRVDDR307GR
	XBQOiv4qUs8CoIGyXJN9fRAgHlV7hIzXMD7VCWOlyiERye/8cIF0LO2BwvBfqmu9Vg9SMavfOEb
	GkKDwdadF/c87IdGQn19dEhtIoS1XMfK3eicAFFRGrfXXnpy1a7QHb/AlCp5yQiSqc5ET4AjGWP
	/5DM0IRtx8EULkG417NJHZiQSFMx//AkaXojUUSWdxyrcqm/Nk8TTu4C4PQZ3HCZNAagLpSTCh/
	b55H/9Mwh9yg4YlFWjd29ySUXwki6ZUR/LBsfEAioLdWektWZ5RtvlaLwzY5TsH6d8/gN4EcYrN
	sBJiVNLQglzptfYSqJ9FAHRlwM6467tZ7SpkDmR4=
X-Received: by 2002:a17:90b:528d:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3ae897baff7mr4750080a91.28.1793496864135;
        Sat, 31 Oct 2026 18:34:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845fb9f6sm8727943a91.17.2026.10.31.18.34.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 18:34:23 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] cxl/edac: Fix event record lookups for memory repair
Date: Sun, 01 Nov 2026 10:34:18 +0900
Message-ID: <20261101013418.87326-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Patch 2 is the DPA flag masking fix from v2. Sashiko's review of v2
pointed out that the repair path reads cached DRAM event records with
no lock that keeps the event path from freeing them [1]. That race was
already there in cxl_find_rec_dram() and cxl_mem_perform_sparing(); v2
added one more read of a record, in the General Media lookup.

Patch 1 fixes the race for the DRAM lookup and the sparing path. Patch 2
does its General Media lookup under the same lock.

I used xa_lock() instead of RCU freeing. The cached records are copies
of the spec-defined event structures, so kfree_rcu() would need a
wrapper struct with an rcu_head, and the lookups only compare a few
fields. Taking device_lock() in the repair path, as the event path does,
looked like it could deadlock against unbind, where the EDAC sysfs
files are removed with device_lock() held.

Changes in v3:
- New patch 1 for the record lifetime race (Sashiko)
- Patch 2: General Media lookup under the xarray lock, returns bool

Changes in v2:
- Moved the Claude Code note below the --- (Dave Jiang)

v2: https://lore.kernel.org/r/20261031161121.15948-1-ai@linux.com
v1: https://lore.kernel.org/r/20261030072721.31970-1-ai@linux.com

Testing, QEMU master (b574eaf) with a CXL type 3 device, region
committed, KASAN and PROVE_LOCKING on:

- Same test as v1/v2: DRAM events injected at 0x1001, 0x2000 and
  0x3002, then a repair requested through mem_repair0..4 for six DPAs.
  Results match v2 for all five repair types.
- Race test: the host injects DRAM events every 20 ms (the same DPA
  again and again, so xa_store() replaces and frees records, plus enough
  distinct DPAs to hit the 200-record overflow path) while the guest
  requests repairs in a loop on all five mem_repair devices, 300 s.
  A test-only mdelay(20) after xa_load() widens the window.
  Unpatched: KASAN slab-use-after-free in cxl_find_rec_dram(), called
  from cxl_do_mem_sparing(). v3, delay inside the locked section: 3780
  repair requests, no KASAN, lockdep or WARN output.
  Without the delay neither kernel reported anything in 600 s.

This series was developed with Claude Code.

[1] https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org

Jongwon Lee (2):
  cxl/edac: Read cached DRAM event records under the xarray lock
  cxl/edac: Mask DPA flags in the event record cache key

 drivers/cxl/core/edac.c | 112 ++++++++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 39 deletions(-)


base-commit: cf15f9f2361dd4002203716b7b878393c0eee4bf
-- 
2.55.0

