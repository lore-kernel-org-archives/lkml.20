Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723829;
	b=fg+8zWk4MY3CJTumJl4KVr6rYd1mDM/PK2srOdRF3rw2TtYLvv5Vpj0bndMRkwJ7+G+O
	 4C5rEZoqu872O7SI763VYbdEoR/zMyL1UZly3JJDn/ZjhkrlZZeRNl8HDiIG+bl7ofhKL
	 ZfTnqbExUsr6lj8YmFeyQtj9saolnWHtaRFktCiAJYeveFpKkKqIYKEH5y0JF8p7sixrl
	 sQvERwMWeyAu7kmEHZdzyh0EByFtEMjYUl30Bir7EGjksra1iIcZVHJ4cEwk3fWjwhQen
	 5mvwOhr4171ugrdbdsgLQ9/t3d1tU+fznFfd5JR/L3Nk6/DNBd1anzX3IAoZh4kOXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=OJBuCzf0jzkgkRBG/+Qk3pvdihNoLY2pngEX/HqTYv8=;
	b=e/Cqa2Ed9ghBHSrE+O7ARUDEwgWp3UftQUI5FEVcUms4vjTcJEXdI8WjJh+XkOcftxFj
	 B5dGNiuuL96LZKFMQ6rglD00f2xgold1tafwFX/NeryyKoE7DdgiWrfc5Rg4JS0wpsROE
	 /Ww9xIo7oeGCPxpbjIB3b2sp2ANGU+bcp6gWFT5hsqpIFNGmJsRkcAhLiyH2rHX17CuIi
	 JQiu0DRakzICXmtH5K++kQwKI0W7YPLcxO9T9+cMLK3xYjgH4iq4pbN+afud4EL2ApBKn
	 59D29xMhZZcrkE+nCUyJNmVUFD9+pjXFvPqN5SdmWXzUuvg76YwsI8LS7oLWdVB3Eug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="TOag5/Qp";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D604606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D604606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TOag5/Qp
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so4092770eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794723828; x=1795328628; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJBuCzf0jzkgkRBG/+Qk3pvdihNoLY2pngEX/HqTYv8=;
        b=TOag5/QpH6CB5kxhSP6A1qAEL0hISe0YPzrAbUxAVeyAKrUzzquiFdqcQ5GUIDFUYg
         8HuqPskgeHUlq149dQiY9a7HS4Yx6Gsy5GUuv14NeJAscDnvfIgt2SSjOhSERh1QfdjI
         CKqFTXK3Tg9tcPVWSe19+fuRyGqUhIUgyyMBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723828; x=1795328628;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJBuCzf0jzkgkRBG/+Qk3pvdihNoLY2pngEX/HqTYv8=;
        b=KGqUgdfIjr/UId1rx+lldQKzr56fIhVsZ/ckLhi5V1tvfKmqpZyCLKBA4Nqqpb2bnY
         HwuKUhlHTmtl7EqxbO65JErQhIPNW6Gcv3EuN5cw7wEj8VBcLWJ2BiBKD29hTfICEl7Z
         CByAcKsIZVl6qeNgLe8yqyMkUsnFaRwHAORLk1HVS8nPMACZn8+aalnj2p3f803IlkFe
         xFBMyU6Aoi5XG1kzslNlE3eiL7PD1fDd1VePfNHwsCT/mGrZK1cIh6wHSab6d5QLLdl4
         yu1Ljmza1IvqhJnF1FQMuldDxzd2Ez/rdVpuSHH36ZK/HTb1PJCl1pQ1SuStxqvvg9Kf
         xKig==
X-Forwarded-Encrypted: i=1; AL+hErGZluPoSw3ElLf4fTGtOoGjFYBg2Rw25gqeG8FdtbMeQyEVvXZlAK7olkX5GgNOhYLkIpCASTDd7i7I/18=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RGDsHfO642oOvcC1dK9nIPqWkRWo09PEs2dk5lxqVuWpJOMXC
	c1+Q7BksvdTCdUhMCQGwivwzY2k2VK2izSUmu7gKF7bfuB1uZ0+4wMQzgIKpukjVoNY=
