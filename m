Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41434AEBC3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444600; cv=none; b=q43u6Gpg+bEuCcwT0s7qwc2qc3baqPPqxmP/P5l3JSFK7RT9tzVVJUk8/7da5L438GgY3Bo92JGyPE8BWJVe41hZpQQtYPErqBfJyZDHiR8jNeqW9Ztb3QUeax4NyytMHXLP9JdhokceG8SpSTYYydH0ff8mgdACKTwSgUtKvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444600; c=relaxed/simple;
	bh=+gAcGmt/xxZpDNYTrG7z+20D6m7/JO5BWqC8Lc+Pa+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqgJTJIXKO+j6rnu52i2pPILeutDIvT14Vby6L6g40IkUQ8qt8VXa/7thIiwCgJ6gIfI5uzChaLSGlx7s93fZBr4Z8KAL16G1bw62nXpgQOdcpNXGCA9pyZnX4sPCLxSZd0QYkNxi1t0zeJ8Y8y+n8yDAfMngLWNj2IQeNbwnbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=mAZkanw/; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="mAZkanw/"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-861145fc841so26709437b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788444581; x=1789049381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MdYFxMzLhAsz9CXEVO1o2mt6I0dz9BL/Meo6d0Bb364=;
        b=mAZkanw/TyIItdAvPxAOx63vpebYVyo8tFKf0jiWPCXmC64pMI6BL+mkilUh0I0kqk
         xv0p62emWfQ8+8xv079y/F9OUZOCTS3WSVCUcFRF7ZmX4DHKFsiXGYxHz5PuqsygG2j1
         QOfyEaMsKoZalkSlMmKDgtzTFPImJZdxVcl+L3Y1y9zoJSQd8lWQ027BMWB0VQHlnnno
         r+f9LtJcRqtWMalX/sDv7SMOo7l/Yvjb7mPG8eLUF/CqUs1TKboaaV1X+V3Cb4X22mxz
         jdZ9QAPZ8/CO0djf2MD6ghIlPluWl9+F/SyW2y5QYvtPCY+X5bSBJuNWCms3uqAl2Szy
         C+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444581; x=1789049381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdYFxMzLhAsz9CXEVO1o2mt6I0dz9BL/Meo6d0Bb364=;
        b=FQCVZYn+C/qgawkqt+OHw26vWDlJ3oNvGjrj/fRHVacxG9Oy2sGmV5UKu9xiPL+veM
         V9wUrE06KgtJrv7ztZdj//A/YSBrzdQ2akinLtcsuA1zw1zD//lC5Ys9pU1GPQTJcnAd
         HVuwfoQEMeBROFTOdtNnaZOmYAe0SGM9UsLpYK6fUqVK+6q9CL9Co3kkpcUALlmQhfTD
         LwLJJQYzxhV7S+3IgkzWhvfcD4hHy22bm35bYgZjRiI2fSMdgyDOAqMfuGCEJ33Yv4jf
         CU2KF2QbbBYhDQ1CkrSi9P6jzTvuKwyBqGRgSOkH6EZ4sOlhWrwV37VhjW/QIrnf8NTv
         V3DA==
X-Forwarded-Encrypted: i=1; AKwUvBxeuB3pncWGzruw+f0Y14ReyOe0j1ATdtiOTACrgPwrVTEUCtITPn5JzJ9Go+kVAEd8MMhT/mp29Tm/HgY=@vger.kernel.org
X-Gm-Message-State: AFuF++nvNIQbCakXQwAJ6zF0RF1ZLy1bZSjLqu/pkZStwZljIHfwjXad
	4M9YXamVCeP76gWHkL1ebdUPIbSqJri3iLUZtiZZREdBZijGFN/TA2Bqd6NXNJS8UpI=
