Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921818C02E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208885; cv=none; b=UsqCwAUVklPxoZYsK2PsBajnyEyjpTk/vPkMAM2/oYCfexScuWCwoeaZxGdz/p2AyR1AhyB+bQLQ0EfJFuesj1xLmDdtM06BqnS5CfGG+JRbsnZxtIQsGcJuWfLZbNythBqQLLLbHi1EiICwykjZ5ZIRD+XGR6njlCqIB71zA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208885; c=relaxed/simple;
	bh=tZU+Hxfi6XQJE0iQqvIdZO1zqQqpeBSR8KK5iRLjpT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rV/Szl8xLJ+23ax2gOtBt3gkRqvSwn81ac+YL+CIWnpKbIasj8m/ME8/3lsR7bF0CTu/bULZOM5f8/l0h/2VIZtuNxrSvXaSAPmp6h62AksLDD3nIacw/Ik1/grpmv5/fFwAKSJgQPJpNlROeT4/6yMrjBZs7fK8MfdEa7n00js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U9/5ZkgP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWT8AjTs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U9/5ZkgP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWT8AjTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790208880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Arg2o/O+mZYGRcJkQWOkHlb3811XT5pVkK165f7ivAA=;
	b=U9/5ZkgPbYCtN1+4ge0FDjV/sz2P0mJ9Fj0/+93rjfMFXBVyZeacynftnPyfEq88s+mPFo
	jbuagEaUA+u85+dNI6cghYynYUTH34G9hdY7/mXnv22IPg4mwC2xgq2uE+AmjCF8WTffXu
	dHpl1mtFqEUq2u5hpvv2q7uDpS+8S6E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-vzltQD22OHiru2AW2tYpNg-1; Wed, 23 Sep 2026 20:14:39 -0400
X-MC-Unique: vzltQD22OHiru2AW2tYpNg-1
X-Mimecast-MFC-AGG-ID: vzltQD22OHiru2AW2tYpNg_1790208877
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a27d89a894so6614751fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790208877; x=1790813677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Arg2o/O+mZYGRcJkQWOkHlb3811XT5pVkK165f7ivAA=;
        b=KWT8AjTsyLbuTBPryc0n3pM0yGxmHnF/Lcp6QqTuFC/cdy9E7WhXKWBqqVuBExbDRd
         udo778Ts68xfTEC3lu8rYlfmHREpltmKrukHaidJumLMmubWavPNbbJ1puWWv/UMB+bG
         QGQ5KH/CnzDiNQ/5YiQilBJzkVYVVtvPxzvFR0q7rvCWerpVaTVnwTBzQWyiX/Lz9XXK
         +fTAcjlMBmJVzGw2449PvTywHSa2zbiTOPSkXb0aq5RbkGC3N5zsnLte4rFEOs5at3oX
         uckDtut4cD6h4Y0q0bvwTxrNyPGIRjBV2oFGS7yYD9kEi4l75j8WTV9nllbikjDvfUhA
         VSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790208877; x=1790813677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Arg2o/O+mZYGRcJkQWOkHlb3811XT5pVkK165f7ivAA=;
        b=HNtDY9aT+j1W/b38nQK9wO0AaqS8fFXa4c8cPM48k/Yxt+8SeO7IMMQb96/LLlHDwb
         BHsIYsPq/dyu8GAzZVNr1d9R8kUjqCgYT+6jpAJopy5NJxANobY8w6plBrKgMi24MH4Y
         7MHf4YA1FRb3KBufXkz3F2rDIPSe2sjnO/iAcGkEug3gvKMpoZFBRr9ojTXav4Xi1Wnz
         LRzQaYl0znVrVKbOqY81okvQSn9jfrIDBfwIAPnhpsZHVkTN39kqDXhC/IayxMx8mLLj
         t9+h8nPIuS+Cbq7WVxTHWxblA3vftAci4BiQtFJQ5qaz1nmckLU0lsSwZ4b5lDhLxK17
         Q6yA==
X-Forwarded-Encrypted: i=1; AKwUvBzih/8UUDXSjqz/GoYnBhrOPFhNFh2QaNKDWy48l32v8Xs6IfY+wP4HFiq42S7m3TOrnIFGhYAkOMDnjug=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Sc16HLYynx7YzJ1Iem43/32UK7YTFAvpdZB79ou9piRbBP3K
	hu7nhc5iSnY+IlMhKaJlOxKqlf7DcJfpK3xr1cpjvhS3x7gj0t9XhCs6ggEu2A9oBT7afpWdrH1
	vIdKuUUNt0kKAcWkcpexDyvZaUbFQNQyjli6LQJaDklXIOsvIHYzjE86KKSIM67eb
