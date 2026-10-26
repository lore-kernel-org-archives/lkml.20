Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025482;
	b=tgDjHymeKBlbeysioZC502/cDw6tKObPCg+y5m71LhYyasMZEJz8aNBWDS+vIzMcRve5
	 uIhwlINLZt5cwjq7EF2eUWYeEjuYA8uZDSNVplJQ/OSMgDp8vaubOVpiQ3S49u0PVxKm2
	 n6jPN8YB4g7yTFZnVIdrumnnuKIN5kB94zvvAAYF9PcOgSIuQHnBnZCpfy5iCnw8UsKGH
	 fCeuA8nwYJUxV092mY43ZTIlq5DoKqnhVaEIwLxRRoG5vvSmAi7DLVmEnOjN2Cg9QnITk
	 OSUSc7MbhmMjUCEI+IzvzvoVL7niCrka9+9Kbmi5r6YOia52Gasqh2PUN8i0/xNrr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AhMF1tBfJ8dTRfzIo3kwEYnuOUaHaCo5YpY+nl34Bcs=;
	b=MLQtbqgBUvKbmowec9H4fOib9EyvtT35k9Lod+uTrwLVDeylo04Gjzzf3/Diy/WZhhC7
	 owS6tAhvEx8/0+Q05qKSUjXi1y5WegwYnK9Tr8E5HLw8m+8JV81OoYu6ufY2uhV+iMZB/
	 koULwgm3arIFwTO4iiIeo5E6vj8rnyj4MmjNFgR9nS3QzCfW5R/5cNf09iYJzQONSkCO5
	 mmbulRKvQGC+2kbgTXi4JpgS9AxkEA0ZwO1RSmi8pruPLmkviZkt9MbGqL2XKSXZtVR72
	 fpO1cybhGzkQ3arJ6A7SE5+4P9bksIJJ8CYdksOn++fac35nGU32aZOhUAXiiyIWJtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="ikjfWv3/";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255F606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9255F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ikjfWv3/
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b52ba422cso20750446d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793025480; x=1793630280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhMF1tBfJ8dTRfzIo3kwEYnuOUaHaCo5YpY+nl34Bcs=;
        b=ikjfWv3/FIpguoDjg9IBardldZle6sdWRDV2pLk9e03TKQzi8Ik7+/HfVuyBfyEAJC
         5TPd2cjsdfTJIWIGOEc0Vqlrty/ZfVs/2J+jDDCEOCj0pXmSYHQVuN/cskkkcYkYRe7z
         8CCuKHjCYVRyQEDsZXT77jDHMdmmXxXvbrx7jm1Iv0v8uAXt8Wrc1XiQhejhUrmVsl6P
         /YFXTQ1XLxwpAvfwX+UsjXW3o6OrUM3l6BtEpUTd17lYTmSgTyvmMvOOBU5vGnyBZa5A
         q4KCqj+vdhVW0L80IqRYrdmA5NH505b0wJQ8ciN0TeQYuCytGNXkrlABYFfdhUsw5Hwy
         vKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025480; x=1793630280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhMF1tBfJ8dTRfzIo3kwEYnuOUaHaCo5YpY+nl34Bcs=;
        b=xy+4/oWMzKbM+7PETtk5c6bSGp2YV5AXM4rn2T3nwoLRGaCW07cWZqYN1Gf0t3lIzm
         cQDHya8fFRxBeR/BcHIixHUckYf7a/0PMoDVe+hYCrXUnUgJtKtpJ2OCLqhxgfIn6zqv
         qnRCeT7Fg5OlWdC3ngWKvpnHT78zYLStvsVxy5BheICPKOa3G8LjNGWEMia8ypLRTwNb
         RoGmDqEFZtOEUssNLRYxzJXEfL6xeGm33mJL5a73CKfxbamhYknEXBQIiN7Wf+nm+9AU
         d0Yevl7Iq3jnDPC6GJGSWMDP/ClnIolTLZ2ZDc+wV29CGa4I1slifq7Mpe8ZDfAiwPtc
         +PoQ==
X-Forwarded-Encrypted: i=1; AKwUvByl/ySe8mgAz52qcRBg5+sfxy8+Azn7vnj76UrtmX0VffPKcZeuly8UaFrs+1ab8Xc10kstzoJA5/2E2Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJYqyGQSqrdIMisRkcedkxhIoed2jLVvboJyrN6LQRRF7qQ16c
	4N2UE0JWcb9of9nArqhMwF0rWh3CRMV9u0xq4DWM2WvfXao8vmyWmff/yDKLkVt3N2I=
