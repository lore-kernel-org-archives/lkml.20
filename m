Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640236;
	b=oYHhlsnOz4TQqTTqG6BAV4fkMVQKHMBeNkmczV9Q4wq6MrGtc6Ty/EkUOiQn7/VLBTxz
	 0laDb1ydvJpmPdCAUkznALFFS2d6HSnDbhrTdhOkvvPh+FI+D+oBchmz0Xmfe/nA+YpTy
	 dY5RJgp3Q2mt3dbYHWvX9UNPFcwA2bUHhqx3BoYRoGgB7bHqZ7d3RMnQMGYZ0oBsbruEU
	 a8fOssbQ0XyXBCEooFlKaQ6AGZ+7S2aemCrCrl8V56PAZ+q7SvVN45NaStIiyRxF86UbC
	 gfVCqG1T5gR9o8po0zLzxo74PpHj7Qe/tmsRsSR01SNjtjySr+sux8CONP0mKRV12fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
	b=kGM5XJlUgAV+VllAonbK1OYMMtwJwy67fcxLyec/HwvAquAOiyF4w9SM8IvVcJg8JvY5
	 ZgSNbgOts3aIkdGuFhlfTzhE+Vf50h/wMMwF2mUkuLMwCjcCzeM7A6b9pTuF59t8X8dMx
	 vJmZMJl5EEnii5BRQvKb1efULeYue8WDHX4fRcjA50oHIvxvq+CuTNwIp5lq+16/DaNsP
	 wFk0omX3JMJOn1lyFjj/feqz1sRnHylxdoY11dfKYKEfc236Lm47douE9VcHHppp3JXDM
	 z2HI0HVUMb52Kn1yRyuKaTtjxkEjcSUvoNxh4kXO94mezH0IWpeDbDaOs6At0yQhu+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NrD2qtKj;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD99606B41F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD99606B41F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NrD2qtKj
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ea0c05c92so32026996d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640235; x=1795245035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=NrD2qtKjeYgj8rGYN1fwIgSL20IT9bdCQHMOHTKrC9oC+X0gc2vtwbP/0pBFXO/NP0
         HQOX69QwWq4MNb4Li8WvfWTySx3QpG8CmXSfXqHpUcRgG3oSbMC6WqjxDT/m562PtycD
         KuRcCudGGIt3HNVFfi9LLJLq4QR7G6eDIkxjamWnnAZ3uR0790bOBXukHx5SFAIrogr3
         rVV/a3g+hhDNs12AsnzkGTsK4afWNTRGDAIlhg0fF/5oN9rABG187RlzqBsqM/hs+ndi
         B9r6nI/+MN40ZYs8ZXdDilJk4BzjEhxnTnlkpUl5Sv88KAYoSVQ/VQIkHc1QjmG5QWeY
         nXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640235; x=1795245035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=S40dJdqfZ+9PEfT3m8Pzt7vOxdYrlJVGb1xTTyueUagz58wwrtqs72KAXOzcljm8/+
         gLKknCa6AEJITrXpn80dQXkPlmFfIV2k/g7/ja9m6WVK4XqBIkI13B1WO7oyCMoCGT+B
         S4DkoLBLFygzIi4ZMXkNEwDSZ9g4nn9oWRZr3U398Fo0/YJQOGDkT7bmNugDw4EshR+U
         y3X54VVFTlXENYu7/Wa0cz1MlxF3VFYs0PRMcyPPg4DR7SSSBJ9UQasBu6lciW0V4RVr
         Ijsv9pZHxc3+p3HpY2fusrIr41n2ADcPwfna0fLYzqypka3bqsbDdJr43wxjyX0w8jpH
         0ngQ==
X-Gm-Message-State: APuU4Z/HKrYiYI0utCoV3+eni7i3/14852K4UGSkYH5bfkXOi6yffvRk
	WvOFoVgcQ3mCSAdxTaw3L1v0BVVuJaVKxMm/9/zzK37XuGn7UXFkySccUmZO+FgMCV8=
X-Gm-Gg: AYBFou2WmoS95ZBfRMH5Jv0U/UBrlRDrVK2jmKVi/2BixhN0Gj9lQ+RzsRufIIkuk1g
	g1o1TuGX+AMRAgGPw1layB25GxDClBZL2afl/XXHfO1R4Jyl32fot2YKWienbWbLlu41tznnJZn
	EH8HobvDlD6dpux9fp1e8Sp6v1roI+v/0DK98OidO+ZJlSPPWUGPhp8BTT7e+/y22zZF1oT46Q4
	57b7/S4DNEizzAMHb45XA7aVBFUAOJeCwA8BwxhB0ME6lO4QmaAnOdidNfCcqzM4JyZeTImXERO
	yTBlK3QPVnCV8fog4uJnLeZeQ6PBiKxeIVXPEDqspKovKMX3oCvbe3wrBN9/MxED6pQqbAcJ9r9
	REJ6GHXsgp4RJi5DQutEN9frQ5DGTSefUHpcon3BuhZ3MU+vi4zpHl71DM0ColjKLG5XrlgCiFE
	Z3UwMuqZQt5DxRwiXBJ3sDtHW7ZJdV3hgL4csPktfT+J7yukMcBFk6AGlB1wIISj4enYTBVaut0
	atI59I+Zc2H1H48Phq2mozLt8hxnkMjFzhG330+UD5i0h46RykYOeCWjnOsLv4TgGD+P7dpIQSz
	vtK7glA/oAl00aLaTXuQVJxjQpdXLnfihGgUfuKMGH7k4eqnIvVm2rP7rQj85hMZKNBI1hC1Hqc
	xbOZLU3311cotwt4=
X-Received: by 2002:a05:6214:1d2a:b0:91f:17be:7c90 with SMTP id 6a1803df08f44-91f2424c199mr78511936d6.55.1794640234508;
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 14/22] mm/page_alloc: count common memory nodes for kswapd recovery
Date: Sat, 14 Nov 2026 02:09:51 -0500
Message-ID: <20261114070959.3490008-15-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

When a zone recovers above its high watermark, free_frozen_page_commit()
clears a hopeless kswapd state if more than one memory node exists,
since allocations could then have fallen back to another node without
triggering direct reclaim here.

Only common memory provide fallbacks, so count N_MEMORY_COMMON nodes.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 580feeb608b7a..6d98e213460a9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2949,7 +2949,7 @@ static bool free_frozen_page_commit(struct zone *zone,
 		 * kswapd work again by resetting kswapd_failures.
 		 */
 		if (kswapd_test_hopeless(pgdat) &&
-		    num_node_state(N_MEMORY) > 1)
+		    num_node_state(N_MEMORY_COMMON) > 1)
 			kswapd_clear_hopeless(pgdat, KSWAPD_CLEAR_HOPELESS_PCP);
 	}
 	return ret;
-- 
2.53.1-Meta

