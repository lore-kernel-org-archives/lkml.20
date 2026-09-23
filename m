Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116F541BA62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183732; cv=none; b=BAJL3QM+Ptk9pClORH0J3thq57IXYXZl3Ek2ZuK/Xutv3czOrhOmYhjL5OvWQq1560AG6QkjAa7VmvU1NV7WQMZ3bODg4LX00+WFJ7ccQNA1dyaA87omrc+BwdP9wfy1YRuiAoPiHqJqdAoxj7noj4/z8Bj+ASHgKYDLF01oBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183732; c=relaxed/simple;
	bh=EtOSZieVqck/qf7QjhpRBraqaoUIyhy0x35464xd6nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFphYUy/MdmaP2Vyymn/D/M/vNkhUwU9i0k6lNOMSz1B0X9plsKy9GlWb59cX/GPYM44BXXwA5fKduV0W7k+QD7cS7lgvViPWeuYw9Tk3zAxvtqbSnc9YH5RDclurxGkTf4ntwPlrz9Q2iT24vhC+vAIu9Nv9hwNlYJcrfLgRNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=CXHsW9bB; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="CXHsW9bB"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1034471d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790183720; x=1790788520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNQHNSKZkECfWRp+ScI6OE+kyYlP/vtiU1JMeWIOhRQ=;
        b=CXHsW9bBS9FfoisRaZk83bfh0DxRf7G6KKCj0xKkgx9VjcJGglbB8Gj8UuD655805R
         7GM2sHTBfD+1+5BGqA6+8QJP7bKM9HwxpansBx8D2T/qoFRnLV8uJswbXemJ1021Eruu
         R1xpIRSZL6pZN+45k/v0R7Ze0CGMPgVvPYKaDpR3EIussj2rqSb90BCzCFOn5NJTGzQC
         ferybH2PpXXA89C34MJd+PBG7UakecWBiTjyRVQqSzWNRmwE+kN1rM8iuyz8tT64oW75
         L7/FlCP2x2OqX9iq+KNE69WDHHJId6dZNdJb1OfRRwF/w6Ux0TeG9b6viExn1EiZTAvd
         VhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183720; x=1790788520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNQHNSKZkECfWRp+ScI6OE+kyYlP/vtiU1JMeWIOhRQ=;
        b=1ls3N/j7bQ1SbRggVxPfy5DfVRurY0sqpLpgtIFXJsQsb9m8Z37mAjvE0NYkuZV6nr
         mvM6L5QXd7mlf06cHJanDOXCiD/UzNYyq6sozeto2wVFTSQuAPEzmSNN515DgUfrE5J7
         RToQhgCdZbKDk2E7NA7z8qIvBDHtpDxadwBAzMv/wOIUCVpcqrVXKtCD7OsQj+OWDESW
         o1DU6MbIiv05HvS0tehjJ0SH2bwcRzmRmYvIJnJ0pg24hyQCTEJ8nCNyqjZ1vQYvaQBI
         stDamZV9f7n7YaCrjqkL6uCUu5cL/kgcX2xYPSBBW72jP45Lqph0u+qftjCZp5wWfSY0
         S5Jg==
X-Forwarded-Encrypted: i=1; AKwUvByBiXc2wEB0thIjd/MMRBvYPm6z3KL/xSHQCgi+NXrPdX/5kYiPPWQOTmM0zEAjqDtQi2lWeHXoJakKWF4=@vger.kernel.org
X-Gm-Message-State: AFuF++kCtWLQ02SwDycEbUzSxHT1YRS/t/y++CKaoxvHvtS0fNggnQVZ
	GkwuryTJELOdZUZiGWL4DcgYwdZUOYylTrhfnX/QGS2gBJAekTDZiQ3T71f0ZkgCq1s=
X-Gm-Gg: AYBFou3w6/jf2VVMb454Gnra1eyamFc5byPtB5Pqfth8Rb9GBmNDV9HwEUytUWy6mTu
	BEozvfLMv8Bz9Rg2rV4XmyOACbwLgnbOU+Q6peRIcRy4qAlac28X3C92gHNsVGYvric4gMRzAlT
	LN2z9AV6syNsdj2ggmup74qicDlIBvdaDQWBBb2k+CDfdGsHBrAIYJrXLlvZPqISmO9ZlMoUZME
	0LPTCVPevuKFFQAx9367GfXmUb+FfQHFfTxtlFbk0cX75q/7po1F+F31y4RovoArwwzIcWbzq4e
	ImqL6T9bGShjiy479QtViEUreR572QsLRwkstJEDLmj/1CF7Sv9JCaJKrlYadhoaz0zeoVLvadQ
	0NaF/PxLBR29muWTduIlxGKDVyBM/anaimB8Dtz3iV0kythTFXwWddnHySG6oXhtBtHJXXCxvYP
	Now0iH3MfLdnPFQvsMr+my6Z1n7qtr94wzRy8fpwiXLror01ppbXmQEdU7sF6sI1obnhB5IQ==