X-Gm-Gg: AYBFou3cyjAFTLxmtyEsNaG70z1vIfvPexf9r0+eC7wu6g6FkoKgcYSvs/pCltH3gd/
	bM2RDQm7DptTE9O7B2DJNOaJE+2PYVqcIX5hrRR3/ZE3Iprba0UApCigWUhagWVIx65GTf08K6T
	36TyfAvl+Z8Mm1Mb62cyLbYu4AdMHxxpSxT9cAnvFdX+u6CrHcMB7oO1HDyLgvugDnG3FI3CtFa
	C9jcwqcSd5j+yriJ5d7ankG+gCNSsXMx9KGoR5UKMElbGdueBnCtMlATxerLx8v+GkM+LjXUERH
	7p5nNQ/0xGnitNAa5ACcU3TEv48fwBlBpBVz7Rr6Lju4/mjSEaN4lgAq6qRjw3Vva0BsgEmZ4ql
	qjDWSZ9bA4coF7PgefNC0DHniSloAvSa8V/gbkC5E0D3UR1ZFBW51ftz/ndTPf4MnZQaq/+yNet
	zskV6ARdoshkDa4G4vM21HfuMf9nBuPxHdFrD0IC5wSl74s2AkSnii1wh+MmhgqbSrh4EVFFLu0
	YpoPj9GJiUfBXpS4IssB2cXlxMhufP9E1TGV87Z1yCtqrqDypL4Z6H7n4IiDNDkB7tWwzMHBffz
	N3qqAFbN0C3lJJ8cfZ2G3tFDvb4GXk1CU+ZSSg==
X-Received: by 2002:a05:620a:6881:b0:93e:74b4:3115 with SMTP id af79cd13be357-940ef8db935mr956013785a.38.1793025480452;
        Mon, 26 Oct 2026 07:38:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067c0dasm697089185a.17.2026.10.26.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:37:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLLpm-00000007425-3W6s;
	Mon, 26 Oct 2026 11:37:58 -0300
Date: Mon, 26 Oct 2026 11:37:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Li Ximo <lixicaicai@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH] iommu: Guard iommu_group_first_dev() against an empty
 device list
Message-ID: <20261026143758.GA1674867@ziepe.ca>
References: <20261023065705.2854692-1-lixicaicai@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023065705.2854692-1-lixicaicai@gmail.com>

On Fri, Oct 23, 2026 at 02:57:05PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
> 
> iommu_group_first_dev() calls list_first_entry(&group->devices, ...) and
> immediately dereferences the result with ->dev, without checking whether
> the group's device list is empty. list_first_entry() does not return NULL
> on an empty list: it returns container_of() applied to the list head,
> i.e. a non-NULL wild pointer pointing at &group->devices itself. Since
> "list" is at offset 0 in struct group_device, the ->dev read then lands
> on whatever struct iommu_group fields happen to follow the list head,
> yielding a garbage struct device pointer that the callers
> (__iommu_group_alloc_default_domain(), iommu_group_alloc_default_domain(),
> __iommu_attach_group(), __iommu_group_alloc_blocking_domain()) go on to
> dereference, e.g. via dev_iommu_ops() -> dev->iommu->ops, resulting in a
> page fault / kernel oops. An empty group is a legitimate end state: the
> list becomes empty when the group's last device is removed under
> group->mutex, and nothing in the helper itself prevents it from being
> called on such a group. Note that the sibling helper
> iommu_group_for_each_dev() in the same file iterates the very same list
> with the empty-safe list_for_each_entry(), which suggests the missing
> guard here is an oversight rather than a deliberate design. This
> potential issue was found during a code audit.
> 
> Fix this by making iommu_group_first_dev() return NULL when the device
> list is empty - which is the semantically correct answer for "the group
> has no devices" - and by teaching all four callers to handle NULL:
> __iommu_group_alloc_default_domain() and iommu_group_alloc_default_domain()
> return ERR_PTR(-ENODEV), while __iommu_attach_group() and
> __iommu_group_alloc_blocking_domain() return -ENODEV, consistent with the
> existing error handling in each function. Behaviour on non-empty groups
> is unchanged.
> 
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index cd1bca7ed..5f26785bb 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1386,6 +1386,8 @@ EXPORT_SYMBOL_GPL(iommu_group_mutex_assert);
>  static struct device *iommu_group_first_dev(struct iommu_group *group)
>  {
>  	lockdep_assert_held(&group->mutex);
> +	if (list_empty(&group->devices))
> +		return NULL;
>  	return list_first_entry(&group->devices, struct group_device, list)->dev;

list_first_entry_or_null()

>  }
>  
> @@ -1723,6 +1725,9 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  	struct device *dev = iommu_group_first_dev(group);
>  	struct iommu_domain *dom;
>  
> +	if (!dev)
> +		return ERR_PTR(-ENODEV);
> +

Are any of these even possible to be called with an empty group? How?

The giant wall of text at the top failed to explain how this could
ever even happen.

Jason
