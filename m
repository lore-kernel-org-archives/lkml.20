Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50430ACEE;
	Sun, 13 Sep 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290428; cv=none; b=CZ8WkBOuAgos3YEoD0J+6U55dsFuq4Ejg0ld9F3Sxv1YUtqC2/heaFfkDnVqn2i/UWsKeFbLfhVfm3qxgfAKtGl1JAS8iRYWxtoEYwFRGKXy/P2L9eozNo7JoZ5zStVWOQY2x54d3ZATWIXGK22FiJXhENlhLxSlHDl2sSBcLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290428; c=relaxed/simple;
	bh=HBdNLXg4m5zcfn1OXfY0koxXsJ4Hjl6+AHgiwPlXhog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGKQeHEyGDpF9kn8BkuqVUQRQRRGft2XPOPhY41avRY0vMPcOJTLH4UuK+V0Qo6zuNdd6es1dEN44F4Qi7plkwfXJQ7k0I5oc8bB0d8BdRPBzcrGhjWbaRYEU//58Ra/rLUiB2cCa83E+K9qEUwPaZl7sxXA5/VUXIh6fRa0E7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOJL0gXm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOJL0gXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E230E1F000FF;
	Sun, 13 Sep 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290427;
	bh=4/Bq7tOnlayzIDYuXu+dU4jEPxci8EEwwyqSsPenNfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BOJL0gXmhSFQZMXx6zd13OK1ScUc3hUupG4TbI1fOHkdOflD1AiC9piKkzOb/8QwX
	 zzhqdDOU8tRB3aMa8L9KvsXTErIxnSrVwF6D9FmJnrnoPjFZQ1/ZhCFg7cN4XHrGQx
	 sHnxvacv61eCwyeJ8mJR3w2e+xZBKrPDneVM4Pdbi6pgcAiQXouFEKaBJ4lwLbSes9
	 4X1So43JOqxoxt/4mXREQ/uzPSt5JPyQ1/7zkPwh4jp/e0RDloE/H1NNrV6dPEX0db
	 wSMegm6Xl8pvG4pGgQo+1NihZBIAbsfdHWBRjz0Vtm3znqSZmCTKk5fh9ms6/D8q0s
	 5noMf+W2hlI4g==
Date: Sun, 13 Sep 2026 11:07:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>, 
	Yaode Fang <Yaode.Fang@ite.com.tw>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: ite,it8851: Add IT5271 series
 support
Message-ID: <20260913-sincere-wolverine-of-refinement-d1f3e5@quoll>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
 <20260911-ucsi-itepd-it527x-v1-1-14c8041afb53@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-ucsi-itepd-it527x-v1-1-14c8041afb53@ite.com.tw>

On Fri, Sep 11, 2026 at 06:17:57PM +0800, Amber Kao wrote:
>    reg:
>      maxItems: 1
> @@ -63,7 +73,10 @@ allOf:
>          properties:
>            compatible:
>              contains:
> -              const: ite,it8853
> +              enum:
> +                - ite,it5272
> +                - ite,it5274
> +                - ite,it8853
>      then:
>        properties:
>          connector@1: false
> @@ -154,3 +167,48 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

No need for a new example if it differes only by the compatible.

Best regards,
Krzysztof

