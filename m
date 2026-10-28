Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206565;
	b=sU9uLyCUwaqyvLX467Io6X5XIEWM901f28ZJpc7zYMA7drBNDml8MW+IECrq/ugOBz6L
	 zVhzHXbXzI2iyP4mj/vtaOWqHyiVTXM4BcFWl0wALwaEiPO6f4q4xK0IjLA3YIA4eZFeQ
	 2a6XL4PXOnlbG6K459FfLu2kN4oB1qyrovJBMll+GxsEvIeW2sl1Q+8oKF3Ilg5nw2I5p
	 RbZNopJxWuqEtsZQTTsiV+jyPT2LWlmWkEndUboS57E2og4S9KvHnttNvDQepm1O4Fzj3
	 yehFGyQBPJ/VH+YgsufuUJtGkZZHtg8K31XPJ2zDjKDi0R2WgKnwajBK/paA70f497w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r3C0d19m+/iHxVzVsZqZF5QMTPBWCH1ibPkdNy3hhyQ=;
	b=d7DlWIFwZWljNdrmVyDexxRY46v6Q/tnrvA4riTixZ2Gg+/WvziN6uChynQnKXd4iaOg
	 lOyJoHwuqQbIttAAKMWEFjTrMFq7thz8MVVAnbf6/zBLjAAh0JCdAgBsxq89tj0D91mlt
	 5LGTgF6RFvsHONiWvgBKotfIS02x2VkRyXuuvhiajOHXgZc8eITgodTHZlA0P8qAbmcrD
	 p/ku19qSNjbPXr+X8mU6Nppv5B9snEaTdSuMK87XCKUfeRjN0m+luEcnE7UaVyzozdoO4
	 IID0DmktlsrdtY4qxjlR6s4XfU8rULGs+Ig4HFDqq9iKrpAeLf8knEZK/+4jCBY3zYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RLxEwpL1;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58591606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58591606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RLxEwpL1
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99075306daaso649917241.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793206564; x=1793811364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r3C0d19m+/iHxVzVsZqZF5QMTPBWCH1ibPkdNy3hhyQ=;
        b=RLxEwpL1hIyB/8de987ZDlpeLtVUV1o6ZwdAJJ5mPDG/A2ay9kTAD4XqeALAUEZc7T
         E+rNOMrhz40DYs3ycXgV4yPyi2Usq+ABEvzGTdQ6EpE08oZlMGrXBuZn0oksHESP214x
         HOhO5Bk+S9aZF/Fy2QjBdly76Bg3QJbA3fHIMsPq+C8FaEknA6C+IUV0EwW0bTP9/zWQ
         OOiQwebdi3deLoTwUunNlh8mr6V4B5Us/zvAKXtM1PltIwFDSzlYp0tYCGFgZb7w9dqp
         BlbKIJP2xgxwiBLxFNlTcmwU0vPots5dguJS0n27G0NkKxZIVloQxL0s3OxtMGYRXIkB
         K+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206564; x=1793811364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3C0d19m+/iHxVzVsZqZF5QMTPBWCH1ibPkdNy3hhyQ=;
        b=mwu9aFxMcRyy7Z2Z8cH1w09U6xl3/6biTIundEdlC9dQlOuU/dqVEk67pNSwg3xUm/
         TC7qB2Jvo1nJ0bQOuOJHP6YtyLJnr7DdVF16AsW+xa6MFkF+XusRLmvCCE7/UqWRKcUd
         A9sYKCrQzphKxFL9JgWESPYT6b5xGxPqKD+trse2DJ//qmjfWlXpAQJbzFKoUwMNzAS8
         QSSkA/HxxDSUzhEqt+DJQH2/cB/uhsU4l+xsBcoFguTtvDEPhLVYyxsHcXrzhsRHtu8t
         KC9Dr4wmrvGm/7ODhre61mTmAjiFz7W6b5JKuw1gP6rqFTqg9RdCjhDXLxT46HC1ThAd
         C1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwivDY6vqBSSxUiioOWavruE9SlF2zBbgtK1ekqNHax5c6qWWWGHu31F33LnjAnG/JmMybsJmDmIL+jktY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJyq5jb6/vaF1c1gAa++tzLf5BNhgzPapzNaJzAQVSZudSAEHl
	kRHTDK1ywxb9qmE3xMcWSjoCzbUuOSIbOYImEmHMyFEqx1xVK9NnNJfi+kbBZ6BAXlw=
