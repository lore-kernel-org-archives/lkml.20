Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307298;
	b=ujGjJfek8f+07ete19e7lGPYQVf4NIqY6uYvRcHcTGMGDeWF4or/owTGls1eum3WmsNb
	 rVdi6O14z3fJLeNk0NaokhwCBbw8CschmSylpsNu+E+LVM7hNgisY5ab30PGI+2/QrsxT
	 9yyvCvqz5newahZaKr6fglv4lTxGpS8C5i768H271iMOn6bf2iSYgHQ8BSecjumaSmXdj
	 juGYPxz3ThhH0bwwjxc9MbNSS5iqwuqoiUIwSdtd6Y4cNfO/1A7rX07EukU/8/5BUfmHe
	 MeMIgWFcc9+K8V17paz/EAE33zK0Wt5jklmc+Klq9LAO0kb/9RDy5cwfvPWG8USn7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=;
	b=onMOoa4i/noZFxNMo+/GKyWsUw9J+aQUmhXADrTOnjrU/KsNMu+TJyRataZNDti9THsv
	 rPI9/Drf0gclm2qKuGOuigs+5aTRYGzgB/MertKA2KQtCHDkHYQUHNqF23m4pWAttS3nK
	 QZP+N+M6fJL+SVEDjvUj/mVcNlJfbtR24Ca6oc/65ilCSphUBDGJpxapcI+0L/ZH/rx1f
	 dw1HM2g6yK3J6PqB4RP31LkTpGnF1wlskPfAV4+yWq0Cto7cLmjL1S1yjHlkJbI7kE6tQ
	 LC2ezh17pmChzEkm9yrNHyyKgbh5Og1coqqQtAsL2fP165pwJmmc7H/DiUU2295kW4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZM95Fuzf;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6845A60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6845A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZM95Fuzf
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so27465e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794307296; x=1794912096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=;
        b=ZM95FuzfMMmG5Aa+p0sLLadodynsIav8i1RLQBHHcH18AO3rf8Of+e/W+nayMOb9rU
         oAPMsnA6miL79hq02o50/ORQsTKdTBiYcMGEMZjT9z4zlvbmoixUo4KPO/gwEV9UMzV7
         QdcsnvgX4/g7I1iRsVkaoBa+1COiDfhi1t4uR140c9MsctU/DT6anR3Jt8nrA2q2q13K
         5mQ8lBX7mdNdeHevBXuwPt2Gk0/0yivn+7nFk7WPP0LyB/F4RXqMhMCE1fxzzZY9J+iE
         yqJ2EwIiqjoe2hmNDhL/QGgpePA56YdRB6bCHIxnKvJBPw7J4D/tq2jgd2JHm/XaTI1E
         CUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307296; x=1794912096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=;
        b=KVnyXun5m5yXPFoQqBAr6Tzsl3WgvBEUCSyGU95OwiAuPobp3RhUf1FgELUPc3p417
         OOzdXRG3ttu4gvtEvfqNM5lTSQnFGvwMFNiVbXno5Oi7RmldioDN5vzhYIAVA2Rls6yu
         i/wt9yCdRoHv53E04MSKAmMoLN0wpAF7Jna3AX8g/XUHvzW6v8DqaFVMn6PpPGwpZg5N
         xwADpNQQVsE9DIrOa1oYeDeRXZNfNU+Vi/HyH1Mikerk+aVrCBb3CsC5KRd/NHvgf3Ze
         wjfZ5ErPunPgyMwkoiIrsvaTZ3QCpoqURtqBmnuY58DiKuKgs+7iBEO2BJT4JQdendKn
         lDWQ==
X-Forwarded-Encrypted: i=1; AL+hErECEY8rm6eQtfjCKubRWX9SBfjgMcmB4iFkl7X50mZNCamXB/O+FIWsITANk0/jMEsuPiODD2pUUY28CyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OF/en4RV+7ADNprMQ0yM1spX/xDGfoRRFldebyHzC2GkmymrF
	Y9DcHBEruU8VR8a/tPz6uea64amdnQtM3AbQJ2b9BLOZ6eShWR3c3q44W0tbm3zzlA==
