Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564257;
	b=pec2uZKrfR1dJa9rYVnmirLdkbE18LS6OErF8zik7Tqa4ZAiUEqyV/LI/rexzPc4tfOy
	 fIN/2XTQmK8ET1UHJ+FuRn9sVx9tW+ZQVjOjODh/0b7EC1sCDTwvW1vW4bvgv7odk2Np1
	 FUWnlrrZJLj4kM6AAGPoR+gJeIpL28Pw+a+9ijpo1FwyKzlI452xagHWUaR4W9hiwql/a
	 /fLDjWqKtMLty7BqupGHYC3lNbPEA+VLK6lLG7ijO7Wf6Dh3GKjMmunZRholOSa4OSl3c
	 VdzwIa+0X0yIeqz2BQKBd5Fv6KShI57k5P8eqkUUN85w32UCOtvnHzGrN65M3BRDZTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564257;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
	b=qF+pNxeyWTTowS2ow2UBHL5wXFTq3wR0O5vQGQqzZ4jKyhsIe3u7Bqc61VKA+HKlXNhG
	 OZNTEopA98oj7DBQPjzCwNZeCqqejmyQO7sqghMYIrfiqpZ/7Q20RiGLtmWA8U+0xaP5O
	 N5EJ+9ljSjrCp/nKo7mv6TXt8dNww8QTikxzlfqjoOAiec6OCfF8jV4Vs7/lxc0O8EA6E
	 nKrX4qX79V9WaHU4G0rZldurqpfWj3LSusHc86yd/0ST2OV6EaD3p9PaSQ4ZAozU0DvTg
	 k9zh+YC1zh12DbRTsuivZtUTpGCe8wkPMz4LId7rxOSVfFaUqQsC5zsHhXVcXGGMEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L5Sjfmtg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DfGzcOfJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A096F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L5Sjfmtg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DfGzcOfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792564255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
	b=L5Sjfmtgf4e4hDNvE+6p5yJQnBqiwM9GzT6V5fI+tSqjRLt2GYrAQr6vIVmTj9jdJ+KH0O
	Dp3Opg3BzIlJ/8HYE6QaVWDvPuXLZ0tG6uSjSZo0AViDhTSINxiAbpQlWGYv0IE1Ouu89E
	GmWF9bM1CxxNBfyoVt9gYJtWn3LoKvs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-4AXzajEKOeS2heS7qVzsAA-1; Wed, 21 Oct 2026 06:30:54 +0000
X-MC-Unique: 4AXzajEKOeS2heS7qVzsAA-1
X-Mimecast-MFC-AGG-ID: 4AXzajEKOeS2heS7qVzsAA_1792564253
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so164756f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792564253; x=1793169053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
        b=DfGzcOfJskCS0u7+zgOzyUAY/STLbPd3YOHcPZnjpff0vBl993iwFn35m/iN4ELn3N
         ZE2TFiWaNrLXbIk5Rti4QLczSm9Nc8bVMrQLbap/7/O/ooISJ/y1C2yWDviGWc0F2Gqu
         /24yA4h2MFqCDDBUl3Igrj7cmq16UKXjpMkobpms7aNYU/BydueMTxHR6hGi04YMPKn6
         3b8+7pGGaJYykGWRWqmm8Z24SL1tLGfXp1JxDFKn2px2OukDRjvRxSUbtvCVMg10/40+
         39h7To0hvhImoXTqYyGOhI0qjkRTcMuP0NIRwXIeeKMzrbaf/boji9WJGzsSGi/XZ91g
         HQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564253; x=1793169053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
        b=u18jzHXUeiqv+y2H+vcPxQMT3TXaH00P1waAIbLaK/H3joA3TOYLnqhurFjbouhdvl
         buQjxR/IH8/MonMI0fbs2o0RjuFyo2Wif6N9n9LSnAhyjnjWE9kHwuucApEekCKkmT9/
         S49hxliAOyN9zXEUtSHa/k2ylxXgQEBdfrTysKR1sTkC4/GOlyZ/gC9lI+4ga4UGymVH
         DtRtJM3YNUl9akpRZBVMAO32j5CKBK8fN+j9uxn8nnTutdobLdrv415zkUeWtLPpwV83
         A/sPDiL63P2yT+vYzEYH3968mStw9iunnZk0P/OOqvSPeemKdvgSz3SnKc4Yp0TWM3WN
         rDhA==
