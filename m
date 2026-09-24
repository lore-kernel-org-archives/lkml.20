Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FE17C203
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208651; cv=none; b=tWFqpaBcVP4TLL/66+kkXtGyeX84i1ZaE7SYL3bJ+zSkkr7orCPLwTIEHG09wOUDiDHL6iwFFkhi0rpg6V+uNjt0cb75fGtWcOZmp3osZa2dpfCEArGNmLngouIdd2yO47ZKtZEveA+NBiO1iarM5H+j5guVToNhNzke3+w/5s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208651; c=relaxed/simple;
	bh=xXl/p50b0ThTgmsBaFaEQ8pK3dKMwKoP6dH8tJeuGSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O93ouPrE1yjXa+LvgfD2C4YgDLY9Nh5dWd5BoGzwSuvaGmz1bwmIKHJRMwUwgVzeZRGQOboc9kfWHoAMDeAvW+pHO/y1ApOUv+7ko/Hih0XMO43FGZC35VIPwe3UrXWcvjOHrdgtvxrhWqfR8o+VzCrxT6ky77EU3/ti376WhEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYdpj11J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPibVfuS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYdpj11J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPibVfuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790208649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQq8mahuuqrFopJghWcTwTNWIgqjB8mu7IEWM1TnLbs=;
	b=IYdpj11Jlb6NkP1oYpLkTcneXGzMc/pjKioFaaTs6ilZnosPz0KmoA0qljHa4kRYTYg6s5
	iMp1YBcxjBn3Sw48m1nB+m4ZU3nu9CtnBa/LnDAOuUpWzCcEzFp3DMVsAEMAem67kSDalo
	tiXQau2HMBIwUcJimp6IjD1f0kP0jaw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-XnDGIdEINpmYUz-7d6thrQ-1; Wed, 23 Sep 2026 20:10:47 -0400
X-MC-Unique: XnDGIdEINpmYUz-7d6thrQ-1
X-Mimecast-MFC-AGG-ID: XnDGIdEINpmYUz-7d6thrQ_1790208646
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a5f5969208so7251011fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790208646; x=1790813446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQq8mahuuqrFopJghWcTwTNWIgqjB8mu7IEWM1TnLbs=;
        b=hPibVfuSmkiH1sHGA4ku8icV7Fo+ji+tbuSZvntVOikLqGvogmH1uuV5uNYhcv2PZ7
         R3w0Zd6IFZ7BHeTp9KTSsjjPX3oLiHc3NpmJkgLeftyI74xMcWzhVM70td2+MOKe9sqP
         +kiB2/j6WgCT16kmZ7PhDPzEnXqNgDG4nm5MkHMEsXaOpa4b7oyFK9oEUcrjXm21gpUs
         AsowXkfRiYPSeO6KAcr7Zi9flL7RFHhpGtW7Q4xafiPynAb4oSK1hRZDgBC+Mya8RB79
         Jc4rKlNlT7FYrII77Q/TKKjaWRZRmWmk/nafWTuRzRPPmOaHCNuxNmJAwGKkLJrwaCBj
         QlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790208646; x=1790813446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQq8mahuuqrFopJghWcTwTNWIgqjB8mu7IEWM1TnLbs=;
        b=z6LUgIH7lMJRT/iFkcBf5U6WScNGBOoPSGnUu+IJGcM3jZIbERvymlV5TpEJVd9vlL
         F6JLXbgMJ2AjPkZKmWnu5Qe9HduWV1ZLxuHlZrGUk4FqUGaNbh//wEPj1W2EY41rD35C
         zvmxBOOqLx34vwQ4MPU8UeFl5NNuVIPqz0hxs2djGBLhMGCgMQ6YACiQOaxmCijrgdyj
         AYXWywujh/ds27uWqspLRKQFREqoCbpx/f79MOTMfkOR7rP/UsR0k5wtb6IeEb052AjS
         lO2edu1NL0SNHBNibvj/wO24kNrb0UDcktXiyPf3Eoh2DpkNuL2w8YNKkOxxyA5ih2GG
         gM5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWDyrgT2ls6qJS/IzkD5xLdvenjtd9oV1F9a/0b9Q8h9QpGgLmrEyffAMzyT0kGMvAKN301Hg3LHMZdZs=@vger.kernel.org
