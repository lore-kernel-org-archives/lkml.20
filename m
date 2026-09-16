Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC04C33F6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577132; cv=none; b=mMTZHQpXYTGFE3BN+pv0dXx/mDv5N0QK4Os12jFAExW0kCOk22A2VHhBjwiUFmKwfdPeNP7OJQhtdAC16xr2YJVSzvOxFumQsCo1fa3zEMleWuyEZZrpbIdXg53t46mqKWMpPCdjkYtx9t253Ak4m3JfB0xBh/a3mjQeqj87hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577132; c=relaxed/simple;
	bh=slzZ5sZfwi/OlL+FWVyPUJGGf2b7GeBnj96bDOKE80c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiz0/Ju1zc5PEb39/TrQ14FHZ3upfhh+FfXFAWzOVhBjhMF3TJU5IIbQ8zGYCB/Z3TiiRyOBk+KgwJbBXQo8XQZqhUkcjqx9MyJHdJ76eEAevb9R5QQem7vdRWSNmbaWicMBr1PMB/UnnMbSjsMEiN8gm/ZEucDjWHvWXmaiDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Ni1dTtG5; arc=none smtp.client-ip=74.125.230.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Ni1dTtG5"
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-934956d1044so341853485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789577110; x=1790181910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iWsFYau6hdKKYllHkE77M362FfzZpy87SNp9ei3mzo=;
        b=Ni1dTtG53TiTpwu4PHdxyeCV2ECDTd170p4YN2CDoltiT0bGbFojQ2VlMxl+ag1KUo
         KM6hJbEJmkd7Z34HfFry7auE6ZrgmRqnYwfQOS2U6aJlHyk7vAo8zikafuNgD0a1LETB
         2fKNnFoEhWT6yy7SI1U/+huAE7QJPyMpTSuaegVMqzePWJHkParakzzdjCEbzghUgbK5
         yMvXkbQKq4IGANYPxHyxtGAuIr/Y0c2xJzcpJ7qbA8D4ZAiJGQEvMlxuWyfxee0vrp9s
         MX7wHz90tzVHl/6TBF3rqSjYNav8jTAL3hpLqIpyZHaymRNBFGhHuy//EJu9AptEZtoT
         E+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577110; x=1790181910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iWsFYau6hdKKYllHkE77M362FfzZpy87SNp9ei3mzo=;
        b=hXGby+XV5KYT/LmNH6uFd4Xkjz5nvfi4H/b2wWWQUIxQgcSOuKdj4FGUTl906sZ/eV
         x+pMn6P7tb0B0rR1CT6mrzkch98Gf+kKRcGdLPhn26sNwSBAlqn2bMs2iIqpPsfhdUTO
         3NlT++bI/m43EICoqek7OGTvwyE1awFLnOycEaivFzjb3rt11CIn71CDRplhn9iPJx+U
         +ae2T+vuq3Y/5sD3WuZy7k/EaYimNghk2MBwTmlTHL4EdW4WSmQ69fjuq9dFFxw6iEXX
         GjY+zyJhsNQSg0i0cNu9y0qHfJPDWXvdQmToHPIQ7c+6/pDFqrejLWO8ib/HDsBPr7Tv
         9Sgg==
X-Forwarded-Encrypted: i=1; AKwUvBwV7PsWUxbL0oHg/4WkD3Hi3ryagcsEi9xCMgUajL8vA3JVBPMRu119Q2EJ5JobFacSW4ZX9BoDnxqjzXk=@vger.kernel.org
X-Gm-Message-State: AFuF++ldcQKvL1aABNDKfgJDkjw3jsaTIJhy2ydmy4+WJUvJTa2Ufm5K
	J3K6xWhp8O7g5gYws0YAVRn57Lk9J1IcrjfP076PkwZ6p6MlQDL9zZsPF9y40ZBujz4=
X-Gm-Gg: AYBFou36luVFOPDIEWFSHmx0iT4bYbuR3OZgLNStnFbn4yXU0ixm/dmMqHqoQNeY0C6
	6DtG1U+UGnPfQIek/DzkFYEqeMD+imVOuRDH1N0bXTi5MwIb3r9f0+bN5sMNzXiRrnLvn5ysFRY
	KlaJ7km3ZJuDhanaNSXNkhzaRj58vA7B59B5LgCsr1mi59LU5UNCZ4qWnoB4f21roJKjYH6b98P
	+9pH6snanYOvgSEZ6/EO6bdVMDZG+A91dAdsY1YFrEtybztdGzWv0uqk6NgCeYiDzslht3FJmVV
	TPMZpggYFSRrL93GC4q1iWcE0WgnrVLS0UJCTsufQjTOPUYifg/MWlc707ey+Fp+wEgfcNXeYlX
	r8XTXUoe5OLMfX3YUHF+2ovyx/m9DGKJrn+AXW3bLkCDj46svCYCb8827jGvuwIgfCycfzWt1no
	pMUpGp8GwSgwVTtjrDcZLXCEcbWOi53FMRUh9DoeHwNrun3P/7iyMWTDTythMYz7lZRp+krQ==
X-Received: by 2002:a05:620a:4889:b0:939:922b:3de1 with SMTP id af79cd13be357-93bb7907f9bmr535994985a.44.1789577110417;
        Wed, 16 Sep 2026 09:45:10 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7821d3b0sm260394085a.17.2026.09.16.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:45:09 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:45:01 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <aqrHjfHwyEtRIr5S@cmpxchg.org>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>

On Wed, Sep 16, 2026 at 06:19:07PM +0800, Baoquan He wrote:
> xswap is a swap device with no backing storage. Swapped-out pages live                                
> in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,                                 
> and the area is grown and shrunk on demand as swap usage changes.                                     
>                                                                                                       
> The problem being solved is the static size of compressed swap. Both   
> zram and zswap need the size fixed in advance, and neither gives memory 
> back when the workload shrinks. The solution should be a device whose
> size can scale up/down as per usage. xswap does that by mapping the
> metadata lazily instead of reserving it for the whole range.
> 
> Design   
> ------                           
> - si->cluster_info[] stays a plain array. Access is still
>   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no 
>   RCU discipline, no tear-down state machine, no NULL return.              
> - Only an initial chunk is mapped at creation. The rest of the address     
>   space is reserved, not allocated, so an idle device costs nothing.
> - Growth is driven by allocation. When no free cluster is left and the       
>   address space has room, the next chunk is mapped and added to the free  
>   list. No userspace involvement.
> - Shrink is driven by frees. The free tail is scanned, and whole chunks
>   are unmapped once the mapped range is at most half in use and several
>   chunks can go. One chunk is left mapped as slack, so the next                                       
>   allocation does not map it straight back. A ceiling lowered below the                               
>   mapped range skips the half-in-use rule and is enforced at once.

If the swap maintainers prefer the VM_SPARSE route, I'm happy to defer
to them on that.

However, from the cgroup and zswap camp, two stipulations that I
reasoned out in the other thread[1]:

1. You must not charge compression space as swap space to the cgroup.

2. You must make the compression space large enough to be outside the
   range where users can hit space limits before hitting memory limits.

   That also means not allowing setups where this is possible.

   I'm fine with fixing the zeroed page flood issue separately, as
   Kairui proposed.

So if you're willing to fix the cgroup charging, and if you're willing
to drop the sizing interface for a statically sized space that is
sufficiently large, I think we can find common ground.

[1] https://lore.kernel.org/linux-mm/aqLi6cIjD2wJwk0B@cmpxchg.org/