X-Forwarded-Encrypted: i=1; AKwUvBxPDAX6SOJ//qq/xGpItD0ufpZOkVPSgb27U5pN/7a5RXrTGVNou6+gBmd8RJgwhF6J6cLgLIZ9PRHKHBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbLI+ZxVU8hh8vPQQMXdWq7akW58zB2UQjrL0WnsAPAEzgnLgE
	RrauBHKD6Jx5DyvsG+H4wA6dI4TxjytUMD4KkYfYIuzkgCBv6ajC73S7denC0XfWZHoyvCyPa0M
	X0eH5RHBR48JJzGWOSxkvv780UQmfVmVkur1OBCI2VSRpCf5eX/0SYgT+sLwoXt7t
X-Gm-Gg: AYBFou1M1HpU1LfdshAqfSkLFLO99q9vuHWS0wiVzbjGk133VJ7C30ysflx2SdrxuBx
	ZGBMj0VlLbBHsZfrRjHpVOrXGIbedfTfvXdf3JkCTUZeTJw08ETwdvqjDHu3wZqlkkd0Q3xDLm3
	w50jGOpnu6wi1jqu4FNVE5xu/YRBhdSLjY/5P3Er1ttPYlY+LQTtFDFG5aeoNXylZCqNjDEprQb
	wM6yfxbkhKQzGgccVT9IUa8zwezRmrmlNx1Krb8GYj4RvY6VcwMDXjI74eU8pIO7Xu2k64rcDV4
	RQqh/KLX0GTbuv12oV+Olfw2fevadkkMeBVQoZoNJU0HAq0sBjfm0H60TDsfcBd3nDx5rT9H4Lw
	PQB5mbkF+lHJLbGm5ZJt59yiyTa+glTs=
X-Received: by 2002:a05:6000:40db:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e2644ef10mr2173424f8f.3.1792564252721;
        Tue, 20 Oct 2026 23:30:52 -0700 (PDT)
X-Received: by 2002:a05:6000:40db:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e2644ef10mr2173368f8f.3.1792564252246;
        Tue, 20 Oct 2026 23:30:52 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm3174366f8f.26.2026.10.20.23.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:30:51 -0700 (PDT)
Message-ID: <7b534ff3-699a-4c38-b6d5-b044383d956e@redhat.com>
Date: Wed, 21 Oct 2026 09:30:49 +0300
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
Subject: Re: [PATCH v16 09/12] mm: enable device page migration from HMM
 pagewalk
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
 <20261021060506.2377545-10-mpenttil@redhat.com>
 <7c8c663f-cf31-40ff-bce4-784726f42a0b@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <7c8c663f-cf31-40ff-bce4-784726f42a0b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/21/26 09:19, Balbir Singh wrote:

> On 10/21/26 5:05 PM, mpenttil@redhat.com wrote:
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> HMM pagewalk has now the machinery to do the first phase of
>> device page migration, collecting the pfns and installing
>> migration ptes.
>>
>> Enable migration in hmm_range_fault(), and change migrate_vma_setup()
>> to use HMM pagewalk path. Two new flags, MIGRATE_VMA_FAULT and
>> MIGRATE_VMA_WRITE are introduced for migrate_vma_setup(),
>> to request for faulting missing pages, and requesting write
>> access.
>>
>> Also, the migrate_vma_collect*() based paths are now unused,
>> so delete them.
>>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Leon Romanovsky <leonro@nvidia.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Balbir Singh <balbirs@nvidia.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Suggested-by: Alistair Popple <apopple@nvidia.com>
>> Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
>> ---
>>  include/linux/migrate.h |  10 +-
>>  mm/hmm.c                |  33 ++-
>>  mm/migrate_device.c     | 562 ++++------------------------------------
>>  3 files changed, 83 insertions(+), 522 deletions(-)
>>
> I got a conflict applying this patch on the latest mm-everything with
> mm: avoid use of VMA_SPECIAL_FLAGS in migrate_vma_setup(), quite a simple fixup
>
> Balbir

Ah okay - yes this is on drm-tip

--Mika