X-Gm-Message-State: AFuF++m1+KLaxNo7sav8EyW4ydO+KZn8uJ40Jz7YyjeAtnUgtN5g1CsB
	gicGE0VLIS4TxNxGhXtF8YbtSdO+X4sFnTxG+HGmbJs72TpqMu5hz8FSJzVXyo3IU4Us2RPYmId
	PAhFE6+8VLZvWRPaS3NZFEdjY8WKxnysY7BGOp72Nyq6xD0yVi7gjputCGUhHiFKo
X-Gm-Gg: AYBFou0Mk2C3IG3z0CHIFVy4g6OX9wr+TjATSovtewq91ubdzboTCBdTDxos7pkQ/b9
	YlXEGQ/nNd3790bsqbFaEhNoCaC0Yetg710bvPXwsLZI0lcN0kqoLD22eCm7AzfFNqF6ZgD51Jc
	3NbYWrhMdksOFb1XhV8ygMvpW5+FZ7g1Oqta5pA5XZZZxCLdOVy/RHXPrcV4aeVBWVGIooccjy1
	EseITrH6Ir1BGUII4gzflkwFTiwDbF+AalHw/btZgPW649q0yOl07L/DRF4619SZgO7FrnO7bVe
	8tT2Ec12UsB77OtYotREomd4jWgtddne8USPvhogy0/BNzTMCcg2cTZxIS0/PdN89TG0/iBNoC/
	MH42qH4KMyrZb/P/RnZ5efBfQFzkeuMA=
X-Received: by 2002:a05:6512:6cf:b0:5b6:184c:7daa with SMTP id 2adb3069b0e04-5b8df09deddmr250423e87.51.1790208646146;
        Wed, 23 Sep 2026 17:10:46 -0700 (PDT)
X-Received: by 2002:a05:6512:6cf:b0:5b6:184c:7daa with SMTP id 2adb3069b0e04-5b8df09deddmr250403e87.51.1790208645639;
        Wed, 23 Sep 2026 17:10:45 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm963966e87.7.2026.09.23.17.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 17:10:44 -0700 (PDT)
Message-ID: <63211ea4-9eae-4241-8926-9e81334c5f7a@redhat.com>
Date: Thu, 24 Sep 2026 03:10:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] [PATCH v14 00/12] migrate on fault for device pages
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
 <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
 <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
 <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/24/26 00:19, Andrew Morton wrote:

> On Wed, 23 Sep 2026 08:29:34 +0300 Mika Penttilä <mpenttil@redhat.com> wrote:
>
>>>> migration). It is also tricky to code correctly. One page table walk
>>>> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>>>>
>>>> We should be able to walk the page table once, faulting
>>>> pages in as required and replacing them with migration entries if
>>>> requested.
>>> Sounds sensible.
>>>
>>>> Tested in X86-64 VM with HMM test device, passing the selftests.
>>>> For performance, the migrate throughput tests from the selftests
>>>> show similar numbers (within error margin) as unmodified kernel.
>>> But no performance benefits are demonstrated?
>> There are no performance regressions for current tests.
>> Real benefits come if want to do migrate on fault.
>> For migrate on fault today missing pages are collected as not-present and
>> the caller has to fault them and re-run migrate_vma_setup(); folding 
>> HMM_PFN_REQ_FAULT into the collecting walk removes that extra
>> fault+retry round-trip, dropping two page table walks. Page table walks
>> are not cheap. Not to mention simplified implementation for driver.
>> Also, the vma looked up as part of the walk is readily available for
>> migration, eliminating the need for explicit vma lookup - one more
>> performance benefit. Net effect two saved page table walks and
>> one vma lookup.
> It certainly sounds that this series will result in performance
> improvements, but have those improvements been quantified?

Yes I think Alistair mentioned those walks showed clearly in perf traces
in his experiments, and that served as a motivation for this series


>
>> This series also addresses the vanished/reborn page table while
>> collecting problem which can crash current implementation.
> Oh.  I didn't get that message from the v14 changelogs, and crashes in
> the current implementation are not what we want.  In fact, addressing
> those is more important than speeding things up.
>
> Under what circumstances to these crashes occur?  Can/should we we fix
> those in a minimal -stable backportable fashion before moving on to speedups?

It is about races between concurrent MADV_DONTNEED and collecting, where the
collecting arrays overflow if page table is cleared, recycled and reinstantiated
as large page.
I am not sure if there is minimal fix to all the corner cases,
or would it be more like the approach in this series.

--Mika

