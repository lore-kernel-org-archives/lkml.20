Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD515175A62
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921220; cv=none; b=lo7HjEAgmr1U2nAp7GyRdN8HgCTPMctsl3viMoByJOkY9JpWHJcsGdXCjO4WPsB+e/dYMrIlTgGiye5rDE1j12GhpVJqwJXD+mPgJTCHkIfcs/3rMmdrw6PD8Lw+RVzuwFwLqiMdd/2B5E+r2h4KbMFkHr+ypIac2X79EE5oAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921220; c=relaxed/simple;
	bh=vy+mJB3Db1v2pbkJ/M2R+/MB10DPkK/0qsLGoEZF3PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8mIb/aRwqIPB0kR0fQT3I439cQUCR4jmUKa3c6mg60aP3hWDTH5/9hK11/uMciv0tnwK+fxsg6V6qAle5OWCmK7IBHV3rStGhK/Jv6hNO+QfPMtNxVEx11UvU9dcqU61dyzWa+prjLfrIbUvB91Oa96qq6G16nV9/aZ7EmzMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXAyp8Wl; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXAyp8Wl"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c6so1929833b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921218; x=1790526018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ua2PeUg5BEcfgC5FSR37S5o47FCdmEaQbiS+1Z8zlCM=;
        b=lXAyp8WltKlGTIsJAv1F3x1AL7PZnHFlSXPh99tXia+Lu0HzLjJUCr7c4P+Fy1161k
         Lyb9GwK3Lee3/ExKc3lXuS4QOPxxnOHD6LDhASyXRQXFZllUl9hcgomU6yDBcVV8Bzku
         5EVP/8IkdoIuZcqdfTVr1OdDzz5PQPf1ToNuyf4ec0QwKhb9MMpm+8DO3Pfn71shbeMn
         fXfKgPrirXCxtBCB17LoKDpLuS8RnWfPlqe1jOAtK7m3f9F3eqzsFZevtTnlsU2BXsOu
         X3sMCdvOWG71TX9wPX4wmx3I+d3nPmPdmboDuN6urAfB5+AriVHkcTq1GFIO7rnjXzmm
         zXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921218; x=1790526018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ua2PeUg5BEcfgC5FSR37S5o47FCdmEaQbiS+1Z8zlCM=;
        b=hvWtU8c6kOFc02dIO4pvnYC7Cc+TvDdjLWqbBy6kgWhLuB1YCEtis9RS2g5ye2aOqr
         9X9hHI/3ka0CL9C57M91P4V3c4+cgCfRjkMadtbpraW5p5G6OzBxKWzhA3c9pYdgv3c+
         6DSQ9yYf89iz27NV5a6axTJ+pQr1f4MGHef40LfENZ8LIgw/zHFA4hk3IwYaFT7qlaSv
         uQ6gD3+ev+LNmlh5l7nRiY8rrYYWTbya6E5WDp0UVKXIP5PGW3AAru070wu/pHDqbuGT
         LJxLpsChU1ttmvkQUB+A5jHPvbvytbtTpzpiBJTpDzAWLhu+1gVRBd4ztcxKi5Gm3BEb
         UuvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwO7zRI3NbMSu/hMjmtq3roM9et0VpRBbpjR43t32bOKHqhVfuZTa22MfWPee48BYwLJiN80zwN+wB+zI=@vger.kernel.org
X-Gm-Message-State: AFuF++l18g9EefXRUYHpbAVWYofUlln2iK9DWvwSpvqCmxrP4xMAYUPm
	BVmaOtLmNWWTx51ActiKOQs3DTEYl2CYvVXg/wUApXuWHdeGvmFEgzRt
