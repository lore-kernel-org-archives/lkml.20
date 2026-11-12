Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494870;
	b=DQFvhQSmQwUxF1hEnHYQL6yAVKm368zx1VpfoLIAUMTHm1+quRlODvzt3cwO+vxc52Q8
	 SYizeSoyjyLAZLVBkh2AebalQQCKnnJHzAlFmgdclhWqF3LEiZnjBYr/Fad5LVad8WXKC
	 JFdLKyxzOrfpXZM8DDLx5oTd09L8wK7d+xba6ivLB6J0bGQ45viqGN4cux7WokXb/KFQN
	 OECOw60zwUsDJnY/b3NZQoztum+YvIdZL7+vyWFT/UaeC+caeBBu58fGlJl2bvkPTYv1q
	 w+a+QsxzDZiPCDBMiTJqyKZ4bDN156FH7kCOyIL9tQPv0qflFWY+LK84odNxl34HB0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494870;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
	b=eA5J0eYNkY0RhRjbNsubIjYr+wropfQ5Sp69sFVBvV4unTUyXXmWZDRbYGSj+g33yoKE
	 qH69gBaDR1f6+zVwtQHabwEog0hCSLrKTVjfKx8B0oslUBqQbLoIDIvVqrE9ca2RCiT+F
	 FHCnnCfYpQlyhBOka0zVNiCUUiws6mdeOD1919RrwXlsu6B8jWNLlng3E55tasdAs/bqh
	 sWwoebnTvMorxqjkU/8CsqGOpzuIehh6YuHDLGN9GRqr0R7u/ANG7bHhlEThu5zxckiz8
	 179CYAEGodkPJTcyrj6GZgCEsKiUYYeb4+MzpIipO4j53D6KsJpuWQuzGlVi1QxOcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="epD/pGIB";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tbSkNNnS;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=epD/pGIB;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tbSkNNnS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794494869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
	b=epD/pGIBUMPS8zjQ/M9OFPEoR70UQWV1Jl1vOdWBlhxmNGwSSK0KptMXZrYtIzz9nK+BO+
	gSCadsu9XoX71K9bLl2sE8PsMayLri5T8mW5xljmCsOTp7wPuPkQeVMzvNPwoekjxZeDj+
	jH5a5s1HSSxsxzAXjEyBXJLAmTIxzGM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-wI7McBhMO-aFQWa8hYBqxw-1; Thu, 12 Nov 2026 09:47:47 -0500
X-MC-Unique: wI7McBhMO-aFQWa8hYBqxw-1
X-Mimecast-MFC-AGG-ID: wI7McBhMO-aFQWa8hYBqxw_1794494866
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3adf93810baso24158241fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794494866; x=1795099666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
        b=tbSkNNnS8Rh1iA8pZhvgq3yqFQd4lIiH6Y61YMIa8S6AlMeVyklaYOWRE8ya3GRqrv
         wFWKO8PCo53BNWg2Wv8EjUs27ppfo8Iu69I0kOZlr0Ibn0BJ/brZjQ6SY36qeYtd6axH
         Hr1Brhsx9hpEyutEFGlnxiskCt//IHP40CH3/BXtjgxzabyjIXqXnWGqXyvP04bT1PAA
         ZhKdQBUgq+i0fre4l3/tQajfPSxuPB/c1BJx7Ow13Yl1N0sUe1GKTiB+4HWBlKHKJJne
         4OJ7Xmr5HkKApUCd0RlXbD0piyVUkHdxU4jF5sLaRUkuHONHVHj/4ufHXcauEYCMkY5m
         uvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494866; x=1795099666;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
        b=RwHtUwv4dG6/h9V6bi55qFaqKfPl42JxW0grzYH6f2ppVoHuME4lt1j5hS9P5RFWZG
         I/iq39myJmvwy2qz7mpWUbG5P+leMXd/sWikqGE5XmYad3xQbl2xroJqdfJqOAHFJGHm
         /dzNGyGNM1izJqsjgNLtOFZyL1/rmjC64gWFzaoQoFlCwpy5wghfI0DPfBNTawYBc091
         3g2ogVliSOBpVG8xVi2liA1noF7rS3u/JapZLn9CrCeiHHdftVTWe6NhrZFKlBsYptf6
         IOmN57gzB8jSqo15mn7/narYX7Uk+v7sp77ukAkdjE088O3Xecjl7LbUzkQSeWIE4esJ
         52yg==
X-Forwarded-Encrypted: i=1; AL+hErEHvHf1V74T5fsRS7CU9Ie8Rh6lf3D0hZraVBR3XzcJRA3BFVIgx6Nd2mDN/cw2m2ycAyrYqi01S75FvXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KyjATKNJQRSuB3ID/0QFuYrmEk7yyU4MmNWCUigPId/QJI8Mt
	fS977YhC1iglz8W0QW7xFi6eNOyTHY/quF02OV9TJwXVo/cQLqCQODVWbBmSUIs4lw8KolOjep7
	DOu+/abAWFwM2ssh6jslqsI948ouezIEIPeX2taS/cvMLBpSHPKJFui7gR3rwQjQy
