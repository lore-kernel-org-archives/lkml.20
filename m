Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910663;
	b=wZLFh0qlPMwgAbfEDlx3MXfA8eW92ldwaTu3MTkIQ+0Tmz1JoilaTyJb9iPHVvTN7ftl
	 J2TukWpqALdfbmQng4nmzdDFSApKbN0pyRV7+LFSRVJf4vnnZScEx9NnHLRenLro9bROw
	 kQ8h77O3opmab4qDqoYuTTTS+akdUHb9of1jqjlOfmVJgxd4UBRNKBLr8fTTnsFVoP90K
	 N0yejrNmbat9ru5TCFFxsxMe9o9/s5VvVnHBZTrn15WYIBwNEbf/SKKP9p8arg5YOKMK4
	 m+KVwsBUMb10c1sHFDHEvjQ/uSfcaEww0vajP1iCafpoFmsJS/QaUw8hnj6v084HDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vn/nQy7tt6P3ngQqcb52WlxWUAoV6PqlWG/Vx0RkwMM=;
	b=VQ+qpur6SmCn8/yYXsOJahp87kd+Zl390Ur42k7AXCh9fO7TMrVk7dotjeyT+qo3ay+Q
	 Hx8jExCxgwMq3ITrqZVgtgtGUtlpH4Caz5hUSVf6bdHr1lzgERxuAU7Yd/arnTJo4VioA
	 OqdiIgKv8MgqvoYaF9gjYzyRJrdYpapEV2s/DlKHIQUvpxlaRUSvfc2JqhCLJUFk1++4a
	 GhzAqmRyBalXcRHMpc1llt6IuDXJdc05eBlMhpmOXzaAc9fL70Xt/KJhc6FpLNK0dL/xh
	 I0uLSTGmDgHygbB+0e5Z5OLQdznAt9LivKUI06MHv+aGh91xlMpee0jodpji6kSDjEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GB4Vyiwt;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F312606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F312606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GB4Vyiwt
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c3cecbda48so658375137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793910661; x=1794515461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vn/nQy7tt6P3ngQqcb52WlxWUAoV6PqlWG/Vx0RkwMM=;
        b=GB4Vyiwt5uW0V8lse1c3JVTIcjdYwCfzDi7ms6JirgIiV1XZ5xmCWALwaQI+Z5DkVl
         zqeI8t7tQbjcHdnzqj81OD38fGa0tJr/VDd51xozJWTYgz2a6kpRKU39Z7j5tFWNdr3h
         IlWW6rRHz35ntWDyTUhWHU80NWcqVivyAFXGbTt/s/XKSQp1WCy0b7a/t95WoCEvr32Z
         mBeL4GCHxWyznYCdN1cGfUJXo94un7iR8QgFQYTetODBOB+6GZkK2m9qjnyBHlZnnYQ5
         OCppFK1fTM3uS6RN/r6T0SWssQMIrs7tA5bt9YnfILWKR2UTcTHFIuyOTD1gwFZuhUxt
         Mt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910661; x=1794515461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vn/nQy7tt6P3ngQqcb52WlxWUAoV6PqlWG/Vx0RkwMM=;
        b=z9KL8Fg7H7ZE/yn/vuFKKiEpVvHryRFREfYDdpo/4ldhLwkWEzFXLzsKdzQVhXo4xx
         SRuKs2kKeaeGyuOg6B+Fmh2nQje0du83CDOP+W/koMLaOKA8tqbcBDx87A3n+8mxzSsN
         wV67OQNsE4sbsZcRwPFW6YKypiOIa08GGnkuttSMxW0L5cQM+eeBEKK2Qju+3D3bl8hh
         8JjWPLBMJQID8FB02fFJBpIq1mTo4cQdb489HuOazuBnc5gpcNNjUP4QAytw9IivXpMl
         ocUhQYTDMcIIzmtrjysQPmAzUXLu3SCGtq7020dwx9fNC6l71q3Ev5xXlVv5Acdi1rYj
         NaJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDumCTxmfDjOynvjafvM8/v4OWl40fCDO7Axx5g8LH5JB3BdpgWaJe5LO7Q/MLHgaB8KuFZrWqLP28SMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k8XUMySfOa9qe2mEtGb6tFlibYImIskx67RaORJL+1pd1j86X
	TsXzlQZ0cEkjid/rQf+l9wo0YBnsLMNTrM7yEAS3PkgbjfHDdeEWNYpfvygGMVpZXFg=
X-Gm-Gg: AYBFou0DrqgTyHgbZ/TQe3G1R3YygGFybwQPor6KtT4J214dfPoCCDEOXIUJuDxYu4r
	XF/9pQNHxaFXXXhf2ntKL3CyaqbCBTdc4MEobVkQN1asXrYzZxPuMYLhXUQgz5FPYu1LY4xKxj4
	Zaaf46usIkLj5ojtPwzBgkvafRAx8w29ZcRk4fdSl7gdV6UeLETQ/NIiYdOymIku1axLR39mJn3
	bSmuXB52905x04Ik7wOfczdJ9aQKGITIx29keN0fakmTg3wOY9rcnSL34Vx3jSsm9ytjBHS4Df3
	X/+3pejBVuukOaXYGJ5Jp8IeKysWUMV4loQHr0+X30gCa2xl1JRdPN7B90xMdPNedhRRjzjpmCY
	Dcejkx9x6Mrq3rHkZmRwyi1j+oWakIBo10IHVtCGqPz5lmdDwsSDKQp7kQhHEN3113GLJsLpA0Z
	xmBrxFlBYp4EiZ6ePcKAwAG2J+Ms6iiPV+JDQy5i6Y/tkiQ4LmQE4YB2K6inNF+f1NplXB4ffqP
	fWulVlbFOwavWyrWDNTZdWVFSrKG90mE5hBf5d5EnMoIFCNGI9t6OJYzjK9JPGFYQ8zgZelAYKF
	caLBi+58lLkEotr5+PoZYXxNAFzFfPVCcMxXiIjzkvi8Yxq1qVpi0FgltBh0G1DsgJC7hQ3q8qX
	Pbcd3+eoX9A==
X-Received: by 2002:a05:6102:e0b:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d2a165f989mr692943137.32.1793910661522;
        Thu, 05 Nov 2026 12:31:01 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm5070410137.3.2026.11.05.12.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:31:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP46u-00000003hoW-1qsZ;
	Thu, 05 Nov 2026 16:31:00 -0400
Date: Thu, 5 Nov 2026 16:31:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>, iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/hyperv: Don't free a paging domain the
 hypervisor did not delete
Message-ID: <20261105203100.GG663069@ziepe.ca>
References: <20261105192738.70664-2-oss.patchbox@gmail.com>
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
In-Reply-To: <20261105192738.70664-2-oss.patchbox@gmail.com>

On Thu, Nov 05, 2026 at 02:27:08PM -0500, Yuho Choi wrote:
> hv_iommu_paging_domain_free() frees all page-table pages with
> pt_iommu_deinit() and only then asks the hypervisor to delete the
> device domain that points at them. If HVCALL_DELETE_DEVICE_DOMAIN
> fails, hv_delete_device_domain() only logs the error, returns the
> domain ID to the IDA, and the domain is freed anyway.

Isn't there a WARN_ON on this path? I recall asking for one ..

So long as that is there this is the right way to continue

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
