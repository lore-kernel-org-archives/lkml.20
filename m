Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379513;
	b=ba+BZB2lKQlD1uRJh02QxamW0Bg7ePgosEQu/YlX/RhDOXBDXpI6qD2lq1qTCzRS3LWw
	 K4weKSFcEUVYoUS1Qpi4jPxHi9oHIHu2309gf312VHeDA4YkZcTag8n8WTU1P64z4p7oT
	 tOYOEM/yBwZSItGMXcz3h0Hh2wTr+w+gYYFkEr/irS+3QLIHAyb7Fv/y9Eu7ueddNhy/d
	 gl/3qk2QhAwJz3NqWXWtuwlYvYjYWLBWwMeOxFyFQhMaU22QeHcgFLl0GIaG1KTBrxXzK
	 6su8j0ufdZcUYVtTNcPYMfyudOvvbvcx44lnryYf5d9bavi8oKqlvZhjCpmsnNKI8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
	b=otqE/TTsAOpT0zHmr5yTzZ8HIfZsviY4kX4mt+wUvhscK8zUjKjUvlMl7aRf6B6wFXOz
	 5BgAnxo0mQRfN5GMBmk7A9FSBJ7dRlFOcPJSV3a+7WXCpLHBmKILIDSPm/f0lfh3Mb7yJ
	 zfn/1NyQr1YSPzG38ZmwUr3ok08chvMKra5IPAePxD6/Ql2dvvPbUT1PjZNN5zwivvNkX
	 ubobw34Ao9/WIaUuZSMLh8A1JqFs2ok79+nkH0ha8hVnJKLGlqYkEYfYVxsU15pM5Dktz
	 /w5s2nwOPCPMGx6NXIDQLTMCz193WQm/zbJh8WBguTIk3uZPRpokp/QiPt6cvCVuD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bhjVVBdq;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC1606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bhjVVBdq
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91bb5795792so10857086d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793379506; x=1793984306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=bhjVVBdqP0p5ncqFTagx6Bs8saftcLn5bietHySzPVy+OkEz6ZQ9M/fOli6KxslP2k
         EkGkkKWXOROR+xZ5Y66zJosRACFVLr3t/huYutlqxtRTvemmBSyY8XCDaB4+AHAme/cE
         TUzJOIx69n/1h++BVedB8bNC+bSirPirKyjQj4ta1JNOyf0n7xCiBi3Sgqnppr3n74jW
         MRXn8TAOSdTG77kw9kIjE6+ApVorj0R20JMOvkgwCfupAdhbz9Ne3709GxfyCy0J6QCA
         hcNNS7dNywL5KAaD63ZlJ3I9EzgudyhIHPI13g7bUNcUrkZTtmh9+K8wnpmq1kIruP9q
         kJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379506; x=1793984306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=1hcucUM4VEBucBzsL1MU5Cr7r15IFb8tflN7bY0/+nLQ6q7Kd1UEtYbduyl/EduZZq
         sOuKhDXRONuWWZf5QyEg6SoGKNGiMhUS688uuZ4z0HtTFCaw8hKefZj6rELGbMxbNr1D
         R1iLkkwfNFTwB4uZ7/KApb/mtZPKUCpWkxuysmTXg0AO8ODIZ3q+OQeT5Qwui01sCGGr
         zbzQoblSoOcChuljGGJD7P/P5EOLc9QveatAopHu6gSwAkQQvUZI+mb8pVHWfYL0Fm0v
         gPvvGWWjdTdEMwsCJYCsiyH+hK7yHYmTt4CBmiJmTBVxkLMlzcb+3tMevwOhQoDhd7KB
         fTOA==
X-Forwarded-Encrypted: i=1; AKwUvBxDhm+obWkIAwxQiTsTzvOabGJYVqDQ1U/yA9gaLoFAX3ooE5H7BOTxx3WwUSXmXRoGL38/sAIG70ojCdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlTmjGrnSVQePZYUGxoKJL+Y9Jm3KMZdKBevoD0KNRnIQxLU8c
	2htNj8QUbR8VsJqF2bYzieY+a68AMh3riIXIB/8BDB5Is37rJ/NqZ/aXNipwrsQ61MA=
X-Gm-Gg: AYBFou1dJOU2K92ZIRcS6WsB5xrbhjsFlJ4PppzdsSGz0Aww3pLhQ1Mpr9fkGzWNM/P
	zFBvLHNbreLfjUNaxurcJvvZLUP231/TlWjm1/TGcgNRPthL5+FwxEReY5vbJ0qHVxL3kte40Pw
	DIbi8yaLRnLfPV1zy0up4E1R20NySBJl4hpoRLAfHdIP+rmzJW91puXgvoOp1wqloMHpTNlaIsX
	ZSp/dW/xxT+hpxaEV8OaBdPQsY0klUoHG/0MzQC6MIQ/pz8UoopIhM1fHEnQXguzElk6g+emlUt
	fmdizLGJjHo435smeTSUc1GWUulOGmKw8tYKo9A+lR+lbFwjZn5IMJYowNgjX3MWHt+M7k4ruVV
	rQ6o4nPxU0h4wrYQx7ij21A6wzwCcl11htn+fLc9YoX1p2iekmIJEcFQpxOYeVZjfLyBfyYnlWn
	1862TUGrlAO3ew4r4gousljdCD7fiiOpeIykjbiXr2s5omJXxTFecJ4tV/Z8Vl9QscGlP6nJyOJ
	LxX9LgLLUSZLLh+hqQbk7vOwMTLO9G16DolyUzW9yYHvGna7jwsmYjV/Xbf+cBt1/JB8nqT0uhY
	rlVhMPi1F+E8Y0k5k1CYoGUqXeOU2Rn2O+XwMVB48VqSmqVAqUgGyixFSS/tjiFg/uIRf4Ig4Kp
	Rbe0ESf+tFdE=
X-Received: by 2002:a05:6214:226b:b0:91b:ec0b:9671 with SMTP id 6a1803df08f44-91ca4b9a540mr46456036d6.52.1793379506439;
        Fri, 30 Oct 2026 09:58:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca80700b5sm19825486d6.38.2026.10.30.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:58:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMpvt-000000019rO-0nKn;
	Fri, 30 Oct 2026 13:58:25 -0300
Date: Fri, 30 Oct 2026 13:58:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
Message-ID: <20261030165825.GE3889730@ziepe.ca>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com>
 <yq5aecd9aupx.fsf@kernel.org>
 <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
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
In-Reply-To: <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Oct 30, 2026 at 07:54:04AM +0000, Tian, Kevin wrote:

> Besides, it might be a good idea to return an error if idev->kvm_file is
> NULL in iommufd_viommu_alloc_ioctl(). I don't think the viommu logic
> is designed for native application...

That's probably going too far..

It should be possible to fully test most of the viommu stuff without
an actual kvm, for example.

Jason
