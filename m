Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2182C15AB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965787; cv=pass; b=V1YueYFEwrKMo2v4w2BmNVRu6iETtjvTUqlun0lEEnLWFkwuw8EvmN5e+GodK9aV6ZSOEXyygjuWmo6utpIrCafv83rys8UduEIRMRGX6kJP7K4L9flQ0eH6Aw26XwmC4SLqDozZiWe+m0Q2Uj1jHkvDV203JwvX4Spy4iR38dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965787; c=relaxed/simple;
	bh=pX+iqOVqQWIHRPFeptniyJvWBDEGBzA/6VSzFPucy1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ip/jbHFGPuH9Udk2Eg7vG1LNIgfWj8AVsDyGfgVL9NvEe5s5NY0SF9ZyVj1oTKM7OZNshjauEqOoAxUXxdHXKTJ5fbwzMPcAihzgm0xSZQSDnl924u1EacIAnFfoPTOUZPXIRf5ZqINxORV402VmhkvxbS7Vf5nV9Y0LHm24Z5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW/NoDGK; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW/NoDGK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so9939295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965784; cv=none;
        d=google.com; s=arc-20260327;
        b=mWwOSxKMlEAkBCUtEZXy0BbtYhD5062OVc2dSfoanLCOXaoYDoa/ebsxj6h0fXhJTS
         yCDTV/t1ekOToHuFTd58brAEKdM4VilFdnbq2m8e8/6wRx18sIgcJPKUunSU8hO2FlFR
         2+m+6gLxq0Yui/jVw0rOYHc0GFEWDaFqf+bOEIbo7LqHgodeajbpTXS30e/8B+tWFsK+
         fMhCbDEEdcWxwL8fZkwpG3Mg7FpqYDCTIhjl2n6mENUSODaRiWotW25wz5kX/LsoqpJw
         Fvr3BWZYZhem9uHJnIgVV+mN4FHgKo9wNnWK2RD3VXlr8atFUnAR19dXas/927RRudtw
         HAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EzsJ2XbIJCRg08piphlkM3GNGt42SpypDAM2KpYbBo=;
        fh=3PtnQmEVtK6FnV7xNG1DJ8wy6myZVMVHzuI2MvZxgak=;
        b=qgjsEAI3vsLlstXb6Sc0qr2AtTG9kpl9ZNsJ/Bhrq3uUo1CTXnjWG9OvGVLM9vMkNS
         xFpo7KShO7juR1bcG3MrcCZL/SHubGImaKuDA+uq4UtpHlPrwvkkRzS+xswdqGFzVtgU
         tnRzqPBdOTLmRO6K/IHPbxTk8lqgKQ017HpBg+SbDoMYEdC6m4SKyC3u2hUr33tm+dow
         Xh94b7OPntLG7QCf10wRaaaPYgo3q0ULEqPFSRwB6EXCpbdagsqz5JDLGVUrmSuGyO8z
         JeUzBseizuGR1TuavG8Xn33q0sXcxiIlYVutws7E63eTK5wJ1KYZP/TU9tvGcg8MGi00
         RsAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965784; x=1789570584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EzsJ2XbIJCRg08piphlkM3GNGt42SpypDAM2KpYbBo=;
        b=GW/NoDGKEnV6F04FH+rHwsnr9rTDJrGceEhZC5h5XwbI+cc+6bfGuDXqhrgeepFOO3
         4GC5+G2bSyzWk05nGnfVhJpF/EBavqTsDmlaYxB/skGyflBfKUG4rcjTgUu49WRtZ1zp
         4MlNRzrhRWBqm8DZQNgvjBDBjwuOW2yiozh/73vRRp5S63JbixtczUEBr8i2HwQFLHMj
         9bTTzFMB5hcR1alkkWIwpFANDS6GznvGFxj5XfVe6HahNAFO8+GNo2suCiot87LsqBwt
         9lJ4UvT8PzUKNdlO7uu0/E9bXfAreNLI/R8UysxbPYaY2cu+u5xzQ/RPem9d4rPV0lUe
         IV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965784; x=1789570584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EzsJ2XbIJCRg08piphlkM3GNGt42SpypDAM2KpYbBo=;
        b=IJ+ijqRKvrzqifB4sj//lBeqif+BhqR1Awbf9lh464LlBeuCXyy30VPzqeS/AyY+uf
         5XOu6c5bdxINLQz+hYy3HKwSNvCT1NpZWnK8H9oPhl3M6sx92+wvauL0Rk1iRqtVZGN7
         4VPEEMQaTtkEiOQTTgvzXKPxAb+lIUeZny2UxJcT078QwqWriX+sp7WbM4LlOjCTHqrT
         7AMR6z8HfR/68pOhDTBSEDR8lMAgQ9QykhT63IbsCt+qy473PbFCfYeW25Stgguz1v6y
         JHVkunHweoq+gdRRt89OdSjHQKKMNLmWmlXEIE3h6WQAPDdP36TEdXD51v4OHhC1CTSQ
         00iQ==