X-Gm-Gg: AYBFou3HrQH60/7v8RQRiXk4Zj1+Qv58h/1fHaxU5JmU3OHbiK/VgDilGaToD0czLLH
	LrB667aCAkbmW1eHKygjx3nVpvKiqqZ9IPfy3O6M0pvhZjIs6gKhC7T2Qm6VEjikEnUHLYan+O4
	gqh9OhzENR7d5pUBWPMInQEqMhbT2PvIFKKU/QNvL6jvfuFORlfeR6W10gF/nRsxvYk+/82OqLr
	e+FV7w6dd2A1CdLuofC236FUUz34WnBHps0qE4saMJPWjIf0o/BXyBLDsG1X/K71v7BcTctbn1b
	h/JzDTSIEpXPGc/pSplOsmI3yyJ5GqTa4LryYJNFPIjltOksSngFq5kSA5WfUJy9W9QAmUc5m7D
	myPKvE+Rs/U19z5bACfEd0Uxa3s9uKX25PYRp+FzC5ohcTONhTRUIxEZTZk+F6GejbzJ1NRHwP/
	DsTzII9RFNzZg8EEJoJMfAplzDuJkiUsTOsrBfsbft8g1sipRMooWp0k4SXDDp
X-Received: by 2002:a05:690c:c512:b0:81f:2403:9e70 with SMTP id 00721157ae682-86c51d40664mr58591657b3.19.1788444580869;
        Thu, 03 Sep 2026 07:09:40 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c178435b5sm40369647b3.29.2026.09.03.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:09:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:09:38 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Down <chris@chrisdown.name>,
	Tejun Heo <tj@kernel.org>, Yu Zhao <yuzhao@google.com>,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
Message-ID: <20260903140938.GS3004@cmpxchg.org>
References: <20260903031952.1120321-1-ridong.chen@linux.dev>
 <20260903031952.1120321-3-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903031952.1120321-3-ridong.chen@linux.dev>

On Thu, Sep 03, 2026 at 11:19:52AM +0800, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> For MGLRU, memory.min/low is not honored during global proactive reclaim
> (writing to the root memory.reclaim) and global direct reclaim, because
> these paths shrink memcgs using stale or effective protection (emin/elow).
> It can be reproduced as follows:
> 
>   # echo 7 > /sys/kernel/mm/lru_gen/enabled
>   # cd /sys/fs/cgroup
>   # mkdir -p a/b
>   # echo 100M > a/memory.min
>   # echo +memory > a/cgroup.subtree_control
>   # echo 100M > a/b/memory.min
>   # echo $$ > a/b/cgroup.procs
>   # dd if=/dev/zero of=/tmp/testfile bs=1M count=200
>   # cat a/b/memory.current
>   222650368
>   # echo 500M > memory.reclaim
>   -bash: echo: write error: Resource temporarily unavailable
>   # cat a/b/memory.current
>   6070272
> 
> memory.min is 100M, yet reclaim drops a/b down to 6M, breaking the
> protection. The traditional LRU path is not affected because
> shrink_node() calls mem_cgroup_calculate_protection() for each memcg it
> visits during a top-down tree walk.
> 
> Commit 30d77b7eef01 ("mm/mglru: fix ineffective protection calculation")
> moved the protection computation into lru_gen_age_node(), which only
> runs for kswapd. Non-kswapd global reclaim reaches shrink_one() through
> lru_gen_shrink_node() -> shrink_many() without any protection
> computation, so emin/elow are whatever a previous kswapd run left behind
> - or zero if kswapd never ran on this node. Relying on a prior kswapd
> pass is not correct either: a memcg's emin/elow are derived from its
> ancestors' memory.min/low settings and from children_min_usage, both of
> which change over time, so emin/elow go stale even after kswapd has run
> and must be recomputed at the point of reclaim.
> 
> Introduce mem_cgroup_calculate_protection_path() which computes emin/elow
> along the root-to-target path only, by iterating through the cgroup
> ancestors array top-down. This avoids the full tree traversal that would
> be needed with mem_cgroup_calculate_protection(), limiting the cost to
> O(depth) per memcg - typically 3-5 levels.
> 
> Call it from shrink_one() for the non-kswapd path so that each memcg
> about to be shrunk has correct protection values.
> 
> Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>

With Barry's two points of feedback (changelog and comment),

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
