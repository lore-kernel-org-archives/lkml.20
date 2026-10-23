Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741679;
	b=ebcLKLrqlA0F58G3q3YajBYcZep/tAyabZ/PCyfFXbzegCQGb1OwZr2Ew1QBAaCeBtnx
	 /fNXQsM3POvfkO2hdKhMGmhKYGhC/evdr7kmrmtId9/MGNulDSvXbSYDEFhGpoXSHf7Po
	 WPAvoPvug5ygLPds2qN7hBx52stX4YSQLHIOYBv2a9dlJkeINvkwgnDqkhp0GA9UdAr0t
	 MAnrWJ0+iP2Krpt3goFPT8lGHimRZ6h+RkgA/Gur+seDZvAvoAstF8xW+3/vSYvQdBvBJ
	 TPNDOxP/PG/LEC3iRObvVtr094EMPgGYI2taBE2doc+vTj2F4Tr/L0kOtBGdE2x+bSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741679;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T9GOpQK5rtPMBaO9wf0cS2V+Dw+B5rak2UcuAS403G4=;
	b=lSBYyoucZ8pVQHMVJBIzCPhZDZuOYvNFUMmdCIwVcg8EL1wkroay6SqfPNTZztSl5PZd
	 2ySAIpjWDk4U2GEm5+nsRg9h47RHU55knbzqaffLdE9DI3SIhwTPrSi0V3iT73K44DhB5
	 RgBLTS6nX0lwRtMSNPDYzrmEkmtKEt0eyq2kaRwxk4CNJHANshIddApzrOFbEbKRq6jt0
	 VeGiqMMsMCYp7S2s8g7KFmjRee/2Fxp6DQchwXdtqMdTouDm13RvtUiuCCl/1QVoYpwel
	 8CABGH5wWj3k60mjicmVdLUO/gT6jC5JDH1Nm2kKhtrLB9kOJ/Ki+3jperOCs94YWCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgQ2SsC8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgQ2SsC8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5571F01825;
	Fri, 23 Oct 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741679;
	bh=T9GOpQK5rtPMBaO9wf0cS2V+Dw+B5rak2UcuAS403G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgQ2SsC8b8yiqOgy9mwZFEMdx94JQR57m/DV/APKtOmBQPB7iIgX2nMCFLj1sPUgm
	 iy6vVuC8zH47hTZNe8th/7TLB+7fG5VK5LDeK9qK69ocZQ3xPCrO+BoEzdZD9JOAw+
	 SMeM8H1/zoS4vRaqTamiQ/NJZL+pwIGEV2fuRQwdLGd9/39axR0nxPllhg7Y9sOPCc
	 e1b2tKRavFN9kje4/YC45FYkpyrB2GdwGCltiTuKpU4Ti29yvoW5JEAZPUvxbH26oY
	 1sgfSuX3F4td6N5GMDsvZZ+k7O15lTVry0i5zmdoRmvJVeUpnQTO4fpAbJ+j7jjrKO
	 WlWUT9ZSZJ7CA==
Date: Fri, 23 Oct 2026 08:47:55 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, mark.rutland@arm.com,
	lpieralisi@kernel.org, radu@rendec.net, vsethi@nvidia.com,
	sdonthineni@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
Message-ID: <20261023-interesting-wandering-velociraptor-2a7e8d@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
 <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
 <877bj91k2z.ffs@fw13>
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
In-Reply-To: <877bj91k2z.ffs@fw13>

On Thu, Oct 22, 2026 at 11:50:12PM +0200, Thomas Gleixner wrote:
> On Wed, Oct 21 2026 at 15:49, Sudeep Holla wrote:
> 
> > On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
> >> On Tue, 20 Oct 2026 23:28:15 +0100,
> >> Julian Braha <julianbraha@gmail.com> wrote:
> >> > 
> >> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> >> > dependency, ARM_PSCI_FW, is met.
> >> > 
> >> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> >> > select conditional on arm64.
> >> >
> >> > ---
> >> > Julian Braha (2):
> >> >   firmware: smccc: provide stubs when discovery is disabled
> >> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
> >> > 
> >> >  drivers/irqchip/Kconfig   | 2 +-
> >> >  include/linux/arm-smccc.h | 7 +++++++
> >> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >> 
> >> This probably needs to go via Sudeep's tree.
> >> 
> >
> > Sure will queue it soon and send it as fixes at -rc1 or later.
> 
> Please change the subsystem prefix to "irqchip/gic-v3:" then.
> 

Yes I did that already.

> Acked-by: Thomas Gleixner <tglx@kernel.org>

Thanks!

-- 
Regards,
Sudeep
