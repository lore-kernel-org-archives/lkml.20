Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480424;
	b=JBUtEpnpwF7bzSLuBJMCKeiyr/FYu9UWeFPUlyT6hLljkn3/MD1qdP423EdFLtLuT6Jw
	 hnFLMfmLMgx4OQcBoY5z480d2yM/ulaJYd79gXa+Pp87ZFHF55iNn9IJ9sh7u8dwEoFRk
	 wze0mwlU0qFpCwd2Ilcvheyn/dmql9HlYFf1wshjW/wAETdA0xlH28VGQJ+H1oGxmyvD/
	 spzl6DYnK/O9L4FiTZ5Hugso+QvPWQ1F3yjevfrxDKA2ouyxKtZbwJqoClvEk600NA0xK
	 aFCMFJo1IZQNGhF71G1BBJyrxxf6QJXoJecdxigbuEoR1gPTaIGjyYOtdOguN+O20Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480424;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nsk1TBnHNNZnBq+waXcFjtYh5QBDBxbDOQ+y6FKQ1IU=;
	b=r8IGGnav6sH2N/pRC3wfxlGusomu+SCRlr9zuSuLSZ6HOfvshvmgFEt8dRPkYh4u9u4t
	 ENY+Dc1G7PdyaU/7T4vFCtS58pu+T1libRUyePGGNEhXkjNkUoYdwMY7U+rzhl3CRG63v
	 SniVHEI3G8/prvyMPkdpDAH+dQzgaGzIZRwpxhUn750Vqm63wswsWaQ9IujsAQ5hqfYxB
	 8WQ88TfkgoFhj61VuqWSLGNM2y/lNMFth7x3uOJYXAWLH5C9DenjtjV4sMPBj8/W6gPRE
	 AmqefobXYlC2ZgrUvs713yI18Byo/c2+qXl0kAhCcD2TaP1x9ImA52iOqhNA5/MhNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hT0FMsvH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984EB606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984EB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hT0FMsvH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751F31595;
	Tue, 20 Oct 2026 00:13:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26573F7B4;
	Tue, 20 Oct 2026 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792480421; bh=GFDZO9lDWHSTyGL8dTcjaGMjKJsBdyYUHFP2AjdoHMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hT0FMsvHDoY0xC/ThqYINdXznUSd57GlgnOJyJBc10KgLlLe1GD/rxSzY/nWLPyx6
	 C9dUI9Bo2pjCAB20PL/0HroDt77p2Yv11XhaB2retpKFIyKSp5t6UxkMDstFcMRYyN
	 Ro1MYjF00Y4C7m5+kkKvopB58yZeEfGOfXfGojjM=
Date: Tue, 20 Oct 2026 08:13:37 +0100
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
Message-ID: <atcUoSdggT9eU8YE@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
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
In-Reply-To: <20261019233532.GL14213@ziepe.ca>

On Mon, Oct 19, 2026 at 08:35:32PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 19, 2026 at 03:14:32PM +0100, Yeoreum Yun wrote:
> > The Arm Confidential Compute Architecture (CCA) introduces the
> > Realm Management Extension (FEAT_RME), which enables the creation and
> > management of dynamically allocated, attestable trusted execution
> > environments known as Realms.
> 
> Same remark as the other one, this is an attestation subsystem
> driver.. Stuff like this is *exactly* why we are building that.

Yes. I'm keeping in mind.

> 
> Also this is weirdly structured, it should just be one driver under
> drivers/attestation/ that does the measurement register part of firme,

JFYI, FIRME's platform attestation token doesn't have the measurement
register. ploatform attestation token will include the firmware
information (e.g. firmware hash) and verifier checks the firmware
information. the meaurement with RIM/REM will be part of Realm token.
FIRME's PAT is for host attestation and doesn't include Realm token.

Therefore, in the new UAPI, attestation only have the evidance
interface and MR interface wouldn't be used by making mr_cap as NULL.

> it shouldn't have two components and some weird firme_get_instance()
> thing to link them together. That isn't how to build HW drivers in
> Linux..
> 
> Since ARM has bundled different concepts together into one SMCC FID
> range, it probably make sense for the smccc_devices to somehow spawn
> multiple smccc_devices for the various internal software aspects
> rather than have one driver spawn aux devices to split it ..

If FIRME were intended solely for attestation, I think your suggestion
would make sense.

However, considering that FIRME may be extended to support other services,
such as IKE key management, I think having FIRME-related code scattered
across different subsystems would actually make things more complicated.

I initially considered introducing a dedicated FIRME bus as well,
but I felt that would be overengineering.

In my view, it would be better to manage the common FIRME functionality
within the FIRME layer (arm_firme), either through a single FIRME device
or by exposing multiple SMCCC devices for different services.

While both approaches are possible, I personally prefer the former, as it
keeps the FIRME-specific functionality together and provides a cleaner
structure. The individual service drivers could then be associated with
the FIRME device obtained via firme_get_instance() by setting dev.parent.

-- 
Sincerely,
Yeoreum Yun
