Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561126;
	b=lUUr6kCvmxFx5h6yKHuFkoE671uGzCB+13xrMTTYToihEYnObDGVNNZ0lYOlFpGDOSvG
	 OjtzS1QEmva5B7Qirj4fS/Qc/LSiajRxRNC2JPe+7nCP54acEu5CqGqKpOh2+eoCgIrwx
	 Ww/PTGvEhKBTQDw2h+SjG1WTjE7kvOVbfZahwjhUc33Bv6fWMZHIR8E/b2j1rKs/0FjbM
	 WcV2DeKS+P85xkGoVhf3XXWwD4xXsHTWPQmYNy2l35CEOt4Ctat1lQ7orRiFoswkli70y
	 KDYf07VKvVlpS/jRsge6F7xUkdf5/FZKBszfay0BQFMaUz1XKfMrn7KWjRmgjCI0Vvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561126;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=l9qjP3EolVZNhFJ6yU6oKwddBCb6NF0vJywntTMZ9kE=;
	b=MAhIsnAQV4WzGaQlhtjRbleAN3QWXUJhSAr6wc0E/I7jkfzWCqwwYxIbQYQXB1CmcrLQ
	 1wbq09T7lvj3sUkolJwK6UshlxfWZ4DzyFb6XXtwT4zPjpo0FV41pAyN6GOuYgja5WEZg
	 PhozU0Auo3XzmJx4cdOWEfiWxywUwXk7yZkmUfJZGNY4SRB8lVU8FECsl6J1Hpd8YUaK8
	 grBUPbCo06yf8ieiiI9BNGVMXc/OruidAAGwlv45HARArvFc6vJSvHAVEu3P7D4LEogdb
	 LTSSDHkGv6Hbd6sJjXAirSlwQq8Z4Jq0DLjLuCY3ObS0beezPQD4TuKjDr4geHNcKow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BNO7ydKl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m1IRPWOd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BNO7ydKl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m1IRPWOd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794561124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9qjP3EolVZNhFJ6yU6oKwddBCb6NF0vJywntTMZ9kE=;
	b=BNO7ydKluzj0KaqHChouMGNCurnLkVOAcLpNXQ9DJreGYTbTKihD6BgadXTLmGvbk7rXch
	BdDSHsLjlwJvelAATau584bb2bb3wlpP72FTpnTkaHKwSFEjcuUsOJjAQyxshvmEvXIGwU
	SaqUe9YEe+oVQGB8jD62Jc4SXh67wvA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-TXoTG_MyNKuR5uS_uUiF4Q-1; Fri, 13 Nov 2026 04:12:01 -0500
X-MC-Unique: TXoTG_MyNKuR5uS_uUiF4Q-1
X-Mimecast-MFC-AGG-ID: TXoTG_MyNKuR5uS_uUiF4Q_1794561120
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3acb2e2030fso4733791fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794561120; x=1795165920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9qjP3EolVZNhFJ6yU6oKwddBCb6NF0vJywntTMZ9kE=;
        b=m1IRPWOdMELHP5jUbm8U7jjjWRkS/bWo8RN2u57RJgwgVHGLqXcxKr8U/BS7T3ja7K
         SjSy6H9qHNXGXKWiYaS9pDJ4+w8/Nm3+ybeqn3QG81NcF1TIBTklALkWFo0bTFC4pHWD
         vpT4JqMZOOkws81uKsj1B2qx9qRat//4G+K+h3YdQuvXs/JGA5+JllkS+mVKnX8d8hp2
         POxK775+zMbFSokp9qRgJgotkEb55dNvBE4tIIIP2s7opVFaham7KSkZEcdYDgMVu/DO
         IMJI+j5oxqlFa+AS9C7qISYUTf7iltunZVhiwzs0fTsTfb2bkqfsZX5E9u4zjMVu/ycl
         sUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561120; x=1795165920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9qjP3EolVZNhFJ6yU6oKwddBCb6NF0vJywntTMZ9kE=;
        b=ZeBluEKEbFj9J+pMd2SB59pqs4v8WN9B2cz+rE1oT6kHti2si3s9RJC38386gJElF/
         4ap/5EcsPIRr5+odWdZBXKz+Baf1d7+DmrgYvQ/ZPH0MdqjGWYRCjFgeOvh1b6IUjXfO
         B+lu14N9jC2oq4RgmqnDNiD99dROu0bS3a7ha/WTJOIm0BRTA8cBGI9crSvzwjpGvVTt
         xisvZ890YDkelS5F3XhAS8Q8+wrMBIzNkR9cMU8Tn0dlzd973e/P7tf0cK32bJyBHNE4
         qcG0ZrvhJ6GhiQRryszKdML6cdRYVfBuXEFeEO8Fo6194NS4QpPbpMcsguhfhgIV+bll
         TVCg==
X-Forwarded-Encrypted: i=1; AL+hErEbg4old7dy9MnpkJDCMYu5Lw7tvh9Izk0Uzrb4D6QU1+Efe5SgkhFE8L+ZQvw+Vuzgydx4Vy0mgx1DxUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8My4LbMF6x9v0/6qn+TiqOq2dz4XCHdX4g4meMc0E1NSibL1IF
	4EMH4h9g+RLeZYlxxZ45nkzQMzfzL3I+og1fL81WFnDWjoNrQ8Dq1121ki4LKU3L+nxKqvE0DTB
	yT3wRl/GvXRbDvhdUHwoTyKrsBWuVxiCd7TCVN9EEosMz2cPwqsGuBrlDoJEbt6+0
