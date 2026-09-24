Received: from mail-yx2-f31.google.com (mail-yx2-f31.google.com [74.125.224.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E036728B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258899; cv=none; b=cPdxiAhdv8raZw+01sSPXmInhkgItfW/tvvDDTcIH7nnAf3dczaL9NPDfbcLR0Jmjqf0McvGuL3CxP7Lc2jJs+wHVDtn2NWgGkVhvHYxF6Qmwbq6R5sLeuZF6nYJZsNe+Z6CHiLaer28cIXdg4Lp61i5i3P9qhtyK9boo08QRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258899; c=relaxed/simple;
	bh=Zosx0/qtM2U93wY2yvl2h75cV7USyTkdpcN6VQSTV+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMHVoIgnASEueBLS/h6j/kNzNS/8XNr2b1LLZ2ze1MHavZgUxgEn0RueGda44z8B2OPlxTj69uvxZBDZ/l+S7DafKVT9CXMyiUizevppe2XsXCVeVZGauwq+ORR+K91UiSIv5nq80ymXBqWtSlOUhu6GuPA4bLTa5+LSXZ2voTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OwmX0wpK; arc=none smtp.client-ip=74.125.224.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OwmX0wpK"
Received: by mail-yx2-f31.google.com with SMTP id 00721157ae682-8659af7454eso33575627b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790258897; x=1790863697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfI1NR8Tep8AKRWcGdJ4Ave6RFunEN3KZDqYuNUnkYI=;
        b=OwmX0wpKIMrGOhySBo1IqYmpPYxZNf0k2COzcFGMy3G9pTBwcspZTzGNiI8D3WhQSb
         WnAgFCSqLFRPQwxhosIhcPCxFYmTGLaIWEl4CyLWRRPbN1uQuJuruNoY4P1//QJkrqwa
         48xn0hRL164exARZesHNyZYp1TbhvIHUJC3npErpx2O5LQ0dOCAlcHi2vyP2LEe/nXkn
         tvHPz/jYULdTCB2Vf+Z1Zrdzp3gB5LojnnDZTJDxllnUKXpFHu81F/ECOCu6KlhDjsvI
         wIjy+1HHV4nK8+bx2FDU8qt8TpPm84X6/QmVdhomL0GaHhTTZ4Zs0Kve8T437rdGGWeu
         zpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258897; x=1790863697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfI1NR8Tep8AKRWcGdJ4Ave6RFunEN3KZDqYuNUnkYI=;
        b=KLCSU6j86UEadpJeZjuPLFt1X8l1g8mw+G6hcm3KvlyUIi1d/cOdGiVUZ9JkIVVFWp
         N6C9wtNblY1onGy+aU8j5kWLSNeKahH/W6WmSHC0kcgM6nfeJtXUygNl9Zkk0CCvmIHH
         1DDiEqgP3jEgrQtw7bGhBesjHwN4SQjmjIPlvWW28hXaD1rMzYb8c8iBif0+DC+wol/P
         aBwuLnCy6PfVPYxvsMvDspDNmqJUCkjHg7cNROR48BBo/saHLqHT/xkgNClGJw5IbF2V
         7ceW4iJa6bNoKff71ijd7qbZIaCYk7CvC1Gsmo0vbGqDjfPsRefPd3YJIRtXeGxI8lcg
         MpAA==
X-Forwarded-Encrypted: i=1; AKwUvBwUHuRScswwxKXpjrTEpTfbQbmx/NfK6DrRhwv7kQipa2p5RFrQK/dd2XEUR6JorQYrphoxl2MQUvh/F5k=@vger.kernel.org
X-Gm-Message-State: AFuF++k0te6WZnMyY9mG6hp5M4Pkno2lBzxcwRlw8GnK5vGE+BYL97ZJ
	CLuz4Yj2Q0gvSVRjIUSpHHeIHRSHjfJGKk0D63kBFz82rMg1VbXR9Qqy6vDWmx1uZSE=
X-Gm-Gg: AYBFou1WAkrpaHqLQ4VpnC/28l8ZzmQ2FYiBP7eMtXYFB0H621C6/BP9zSZbI/HfVH4
	LT0Xq0Rhx3FK//Bcza4eS7kWFz6XhwPFPB36covmPU6OS045Z1i7r8vJX5O2Apw6IEzKr1xJdAa
	hvfZTsM/gluPzZAThmTPHGN4kAs9QT1Xx18TTcvahfbHGrmGibRlQbKnErgd0l2pTRgqxnJsfYg
	JPHFk7gy4WZ0xo2dM5ezde0R+RS2Q06ARDZFtWKUu4e3ET7R7+Npr+M6gKUAZwsPozX15L/xkiD
	EP9+Wd+Va5fv9HINgqEo8YhmJuWA956Q6BR4CD8xougs6v3cyIxGZFsKv7Q40GmbfO6N2InRx7u
	qwK/1lePvDJSLboRESD4USD/OeIvp0JOi5yV9NcG3L9IxYHkrLy5V90kA2THySBM0cu4G7e+s23
	W7gjrExivFqZObw0eL0C+CbCEZbKKE60D3SdnL84jKqjJ1mmnZFsU25ztjykXOSZZHsdYSnqEjg
	AAXsTl9kVarXCdAdmj4eRfxm488xmYnyUJeoPSE07QB5nmiDwr9EvmV
X-Received: by 2002:a05:690e:169e:b0:667:b503:4d2e with SMTP id 956f58d0204a3-672ed1d4e4bmr1602236d50.37.1790258897201;
        Thu, 24 Sep 2026 07:08:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e217944sm17455606d6.9.2026.09.24.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:08:16 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:08:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	hannes@cmpxchg.org, shy828301@gmail.com, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/7] mm: support promotion-only NUMA hinting scans
Message-ID: <arUum9WcKl8qF0UC@gourry-fedora-PF4VCD3F>
References: <20260922182928.2199090-1-gourry@gourry.net>
 <20260922182928.2199090-2-gourry@gourry.net>
 <8699eba1-21cd-420e-a992-51a90ba62b71@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8699eba1-21cd-420e-a992-51a90ba62b71@kernel.org>

On Thu, Sep 24, 2026 at 01:45:24PM +0200, David Hildenbrand (Arm) wrote:
> >  - Opting VMAs out of scanning because they became inactive obviously
> >    breaks tiering - because the intent is to identify when a VMA
> >    becomes active.  Applying it in tiering modes causes
> 
> Incomplete sentence.
>

oi

Applying it in tiering modes causes VMAs to become permanently stranded
on lower tiers.

> > 
> >  - Opting Read-only file VMAs out of scanning is just incorrect for
> >    tiering modes because its intent is to prevent bouncing between
> >    sockets (east-west), while tiering controls tier migration
> >    (north-south).  The result is hot read-only files can overload
> >    lower tier bandwidth.
> > 
> > Add MM_CP_PROT_NUMA_PROMO_ONLY and let task_numa_work() select the type
> > of walk. Build the change-protection flags there and pass them unchanged
> > through change_prot_numa() so its PTE/PMD paths use the same decision.
> > 
> > Have folio_can_map_prot_numa() derive the single-threaded private state at
> > the point of use instead of adding another precomputed boolean to the
> > protection-walk interface. This keeps the interface focused on scan intent
> > and avoids plumbing VMA-derived state beside cp_flags.
> > 
> > The tradeoff for the cleaner interface is an atomic mm_users read for each
> > folio, rather than once per PTE range. Check the promotion-only top-tier
> > exclusion bit first as a mild optimization.
> > 
> > The scan-intent interface is required by the following memory-tiering
> > fixes and must accompany them when backported.
> > 
> > Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
> > Cc: stable@vger.kernel.org
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Link: https://lore.kernel.org/r/4d2853c9-edf4-4685-b186-7214ed6abd84@kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> 
> LGTM
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
