Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288403;
	b=OAh1gXG84+PQvzba+WeibcVRJlguDXlb1iXelhBLRPO2Un4Mpj8QLJ7TRmFc8Bu0l204
	 dJkwr/TCU5XZFcoRkKMUiEpRgg0Hm1SgHUvel76VAk7h6a9Ka6fnhUUKiDaTSveHsoLNy
	 hH+kHze+zVUHBqEfSQ92oi9RNF+FU+4CSLRqb79CaYE/Ukb57Ydav35TxbThIkzVp9FQu
	 q6FDNCABSlkiGgQDUmkEg0T0rJcM/zRH7qR2MjxIhw7RDC+Y7NGk3Z7esM0+gPRw0mAVl
	 P20dxvHnja2yvJUWqmHASa11B8+hnThNgZUzn3sZ4J781B2T3rC4L5ZMxtIr/VX2HRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288403;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YV+w23NqXtPUxzbWxdPwKnpLJ73OpZwUZwdP8XjSzow=;
	b=Xa39eyJD77N8BMRpyczTEVpflPHYr0xX1Ey0Ri1qQVNtjEYVbYWvDY/gNERL9Uold1cG
	 BhGcAsKCZNQzdkyDjFSfNGVSTG/zKUAVPuf2tLrBvQc1ciNQt6diCavgxpcWgbdEZ3iZH
	 rVqCkL0gzplo14RxeGdiKclgEBzUmom7BIex+O0ahhoNYX9i7/yXi8TQpHNOZqMTmUQKM
	 d7ILaW1lC0z4NR0d0vWuuak9PaNq5YsnHtFmwhBojvL9yJA1rRbx2hdqMQm7RJqYhfkyf
	 pOEm/kYAIdgySn1ffF/EjdRXe6g7QEeFFxhqV34bOHdQJBvmGQpFq/fPj7G+uD8dRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JyiOShVY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1400606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1400606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JyiOShVY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A780415A1;
	Thu, 29 Oct 2026 08:39:56 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86DD63F59E;
	Thu, 29 Oct 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793288399; bh=u95ndNvigggwQi3q2TAN5S5kuUVT6f7RZYvAm5JASi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyiOShVYAILhlWnkyYvD5iT4yzYZcgaleDs6rVnTCL0XV8eoq/EKzTkeMFkk7EzLe
	 VDykIKew6nPCqrzrFvebMQdYIjYQZgZuGgF3tMkvvHKjp3YaNK/kKA1mymjZ5ZhFkx
	 JMMcU8qmj+OR4wZPwHCR5UjOH1U+kf/+SH63Tnts=
Date: Thu, 29 Oct 2026 15:39:42 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	James Clark <james.clark@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Huth <thuth@redhat.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Convert TCR_EL2 to config-driven
 sanitisation
Message-ID: <dhd5aaoxaeb43ili6bcr324gs5n7ziasssz4ttx6iprdso73at@jcwxs47m5wd6>
References: <20260917214215.74135-1-weilin.chang@arm.com>
 <20260917214215.74135-5-weilin.chang@arm.com>
 <auM-TnZ0i_1G01ad@e143914.arm.com>
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
In-Reply-To: <auM-TnZ0i_1G01ad@e143914.arm.com>

On Thu, Oct 29, 2026 at 12:38:38PM +0000, Joey Gouly wrote:
> On Thu, Sep 17, 2026 at 10:42:14PM +0100, Wei-Lin Chang wrote:
> > Feature dependencies of the fields in TCR_EL2 are extracted from
> > Registers.json of the BSD licenced AARCHMRS
> > (AARCHMRS_OPENSOURCE_A_profile_FAT-2026-06).
> > 
> > Places where we slightly deviate from the above:
> > 
> >  - Stick to the ARM ARM M.c requirement for TCR_EL2.TCMA*, which only
> >    depends on FEAT_MTE2. This avoids updating ID_AA64PFR2_EL1 with new
> >    VMTE* definitions that we don't know the meaning of, as they aren't
> >    present in the ARM ARM yet.
> > 
> >  - Ignore TCR_EL2.DS's requirement of needing the effective value of
> >    TCR2_EL2.D128 be 0. This requires runtime detection of TCR2_EL2.D128
> >    and we don't have D128 support yet.
> > 
> >  - TCR_EL2.AS is dependent on FEAT_ASID16, this information is missing
> >    from the json.
> 
> In the 2026-9 release, FEAT_ASID16 is now there for TCR_EL2.AS.
> Otherwise I think this matches the newer release.
> 
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks for the review!

I'm planning to update this series to the 2026-9 release and repost.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Joey

[...]
