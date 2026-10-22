Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675048;
	b=e9178iE/GHVCYoDpLG8eNNaQcg5cxV2G9sTnD6RwocL+UqgbBrxghqtY4+Iu3rcKzdAC
	 I9U3htwrJIrpEcZlekkeK1XOXJNbs6AUNm1GXTk6P6528eWdAbQMx+aR4xiyERkVqZH2M
	 bjjT7c1BG/7Mx2lk+LZPBKBfL340OVD04+X1gx2eMvaJvFFZtz+THlqKBAfhBcpoSGiqh
	 4fd2ezQhwfgGBt9MZJb2s7GCcrxeJ3gbgacTBwZhCflPoxAQaS3msCECxbLFam2bAwfoc
	 DtfZyw7kREQXFhLE4zOaxgLYRwTKqKWQEXRQcwJy02ev06IZQgbFIpM96z8g23mY6bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675048;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eQf4Ux3KgpPvYJ/vZ/XrAxGRYNkjOFHzjKZYgsvPaUA=;
	b=JNdCUv56a75gZSnrytR2xQ0lKH0pOhnda25H6POO3fsR439W6XOWG/hvEzEx0IWnxzxr
	 zPC6Enasc7BVtaZo8HPQNMlLFQD9fG7vueo6SX2oPbzjSEhHloueTSQNzhd0wbdSk23Qt
	 4pgKojcMx1ooJHy6uGL5LmB/XSodP709NAY5s/zlSR70CTORE2NsQJuucEkJSdBjtrtCm
	 9811lxcyx+5Bi1WXjo6BKuwwUNZCkayCAYfEF850a2hV4BZ3V3JytdkoY8H02UG7u2jqI
	 +BHq51Iog6mJaSCYDBh8M0FAbS6rge2WEGh75Gq/syaV/4l69r+ZJdumXhmwKcTsLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kaMcGbEQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52094606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52094606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kaMcGbEQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 541412C34;
	Thu, 22 Oct 2026 06:17:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CAB13F673;
	Thu, 22 Oct 2026 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792675047; bh=0s7bfEvTJgNfIljZiLJWu7OAwfMP+SubhPZFX3IkXwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaMcGbEQxmy0Ec8g7NLwAJplIEgN0KZqDZ25nJ9T+y9vCYjJMo4N09+X/gtUyZjEB
	 QaI8BY1cstU+Ae4jAhbmNYNh9x9UWMtawAEkMuKUfaokNLXw9ksxMfZq8wYGR9x+Zv
	 eqVWgSjmgDaE+Lukag3OFgdzIjpd/YkWqjS5jn/A=
Date: Thu, 22 Oct 2026 14:17:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Message-ID: <atoM447tWm2EsoSP@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
 <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
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
In-Reply-To: <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>

On Thu, Oct 22, 2026 at 06:48:49PM +0900, Kohei Enju wrote:
> On 10/19 15:14, Yeoreum Yun wrote:
> > The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> > Compute Architecture (CCA) and enables support for dynamic, attestable
> > trusted execution environments ("Realms") on Arm systems.
> > 
> > Realm management flows depend on EL3 firmware for operations such as
> > Realm construction, resource allocation and isolation, and attestation
> > of initial Realm state.
> > 
> > The FIRME defines standard interfaces provided by EL3 firmware to
> > satisfy these dependencies. These interfaces include:
> > 
> >   - Granule Protection Table management
> >   - IDE key management for PCIe and CXL Root Ports
> >   - Memory Encryption Context management
> >   - Attestation token management
> >   - Integrated device management
> > 
> > Each group of interfaces forms a FIRME service. A base FIRME service
> > is also defined to provide common concepts, service discovery, and
> > feature discovery across services.
> > 
> > FIRME interfaces are implemented at the EL3 boundary between the
> > Non-secure, Realm, and Secure states. They may also be used on systems
> > without FEAT_RME, for example to provide firmware-based attestation or
> > security services.
> > 
> > arm_firme driver provides the common FIRME framework and service discovery
> > support for client drivers using below FIRME services:
> > 
> >   - Base service.
> >   - Attestation token management.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> Does this series assume that the kernel is running in EL2 implicitly?
> 
> The FIRME spec says:
>   An implementation of one or more FIRME services at a valid Exception level boundary between EL3 and the
>   highest Exception level in a different Security state is called a FIRME instance.
> 
> and I think only NS-EL2 can call FIRME interfaces as a NS FIRME
> instance, right?

Yeap. but it doens't forbid calling the FIRME from EL1 too.
As a just example, when the host running with pkvm, it could use
where kernel running as EL1.

[...]

-- 
Sincerely,
Yeoreum Yun
