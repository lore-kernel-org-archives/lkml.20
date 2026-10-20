Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505605;
	b=hY0KOa7p7eyY7lFyYtnbdVx7/TM+M7cZq8iFLiyB6f/TV5CsUTa7/SMGnSyI0wrnrRNi
	 XUQ17eVrYJAQ1mwY2YWYL4ZQyq5nIpFUEeM+1dY6+/MCNVJPSX6LbKeDIAViB7Rab9aMe
	 XvWPIznTJQTAf+AyfENxHKw8TOYU/wu9oeAIM3el3T5yx4M4j0JA1UgwfEF+cbO4OwjWu
	 om5LcOmdot4nYwVvqwSMolY8I2ZIiLy9am/g3ylHjuXjK4xlRq7I7bSNq1BW7/yNQO4oC
	 GLRNDPe5zE/3y8IVCjggqbHm+GA3mpD9An41yZX9RxqlxQiDX2Y7LB+CydLa0fMLE8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505605;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0g803D2zbJ/JBZXy9DR+iWHmKrtF5UIWiJln+2x87kg=;
	b=ND+mLDB0iATt1imU2I9IGt+qvE7KbGjElnkVm1cQ/bvJ+2j/qSY19fXFlSRB08g8PWpz
	 vTtuekFtVVmBk1QTSGEhDXzk4qmB5JJXPbUguGJNCsgPlurAUtjqf897XxgIXDEr5J4vc
	 0bK6ux9Vbsj831UFuZXp6Dg8xAxJm9684ee36cYw42CdvP5c6d/T1H+stVWcQWTobY4FD
	 iB6qkVMkuWUHdNXKmvDhEFltrmkzOVOo6r/5Rzfooe4VnSixLV5MIKbBC6r8l+i7TvVnx
	 YR7OtQfikhsimgUojKK8wkanWgbEgr+AXqDVia8sSa5WX3hMTSbtkf5IQFjhjR0dyGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RWO3itM9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83684606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83684606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RWO3itM9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E2E516F8;
	Tue, 20 Oct 2026 07:13:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9C23F7D8;
	Tue, 20 Oct 2026 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792505603; bh=A2T0lfaK6o/24VhUDeMj9aSquS26n/1b1DGxnbDkyAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWO3itM9Nu9R4vjzPvqT+vPGPipq2Ac1It2dWSM+hjHtyVwco836OX2wgq9AMisgk
	 iiZiFelZ7NQPkWLvZtWZz0Sg524hu92DZh9Bk3neNYv5lWfKplXr5LaaB/MD+s7OJi
	 o1j1fd8gdZ/m0OrmeulG9aXaKdUxtK+OAYsYj4YI=
Date: Tue, 20 Oct 2026 15:13:19 +0100
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
Message-ID: <atd2_9Q2wTv_3MXz@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
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
In-Reply-To: <20261020135006.GO14213@ziepe.ca>

On Tue, Oct 20, 2026 at 10:50:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 02:41:48PM +0100, Yeoreum Yun wrote:
> > > On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> > > 
> > > > > Also this is weirdly structured, it should just be one driver under
> > > > > drivers/attestation/ that does the measurement register part of firme,
> > > > 
> > > > JFYI, FIRME's platform attestation token doesn't have the measurement
> > > > register. ploatform attestation token will include the firmware
> > > > information (e.g. firmware hash) and verifier checks the firmware
> > > > information. the meaurement with RIM/REM will be part of Realm token.
> > > > FIRME's PAT is for host attestation and doesn't include Realm token.
> > > > 
> > > > Therefore, in the new UAPI, attestation only have the evidance
> > > > interface and MR interface wouldn't be used by making mr_cap as NULL.
> > > 
> > > I'm aware, and this may change.
> > 
> > Yeap. but current, it's enough with evidance.
> > 
> > > 
> > > > > it shouldn't have two components and some weird firme_get_instance()
> > > > > thing to link them together. That isn't how to build HW drivers in
> > > > > Linux..
> > > > > 
> > > > > Since ARM has bundled different concepts together into one SMCC FID
> > > > > range, it probably make sense for the smccc_devices to somehow spawn
> > > > > multiple smccc_devices for the various internal software aspects
> > > > > rather than have one driver spawn aux devices to split it ..
> > > > 
> > > > If FIRME were intended solely for attestation, I think your suggestion
> > > > would make sense.
> > > 
> > > The FID are largely orthogonal, AFAICT there is no shared
> > > infrastructure between the various functional blocks.
> > > 
> > > SO it needs to be split into proper narrow drives in the eventual
> > > kernel implementation. token goes to attestation, link ide goes to
> > > tsm, and so on.
> > > 
> > > > However, considering that FIRME may be extended to support other services,
> > > > such as IKE key management, I think having FIRME-related code scattered
> > > > across different subsystems would actually make things more complicated.
> > > 
> > > Nope, it is the right thing to do from a kernel perspective. We always
> > > de-agregate these kinds of multi-function devices into proper
> > > per-subsystem driver.s
> > >  
> > > > I initially considered introducing a dedicated FIRME bus as well,
> > > > but I felt that would be overengineering.
> > > 
> > > Nope, just use the smccc bus and split up the 'multi-function FID'
> > > there. It doesn't need to be over complicated.
> > 
> > Then, I think the arm_firme layer could simply wrap smccc_driver and
> > smccc_device, with an extensible base interface shared across services.
> 
> I wouldn't over complicated it. We already have smccc bus to do this,
> we don't need layered stacks of busses here. Just change smccc bus to
> be able to break up the multi-function SMC into several devices.

I think my explaination was poor. Apologise...
I'm not saying another bus making but just wrapper of smccc-bus APIs
for firme specific and definietly, this would separate the
multi-function SMC to defien each firme device (attestation and IDE).

But, the *base* is common. and I couldn't find any proper location to
deploy *common* code unless making arm_firme.

Also, this arm_firme  is useful to managing *firme* smc call
seperated only from the attestation stuff and this wouldn't be not
compliate since the /driver/attestation just call the driver register
and get the firme_device wrapping the smccc_device with proper
smc-callback for firme in its probe function.

> 
> > Would it be better to post based on Jiri's branch [0] for next-spin?
> > 
> > Thanks for your comments! :)
> > 
> > Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1
> 
> Lets give it a few weeks?
> 
> I'm confident both of your attestation drivers will go ahead at the
> fastest possible speed once we get the subsystem settled :)
> 

Hopefully. and I'm seeing his branch and found a little bit fault.
I'll be back with some comments as soon as I check overall.


Thanks! ;)

-- 
Sincerely,
Yeoreum Yun
