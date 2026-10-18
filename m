Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76E3822B7;
	Sun, 18 Oct 2026 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355079; cv=none; b=mQfmF1VdenCmzPL2q6Dp+nhoCfLEQmis2HIv10lsbSVOL4Fy9Vrp/2iSdw2OjCvmsMK+4TjtweFnwUpq2T9A0mH0n46ujr4CflcHewynTGWQsSruDSAbatJ34mQ6GkuGV5lv6JdVMeWvh+bcQng577SYFvtzMGxCKh6y72ygSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355079; c=relaxed/simple;
	bh=8EXiAU+nnZhBF5RF4EXLhLVcIQpM1Oi6/k0fDL0+9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn9rqryAWnl6mFBVnorMJ3neP5YlEWle0OpEd9hwk1/cpqiQgp9jbFARq906hwm1ktln+SW+qbVITQYRF06+w49SCWuBN/RdLIenU+FHrO7VdkakhbToPNHvYcL+87FnmcurAGTgd7W5aYYnfXyU5hFe5rydqHL+xGhFaBaFP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G71m86tl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G71m86tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792355077; x=1823891077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8EXiAU+nnZhBF5RF4EXLhLVcIQpM1Oi6/k0fDL0+9hw=;
  b=G71m86tl20E1h4cwYfBlCA4oU3yR0KlCSGN7hv2Q88ZBY6FVQzhAegiD
   kYNIku1hOp8BGCdiqPv0Vpr+pJRo7hkr6ZOtvkch/bvFQjMHTcY0B757x
   6hCIRr59dtV2hpORFvt9FLONEBUBXrQudTpEh9BBAT/BZfqPbxJqPFKns
   gNtJf+Tl4eV4ZScM4YqU0W11lbiD1APmt5Pu0j0ju/AGfgQ6CL0ynVWuT
   HqKnCa3AGMQSXZpha9qJ6VqbYIN02EWMNTYSp2LCl3wCL2FJhz4P0jT/W
   4LOnGPd8QhwHKJc4/tZNexVve4RZEuI4FytOjQgxQ/8voLsWY7dddvcR7
   g==;
X-CSE-ConnectionGUID: xS9Tnh8HQiuDckORKhAgaw==
X-CSE-MsgGUID: ZN+MbEn3SvmnOGhDFLcAPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="951181"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="951181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:24:36 -0700
X-CSE-ConnectionGUID: 6Pv3eVJtRsSaTku0AUoctQ==
X-CSE-MsgGUID: YkXPgHIDQ52kYnwsjKOyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2476432"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:24:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6354B1203AA;
	Sun, 18 Oct 2026 23:24:40 +0300 (EEST)
Date: Sun, 18 Oct 2026 23:24:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: geocausa@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Message-ID: <atUrCG-efqA_x2bM@kekkonen.localdomain>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>

Hi George,

On Thu, Oct 15, 2026 at 10:48:19PM +0100, George Neacsu via B4 Relay wrote:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml
> new file mode 100644
> index 0000000..a1cbdb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov13858.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV13858 CMOS Sensor
> +
> +maintainers:
> +  - George Neacsu <geocausa@gmail.com>
> +
> +description:
> +  The OmniVision OV13858 is a 13 megapixel CMOS image sensor with an I2C
> +  control interface. It outputs 10-bit Bayer data over a four-lane MIPI
> +  CSI-2 D-PHY interface and takes a 19.2 MHz input clock.

I wouldn't mention the input clock frequency here...

> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov13858
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (19.2 MHz)

...because it's also documented here.

The frequency range is from 6 to 27 MHz.

-- 
Regards,

Sakari Ailus
