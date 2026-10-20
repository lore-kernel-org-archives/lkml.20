Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515940;
	b=C6ih/O7Wv5MOorThp0g+HRJXbf9FSLIjEM5DKI374BsWbuE1NAwkugYM5AEiLLZk6Bi8
	 J1RNFFV5cHMykY4o1ZmMZ6lE3UoQzCbLZp5F0vttFprs8z6mvcnJhfdsVtoDDGuOtfVvm
	 bRA4USsY/2o7IyT/egPQqay9zJUUoe7JP+gIcR5ncSzfKec/46P6FAz/vV04CZ9rNwyAf
	 NjsMlk2SQm2X3QomE49n2UNgbdhd+7+idMhjHxUlF9vyah7KW30F6wJEwws9SXLJzwlSI
	 djIUZeHU+OVFwlmjMJ5dPR5LCi5m0pvFy1lXYlYweIQewhMOLhEXo0OLnzA0ZP4nk6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515940;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sfkxhp2YPni25pk9lAqihLFxxjnCFT2yCSxPUm/Y7qE=;
	b=VRbULFqcQQGZ5Hm7hlFAMCILML5r9xxSS1RX/lpMhziqv43bw4dsGwKEo1qqudosW/S7
	 eDD1VIEMpH1wglMtvRIk/c5l2nrEOtP7b7+Sz67UkAlBod7fggs9cqaX43OH+VEP+yYN6
	 PlRRvk5yf0A1H5UbQF4zIR6nszpZ04G2tXYPREdfURKk3rIwaE7ZiEUhhem8TV9S2hfTS
	 m10CZvzSMnQwvY1EJFn3dh4RiCnbhnOzLJWEdwOqx8SamugzfDCJaTfGtHNmb+/Wx8U7j
	 kaauC5/Jw0g99i/Poh/vkxy+45fY+OXSOHBtoE/eTFzKbJ2iQPzlch8LYhFSiN96xnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C5kzCuEo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA61E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA61E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C5kzCuEo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28FB1596;
	Tue, 20 Oct 2026 10:05:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D8973FA32;
	Tue, 20 Oct 2026 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792515939; bh=Neo80ApyG7pQv+dI5x32cAG8lDQTvw41mtuVfq5grwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5kzCuEoVbtzk+iW3NiFBraTqEDwSW05GvXjZNIJKIssRTnabAGY5qnWFeWvi7Qrp
	 TsaXg2Z0gZK/lvymuXrTeeDT/lr/mR7zPSYfXJYakHbJbwEpSieg2+zHedWdYsLZYn
	 HUDilYCH9SJKM7sJBM72OfetZnIlq+7/+PNz4g5o=
Date: Tue, 20 Oct 2026 18:05:35 +0100
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
Message-ID: <atefXz-0cD9viNHK@e129823.arm.com>
References: <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
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
In-Reply-To: <20261020164755.GR14213@ziepe.ca>

On Tue, Oct 20, 2026 at 01:47:55PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 04:18:45PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > > > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > > > be able to break up the multi-function SMC into several devices.
> > > > > > 
> > > > > > I think my explaination was poor. Apologise...
> > > > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > > > for firme specific and definietly, this would separate the
> > > > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > > > 
> > > > > I don't see that kind of complexity is necessary.. I think it is
> > > > > better to just have the root smcc bus spawn them 
> > > > > 
> > > > > > But, the *base* is common. and I couldn't find any proper location to
> > > > > > deploy *common* code unless making arm_firme.
> > > > > 
> > > > > What common code excatly?
> > > > > 
> > > > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > > > set link ide, for example?
> > > > > 
> > > > > If you can identify what you think would ever be common that might
> > > > > help clarifgy what to do..
> > > > 
> > > > I mean the BASE service of firme and typical example is shared buffer
> > > > allocation. I agree IDE and attestaion service are orthogonal. but
> > > > in case of base-service is not. it could be used for both service.
> > > 
> > > It doesn't look like it needs a "shared buffer", just allocate it
> > > right before invoking the SMC that needs the memory. Use a simple
> > > library function to help allocate it. No need for a struct device
> > > layer.
> > 
> > Retrieving a PAT requires a buffer shared between the worlds. Before
> > allocating that buffer, the driver needs to query its requirements
> > through the BASE service's feature-query calls.
> 
> So? Make the query, allocate the buffer, get the token, free
> it. Simple, one driver, no convoluted flows. Use a little library
> style call or inline to reduce duplication if eventually necessary.
> 
> > Considering possible extensions to the BASE service, my preference
> > would be to expose these operations through firme_device rather than
> > standalone library functions. The intention is to keep access to the
> > BASE service within FIRME-specific drivers and provide a consistent
> > interface for those drivers.
> 
> Try not to overdesign things. If we don't know we need it now based on
> how the current spec works don't imagine something else.
> 
> ARM spec design is informed by Linux implemetnation. Having a sane
> simple implemtnation in Linux will motivate future specs changes to
> align better.
> 
> > If we implments this with library, are you thinking that file should
> > be located at driver/firmware/arm_firme or other place? though we make it
> > with library, I still think it should be located at
> > driver/firmware/arm_firme or some place in arch/arm64, but as
> > perspective abstraction to mange firme helpers in one place,
> > I think this design seems good.
> 
> Will has indicated a preference for driver/firwmare

Okay. with this let me make a driver/firmware/arm_firme as library not
a module format and make this library APIs (base, attestation) to be used
attestation and other. This means device / driver registeration with
smccc and done in driver/attestation/provider but use the APIs from
/driver/firmware/arm_firme.

Thanks for clarification. let me post next RFCv2 after initial
attestation subsystem is settled in :)

-- 
Sincerely,
Yeoreum Yun
