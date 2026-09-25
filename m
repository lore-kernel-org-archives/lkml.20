Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932448EBE4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331840; cv=none; b=P8hf8v0sbQX3g0HXsdZUw+PTm6SSyrG2Wu4+eoHJMohq3Oz0BjZwvRZPtT1LfFMpxCtl24tRyWePsfcGZELvHmh21L/eVa04S43NfhhGjyieEG6cnt8qGfv+pTJsD/HCXIXqBTobqZZhCtlPKFjCarp12HrgeLV9+aZe9ZYCfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331840; c=relaxed/simple;
	bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRY8D86OFRSB/NppdTLvm2RcDrRqvpQEB3gLDDRMgbeykNLOQ/chEfpvqTNWO1oPqdP5JA52c46P5jeY3QlLgUZMrkQEQ1Fpz+97ix2+a4ycwyshOo01prGo6lmLNx/Cc4r48pr16JNI6NFqVAO82Xon/FNZ+wtlBBHhh3/j/GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fObPrYxJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDK/CQ4f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fObPrYxJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDK/CQ4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790331837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
	b=fObPrYxJ+0WIQLTXTaX/fg0HO5AlpBJJ2bsjD4a1KlQhmqaQn3V11dZDY4od1NiQVnTpZ2
	X2zzKP2beBnt/+ei4136WJcV0EC63mzlcEeirKQPUvJAtcAMoI7vjSBN1n31gPNzsY76Pa
	gbjY0plYyXnUTFHOSGKNN8Or2HvKUII=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-zkRdT5J7PNWF6Mhok5PnKA-1; Fri, 25 Sep 2026 06:23:56 -0400
X-MC-Unique: zkRdT5J7PNWF6Mhok5PnKA-1
X-Mimecast-MFC-AGG-ID: zkRdT5J7PNWF6Mhok5PnKA_1790331835
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a3546bd99fso3348871fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790331835; x=1790936635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
        b=WDK/CQ4fMKAn7KNY/84dYWbGaffTaYn5FwhlHUWK5Tcx10h2SbwVIr5NWYlAWFEBhH
         Zhb8x9Ry0a3xyZZQIaTRcZ0MAh7VnZHUrspP2kxJ1om4scvD3LU4MMUKSBK0+zbIJKzc
         p+2LmCK0MyBpEbNsg6qYS85tZ5SJGI18l/gYBLAmc6cmZNUMvE0BBA+Nt1VH03ihz9L2
         rXo4hY9Yyqc/olj8YG0i4v6uWefyqB+LrXU2y3IMmkXvz8tjdjxdYtg1/PFInXzA1j2F
         Xcg1tbbpQzuWvYc+xmYIJqDoWxBVy1Yuh7j8JSlXUJeeE89uks4UFyjPH0oAIE/nwLen
         Rzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331835; x=1790936635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
        b=tR+/P637NNffd3IXQ9hVOBYFd61w/3KxZiTQ+FLK6zb3+PKO43w1+RPgKg2nmFND4y
         PkHBziCgQI8XRzDod2XRhPn9vXJkX8tdpFmewuIeLLzgn43ldnIAbZIEX82aXyDQX+hK
         AQncvPbRn7tNqSp2ASTLdl61jJCZ9wDqk08+BLlekaKzNd0kVrwV0IP8ipgyg8qbb4xQ
         BklUhpniCg0U/JE17SE1LphKjBv22FywJwygcgGZZEJvLDkfqzYgSnA14srgy5u0x9VN
         QBFTkbh5zv1GmJnAGxTLtIzggKHh+sYGLVduZFOV8o1XwdH6SLgWvY7WKCbOUWL/4UJZ
         t7pA==
X-Forwarded-Encrypted: i=1; AKwUvByzTNYPzkqwFiheC9rCRnFgSE6vmGXbQgR89r2p6yaxDHKzPRoh/rqwpgiaV3GIJGprfONAg+mpAz5p1ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++kx1NczSflOd4ETkdqVTTHkY7h5xDWb1WUMFPoacgzygYh+Mkvw
	NDQvN2DBQ3W2yymPfX70q0fvmlX1lMi6eZP4oFSP/6DoLqCvDlASZrSbuuRGBo6xiEITPpGELOx
	p7XRGQvD0pLjuEOzHbvx8Abw8s41B9vKt6FdbxFvSIWRfoBP3QNVKwNkAktWvQVOA
X-Gm-Gg: AYBFou0pBW+5srnnuanGqKqKyu8/roGF3g0r52wBQJgfwz+MDY3JVIA0bO0IVVgIXkd
	rYzZG/+Wf5psaQZ4rj847V68XnW08JDw4iopXRjOzg8uDQVX/TzpvbqdyGiftuJaCEPfd6ohYqm
	U2VqlUs48YjgJ72Qf/b6RYXYdleVYg6cs/oQfUVZk8bufX14ad2tW+NFI1TQPLQfsxEUMSzq4Xo
	zlpxtjGT16dl1vWGU0t40qjgen6RFRPmsTcGOj7kyh+O1Pf+s1feogO3Fv9rRq9KEM057/AlEL5
	q2hZFX45nLyV9tBAo/e2mNNavzG58SWwvYOQItVDBVgzJVBx9OnW8lzpGNS3O8D4LBqC2sem27x
	jVh+nQ+9jNqKU5hiCrhOG0Zfj7uF6zh4=
X-Received: by 2002:a05:651c:b0a:b0:3a5:dfd3:41b6 with SMTP id 38308e7fff4ca-3a63bdbaf2amr14482411fa.0.1790331834954;
        Fri, 25 Sep 2026 03:23:54 -0700 (PDT)
X-Received: by 2002:a05:651c:b0a:b0:3a5:dfd3:41b6 with SMTP id 38308e7fff4ca-3a63bdbaf2amr14482331fa.0.1790331834509;
        Fri, 25 Sep 2026 03:23:54 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2ea5d2sm4507651fa.18.2026.09.25.03.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:23:53 -0700 (PDT)
Message-ID: <65c5c412-56a7-46a9-b22b-22077a8e9727@redhat.com>
Date: Fri, 25 Sep 2026 13:23:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
 <arY5zKsLuf7f_EYw@infradead.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <arY5zKsLuf7f_EYw@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/25/26 12:07, Christoph Hellwig wrote:
> Who is going to use this? The series seems to lack an actual user for it.

Two users:

For one, existing migrate_vma_setup() callers, unchanged. The series
reworks migrate_vma_setup() to collect via hmm_range_fault() internally
(it sets HMM_PFN_REQ_MIGRATE and calls migrate_hmm_range_setup(),
mm/migrate_device.c). So every in-tree migrate_vma consumer — nouveau,
amdgpu/amdkfd, drm/xe via drm_pagemap, lib/test_hmm — runs on the new path.

Second, the point is to fault-in and migrate in a single page-table walk
instead of the 2–3 walks drivers do today . It can be driven by
hmm_range_fault() directly instead of ping-ponging between hmm fault and
migrate_vma interfaces, and lib/test_hmm exercises it. migrate.vma is
also populated now for free on fault path. These are aimed at SVM like
migrate-on-fault, and is motivated by Alistair Popple's experiments
with  current interfaces, where the redundant-walk overhead showed up
clearly in perf traces. The unified page table walker also avoids some
limitations in current collecting interfaces that can crash when raced
with unmap.

So this is a building block for migrate-on-fault but delivers immediate
in-tree effects by unifying, refactoring and more robust collecting.

--Mika


