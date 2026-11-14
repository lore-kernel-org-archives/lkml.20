Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640248;
	b=MWLx7ghHzXWByYIREk6vxTSSQeMoeJbM2srLjM+FBFGFqzKgWo/ttMGb3HyfvGQSReAi
	 TRpr0EmRgEjHGlDJG6/R4GqeKL1r2M8yONpAs3RL8RFhw9SHTrPxFhN4DdnCShvjc+b9p
	 TUX46/TkC4E5oUdS/m3fYC2uNBrZyas/wwldJk5jgmjCAovHz+vQi553sNiN80Ira3YU3
	 +EzFEFXrKB6axXRuciBbttA2B8ZNyXZGniDNDCkv6Ymm9NSnuF6sLW4H34ItXBOYxQAU2
	 qjfAb0ic1Bap/60k/lus/KQAaRU9t/saneXjJtXwV4hCXbofJJ4Uo+0kj+bhXAKZVAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
	b=ibeM5bnPjTCxFqgVx2FMlYW6jXwSRbJqf1i0mZHWKYP12Ghxe0YeF+ZxIhRC3/evyflb
	 rK5tggoo9bZ3QNX8f4vbsy2vQwtUTIO92qNa69+8xFs7Rzej6Bpzp/+T0bpTdgOjivavb
	 Yoi2jXe6Ku8HiC7rW0ov45XDxxdeT9Aj/ab4Rjbsne0jspeQxGmGWS4t1hu+Su+RUOss3
	 gIivjmTTfNaZrtlt4teDqZLN/FdnKQpwZ4RmAumjXR77zsZ2HHdNbO9TuAhbt5dix9eMs
	 CUBp1suioRBQNF+4+ICpo0Jpa2neZL5M5nYqJzcRI6YsTfag2uTU3zLH3bGjoDfXGwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=BLBdnt0i;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492460A380B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2492460A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=BLBdnt0i
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c1f548f87so41262336d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640247; x=1795245047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=BLBdnt0iRNFdOZZN6B0cCDu/hXyt7k9PsSJY3QJCW3ekKrAX8pBPAbkT3WVRuWwYMw
         zSddppBa0D0C7Cm3/JDK/25sp4KjGdI2ObCcZ3l+uuVPtSgiCU952hXfESBUlw1mczJg
         KHLuORDxaFQGrfgG+HMb2PbJ8MbRDgOlPMNKfZQHAiNb7/kvjLe5uSwFHyHGL1c1Wn5u
         n/yf9bUliz7p0g7CF/tctqSCoW6EGDPz3Wmzti2CG/xreKkeI7Dz0p26HxXLxyI8SqoP
         jC1f5E71FBV3WJAhSXNNIB1HwWVEvPiiJHfQHn1hk40/DTFMdowDbXfXF0FkV7eRjWMi
         Jwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640247; x=1795245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=hygodB1+PfOJ1m0TeCZfr05arUY6EKDzHTdgQ4SV3qWmVFgCB17nO9qEaaazQ1iscW
         u2b/R+DvPFgBeXoyE6n2/CvCu03VJkc478XXZjU6eviF2n1zw10pFt0ujxhoPjitLEan
         6Un9m6sG+YXfXNL4dllXwyHpv8VndDrkKbt0yWhI3CReToVwicCC8QcQP4uX+V4rrrSS
         4zIBnX34aVwneEHQ3jMP9j3voAWwvwpnEkdDraXc3fty9ZXP4lgZdR89GVN+dKUYm8Dh
         aleegcgZBxvy3v+2VHtOhfszvxrV/KevwaniUcvymuUZkGjR1gYVyqxdsShiWc5mp1Ze
         dRSA==
X-Gm-Message-State: APuU4Z+92wowS4O6PodUYHH+NX3r9LnK4wsz70gd1Z6rFukWkOVXxnJE
	F4atPIs0fxuGC5GWTIjmjlQ+ne5Su0bhOkTP15RrQQFHm8mBLIcMwFM8YJffilyiO6w=
X-Gm-Gg: AYBFou240kgc8I4Jip0TpiEhEBK4ZpchNnCnpMj8RHh8hHXPZA4qjythM1oxm4nYfrj
	fBD9TaMSHMHVzXubFyyHsF+Dgm/DpZ/FpVMg9UyGIeXruOdXiEnBr+1TLOdWjbUkvlRWx3Q/dvf
	eGP6mQL+Rh3C5qszAIIMASRc0bF5TU0Wbm64JNj33g6euIrnNaJrkQdl+VJykikGYIulYZckN1m
	2MY+YWKE6heShB9vuqkOSxC/Jnbp6qA6q5sdw1QnoCz8YXLuEWl41YZ9dstSK73jysFvR8QuQgM
	vG0RjGRqwxGrMwrCor/1nBOSwJ7LOtqYkcL2tBzx42EjO/lX2K5J+ePcq5lpPZSbIiB5vTwM3a6
	yX5Hm6EmNYbTFvT2QEU0S+s5OdeQpGECSfsw+noXnttaDL4iwJqK/y9tB7LRsJcMVxmW7Q57t+8
	E4V82vD9W8BJ17uanTRGQoHMhlh0hEaUW9A1WRhV7FvZVfp5NIjn3llNSTpgFz4cMX+wJYMTuCW
	Xf3jZp2nNIgKKDQyo8rI30QHO67kSyirGMPubfals6Q9eLfRrIrI0XTHSjvf4iOiE8MLr2B/TrS
	/MF5QvikNq7hRoJlIecgN9V2isCJBp4GeDyjnOKLOdU9IopK/hJWjmQNetOcZ9iXhdZqKltgNAo
	/2zZN+w522PB4fWI=
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-9494bc76c5amr813866785a.68.1794640246800;
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
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
Subject: [PATCH 20/22] PM: hibernate: size the image from common memory
Date: Sat, 14 Nov 2026 02:09:57 -0500
Message-ID: <20261114070959.3490008-21-gourry@gourry.net>
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

hibernate_preallocate_memory() and enough_free_mem() count the free
pages of every populated zone as room for the hibernation image, but
the pages used to store the image can only come from common memory.

Count free pages only in zones on N_MEMORY_COMMON nodes.

The image metadata estimate is a separate sum.  The bitmaps track the
page frames, and every zone's frames are tracked (regardless of node),
so that sum still needs to be calculated for all populated zones.

Every node with memory is common, so hibernation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/power/snapshot.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index d5dba0e50b2eb..8aeb086a3fd3d 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1866,8 +1866,10 @@ int hibernate_preallocate_memory(void)
 	saveable += save_highmem;
 	highmem = save_highmem;
 	size = 0;
-	for_each_populated_zone(zone) {
+	for_each_populated_zone(zone)
 		size += snapshot_additional_pages(zone);
+	/* Image pages come from ordinary allocations. */
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (is_highmem(zone))
 			highmem += zone_page_state(zone, NR_FREE_PAGES);
 		else
@@ -2011,9 +2013,10 @@ static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
 	struct zone *zone;
 	unsigned int free = alloc_normal;
 
-	for_each_populated_zone(zone)
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (!is_highmem(zone))
 			free += zone_page_state(zone, NR_FREE_PAGES);
+	}
 
 	nr_pages += count_pages_for_highmem(nr_highmem);
 	pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
-- 
2.53.1-Meta

