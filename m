Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503715;
	b=Xt+62eVzJqdFuXUYmMZw/aiivJKH4F5xarozEkHH1tQc5SPRwjfhY1hBeP2nqL78QXLn
	 m/N4KXGgZ7y9sv32i0btG79wkFKyn+nbqEz7lORAcMabXQeYoP7PaswyBKJZmg4emOydo
	 Nkal7AnCkcKmgckt1rF05wVEj5RWgm6Lm4PjVbXySFV0ANT74vTIztGkBc9g/Hznra2CS
	 ctl9QA8byE/plUJ6vH0TY51lrus3FMmGDiPG0k3p3j4sa4ysDAVj334lNqk/zcQmzyCry
	 bytakz+7MYpQdkQNP88qYUubMUXcgU4tuT5DabFzm2q0ILB0jPctCqoi4qm0ZycsYCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503715;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ui51WN0V/dq90aCRoQaIw8Ijjmf9wTxT3VDMGJPua6w=;
	b=nSG7OajhCc2EXtdfwIaUPuGWewd3gfzW5oj+/la+rmR7Y70eCyHzAJq7a1yWNJTPMKjn
	 6Bn9i45dZpwcWlqHerPZP1h42WvYtTG/tOf/bmCWzsu6few2h+so3XsDvk5OmaKA11J2W
	 euLj0+6r/7bvtRQwbFptUSRbwhy42AqYiifzs/ShWBodg5C6nxrNYmBOUE/Wp1tjfKDpL
	 MT+moVDbGDkGyv/k4kfYObDIsvF8W61oNGaNnaXP8X82biOWO+zi942yJpBLV3DjRq8C5
	 lkz9kAW1DQYtSr1lHJNKCPCarwLn2dg5f+SfuFvJVLgszLOZV/Y/+yBAsrksub/NLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ty+my6nc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF825606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF825606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ty+my6nc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03642103;
	Tue, 20 Oct 2026 06:41:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2440E3F7B4;
	Tue, 20 Oct 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792503713; bh=OY6likMPK5nTxdza/t+zyh7NbQpzfSUse40FyClNkn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ty+my6ncQIlsTuIWQOiV5wASyQxxXpdS75sdC5d1rQrtulJwrfqMhMlnmgF8Ioi5l
	 dRDyNuszLF+5q4lDDkfIlaWn6WKgQGs5IBhMpQ838mC1eSnD2j3qlf8RXABZ2DgmEc
	 G3VjUvu6F8G14LpFo1pDdqnw9DIaRkVF3zmiBPSI=
Date: Tue, 20 Oct 2026 14:41:48 +0100
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
Message-ID: <atdvnMJuHUJlqX8t@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020124536.GM14213@ziepe.ca>

> On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> 
> > > Also this is weirdly structured, it should just be one driver under
> > > drivers/attestation/ that does the measurement register part of firme,
> > 
> > JFYI, FIRME's platform attestation token doesn't have the measurement
> > register. ploatform attestation token will include the firmware
> > information (e.g. firmware hash) and verifier checks the firmware
> > information. the meaurement with RIM/REM will be part of Realm token.
> > FIRME's PAT is for host attestation and doesn't include Realm token.
> > 
> > Therefore, in the new UAPI, attestation only have the evidance
> > interface and MR interface wouldn't be used by making mr_cap as NULL.
> 
> I'm aware, and this may change.

Yeap. but current, it's enough with evidance.

> 
> > > it shouldn't have two components and some weird firme_get_instance()
> > > thing to link them together. That isn't how to build HW drivers in
> > > Linux..
> > > 
> > > Since ARM has bundled different concepts together into one SMCC FID
> > > range, it probably make sense for the smccc_devices to somehow spawn
> > > multiple smccc_devices for the various internal software aspects
> > > rather than have one driver spawn aux devices to split it ..
> > 
> > If FIRME were intended solely for attestation, I think your suggestion
> > would make sense.
> 
> The FID are largely orthogonal, AFAICT there is no shared
> infrastructure between the various functional blocks.
> 
> SO it needs to be split into proper narrow drives in the eventual
> kernel implementation. token goes to attestation, link ide goes to
> tsm, and so on.
> 
> > However, considering that FIRME may be extended to support other services,
> > such as IKE key management, I think having FIRME-related code scattered
> > across different subsystems would actually make things more complicated.
> 
> Nope, it is the right thing to do from a kernel perspective. We always
> de-agregate these kinds of multi-function devices into proper
> per-subsystem driver.s
>  
> > I initially considered introducing a dedicated FIRME bus as well,
> > but I felt that would be overengineering.
> 
> Nope, just use the smccc bus and split up the 'multi-function FID'
> there. It doesn't need to be over complicated.

Then, I think the arm_firme layer could simply wrap smccc_driver and
smccc_device, with an extensible base interface shared across services.

In other words, the attestation layer (driver/attestation) would register
a firme_driver via wrapper provided in arm_firme layer that binds to the
corresponding attestation firme_device without implementing firme bus type
(of course, the smccc devices are delcared according to service in
smccc-bus layer).

This would eliminate the need for firme_get_instance(). Instead,
the attestation layer would obtain the FIRME attestation device and
use its function pointers to access FIRME’s attestation and base services
provided from arm_firme layer.

Would it be better to post based on Jiri's branch [0] for next-spin?

Thanks for your comments! :)

Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1

-- 
Sincerely,
Yeoreum Yun
