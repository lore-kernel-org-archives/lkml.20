Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1D3ADBA7;
	Wed, 23 Sep 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174273; cv=none; b=dBWU+OZ+t0iBEoXUAHh5M0h8/G35+4zPBO91TYXuCKqjgNbqKHVl0Q4udZN4BuPL7M+Sa9y/t5PmAJ2OJ6+rsIjFipgaXuvfSeD2S2UiY6cL5vzdPRuKSZVvICz6FdXAQm+4WH1kU58zva9bIaBOBf5sHP9XzXJ+ByOBYHYPv3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174273; c=relaxed/simple;
	bh=dsl1YCwoDeYP9QmGMRAGNj+aPB82/2DMvVDC0LuLiqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGQKPInEyCSWuTR1FkZxkayEZ9RHorYiet1OEkyUynm0D/EY4EWT+dSp4TTaYOpjXkAXPaNpddsNocKABBsVVO6BeOdn+0+xcMmMW2LJ+oY8ZOFkKhXaUlaRXpF55wVu0YhSy+xqqO5GMbhuRV9CMRdd9PX4aKJ8D5yHqbS0guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGhGqc7P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGhGqc7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790174271; x=1821710271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsl1YCwoDeYP9QmGMRAGNj+aPB82/2DMvVDC0LuLiqU=;
  b=MGhGqc7P7/Sl0BFrJp60gMzU1f9i6sStS13MY4OQY8fbhYrgC92/sg/c
   ZlQ0b93vazPNG0IxcvIVWge+YGYqu+4xcFaPkfmvYuUgG2RdWXf38kDSm
   LU2W1VkWQ0rmLXV2LvYwTQKM93uhiCral8ibZj9lEUKzh9uWXD3E/wFIR
   OJgZAd1Wwn5QcFJ0mM6opJBDnoJtqv9/5rONUgpxkRMI6pJ06TZ0lIA15
   K1F1m44sY4YIEUHNlcl58oJGmb7RjHm8NXaJD5wqnWmLoCiM6p4KRr2q9
   4QR8zv4KsIrt4oIW4ZpiD9KuP/KTmwUEEs0SMSQNsj0+LLRQ8U5DijYzJ
   Q==;
X-CSE-ConnectionGUID: kyJcDSn5TxSqZFI8NkwERg==
X-CSE-MsgGUID: e4vXZWAFQKOCHDYrUN3e3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93375529"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93375529"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:37:50 -0700
X-CSE-ConnectionGUID: xIdu7W2RTAeaQNWHbrwklg==
X-CSE-MsgGUID: ubVJ2sRKQLKW38djxC7DEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273116363"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:36:05 -0700
Date: Wed, 23 Sep 2026 16:35:56 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video
 Capture unit
Message-ID: <arPiz67nCQRPXdh3@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the series!

On Mon, Sep 21, 2026 at 05:29:56PM +0200, Amin Gattout wrote:
> This series adds support for the Video Capture (VICAP) unit of the
> Rockchip RK3576 to the rkcif driver.
> 
> The RK3576 VICAP features a digital video port (DVP) and five MIPI
> CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
> register blocks are laid out differently, the ID_CTRL0 bit layout has
> changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
> capture size is configured in the new ID_SET_SIZE register. In
> addition, the pixel clock of each MIPI port enters the VICAP through a
> dedicated gate in the clock and reset unit, so the VICAP claims five
> interface clocks and five interface resets.

[..]

> Amin Gattout (5):
>       media: dt-bindings: add rockchip rk3576 vicap
>       media: rockchip: rkcif: add a register index for the MIPI capture size
>       media: rockchip: rkcif: add a callback for the MIPI ID_CTRL1 register
>       media: rockchip: rkcif: add support for rk3576 vicap mipi capture
>       arm64: dts: rockchip: add vicap node to rk3576

For the series:
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
