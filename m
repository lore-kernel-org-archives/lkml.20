Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094383;
	b=UfLejSys9bvQi6VaF0UbLR8VEd3xEcfT5mGzHaSJTmlVyQXzZEqQONd1oz9xcWfMH6aj
	 v3f+A94KRjjcoUdEAq2y4L8lnPI1Z11GRVwSoD+Wr8uqPX09WzJv/ZildlJoBaJjYqGMG
	 vCFDCQHL+1UxR1uWriscIO3ungm9LsLGorI3FvkVtEYLX1N3ZEf/EhOYQ4I+B7TMD+OTH
	 qMzTTdtT8CoN8kHUY5Q9Pjs6WyYkjFwvfnpcTZuFBiBRtTJgmUxiC5fRbkeo5xZYTodYk
	 txv+2lyT323l5Vv0CT2QTttVFsP4Jf0A0ATN6VvXAaAu8rfk/p/JFEc1gudKXM4r1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094383;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8rFiTxZOwo2VZms6MC4in4aJ0OzlRUdtTuBeNfB6VJY=;
	b=AH5cgRsqvTHfEo9I0BGBN9pq6CFxh9dQ2g1EbR2vcSU6fX8TtBCKSHh2YImwpVyFPyMJ
	 esfCir2WjAu/e4HLoXVtcmL4Ad+M29xkzqHB4edqSjYiDLFs6BVhcu5eW56IUDTSa+yGT
	 dTSgtQLrBFaoY0IP+RXEMr1gGaKMCCS4vW4WggncaCk7VFBqugUiFFqqADyDlPnXD9ZVP
	 u719SNiNxSWovRDZCMusULRwieQE7rrE6RVfffrIzl7FGeWAH00NRFKkXB4COzqsr3UFv
	 fW3bVlYqNqdazpMmmb1SzMbgrEQnZ95m8HLbdBZteat7Qsqe/DzmPC5AhRFuS1JTOsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1EphzHDe;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294CA606A31D;
	Tue, 27 Oct 2026 09:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294CA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1EphzHDe
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8rFiTxZOwo2VZms6MC4in4aJ0OzlRUdtTuBeNfB6VJY=;
	b=1EphzHDeF8ps+FmTf91CAJlnqWNZeQB2cVJXv7phC/3EJX0PW9FKl2gAJj7pIQPi7hHXCOAyV
	uTKXDXw4ESSfViCv2NMmRVxFxxd4vcsvB6d629RjnQPxW9hiuWjib28DkDH+gruklD5rXLtOcgI
	inLVTEZl4FGJLWN+9hV+PYA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jDQbx2w9gz1prky;
	Tue, 27 Oct 2026 17:46:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E9E2E4058F;
	Tue, 27 Oct 2026 17:46:12 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 17:46:12 +0800
Message-ID: <6e381f14-f00b-4c0d-8499-f5a5f37b2572@huawei.com>
Date: Tue, 27 Oct 2026 17:46:11 +0800
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
Subject: Re: [RFC PATCH] mm/damon/reclaim: allow disabling watermarks to force
 reclaim of cold pages
To: SJ Park <sj@kernel.org>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<damon@lists.linux.dev>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020135822.85334-1-sj@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261020135822.85334-1-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/20 21:58, SJ Park 写道:
> Hello Jinjie,
> 
> On Tue, 20 Oct 2026 21:32:33 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> DAMON_RECLAIM runs its scheme only while the free memory rate is in
>> [wmarks_low, wmarks_mid].  Reclaiming cold pages raises the rate, so the
>> scheme self-stops as soon as memory looks plentiful again, which is wrong
>> for a VMM parking an idle sandbox that wants cold anonymous pages
>> reclaimed immediately.
>>
>> So add an ignore_wmarks module parameter. When set, the scheme uses
>> DAMOS_WMARK_NONE, so damos_wmark_wait_us() always returns zero and the
>> scheme stays active, bounded only by min_age and the quota.
> 
> I agree there could be use cases that doesn't want the watermarks at all.  I'd
> like to avoid adding new DAMON_RECLAIM parameters if possible, though.  That's
> becasuse DAMON_RECLAIM is introduced to let people use it without complicated
> setups.  We will of course add new parameters if really needed, but I want to
> see if there is a good alternative.
> 
> Have you considered some other alternatives?  For example, could respectively
> setting wmarks_high, wmarks_mid and wmarks_low to 100%, 100% and 0% effectively
> disable watermarks?  Have you tried that?  If that works, how about updating

Hi SJ,

Yes, it does for my use case.

> document to clearly explain the usage?  Also, have you considered using DAMON

Thank you! I will send a patch to update the doc later.

> sysfs interface instead of DAMON_RECLAIM?

DAMON sysfs can also do this with "none" watermarks. But I want the
simple DAMON_RECLAIM for only proactive reclam.

> 
> 
> Thanks,
> SJ
> 
> [...]

-- 
Best regards,
Jinjie

