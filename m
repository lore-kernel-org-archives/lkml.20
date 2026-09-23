Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21953B5EE;
	Wed, 23 Sep 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175103; cv=none; b=WHJEFCWRwExNb99sgK+KrxkEH/Uy4z1GgDnW1Kx4S2tVtAK1+SwSGgqXK/VmE2wC0h4EJbZR+WrHYBG90UePZMyPaA9Cq2++wQZgte2S83ykm9pUfbKWydMD4wqbhnSMnwE2ZfWr/sA0xCsLrdl4BdZenNI9LvcsM1h8dRu0wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175103; c=relaxed/simple;
	bh=xK2MlXxgtxYCpbwBk+vL+8tf5gPJ59nrPDl4GsNLsdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkdWyTR3ns3/VYAVjp0mEWid4lsXPa/VPiJtzXhlyFJXuK0On/hmzBzk7mvMECfBI9NWbpXGwpZfoTiVtRQpJ4wQhRxBjf0vqY6kf3zcrpJeY/N0bkhk3+WJE3ROb5dlqaLXFpgvgTPmPx+GlB0pAYJd0GA8I+JbRSw1gT3HUf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/FoePsm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/FoePsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175102; x=1821711102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xK2MlXxgtxYCpbwBk+vL+8tf5gPJ59nrPDl4GsNLsdk=;
  b=S/FoePsm+5+EJqLVPQZ6WZ14agKxBYbzvQsl+sUPMRwpna6q4tFcTGXw
   8P5muKdD+4PEU9x9YUQVIh3k700tH/JP5c6/yV8/KuDxYVK1qPzkqNWlO
   Wc5PzujnUfE8D+vmYGOvrfYBiJg6eefh+ScWpmfb11IBz6/bfvqA6JKOA
   ddPByK2+1FRhW3Taj3cW8bERFArIZPnBSHHpUmrJBFHRSnogdUw/pH2QB
   pZU/Kx+q+eHeGTwl1YMosTl6BqFNAizDa9D3PQNbwVbLwzM4us9RhLGIv
   irkJcRXq5j0PCwW6X5OblSiGBG0unu8/hOkFEFe8t3DEQrAzqCsItNeZb
   w==;
X-CSE-ConnectionGUID: G5E4f5mITC+VSUb2AUELUA==
X-CSE-MsgGUID: 0Z4GAOvWRc2vV0jM6uGo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90993969"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90993969"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:51:41 -0700
X-CSE-ConnectionGUID: m6CmCC/rT2SBGzb12fmptQ==
X-CSE-MsgGUID: vGPljTpYRP67n1RxHKwLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4728488"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:51:38 -0700
Date: Wed, 23 Sep 2026 16:51:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: add rockchip rk3576 vicap
Message-ID: <arPnJ0WQPEojPDBV@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:29:57PM +0200, Amin Gattout wrote:
> Add the compatible for the Video Capture (VICAP) unit of the Rockchip
> RK3576. This variant features five MIPI CSI-2 ports and a connection
> to the image signal processor (ISP). The pixel clock of each MIPI port
> enters the VICAP through a dedicated gate in the clock and reset unit,
> so the variant takes five interface clocks and five interface resets
> in addition to the aclk, hclk and dclk of the other variants.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait
