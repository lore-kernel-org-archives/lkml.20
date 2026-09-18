Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64365515985
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751131; cv=none; b=dx/YyDeqS/5U43TRNg13n/zyCFDq+gMuqfJTpCtlu7L/aAzQEeYolRkSW08rmqnzXo/XnVI+UczV7EjS7T9rtYvNqERTQYCAWnIZUOWBOA7YdzT9vD3kRNrzQe1vyCwqytD5U96lDTbv5PdCblSt/FhjozoZVNClyAWi9MRKMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751131; c=relaxed/simple;
	bh=CJUtrnr9lbLTqP4H/g58GCIz+hH13m2n3S92AYR7A28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFSkWnlwdTv5hMPexadgCfhuSVYxrI5RSAb+Slgg4Twx9VNYUjIq5tb+z1k0mVYnpj3lGQs65HHm++ZTvhXDlr79CcNPuzbD5IGEfDZSGfIfZt+yJT09RsSeHXDPXTHbdX4x6blbVIfQNkdQ70KUwb2mmqqWJxzw7Pf+lCJ0Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Zz16yMCv; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Zz16yMCv"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafddso66377385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789751128; x=1790355928; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQcyEtFjPBr6Six+ddaDb/CoGlSZSKi7ev20pm6BxlM=;
        b=Zz16yMCvY0iYXnp4qSVkoFqfYheoD9f4m4mpImDpG1lBK5zjAXrDhEED+ZfgtMmKKb
         jys1jwEN8feW5ojbOVgRO7XgWW2iy67XVyUkEePMk5Xq6LEVrQtxqWBns2aRZejZ6kJU
         HZ3uRkD5CDOL6CSN2PRfm2xk3H9ERs6jPpBH6GG1MSBQXYB+kTGNA7u/HWhSBwG7Z8Zc
         1GA+sGz6DLtPsTxDCzbUGJ/rXGjWsZvqLvGOJl6akUaZJu/X9tM8vqjyN91+zujqQvdc
         QgrytW/wV/mz66H73GTtDWEYG7ooveG8Pea/yxI0TY3AjvDlYVkLOtJPGvN28tqX534d
         oQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751128; x=1790355928;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zQcyEtFjPBr6Six+ddaDb/CoGlSZSKi7ev20pm6BxlM=;
        b=cGiO6aX9xWKqrSzA3kz12oqTJvhbWsonUOfMwBXBbIcFZwPtktsqanak6QWCdg/qen
         YNoBFPK8tYfO82miLLJexmAKvpZPKD8kpUvdysmxh+5vKP9wQ+/3l99Gs9yY9Z+Rz+jp
         GbEhWSUfEMWgNgXGTvcXEB052NnhST5LprCbYoj2jqYGYzuJbDsR4Dgl6oIQlFNDkjZQ
         WvH7ufhNVmXl2xMI1qSmLM5ck/OZZ45Wlep0+lWMN2d7w4uN/ZOV1uwGOa367jz1vkpR
         ujwTKSFzlZdMYVJ4BU07GB/2Kdt0r00Cf0Dxdh3awcjQBctAh2INaxkLOWy9syD9o8tK
         e4PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpRZzt6QaOTlDp05sytNfPJYUXl0wFmXcaJFqbhaidYiz1d1u/+E3LOk4nGUXIgzilGXZUArbL7K9qQZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqtTPPLbhgLuxyXYd9chE52ADMoJJV4yhSr2w9yzS/bls0p+Bs
	hsgRJFHyBlI7R4WpnmqqfMMq85PCWNdqvtYSVZ+sD13CdTzDEgSep57fWu/NjNwtR6I=
X-Gm-Gg: AYBFou0/R5yojFqI/Uhi65KENiN2alUKEHgMpJn4TkLemjRxMD/u5IKhmq5ILpRI2B2
	VOZek/FLZR4q+5MrVrkO2gamNbzqxaxx6G5nmGOnjcJ+uZxRt2+2VRZjqft4qeN6WJLFmlM4unP
	HjL/gHn4525CBcwbB5Xkd7f/l7XaNA/orPR+lQX28BsOb1bCNRqhMAgUw1Pr0v0hEOychbn5OUW
	T0MOW6wX4upAxjD/UEiZ1/l/PcbAdWz/8z2CC6xC5pvfDFFNUw4LZrb2vqSNL7fxpZdKNS//uAy
	lIZWRnLEmnYj6E5DpNN/NU2wR37W6yBBdTxPbr9qmARGaEcgA6HuV0JG4hbWhmC3LGoJ8Dsd8OJ
	NLQFiHBGB1XnOXDcgZlFkPXBOp1sVNTvC9DFttfD8pE+S/AMMkDnnME+zyE92pDr/jZe/jEcVgz
	emlzEfnqiAPKcui3wsLKYE+I7CrxP5r8bkFQVlzVk8iwvipszNXzzPeoCETgOscPNThfSdpuAoR
	X9DjBjIWNGKSvEDHYVyGMaa6EHjDql8u9p/0iMJp7VdRiSvG+tNXZkw
X-Received: by 2002:a05:620a:440d:b0:93a:83d:1d26 with SMTP id af79cd13be357-93bdc6c7741mr490404585a.32.1789751128040;
        Fri, 18 Sep 2026 10:05:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0cc67e6sm187224885a.5.2026.09.18.10.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:05:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7c1c-00000001zVZ-3Nwz;
	Fri, 18 Sep 2026 14:05:24 -0300
Date: Fri, 18 Sep 2026 14:05:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260918170524.GH11599@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260918121500.GV13683@unreal>
 <b517070d0b9236b03962fcba649faffcacda23eb.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b517070d0b9236b03962fcba649faffcacda23eb.camel@linux.intel.com>

On Fri, Sep 18, 2026 at 03:42:28PM +0200, Thomas Hellström wrote:
> 
> 1) Xe attachment check if pci_p2pdma_distance() returns OK for the
> path. Then Xe always sets up dma-addresses using dma_map_resource(). 

Open coding pci_p2pdma_distance() in drivers is a hack. Using
dma_map_resource() like this was never "allowed".

We've fixed things so these hacks are not needed, the drivers need to
move over to things like dma_buf_phys_vec_to_sgt() and the hmm helpers
to use the DMA API correctly.

> 1a) Let's say the importer (Xe) has ATS enabled, and the exporter is
> supposed to map dma_addresses.
> In between there is a switch that allows direct traffic.
> Now with your patch series, How would the exporter know that Xe has ATS
> enabled and therefore should return IOVA mappings rather than the BUS
> addresses representing the shortcut.

The thing that does the DMA map must be aware of what PCI TLPs the
PCIe initiator will use to compute the proper P2P mapping mode.

ATS always needs an IOVA but that still doesn't mean the P2P will
work.

> It seems to me that a pci-device settable flag "ATS always enabled"
> should be enough to fix both issues?

It should be be per-mapping to support the NIC workflow that isn't a
global operation.

Jason
