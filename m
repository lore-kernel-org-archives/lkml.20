Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222499;
	b=L1a3huBxeSvnqwS7+KnYSQrF3h0680enafaVAKjIx2c1aUaXz1U2x2MUG0w82KM8bHrV
	 dpcn2okYpinphU8izsLwMDMEDtlTKuPt+qCZeX6Rre91r8nPUDUMLPnCHN6esRQHidgfH
	 ZrtAPCFy0o0HZH+d+hNbzIgmZz+gG2DRY4SUHDFUp1Tbw7l317BNucQky8KafOX0ojv4Y
	 1H2u20oIzys83sdwpseiF/NFk/hdnjSijXCnAhyY5aHbz2UQQtm7uWtDUVCt/EERomA87
	 uk0izH+npnUtVziOSj0lV9MTUZc0ySE6aSQpuIq8CTm0stIVLUQfRLslgnkxnjBAURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/AnoOf4KaoFS/ftZh5xPkws/q1U7dINbhxvKXiKw/hw=;
	b=G1OLO/xOey+Aoikpla61AdFXZMnW76uQ6hJ+YeROt+H8tpJ+9eJ6jBJioiyofj1mpQnb
	 Tp64uMK0g6LoEdszbxeBfJ7WlIQrcRKwBXT/kC0CQnTtMj4IykolWfLlkwO4N776ZEKQO
	 whaMy6db/9z9abfSC4anTuowMgrw0IAdtgIjukx2qCirfLK0yfnIvpB+FnL61kgRvinIn
	 qvgz+nTzPWcNk4dQQLCges/mOOOFLnn8vOh0sTOqQcteQ/OMV3Q8+8U5oH7zErqvkHZSS
	 w0R0rZBnnj6g+/XO3rorqpvLrml7BGCKXuBXp1gNyUZd4h8ALZdhlH0UUH29ZdQeIWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=C0bh0Mps;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=C0bh0Mps
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8565d77c277so13599557b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793222497; x=1793827297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AnoOf4KaoFS/ftZh5xPkws/q1U7dINbhxvKXiKw/hw=;
        b=C0bh0Mps1qm3/4kL6QqtrrocFRbdkoL6IZA3D82P0RWdr6+DOFzB8s5zW2RI8bVS2K
         Mg27GpCHXxtvNQpZkQ0yZmqL/72TEG7KSkRWdsmZIEDDitYmUvSx9qCSpt7OmPUv0Y4s
         r2eJBY/DmmL83xCy2P/sXRSP3APelzWGeej4J2Zq6ph5V+QNpKYwLpne/F0khHpkREjs
         A3dl30zWrM9zQQ0sgMSDVF2yky9YFY/9QsrLalMQrbn2vK8EI1R0TRsnqvdKtp7PnFXi
         zDCm02U7MnGPnYpz6QunJCDJikTzZWC2QMuYth2M8sI99Y/BW+ITdq+6HiGu7BxdsEwN
         8sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222497; x=1793827297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AnoOf4KaoFS/ftZh5xPkws/q1U7dINbhxvKXiKw/hw=;
        b=z5sKBV42gTILK8eQbLeKNSwd0Bn9JK9huEOC0oGKn2yg9sR6eWTSdrb86KygRCwfZ3
         TquI78H+YzzYPIblVwi31+un8ylj/RdiQEL2qszZMrOenftdBllB8jBABzIGyc8s3wUd
         fiSW/ar6Qf/xME2dqCJYgQHHsPgrWwWKEOug34AlnKrdwzbfyXajbZ1bBeYEnggEECRl
         T1xApKWGuMNRs6br6rdLDkjD7GHB1GXYypZ6Wgh1Q/l9tzFWMON5AtmSR5CtPoS0Mk+v
         9fE4ztcPWEdCYPHFswVS15mlciRkhHbH3NJWC90N5VAxfEfdt7vfN9Xu++breopLYGKQ
         CaGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxf+0Mp8Krz80Nb31sVg+HZQDprKlw7yG/q3vZ6dDaCrWDQM2Abd2zFxPkaOw4xe2tECxcf77S/a8y0yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRSUO4iopEwleHhpT/0wkZajmNrhtZtt/eV13tZfiGfV7zEmLG
	z8T1tR5u0JkmHwqjcQvIIOwLcS7lmYakGqgKUdZM98EgBwGF026NXbZwKZZIUB3Yp0g=
X-Gm-Gg: AYBFou03oEQOD0HnCWdRLeq3APoMSwPUtBuOKZ9nbpDkvxKQ46Ux0XZ+9xSzYLt3H0A
	/MJi4ZMuEsVz0waPJ3oT2EhkMIMbWHtjInlSf8znZNNhisIilZEWcSceIXWUxK58RVxFviHHX5p
	hXLDCoS5b33bgM96B9sOSP6S9loxW3USC8EywhKl7O9hLwaidxpaCbIePRC0NCJVyLVwIE6vzMg
	5UlD7WIsfS7TUoYuiI4MGdURsSVnKrALNnN5S7O5m7CKfEpb58nR1gmiM+nZPcI0kNHOE8ya9MI
	MCLmWTw1q/7W8im2vDAAeZgJtsm/XHqGRobV+eHTQnKDzodhE0MXFximg7f2dBp4wEpNjvvDPLy
	IFsZl1jLwQpWuK54f7rE8UakvnaUNsGiZTZ4OQicq5Eau7+oHNzh6ptxRFv57Yb4i+1KHdAxKRo
	ZAzqeayOwDGO/GrceNH1iNgK6IoYIxZanzsR1plOSOczDvYbXfD7rKLlIRfekkDOJZjexb12jQq
	Hc6glhAdQns1dQnMDgnQTbHLzGgh6ZFVdTjQdWfm3W08U8m1Fuj63XpHHe0LGIAe/OOmUxqF8Th
	TLkd+8ie/I6zMwTIYEdaULt43rw3
X-Received: by 2002:a05:690c:c5e0:b0:8a6:1901:30d9 with SMTP id 00721157ae682-8b1b5c9952emr18568837b3.37.1793222497186;
        Wed, 28 Oct 2026 14:21:37 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e566718sm35368027b3.17.2026.10.28.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:21:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:21:36 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/vmscan: remove redundant !mem_cgroup_online()
 checks
Message-ID: <auJnYNDHiAED_dtv@cmpxchg.org>
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-2-tjmercier@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028010611.3929937-2-tjmercier@google.com>

On Tue, Oct 27, 2026 at 06:06:05PM -0700, T.J. Mercier wrote:
> Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
> move LRU size accounting on reparenting instead of copying it"),
> mem_cgroup_css_offline() reparents all LRU folios to the parent memcg
> and zeroes the child's lrugen->nr_pages and lru_zone_size before the
> memcg is offlined. Nothing can repopulate the offlined memcg's lruvec
> afterwards. A folio that is off the LRU during reparenting looks up its
> lruvec through its objcg, which now points to the parent so it is put
> back on the parent's LRU.
> 
> As a result, lruvec_lru_size() and lruvec_evictable_size() are always 0
> when !mem_cgroup_online(memcg) is true, making the offlined memcg special
> cases in get_scan_count(), lruvec_is_sizable(), and shrink_one() dead
> code. Remove them.
> 
> With the get_nr_to_scan() special case removed, an offlined memcg that
> still has stale effective protection now has
> apply_proportional_protection() applied like get_scan_count() does, so
> the MGLRU and traditional LRU behavior is now the same.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Great cleanup!

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
