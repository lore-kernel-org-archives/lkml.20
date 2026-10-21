Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594160;
	b=2EIzXsqMTtZMnX51rZQUxmCmW8IK7LyaEmUBTbvuXMEY/fIaWROOGNt7zxjnphXzsj+Q
	 ac+nNAo5QeAPxPA66duBVRMr0rR82kIMkVGMPBOgEIS73XXn0n2Cu7D812J539GvZzSa2
	 dZD10zokAr9/SSOtj1ib46UDbHuAPplDLIKjMgDx96/fJ9d3Uxw8Nj3LJUaEpq8NXk6ve
	 9xGUyJcNX5len404t0uWU6napfNCNBvCnOdCBUW2NpIpRJz6tYZ4VZTCGpkWRnbrCVfvz
	 Mj6XXVMk+kUaDMGozD5+Ecd01aLAluy/lrSuHAvzOp69C+JW3V3Y4REGeLnpJT6LT2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594160;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sYPK0zHlt9UxDqRXbbPbYofEwQ4ui24gzT+k2p3Lc/4=;
	b=TkqfUPe/GGcZdtBq+WJ8UfbKSv7lDRufoKLPDBTyo6AwPkZEKIweSJ1g3q1xe2Gnj3Ju
	 kTER0qmfjRO1p+7trFy2GpLzjrc7XrFN03L1KGAinRXvj4a2EDGbO2IbgSctPN5oNTBgT
	 6mzWde7VAysybDPYb7L6C3zV+sIUt8icbz0v4gpu+f0M/0T702ZTqKjZNqY/LmiG+qEY2
	 wnC97hSwqg4pO9iUNH8ohVWA8tHCJy5sIQ8q1gdg+0gd52rZEeygnvNU9R6g4j6eRg1XE
	 r2MOBMBtHu3YqOcMOhhT4uhsbO5WXROLDd6lJtRdYFznFCOLP+ZlQWTG17fHiOulODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5r4xfWP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B40606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5r4xfWP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F41F000C1;
	Wed, 21 Oct 2026 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594159;
	bh=sYPK0zHlt9UxDqRXbbPbYofEwQ4ui24gzT+k2p3Lc/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T5r4xfWP2PK69r+XNBkMeHyhCwi3cjamhJGZkcdMr/65YDJfxxbv9SEP7RvGcoQ+E
	 M8WE/+TpQgSFSHezN7NNnQxVLlPUxmXWOknkQcowvXzvYY75bTiX0ZfITUEBvmsE8Q
	 eN+SglFjuuQhhRRCXOesKqM7MeK78fZNFN2+oUB6oV/iIfV61GRe/xsMbSFNvCuuYl
	 30K1UhGl8Wiq/81OLEY+z54/uQ9O6zj3cLrhCJ+oE+pt80wSEIoczcRwuHLF1kBU1+
	 EY1+mUQh4m/VrQoHmsHyaBlLGBY8JruxJ4LAxvMuWCUtrbRc61G4Cy+Cxwl2ZjaMBY
	 4YXT8etkSpESQ==
Date: Wed, 21 Oct 2026 15:49:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, mark.rutland@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, lpieralisi@kernel.org,
	tglx@kernel.org, radu@rendec.net, vsethi@nvidia.com,
	sdonthineni@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
Message-ID: <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
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
In-Reply-To: <86se1zzcet.wl-maz@kernel.org>

On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
> On Tue, 20 Oct 2026 23:28:15 +0100,
> Julian Braha <julianbraha@gmail.com> wrote:
> > 
> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> > dependency, ARM_PSCI_FW, is met.
> > 
> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> > select conditional on arm64.
> >
> > ---
> > Julian Braha (2):
> >   firmware: smccc: provide stubs when discovery is disabled
> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
> > 
> >  drivers/irqchip/Kconfig   | 2 +-
> >  include/linux/arm-smccc.h | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> This probably needs to go via Sudeep's tree.
> 

Sure will queue it soon and send it as fixes at -rc1 or later.

-- 
Regards,
Sudeep
