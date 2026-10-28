Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222377;
	b=K1wlWNFfN/IOsAnePBU3mGIkMWOaEM6ED/Zzy60FoCpJbORtwR9A7zhYhxsqscTFDQgX
	 HrkwoXMBeLY9bCRRSMQpNvoY2tndF/wYZXFxSqpXyj1D2UirTJ5S6VAXQWEywybc0rt79
	 uhSsVcCt1bd9chh/vOuaquzjSNX5hfvBprefo4+kGIlnfyVDcrCNH0IGkcl5ekSjuL1IR
	 Cdeq3UAzTP5sky17S5+xio5LjWmISW9wYyo4XRonsYt6WtEB25s5e3di6UfePXGJ8QWLz
	 DFhlxKq2Y3NHG/tXn2u95J+fyoTCikbLQCgrcTpNzaf+xVz/nr/w5QQDXj/yuNn3SNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PNVblBHL+6qDLjWQDk2wT/AjEGUD/LVbbIDhYzYguRI=;
	b=p5t59u5ZYvnQbMkLHrnrv39MLbRuai825oq9XE6DUVcZ/3oGz8vCBkulvR59Z6HvI9mU
	 V9tN6zDLsu82Hm/x57X8jwDTXdqaPyUEAfxmeDZZ3RppemtI1dHHKmIYY7xdxONNHoTn8
	 1jp9fN9uHvHRQCIg2D4fdNOzVxrItKgzh8Lue81gwxZs/rCpSMnjiKjtrm7XGPNH6C+76
	 9p5mf/r1b5Kgbx3rvukCz1OXEWnKyC2hXdNG6Tc254rQEFohqwcI3+t++5jMtpT6/2I+s
	 /ixa6p0iO68SbpvNdaSD6zeUTznMXzesQ7w2PD/40zwP41ilpudZByN7s0s4a8RAbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EzU32Fgy;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64D606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C64D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EzU32Fgy
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5364d86f7f0so20698291cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222376; x=1793827176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNVblBHL+6qDLjWQDk2wT/AjEGUD/LVbbIDhYzYguRI=;
        b=EzU32Fgyn9m+vjrhYLpr0nTYWcdrW/2pw3szh9TumHoA+fskhE22xGAHn+OvSu7L/I
         YqTA2qA3O28e903prE3UMIvrpp7A9YZnUf7pxmsegfKQdPPh30v5i/J30FwglhSKlJBt
         4Q1E8zsNbsfX6bmU+6w4aBeoORx12zVFRjpoue7xaE72RbcBFPzndWTCa8fdmWDYR6zu
         hEwPyHxuB1FbxbBJ1ASOtJ8BthHmLFM5BhO5C3eAbfFokMmnA2Qcok5xoEcdk2NZ6WIp
         YdVQ0RDLupxrAImbjLzE1xiInSHet62tRsz6K9viwBxmF4UkzQRLuRkN1IOy8cWKENUo
         IIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222376; x=1793827176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNVblBHL+6qDLjWQDk2wT/AjEGUD/LVbbIDhYzYguRI=;
        b=iYvjOrpUhjlauHcf66UseyQ2qBqFFqLIDI28zrc8fZW882/fN/Gf47Y8TGYw3SaeC+
         MMtAN6j4zAcFjszsxFOMp94K2PiefpChr1DbBNQqZ/c+o/Xt3aolnga6SdpvI0jAJYwH
         6ibkdvNEkFcG9VL7noTDdtHLas/PtZiezGN/3a8JAScnc0SRrFJJNsR/aAJ5IzAz5BNm
         rvv6CLYf40zraXZAqu1C2+THz5gpGaPFGILraKQ2PWrGe5Xw1QPk21nU8qJVrCD5r9JW
         cUkKUbSUSgoPriNNepMkLaQn5vjYkn4hOgEN2cY7/yolivNpbqxZ/8XN1vS0i7k7iLnF
         87JQ==
X-Gm-Message-State: AFq9FYK2znvCwg4mabB0Pq/2LV6Fwe+LPYy9Fde+k8DZ+Fxm/tsD+5Kz
	+OYMnyJbppyIOY2do8JGmsKaVW3lRcS86tI82eVrhCou7VEodfBdQy9wcRacFV1po4o=
