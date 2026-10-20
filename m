Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528560;
	b=CURHo9PUZOujv5VaFYPy3egVytALCZeGWS6a1YWNOheVYOmXgyE/KNPsL245QYhsu/ij
	 3C0OXCEZlKFP2N1AAVMk24wu0RP4SqabD6LQpcl6ZoohDGPjJ2J5DPvmG6UvV4XyPOCTQ
	 P50YODfAsaRmfQ7ZR3KNYLXnpOAAp6sz0rRDIjK8GxRIRIHBmHQ8Mpv3aQYyVBp8R+TGd
	 PiO/9tPokZiRZkp2P6JT1mcLfTcOXXz9r6WYHSchb0tWvT7bzVH1n5QVtuS497csnDqVC
	 eHjo0XH5IfgE1jS5Am0hLFGgcnaVPFU6D0X0EovHTxf4qBFDkwsRp5ViGL0Sdo3/X/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=njlJ33l5OqoDckYqSYGuylmOTQxiBjEh77NJyjCPwxM=;
	b=L5ssjYIYTL/+84VlScvERs14/9y7kdzab2ZNmeB1rqG9bf71Q3MWd6BQewc9e95ZqQNz
	 hprsDHeheIWlmm8sKQMG0Cg3wuJvsW2vcBC4VGQDTaYVMDRQtaD4MrUtAMGkYFyV2lr5K
	 E15F6qYzoRqE9EteBBh350D3lpRReK9tKiTXqyr6oY9J3BF6s4vacjglPei6Mae2zUYYK
	 8DALeS99mdLIA7s1GOWmJw11oSpHc9AcyApZaMjsGiLhXap0ZLctJVE6IXqPboZCoeHcB
	 z5uX9dL11eiwdLVq3LHnNGa8iER5OFehPM33WITF54ADhxANOPtrDPVYg3OgDLJd5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=StuxCrmy;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=StuxCrmy
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso5535f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792528558; x=1793133358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njlJ33l5OqoDckYqSYGuylmOTQxiBjEh77NJyjCPwxM=;
        b=StuxCrmyILzFrEACw0ZRhYnkF6RJryUVmNsu9DeO5A58HPNS1DMQ3gp5FuCExjU3zm
         cBNrOt0VT0QRNzvzGqBIiFVMpHrN8+C7Sq9ZimYrLXlruuAKA/KeLFflhi+AcKpiF/Dy
         cZUnmdlctUR+0mLvkbSs5PxxYpx3AzmqmvImRaontZ1qI+1jkoXXar5dqDZoH8NRpXFj
         qAZJT7paCzlc0GVtfBolg3Qrcyymi0M9EQzZVv/9WxF3mJa5E8xJHO1jf7AX354Js2Wb
         o7hqb/LNCeqhVYumUwc2+C160Ar94zOGikM9+QE4xDCSeVGDgBVjsQKI7HIgDCH3onMJ
         HXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528558; x=1793133358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njlJ33l5OqoDckYqSYGuylmOTQxiBjEh77NJyjCPwxM=;
        b=dM65CgNTwwe9VBHsMbYjRcgwNmePlpCQU4ddWO/n7GpKq48uQhzo2veaNwPfRhp2N3
         sMd7DRkoBR7wBLBwLSwUswbLo2lG40lWl/gbhAwocmpzk2t+ePRsdVEYWNH6hR+BAviB
         3Qq4ojbl4lcQQ0CboDgBwMsclSlBie7FWD7W0Y71XSLMtQ4RMrdmoLpNcyZPj1CctjSt
         5e7oxNdLnwNCQX5XtF/9JJD5rKnxDNbAeWmc+m3K6vVnA3ZJ/v5bFTKRtFrlgID55XBW
         a2T8CmU02jeasM/ehEy2Cl9Rc73HXViY/DdHfkCP7f5tk9mTJIeoPzxW3NaVnbJqU6Ee
         RFjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsBFidQFp2F4vkH28Sp6cPQAekZ7UScwL5N0s2V0dnPc/ldUCrincH/C1DP5bHNNKV/b93k3Tv4R77/1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCi+AVXNg+oZsS83f482xQtNVzintuQYVwvUMXfdiUF/sL+VMz
	UypLPVL3WeGPHPZHEsWZWPbxW1DYMTe/JKMRIw7LeyqJFknNofu1aBXMEvBSJiEwIgE=
