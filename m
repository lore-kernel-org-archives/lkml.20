Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379636;
	b=S+PeYVRRqvH/TR3qV4ozuLCG+F2XMup/xlNWvA8bWBN4do9iOcANLJi9YVf2MTpgj9yB
	 iMnFvWUZp0fcxnPReXc+N9kXQ8K10p9JRL7yeXENPlmO5xs65fUjt/c/wY/oLxcCfN9NY
	 kyW20u2KHhmRGhwmQREyiak5H+9w6Btm995CaUQnEOa3FJv9ThTtLqKj7jtPm4sJJh/VR
	 CrxX8O/1G532TTO3u55o4GxpVg/7IS2kr0BmHDQcV9r665LwIquIeJel8KkEIy7sgXU1V
	 I8UUZwx9DWrhV5cO215bhuI92iWPaMIik9lxnGFNdOzQW9bLgBKSZ+/+yYm8EfU+TXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4EiG4ohiaJ+2VhSrJi2s5uqPv+5cYMcFL4w9Bign1CU=;
	b=vArW3sHYbZUL8nU5XolbmMeQ45aysHdhxC5kDiboN2JSBlgqA/JgwqV9mcQ6DzfgrZWx
	 P9VldREFArFgU4Oh3oym32yCGxHBoWzC1SGxbeXtgUM1vy5MqtNhpmOSv+YxYWEuL/e/j
	 PNiAophfEchv7x+J34VToidf0QDhozTqrrkGUphQRRj7sSM8iv0pVQSuBaPvNZErw1tXx
	 +7VLcaHX/9FuxcguoFO/pi5tRUzkC4EPnVX+SVplPOU5ysfx6hK5uKsDIbs7+FQTmTeXO
	 0XJEh6qmwjN751X1nl5nvH14wzy/fA28P+NcF0G4EQC9hFJVHQ6kk/s13W7ZFgfho8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=knniPS1e;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9684A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=knniPS1e
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b147e06befso1328651a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379635; x=1794984435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EiG4ohiaJ+2VhSrJi2s5uqPv+5cYMcFL4w9Bign1CU=;
        b=knniPS1e72GntIsVk/zyaULRK+Nk4LLiHalU4UClNzfKUJK+jc58jcK1VWFaKflT8e
         Dro9Due/Q3ItEaAipvKKjmnciBiQROiPTN9U5xGeCtyxMqYACfRTlA2rv+eGQWIAw+CX
         BHkYkCQznjd8NrvbqzmfM0nnyA8G5yLofyLsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379635; x=1794984435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EiG4ohiaJ+2VhSrJi2s5uqPv+5cYMcFL4w9Bign1CU=;
        b=u1X0cCXzpP7oCxPg1ovCHhhYZQTKXCYKkph7DkdRvP7sooIJWf96jQXA8EjrSg/VGp
         UMPqLYDcmSMbSWtpXZU/Pv6Y98jJGkTtZDwBYEI20rSWoLd4NcLYW/zCeU5mmwB0xcOT
         LcRuMlAHik/BGNsRIFeXZJjtKXrPNML5B0UQ2Dyd+1RjzqjkVz6bGGA//SVI8a+68Pbq
         Q3P3JCUPuDmJCqsbbcGFKxvF8wYUNoLkM1msibuASezmENT3BxZWyNZA5JRw5fEwDPPQ
         CgaTxwbdtVZQFaag8th+uXB7inFFReCa9skGLKez8DAuhJc+t5IA15w3+GZmOL5msZzZ
         jI7w==
X-Forwarded-Encrypted: i=1; AL+hErEjs2NruzClr5ZLSiTE3Yjm4ZQeszCAcP7EaLoYUqb+fBBaQm15zEMnqEfV/PIInZJDfSN9pQ0yf+Nl7c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PeJVmt6w1ncLHafuMT8Tiiasg3e/ksIfASYd0+abT6MIrlJj7
	u+4MKSlfvDHZEbTb7DaxVEc/WND8kBPOWwi6avH8q0Nlfm5VZYcA+ShKl3fxDhMuig==
