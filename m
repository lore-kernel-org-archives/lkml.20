Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839783;
	b=Pnrc7SZxN+/QZn/YTo/nYFL5U9glz25kkS6dqiqln2x0+MIv2vS49vWiaCv+oTEsu8RU
	 zJSobuuOhe5PJDdwLgsmMdMHF8ut66n+IYZuBbiMhaQRxVWQBeu8Ll7i8mj0YGKc7k5jr
	 Ih+W6fk7jLW2Il+eykDoNPEbJbMperxO57rKqbUX7+wS2W7dIYSVGQqD2E9s4qTvzYe77
	 pVqPOjFcTIBwELO4aJ7BmQ3/XwF1CCL6k2AKRx4KLxbVfiJKP28qBRjM8FabJ6IGW9vBo
	 udewMVkTKb5GXD7IhQpWjJ7IqcRSRYM+7DoXcVX2StkJLP7ejDtL+nZ4XDpHEH4uiMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
	b=vx3dxiXgyvFiFMH1yQv9Y14CvUdeRC2ic/Ki4NGVNnPAlvwj7zRdwF9rFUERhN5Ocv9Y
	 EQD2L0Mk9BQwLHihNeoyRVdNisODwLXaTZxzCXB3vc5kfloAOpEVwewGO76dzNpDyEuvA
	 zuPl0i1wlb4EViBiV48I8GFMWIrfAciyzYsA70wGtFROFL2gnm1vlluaa0PfJBEA3nVOW
	 bwFJTgyeyBnWboOlWLSNWnZRGlkvMS05KmOLWwhJrSiS+6lQpjeGJoHIN2vZwUG/TnaQf
	 ZRDvJNJasGKcwwZVYjv7YSuliN0FEaiTWg9+6kCvi6+Pjb3uv4kkBRVMiReeiWCw0sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C8606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918C8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ec690faf85so423395e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793839776; x=1794444576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=Vrr7HJ5ZqhVHrUH4gQ1nhUYTf6eI4jAFUgOXuIroG+8vYSC8wq9FMKyRpAS0X3S8Ia
         X1WvaOw/i4Kvigi7NNddiUqbBVXB0bl8fUKtHXcRmXnwjafymJGOic0zOT0I6oSflaLk
         NOUATYSym2MCrlG4yos53f9Oevky9c0aEBqEq6qkq82K/dxjsJuVvv0TmlNCrPGnNsvZ
         FAiUD7z3B7GJMVLpYW2SE1rjX1GAd8E6xXhVi7LPD3Ev25HhFl5bCAGXS/2HTyk1k0Wu
         WdSBZyZbyw2N/RIxEj2XlnVmCNcH65D4QX9iezm0KOHSHS4RBEb3WjnO1Olgkp9XzRqW
         1OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839776; x=1794444576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=t1jbawkDwIEiE0lM1HzVjeSBz+4EmCwH7hA6eHyIkeFsq7TDoFOiIBPChv7CsUscvM
         C5McTG/dbPxRd38Fg0hFrjuULu85yqfQLlYYKhIlvK1vhUACLyaj9zANwQZCiIrbVTgm
         jnGOJEij7jakj2C5lmrW5/VdYUUNE6avDaKVNk9jtXnTCFPJkLaO3OGzBoype9UttFMq
         d3tmD6fU9SGxucb5Oc5pKx80DwY6M2R+8o9k/JUrMQMFtgxkenTTKX7XtkvOmqhYaOb8
         omKq9dwOod0tGYk6OUfZIaj6jBroKxhYJjS9iwrF5ABzSjDrAyRzAkYV7SH76SF49Ahi
         WDPA==
X-Forwarded-Encrypted: i=1; AKwUvBzKbnEv8urymp6ieOjW2/LhTQ9Ep06xYB2CqsZ1ALGxKp+y6HNGfMR4KZ98f3Mckv6/0ytps4hRCR1v+Zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dBtdBKpztpNo0QOwlWnVJuPZsLv51wbzIiU50/okvSsFNIR5P
	ViWUgIvh+1B/aVwbvA/hbodyaVMR/hoBN8JHPnApiGVYiSDAheVYqwfykdf2rzWvv9b2NvELev5
	qhAHP
X-Gm-Gg: AYBFou0cCcSHNUEB3wUMjDXwwlDxQdhp1lyD/bjgwxXZMrKuMw9zXJtE4MQx/kinwDY
	pVNqs5EFZVPsRrlOoVIcdb1NndDwyTLukuSYLDypQ1qQiXpWAl5rUadNKoZoBmZ2WRI/fxUWC9c
	Bj8OHVdkiqY+5Rgrbfm75FwOxbPNTf34ccltHaVRavR5APrFz0Ltcpxu5vHB1VR81tnzI0tO59/
	vdd4l/7Bh/97JmXPkGQafWC3Jwc8WTrmYyqiEX7gaVlvbqAstxKL1CiVhHOJONOZoMZ2p/dxK7j
	udin7zOROvrU1Mh7/vG81LUw7RRx+Ifqd45CS+fkki9ObzdWxaAytTqi20I6Iz/MuHKZsuoczZD
	qYEH+FK8SsSuJ3blOiuIbfN07yDRIcekCGW4L/j/v588HGrXkx3dJ/FNzLgB5GHs2c2r9o0PcRQ
	PiaAAOfWCTZqoyaxuOlCbDbRYsBjCorrZjDdvaAZsNX5sfhC7pR9NfCF9pmt6qokNjB1AFFIHdc
	n/mA6eRxzLuyrAOnCj1l219Ls8j6yJH0URxWtX4M9ew/SRKpkD3Os6wLu8yYUw3F6xxSALUTHGo
	I3/rQTzIE2BoLaKxpoqQcLa1sIBGixoPlzdnWBjRj1g5UHi89iadskFaR6OksU6dpgEwoudsioA
	/2viy9eFImsY=
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7d0725e16d4mr6016853137.21.1793839776242;
        Wed, 04 Nov 2026 16:49:36 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9a9ca31sm3266318241.10.2026.11.04.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOlfb-00000000cqL-0257;
	Wed, 04 Nov 2026 20:49:35 -0400
Date: Wed, 4 Nov 2026 20:49:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261105004934.GE3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
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
In-Reply-To: <20261104152351.00002565@linux.microsoft.com>

On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:

> I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> leverage this? Could PCI/TSM support this role without device-security?

It is certainly not what TSM was originally imagined for, but with our
new arrangement, yah maybe so?

TSM basically just becomes this weird overlay driver on the PCI device
that does stuff. Some of the stuff it might do:
 - Register an attestation subsystem device to do SPDM
 - Register to allow iommufd to create a viommu
 - Some status sysfs ?
 - ??

It all seems separable and composable to me, so if you don't want to
launch an attestation subsystem device because there is no SPDM then I
think that might be OK?

Another option would be to somehow obtain the viommu from the kvm file
descriptor and rely on the fd to handle the module pinning/etc. I
don't know how to do that nicely with the way the modules work
though..

Jason