X-Gm-Gg: AYBFou1qOUAetZjTZ07+VBDvGm0LXi8/TR0ma3XuR9/n5rDX8RdWy8L+jMFWMgTFNMF
	chFqrtSNiLT0tIQ/znUbC+HQs8QGRYvZsFn8kjpSFSKGyVHXThkqkyiHB1OZ4Z7itexWzw7Ri5S
	Gfy3+g+TM9I1KK6bHMRNE82dw8/p/UnNaZBeOoqVF09tCC630uUQhGyrtJRXIZnbWFLgq6ERb1E
	dRZpagV0vm4KXB4my0pa3Lttml8iaLZfJOEsbIGdnTemftDmpzTYl7RQsOxjIb9HaMh5trYapCT
	egyOUSrRv5D2Ck7/wgkwnV7HEYchLgOcXODPmoeuf5WGO5w6K2IhWZw4goDIsNTczXFnyDEl24W
	Kp8UsOChWvW9KYq+iL+3Mblu3bO17a2XgmpAVINI9F9MUrjIsp7uLB5CLULp+wcHMZYo2fsrRvw
	UfLjVCNKxRjgH6N8hLVZpZIOi5+ZclB7R9pIi2No+vHJTJT3i7ONrdgLeQgb9XvE4NXTy1nU78s
	egH0PjhbDu0E2cjwCb9d7nVYW3Ij6fY49wnv0ZOMkaHS7kZSbJXkVJLzjGn0f2cYvfInjwGt6dy
	S819GRA5vCN8B+9Ef9WDjQjqlETnMFwSIDwH0w5wRO5SB1iTG4O1cwR7U/cBw7cfGVTJbWgybf5
	gANCjy+T/LSkNk/zSBFbYFnyxsjKJ2E1F4U+eGYuFJtGkoITswDpr
X-Received: by 2002:a05:6102:370e:b0:7ce:a79e:75a9 with SMTP id ada2fe7eead31-7d03a59dbf7mr1528233137.36.1793206564343;
        Wed, 28 Oct 2026 09:56:04 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259fbcbfsm6525438241.10.2026.10.28.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:56:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:56:01 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Hugh Dickins <hughd@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Minchan Kim <minchan@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-cxl@vger.kernel.org, stable@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 38/46] mm/ksm: reset the unstable trees of all nodes
Message-ID: <auIpGR1VG7lOxJ8P@google.com>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-38-6f74bec9a5bb@kernel.org>
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
In-Reply-To: <20261027-fixes_core-v1-38-6f74bec9a5bb@kernel.org>

On 10-27 00:17, David Hildenbrand (Arm) wrote:
> Each full scan resets ksm_nr_node_ids unstable tree roots. Enabling
> merge_across_nodes resets this count to 1, even if per-node roots were
> previously allocated.
> 
> So when toggling "merge_across_nodes" 0 -> 1 -> 0, a scan that starts
> while the setting is 1 and continues after switching back to 0 can
> encounter stale unstable tree roots, resulting in UAF.
> 
> Only root is allowed to change "merge_across_nodes", and the documented
> sequence is: "merge_across_nodes setting can be changed only when there
> are no ksm shared pages in the system: set run 2 to unmerge pages first,
> then to 1 after changing merge_across_nodes, to remerge according to the
> new setting."
> 
> Let's fix it by tracking in ksm_nr_node_ids the actual number of
> allocated tree roots.
> 
> remove_all_stable_nodes() and ksm_check_stable_tree() will now scan
> more tree roots (skipping the empty ones), which is harmless.
> 
> Fixes: ef53d16cded7 ("ksm: allocate roots when needed")
> Cc: stable@vger.kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/ksm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index dbfb8f98b1892..9c51925825cbf 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -475,6 +475,7 @@ static void advisor_stop_scan(void)
>  #ifdef CONFIG_NUMA
>  /* Zeroed when merging across nodes is not allowed */
>  static unsigned int ksm_merge_across_nodes = 1;
> +/* Number of allocated stable and unstable tree roots. */
>  static int ksm_nr_node_ids = 1;
>  #else
>  #define ksm_merge_across_nodes	1U
> @@ -3636,14 +3637,13 @@ static ssize_t merge_across_nodes_store(struct kobject *kobj,
>  			else {
>  				root_stable_tree = buf;
>  				root_unstable_tree = buf + nr_node_ids;
> +				ksm_nr_node_ids = nr_node_ids;
>  				/* Stable tree is empty but not the unstable */
>  				root_unstable_tree[0] = one_unstable_tree[0];
>  			}
>  		}
> -		if (!err) {
> +		if (!err)
>  			ksm_merge_across_nodes = knob;
> -			ksm_nr_node_ids = knob ? 1 : nr_node_ids;
> -		}

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 

>  	}
>  	mutex_unlock(&ksm_thread_mutex);
>  
> 
> -- 
> 2.43.0
> 