X-Gm-Gg: AYBFou3vn8zQyu4uROlct07B1j+J3fkgmR0cSSoKGu60I+3ZNQl5QR8iXI3NBTAtaWb
	MjFcn4jnHUXwP4K5Yx4x8I64CPcYDdQQWy0mK0f7h9p6mCMhEUBHa0gYbZcqCztfSZ2PEkHohVH
	VGJGtMOM3/qUwaNY1BP+k39WCycOvH/zO6NXQfLbcy94B2tl+tVIEbme+nSYQgP+3RhfRocmRsu
	OtQCUh5YlLml/lYem4bda2KjnCrpw3pF7arJ4RFdoCmrKDJR9m/vQQePjmT2eQJ/NVa0T8rvQ5Y
	mp4M7NWav5S25q4DI6LMqdrehD7Ms+5WJRD/nR0RDsdJuHCwwXNby7k7h+vugCJUfEBbnnyE2ft
	bE66sUULv+1w69sUlPwsd8acIh1QDCU5dq+r+QJ4K2Vgr0w7Sqn5/g2hAcon6ZpS6qzxT/PjsD/
	A0cIOa7mO+RHB3jxrkx8gjRFdRSA2tn8lfcQBUovAPbgd9CD9wldI/rSve28pSs+DdgvACJ1wYc
	7Jr9IqA6EdYENGE+BkLpqu7JszFTX0N5lraBBBMtvPcbbu8NDGmsISVA9MVXOHRgqelGawLFgPm
	sEMm8vtHP2j5c8bQ0vtpgqkPLRgl016Yfr7ybDTKWUPwc5EkQDoAidPp/a7Mt9UzJXdmnKSQDDo
	xyf3hRs/g8hn6CnQ=
X-Received: by 2002:a05:622a:1a97:b0:536:1f7a:610e with SMTP id d75a77b69052e-53fc8ac8719mr64026671cf.6.1793222375961;
        Wed, 28 Oct 2026 14:19:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:35 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 2/8] mm/page_alloc: detect zonelist rebuilds from memory hot-add
Date: Wed, 28 Oct 2026 17:19:24 -0400
Message-ID: <20261028211930.3504634-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
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

The zonelist_update_seq retry was limited to CONFIG_MEMORY_HOTREMOVE,
presumably because only hot-remove takes zones out of a zonelist.

However, build_zonerefs_node() rewrites the zonelists in place, so
onlining the first block of a zone shifts the entries that follow it
in every zonelist containing that zone.  This can cause a spurious
allocation failure for a __GFP_THISNODE caller.

For a node with only ZONE_NORMAL, onlining its first ZONE_MOVABLE block
rewrites the node's ZONELIST_NOFALLBACK list as:

  [NORMAL, NULL] -> [MOVABLE, NULL] -> [MOVABLE, NORMAL, NULL]

A concurrent GFP_KERNEL | __GFP_THISNODE allocation can observe the
intermediate list, skip ZONE_MOVABLE, and find no eligible zone. With
CONFIG_MEMORY_HOTREMOVE=n, check_retry_zonelist() returns 0 and the
allocation fails even though the node has free ZONE_NORMAL memory.

Gate the sequence checks on CONFIG_MEMORY_HOTPLUG, which covers every
configuration that rebuilds zonelists after boot.

Fixes: 3d36424b3b58 ("mm/page_alloc: fix race condition between build_all_zonelists and page allocation")
Cc: stable@vger.kernel.org
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 78569ac6f2d9..52533992ea16 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4404,7 +4404,7 @@ static DEFINE_SEQLOCK(zonelist_update_seq);
 
 static unsigned int zonelist_iter_begin(void)
 {
-	if (IS_ENABLED(CONFIG_MEMORY_HOTREMOVE))
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqbegin(&zonelist_update_seq);
 
 	return 0;
@@ -4412,7 +4412,7 @@ static unsigned int zonelist_iter_begin(void)
 
 static unsigned int check_retry_zonelist(unsigned int seq)
 {
-	if (IS_ENABLED(CONFIG_MEMORY_HOTREMOVE))
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqretry(&zonelist_update_seq, seq);
 
 	return seq;
-- 
2.56.0

