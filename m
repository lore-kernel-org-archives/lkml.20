Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250144;
	b=d+YfTq6Mu8jAukBqxEqI62gwwF0WtnYn+bKqlzExlmZAyaje063c+uApHcZwA2i0nGwn
	 KFi3ef9no6XwClVVPp52ZBqOnUl2WN2C3LF2EW4u73/bKdLIHdYkBCAFVz/uLLctu59F6
	 DXgbrJzb9VLzEHpNBsLJZUqzBVTbKJtMlTIiJmMCz7nSmP51KBJ1QMZz2Z2Ih4axe0IuU
	 WnOIVdXHEpGvlWVjtCMS0aXT68ec4+Wt7P9Vo9GJP1H35aRJQuGf/EyPUMBNYSnshzLlJ
	 T0V+yRaZ30Ad7MnyUHjkbd84CKr4UH7ASQJ9li5mKCvaJla4L7UBNWvpyg3KbH60jIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
	b=ezOvabzCRIuj/uiMI1pr1hTcpLCAQevsGvDgdy4rwXoecg5T1x+Y7PzbHk9sCLhQr0xI
	 o9GJaSJSgkj6gw6ex9FqonSynWQmwKnqI0C9kE0dzZdYfwrLxTSFJ64OZCX30wXjO36Ib
	 diTaRNQieZdoaq8Mo5IHG9OgyaYEElkiqY7N7H8453oEsCmXxmgD3HhtIiCundFPV5nHD
	 2t4sua6EBZjCurHdlZ/JDuItoyuoVglHtw5I5aHTsoXq+6cb4HEXszsl7VMJoDAT4+Bqj
	 0eE9Uv6dzE5KhposN8Sa9iK+qXHW9SrD17QSGjsioqlwIOnUZ96NDUMyTx9SuQ+/JYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PuTYdyOK;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329B606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2329B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PuTYdyOK
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533797e72e8so7273741cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794250143; x=1794854943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=PuTYdyOKu7rUl19nMbVLJ6he+g7v6e//cAur3W6t4momB8sYNUVcG6lgvYQzXWRQd2
         wePZJZy5/Izh8q/jhlELM4Aipu2Kq5puT9fASJ7I8RXck/tzsZK36x2w1kVB5L3uvFRk
         yCZ8eBzX92sdtZMINMf4iRP4iSymdt3sV7+lf2q+Dsmme4JB4gladVLELQlWGhTX5UO8
         5gjS4JxeWLhg0KwGwZu9rV52lCtsH+msY+e7JnZinD7YQ8GhOWkxw69O2Z8OZoKSY78S
         rg/ompvsongIANmOMkI5ZtERdMKe9Hsz2Yso7Bgyp2VgeTgP3bwtobBH8NpvH4k6adr8
         N8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250143; x=1794854943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=eZhz/uJw++L/OetmVTCLgj5v1PorYuokFKol+QTD+mwkST8fzUsstPMAZWqckrXVp8
         kPxR3sWTgZ/sKKKArSD7/6aifz4etolgOSQVYDmlYsXSORGcghre14KCDbNLecWrW5A7
         vFJXRWVUVc76KFFmEM3bFFrxcJgvF++WfW+l9KKmd0aXrg765p8fGWLmUT49pwpwwvSS
         cEpSfu4UwM9ShkTeMkh7Pdbb8+hO1fPlKURVEjmOz3pNgsuDT8exviXcBlpmpHyK2lSx
         Gom/qcXkrQYsHjhJsjpHIj2zRY3vcmtNEA459qEjDfZxHu2pmvzXluidUB7lOsqtbenI
         jBMg==
X-Forwarded-Encrypted: i=1; AL+hErFdtW45zPnbTY3WExgiTBAsJ6vf9b9RPCaC5FEy/JRvWCL+TsZc/BIXLvzDO7aRAr9vJPXSMzn0g5jDvHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++5nms4N0RUozVLS2NNVGELLHzEeM4r4uDJBmRwvo9o9IR6jsI
	tPe5lTjEEvTzbrZJOpNYdH+A8xX7hzynEnM5GTlTOgB+dUGFlG9EEfCsLtdj7/Y6K/A=
