Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2D361954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366212; cv=none; b=Y9jQDPzZjPV/y7UeZDou4AGmiiJF+rQwDJMKhXHkVEB3+WUQ1jc/DOx+6iANP/6MAuuQY3N/vyiMnP2lGVpCNcAjKxXCE1Dl1ycAPU01IkTv3kHildOPerJ8uZYkfqcvHlfYSogxSuMbMjOYYve2Cjibr/fqtjMXZemokXTnxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366212; c=relaxed/simple;
	bh=ke+y50zX1ol590mqGNLt8Yk0WHyON5gXDb+wlE118Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzduBcur3E+mzsXLhoM99WMgzNwzhPC997MU4zUpLgZTUeinIvAXCr/VQgqOeHsBYtu8kAIsm0x9InZv9L+wT2GOqyC5qy97QTh6f/UHBRtJ+309v9ypyorxl/7blTLzC/AetkkSnpb9BdkDM0zBOvopOqGa+q8EZNREKpXsBuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=kSb/OV47; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="kSb/OV47"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66f96a9d30eso511407d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788366208; x=1788971008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+YqXELgsqbWJd3zd9NAsECFpyBD1HQvK/BLYl3TOCsc=;
        b=kSb/OV474sHqzLsl20tRiq/7JjSF4OOsAFJGdTZYawc6fwEeygiU4KlaaS94nEnaXv
         fpULCSp1vVHKM7phca1fpGA1dK6mOQPYBhEZth5VKMOFWYejuW3QRFBWnGhLHCvyM/pM
         80jNOUYpDr+rH14a8qVzXwQfNTWu0jGJ9PwhGak2WmsRJmAH0BLTZxVC5f0jpcOeoTdb
         h+0JL6B6F9XPxYpqsKAEwO+y/ybjKyprirzg4K3fkQu2qHa7uJXgpN5lT6bskQ7ILgRt
         By2ubbMcVBMwqjHyh9a9jZongfPnNxRQBgCm+GqjwDYzywPjZUQdS/wc6TmwJCPbtq/j
         b4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366208; x=1788971008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YqXELgsqbWJd3zd9NAsECFpyBD1HQvK/BLYl3TOCsc=;
        b=Og8cJ47UweL+/T+OgyD/GLR0PzdMbOCq+xHPpF0bl9dbITuWuJUs0G5Cwj6t6v2dBs
         vy3jmpcHxa5TqHUkm4wBMSZ6RcNJDNbxD2C4n9KDHs1PmjjU9nBRtSUL/DHLiVa1C377
         /8D8H6ParQIsQwKjVr+Eobn3CzWSZYuomn2m7nY7LVf3NjGjcEAMKvOLwVVJcBnXx2qz
         Hcld6SiS+J2UXT3QUJCyEi/jtPhxdVz0iPu8hLDSUlChdy7gyvCQe7ya08K7Rrj+tsb1
         27GQbCqZAJfk9vzqPJCMMsYExclBToJ93c5Xq6ZpOkFZJU/lLzb7PsRHrtvu+lztpbhu
         7tYA==
X-Forwarded-Encrypted: i=1; AKwUvBxBTCiwmPsmXbL3+LXId5qcrqBkfNQreSYELHz2sc5Wt2RnxV9Lf4Gpi5NUB0yd9dPIn4ejcRl5Vdxha20=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Z6cNTYkGX/T+cT9DJsXDcXCPzILRqrgRm7KcfoP8qdaM+Pcz
	XzADkqIUsycaGReOU2SWdmKw6QbnTQla8ZBj678w+jUSNerbyU5Q2PThgUgziXjHFfU=
X-Gm-Gg: AYBFou3Rw6D+wJ5raeKGtgckzg0529ghKcluULew0RfarB0Cykk8fxGqjz818Nhclfa
	QWJMp/SGLxeNxNUsbkmskOOuiH6bvoycLs0kjZranL5Gxwi3g2aT3kZ1YgpDI50z0nQY21a6E3D
	n1sBe0vUbjFj9beMBf2PXli+oM0PE/HdjTNDVe+m1ASWJERQ6Zng0o3qV0XMjbkbT9T+iral332
	QVK0+D3T/5itxa7qaIlzo6IYzGKJExxWb+HDAuHuyqfjgfqZIM62vbTDMaQugShYyt70mMAGvaH
	4Z/h1avu40LXymA1SiJc9uqaqCRUsf7i7ooPtHn9lBAuxlm73eIEZCUG0ZqHTBbhlwVj0bsYukL
	Xp79CFYrFysT3MJGQzdwIWnno4JeIjnA24kMdwU+MjUdKkJczcrtFV07kug7qrAwcDi9qRU3+6+
	GzoMm3igNtLtvw1jDIoZy2YtXHz6D4U61WKmciwo6FAv1690yBOfxUdIyaxtSl
X-Received: by 2002:a53:ca4f:0:b0:66e:6231:5735 with SMTP id 956f58d0204a3-66f9bb54ddamr1843674d50.18.1788366208467;
        Wed, 02 Sep 2026 09:23:28 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c17840d87sm20706277b3.27.2026.09.02.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:23:26 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:23:23 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260902162323.GO3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901190123.3511535-1-noren@nvidia.com>

On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> heuristic to help keep pageblocks free and reduce fragmentation for THP
> allocations.
> 
> The recommendation scales poorly with larger base page sizes. With the
> default arm64 pageblock sizes, the contribution per eligible zone
> before applying the existing cap of 5% of low memory is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Even with that cap, min_free_kbytes can reach excessive levels.
> 
> The automatic min_free_kbytes increase predates proactive compaction
> and many subsequent changes to compaction. Given those changes,
> increasing min_free_kbytes for THP by default is no longer clearly
> justified.
> 
> Remove set_recommended_min_free_kbytes() and all associated
> recalculation paths. With this policy gone, min_free_kbytes is
> controlled only by the page allocator's default calculation and the
> vm.min_free_kbytes sysctl. Users who want additional headroom may set a
> higher value via that sysctl.
> 
> Link: https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

Just to summarize my take from the subthread with Zi: the premise of
this patch is to roll the regression dice on every THP setup out there
because certain ARM configurations result in a questionable pageblock size.

I'm not against carefully evaluating and testing out today's need for
set_recommended_min_free_kbytes() in real world examples. But this is
not that.

Nacked-by: Johannes Weiner <hannes@cmpxchg.org>
