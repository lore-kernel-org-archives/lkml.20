Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF247DF98
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548759; cv=none; b=akkOQABupWSsnWowVYdTLjKn+ZwX2vk+3V32w0qAKVaBEZqSm86tFdJ6rUNNFVHfMLEOPgCCoVpsBzFOvW34Bf0St0qHKVuTmGxOBs62TqjPc9N6qPB0wiURDTyPsPXUzZHf0PTb+E4toZlOG1FI2XgLhovNv1s+pa/PpLcg8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548759; c=relaxed/simple;
	bh=jQe43yJCJSdBQPYhkUb4CHVlXYabrmzIiAW+OtPpy4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkurGn3xUEUFqm6vH2g4thLvP4Hp3+vAxIQ/+Plp+UL27qH+zBonHc3egA4fnwszGDzq6y7cjnCvVlqAWeyw5CgH5RzOpEaV5x/MgsD/60o2QYW/n3aItju9phAy+qHYv1HKguNBaSRetabQfDUn3hcy93RQnOyM5SrVhNqPzKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fEqDAcyK; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fEqDAcyK"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso111838666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789548742; x=1790153542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2LBbelDPdAVQ0Ns+BBW49QmFOaM2BGUlkuMpM25cdq0=;
        b=fEqDAcyKNp+DJ1SwWiq1SfYEyZRUgBbvXAUy6MDKVrcwjAIHREkhioM+ZQCirDQ4cc
         EttlU3c2HkkbbYmFFp/uoqam1pLAKWbJhLDfnagViBSzT/WPOECIbhfWgmRgiXOQ94A5
         NMJebi+kxBCWrfibB/+VSa0l+HkSpQ1m+HilG4QUz54rYaZ+XvY7Zni0Mcyv/Nr+gtXL
         o7G1Esip5+5FD4/02R95+w/Rz3o0vlb3/5Gx8l6HWP4nOi4Wn4+zApWl1dUv8wuS4h6z
         d22Cy6QopW/s7q6LcFpXqDqV0zfEHQLupfKVLuQ0IdwWWZ9r3g/4X0DtaadnCEPLmdAm
         p1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548742; x=1790153542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LBbelDPdAVQ0Ns+BBW49QmFOaM2BGUlkuMpM25cdq0=;
        b=CSKKRoYxI6fxNHx8JTEzw7yEvViMMymlrNfCF7NHdK0HwV1LVNiK/syrDrTESepiYV
         iPZMpraxNaEFO2c2ccvnpD+aHLdMD8Qj45/gWZuVYurqYPrSEivfd3Vlx6rI+3rkmsS3
         F0kUuYMaFyPoSBov7P0cjIN+/VxxoB7N4+U5pE+nI8QIeTu8yCosbaIDjRTE9dgdT3fP
         XQi8e09xTkHpfffmuYXrLkeJv9ZA/59vmkK3pO+dBxvFilb/Yp/QIX+ImPe6Ix3kquqG
         okjAJKxbu17SOMjU9K9P+16D0eOReZsHbChHGGh7aw+lyK40hS+lWFGOWgWY5Fvdn0Nz
         kVtw==
X-Forwarded-Encrypted: i=1; AKwUvBx6o8h6MrgvY1OSB+3g7UpO/CQ6clKRDaZpf2S4E8UtXTKGjWY/UZgFACmAWe79GI31BPltGNoULP3gbqo=@vger.kernel.org
X-Gm-Message-State: AFuF++l7SJLzM2kPjNAen1zea3E0nCuomHMM+4HgSDxdQQOyWCdmKldK
	bMB5BPi2fbF1Dp7Pf892CChCAKZrP+k45dPvIWhmDLX2wQzYUKlRguwRmeMpcU25FMw=
X-Gm-Gg: AYBFou2N2I7yx1TmxrGrke9T61p4ENrF4DZWROvumJEDYuJO+ks40q4MD3fiBCHm26h
	psAojkX6n5eOiIaoAilUoZdRY5OfgqixIpjdeU30ygSMi1HyY+Bzi8MBwu+uNONA9NShaHiA/K5
	PsbjkIKHDZ07NknKbo1q+KPNY7jScK/HWTBiogoZKnKryG2uBW46zYa4UsKGk1DenOr2Gby1Iaj
	HVn5kyvvcZg2FbrS7uOR+Cwfymzl5TLv240wlVFrYq9s31reLP0JrVEFo8CgxwjqthfLnE1SweA
	b5Oat4AqMZBFkLb3i43sJUFm5SOO88uYB4xY9VMsQcSC/lfJCpLYrgIc05On1XKs5VAluMIbSd1
	/HNF7piiH1tjC1i6Ni/1WV4OpJfmkOwMe1xct9mdV++QNVeIm5PbL9EWnGLqDeRH7jqzvSbA0vf
	7ms4GDYb6szfNY04QBlCoid2mgS0vqRsD+cMFatSRYIil427SO+oRAdWFxjWMy
