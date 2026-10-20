Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524448;
	b=HV6WNFBTxoyhXB+JgfwVDl1iPtZ2TYV4Y6VZHTVvbgdaqqZ/e6ckb+jfCaReDTOxjy/b
	 pjdPCGmgvaXd5zAoYcvBiqgEgsDSe9cnQNeTEzT+zRTXZHQEiqmrEkc/KmTKrbPBkqZKc
	 RMsuio9KShQ1mbmzCUic22G8lOdO3x4GZPo6ukKjY974sYfmyEkIa4zOKik1wILT6lqxO
	 lx2vyfQGUmoAF/6ACjvViJubTPD4LKR+Qi7tn5OM8RyjOajwL3aswKGj6Z9TVWBykmMEQ
	 iS/7KgoL2PF8T8NwRglb/1o+/cRHadIPA2Zv+e80+VIoSiZKtGuV01UzbapU/B+gekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524448;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Jxi2fFvEa24MYWSBDu89sOuw0Qp/4PEPpzEJpnFw0PE=;
	b=ysqgD8Ca+mP39OyDImoORBsU5oorgbYiWI8jp2bGtoKJawigYmusG29JbkUNE8icCA+z
	 pQHpD5M1Rog+gjPv901CQ6fldxYU2CtDzxgo5ZF45X4QW0JHHBe1dSDg2AiAlnmrZ1D00
	 8nFftk/TfMXQvOH2NyiHM/q2G83jmbmDLVHKn3zyG0GTwZhqrw7e8yMIFbRrrQYUWETuO
	 Hr2N8lmR1VgEGjEeMsVpGxY2JRl1QXryIReIFaO+qBU+aEE0KiFhYsbVa9EXjrx+lC1iN
	 QL4HTuqDtf2B5vCmjTchbG5Se+c22rhrag/GGTb6FQ5fFscCSLJnlfaBjAjDdeIrMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FueojkIW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C9B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FueojkIW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93D691596;
	Tue, 20 Oct 2026 12:27:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01F73F7B4;
	Tue, 20 Oct 2026 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792524445; bh=cDXIfx6XjE0zhSaK/P3+DuZo6P+vzJag4S/YHbDh6WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FueojkIW/tSiwfGWb9crQsX5K1mbC+lRJi/M+1eC5fNFkoBCDUU9a9Ff6s0U/l/jF
	 xzjQVZuw46dkbZYBvaZigT9BGNpsWMVEUB7fEKpWhLhBPe+7INi1Hy9Ri2Z4d3FEZO
	 qYPx9mPWIxuRMDcDDMG7XPJpi/ZjAAajAewcFvQA=
Date: Tue, 20 Oct 2026 20:27:21 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atfAmbL7lYkU98_E@e129823.arm.com>
References: <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
 <atefXz-0cD9viNHK@e129823.arm.com>
 <20261020184737.GS14213@ziepe.ca>
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
In-Reply-To: <20261020184737.GS14213@ziepe.ca>

> On Tue, Oct 20, 2026 at 06:05:35PM +0100, Yeoreum Yun wrote:
> > > 
> > > > If we implments this with library, are you thinking that file should
> > > > be located at driver/firmware/arm_firme or other place? though we make it
> > > > with library, I still think it should be located at
> > > > driver/firmware/arm_firme or some place in arch/arm64, but as
> > > > perspective abstraction to mange firme helpers in one place,
> > > > I think this design seems good.
> > > 
> > > Will has indicated a preference for driver/firwmare
> > 
> > Okay. with this let me make a driver/firmware/arm_firme as library not
> > a module format and make this library APIs (base, attestation) to be used
> > attestation and other. This means device / driver registeration with
> > smccc and done in driver/attestation/provider but use the APIs from
> > /driver/firmware/arm_firme.
> 
> You should try to structure it with a firme headerfile, and some
> inline helpers to invoke the smcs and then a very small set of out of
> line functions that *are used by multiple firme drivers*.

Might some could be, but want to reduce the time of calling of smc call
for example, to get a shared buffer information, it doesn't need to call
multiple times but enough to call FIRME_SERVICE_FEATURE with BASE
service and cache the result in some where.

That's why I think to provide base service helper, add the arm_firme.c
in /driver/firmeware while all attestation relevant will be located in
/driver/attestation/provider/firme.c

> 
> Don't put attestation in driver/firmware/arm_firme..

Acked.

> 
> You can look at what I did for DRTM for some inspiration
> 
> https://lore.kernel.org/all/11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/
> 
> After some feedback from Jonathon I think it turned out fairly well.

Thanks.

-- 
Sincerely,
Yeoreum Yun
