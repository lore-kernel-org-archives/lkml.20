Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE7470EB6;
	Tue,  8 Sep 2026 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856327; cv=none; b=V4cchgEsNbSU0TeAXDVsHAElHSt1zJ7KofSrYZcd3iuRtNQNDKvBLMxD1L+04qRbJ8paOOJlOcvq5UoaT1mpvrOktxDVJ1MvaAd/R0trydJoMTlcNV/yAYwAsqYxW1n7YAmlgCiW++eOfT5EojhJFhWE9KkEoNwHjBGRd2WrrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856327; c=relaxed/simple;
	bh=nOT4Eoib7zA3suYgkaqyyF849Y+bZjaLnTlxfZH8Emg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWC4n9BaU4+y5Rscs3R+v6JRwaM/57RHoM3UeEqEAZQAOF866uPQ01prynAWKXeVL+aT++EZrWHQUVQuIQKG6CdmzvUsVRpi7wy9XVZef9/WelYk3G6/8OjIR5ALVrbfnT4WEQ+LPSC4JK/o93MVsNdNvkP9KFvWfqXyyiQEqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lExQIWbD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lExQIWbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788856326; x=1820392326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOT4Eoib7zA3suYgkaqyyF849Y+bZjaLnTlxfZH8Emg=;
  b=lExQIWbDrxBK5Flk/H90pE0DbSdAsKeN0Hs/Y6jg6RwGrxVKMZs4BQ4h
   8eiUYrcouP70ajdcibQfvjqkFciFmYkk81OvQ5Dpz8XK/NCK/0mYTZhq1
   LnoFCrcst/exTe5J38+Cp/PnSHOoCWEQPAEY2GLg0HuzNP5ElnrvOKYeE
   5EbiWday+qevVno2xMzkE9p0F8FyQ0DX9xQZCmoiB7u9FqZhzG1hJHZEq
   0Hd0S3KDzSoNTt8xmLxuHrir/mEZRaw40Nrh1ECMU3d0B3Gg0hd3ut6H0
   yvtOTnCuYPkYtij0AyFr3fDHL13hUTCF4S1wcqwa2eHDD3j80JyLZ5XkB
   A==;
X-CSE-ConnectionGUID: xfFELfqfSwa8iH6IFt3UBQ==
X-CSE-MsgGUID: FIBb6XvsQwq4bLk4wGuALQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100607205"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100607205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:32:05 -0700
X-CSE-ConnectionGUID: L0vP5RY3Q8CzJ4V843MEdg==
X-CSE-MsgGUID: s0OkRcE2TVSoxzUM3lwz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295832154"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 01:32:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A80BF99; Tue, 08 Sep 2026 10:32:00 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:32:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 13/22] thunderbolt: Add ring register accessors to
 tb_nhi_ops
Message-ID: <20260908083200.GB106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>

Hi,

On Sun, Sep 06, 2026 at 08:36:36PM +0200, Sven Peter wrote:
> The ring descriptor and options registers are laid out differently on
> the Apple NHI. Add optional tb_nhi_ops hooks for their base addresses
> which fall back to the standard USB4 register layout when they are not
> set.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.c | 32 ++++++++++++++++++++++++++------
>  drivers/thunderbolt/nhi.h |  6 ++++++
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index fc54ff7edfb9..1b1e4a12c744 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -179,19 +179,37 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>  static void __iomem *ring_desc_base(struct tb_ring *ring)
>  {
>  	void __iomem *io = ring->nhi->iobase;
> +

Unintended change?

>  	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
>  	io += ring->hop * 16;
>  	return io;
>  }
>  
> +static void __iomem *nhi_ring_desc_base(struct tb_ring *ring)
> +{
> +	if (ring->nhi->ops->ring_desc_base)
> +		return ring->nhi->ops->ring_desc_base(ring);
> +
> +	return ring_desc_base(ring);
> +}
> +
>  static void __iomem *ring_options_base(struct tb_ring *ring)
>  {
>  	void __iomem *io = ring->nhi->iobase;
> +

Ditto here.

>  	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
>  	io += ring->hop * 32;
>  	return io;
>  }
>  
> +static void __iomem *nhi_ring_options_base(struct tb_ring *ring)
> +{
> +	if (ring->nhi->ops->ring_options_base)
> +		return ring->nhi->ops->ring_options_base(ring);
> +
> +	return ring_options_base(ring);

This is better IMO. Although I think even better would be to populate
nhi->ops for both the standard NHI and for Apple (and possibly others) and
then we can just do:

	ring->nhi->ops->ring_options_base(..)

or with a wrapper like this that makes it slightly more readable.

It does not need to be part of this series but wanted to mention here.

> +}
> +
>  static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
>  {
>  	/*
> @@ -199,29 +217,31 @@ static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
>  	 * are ignored by the hardware so we can save one ioread32() by
>  	 * filling the read-only bits with zeroes.
>  	 */
> -	iowrite32(cons, ring_desc_base(ring) + 8);
> +	iowrite32(cons, nhi_ring_desc_base(ring) + 8);
>  }
>  
>  static void ring_iowrite_prod(struct tb_ring *ring, u16 prod)
>  {
>  	/* See ring_iowrite_cons() above for explanation */
> -	iowrite32(prod << 16, ring_desc_base(ring) + 8);
> +	iowrite32(prod << 16, nhi_ring_desc_base(ring) + 8);
>  }
>  
>  static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> +	iowrite32(value, nhi_ring_desc_base(ring) + offset);
>  }
>  
>  static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> -	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
> +	void __iomem *base = nhi_ring_desc_base(ring);
> +
> +	iowrite32(value, base + offset);
> +	iowrite32(value >> 32, base + offset + 4);
>  }
>  
>  static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
>  {
> -	iowrite32(value, ring_options_base(ring) + offset);
> +	iowrite32(value, nhi_ring_options_base(ring) + offset);
>  }
>  
>  static bool ring_full(struct tb_ring *ring)
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 4884c3f5a2b2..3a963b0b5b46 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -52,6 +52,10 @@ extern const struct dev_pm_ops nhi_pm_ops;
>   * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
>   * @request_ring_irq: NHI specific interrupt retrieval hook
>   * @release_ring_irq: NHI specific interrupt release hook
> + * @ring_desc_base: NHI specific hook returning the ring descriptor registers.
> + *		    If not set the standard USB4 NHI registers are used.
> + * @ring_options_base: NHI specific hook returning the ring option registers.
> + *		       If not set the standard USB4 NHI registers are used.
>   * @ring_interrupt_active: NHI specific hook to activate/deactivate the
>   *			   interrupt of a single ring. If not set the
>   *			   standard USB4 NHI registers are used.
> @@ -70,6 +74,8 @@ struct tb_nhi_ops {
>  	void (*post_nvm_auth)(struct tb_nhi *nhi);
>  	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
>  	void (*release_ring_irq)(struct tb_ring *ring);
> +	void __iomem *(*ring_desc_base)(struct tb_ring *ring);
> +	void __iomem *(*ring_options_base)(struct tb_ring *ring);
>  	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
>  	bool (*is_present)(struct tb_nhi *nhi);
>  	int (*init_interrupts)(struct tb_nhi *nhi);
> 
> -- 
> 2.55.0
> 
