Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9702343C056
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600929; cv=none; b=Mqbhl5pdAnNgCKoIn5yTFp+reKDim/STHTcTBamGGFjGDOFqJH0t3yfEytCRWD0y6gmr0WaOgw/nsX20qWqiJVUbZfvUFW3EkmrY9tPnTH9J+Pd3hDH91vHHDk6Epir0dR4ZVTifOLQwTbG/rQNooscm1OBBRxwuilOyjY6Tea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600929; c=relaxed/simple;
	bh=HMf8sz6h2dnybYBuZGK7jThBHP4dhPBd75prPtkOxHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DopcPhFDT9+5r41Zw3Lt2xYJHXPbjkzXZJhS8eBT7GGhiR1bHOE68xQd/gu3IcoHpEdy80+hMAvPziFgsSNJh0wlGCB0C/4SAB+9LFlGhxmlqqyUTB4s1LpImrBzHjjRuLM4zxAB8V4aSzneMO/bvz/fuKjkgPIYu5yjYsMHAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=I6beTdRn; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="I6beTdRn"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-671563fb8beso2732430d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790600926; x=1791205726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMf8sz6h2dnybYBuZGK7jThBHP4dhPBd75prPtkOxHo=;
        b=I6beTdRnHM0vxBbyWAIvdsuliwmJuQiZ1uwYcuF6xAcl4UBeUHjI6jkSbfevKeNiKa
         g92hWx9wOkrWT8CZ+80nk0+QTjNsWHVjROiN8iDmGZh6jX3ivB2Hlb4L+cHPoe6mvGGl
         0m1mseEXm+uVUYzgB7UeDWP3lN5TTpswuh218400/9VKJ5WoRFcwdyenjXShkWtTRLXc
         REB46M7RsmLPkwMG2RGutlPwuH8rnQFMOvleuDoh65pfFBfMXt7mTs1NnKnmTDIO9np4
         ZuFDSXvvkCIoeZmuVxfhoCWuCo1pfvxdcGuPyRM3lEMmfxCJNbVD6bHNiYqLEbJColVi
         YKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600926; x=1791205726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMf8sz6h2dnybYBuZGK7jThBHP4dhPBd75prPtkOxHo=;
        b=wxW7iaDUTembPHWCfuZe0T73RIEvWnYRbgxxMR+fURbHHjIgc/5hNdKnHffqev+Hte
         1buVWxzVpck9UPoipLCC0uVgJxUy7fMAqo751L4L5W2z+4xoUyEG9b1Drwj+FE+qpivr
         gdXjLxn5EJjmE5PXDWTBTn+NOo5PNce3zK1gT6pCCmgTJpaXgV6yRXfr6KTmzlUDrXkx
         ABt/s7NDqWfV5UzRWLsfxhlW7Gi9xY2UBG5xNjeMM/4U4cS3a5Z8KakUlr4SC2YhVWuj
         4w3SAiN6HMnUaNHWKuBxOXoNNvmGcYvtMJGGlQeo5FwWyKs705UEu+p3qUkYz1C4hVQc
         sAWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxkAgn39x1pePGNSHCA8t5aSkiPAGYMp6aBz2EbzhLZktiT/65kHJ0zuZs6LIMDHJnDb3dDSCEOlMNvYY=@vger.kernel.org
X-Gm-Message-State: AFuF++kQpdq82AnWQ6Qd7jPwJxUwot3aqSoS70ctdXHCpuvc14amroer
	hO1Sp5jYYQP0WI5YC7LmZlSEylkmsmoKEEEhtKgqcD0/9BB2OsGs7UgrnsY8iNPkUo4=
X-Gm-Gg: AYBFou12iUEy5+6GTsUPQnkDqxAqSXIob13gF9MoqDljzRj5e1ovMHoRxX6LdCO+jzF
	4Y2Le8WJdt1BDA/2J4aWTqoGX5f0oH5+auVEdx8bgEvJnz89+2/YYMUyHVovPiAHRUZSWZKhBJO
	TnKQ+n8tj49OHCGpuCMcbz96IKJt+OVLSRsL1uwvBeQg0n3BUKF0mzCVUTk28R6oJn62rGpa476
	eRvqjtF3tupNBwQNTBAFVtd3As+ZL0v5l+pn7Sr/o192JFW52SUtsbx/rUVss161YZRDnyKENZ0
	gHgohx5CREHrTPnmEGVo/3YONqOx8tYNNPObjGJvzqDxddBZGxrZtho1ewN5kb4ek4usKllO3sv
	6zemk6dpg4qbVBFAD+DQHcSqPftMtR52ZZemHb0PvxCT8HJPAXQEb69YFY8kVwj2DtdkUa/PgKT
	bvVOZ/PZuw0MujUdzyyKB4kMqlblUF/7FvSyrI5KV6wTOg
X-Received: by 2002:a05:690e:128c:b0:675:40e7:8e58 with SMTP id 956f58d0204a3-67540e7c5aamr1608190d50.20.1790600926197;
        Mon, 28 Sep 2026 06:08:46 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ef28dfasm4604200d50.11.2026.09.28.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:08:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBB63-00000006mlN-3bcU;
	Mon, 28 Sep 2026 10:08:43 -0300
Date: Mon, 28 Sep 2026 10:08:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 00/11] iommufd: Infrastructure for vIOMMU creation
 for confidential guests and guest TSM requests
Message-ID: <20260928130843.GH163130@ziepe.ca>
References: <20260917140159.1163281-1-aneesh.kumar@kernel.org>
 <CO1PR11MB48358E3116CC6CF34E6437658C812@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260924192054.GA16465@ziepe.ca>
 <SA2PR11MB484477E4875E71E4C78854A18C8D2@SA2PR11MB4844.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA2PR11MB484477E4875E71E4C78854A18C8D2@SA2PR11MB4844.namprd11.prod.outlook.com>

On Mon, Sep 28, 2026 at 03:35:29AM +0000, Tian, Kevin wrote:

> Looks there are some resource shared between the untrust and
> trust invalidation paths, as iommu->qi->q_lock is also acquired
> in the trust path. I still need to understand the motivation behind,
> but this can be resolved properly by exporting a helper to the
> TSM driver even if it's truly required.

That seems a bit suspicious from a security POV.. The secure side
shouldn't be sharing anything like this with the insecure side, that's
just inviting invalidation integrity attacks???

Jason
