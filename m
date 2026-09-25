Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7847D441
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327584; cv=none; b=bEzPmLpsOjgmW/QBSertcvqll9tPkh1Dt4gAE6HySQUJjE7czNY6qg4/BXUek+QqRMuUmGkTbcrTmnd9nk/m5INmMkyGo3m0y8H6OdnEs6OqxknQXQFe8IwEBvOMkIAT6LE0EbUo4vfEIkk4AowY068H2PERqztZJTOnvU7F+Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327584; c=relaxed/simple;
	bh=1Z3pKVsAB7cGlrs84ql54irrn4EOTKXXllBebSmuuGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re+CvZunouB55Pr8ytqZ1Cslj+LYrOXCBlNLybmUoamC4BIMBXKZb/B0/dFwu63vIqto8cAxcnSmimBc05gXn9pjgaaSZ1UGcb8mbMwl6iPQR2XUaUziJlW30K8v5kL0+LmFRF4+pmSIIpjsHm07UwdF8mPZCtrcRaGCfOVIIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7c/UsqZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7c/UsqZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d3b445a84fso32775ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790327583; x=1790932383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CTMJNzZxuTPM6C0AemlJt6uT6H/3eGpfCZ5SiFyGRfQ=;
        b=Q7c/UsqZ+BkPhRagwSV8XfMXx5DdZ+CbSZVSQrztE/7yNTq5cq14IljASBBZEMnTgm
         Kph0p9nJTpr1KABuWWNP4zSUiA7HrHfhpmWl1YsrBkcKjBXZ2agbzXW+TkiVL+1kOr6z
         6ZBE2T+imklmdAeBA6rhzP9y7uth4PApbGD3LR0ROQDNAEg3lUyG3bOrLis/ovNRUekK
         LIi/5N5NTlC7DGcly8cndfcq17wvmfKbMAQaZ3Sau02eXUm2iJrpyFXEcMwQGRPACLo6
         9sSaMeh7CskzgcBCm3sOR9BMOXp/rW+kmrYfZOABWOaN9xtKqlPMEH50wJCtVUM1XdoQ
         3wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327583; x=1790932383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTMJNzZxuTPM6C0AemlJt6uT6H/3eGpfCZ5SiFyGRfQ=;
        b=VkiBU63j50LtAr8uIG1vR+haT49TbyaI6Owu8QHDJgPlzkQPbIPXfOnvnWFc5v5mLH
         Zv8NeOJJyh/6rnF9r8RzXcCs+0C0v4yX0DiJ1nnU8Rmsbe5MrFZ04s8cPGG6DBmX7hYG
         L/ay0YQGdHmV2TcWcj1SU/YY4+47zAc8wwL71oVoQTramboQV9N5bqT8ZKLiQ+yrvnkj
         8nDHlY//WKhkiBkfn4D0Htw5qf7vS5NPtOwb78n2KCVoIPmxqNygaVwoSFb+ig/Zn6h2
         kefjsMu9Y4ekBsky+OVqLaWtSndotvhFUpBuis9e1oHIh8e5MCOrNIM7Q4VF0KQ3JeOz
         OOKg==
X-Forwarded-Encrypted: i=1; AKwUvByiManS4EuBduYj+PyxqYSA0flOx+2zN45qiRYJWpd8mB4F5AcA4xKv/Cia+MMF0F1Ns1UdpTmj/E3ADuo=@vger.kernel.org
X-Gm-Message-State: AFuF++kSCPCiLnn83BYbFnQUrp+g+qeSIdBhe1HA+YaBYgqf2hL7bVEE
	8kwbcLxz34lsiEXnIu/SW+BJAx0792mhhOk1Q3FNMFcYoLBZ32g8UbYDEIzpS5bGpQ==
X-Gm-Gg: AYBFou35s1MRLClOOkTWUhTW9jusXQLx2faQhFCrmh/8Hf8oCPCrJosjLCzNvI/two7
	3EGUOImakuk7b82xZ1/fBWaJlR1BxR3Kn9jI5nV90x04Ih325shGAFulYgS3omyfY7xAxpXiSM5
	TscYC1Mr/e//xdM/neNMGTzEI2yYDOutZoir/OgrUZa8d44nmetDTXAcSoK/KUNuqnQbiwkPMDB
	0hJA//Eh2isKqWh8Zj8LZWHC1kblRPKxCkt/7kr0IB0dhmUm3yu6USctKArhnWjq8OWkRtDRX7S
	bXio1n57WwE59ld89D8SdOuN2ipOSelwLM/3jqCcemIWne1q2mTESf3Q/QWxNY8kP+wnjmrLyFA
	dDsGIQSMOfLe6/l/XBOGJit4LkCNHaGqv6u9Jgg74LDuFMBzgDX1ugP/OwI40HGjF9gePJ0IK89
	tycXcEYN+E+hPO+KnwAhbdMTVLUzwixPDCXYdriXCTKntDYmx611GjuPUwAJpf4MJhc0itdgZve
	E94tHeQnSCZZNxTKCWnNtXM7FwlrY59An1x
X-Received: by 2002:a17:902:cf03:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2df94314b89mr3126305ad.15.1790327582104;
        Fri, 25 Sep 2026 02:13:02 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm3426477a91.6.2026.09.25.02.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:13:00 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:12:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Ankit Soni <ankit.soni@amd.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v4 0/4] iommu/amd: Refactors for ATS robustness
Message-ID: <arY7FeYaOG9oglgI@google.com>
References: <20260910142655.3281464-1-praan@google.com>
 <arUOoLwpfNlIvIXy@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUOoLwpfNlIvIXy@8bytes.org>

On Thu, Sep 24, 2026 at 01:51:45PM +0200, Joerg Roedel wrote:

Hi Bjorn / Joerg,

> On Thu, Sep 10, 2026 at 02:26:51PM +0000, Pranjal Shrivastava wrote:
> > Pranjal Shrivastava (4):
> >   iommu/amd: Refactor device probe and capability initialization
> >   iommu/amd: Remove iommu_ignore_device()
> >   iommu/amd: Fail probe on ATS configuration failure
> >   PCI/ATS: Mandate checking pci_ats_supported() before pci_prepare_ats()
> > 
> >  drivers/iommu/amd/iommu.c | 164 +++++++++++++++++++-------------------
> >  drivers/pci/ats.c         |   6 +-
> >  2 files changed, 86 insertions(+), 84 deletions(-)
> 
> Applied the iommu parts (1-3), please submit patch 4 through the PCI tree.

Thanks for applying patches 1-3.

Shall I send patch 4 separately or can it be picked into the PCI tree
directly?

Thanks,
Praan