X-Gm-Gg: AYBFou0/d64Q7ceVNeQ/SrY2YHRWO7K94IxATBdETAAWhmJ+3EooOiLtXluD8e28beQ
	rwH9EdYXRcnFWeknhtjVpdEGUM7y/8uUMfJkz09wOvgN4OOb7Qx0FFxvhXjoKZt+rGvzv3dk4Cu
	IT1ltKHbLrkAFgfS3kwqfsTpscKwdlOTlkYMz+ebmPbi848BceNbvl4ObmkB7FzztrrdSl3dsN9
	feRhO8kxaT/enrM6Kq2UFbmO9gsjSL9EHNsfvRkFiaTBmWlvWvbvNUTlikdWywEOpNbiPU7r+hJ
	Rc0td2VNjCPAwvtWvlZLTl88vnN/T3L/bLzNaFlGgsHT7ZnZVHnjkDltNYwSzsvx1g/9oaHxfJD
	s4t/UFbbFu+J4Qj79MnYKGMUz7+I5G2AGLSDuWL9E+IhLlCbJYrL/CAHHpBacxGhsqXavvnsHYQ
	iLqjqicMYZj3Z2WumVXMXimh+CoNAdW8lPgvbzJS2ZOeIkMavcmuQnOM3VFL41XK0YzezXDEQT1
	1LB5GUuoZONDVcMleB7W6nAY5TeatoDqRd1LKWWLepV9e+ozQZyElzGlAfl/UuKyBRkzH3t5jW8
	pQM9UZfNIDrQf4/4bt+xAidst24z7+cV1Sre+R1f9sDHjFg9brGBpyM+RFOM2T5HRplXJxE=
X-Received: by 2002:a05:600d:640f:20b0:4a1:e368:cbf7 with SMTP id 5b1f17b1804b1-4ba022dacbemr640635e9.0.1794307295364;
        Tue, 10 Nov 2026 02:41:35 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm87694655e9.7.2026.11.10.02.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:41:34 -0800 (PST)
Date: Tue, 10 Nov 2026 10:41:27 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avL016l_xASN5paR@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
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
In-Reply-To: <avJidXM9yQOX4VBJ@nvidia.com>

On Mon, Nov 09, 2026 at 04:16:53PM -0800, Nicolin Chen wrote:
> On Mon, Nov 09, 2026 at 10:47:46AM +0000, Mostafa Saleh wrote:
> > On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> > > On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > > > +/*
> > > > + * Two devices are involved: the aux device bound to this driver, and the
> > > > + * physical platform device bound to the pKVM init driver, which only uses it
> > > > + * for discovery. This driver keeps using the platform device, as it carries
> > > > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > > > + * the IRQs.
> > > 
> > > It would be nicer to have a diagram or so to show the co-relationship
> > > among different devices and drivers.
> > > 
> > > I assume the regular arm-smmu-v3 driver is a part of the picture too,
> > > when the pkvm driver binding fails?
> > > 
> > 
> > I can add some ASCII diagram.
> > If pKVM driver fails, no aux devices are created and the main driver
> > probes the platform SMMUv3 devices as usual.
> 
> I didn't check closely, but would it be safe to do so?
> 
> Is pkvm aware of the missing SMMU device and handling it properly?
> 
> When pkvm is enabled and the SMMU device is supposed to be a pkvm
> device, should it not fall back to the main driver?

If pKVM fails to init for any reason (unsupported layout or non-coherent
HW) the SMMU will be bound to the main driver so the system remains
functional.

However, pKVM will not be safe in that case regarding DMA isolation
as the status quo.
In Android, in that case, pKVM clears the FW (called pvmfw) that loads
the protected VM and authenticate it so any protected VM knows the
system is not trusted. This part is not upstream yet. [1]

However, there is not much that pKVM can do and I think it is better to
keep the system functional in that case than causing a panic or failing
KVM init for example.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/virt/kvm/arm/pkvm.rst#n106
Thanks,
Mostafa

> 
> Nicolin
