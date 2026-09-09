Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C63976B8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978145; cv=none; b=aLJukGVZflTF0E4/LEaHZI/Q3qKJYl7Ff3tXc6HhyVpsROFyvl7iV4VqQii47IMc4vreCRdUh0ZWjkR4WftWKMv5EMPHWSTNeH+XoJXfHDB7HBNZHtSLxNNrZ+17fTo82brkkxij0XM3Htd9JEubdYX2zSZ9DzPm4W4TSoK6RMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978145; c=relaxed/simple;
	bh=CMSbUmjBNeTqwH+XPZOLWom9obZHzYZEqa0mzswbC08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMutKT7o4PQ3psLmCWxwo4pb/QswCtsoXDA8D0vaFXrCa0nADn1BwfWpdJriQYr8gKT163XBf8f72j4tu7+tlXswXweYrbLGAYqr7dYlisKXPDxDfH22y4SQ7p9tghXfozBh6H0XBIrQyWPZG2YpSZjQURop7nOvrABq+OCCM20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Ew6ow3XV; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Ew6ow3XV"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-671061b015eso1550212d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788978143; x=1789582943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdfhQUoai9I947DZmJ0Mq2HjjU3s4/4qoMH6601twbc=;
        b=Ew6ow3XVoyCFrGeO0WHjGuioN49MFRg8TrCEZhOmWvtpV+kKAXJkmXBPexGnocl8xo
         VwWuElbJ+l0NgJanqchz5C7+/+6y/rfSFvlEBvyOEbkXjMGZWvB/ylNe5A3HGZJ1JHdr
         cmIGWVYl6vZsdXrLiG+ILf6eHEvZvWz2sAdg2NtTU+sqkiFLA+LYfrXHSIl0ZLH1sHQy
         LG5748LdhiXtbN/fIMZccQRiG8niRLo560WisX8qtDr9MNP5L/aISpvTkzi6xOn8+Ayp
         B5yQhHGzxquhZ2CSkgi1HJMNARjFk+5L5EguzfBvMLQAPWgfKG4UOPRLc11rmZNSjJu8
         XsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978143; x=1789582943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdfhQUoai9I947DZmJ0Mq2HjjU3s4/4qoMH6601twbc=;
        b=dVY3ncx4xLWEfOtkMlSsHh0MSlBindR9xXGMMsTiPnmISzj9X+8s/9m2EDLVxSod00
         9XxakWPl7gunTElJG2xXqxBSTO96cmlB9Lh3TuehVMuI7mpCtiY+T7OmyrcHOOcHMX+V
         42VseqdJIEwnm8EkG7Axc/czTR4Y8M4IA+kgIxyiUoJ7h+nHL/mCtme0lB+c7C8xAAj6
         1BpQxuq07Z8EYnSXTn+CILkacYizjzSzmMw5kMgj0y//T6PbNNPi2YJ+ZNttQxGSXaSf
         UDsqQspkhM8Sw/4Zfk58H1mHsPh3auZ75+7ghSmmKjiYA2pbmPMjY28A7qmWHYJL4iQb
         Z2ug==
X-Forwarded-Encrypted: i=1; AKwUvBxUIv4izOfkAkqpW4ze7+rc1Dfd5Tn8ehlEAP+3Sp8a0xJx5FKFbpDbJ5x2rfYnJ+M7Zvt28Bm1/PRnhSc=@vger.kernel.org
X-Gm-Message-State: AFuF++m6SViZCIXVmAMZy28ze7NVc6CHJkHypNEEkBE79bUbZDIbUFS6
	rjjyRv3orOZ5IqMTgIKZnwzl4LRHs6q5hfUQEkjqWlY5DOZW8lpO4AvwY/z7z7e7Xc4=
X-Gm-Gg: AYBFou09Vgouh7Vogh6Df8ltM8a7EmiPXjPqW6dBj65AzOmFu6TvI0IbXGiFrCPsW1v
	sH7hr6R4jv35148PMmMr1sptD4rl1auUfvNmBr8ll5Bv6yq/t1ovCnRmXjx2nuBrW0psfAPcTUn
	PXvyM/c3Pnocb+dsFp8TBssKYyfCkVmokou2u1c7Q5By1i1A9oB8Uwhe3XhHobA/flBivA35+UV
	rvBg5hR7aQXvkZRfOjNLCVRdGFlGEP0zrPktAbrZc5qRFkEVSUqpLc+Gml1VTDDZuCsrIVRKrEH
	ms8Fg2psLAjgl26HOOvSUzusEcZsbfpSb54SE5J5WR9GWzDvMrUN5USmJKNAhL8b48FqYl3F0wK
	66O+dd1E1nFsU7YTJ65e709SuexEh7J+jgZL4JuyzQhTHYC/lsFju9UP13qmivVfuOJWLthicdY
	Gi0uFzwzWryaUKxLXazyWODdKetp6AkAhL+haA67++vYZwFnTdxmlemPknlg4aBC0QJMbIoA==
X-Received: by 2002:a05:690e:108a:20b0:66d:28d7:c33b with SMTP id 956f58d0204a3-66fb5ad93b6mr9645565d50.40.1788978143182;
        Wed, 09 Sep 2026 11:22:23 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694c35sm149647686d6.36.2026.09.09.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:22:21 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:22:20 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Usama Arif <usama.arif@linux.dev>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Xunlei Pang <xlpang@linux.alibaba.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm: list_lru: keep per-memcg lists with nokmem
 for NONSLAB-backed lrus
Message-ID: <aqGj3I87H6MnAZRQ@cmpxchg.org>
References: <20260907110111.2286932-1-qinyuntan@linux.alibaba.com>
 <20260907110111.2286932-3-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907110111.2286932-3-qinyuntan@linux.alibaba.com>

On Mon, Sep 07, 2026 at 07:01:09PM +0800, Qinyun Tan wrote:
> With cgroup.memory=nokmem, __list_lru_init() collapses every list_lru
> into per-node lists.  That is fine for slab objects, which are not
> charged per memcg without kmem accounting.  But a lru backed by a
> SHRINKER_NONSLAB shrinker, e.g. the THP deferred split queue or the
> zswap entries, holds user memory, which is charged regardless of
> nokmem.  Collapsing such an lru loses the per-memcg view of its
> objects.  Reclaim can no longer target just the cgroup under pressure.
> 
> Keep such lrus memcg aware under nokmem when their backing shrinker is
> registered SHRINKER_NONSLAB.
> 
> This leaves the savings of nokmem intact: slab-backed lrus (e.g. the
> superblock dentry/inode lrus) still fall back to the per-node lists,
> and the per-memcg lists are allocated only when a memcg actually holds
> such objects.
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
