Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509532;
	b=Bka8RiQX6Te4Ry0iNT/FKiLNU9c8TpfcbwZH2Wl0yVxZ8sqqPkqLl7MAuabAexca4IpA
	 Rlg3D+mRiwrRLmlEkHGAM0atNgblVWyglboNOdWsMrLIGNrERcAwm37xrPbMU1Xw/L4fo
	 KA6WT++JnJM446/EOJaNyL+gjQzpYhjVnSekpBJwGC9nUsUf9Vo9yl0NsjyQZoVSw69aM
	 4xDOTGsujLkgOkHqP70bahXJOP1miRl+b069hOoudU8qMR/DcAW4XWoVxKHMCURX9vgpL
	 DnO/tmRk0yVs/c62LYW91xHrSdfL5pjcg9OWySXESRIRa0jjOG/KFFgbHdWlJ28MyQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509532;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ewCscBlQYB+vPK+Xqfw+9Sad8O9fhIaGkOJBrs7Ba7g=;
	b=xh+Z4XTIA7KBjciMPjCjC2HHUboJBYH6DbPxiGNyuleBLx9jAMp0Z0jOBzrCVusO/bt/
	 u2C/nJvJ30W3GUt0ruxaYLmYiKJiIDOkk8W1CETp6kghdZw3779kvRnAv92ijOp28VXh0
	 rymMroxn5wa5auXHSW+XqPNWkP2reFfsfMz83w372Fd4/E2Yq1eax31ZMKe+1Bfq8sddl
	 yGK9bKJ/PIROSy8vcI6HMKSBMaID+Y7fgWcji++T96Iu4mfsL8p5Wd8U3KuFjWwGyS0FW
	 +iJOAMjy4IWeSCXTTqLp5UZCSI/NO9Cck389WRbCFUZg4QSCw7YJnzWSJhbLYZG284w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pBQbK8i4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3B2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F3B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pBQbK8i4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9696C16F8;
	Tue, 20 Oct 2026 08:18:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D4A3F7B4;
	Tue, 20 Oct 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792509529; bh=VVwbVMu3i3VOH5ngKiwj6CES+RBeJ4MGRARMfIf4G14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBQbK8i4l9pOUPMWXQ1WQfoQqwIORc53q0so0n3LGglh5gBf3+6HVs2LB5P6/tIFY
	 A/ETnN4nuSj4xrX5PCK24vqwAz7+Ywh/M99cizAFaJVbllju7sY/4kYjkuSoGURBzf
	 wiL6IdcWDiLqRTSdyuq/ng7bb4Rnf941BgX1oAAk=
Date: Tue, 20 Oct 2026 16:18:45 +0100
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
Message-ID: <ateGVeZmDcOSxaOD@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
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
In-Reply-To: <20261020145806.GQ14213@ziepe.ca>

On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > be able to break up the multi-function SMC into several devices.
> > > > 
> > > > I think my explaination was poor. Apologise...
> > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > for firme specific and definietly, this would separate the
> > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > 
> > > I don't see that kind of complexity is necessary.. I think it is
> > > better to just have the root smcc bus spawn them 
> > > 
> > > > But, the *base* is common. and I couldn't find any proper location to
> > > > deploy *common* code unless making arm_firme.
> > > 
> > > What common code excatly?
> > > 
> > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > set link ide, for example?
> > > 
> > > If you can identify what you think would ever be common that might
> > > help clarifgy what to do..
> > 
> > I mean the BASE service of firme and typical example is shared buffer
> > allocation. I agree IDE and attestaion service are orthogonal. but
> > in case of base-service is not. it could be used for both service.
> 
> It doesn't look like it needs a "shared buffer", just allocate it
> right before invoking the SMC that needs the memory. Use a simple
> library function to help allocate it. No need for a struct device
> layer.

Retrieving a PAT requires a buffer shared between the worlds. Before
allocating that buffer, the driver needs to query its requirements
through the BASE service's feature-query calls.

Considering possible extensions to the BASE service, my preference
would be to expose these operations through firme_device rather than
standalone library functions. The intention is to keep access to the
BASE service within FIRME-specific drivers and provide a consistent
interface for those drivers.

With this approach, arm_firme would handle the low-level FIRME calls
and their associated helpers, while the attestation driver would use
the service operations exposed through firme_device. This would keep
the attestation-specific logic separate from the details of the FIRME
interface and changes to its implementation.

If we implments this with library, are you thinking that file should
be located at driver/firmware/arm_firme or other place? though we make it
with library, I still think it should be located at
driver/firmware/arm_firme or some place in arch/arm64, but as
perspective abstraction to mange firme helpers in one place,
I think this design seems good.

-- 
Sincerely,
Yeoreum Yun
