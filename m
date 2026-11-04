Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778662;
	b=3p/zYWXbRCuRcQoJ1d2zKBZ1w1iUmUSTOl/lWifYmhiQUO//Ja6rbKLwHE1vw+qolVba
	 SIVoXGaQawjz7BXWs4wp7CI8PfoOqFrciiYrIXLYniLMQH2iZMNsG246lL51ed6r/xFrM
	 ZvPg99CgMU/J2dbu4y2h6uXWfoDIYLEGmVmUDDiigsK2ej7U9reXpXYNm5UGT57aVEtsN
	 /kuVVwbtPR63Tc7tlwejXdEeznS4y50saqSZJUc4nE6QU26pMDxqsdlsadIjxhCfYAVUr
	 qbwuHXVDlcrG+FAKFV5eWl9YdGG0Q7YNogjiNCL3Hb6yDkfNAGGveTFvQFVq6B2tXqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778662;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wib53BzBWIQ/iei6dV6vU1OpXkGrKSEW+nY3L1O5OIg=;
	b=ILi0QyNJfON0tWv1F5WAuShSIzTrnSVa8DKi4/HDkiJRyDxZHgAe7ak3cCTHWaZpuaOe
	 vWLED5B3/7B9NagoRDkppLV5XsjtPBxJIlrEmm7lUTd9E08mdftMhJOAryr6V8QVCqcEh
	 4olHnmHm1jbAHh4H0GAw8/puBZ3z4mOikutORqh6DB7DpfE/C57CxzZo3UiXza8d8YIP/
	 8EOG9IOi/ilvvukDkRxyMCLnp9B2b36YOKVJGSNC1yA0pH56KIm59XRmd7U3RRawRfXFs
	 wMWw1Otl8EZzSxJ9vJRsJS4W7feBvGKm+oz3xhDUrOqXl61LxX0ZYO8S2gBpvdPDreg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuCZxDfw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC808606A332;
	Wed,  4 Nov 2026 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuCZxDfw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A1B1F000C1;
	Wed,  4 Nov 2026 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778661;
	bh=wib53BzBWIQ/iei6dV6vU1OpXkGrKSEW+nY3L1O5OIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kuCZxDfwwPYseCHjmRpB6DbMkv90BKj1wP/P+k6wp9pXFCc3d7gpULh8ZvDONi26Z
	 1QubdnZHY+p7Xn5BjIX6HGpbscbtgK8sQnmh1uaWkwG5X6NXmY/IY18YW7bVkTyb5N
	 z0TGdc2bltmyKQfEYHh7oQibC1QOlmkVlPIemf8qOiPdVMjLPWDDJ9ukexoMMZIzDM
	 ZXNLmp0OF9yZ0CogbjG1PVlDCaQZwCAFzahPBawICH39VvjOaoG7RyOsecjXqCR4V7
	 QZF5umCpj2rXRh55TTqaFh1ah3TsyHwX3KlNvkq+v9Xq18XdD8u6Wc5cGE3ud91YjG
	 nBGF0LvJCzabA==
Message-ID: <b28d5657-8491-41ae-821e-2b8c4d212244@kernel.org>
Date: Wed, 4 Nov 2026 08:50:53 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
To: =?UTF-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
 <hongliang.yang@cixtech.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?= <Gary.Yang@cixtech.com>,
 =?UTF-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?= <fugang.duan@cixtech.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <20261103074929.1971195-2-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261103074929.1971195-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 08:49, Hongliang Yang (杨宏亮) wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller
> glue layer. Each controller has an AXI bus attribute configuration
> register and a controller status register. The glue registers of the
> two controllers are interleaved inside a shared RCSU region, which is
> represented as a simple-bus container node with an address-translating

Shared region is not a simple bus. Simple bus is a simple bus, so
obviously is not a shared region.

> ranges property; each glue node describes its registers as offsets
> inside that region. Mode strap controls are programmed through the
> Sky1 S5 system controller referenced by the cix,usb-syscon phandle.
> The CIX glue node wraps a Cadence USBSSP core as a child node.
> 


> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb-rcsu@91c0300 {
> +            compatible = "simple-bus";
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges = <0x00 0x00000000 0x00 0x091c0300 0x00 0x150>,
> +                     <0x00 0x091d0000 0x00 0x091d0000 0x00 0x20000>;

Drop node. Not relevant.


> +
> +            usb@14 {

So this is @14

> +                compatible = "cix,sky1-usbssp";
> +                reg = <0x00 0x14 0x00 0x10>,
> +                      <0x00 0x100 0x00 0x10>;
> +                reg-names = "axi", "status";
> +                ranges;
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +
> +                clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
> +                         <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
> +                         <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
> +                         <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
> +                clock-names = "sof", "axi", "lpm", "apb";
> +                resets = <&src SKY1_USBC_SS2_PRST_N>,
> +                         <&src SKY1_USBC_SS2_RST_N>;
> +                reset-names = "apb", "core";
> +                cix,usb-syscon = <&src>;
> +
> +                usb@91d0000 {

But this is at @91d0000

You have completely fake representation of hardware.


Best regards,
Krzysztof
