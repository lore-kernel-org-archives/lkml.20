Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496142E437
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141390; cv=none; b=HcyFKGqZ8WWBh+SLEns0AAr6T17cj73Ac0OXYeqXlC0xckyiSTgQnxogP8s2y4rzj3PQGqbm3WZxce2qXlUc1kXgyCPy0k5YSoq3VOJv6TofUOExCqVkgiS2GrN6cm+6xosfM2HUghYQgjgk1uUvJwP4rUS1wfbY+wO+zzmDI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141390; c=relaxed/simple;
	bh=Xfb0CrqpgGJh697FxKxRsSLVgCmhnBZcU6mTFrRf3PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Va8/OFfqlcKYYL2kJcjsQm4FBU+lgWbwW1lFLDHbXFRgRFclhljJUtyCQefKlPA9gKl5YclusGFJEDstpEyq0nXLYllb214DWPxYguzXWKlvGwV9hSK8W0AQxlnt4zkdBknFpZuFP6yQ4YGx1A2szgXrX5gd+wm3B/4aMFVmy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HWEIJ99m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hqEOdwuY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HWEIJ99m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hqEOdwuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790141388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2vrYuRJ8qL5kWsy9Tz/qOHqUgXc8+IhHfJ0Nm3O5oI=;
	b=HWEIJ99miMBoXpPWoWSe/VZ3eA1zsAUDjss/chedDLeAmx8cl6Q3Z5EoOV4i9+yAraZkOC
	xbj7DNCCZ7aQ3IUD142Iyi7/38O9WDpfla61vJrlpULzbhx2aN+DNBsh/dwaFaNY3by5vb
	l0nRLTjdgNYq7IdOVf7sWU+cqYNH5i8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-t42PWPWqOVuLvI5hKIl7BQ-1; Wed, 23 Sep 2026 01:29:38 -0400
X-MC-Unique: t42PWPWqOVuLvI5hKIl7BQ-1
X-Mimecast-MFC-AGG-ID: t42PWPWqOVuLvI5hKIl7BQ_1790141377
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a59a300bfdso2076271fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790141377; x=1790746177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2vrYuRJ8qL5kWsy9Tz/qOHqUgXc8+IhHfJ0Nm3O5oI=;
        b=hqEOdwuYw6ARem4YQBt9JFHSL+KMQwlhJyn89zeZIHZjnaDygosh4/xg/7TaB5R31v
         qQy4RoaEzB+HMUk1b53nXJYeQNl+R7Sk0s2/zecpAyd5AeMYXpAafIVaRRRXicCRoewN
         ayAUfaR/fCf05khmTmvrGypUK/9tOr6TopDXe56xH3G392jhYTWWelPLZeqMqT7Yh+K8
         xUCQNbKhHP+tSb4AGh6N6C1uuL91IKvdowvZiYxybvNWRvSgHxg4C+aAjtuZOtLeoPDa
         UVoOYjSQj5XN6WpoWkJHAHjyW7Rufdik7v1zaZ+7vdwk/WtYsqXz9zSmPyNcilNr88db
         fPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141377; x=1790746177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2vrYuRJ8qL5kWsy9Tz/qOHqUgXc8+IhHfJ0Nm3O5oI=;
        b=EodB6NtgLHeRJSDKWFhTk84WZGwhj1F04cZR+t86LA3QmEyI8t41jH4EVeKaGvrGyI
         aBG48xCNVapkeFNyTLjUljOgOIl34n42EjaCtG53vLHXmtVU9xi0dJZzahdR+yY2xnLt
         RPnufnNqMstG5uB3WCo2N5BahShoA410WKrlB18+cRLMXwi7RxAaJzr2GdxGSZU6VcGi
         Nl3C7DPUTVOWg9QC66wan4LrmbQ/srIuGR41n7fNB3O0oBgwnEeD/pdwalmXwGpTwJLy
         DjAV2lC0a6TAtwnUtR+ziPbB8ROVvsNsKbr2O1oQ4DxqbP6nPtVPMyC2mGdfoBRVQKVU
         zoSA==
