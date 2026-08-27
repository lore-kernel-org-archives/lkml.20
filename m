Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5A35E1A8;
	Thu, 27 Aug 2026 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835302; cv=none; b=laku+vicH2q/Vv78TDQRr9PAuX6ajg6w1aYzCQy/S4nd3RS2noZE/cBC61ADEHtqCKtr/AUfZW7xHG7/ljJ3P2poILJ2G0NmgIRnsfhnWQzy/X2wx0PSuyWQb1m6hdjEq1OAGDaX9qg/ugjxQGe4psEf+FOiqcO6NDQ0FpdHtAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835302; c=relaxed/simple;
	bh=U7C7BGMQfeCN0ZLAIAJVcxIudB1QZqmK4amq6u8Djtk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jD1URSOI4VZKj4sOBQGI2w8laXRcdDH5uP4hMN+8SzJxQtf+2S7mC+e6WuJDa6YEa26F0Pq7XsropzmAp0igpUaGchcl5hJR2GZzv5/aScHpdqhdcE6tuPoJh9/Ij+hQz+Kf+4ZPznMexz93XyqSe2VCNFM//T0Z2LTFDnIBDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rv4x/ZaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rv4x/ZaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715881F000E9;
	Thu, 27 Aug 2026 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835272;
	bh=Uab8XixMvl9fuY0KTPgI320rplR35se7Iqz6tpNjBCE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Rv4x/ZaVFpTSo4AHkZkrENSB9tv5PXzGFPfMZWB22kKGvg8QgDIVS57Icl5/o9njd
	 0riRj0Wh4BWBdImoNQ9Ev/fFw2D8XnYa/neEZ/ZjFsXspHFQhVJcrWGYnE4Z0/iEGm
	 jiz94IUyYRGs6BSJzBCORdG/BcTEBnskLp29463UdYEUT5i7l83wWiVKCSvCrVW/k+
	 QokL3jaZxJdmhoxbPvgFibVrFnEzJP9xaFX8mN0Y2h8W4GYgdCn4k4uqwVmUdK4nBm
	 95het6GEaNUA0huXs5y/UjuH6qvPlGI+mnHoXOLMkJdN+4f5twFjO0ybTfKDQ7yHAC
	 ojTbJU4UM1AEw==
Message-ID: <1a534147-b183-41d3-9c35-4b0e7d0ce15e@kernel.org>
Date: Thu, 27 Aug 2026 14:54:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 12/16] dt-bindings: phy: stm32: adapt usb2phy as syscon
 child on stm32mp25
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-12-c5e27cbc0795@foss.st.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-12-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2026 18:23, Fabrice Gasnier wrote:
> Adapt stm32-usb2phy since transition to syscon child node on stm32mp25.
> This is a temporary update, as it depends on Marek's series [1]. This
> should be dropped in later series revision.
> It's a precursor to validate further DT addition on USB and Type-C.
> 
> Allow usb2phy to be a child node with reg and unit address.
> It replaces the st,syscfg phandle.
> Also adapt the example, e.g. stm32mp25-usb2phy1 address, clock and reset.
> 
> [1] https://lore.kernel.org/linux-phy/20260816213849.1044073-2-marex@nabladev.com/
> 

Why PHY patch is squashed into USB patchset? Do not mix up subsystems.

> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  .../devicetree/bindings/phy/st,stm32-usb2phy.yaml    | 20 +++++++-------------

There is no such file.

>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> index ab6c943af9a2..3e8f57a46db3 100644
> --- a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> @@ -23,6 +23,8 @@ properties:
>        - st,stm32mp25-usb2phy1
>        - st,stm32mp25-usb2phy2
>  
> +  reg: true
> +

NAK

Best regards,
Krzysztof