X-Forwarded-Encrypted: i=1; AKwUvByC0SrB7DXKndQ9cD+wlcn23C8CgH6b7Fr331hIaPT2Tjbm7POQe1kR2J8JQjdVCTTUE/8dI8xvfmCcM0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nycC3wFrm4m48sTlrUCxbBKNw0rTMErj/cKNSs1ClKULNkZCq6
	fyaB2qovGLQ6eWs+I8LFe0to5OU0cYKBEK1o7pL4ZeapvJSVTnHlVvcECngOaN+UuszZKVf1mSz
	Afr6xZSRczdpnZouTeTK9Dz1pjbBFJGc=
X-Gm-Gg: AYBFou3znHzNY1tzVm+flzDNABLLsHVQGqQr/Trm5sI6Cpv5G/4V8fsSwNDeCweLUbb
	8Rvq/yEQLhWRzp+MLUuybHdVeRIrWenw5cgNAs/Mx/E9OAPsdUEPQIWFSt/daYfupwIQt+s1hZX
	jCIL28x1Toj4yW0LYD1qJ/9oCSbHZETmQRYyP3IE2H/pcftFZGbE74ciz34FxxbI1kx8OywbCZN
	svge0i+lzIWZs2q3CIunyw+U56/PJHStxku+HVpC9Uaq1JUxADC1tMHY8oM4I9zBLmHpOoWZYdg
	iZ2nwZOdLpJQi9/6971HPQ8EVOcEIPVvYC4BGqj6Aw8YT60n0PoLhs8gnswovh3jTL1XDlq3TNZ
	aUVY0jIDnDIuovSE3AL+hHg==
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-49d175439dbmr143483155e9.1.1788965783309; Wed, 09 Sep 2026
 07:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com> <20260904033503.4067283-3-qinyuntan@linux.alibaba.com>
In-Reply-To: <20260904033503.4067283-3-qinyuntan@linux.alibaba.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 07:56:12 -0700
X-Gm-Features: AcwNN1XRJdmkw63mXOMob49BAlRwZ-fncp2bctcYyRkWfOoIpHMzKSC7_xtXJwE
Message-ID: <CAKEwX=Mim0apjf9qkFPABWz88juQ2Wc+6hY9RAXdBevq45FBmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: zswap: mark the zswap shrinker SHRINKER_NONSLAB
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:35=E2=80=AFPM Qinyun Tan <qinyuntan@linux.alibaba.=
com> wrote:
>
> With kmem accounting disabled (cgroup.memory=3Dnokmem), memcg reclaim
> never invokes the zswap shrinker: a cgroup under memory pressure does
> not write back its own zswapped pages to make room; they are only
> written back by global reclaim or once the global pool limit kicks in.
>
> The zswap shrinker is registered memcg-aware but without
> SHRINKER_NONSLAB, so under nokmem it is treated as a slab shrinker:
> before commit 03375203e1da ("mm: do not allocate shrinker info with
> cgroup.memory=3Dnokmem") it was skipped by the !memcg_kmem_online()
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
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@lin=
ux.alibaba.com/
>
> Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
> Suggested-by: Michal Koutn=C3=BD <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Acked-by: Nhat Pham <nphamcs@gmail.com>
