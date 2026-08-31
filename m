Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22CB3DA7ED
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168035; cv=none; b=uute21heoIGFdq8uVzHtwXTIzOVQOJUcjFqaSxm7P/304GzGDlWHkOIlCIr8AjCrq2UhnjqdnaoodZyUtWcg3TQEzf/O/H5aRdQvrsZ78UjzbBLUb6jlFGXpPX4s5+OYxtfxhkzWsu9LJPN+THpquqELEWH7t+2RMC0aP3P5/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168035; c=relaxed/simple;
	bh=1bkcUrvmztbrpSh/SyIQVxj2aJNk+2CuyucdHJWFNec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz4XJhWr3bIPoiiN1ZH8fa0HIKZUnCUv8mWZm/mmL2QHa0oB629zK8JY8Ak+JSIqL41BKpY3P4F8XiLnN0XlHM8y4YeU9L7UHQHFE3tJhqs0LNJgM5J+GNFqFEc8oHsaBS3p3h6iRx2yrdhxQlATJJ7TDVr8YAc96zelHPmoByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JELnNjHf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JELnNjHf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e5733a5aso1914039f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168032; x=1788772832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmZRJNMYJ5AXrDCDZCrGMnxri4tZm1nVUIzEyZPjscg=;
        b=JELnNjHfORGcUOERWEbzIL7UvVHPPFEK2LBUqz5WF4wEPwJ0Uo80HlfhUy/TrnEYZE
         OjO10twPAjvXUbdR9bEUjjkf4qB8n5mVguCViS2PRp8s/nHRR59zCwyrqimPP5YyWRTL
         QJ9g95iwdsSYm7eibIPmLMjKqQWABLVUeiHN5DqcRrUd/J8t8fp1gtfnWpXHhty3Es2p
         dV+a8FoV6eoWUa48jpQeQ9fNYNzN6KrjnKf4RRKggcbR+qbKqy88QMSNnvnh1oohMz4C
         UobFFHAQRfJMNi5UdwywAgEpYOyHdq09sQPzV843VioFlsgKn2Em1OcxdJ7a444UTcc1
         H9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168032; x=1788772832;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmZRJNMYJ5AXrDCDZCrGMnxri4tZm1nVUIzEyZPjscg=;
        b=b6WfG9xlFB1SWL5WEsVUSOr45ndSZ6yXej0J3xdOpCU4u/obGWatv2/BPvs1DJhg0A
         EjC3BfxZISHToWim7qTGhQfBh4d1p5LEpny1J7IdKoys1zviAsDaq13uNCwfpB/AmJWR
         iJFx09kV7EMB3KlDkQprMXpXJ1yjqwoGnpPpszHrCS2KS/MN5S8+zIwPzWUtdcUY7LiI
         bGJo33dpCfhwv3T3OdfQQlAcp9mU0ma4G5BwsyFzi3G37m7q2ZNL7NLFpBLUh/WWgweF
         gLeaQmAmGRxSaxgJ115jzKIGJIVYUdRsnTfce47us20fslOuxa6+C1l32lyhk+texf8p
         KcVg==
X-Forwarded-Encrypted: i=1; AKwUvBzFj8yz8W+KDFaNd9QbEOcqAr+qJ2VnBEcKZlPFlhg5wCjv69vpnZgQpA4KI7ntzNyQqlL0kB9Aki/mgbs=@vger.kernel.org
X-Gm-Message-State: AFuF++mz2RrRC/eRCjYBGcFgJu+Yt3/q6hiQNuT3Fqc9mKF2g7VA3Y5K
	i/gMo6F4gsdg1si+5xjFuoWFfwLDcP4Mob8MVR9chJYKjKcSl6f9tUm4e/h5rimSlCA=
X-Gm-Gg: AYBFou0T7lDDY8wpbIxzyjJJr2vSaCVgwZo1x+iJ1nTXzhUkGuZJoPNIxYfOJ43HLlE
	9o58mP9AWaskiFt0XNyBoyDxxCbt7xRqjJoea13iJHe+YGJ9M2ZlU+diKrAOfPlUg/+wtinTTGT
	TxwhlWA0IJtc/qj5BgGQOphzYuGblbF+qQyDdp8YSU2+EAVaxbw+WcOFreoyKQCPzd8v5SlN00U
	W1qylRT3MfX11zNksudaIYFnRUU5u0xeUrFB+nbHL8vj8clKItOCfXjmOfKSNH3aGfTBF/vQLzi
	LL6JXwhGRD2w1OasD2vPN2/xCFzGthWq2b3huYF4xhEml5vFhqQZr5h3aBbU/8o7QbsEofllXU5
	0UodisHf4dJhHaFl65FAZPYkqFkYIjPWzRO5gofzYSy3/ROFCsR8ANfkfyGldK50EVf0hrVT3NT
	vkvkxOT86dAr8N6GszsvPmUcNLQDosjoomIvvuVAaGM7VjT85iLUTU/KiTKgwesnMLp/ODKbjfc
	A==
X-Received: by 2002:a05:6000:4012:b0:484:3310:710f with SMTP id ffacd0b85a97d-4843f00bb60mr2562328f8f.27.1788168032065;
        Mon, 31 Aug 2026 02:20:32 -0700 (PDT)
Received: from localhost (109-81-17-247.rct.o2.cz. [109.81.17.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm10478328f8f.37.2026.08.31.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:20:31 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:20:30 +0200
From: Michal Hocko <mhocko@suse.com>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apVHXmSljK8HrIuA@tiehlicka>
References: <20260831075635.2244437-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831075635.2244437-1-noren@nvidia.com>

On Mon 31-08-26 10:56:35, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> pageblocks for every eligible populated zone before capping the result
> at 5% of low memory.
> 
> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> configurations, but scales poorly with larger base page sizes. With
> the default arm64 pageblock sizes, the contribution per eligible zone
> before the 5% cap is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Consequently, min_free_kbytes can reach excessive and unwanted levels.
> 
> Add an absolute 1 GiB cap to the recommendation, in addition to the
> existing percentage cap. This bounds the automatic recommendation to a
> sane value on systems with large pageblocks while preserving existing
> behavior for typical systems with 2 MiB pageblocks.

I would argue that the whole model of increasing min_free_kbytes for THP
is wrong. This will trigger memory reclaim sooner and make the THP
availability more likely but this was at times where we didn't have
pro-active compaction and many changes in the compaction. So is this
actually needed in general resp. only large pageblocks systems?

-- 
Michal Hocko
SUSE Labs