X-Gm-Gg: AYBFou1ux2KNSYS7Mtk4qAKN+eNFCwJnqcrlpcqzNKBjx/EOsmYOKjMQMDRAWRS2VjV
	k4pwFFWJVi57aY4GyYvcVy0bxvUa6WVMAZ+KO8rTrXvldaqg1jrDS0D39Ur7PpE4DF8uzSdLfeJ
	goPV9nIctPQRykTQ/ydM09CSDbyqfPBQlZ2DlTZNrn104bwxMMH1BxLarq6/rIf6y/2fvnH3Lhd
	ktGOEIRBeFyAuqBWFZlqFTXdRShIIZokkkIrqG+Da7ZMEbtt0OfpFyj9fn+fZ1PFUH+9HqeJ7yF
	FdLubCLuU3UEMuhggu191n6IduIw4f1ZMtNPVKdvSHAYjYrpgw+0CDRjIY8EoUKi/g254QYGTVI
	uQVuUu0LxykYEwEFzLUFYCUmxuJOnE03kf68/o744t23J/sS8mLci/CZYUpTmLX+jn5JnrNr5Q/
	DQi0ud+d9DzfGaDYYO7gl7zIn11zZsG2RTir6eyMHZao0t9EhTTwit+S39to2JcmgQSvbZZTXrz
	+XS6fbe/UKYbDU/TWzDeNQ5kpZ5JrYzO+O+xMSz874O+LqfnZxV5JF69uiM9xH6j/ns1f0ClAAu
	JVTfcn8Wh9ofEjywX8NHh+sK3rpYjlOnGBmYSxnMVZqoaIrB/CjDa4TMMCqVTJh9OAw7rljILLa
	r2fY/lbxxwk8xLdzsKxoUZ7kXl3pvsa/SroU4VxMMqV186YdlYT5RtiXQSZKb/hYwBIwo9W9b1L
	11fHaaQCE7uozZedm74f5wTb+kEibLonaw2JY1FZGooIq6cVGfSFVs9tRcio72IijJ1A==
X-Received: by 2002:a05:7301:f08:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-37967027f1dmr6460112eec.28.1794723828153;
        Sat, 14 Nov 2026 22:23:48 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm19889556eec.4.2026.11.14.22.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:23:47 -0800 (PST)
Date: Sat, 14 Nov 2026 22:23:44 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Sang-Heon Jeon <ekffu200098@gmail.com>,
	Mostafa Saleh <smostafa@google.com>, Ketan <ketan.kishore@oss.qualcomm.com>,
	Usama Arif <usama.arif@bytedance.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm/page_ext: support early allocation for SPARSEMEM
In-Reply-To: <20261114104150.58424-3-songmuchun@bytedance.com>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
	<20261114104150.58424-3-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114222344.e65dbc73bf2c9276@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

This looks good to me in general, I only have a few small things.

Muchun Song writes:
>-	/*
>-	 * page_owner must be initialized after buddy is ready, and also after
>-	 * slab is ready so that stack_depot_init() works properly
>-	 */
>-	page_ext_init_flatmem_late();

Not a big deal, but this means that on FLATMEM the init callbacks now run
after vmalloc_init() rather than straight after kmem_cache_init(). I can't
see anything that depends on the old place, but FLATMEM isn't what the
patch is about, so it'd be good to say in the changelog that this moves.

>+	if (!slab_is_available()) {
>+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, 0,
>+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);

Maybe this should pass __pa(MAX_DMA_ADDRESS) as min_addr, like
alloc_node_page_ext() does, so that the tables stay out of ZONE_DMA when
there's room elsewhere?

>+	page = virt_to_page(addr);
>+	if (PageReserved(page)) {
>+		memmap_boot_pages_add(-nr_pages);
>+		kmemleak_free_part_phys(__pa(addr), table_size);
>+		free_reserved_area(addr, addr + table_size, -1, "page_ext");
>+		return;

free_reserved_area() prints "Freeing page_ext memory" when it's given a
name, and this runs once for every section, so offlining a few gigabytes
would put dozens of those in the log. I think it should pass NULL instead.

Did you manage to get this branch to run, by the way? KMSAN is the only
user of need_early, and from a quick check offlining a memory block on a
KMSAN kernel fails with EBUSY, presumably because the metadata pages can't
be migrated, so I couldn't exercise it myself.

Once the changelog and the log message are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