X-Gm-Gg: AYBFou2HhQmf1vqbhpBrE2WigWls2heoNpB8vTvy+gNO8xFDseUG14xsUx+ODXfWEKQ
	LSevLGo8feZ6KK9gp++6mYr3Jyj02LqBkZs8TSdU8LdOzEVf/xbk+KowrYxUvdZ5HD/U/3RZuYg
	ga/zhMLp3M9sYPCUmnwUXOYBNtWUVbe6w/7LXAM4/MGWrFKeZs1f45WPshPZS1zQhRpyacyw7JT
	rNzOlbRCQ1qJaU2toXg6rEtPhGsEI0xP+Z8t2nv/7C8PZ+3RVbYY9dKBLigYuiTgmfXSP+LgbwE
	FVEHwTMHmd0RX/sMYxbRjfmnUZOw2pHCE1sbN9X8PNRy9KVqlkV+CCTLauU+0E+kvZDArL/vEHJ
	yiqWjPx9HAE2mZu8zHVvhELkki9trcgZG13PQlNvsjU1GYnglRFa2QEpY+kNVOi0TYN+pnadehG
	8M8Qde
X-Received: by 2002:a05:6512:2524:b0:5c1:57ee:1887 with SMTP id 2adb3069b0e04-5c15d62c702mr2219392e87.13.1794494866132;
        Thu, 12 Nov 2026 06:47:46 -0800 (PST)
X-Received: by 2002:a05:6512:2524:b0:5c1:57ee:1887 with SMTP id 2adb3069b0e04-5c15d62c702mr2219357e87.13.1794494865616;
        Thu, 12 Nov 2026 06:47:45 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab834sm1698450e87.45.2026.11.12.06.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:47:44 -0800 (PST)
Message-ID: <b3689045-d735-451b-8cda-a29d7e79fe63@redhat.com>
Date: Thu, 12 Nov 2026 16:47:43 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
Content-Language: en-US
In-Reply-To: <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/26 16:00, Mika Penttilä wrote:
> Hi Alexandru!
>
> On 11/12/26 13:56, Alexandru Elisei wrote:
>> Hi Mika,
>>
>> I want to help getting this series merged, and I've been familiarizing myself
>> with hmm and device migration, please bare with me if the questions I'm asking
>> are obvious or downright silly.
> Thanks for the interest and willing to help! I am preparing a v18 of the
> series and plan to post it early next week.
>
> I try to answer your questions, there are quite a bunch of them!
>
>> On Tue, Nov 03, 2026 at 08:16:17AM +0200, mpenttil@redhat.com wrote:
>>> From: Mika Penttilä <mpenttil@redhat.com>
>>>
>>> Currently, the way device page faulting and migration works
>>> is not optimal, if you want to do both fault handling and
>>> migration at once.
>>>
>>> Being able to migrate not present pages (or pages mapped with incorrect
>>> permissions, eg. COW) to the GPU requires doing either of the
>>> following sequences:
>>>
>>> 1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
>>> 2. migrate_vma_*() - migrate the pages
>>>
>>> Or:
>>>
>>> 1. migrate_vma_*() - migrate present pages
>>> 2. If non-present pages detected by migrate_vma_*():
>>>    a) call hmm_range_fault() to fault pages in
>>>    b) call migrate_vma_*() again to migrate now present pages
>> Regarding both sequences, I'm trying to get a better understanding of what
>> the issue is. I assume the caller wants to fault in system memory, and then
>> migrate it to the device. Is that correct?
> Yes that's the common thing to do.
>
>
>> In my analysis I'm also not going to refer to THPs, since that would make
>> things even more complicated than they are. I think we can come back to
>> THPs later if we think it would be useful.
>>
>> For the !pte_present() case:
>>
>> Sequence 1: hmm_range_fault() -> .. -> hmm_vma_handle_pte() handles
>> !pte_present() pages in two ways: faults in swap pages and device private
>> pages belonging to a different device, and waits on migration entries. Then
>> the migrate_vma_*() flow is used to migrate the range.
>>
>> Sequence 2: migrate_vma_setup() ignores !pte_present() page table entries
>> After this, the caller follows the same steps as in sequence 1 -
>> hmm_range_fault() faults in !pte_present() pages, and migrate_vma_*() is
>> called again to migrate the pages that were faulted in/waited on by
>> hmm_range_fault().
>>
>> Now, for the CoW case that you mentioned, I'm going to assume that the
>> caller wants write permissions otherwise nothing needs to be done:
>>
>> Sequence 1: hmm_range_fault() -> hmm_vma_handle_pte() records a fault
>> (hmm_pte_need_fault() returns HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT),
>> handle_mm_fault() -> .. -> do_wp_page() breaks CoW and maps an exclusive
>> folio with write permissions, then the migrate_vma_* flow will take care of
>>
>> Sequence 2, migrate_vma_setup() installs migration entries for the page,
>> then migrate_vma_finalize() replaces the migration entries with device
>> private entries.
>>
>> Looks to me that for CoW pages, all that's needed is migrate_vma_*(), and
>> the subsequent calls to hmm_range_fault() and migrate_vma_*() are not
>> necessary. Is that your conclusion too?
> For  a device fault: the driver want the data in device memory with the
> permissions the device asked for. Your !pte_present() analysis matches;
> note that pte_none() in anonymous vmas and the zero page don't need
> hmm_range_fault() at all, migrate_vma_*() populates them directly.
> That's why the common case is cheap with sequence 2, and only swap
> entries, other devices private pages and migration entries need the
> extra walks.
> For cow with write intent migrate_vma_*() alone is enough.

Is *not* enough meant to say


--Mika