X-Gm-Gg: AYBFou0bTqWdlBmk6Q1JsbN7X0OIDbGFG4hHhMWQ3IOPAHxlFzCQsWF604aRdx8Xuq3
	eigMr6d/vt0afelo6sjkXRO6Uw/ptU9pnqcfXxp9qlZyVioM9xIbSkx0M5PICJlstZHJtIwWfBn
	YKfRa69ugPILXd+vVJhFCRIDS8NLd250wTqw21PnBAzJeD9pFosORoRvR6uFHRUS0NMUJmVDSNh
	btbhZRnMIC7rQsyuGu8dnePRtKOgmC8oy1yiqqv387+aHwlsvsQd+zUrDme9EtdrQ7UT50liMbs
	WotlREmOIiUoutkf82DfBBPiC6pHoyC/kYqf606mzgOwgLS2PHKNyAx9QS9Ohoh6FF09a0ARCa+
	m4518MJa1FxokjfiaQ8n8QkJA1JjXGV986J9zWVTmBlgEwBVP4XcCX6tCVXSzOhgWCtxbfqFoBy
	KUG9wULzkfvyrKj8vJo3Nd2oDYu3nFOhEdfbWqNh0elx02+PAXaX5NEufeVa+DZjDivVowvJd/0
	8H8LZwYynKTc4kPu/zDsjO/316zRvgsHtIS+F2f5wk=
X-Received: by 2002:a05:6a00:ad89:b0:857:726d:2e99 with SMTP id d2e1a72fcca58-874dd7f8d8cmr12002193b3a.22.1789921218131;
        Sun, 20 Sep 2026 09:20:18 -0700 (PDT)
Received: from gmail.com ([220.85.166.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa1099e5sm2093196b3a.49.2026.09.20.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 09:20:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 01:20:11 +0900
From: Youngjun Park <her0gyugyu@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Youngjun Park <youngjun.park@lge.com>, akpm@linux-foundation.org,
	chrisl@kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, shikemeng@huaweicloud.com,
	baoquan.he@linux.dev, baohua@kernel.org, yosry@kernel.org,
	joshua.hahnjy@gmail.com, taejoon.song@lge.com, lianux.mm@gmail.com
Subject: Re: [RFC PATCH v11 0/4] mm/swap: priority-based swap tiers with
 per-cgroup selection
Message-ID: <arAHu_BD5oqpZJER@gmail.com>
References: <20260916183437.2946306-1-youngjun.park@lge.com>
 <20260916200434.GA5784@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916200434.GA5784@cmpxchg.org>

On 2026-09-16 16:04, Johannes Weiner wrote:
> On Thu, Sep 17, 2026 at 03:34:33AM +0900, Youngjun Park wrote:
> > Per-cgroup swap in debugfs
> > ==========================
> > 
> > Patches 3 and 4 let a memory cgroup choose its tiers through debugfs.
> > 
> >   # swapon -p 100 /dev/nvme0n1p2
> >   # swapon -p 50 /dev/sdb2
> >   # cat /sys/kernel/debug/swap/tiers
> >   Idx   Prio
> >   0     100
> >   1     50
> >   # echo "/batch 0x2" > /sys/kernel/debug/swap/memcg_tiers
> > 
> > Bit i of the mask is tier i, so /batch swaps only to sdb2. A tier keeps
> > its index for its lifetime, so the mask keeps selecting the same tier
> > across swapon and swapoff.
>

Hello Johannes,

Sorry for the late reply on a good suggestion :)

> Can the cgroup be given a priority limit? That would have pretty
> obvious inheritance semantics:
> root
> `- batch (memory.swap.prio.max = 20)
>    `- task (memory.swap.prio.max = max)
>    `- logs (memory.swap.prio.max = 10)
> `- interactive (memory.swap.prio.max = max)
>    `- task (memory.swap.prio.max)

Right, the inheritance is clear and easy to understand, and with this I
can pre-define the limit without knowing the mask value.

But first, let me check the intent. Is the point that capping batch keeps
it from taking the faster tiers, so they are left for interactive?

If so, that matches our use case. Latency sensitive workloads get the
fast tiers, non-latency sensitive ones get the slow tiers. But...

Even then, the reverse cannot be expressed. A cap only cuts from the top,
so a latency sensitive workload given max can still fall back to the slow
tiers once the fast ones fill up. For example,

  tier0  tier1  tier2  tier3
    0     10     20     30

there is no way to say "use tier0 and tier1, but never fall back to tier2
or tier3". To cover that, the interface would also need a min value, or
some way to express a range.

And even a range is not enough. Excluding only tier2 leaves a hole in the
middle, which no min/max pair can express. That needs per-tier selection,
which is what the mask,  and what I'd carry over to the memcg
interface later (Currently memcg.swap.tiers.max).

How do you think?

Thanks!
Youngjun Park
