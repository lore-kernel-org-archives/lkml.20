Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32039B969
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978594; cv=none; b=cue6WA3pX/sSe09a06WYT+SQKYvYDEoi926OpNGUB0RpLyG8P7/NYm9MfHttIGV5Nm33NTiPhL/nfks88j6OGUyBsLwr15khfO5mhmWxq4YZpXZzkvLwZAHPHpHcpsKr/SbbNOE47k2hMfyBkWwG4J0tm8H96DHGPzitco3WIl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978594; c=relaxed/simple;
	bh=+CPMrFl/jUrszvFkBjRpPbN5cZST8GT3Y7StztkkvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/mY62hk9y2SsxMBcecfe3gnYjvzRXoJvrHlvYBPfaqp7b60L1MMi74TNaDMqAoxSC+K+xQIMa6kTgf7mTtKOCWdmD2S5xT9TFHazx9CPmjtRPBdMdcbM3YDjWszpYC7KsMcehaC+jNJ809s84SKX5+Hqz71/L7Ze57JQpxje+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Fi9RVYqE; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Fi9RVYqE"
Received: by mail-qk2-f5.google.com with SMTP id af79cd13be357-939042cc742so316355485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788978591; x=1789583391; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIvedYIS2AeKXYBcXZE100tskW8WcxbKQFbzxJ/h4TY=;
        b=Fi9RVYqEwZCo0ISOqSKryizFIiVGTqGD4se7Ao0KnA+ndQofn6j3t+YKzrP/mktANx
         oxiSmf0blYorYyBJxeEGrEsK3uOTgizQw4WCyFkcG5TytkDGovSKE0r/Sp36DkJ0h8b0
         mAjZ5xvpfY/Pj+dZwZ8+NgWAylRPSa0KFDXASmwYfIDuEIit8gSxzFLRAJ1GVFKGJ7Ps
         CtDbxpGqbGPa37EyGVU+6uj5irS0w6sPPbqdrIEKM/wjwmGLJYjWnV6pOTJUQ+dNCfuq
         QXpOVt9yy8Pd6+5MQYiiEsTyWYk52W9RTL4fuSpA8t/VAc61l8UvXxTLsfsQi9pqwTfE
         8mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978591; x=1789583391;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pIvedYIS2AeKXYBcXZE100tskW8WcxbKQFbzxJ/h4TY=;
        b=W1VbxXxiIDvAwZ1ZU0R1ZmIESPZ459TSYu/OuCI8fDABCSbiQVl1jIQ/HC82dvrE2q
         +849ghTQvRVRflC8L9DmWF0SnzELBLO0kIbcLVOZu4QvK8cgiFy5OdOb5vBJm6/Y/SPq
         d+LHBtNPCx7fbcADvO+y8XHHSnG+3TdBkz8ccsYNxNu7JFGxDuRNrSovkmmzLZTEbsKb
         vAm55vyrw5t0xKWoUG8IHnYdPbdQ2ZhlnqCiblMYnZjGr/MZQjqt/lIL6SyeEkpfq9yt
         MROFBBzoL3xLNV8FLPz2t1XrrX/xCrQThXBuS5WNwGBn4qUDSGqkdO0kTTFXbFYqi1yh
         4AKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9bZa40S3rRsc3agA5ORlFfIl6WJFwiaE/+j0s3KA3U6fjvTfkLbVrJz9gggGWAZXA/vGb1n6S1qoo+i0=@vger.kernel.org
X-Gm-Message-State: AFuF++nBMrsGeQl/OZQXo/8ANALpj1LriQVNPcR5ARftbbndrHM+ogk7
	GGKTUsbk4gIMZ1S5HYsXv+nQzmLjz7YiKXRINHxsSZNeIvgoq3WoAafHGczaGaXg6Gk=
X-Gm-Gg: AYBFou2h9PnATutN6Xf+OY52LvZnOZfDti2rxPLFJ3jMJS16fZ0Tw1cQbvk8u10tXz/
	ODREJFSPOseFujDz0Isj57zRbPlqfb0arpdBjdwQXcowzrovI6SHalwqqQVzp6GoM6+0NallJ2a
	c1ulYA0pFZMkpohj+7mSTnz1mFrAM23LpgkAJDNrIMVROEgInMQBYEsj6HWG3HBZkt9Saob8mzw
	tbiyZ7WC94+FqiVYEx2OEeVNTjiev69hblgqeXTC2crpJwTk5OyN8xq53akxbrhV4xbFYH+x3wH
	ZBzOXQBpfCNpO30lfGSqtKiVUfS8XK7I3yhc4XV2d+qcQuyJwgbEJjNw75G8hrvNT08kGGsgLsm
	A3D31pvbIWhGqnWrWum9kWEoV2t/GGz4ij20QJ7nNaQdVMEe/nmz3ELSAskIx5ne0tyg3w7l2KX
	cU47Fv+Z/SZ5PeZP6p6kzAU/RU3FD2KtWBVkTT9tmZF68/GqNKZMth4RLUTFOf/3gDiPt+Cg==
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id 6a1803df08f44-9103efb48afmr505437276d6.32.1788978590647;
        Wed, 09 Sep 2026 11:29:50 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910490a3a58sm119183276d6.44.2026.09.09.11.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:29:49 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:29:48 -0400
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
Subject: Re: [PATCH v2 4/4] mm: zswap: mark the zswap shrinker
 SHRINKER_NONSLAB
Message-ID: <aqGlnALaf-Cvq4kj@cmpxchg.org>
References: <20260907110111.2286932-1-qinyuntan@linux.alibaba.com>
 <20260907110111.2286932-5-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907110111.2286932-5-qinyuntan@linux.alibaba.com>

On Mon, Sep 07, 2026 at 07:01:11PM +0800, Qinyun Tan wrote:
> With kmem accounting disabled (cgroup.memory=nokmem), memcg reclaim
> never invokes the zswap shrinker: a cgroup under memory pressure does
> not write back its own zswapped pages to make room; they are only
> written back by global reclaim or once the global pool limit kicks in.
> 
> The zswap shrinker is registered memcg-aware but without
> SHRINKER_NONSLAB, so under nokmem it is treated as a slab shrinker:
> before commit 03375203e1da ("mm: do not allocate shrinker info with
> cgroup.memory=nokmem") it was skipped by the !memcg_kmem_online()
> check in shrink_slab_memcg(); since that commit it is demoted to
> non-memcg-aware at registration.  But the zswap shrinker is not a slab
> shrinker: it tracks zswap entries and resolves the owning memcg from
> the folio's objcg, independent of kmem accounting.
> 
> This was noticed by Michal during review of the patch "mm/list_lru:
> don't copy stale shrinker id from non-memcg-aware shrinkers" [1].
> 
> Mark it SHRINKER_NONSLAB so it keeps its memcg awareness and runs
> under memcg reclaim with nokmem.
> 
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/
> 
> Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> Acked-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
