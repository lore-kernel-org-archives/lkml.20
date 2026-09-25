Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65849E15A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342557; cv=none; b=Io7an+KXDgASLpk9fYeBQzvYRItd+0X0iVZ4DMPQ6iNnY2CvkJy+lKMLe8Rma5gYTKgMC71eXbTqjEtwSPHmJON2ajkdne5WqFNKRJnqKU5Ou5H1rCNOJaODp9o1ztuFrGX1Uy10bh4pc5SKXZ9HENGX4VD7JOwRQvslmjO2y5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342557; c=relaxed/simple;
	bh=So4HqoV2MG2xCPJ5gN1Wxr8DZySiB1afqTP57oJbzjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQ8K7hQi5UKChCSFJ0U8KPYXZZLmNiJXSESegMnNB9t7diCSrqYE2xDRrDpL1xf2LjlefTi9PQHWu2FFmGpmCOzveJCuWVJDuZbNNsYeJCNR0qg8S9clUWIIo6p9hcOmphwfrYV8T1eaPeY+zuVzWLDhl+vwQMRqMwkrOw5CPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOKfPt2k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETeWurBZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOKfPt2k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETeWurBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790342544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mfp85Na3VIvxFepbe+2FVNLR998tfGijRwpOnXjXS0E=;
	b=fOKfPt2k/qkngRrNihgEPzV+PiFb3us9Y3/uhFjMZ1TdRd3BmG+M0oag/GpTFq7R6JyCkM
	nY45gWV1lPCbKIBOvDkm2/XSodcCTqlJLPz4K7ZHGOcU2wezsvP/3R90SlndcwzSHfwzSH
	tWy7KSCpXER0hwV0VpWlVtHWNBbQw6c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-4XD3q6lRM-y0GKBbykvOng-1; Fri, 25 Sep 2026 09:22:22 -0400
X-MC-Unique: 4XD3q6lRM-y0GKBbykvOng-1
X-Mimecast-MFC-AGG-ID: 4XD3q6lRM-y0GKBbykvOng_1790342541
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5b8ceea282dso516320e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790342541; x=1790947341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mfp85Na3VIvxFepbe+2FVNLR998tfGijRwpOnXjXS0E=;
        b=ETeWurBZeSxeh/QLNF6eZgWw7Z7+55Sez7WSqWKBEEufKKdYiUJT+K2hQfZfe5QFia
         3qRyiYClAAigt5MWp3ImLESHxcphs39gVI5lzAsmGOX4CHfhTwQX8bGwIuJbKyJOEJf7
         13PccDndJhCJd/j905d9lk0SGVdTJnb8BokBNKTu33K2ISKERAR63kFQdnNrqJy/O2Mb
         uBomt/sPdl2/s/182Y5bD0ZhuG5+hNpK671Oy4/F2I5+rbhNfCptTmecPOCmAvMmF0b/
         1gKOGtZjNAb5/7+T8I4hlqlxHdGHHQ3Y6NzON8Z/ElEdE+amr3o0TgeQo8UvLjAQdPAm
         ccMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342541; x=1790947341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mfp85Na3VIvxFepbe+2FVNLR998tfGijRwpOnXjXS0E=;
        b=U6ipvYeC5zPpZv/NYNkIeL9h3+AQvYWj6QspBif3viB1xbd/qc3bPUjG/w5AR1cZfu
         m2XvW7M3Ivdp5M+/MURqxAJRGM9ASzVgX2iaEbhD8VWiTsUWXywy0zKf41FyKaz+bRYs
         Wh3RusG2pqkkL1DNISR392/Fufi/njHE5rxv6AnwHQrp9+ZSuxCKIPMioCdLiyYDhJOY
         kUuW2j1jkn+iFqcu720NMowwUvt9EzjsFhvDoOP6BEFpuVfVUvbGBL6FcCT2DracQ6mU
         /86+biRbRQLZVxujDoQOCU01Wi+P6/OR+uT1wkPxHkhYwkL+o1xcOTXKpPt4GWv9Q8gu
         /3Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwqt/8zu9KikPgvbzDTXtrTdZ6kgYAnnY23PM/zPWZ7gHM0b1XsStRKYHX6g5SMJpFxfjXTyosfL8OygpI=@vger.kernel.org