X-Received: by 2002:a05:690e:d51:b0:671:2519:a915 with SMTP id 956f58d0204a3-672d57b43bfmr1318283d50.59.1790183719867;
        Wed, 23 Sep 2026 10:15:19 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c482cb4sm24670056d6.49.2026.09.23.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:15:18 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:15:14 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Youngjun Park <her0gyugyu@gmail.com>
Cc: Youngjun Park <youngjun.park@lge.com>, akpm@linux-foundation.org,
	chrisl@kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, shikemeng@huaweicloud.com,
	baoquan.he@linux.dev, baohua@kernel.org, yosry@kernel.org,
	joshua.hahnjy@gmail.com, taejoon.song@lge.com, lianux.mm@gmail.com
Subject: Re: [RFC PATCH v11 0/4] mm/swap: priority-based swap tiers with
 per-cgroup selection
Message-ID: <arQJIjzE0BlUg0CV@cmpxchg.org>
References: <20260916183437.2946306-1-youngjun.park@lge.com>
 <20260916200434.GA5784@cmpxchg.org>
 <arAHu_BD5oqpZJER@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arAHu_BD5oqpZJER@gmail.com>

On Mon, Sep 21, 2026 at 01:20:11AM +0900, Youngjun Park wrote:
> On 2026-09-16 16:04, Johannes Weiner wrote:
> > On Thu, Sep 17, 2026 at 03:34:33AM +0900, Youngjun Park wrote:
> > > Per-cgroup swap in debugfs
> > > ==========================
> > > 
> > > Patches 3 and 4 let a memory cgroup choose its tiers through debugfs.
> > > 
> > >   # swapon -p 100 /dev/nvme0n1p2
> > >   # swapon -p 50 /dev/sdb2
> > >   # cat /sys/kernel/debug/swap/tiers
> > >   Idx   Prio
> > >   0     100
> > >   1     50
> > >   # echo "/batch 0x2" > /sys/kernel/debug/swap/memcg_tiers
> > > 
> > > Bit i of the mask is tier i, so /batch swaps only to sdb2. A tier keeps
> > > its index for its lifetime, so the mask keeps selecting the same tier
> > > across swapon and swapoff.
> >
> 
> Hello Johannes,
> 
> Sorry for the late reply on a good suggestion :)

No worries, and same ^_^

> > Can the cgroup be given a priority limit? That would have pretty
> > obvious inheritance semantics:
> > root
> > `- batch (memory.swap.prio.max = 20)
> >    `- task (memory.swap.prio.max = max)
> >    `- logs (memory.swap.prio.max = 10)
> > `- interactive (memory.swap.prio.max = max)
> >    `- task (memory.swap.prio.max)
> 
> Right, the inheritance is clear and easy to understand, and with this I
> can pre-define the limit without knowing the mask value.
>
> But first, let me check the intent. Is the point that capping batch keeps
> it from taking the faster tiers, so they are left for interactive?

Yes, basically, that's what I tried to express. Interactive has access
to all available capacity. Batch only has access to lower tiers.

> If so, that matches our use case. Latency sensitive workloads get the
> fast tiers, non-latency sensitive ones get the slow tiers. But...
> 
> Even then, the reverse cannot be expressed. A cap only cuts from the top,
> so a latency sensitive workload given max can still fall back to the slow
> tiers once the fast ones fill up. For example,
> 
>   tier0  tier1  tier2  tier3
>     0     10     20     30
> 
> there is no way to say "use tier0 and tier1, but never fall back to tier2
> or tier3". To cover that, the interface would also need a min value, or
> some way to express a range.

Correct, this isn't covered by the above.

> And even a range is not enough. Excluding only tier2 leaves a hole in the
> middle, which no min/max pair can express. That needs per-tier selection,
> which is what the mask,  and what I'd carry over to the memcg
> interface later (Currently memcg.swap.tiers.max).
> 
> How do you think?

I think it could help to aggregate the usecases in the cover
letter. Your cover letter describes how it works, which is great, but
it would be good to understand better what the constraints are, how it
fits in with other existing control surface and broader usage models.

With the above, yes, you can restrict who gets access to the
privileged tiers top down, but not bottom up. Is that an issue? Keep
in mind the alternative is cutting privileged groups OFF from certain
available capacity. This seems somewhat counter-intuitive to me, and
doesn't reflect a clean privilege hierarchy anymore.

If you can think of a good usecase, memory.swap.prio.min would be
certainly a natural extension. But we should get the usecase laid out.

The requirement to punch holes is the one I can relate to least. Why
would a cgroup need access to good tiers and bad tiers, but skip the
middle ones?

This would seem less like tiering/hierarchy and more like flat
per-cgroup swap pools but with obstacles.