X-Received: by 2002:a17:907:928a:b0:c29:4d81:c5f0 with SMTP id a640c23a62f3a-c29e51b1ad7mr218786066b.6.1789548741687;
        Wed, 16 Sep 2026 01:52:21 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fafdsm93069566b.63.2026.09.16.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:52:21 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:52:20 +0200
From: Michal Hocko <mhocko@suse.com>
To: Kyle Meyer <kyle.meyer@hpe.com>
Cc: akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com,
	linmiaohe@huawei.com, shuah@kernel.org, tony.luck@intel.com,
	jane.chu@oracle.com, jiaqiyan@google.com, Liam.Howlett@oracle.com,
	bp@alien8.de, hannes@cmpxchg.org, jack@suse.cz,
	joel.granados@kernel.org, laoar.shao@gmail.com,
	lorenzo.stoakes@oracle.com, mclapinski@google.com,
	nao.horiguchi@gmail.com, osalvador@suse.de,
	rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
	shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqpYxAktjexhaMGc@tiehlicka>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
 <aqmGd0GGUCkbZpkZ@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqmGd0GGUCkbZpkZ@hpe.com>

On Tue 15-09-26 12:55:03, Kyle Meyer wrote:
> On Tue, Sep 15, 2026 at 10:31:42AM +0200, Michal Hocko wrote:
> > On Mon 14-09-26 18:49:38, Kyle Meyer wrote:
> > > Soft offlining a HugeTLB page dissolves it, permanently reducing the
> > > HugeTLB page pool. This can be problematic for workloads that depend on
> > > a fixed number of HugeTLB pages.
> > > 
> > > Currently, soft offline must be disabled to prevent HugeTLB pages from
> > > being soft offlined.
> > > 
> > > This patch allows soft offline to be disabled for HugeTLB pages while
> > > remaining enabled for non-HugeTLB pages.
> > > 
> > > Commit 56374430c5dfc ("mm/memory-failure: userspace controls
> > > soft-offlining pages") introduced the following sysctl interface to
> > > control soft offline:
> > > 
> > > /proc/sys/vm/enable_soft_offline
> > > 
> > > The interface does not distinguish between page types:
> > > 
> > >     0 - Soft offline is disabled
> > >     1 - Soft offline is enabled
> > > 
> > > Convert enable_soft_offline to a bitmask and support disabling soft
> > > offline for HugeTLB pages:
> > > 
> > > Bits:
> > > 
> > >     0 - Enable soft offline
> > >     1 - Disable soft offline for HugeTLB pages
> > > 
> > > Supported values:
> > > 
> > >     0 - Soft offline is disabled
> > >     1 - Soft offline is enabled
> > >     3 - Soft offline is enabled (disabled for HugeTLB pages)
> > > 
> > > Existing behavior is preserved.
> > > 
> > > Update documentation and HugeTLB soft offline selftests.
> > 
> > This is adding a lot of user interfaces to control something you can
> > disable by config option for an admin only functionality.
> 
> I may be missing it, but I'm not aware of a config option that disables soft
> offline specifically for HugeTLB pages.

No, there is none. And IMHO there shouldn't be any. We do not want
config nor runtime option for any random type of page to be soft
offlined. You can disable the whole feature. If we need to enforce a
boot time parameter then I can be convinced about usefulness because
distro kernels need to enable config to be generally available but there
are usecases where this might be better disabled during runtime.

> > I fail to to see any actual justification for all of that. If an admin
> > can disolve a hugetlb page it has power to allocate a new one as well.
> 
> Allocating HugeTLB pages after boot is not guaranteed.

yes, and so what?

> > Not to menation that the whole soft offlining is mostly a testing
> > feature so adding a lot of fine grained configuration space seems
> > excessive to me.
> 
> Can you elaborate on "mostly a testing feature"? For example, how does that
> apply to the BIOS/GHES path discussed here?
> 
> https://lore.kernel.org/all/aMkOCmGBhZKhKPrI@hpe.com

OK, so apparently there are some BIOSes which abuse this feature to
mimic a real HW poisoning. This doesn't change the overall picture
though

> If you think this should be handled differently, I'm open to suggestions.

Yes, do not treat hugetlb pages any special. In case there is a HW
related problem which decides to offline portion of the hugetlb page
then bad for you. It wouldn't be too much different if this was handled
through a real HW poisoning.
-- 
Michal Hocko
SUSE Labs
