Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502927;
	b=bUeZxOQvJN//DrCtI3n9dL7w73DJU8TdfLYOKnZWcpckJi7nLTy8JkYVZyRU9wsHXcM/
	 CD5ZXKZjDiNoA0bifgcJHMX+PI51kU0brL+Ihf344ZQabO5xgyMiGVy/zs6ICt7C9ZEL+
	 NIPyzUuBFE3Hb2TWg+rMQUZa5pGiRlkzHIiweEP+303y9wyt2C0cZXczsoOBS+PW+I4P5
	 SzixiJPETWsN8WzJN3hwF6W1CFEDCJKCECzODd1YgGmfDnQ7TmxZNDcq//GgLqdNGC5Zb
	 wKByhHrdULHfALMDPpVbFwQTcTQlHmTAW+W9T6+6DvBY8jroq2+SquhY3BcA9i6jNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502927;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
	b=o2niix9p72P9uW415B+gGbdcOcI71hWfqkp4C2FtsmJ/FiKd1Yr8V2LjSE/iDnTu5Jff
	 FSD6fpLpSdkPPcl4FtCFyDuW1zRlyZF6c8Lv/xNrgSs/TIqh4IS8vI7tkkEAb1KRodKWr
	 3XHl2BntMY40TwcotIDpussP9frPPixEVxnFAc/6+Ir3hUnLo0YN27h4TIVVlELQhZErc
	 Gz7E705F3u5ZILzGxNsFiiVonMoer6hNA87Lhw9XTEmLmX5ASI9kppp1bPZSgWalRu117
	 o6v+M9sK46vEaBwzALRphGQJxDERuLNdjZSJq9cPudYiPZQEMqr0+50/jZP85EdpirQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="UCevKXm/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gXlcHNU2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5591606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5591606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UCevKXm/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gXlcHNU2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794502925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
	b=UCevKXm/2QZlZiWwVIuSPRm0QDmGUf2U7t4boZYXPztc33WfV7WTG756jBdoDrNKs7T69S
	uxIsArEvh8fSYvAx1FBHdTroDVyDw2FO2K4XgJ7fzSSvTPBja5J01FGJTVvT5qOgprWHVZ
	rofsUJnRN2SP7Y/WJxMZ1/ny40/ULVk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-8r8K51tTMFG_b3z5J9fSCQ-1; Thu, 12 Nov 2026 12:02:02 -0500
X-MC-Unique: 8r8K51tTMFG_b3z5J9fSCQ-1
X-Mimecast-MFC-AGG-ID: 8r8K51tTMFG_b3z5J9fSCQ_1794502921
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5c00ca36371so15946e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794502920; x=1795107720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
        b=gXlcHNU2Nl83TLdW6d72cuAu3Bwh1Il42UvTcZEujLyn2SLsbQY9s9RHQvVHbi3xuF
         qBQVT4VLsgasxxo+qnlcAkr8DmsqOYZuHW6CLDxSsbSisi6lTyHO459/yMRbO8QOTk5P
         LpXU0uI1WY95wSIc7e0IPRcFvGkyTcAtM3s1FBTuMhJVNtC6+i0MHmSheM4rmJVoD7p7
         lqF3gdrPmMc1uhTHvJD2/Lf2wnDHg6anJOZ5qw8CFUoCr5NOsQFCONJiSyRrFM6WAfHo
         URIc6gm4M/nYd4IRWY8w29Ro4INwBfqsOlVVXyfD2TgC71cytegJ6cN/Q5x8O72O2gJ1
         xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502920; x=1795107720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
        b=uGhYMLxDGkyjaT41n0ZJugojoziZB83Q9AR272k+ag8L/1e9iT/lMa/aEppV39g2pq
         6YCTml7xZEVkF9OXIiWlXkYdpHPgrZiSTm3Cpx3lMMBMZ5/Xt1/wjUUlTG1S8tbEvww8
         2o9kneuRoczdDts+CJ/XuMIdeS3oU42KXk3gTbBujIgb68BeK0UwCSSKtJzqHjqWyAwP
         Y9mqKv8gCVXUbeDLHEtxy8hRigV4HO7hEGLBB95kylmcIv0SfIHnUjqfGaazh4VBs2wD
         7Ogg0gNyJ16UB05Tg4TdmWPZ4QUPUZXCc/7e+tucPWJMAhIg+YS0rMLsb/DDriI0k1K1
         p+YA==
