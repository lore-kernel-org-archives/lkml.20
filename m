Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E449A3D0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994249; cv=none; b=o2d+6rBZcX+z7XbgF+XtznGlWVusjTQ7KY4wtXkMaQSYMY+I+XJmHh3VkmnARRuKg84C9Qg3SHA4f01sojJc+dvawUw46HSO4CEZYyMHvV7rKIbx6gGIrQrYRK+h5+KzCUhmn+dtzUFT4dj0UQDhn48blLOE0Zx60TlR21Pj4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994249; c=relaxed/simple;
	bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7gUQChz86EafAr05A6furkKJkPpkQjtvYBZDTuzqjJCmqUvYHWlnw7xU5pHc8JTx5Ofak3lZM8L8YHAuWeBduSZP5r17HiZC4wkSpGVYH3GXbrdLUc7rZGGronzFzfCcfy4yLfSiTLq+qoBvlgBP5+/0PJXNX/n9N5VIPHeDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oN033HZM; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oN033HZM"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb7692a57so37001671cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789994247; x=1790599047; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=oN033HZMS/5bYSrYbD4gzqNUnRjYu+yw5zk+xZozjd37DJqZtlQFpWHuFSXca+bKnz
         o13zqFRVxMOra15dQvI1CR1XT07RuT7eBvGvmeW4JApE0O/wOH0giypj9lg0CAKONZCJ
         102Jz+gYAFkz3IL+T+pqiLpyUf7cSapf2gzw5ipBuhJQGu+U2a0CIOP9OFGEZhiLoozG
         P+wp9n6NTohnAT5nhZ7DiiNcrZehOf86RMF6c5de9Hv/uI+h+68GL3vvuXY0UpRij/FI
         4XAxgiLfcn0kdL3CMicLUPkoouILEyvKc24demJ7M5J6wxyodL4w6ehZ/JhlX4+Gw05a
         tmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994247; x=1790599047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=Tx0FwD8JK9Ok1Rv69m7fQRw+OOEaguf070BKFR1Qer/HL6Z+YogeVRZn3mzNZ+QASc
         GQH7G+99tS2DIUZW9ewoMGAqE5eSOlWwQ3QrhSwHnD/j/2wTSyJRMWft7oQAq1ePQ6+T
         P2JWPBP99EcT266Dt/siFUt7k7+/+8aRMYfC84XYJvdDzuZ2++A9SQVUDGdZBcZ1pwn+
         uDIgw0+rWikf/wtzKml5x11CwANx1y/exzFJztvNT69xVySE7e4FXqvzwpSpjUGZ41mg
         hmVYRVsYZRDolYneFGHZslcaUifbvYzTl2D91MQoYqddxSS3TTTlC82plyDI2bWpRXez
         Yn8g==
X-Forwarded-Encrypted: i=1; AKwUvByLfDhlSK1Ql8od1lJURMTPaz9K6O8Jgn8nJDeQCqxSuAUISeAjWKlnxTGkTe0onmFlJJyDsIVHs5wnIbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l7eMyxmIFxsXHSlbDah63n+Hn/OGTvoST9j0xWwin4ILm73e09
	LFBXQHGogmqI4w3AvKsGdV2O49dA9TrZqfLSfNgxwUhOK6KOUOoN++wlBiec/bTXCik=
X-Gm-Gg: AYBFou3/ZUo4eIpl9K3L/dqZl+iG0wtex9E2WS3oBMxbuIF1y1yzVEQwWWlDY1K3lCD
	ts5Yx0ligcATdTcHj4mSsHFzyoV5xQjkMGsqc6wVj2maFfQRx6JVyhcqbM8LzVGElftXrjdNvTO
	4EclLNoyZe18Q7ovtu/imhxIjJK5nkRHfXpU71IwsZAc2sgZr/SxR6zie6eVkdI4eYDc7KvphVr
	zWUmVS5LS1ZDlTFf7i2hVAmJhORW15nM3jzdQRQhvwqYgZHpQhnjIma6waPuAvBDRq+bX9V0Wqn
	3O30tDieaq9jhW+rPrPeM4RpUWFzZ4ppBeXL65tkpx+ll9+SdhrggHFvL8SQzIxLqhPFdlQHVJd
	4wZk2QzIrVcflWjF7d0FpFeFA8hq4HR7he4ytxq1r4w5FeJ5zn90UrrRmSe9tEMqMpMuW5ZJE6W
	T19mjqA/TP6oNGRjRZOdTuIW//RwXgidqyZ/z/g32JmovD4JRaewklXj6vCMX88cd2fPRycyQLO
	kASHzRSZ+ekv2a95iS0YcgkiFT5+jI0AegKYj3IUOtovD7DQ1vBWicND8PGh483RH8=
X-Received: by 2002:a05:622a:1311:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-532d8cf35b1mr4406171cf.10.1789994247006;
        Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae77acccsm63282941cf.30.2026.09.21.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:37:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8dGv-00000006HZy-3ljy;
	Mon, 21 Sep 2026 09:37:25 -0300
Date: Mon, 21 Sep 2026 09:37:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
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
Message-ID: <20260921123725.GN11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>

On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian König wrote:

> I also don't see where mem_cc_shared_granule_size is added?

Patch 1:

https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.org/

Aneesh, please be sure to use get_maintainers on series like this so
everyone gets cc'd.

Jason
