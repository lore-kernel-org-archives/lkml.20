Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490841;
	b=1HK/17fCTTWGOi3Q++WZS51tYN/ci/+GfAHBR828ia+XTVCHzsIT3+dSOxdvq1nNQyuc
	 Ge/Y1qBkl+zVUGK282dny/87TsGjM/FylngzhCWCa2tQ3t5xan11A0g3T0HxdN2CMFQZy
	 +K3vUdzHG28/0tcRuV/VaFdMd2bA9pZwP4UaaZmhDpx4Jopci9bhyuY3AnndEmIRs1Ylw
	 AeRwXJg4vgn15B0e+Pp+MJtoOHms5UZyZ8Am3jhAQarCM1nLY6/zX+TdKlAluFXBQO5w3
	 9yQLG8wiuxutxeoEafc7ntVkoMP0zCuponldDTJhmyHP7rF8WCobkNZoksYHQ5IKDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490841;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LTx6K0H+HB18S1mekdTeGsQe+V+tpXMG7vZI1N5W/i4=;
	b=AdDW8iDi4P3YICwE361o3MjY3DzHKebQsq5sqD6T9fR5YJh/3betGep0RYq6sULHOOR5
	 6Ne9b3ZbDMQEo46aq/HCBKi9pQwtOQKLceLIxJ3aL1xK11MFXH6D/XRuPSORGbNnpc6ku
	 gHMHQAtjFgK1sBUZ0vZaMgtz9gjiUItxlcMfvZBsLoyvtr0XJM2pIPnaaPIxSV0HwF2b2
	 92UcKbZU0tJPdSHW14GpQkStWPpbebd5KV8bk62CD8+XphZoSct06et/bpMrvMZa7E5yB
	 iH5BcwwLdU3C2qvQ0t9IR1HRhP6pBeCxuNppvBuPAM4WySCh0RDFEjD5taEixkdyRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9nlm3Nl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24502606A319;
	Tue, 20 Oct 2026 10:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24502606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9nlm3Nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792490841; x=1824026841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gv+wGTsdGwSWa64CLUgqXHwlLl3z/tT0Go0vfuW1gig=;
  b=b9nlm3NlAdeme7zyj2fArpCuDSE4g3azg34W0CqBu2FStxzJC3Uau9cs
   nrHpqrktaVtVhyUtU+GlEOwIhQgSwUbcl8qcirS+TjYvvUvg9i2qmRW57
   Y2erj+MQiCmlhw+mDtjfUHF8k05K46beN027CSY8M9KL04QGtonam1MHB
   1texUCvFh6jnFhh5LyQ0s4xUP+WyIvs8yvRydJN7Jvxf52bOjIyCcMcLz
   GECUFv0kHJx/qAhEieqKFk7InKxhglfL2emJNLSxCwWfShzdDOVGa9VQi
   k6SsE7mcFjHci3bwD/KbHJM1lCutJQaaZZFmwTvF3cUigwpigWd4WUIR7
   g==;
X-CSE-ConnectionGUID: nY6JJ3eIRf2Xia3AHKaJAg==
X-CSE-MsgGUID: pZXohpnXS6+3HcCa2LIwnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1079908"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1079908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:07:20 -0700
X-CSE-ConnectionGUID: oBOjhDuYSHmJPaglrYqvEA==
X-CSE-MsgGUID: QsGZ9gaOTcaoNaHSaKQeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3151194"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:07:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7B11E11F7E8;
	Tue, 20 Oct 2026 13:07:15 +0300 (EEST)
Date: Tue, 20 Oct 2026 13:07:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>
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
In-Reply-To: <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>

Hi Dave,

On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> There are multiple members of the Sony Starvis 2 image sensor family
> that have the same hardware requirements as imx678.
> Add them as options to the imx678 binding, rather than duplicating it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> index 098f72544216..027872a134f2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> @@ -5,7 +5,7 @@
>  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Sony IMX678 Sensor
> +title: Sony IMX678 and Starvis 2 Sensors
>  
>  maintainers:
>    - Jai Luthra <jai.luthra@ideasonboard.com>
> @@ -13,21 +13,47 @@ maintainers:
>  description:
>    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
>    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.

You could rewrap this while at it.

> +  It is part of the Starvis 2 family of sensors.
> +  Other members of the Starvis 2 have the same hardware requirements, and
> +  therefore share this binding.

This paragraph could be rewrapped, too -- the limit is 80 characters per
line.

>  
>  allOf:
>    - $ref: /schemas/media/video-interface-devices.yaml#
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sony,imx678-aamr
> -          - sony,imx678-aaqr
> -      - const: sony,imx678
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sony,imx585-aamj
> +              - sony,imx585-aaqj
> +          - const: sony,imx585
> +      - items:
> +          - enum:
> +              - sony,imx662-aamr
> +              - sony,imx662-aaqr
> +          - const: sony,imx662
> +      - items:
> +          - enum:
> +              - sony,imx675-aamr
> +              - sony,imx675-aaqr
> +          - const: sony,imx675
> +      - items:
> +          - enum:
> +              - sony,imx678-aamr
> +              - sony,imx678-aaqr
> +          - const: sony,imx678
> +      - items:
> +          - enum:
> +              - sony,imx832-amr
> +              - sony,imx832-aqr
> +          - const: sony,imx832

Should we also have a sony,starvis2 compatible? Just wondering.

The driver isn't generic still as it requires sensor specific information
to be passed to it. CCS solves this with CCS static data (via firmware
loading mechanism) so there are no driver changes even if the capability
and limit information can't be obtained from device's registers or the
device requires MSRs.

> +
>      description:
>        The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
>        variant (IMX678-AAMR). The variant-specific compatible describes the
>        exact sensor variant, with the generic IMX678 compatible as a fallback.
> +      The same applies for the other sensors in the family.
>  
>    reg:
>      maxItems: 1
> 

-- 
Regards,

Sakari Ailus
