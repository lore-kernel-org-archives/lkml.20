Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949574AA01A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439974; cv=none; b=XuQFEl64Pv0QTSxD9mLmG1n3vD7J0AHdOFg6zafQmR5F2pra7mOolz9pom9e2BKSVL6KYYnbZ4ts7nHs2Q5UokYGWEYeC2qyYph4G71xq+3kVgPbUenWU+Lex/MquIQiYSSRHoEaxygX2JLxn55NqLO6ylw7X1PVl4XM0LF7BtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439974; c=relaxed/simple;
	bh=kl+JHwTf7CdX1B+DoxtS4WWX7ZtHIg9LoLTAjy8UQXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1KtAmymtrPclM5cN9PAxT6Zt5ArfIGFzQVwuBRTVCAU5GK9we4Qe+4X/eWulJIaxwiv6lBpW9DBpWxmzbz4lUl5JiQ1BAtv/5g/zwo3Lve30ni4P0Hmau4AR7v353Erowvm29OWO1+jSOT3YfUTPHW9ZYx9b96Z1Jm4/d8E+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YyN4+jkl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YyN4+jkl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so18677725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788439971; x=1789044771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/BVphZoQ/SK9hU1QtOXRTarKJyoDJy/tE9xK1PMEI4=;
        b=YyN4+jklbOszetvEv2rC/6mDWRgGNOvH5aVbKmD0eQV+owKSY6HOZ1woOxwRzpSeuo
         nPRm3DehfJWKkvGz6LkrszzL+tSxMvykvcNNCz+KuJlUpo6sQGupM2qR+DCF7xAkIOZP
         kPXTCn8brzzl7eR8LTfif6ge7vVIGIvyDtF3Z8StqjcZRlyBu3sxz9KY1gBCUsIJyUvV
         9LphLBRkq0g4vrZA+NX8zghdRjuMiU8AZSzDSjUkQubTehMUKW8+qPzwA4X70rJVvxMD
         +dur4Yara1pQtKK+GnerPwldV0yYhIuer6/+XRruxsNclPUNOXK0/ZYk75FOM2UsUfh6
         udRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439971; x=1789044771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/BVphZoQ/SK9hU1QtOXRTarKJyoDJy/tE9xK1PMEI4=;
        b=DzNTgFqrXGD9xuJ4zgqv5Rzuf3x6LhIa7iWL0vXbcJTwF2Olpk2LcC3tWzEdg6+qDF
         C13Ok3nM5rF3nKhOpStEgwo2i+YyHXwOZoVOA3mVNa+8OEfZ8VJA62qpDjt2rDHLy9ak
         jQyq1noV8mFtWVrLLuMtBfUltZYMEtqtjfpvf+GX+urezL1tbuJ3BEeby4HeqjgHsSES
         ZgYhXVrFj8Szf24MBWZ43ZseGBQlkhy4tc/DC0Ob1vCyHynA8yAeTGKSU8uIgfJX4Wc2
         1patczLILC2NIkUKL2wg/VmTDQqUXJ+Fy56z+4l8hcCa/DGNTNKUIyzEyFMreFhCBvFh
         EsFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQWrEdsQNggNyIClaBQCV1LxuLe+zd/ORnjMaK0OOR/uyQGKazFryx78sksYKisk/Mg0JMsdZ9HWvtdCY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2sW1LwUAWvzBxE0/xE37FByuxZ9LUFqxMCJhwBwOcdQ/U4a3X
	eiOkkkzlREPLvtZX/3m5vumBWgOEkQVDnh8lId0joE9kgkVadJVG2fZqARqI1mPhIDI=
X-Gm-Gg: AYBFou2mU8N/D6jaovZmkHe70lvVYsmNjaj6jPrTYaxJTIRkTc63b7HcRFMPY3NKmOR
	Rf7hwMVFLxl9+/U2CG7J1FVj8EZu/u3po7R+yqWtUReeq6fXd6Lg2YleFGJb0GvK8XWAIbCjPxZ
	I02wro446ANI9oBEcTq4DOYIvTPwya1KMU2327DLf9Sc3QNXKohLA4zI4d3tSoVJUX7gxx3h/rD
	OJr5mVypoqxdG2wlYTJIy8mHlmwC95qc5asvj7A/aOK89m/DUcnaiPh/DKvHvsDVoWZyj6L9/gP
	rWXCMw32hkyE/EZynyi2rYbsis10vtTFJ2bS5MnEzW16Pa2DtKvtygvVGq+3Z2CeolMHNNC3vUZ
	pQeXrAqfnccoyR1HSptQww5aLxUTOUZZnIDNs5Oc3UTCUaM/30k5pM1EB9913k5SNX1GIcWcOS0
	e3TPYQShBwR84VhkuNO5XGDLTYFqUwj6gNz05cPJAXPdRaqviTTFzEpVYuPGpofhh4pOaZBESwk
	Or9nNauobTR
X-Received: by 2002:a05:600c:c4a6:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49ce581142cmr250223635e9.8.1788439970781;
        Thu, 03 Sep 2026 05:52:50 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d6029sm71680715e9.6.2026.09.03.05.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:52:50 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:52:49 +0200
From: Michal Hocko <mhocko@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nimrod Oren <noren@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <apltoauHn-l--8nI@tiehlicka>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902162323.GO3004@cmpxchg.org>

On Wed 02-09-26 12:23:23, Johannes Weiner wrote:
> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
> > When THP is enabled, set_recommended_min_free_kbytes() may raise
> > min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> > Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> > heuristic to help keep pageblocks free and reduce fragmentation for THP
> > allocations.
> > 
> > The recommendation scales poorly with larger base page sizes. With the
> > default arm64 pageblock sizes, the contribution per eligible zone
> > before applying the existing cap of 5% of low memory is:
> > 
> >   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> > 
> > Even with that cap, min_free_kbytes can reach excessive levels.
> > 
> > The automatic min_free_kbytes increase predates proactive compaction
> > and many subsequent changes to compaction. Given those changes,
> > increasing min_free_kbytes for THP by default is no longer clearly
> > justified.
> > 
> > Remove set_recommended_min_free_kbytes() and all associated
> > recalculation paths. With this policy gone, min_free_kbytes is
> > controlled only by the page allocator's default calculation and the
> > vm.min_free_kbytes sysctl. Users who want additional headroom may set a
> > higher value via that sysctl.
> > 
> > Link: https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
> > Suggested-by: Michal Hocko <mhocko@suse.com>
> > Signed-off-by: Nimrod Oren <noren@nvidia.com>
> 
> Just to summarize my take from the subthread with Zi: the premise of
> this patch is to roll the regression dice on every THP setup out there
> because certain ARM configurations result in a questionable pageblock size.
> 
> I'm not against carefully evaluating and testing out today's need for
> set_recommended_min_free_kbytes() in real world examples. But this is
> not that.

I do hear your concerns Johannes. They are valid but I am not really
sure wht kind of testing would prove such a change to be safe.
 
> Nacked-by: Johannes Weiner <hannes@cmpxchg.org>

-- 
Michal Hocko
SUSE Labs