X-Gm-Gg: AYBFou166P0h/qYNPjPTZgeMDua3JZQRCcL98yt9AKXL65WbnbRzxzphrfzVrCD/W7U
	JQf9Ij9BnMLL82PXtPh4+p8w3mmXL7D7rALn1jzDLG+SRsSsut5rEDcb092RxSTuBrJiVP25DIr
	fkv+D2k6wUArLHBdfo6T7aGPqmw3NthVqEMjnNYy7mP+s0KQ7hchovodvhV96HTyMoyPtpB04oH
	NZY1ZibAAUROI9nLbU64+tchofiHVCiqUYlMxPdS6EfDhDGxjKxZnqi7qugQgSfsAlX2A/eL7wx
	ux8cn2M0C61EubXma+4ZF3UHOXZ23ASV2meypcX96YSYfe0RQdizZNIZORo5OAmQN7y2sTHBSzo
	RDThqFwXRaYRKkc5pWzvltM5s1cc36OFrDjuS07l3bOtMty8IAR1aH33pbqY4J2pIZUwMmkD8wa
	X610qyKXiWGM2peFEAOPvPvWqMSTlLcUlW5T75Uwbc14+jE6/mv/ZeBg1TkhGiCjoBjCrF584h0
	tjfY5SsNxZNVRZyy0Wl+U/LdYoJ38ctOfm0odSN72yO6m0ov0WMEZUDEoKx0HuX3bu/2d/rcTdW
	acbADtlYR9gdwaDyVnr9nIfZXX+80t9kY3U48hxuKy7Z+VFULHeH/0+z4Fz+6BBMFktyrB4kRiV
	cQec5ukQU9VMTeRoZenctpQS3zSrqIErVd40E03k=
X-Received: by 2002:a17:90b:37c3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b182ee2462mr1689014a91.37.1794379634902;
        Tue, 10 Nov 2026 22:47:14 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:14 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 00/11] zsmalloc: redesign object alloc API
Date: Wed, 11 Nov 2026 15:46:23 +0900
Message-ID: <20261111064707.2568433-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
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

Both zram and zswap already have per-entry structures that store zsmalloc
handles, so allocating a separate handle_cachep object per stored page is
redundant.  This series embeds struct zs_handle directly into zram and
zswap entries and drops handle_cachep, saving 8 bytes and a slab
alloc/free per stored object (2MB per 1GB of swapped out 4K pages).

It also folds zs_malloc() and zs_obj_write() into zs_store() so we don't
take pool->lock and look up object location again right after allocation.

A simple zram test on a 24-vCPU VM
==================================
165 fewer kernel instructions and 0.7-1.8% fewer kernel cycles per write;
lz4 single writer +2.3% IOPS / -2.6% average latency;
24 writers +0.9-+1.0% IOPS; no regressions.
Memory: 8 bytes less per stored page.

v2 -> v3:
- addressed Sashiko review: alignment and READ/WRITE_ONCE mem_limit
- picked up review tags from Yosry and Nhat
- added handle validation helper
- change definition of ZS_HANDLE_SIZE

Sergey Senozhatsky (11):
  zram: drop stale comment in write_incompressible_page()
  zram: drop get_slot_handle() and set_slot_handle()
  zsmalloc: return handle from obj_allocated()
  zsmalloc: switch handle type to struct zs_handle
  zram: check mem_limit before allocating zsmalloc object
  zram: allocate zsmalloc object under slot lock
  zswap: do not free the entry if its pool is NULL
  zsmalloc: encode 1-based obj_idx so valid obj is never 0
  zsmalloc: embed struct zs_handle into zram and zswap entries
  zsmalloc: fold zs_obj_write() into zs_store()
  zsmalloc: populate new zspage outside class->lock in zs_store()

 Documentation/admin-guide/blockdev/zram.rst  |   4 +-
 Documentation/admin-guide/mm/slab.rst        |   2 +-
 Documentation/core-api/memory-allocation.rst |   2 +-
 Documentation/mm/zsmalloc.rst                |  22 +-
 drivers/block/zram/zram_drv.c                | 148 ++++------
 drivers/block/zram/zram_drv.h                |  10 +-
 include/linux/zsmalloc.h                     |  36 ++-
 mm/zsmalloc.c                                | 288 +++++++++++--------
 mm/zswap.c                                   |  28 +-
 9 files changed, 297 insertions(+), 243 deletions(-)

-- 
2.56.0.542.g3ef89b7020-goog

