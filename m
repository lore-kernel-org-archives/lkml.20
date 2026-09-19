Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D7343897
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853736; cv=none; b=cRWSlnoBNHqDcZrkykefoeZeC97SedN6hn1FNLIoVw/oYNKVYmZcpstjdwRze7pq05srI4KY4EXcSUfyiAEtKvCyxDoNVcgXZZ3zG9+zsUB5lcS/85dJsGoSRX6JH2NV7rjSM0XToJZVKbWvME3zI190PSSgfAdQ6APADMtC7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853736; c=relaxed/simple;
	bh=xlefR/akgVIwwabPG2m/iCIg0y04aOCKWgO4pB6evyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd9QBW5FihPkZhx1+M7JQv0YAuzO5DSxnWLhZ8u2QjeK79ZzV+9Yr0o6Q1093mC+v6JhnWrvf23RZngak1FoqGSRyM9EP6o+k2ksHDYHq2Oi6O3fBKPIrbwgNe/7D8gJNxWj+T9cpXMjukgUHJHx47f+TkwP8K9JMUY8uiier0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=I8S5QmGa; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="I8S5QmGa"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a40a9a01aso277916685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789853734; x=1790458534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=I8S5QmGaYfz4SbjDe5nKzlFwwmhqmaTx/U86BYp6O1584y3VnBb+c1Sg5PMjgz8vWS
         tG4GkIOIx2Bt+FmVELO+kMG1eAw/N8oDcKaSNf30jJAes99NZZv8KpiFOyHsmSuDeYxG
         0JMSTrYbqPc5C+yOwENGYf9uPNZfEf2PHWEmRORBlWRQ4sertX21ru2dDk/35LhcdEek
         wfZzxQ9NGCK8STBODmALDpNxle41nYAygMzaIUy1YvJ4v2FZUIxzE6+hBBiVG2908/zS
         VhhlE6ZcANtShfQ2nt01zRyIspk2rKVdekzy46snN7p0Odk1duOZVhDUWzDb1ZbxS6e1
         nXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853734; x=1790458534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=m395vk8uSYUxBX8VpVqkltTdj3zJ908MKUuCLHqBUBbJbhvSwfGTdrfoGGlf/yTuW3
         Rtbd6lvCaqfnKLayL+PMH5HxvokfeoRW/s04wnqDVGZbxcPp+5m1fuzjHeuCHaxTUGeE
         SFCpFiwZ25jTjmcKCh60Dk8ZkU0ncKkZLqug5q3ksdAxy1L52Ag5zH2Qvf3egWok1PSb
         E+IrSVceyd6i1OrTUrYhrcekvjUgmM7/QQhyibIVmhUlI/RO752enihsIHo7WSLuB8xw
         baXRSrTb7jJwwTMpjl25dAhg6J/KhArZKo1GXeNW8ofuDQvDBFOPGuZ8ALIcbuJLq/Zs
         0yIA==
X-Forwarded-Encrypted: i=1; AKwUvBw345eIlfEbaQFP+worLbtS5qWeqABc0zDHtuXhkYgkwOzQve8KSapR+AKKZvCTdU3kIwioaqvo3OpJP9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lM2AyLuNU1PmeUOY5VpnbUdYzTO7o/lZLEansYFczPGM7dvl9j
	8jRU4ncIX4f/CGwcFMGkbv4v33vZsFka4DWyDh2V6EKWD6ulgrSyzgwemt446BhX4vQ=
X-Gm-Gg: AYBFou1FXqn3zh527wClUCt46nLP1kmjKPjj/EOwUjYqubFYVhQf+5D3rBGHHXVEekA
	JnMiJyR9eOVA0b+RHG0ce+jqp2iumJ3QIbuMm1WR4jR/CHTkb3FtrLe7Ow3LCOYSqGOkCO1xRSS
	j52txhT/2zjspPAxOhpfXQAzqN62x50vwUinRaFT8rZTw2+mWzBz26TNBFm7fuuiXEhkGiAHrh5
	JhZzy9f/1OnRXn58Is+xPGD7wPHJIcf1rQtSufuxmU4VmZk2QrGYaCuIEfivhdJcLmWUnxk3NTT
	oxO7QiVxj+3zE2OESoLM8l5rqKDaJ5IxGbNj0qTAUFqFrxjthRHgQIxMBupo/8dcNP1EUge7bCu
	+kp74SFEyj2NQjp77W7mBKaeeTbzp2VDMSlahsPNHXiz9mvcO4rrZtHEbMqo49vNdZocTNbBZqe
	gSe/8kTw8q3O41BQn7eZedG/egUEWJ6TP4nV/VE+L0rxS8ruaMPo5oRAHrIOx06h21xWT56m7ql
	zcKiShxQBdK83tWmq2gAnTHJOBL4Rc152kCw3R2oP+xwXAWnafV02eP
X-Received: by 2002:a05:620a:4416:b0:939:fe55:402a with SMTP id af79cd13be357-93bf577e246mr341980385a.31.1789853733973;
        Sat, 19 Sep 2026 14:35:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bed72215fsm275561085a.1.2026.09.19.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:35:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x82iZ-00000003aXY-2gnK;
	Sat, 19 Sep 2026 18:35:31 -0300
Date: Sat, 19 Sep 2026 18:35:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260919213531.GI11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <yq5atsnl47c6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnl47c6.fsf@kernel.org>

On Sat, Sep 19, 2026 at 08:27:29PM +0530, Aneesh Kumar K.V wrote:
 
> +static struct page *system_heap_alloc_order(unsigned int order, gfp_t flags,
> +					    bool cc_shared)
> +{
> +	struct cc_shared_pages mem;
> +
> +	if (!cc_shared)
> +		return alloc_pages(flags, order);
> +
> +	/* The shared granule can raise the actual allocation order. */
> +	flags |= __GFP_COMP;
> +	if (alloc_cc_shared_pages(flags, PAGE_SIZE << order, &mem))
> +		return NULL;

Oh yeah that's surprisingly easy because of how this loop works with
order

Makes sense to me

> int alloc_cc_shared_pages_node(int nid, gfp_t gfp, size_t requested,
> 			       struct cc_shared_pages *mem)

This argument order is a little weird from mm norms?

Jason