X-Gm-Gg: AYBFou0OdBlZFHQxxvpUTiv5r2EJUlHwfvm+s4rJbcCRtsiM5ROI8Oz6AfYf8HVYmhz
	z1MtFHOjaHGAGTFezc1rYJnGs9jfQPIcJwlXh6eRccTDwGRBMjH3KUWDqWN4/als0DVzwGOWc4p
	XtxgU6Z4/XKeAsLV9ojBVCaCJWMIN6XtSoftwxuezHJ3y+bEf1zLmWWwRCSfBxysSs6fQdBDyfC
	CRBvqmP8MQPVK/jJcpJBK+lW60UnyK48+9XcbDawSrD3OL+zyrgrxMfGMD4k+2rTn5BN4LVsfE6
	u4MG0m4mG4Jl4Fcdqq1+1jxHRycdZ6uAC+ucSS2Dhij8M0Nc2j7oCwyXUJQRqsMBarXEhJDRsfv
	0I5UteUYrnlwOhtNgNppLntQJrro9W8M=
X-Received: by 2002:a05:651c:15c4:20b0:3a3:7680:67f9 with SMTP id 38308e7fff4ca-3a63c2edc6amr1104581fa.24.1790208877417;
        Wed, 23 Sep 2026 17:14:37 -0700 (PDT)
X-Received: by 2002:a05:651c:15c4:20b0:3a3:7680:67f9 with SMTP id 38308e7fff4ca-3a63c2edc6amr1104501fa.24.1790208876835;
        Wed, 23 Sep 2026 17:14:36 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bdbc5dfsm2340611fa.5.2026.09.23.17.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 17:14:36 -0700 (PDT)
Message-ID: <205181b9-9677-4fcb-873c-732a503fabd9@redhat.com>
Date: Thu, 24 Sep 2026 03:14:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] [PATCH v14 00/12] migrate on fault for device pages
To: Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
 <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
 <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
 <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
 <20260923232402.GI2545495@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260923232402.GI2545495@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/24/26 02:24, Jason Gunthorpe wrote:

> On Wed, Sep 23, 2026 at 02:19:36PM -0700, Andrew Morton wrote:
>> On Wed, 23 Sep 2026 08:29:34 +0300 Mika Penttilä <mpenttil@redhat.com> wrote:
>>
>>>>> migration). It is also tricky to code correctly. One page table walk
>>>>> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>>>>>
>>>>> We should be able to walk the page table once, faulting
>>>>> pages in as required and replacing them with migration entries if
>>>>> requested.
>>>> Sounds sensible.
>>>>
>>>>> Tested in X86-64 VM with HMM test device, passing the selftests.
>>>>> For performance, the migrate throughput tests from the selftests
>>>>> show similar numbers (within error margin) as unmodified kernel.
>>>> But no performance benefits are demonstrated?
>>> There are no performance regressions for current tests.
>>> Real benefits come if want to do migrate on fault.
>>> For migrate on fault today missing pages are collected as not-present and
>>> the caller has to fault them and re-run migrate_vma_setup(); folding 
>>> HMM_PFN_REQ_FAULT into the collecting walk removes that extra
>>> fault+retry round-trip, dropping two page table walks. Page table walks
>>> are not cheap. Not to mention simplified implementation for driver.
>>> Also, the vma looked up as part of the walk is readily available for
>>> migration, eliminating the need for explicit vma lookup - one more
>>> performance benefit. Net effect two saved page table walks and
>>> one vma lookup.
>> It certainly sounds that this series will result in performance
>> improvements, but have those improvements been quantified?
>>
>>> This series also addresses the vanished/reborn page table while
>>> collecting problem which can crash current implementation.
>> Oh.  I didn't get that message from the v14 changelogs, and crashes in
>> the current implementation are not what we want.  In fact, addressing
>> those is more important than speeding things up.
> Yeah, what is this about?
>
> The series still has lots of sashiko remarks, are they legit?

Some of them are legit some not. This was actually the first time sashiko
managed to apply the series. I will address all the remarks in v15 soon.

>
> Jason

--Mika


>