X-Gm-Gg: AYBFou3PIEIevkCKtOCLubS8TOD8ZrC4FZjK2tG+imF4hO09npJNTn/h/R4pq5k6ZQE
	3Yrvdm0ygmc/NCNWcLCzp5m1R0/giRZU8/QzUsgrkiG27uRXg1xJovCSVFU0vRQcl3xv/ElyS6g
	aso3Q47qY7/sJGNjjDT6mX9cpjwF2MdGF0tluUrY/77pLBY3XxxLQ8BAw4nYmPkr5YqqdJ2FQjS
	xgGPlgV3t0mRAQD1WBAxhuBh1reMaeHCZDfvDNWHA45EveFXTEeMJAoA5adKCL4n2vTRZL3ySjI
	XDCNhBrVy7MLGEV8WULrfMTwKqEWfEr3jPgVybA/PYKfB5jv3L0WKw7981rFACx78v8jO0Dcmu5
	t6xgE9uKioCr4/hmaJopdkrZdcybT7uxHD7o3ibiXFZlAUDS3qmnzNM3XqobeCUlsZIOU8c/wWu
	zFZcowDDEt2Ntjq19elDP+odsnX0SdPYDzXgAFITov9KDNiW2ynuHHy+Vv8WBhq/bBhD88wymi8
	O76OKoXcYKuM6HgNt9i6kPeTxcQ9EJ6qhUt1rV2JjY+LBa8nEUK42Dy8imfPnKjDoxicw==
X-Received: by 2002:a05:6000:4805:b0:48e:10a7:40f with SMTP id ffacd0b85a97d-48e10a70508mr19393904f8f.17.1792528558447;
        Tue, 20 Oct 2026 13:35:58 -0700 (PDT)
Received: from localhost (109-81-30-107.rct.o2.cz. [109.81.30.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm788025f8f.24.2026.10.20.13.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:35:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:35:56 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, david@kernel.org,
	ljs@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <atfQrKh8AiKnvTRG@tiehlicka>
References: <20261019185002.3428594-1-gourry@gourry.net>
 <atcc-91WerBlJ_Q5@tiehlicka>
 <179252633386.238494.13826191476140121288.b4-reply@b4>
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
In-Reply-To: <179252633386.238494.13826191476140121288.b4-reply@b4>

On Tue 20-10-26 15:58:53, Gregory Price (Meta) wrote:
> On 2026-10-20 09:49 +0200, Michal Hocko wrote:
> > 
> > Would it make more sense to 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index f11491ee9ed5..e07db9514e59 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -7963,7 +7963,7 @@ int user_proactive_reclaim(char *buf,
> >  	int swappiness = -1;
> >  	char *old_buf, *start;
> >  	substring_t args[MAX_OPT_ARGS];
> > -	gfp_t gfp_mask = GFP_KERNEL;
> > +	gfp_t gfp_mask = GFP_HIGHUSER_MOVABLE;
> >  
> >  	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
> >  		return -EINVAL;
> > 
> > That would take care of try_to_free_mem_cgroup_pages too.
> 
> funny enough, try_to_free_mem_cgroup_pages does what my patch does:
> 
> struct scan_control sc = {
> 	.reclaim_idx = MAX_NR_ZONES - 1,
> 
> 
> now, whether the gfp_mask should be GFP_KERNEL, that's a different
> question i think.
> 
> (tl;dr i think my patch is still correct)

Ohh, right, I forgot that memcg reclaim always reclaims all zones.
Tweaking the mask seems more consistent but not something I will insist
on. Up to you which way to go. In any case

Acked-by: Michal Hocko <mhocko@suse.com>
-- 
Michal Hocko
SUSE Labs
