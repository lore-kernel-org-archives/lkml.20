Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530CD4EBAC6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556251; cv=none; b=pxH6PRTQI+SCyj0yzfJkSHmhsFqW8ALN3FpYqjaKoYpWn44PJbP7frjZqPhVXP6g0luEtV6dwDfytRERGWa0RyOjJjZKs+64vHd9snjp1/TeZQ0wflPtt0TIA1Vzgm59BUTMsRbYahvRrC1OTsFcD9/xOinN1SAWYvFId4ubMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556251; c=relaxed/simple;
	bh=5sS8Pv43xatXOJ2DntYftUU17HocoYWUvGVZRmaQXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ff2ySVAf2u+uZqENskaqdZTX20jJq6d70BGcisfFFMrdcR+2Wcd6TcJ7OXsEiMqbEOhyobzgT3/zZquGD80iEj6MWBmNcfxeanZneuDJxRlYOLAXNizhWx143HjonZ3b9ikDrs4+KgOuBw5P9YJYLgRuNwVs9e/+kG4f3Oy3DME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jl/i1j2p; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jl/i1j2p"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05199152B;
	Wed, 16 Sep 2026 03:57:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A8FF3F882;
	Wed, 16 Sep 2026 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789556242; bh=5sS8Pv43xatXOJ2DntYftUU17HocoYWUvGVZRmaQXc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jl/i1j2p1BX6BhBdjYRtagyYym1tFDsOw2ZvjpvW4sBBGK2hfgGcE5xfFemcxgGrZ
	 tYLQoj0zI+daIGgWA8BUzAQe08huBUV6J1EQQL0HHMfhY/nOhYOE2c9GfcuPORFpgQ
	 ab6D4JzJCZVKhcrhm9Zzeo1e1UuerEsN9kzJ07Ug=
Date: Wed, 16 Sep 2026 11:57:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqp2DRInEhzpEqAc@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..bf177d636b92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,10 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Indicates whether the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> +
> +		The value is one of:
> +
> +		0: the kernel is not running as a Realm guest
> +		1: the kernel is running as a Realm guest

Does this file ever read as 0? It is created only if rsi_present and
always reads as 1. That's fine by me but we shouldn't document 0 as a
value. More like if present, it always reads 1 and RSI is present.

> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..52f40256bd78 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -9,12 +9,15 @@
>  #include <linux/swiotlb.h>
>  #include <linux/platform_device.h>

Nit: I think we can drop this include.

-- 
Catalin
