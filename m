Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224777;
	b=NEzue/Pzl6Dl+QEi4eJ8O0WRkVIxSqn/kolAwJ9L5kpsDUfCrq2Cao/xSx+a9t56HlMO
	 /InB9j7LxxUnKjH4QFbpS/Trm6xyMzBdMx3uUYFpdZpfruLrbmi10u1TurUw4DF4yqzWe
	 ALjZ+sW6pt+1w/BC9iVCxv1ccyHm/wBP5Pc65htpKJ7tzwqc7f6rnkeAO5vM11oqX7KxB
	 VfrKGCic1Zh/lmJLMyfJV/SIROxruSBFD//J1LLy84GQ+0jO8ht1FtJmv5LTjn709FNZe
	 8HXTz6yAdQxZfZlzETt0ejc/Iy3mBdpSo90E8kuz/dsDEc0t/0a6Re4yiQTGn1MEkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=OhxlTVYV9TLcZ/UBe1xcuRZQWn43bPmhsFTY2WYTAiQ=;
	b=03jDj6IK2BB6hgFxA5RiZTLL4WOnn4p5bJL8EbGWYiOZiy+pHyZ0XDCTzp4IHhsFEhuv
	 C/FbH7e4xg/2xoqEio9elmSTXMVlOCQdNltI9AzNv9J+V/YkJfsryFe/J8hjB8ztlXueQ
	 3wdULVCIDo8tbzPNgIiBCT4b85Cd+dZapoTVy9aMnnnQBMLue70Vu0pPNMaRnvYdAKGzB
	 mLKRIDmHI+E2oms2AHsk5gXfUM/KDo+UQ7e4BkRRD/NO/LKOKK6i84KY8OO3WsMxu3cR0
	 qmhOhWupIYJmEid0CttRkBd+cjkK0Fm5eVgT+RuS4auPXDw6BPSAHvTYu/P0gPBLWNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=JJljicIu;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=JJljicIu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f560af6aeso158428585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793224775; x=1793829575; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OhxlTVYV9TLcZ/UBe1xcuRZQWn43bPmhsFTY2WYTAiQ=;
        b=JJljicIuNc8c1hKynJqXX/VZCOPYs7Y9HJoAynJywjHK2yeTMkC3bqqzE7PEcLPD6A
         4HUuY3A6DGxK7k1KKDC3MjMltOvH2hnz5xHVGlKqKRs2wvllOMfex65kCIfA/Ud5ZuJY
         5CfIY42O8zl11oDwhrhAEk7nqJzdWGVX+xLfyMp3qho/XLR80ZGzg/jLaxW+lirQ+1XX
         0ZSSG6g37QoKqss/2s/69JJbOxfL25oWhGjX4HpEVH8sq12RNIiNqdxzuwAkEH0g/dEW
         gRXP/wSgQ2RAH+S68n6oHVT5kviIDSSPQ6GOz7LUsIw2+RU3+WY/zX965JVoT66OLw+E
         mMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224775; x=1793829575;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhxlTVYV9TLcZ/UBe1xcuRZQWn43bPmhsFTY2WYTAiQ=;
        b=qm6zsPO4xnlxARaRJFuYhlSvlD9EU3yJzvrRCKy/MyHxj9jAUuSnOAIj/8BwhTM4Z2
         Cej8yovge7ntfUGyTML9pFy4hXh40UUTj5QX2/48/mGTQIay/aOaLoc1Ntrb6BXkdk/a
         E19NlnkMHSQSkdRhoxM8yIh5BXORFRQ0mhBtls1QqkaOocgKonRS2PXynk3gin/DgMNq
         SKmcl9PHuJ993QAHQwa9vAXqmz2U0zSqulZLsZCLvAebhqV3OSkoUuiYrSI8Vgx4ALQ+
         pEhW1mA1awPfeNrF2dFAIICcMqc/xTJbvbnwpaiu7G9l13rGw7XzZIkrG17wMZeevQiw
         JnQg==
X-Forwarded-Encrypted: i=1; AKwUvByMWERrlWff+2P8pG374o6i0TQffBze7xGCgC3Ns0aiXceAHLOeqjtDVkdGrmv2CiQMhKRPOHjKRG4iatA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQLmR2+57+iGiYIAOku1Sm9BIjr0L5Bi7a5ytioguTrJG98f5T
	jhI4aOcmnN8P/4iWxpnr+YKofjGugdJr96aWoic4FHRYE0Anv0+xCMt3y1hfVEZljdo=
X-Gm-Gg: AYBFou3gw2ueW/Z5oDdj/4g2kCoXijSMzSb8sUDHF70MZ0J3jZXpfWWZ/uhDmAQpbSz
	d1Cy4N+uGUu45C7mKyxEcLzqKJh0zo2pKn2NHLkMHtnQTe+RrpXud3jm5/7i3kRxSnuB4WtDVkl
	aYAbPDpZFR9fBKvP9i3uf70uXyZGR1u5TYv3k4yJ+geD4kqw9ruEWLA35Fpc7kN5P297CMVqv6x
	IBaT7+izAvgKQ7mRiwsJdauMoh2TeGjXKoT1AHJR+McquuvTcN1d53kEvnmnwHS/fL0Vz+4gHST
	YAiQFyA0q8t1Qt69En9nyqApIj5rxdUbIu6qzp9eXOwIskv/uhkqem0oA2JL7Pgb0wNHQLZXvCq
	vU0WrOSDCnMYbS9xJsA0Q5Rec4QWpxlzttK2cA542o73wgXh8VSJneQx1KGtIVwrdeEN/PVkI1o
	0nwZa9Dri1drEUENDEhF99WbUo6CK8F8xDpV+Ayj/GZ6wDEk1leaAmL9O+5nQMfmOIQZs4fl9lL
	OA5KJpWe6pZcuTYzZ4ofg4dh0Yz0tePNx7u4m+DRGKgSlf0B6KEaYu5LGkVnGGNyQHU6xxjTus1
	+K5HhrRGFeBAoNT9DHT+tDUDKO7zhpr4jo9FuHHcrXuKUs/qinXK+2zQrVdWqUmFbUZ56vMmlgA
	M
X-Received: by 2002:a05:620a:460f:b0:93e:ce12:aadd with SMTP id af79cd13be357-94408db358bmr587757585a.58.1793224775119;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078ba99sm1374978985a.32.2026.10.28.14.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:59:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 32/46] mm/memory_hotplug: avoid races in
 pfn_to_online_page() with dying pgmap
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261027-fixes_core-v1-32-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-32-6f74bec9a5bb@kernel.org>
Date: Wed, 28 Oct 2026 17:59:33 -0400
Message-Id: <179322477323.1935969.10540673116963281867.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> If ZONE_DEVICE memory shares a memory section with ordinary memory, the
> section is online and the pfns of the device are valid.
> pfn_to_online_page() tells them apart by asking get_dev_pagemap() whether
> the pfn belongs to a dev_pagemap.
> 
> get_dev_pagemap() only returns a dev_pagemap whose reference is alive.
> memunmap_pages() kills the reference first, waits until all pages are
> idle, and then removes the memmap. During all that time the function
> finds nothing, and pfn_to_online_page() hands out the struct pages of the
> device as if they were online memory. A pfn walker reads them while they
> are poisoned and freed.
> 
> The entry in pgmap_array is only deleted after the pages have been
> removed. Look at that instead of trying to get a reference.
> 
> This is probably not worth CCing stable.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: 1f90a3477df3 ("mm: teach pfn_to_online_page() about ZONE_DEVICE section collisions")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

More zone device pfn-walk brittleness :\

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