X-Forwarded-Encrypted: i=1; AKwUvBwfizo5NEl+AGayPrf80YWFFADyVSy/LDBflw6LfkPSxaSOCRWER6qIGEx8+wXTQXiwru+hHLpdO++YwOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++km8feWz2fntp0omsGh6+DdBvm5isoYzfS30k6jI8DUbxGEZofx
	3JTHDWD155D6QucH9PSjUGJsAlX6A295ST9nKo5Pyzzu8GRm6jhrUTqJnV4iy2QMZ8S/uuYSKME
	T5h+H+xhQ8Fv1MnlaHVKg5wK5BM+i4Zgt2rNARySHxx1FQ06JLvA3JSTHljEG8mzvPNfI4UXJfd
	8=
X-Gm-Gg: AYBFou1mpsRAyrhaSxPexSyvdS/HZecvfG91mf0pW/Az5uzO458gE32Ocn+EE2VTlQe
	hJPNxrjXNC/AWhPRi+5Y5rbpPyihPMSNQYypCxSSPQb5Itmq3YxNQWBXyQ3T8RUESvbvHk06FDm
	vCr7q0hBDWikUixGEVxfczjVf7CHNZ29PDBXUwkvn1OVp5Eu/nSnf+x4k+m6XfdW2thBuD0Au9c
	KirJHW9jtkZjmUBVqJrF2U4h/Ea8vZeThdEDwx5FhbdcMRi9EVON9IgPMKDBM6/GxyoPZR7A1Ho
	chvYBAvMrqUndzLw7BDquoLbKYy4ZfIUMTFsL03kVpkS3d4WJeXSQN6w0P93J06En+svJ0kJ8xJ
	E5tbVkA7m4geYsFmDQOmpTkhoTyAFMvk=
X-Received: by 2002:a05:651c:2119:b0:3a1:980f:5907 with SMTP id 38308e7fff4ca-3a63062bc97mr2957731fa.8.1790141376702;
        Tue, 22 Sep 2026 22:29:36 -0700 (PDT)
X-Received: by 2002:a05:651c:2119:b0:3a1:980f:5907 with SMTP id 38308e7fff4ca-3a63062bc97mr2957691fa.8.1790141376203;
        Tue, 22 Sep 2026 22:29:36 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f507e7bsm3916101fa.22.2026.09.22.22.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:29:35 -0700 (PDT)
Message-ID: <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
Date: Wed, 23 Sep 2026 08:29:34 +0300
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
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/23/26 05:27, Andrew Morton wrote:

> On Tue, 22 Sep 2026 08:34:09 +0300 mpenttil@redhat.com wrote:
>
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> Currently, the way device page faulting and migration works
>> is not optimal, if you want to do both fault handling and
>> migration at once.
>>
>> Being able to migrate not present pages (or pages mapped with incorrect
>> permissions, eg. COW) to the GPU requires doing either of the
>> following sequences:
>>
>> 1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
>> 2. migrate_vma_*() - migrate the pages
>>
>> Or:
>>
>> 1. migrate_vma_*() - migrate present pages
>> 2. If non-present pages detected by migrate_vma_*():
>>    a) call hmm_range_fault() to fault pages in
>>    b) call migrate_vma_*() again to migrate now present pages
>>
>> The problem with the first sequence is that you always have to do two
>> page walks even when most of the time the pages are present or zero page
>> mappings so the common case takes a performance hit.
>>
>> The second sequence is better for the common case, but far worse if
>> pages aren't present because now you have to walk the page tables three
>> times (once to find the page is not present, once so hmm_range_fault()
>> can find a non-present page to fault in and once again to setup the
>> migration). It is also tricky to code correctly. One page table walk
>> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>>
>> We should be able to walk the page table once, faulting
>> pages in as required and replacing them with migration entries if
>> requested.
> Sounds sensible.
>
>> Tested in X86-64 VM with HMM test device, passing the selftests.
>> For performance, the migrate throughput tests from the selftests
>> show similar numbers (within error margin) as unmodified kernel.
> But no performance benefits are demonstrated?

There are no performance regressions for current tests.
Real benefits come if want to do migrate on fault.
For migrate on fault today missing pages are collected as not-present and
the caller has to fault them and re-run migrate_vma_setup(); folding 
HMM_PFN_REQ_FAULT into the collecting walk removes that extra
fault+retry round-trip, dropping two page table walks. Page table walks
are not cheap. Not to mention simplified implementation for driver.
Also, the vma looked up as part of the walk is readily available for
migration, eliminating the need for explicit vma lookup - one more
performance benefit. Net effect two saved page table walks and
one vma lookup.
This series also addresses the vanished/reborn page table while
collecting problem which can crash current implementation.

--Mika