X-Gm-Message-State: AFuF++nfHQFAN6S/+eQMvdYoHtsV/t9iFOP8UnEYpjeTCwYr6G+YWAYU
	J8V8nXvflIIyKg/4sHcpjRqNvFJoS2ttV7AmpAYvUh7hXbLnOhd9gCOTfzhVluiPoFxGhghBvZH
	TC9GMaYLo45XLUHDYPvYIdy1fBS+ZzvZ55J3M2oCMV0JqR1+FD4a6+FQLatIqCFeP
X-Gm-Gg: AYBFou1xX6MtKJF0nQ1A3uab9MDttn25oQc+jHHV1zJYrIYrvrvXe4/nH5IZdloAv4C
	0tTZR14eIKcvGY6m0HwZVGk3uax1fTtPyK6U6uA7hCW5JjAiWYNIsJHJAIKs2Qietyqoj6dR3yF
	9CUypRXVa2KKFtmGLA6tKrqzw0KMhBhvZ4xJu5hmNiCV1Ti4U8qeezgPS9rzt2wo3+LTTQsbCCx
	DfgzpaphHW8wlgv5AGGvY8xDncZup2HQDBvyGYDH7Qkk3RQWd5+GK9Ed5GMOs04qK/8EZp4M5MU
	eg421LO+dhuvUwvhc8k11OdBXrDguvYehFFjD9SNdPAiq73+TQbYDKQrxsFvbsHNmag9vC3K2aW
	khkvcC/6WF+qI/gk0TJdhbKNngwa5cK4=
X-Received: by 2002:a05:6512:3e10:b0:5b1:121e:56c2 with SMTP id 2adb3069b0e04-5b8e6b36729mr733464e87.0.1790342541352;
        Fri, 25 Sep 2026 06:22:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3e10:b0:5b1:121e:56c2 with SMTP id 2adb3069b0e04-5b8e6b36729mr733437e87.0.1790342540724;
        Fri, 25 Sep 2026 06:22:20 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2ea5d2sm5510451fa.18.2026.09.25.06.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 06:22:18 -0700 (PDT)
Message-ID: <f7cc0ac3-729e-435e-9062-3317d0a6517b@redhat.com>
Date: Fri, 25 Sep 2026 16:22:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
 <arY5zKsLuf7f_EYw@infradead.org>
 <65c5c412-56a7-46a9-b22b-22077a8e9727@redhat.com>
 <20260925124737.GL9354@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260925124737.GL9354@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/25/26 15:47, Jason Gunthorpe wrote:
> On Fri, Sep 25, 2026 at 01:23:52PM +0300, Mika Penttilä wrote:
>> On 9/25/26 12:07, Christoph Hellwig wrote:
>>> Who is going to use this? The series seems to lack an actual user
>>> for it. 
>> Two users: For one, existing migrate_vma_setup() callers, unchanged.
>> The series reworks migrate_vma_setup() to collect via
>> hmm_range_fault() internally (it sets HMM_PFN_REQ_MIGRATE and calls
>> migrate_hmm_range_setup(), mm/migrate_device.c). So every in-tree
>> migrate_vma consumer — nouveau, amdgpu/amdkfd, drm/xe via
>> drm_pagemap, lib/test_hmm — runs on the new path. 
> So split the series so you don't add unused interfaces for now? Jason

I think we get the other for "free", migrate_vma_setup() ->
hmm_range_fault() is the now used. But if wanted you can drive the
migration initially from  hmm_range_fault()  also from fault handler. If
don't want that then it's removing 
EXPORT_SYMBOL(migrate_hmm_range_setup);

--Mika


