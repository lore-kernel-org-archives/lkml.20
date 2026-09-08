Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01B47CC96;
	Tue,  8 Sep 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856516; cv=none; b=ScM7e7Yd0zc3IKlAr3caJCZwkZKJwcuzlimhfzot8mHB6aTMDiilMfbPbzHk/LJsDT3ZWNKagLhSb60SCZl+jINXRElxE4zMFxZhvZnsgYDImdYJeD/KwOpyONCzfBfz/JoQt2kJrKfULe8/orxae0SnvLZ9w6Zd3eRghuyl/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856516; c=relaxed/simple;
	bh=jbFKZP3usfl3nbiXQQBQushr/COmFgv99A0YQe7Np5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxozRE4ssbxaFnxpLVOLsrDA9pcI/tW8opsdA5+N3zdixp47Mv2Cd5zFbVTsn8xOEUoMjbhjvWRoaZ1Wo+j6YlxFElUdLiGZaZfrKhmKRAuHEIoFjk6NfPbYfHYZxyCUFsE0gGTlc4okcQrFkcxbtp9F4nDCmsBuR4KDRlgmX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGpyb+kZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGpyb+kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788856514; x=1820392514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbFKZP3usfl3nbiXQQBQushr/COmFgv99A0YQe7Np5A=;
  b=fGpyb+kZTVM1ttqTFdFv8DWSPlQ9yRiNqPlITz6ElS1Li2+82h+I3k1i
   v2MRfb1yvNRS6QoW/EdS4s0f8edCvIN6sFhBB7QVUwrAJQERVj/HANwI0
   F0peH92bAjeDTVzrnR2/zyXr9WYm1tGYg0XxIJRC7WqvlUmeiNzYBs37H
   loMgxyZnPMjo8LUNNe9NMCfCvHShbFRi8SV0NzKQsD6enFieFgFVtHLSE
   VKAkbFySykgszatJNhqF/b4fHgq1t7ShC/f5K47lLE50jH5Z3aV8k1vj0
   JAZ1FaJx3+Hcd2qefPQ9/yuKHN75Z7c4D70TAhIJ+m5HCpmm1sPQdCGXb
   A==;
X-CSE-ConnectionGUID: +igQLLeNS4SKFqyPu+z58A==
X-CSE-MsgGUID: wlESh+TGQyykQX5BHX+3FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93071032"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93071032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:35:12 -0700
X-CSE-ConnectionGUID: pU9Z+xzrR/emitPm4jDWdA==
X-CSE-MsgGUID: PUIMPEdDRmalDned3mUMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270892197"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2026 01:35:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8409C99; Tue, 08 Sep 2026 10:35:07 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:35:07 +0200
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
Subject: Re: [PATCH v2 16/22] thunderbolt: Add add_links to tb_nhi_ops
Message-ID: <20260908083507.GC106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>

Hi,

On Sun, Sep 06, 2026 at 08:36:39PM +0200, Sven Peter wrote:
> PCI NHI drivers discover device links through ACPI or PCI topology but
> platform drivers, like the Apple Silicon one, can use neither of those
> methods. Instead, add a callback so that platform drivers can discover
> and add these links through e.g. device tree connections.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.h | 2 ++
>  drivers/thunderbolt/tb.c  | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index e4964772a442..addb8bcb4849 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -65,6 +65,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
>   * @ring_configure: NHI specific hook to program the ring options registers
>   *		    and enable the ring with the given flags. If not set
>   *		    the standard USB4 NHI registers are used.
> + * @add_links: NHI specific hook to add device links to tunneled native ports

I just pushed a change that does similar to my thunderbolt.git/next tree.
This is to support Apple T2 macs (Intel Ice Lake based). Can you rebase
this on top of that change?

>   * @is_present: Whether the device is currently present on the parent bus
>   * @init_interrupts: NHI specific interrupt initialization hook
>   * @reset_interface: Resets the host interface
> @@ -85,6 +86,7 @@ struct tb_nhi_ops {
>  	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
>  	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
>  	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
> +	bool (*add_links)(struct tb_nhi *nhi);
>  	bool (*is_present)(struct tb_nhi *nhi);
>  	int (*init_interrupts)(struct tb_nhi *nhi);
>  	void (*reset_interface)(struct tb_nhi *nhi);
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index d2832323cc36..72418a07166e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3434,7 +3434,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>  	 * before the PCIe/USB stack is resumed so complain here if we
>  	 * found them missing.
>  	 */
> -	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> +	if (!(nhi->ops->add_links && nhi->ops->add_links(nhi)) &&
> +	    !tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
>  		tb_warn(tb, "device links to tunneled native ports are missing!\n");
>  
>  	return tb;
> 
> -- 
> 2.55.0
> 