X-Gm-Gg: AYBFou0RO353gXOZ3W06FredbcjrDDkYxlQZ2oucvswtIBtKVDVk1bmTjTxXzExTJ7b
	oEUKA7sJeuwd8orDCLBg+DEdxxnwRQa361s3mxvm84+zhSRTlqXDqufYsU68cyeyuDIKjK4ci7E
	1aejfEjpzwXCv5wVSAqZesAIjedDqbFcBu1CsaKowCJX91rsCGyGKzM1NfFVHQr0XXxJU7yp9NJ
	TAiU+OKvw+EpgzLKaFzmeGANBJ7xI/1Ige0+a88E2rdPD1wwe4jP8aR6y8j9hDvGMvvV1WsTgQ4
	5VpVEU43opf7uiQcGzg1jXXE8RVXTZDQcfbYi9x67TGzLF0vlGU2q+mqHWdHJJSKIEgOs4+67jg
	D9UAGZlkjUGPCrrqSSJd1uEavtO9nu4uIOZjljmDmDfK2mT8S7OHHYINaeuMx9xNFiPI4ylYoMC
	mve8SQ
X-Received: by 2002:a05:651c:a347:b0:3ad:f8cc:390 with SMTP id 38308e7fff4ca-3ae2b4bc3f1mr7065981fa.11.1794561120258;
        Fri, 13 Nov 2026 01:12:00 -0800 (PST)
X-Received: by 2002:a05:651c:a347:b0:3ad:f8cc:390 with SMTP id 38308e7fff4ca-3ae2b4bc3f1mr7065831fa.11.1794561119826;
        Fri, 13 Nov 2026 01:11:59 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b76a91fsm6490801fa.8.2026.11.13.01.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:11:58 -0800 (PST)
Message-ID: <2ad4f730-0656-4b2e-8cbb-4aaae44de1cd@redhat.com>
Date: Fri, 13 Nov 2026 11:11:57 +0200
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
 <avXoJSGh5xjGFgod@raptor> <20261112164752.GA3692174@nvidia.com>
 <ec4431f1-e70d-477c-b09a-eedc35d97691@redhat.com>
 <20261112162738.d689b46268e077ac06f41d91@linux-foundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261112162738.d689b46268e077ac06f41d91@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 02:27, Andrew Morton wrote:

> On Thu, 12 Nov 2026 19:01:58 +0200 Mika Penttilä <mpenttil@redhat.com> wrote:
>
>> On 11/12/26 18:47, Jason Gunthorpe wrote:
>>> On Thu, Nov 12, 2026 at 04:24:05PM +0000, Alexandru Elisei wrote:
>>>> Hi Mika,
>>>>
>>>> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>>>>> Hi Alexandru!
>>>>>
>>>>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>>>>> Hi Mika,
>>>>>>
>>>>>> I want to help getting this series merged, and I've been familiarizing myself
>>>>>> with hmm and device migration, please bare with me if the questions I'm asking
>>>>>> are obvious or downright silly.
>>>>> Thanks for the interest and willing to help! I am preparing a v18 of the
>>>>> series and plan to post it early next week.
>>>> The series is big, and as far as I can tell the MM people are hard at work
>>>> reviewing bug fixes. It might be better to wait a while, to give people a
>>>> chance to have a look? I know that if I see a series being reposted often,
>>>> I am less inclined to review the patches since probably a new iteration
>>>> will be posted soon. But I can only speak for myself, you know best.
>>> It is at v17 and it is still getting high severity sashiko errors
>> v14 was first that sashiko managed to review. There was a regression in
>> last posting, but also false potsitives, and sashiko reports same issue
>> then 3-4 times, so the reality is not that bad. 
> Pining for the days when all we had to deal with was checkpatch.  

Yeah.. running sashiko locally now. Interesting enough, refactoring the
series (end result being the same) made most of the "high errors" disappear.


> Mika, afaict the entire patchset is a performance optimization, yet you
> say "I don't have a benchmark showing a gain".

No not a performance optimization as is, in the latest cover I explain it:

"The main goal of this patchset is to provide a new feature,
migrate efficiently on fault, and not directly improve performance
of current migrate_vma_setup() (which is now routed thru
hmm_range_fault()) callers."

The "efficiently" is wrong word, I should say "in one walk".  In the
beginning of the cover, I explain the benefits of having one walk. Also,
I think it is sensible to have one implementation for it in HMM, instead
of each driver trying to do something similar.

We don't currently have in kernel the capability to do migrate on fault
in one walk, so I can't show a performance gain with a simple apples to
apples test.

Also :

"the selftests show that there is at least no regression for
current migrate_vma_setup() callers."

So the test is to show there is no regression still for current callers
(X86-64), not to show if there would be gains.

>
> Recipients look at patchsets wondering "why should I spend time on
> this", especially in these times.  It's best to answer this question
> right there in the first sentence of the [0/N].  That means numbers,
> and the better they are, the more attention the patchset will get.
>
>>  Documentation/mm/hmm.rst               |   45 +
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  402 ++++++++-
>>  drivers/gpu/drm/nouveau/nouveau_dmem.h |   12 +
>>  drivers/gpu/drm/nouveau/nouveau_svm.c  |  155 ++--
>>  drivers/gpu/drm/nouveau/nouveau_svm.h  |    5 +
>>  include/linux/hmm.h                    |   51 +-
>>  include/linux/migrate.h                |   59 +-
>>  lib/test_hmm.c                         |  174 +++-
>>  lib/test_hmm_uapi.h                    |   21 +-
>>  mm/Kconfig                             |    1 +
>>  mm/hmm.c                               | 1075 ++++++++++++++++++++++--
>>  mm/migrate_device.c                    |  618 +++-----------
>>  tools/testing/selftests/mm/hmm-tests.c |   56 ++
>>  13 files changed, 1984 insertions(+), 690 deletions(-)
> also, yikes!

Yeah, the nouveau made the numbers bigger - but we have a real user!

--Mika