X-Forwarded-Encrypted: i=1; AL+hErEnB7fdH6G1cXNAowJ/FMY7R4rJWCrguTfdYn4eGJd9Yn6d06wNhbYl2mUyzGf8JsR4GnCbZnIcSmyRVMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7fr37HgwJVLovkl/tvCfT8+OSArR/VvC4lB1gT+I5okfpmuGe
	5dS97QSRLpwmr06w8ZEb+IV6mC+FS9iV90AmEeVYQ9qUrmHogTcRbIB+6OGRdxyHrMQ8eI6VLCy
	xUmUqqniQqIHi/T93KxtM3+bQrxQ+pyo32KD2A453e/G17opElQ19zE6pG03aAyTBdNZNhVMNt1
	Q=
X-Gm-Gg: AYBFou24awFndP4AEiElBmxuEMGXN5sU+nEnnSpTlmlgH1TlFhP/8dfg2W3AJDRd7+0
	C40w+m8p9DdWkBoVCoaUCNKZZcKejz0KuFLC1uhp1OqB7bpEOfMuhFpDdXBDAFb6n62j8ko4C6h
	kADVTJ3DCVfSeTSbgDczTE48us18Et4+vXj89Sbs7Q9NP0e9GfcZb8Hb5/fos/D5SaJlnn7ZcNb
	TlZ91UdOt3Q4Z48z9nZMw4J/o8HWB5OZdoTMfc4r2kVfRbN2W4lNxsg8Aw/Zcm9gJz0Y5gYAB5m
	mWz9U6c72x6zzFjjqtYyPRI8IjRmYrJT9TQFM2d/fucXfG426BpzH4BKMIroR2Ne9VcPjoKuNfu
	yeQmUGIAd77WHE6HujJfCxNhkSL9XPXA0M3qxwRh1qst57hMNE7rUwVVMo4LU9K7AFWtaiC0qR3
	koSsSF
X-Received: by 2002:a05:6512:398b:b0:5c1:4e2d:58ea with SMTP id 2adb3069b0e04-5c15d5f1e4emr2155731e87.53.1794502920598;
        Thu, 12 Nov 2026 09:02:00 -0800 (PST)
X-Received: by 2002:a05:6512:398b:b0:5c1:4e2d:58ea with SMTP id 2adb3069b0e04-5c15d5f1e4emr2155701e87.53.1794502920105;
        Thu, 12 Nov 2026 09:02:00 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab834sm1779330e87.45.2026.11.12.09.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:01:59 -0800 (PST)
Message-ID: <ec4431f1-e70d-477c-b09a-eedc35d97691@redhat.com>
Date: Thu, 12 Nov 2026 19:01:58 +0200
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
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
 <avXoJSGh5xjGFgod@raptor> <20261112164752.GA3692174@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261112164752.GA3692174@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/26 18:47, Jason Gunthorpe wrote:
> On Thu, Nov 12, 2026 at 04:24:05PM +0000, Alexandru Elisei wrote:
>> Hi Mika,
>>
>> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>>> Hi Alexandru!
>>>
>>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>>> Hi Mika,
>>>>
>>>> I want to help getting this series merged, and I've been familiarizing myself
>>>> with hmm and device migration, please bare with me if the questions I'm asking
>>>> are obvious or downright silly.
>>> Thanks for the interest and willing to help! I am preparing a v18 of the
>>> series and plan to post it early next week.
>> The series is big, and as far as I can tell the MM people are hard at work
>> reviewing bug fixes. It might be better to wait a while, to give people a
>> chance to have a look? I know that if I see a series being reposted often,
>> I am less inclined to review the patches since probably a new iteration
>> will be posted soon. But I can only speak for myself, you know best.
> It is at v17 and it is still getting high severity sashiko errors
v14 was first that sashiko managed to review. There was a regression in
last posting, but also false potsitives, and sashiko reports same issue
then 3-4 times, so the reality is not that bad. 
>
> I've been ignoring it until this improves..
>
> You really need to run sashiko locally and not rely on the upstream one.
>
> Jason

--Mika