X-Gm-Gg: AYBFou35AoJ0Y2slJj6TYPMqR1oBzYKST6+hGuj8v7v5TLrukVwiu+PkLfkdDeYWErG
	/sutujIaJV+Y5j2aAjz58pLUryD5+3tG3yedYKpjY2YZgqbX7gO88ChKrHz0oJifzI163ifpxb2
	9tr8BtNOohMkoC2jvPM8JMe1oZ0nY4OPzcCFspj2X7vm7vvAHUC2t1Ogudp97HfIODe3k5OxUxF
	x14VLH9iglw6A8cJE/0T3M1fMTatZcsc5CTRsbLT+5Wl/TQgduHbZBn/vRH3OxC6+2UHlUe091b
	/EhmIg4kuol7i46SfSQRg65dmd3OxtEpMDWH6nvdmEDXUzSWBELRIqWRElkj5ajDqfVX8QA4h6r
	Lj3TNjuA9eE1icJHYGIBmQQu/tnFYPWXU+PmKcKWBtCMkWgHlSeDuZHuTF5Q4KRhypPu+Q6BCOA
	Lx94LhRf9JP0hj/SkaPuglyM/nBoQrk5Ntm71lHTq4ACH3ICzpJX0ABSfP4uapK0CwfEDSScL+4
	9rL6HwBdBOFyWfhmXMJDuB6OMe8Vzt0vKt+q04OIJdwnbSgS7wBueyRekh0Md8Qgk2xCefq4gHt
	q2khOf4I4UxOLP8HJZTJYoE0QAlfPmnrrn+B3rwVIwDWbtqT6n8Bvj76XAqsNXyL2WFzxHmb/tp
	duZhovrqUXYXubpwNlOjjVokfApQ8HLs=
X-Received: by 2002:a05:622a:40e:b0:536:3600:f0af with SMTP id d75a77b69052e-555253df92fmr3996711cf.7.1794250142846;
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af60493sm3967801cf.4.2026.11.09.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQUQP-00000002A6b-35np;
	Mon, 09 Nov 2026 14:49:01 -0400
Date: Mon, 9 Nov 2026 14:49:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
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
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261109184901.GQ663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
 <20261105004934.GE3889730@ziepe.ca>
 <20261105091622.00004a9c@linux.microsoft.com>
 <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
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
In-Reply-To: <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Nov 06, 2026 at 08:03:48AM +0000, Tian, Kevin wrote:
> > From: Jacob Pan <jacob.pan@linux.microsoft.com>
> > Sent: Friday, November 6, 2026 1:16 AM
> > 
> > Hi Jason,
> > 
> > On Wed, 4 Nov 2026 20:49:34 -0400
> > Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > > On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> > >
> > > > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > > > leverage this? Could PCI/TSM support this role without
> > > > device-security?
> > >
> > > It is certainly not what TSM was originally imagined for, but with our
> > > new arrangement, yah maybe so?
> > I will rebase on this set and send out patches for a detailed review.
> > 
> > > TSM basically just becomes this weird overlay driver on the PCI device
> > > that does stuff. Some of the stuff it might do:
> > >  - Register an attestation subsystem device to do SPDM
> > >  - Register to allow iommufd to create a viommu
> > >  - Some status sysfs ?
> > >  - ??
> > >
> > So we may expand pci tsm to have more than one role? currently it has
> > one.
> > int pci_tsm_register(struct tsm_dev *tsm_dev) {
> > ...
> > 	roles = is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
> > 		is_assignment_tsm(tsm_dev);
> > 	if (roles != 1)
> > 		return -EINVAL;
> 
> Not sure what'd be a proper name for this, but it sounds to me that
> it tries to over-abstract something into tsm. The reused logic related
> to assignment or viommu is relatively small, so the other option below
> sounds better if it can work.
> 
> Or it may be the original provider framework that Aneesh proposed,
> so tsm/MSHV/pKVM can each register its own backend...

That is definately undesirable for TSM

I think the very best answer for this is to get the viommu from the
"kvm" fd, I just don't quite know how you implement it..

Maybe just register something like a notifier chain where the struct
file * and the viommu type value goes in and a viommu object comes
back out?

Jason
