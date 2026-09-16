Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AB3EC813;
	Wed, 16 Sep 2026 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541615; cv=none; b=g6TnXo/HoiEXe3eUNIf9SBnG+h1wgEOBAzUdx4AO3s4vWRcDzXnk4VjQ8gmzueqMValoGAFY0ASNKJEqyUddUZk5C/01jnZ7mn5Yae6wLxdzCBex2fCJDA+Ad3GYS/+0uaeCXlHSwF7RHKxL6r8TU0cCX+Cs2cBnP25O8xVxlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541615; c=relaxed/simple;
	bh=uoRP0/4GA2zBryumgFI/uqSwGga2IHXaKuv9yFTtyWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCSdm8h1FObgq/IkbkAU/xdlb1B7JVhW9WSmI1ZwzaACv3HF5gR6rXwbck1XYXGfJvUkyxZEdP77ZO5EU9DgrAuv+45/M2drGAeyspTaaciWdfVPC15K7fObMbdj2RyWmGo1to4uC7XjNzXojh0wUDh1moVVs3nnOU00LzmD6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmEh+rI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmEh+rI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA4E1F000FF;
	Wed, 16 Sep 2026 06:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541614;
	bh=13xcmcmR7AZeAAIk+eISQI1Df8FCi7PbyWP1mA812lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dmEh+rI3uieLexgKe9CkRQwp1LNSrHXaTZleEI8JJJUUmWA1am7Ll/FVvIbJ9ms83
	 m4s1IKq6pa5cRZw/QaStQfDiiW23ZFkWAtMGsf1K60bZak9Mhy3y5SB1k2/Y0eX2oG
	 31WxgvIMU9u4fm8xuNg8QSR+nSd06yjQ1cy15U1ZsWRKry1exAkjn9ZiuM3YPWE8Ho
	 SNOoHzwCgw5omC1YePQN1Y9JQ0/5ViDuhDlMOb18dRFh+tiJeo6B/zkLC/Xlcc0tti
	 ppUmnHp6nS9CHF4u81JRlhaN6lAw2OdNmqYsTRvIYIE1JSphKbYZeMyNxc4xshjL60
	 EmGKOkNk8DDxg==
Date: Wed, 16 Sep 2026 08:53:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
Message-ID: <20260916-imaginary-glossy-stallion-c769b5@quoll>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 05:56:49PM +0100, Srinivas Kandagatla wrote:
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> new file mode 100644
> index 000000000000..9a6c309018ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCD9378 (Tambora) SoundWire codec
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,wcd9378c
> +      - const: sdw20217011000

As pointed by Rob's bot, this won't work with current soundwire bus
schema. If it is the same silicon, then usually it does not warrant a
different compatible, even front compatible. For example same chips are
used on I2C and SPI buses and the difference is coming from the bus.

Last time I doubted that "compute" and "mobile" modes are a real thing,
but if you say they are actually different fuse values, then they would
be real. That could warrant different property, e.g.
"qcom,sdca-compliant" or "qcom,separate-tx-rx-interfaces".

However my points from Jorijn patchset remain - the top level wrapper
node is a fake construct to solve power sequencing issues and this
binding should allow fixing that one as well.

> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,port-mapping:
> +    description: |

You can drop |

> +      Each entry maps a slave data port to a master data port.
> +      Entries are in order starting from slave port 1; slave port 0
> +      is reserved and not represented.  Compute mode uses 8 entries
> +      covering DP1..DP8.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 8
> +    maxItems: 8

Best regards,
Krzysztof

