Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFB494801;
	Tue, 13 Oct 2026 06:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872004; cv=none; b=Fin/HsCnqW0u2URuZYc/rOWljpnEaTarBbvl8qp1JeFxAuMrDpyXezR5nVhymPmtOz0BFE+Dyek/vClssdCcHPZWlM/i1Kp2QTY4Ke/KAjqbMw16INBmUBCdoRkxNZ+KTt/XUkNjzkL2unuNxOz2l7CL+90ftyy0wKd1k8k8Pdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872004; c=relaxed/simple;
	bh=uCfDu7NGVDS/BJcOCzDXY18dfkRzCnjRUgoQirT3was=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ik40fFbqajIaQYMnnJyZxf7FbGTyLroKJgDnHlz2IBd3GuZA2cWhuB/6tjXREWWNftbG6eKqy5Oi9iOkgx+bVQCp5xISUfr75HoOPxrtcCY8BbCoePu4QeZ6+atWdkKoTc/pNexAsodGnlcKe34hkL4BF3GVnNnOgaJXFQeiLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL4Lvvo0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL4Lvvo0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB421F000FF;
	Tue, 13 Oct 2026 06:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791872002;
	bh=VAjJS8y/pwKMxfnMR6HNsywNq05ihnTtIJYUO0nsExg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VL4Lvvo09cynrt6fzqpM7YovtfU6yGr0oCjv3yJCv2D6cPfMA1XW0OqSEN61iAmeN
	 DyYQjEn96WlKOPOd4NEfQCgwYY6jjyCv+Q8LqHhZp9XPwDl+P6w1LATOcj3WcRAsYo
	 XujztSqk/D7aYkjrWqBce/k2xosvWpKZ36rG86XUYTk+iIfv7lTuzPjiFwt6hswciW
	 SMsqTh8gD+6Vrm8psGWg6iMJUkwjePrfjksSXXDUFbqeV9oH0CPj3iUIwiwqAY62mV
	 KVveEwYQxL51CGVWMpuPbY2KSTVI7a1uqN2lSMuhBE+ga7lkqnkhNBHe2Zqnp78A3Z
	 vtkeNfngzXHyg==
Message-ID: <c83d3a5e-d782-4086-8604-e5d214355b7c@kernel.org>
Date: Tue, 13 Oct 2026 08:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] dt-bindings: usb: Add NVIDIA LSTP USB adapter
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2026 19:36, Adrian Ambrozewicz wrote:
> Add the binding for the NVIDIA LSTP USB adapter. The device multiplexes
> SPI, I2C, GPIO, IPMI and UART channels over the bulk endpoints of one
> interface and reports its channels itself, so it needs no device tree
> to work. A node describes what the device cannot report: peripherals on
> its buses, GPIO line names and hogs, and LEDs.
> 
> Channel nodes go under the device node or under the interface node, as
> usb-device.yaml lays out for the device's descriptors. The GPIO, I2C
> and SPI channels reference their own schemas. The IPMI and UART channel
> nodes are defined here and carry only compatible, reg and status; they
> exist for status = "disabled", which keeps a channel the firmware
> reports from being used.
> 
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,lstp.yaml  | 280 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 281 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml b/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
> new file mode 100644
> index 000000000000..62b21051ab20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
> @@ -0,0 +1,280 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nvidia,lstp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA LSTP USB Multi-Function Device
> +
> +maintainers:
> +  - Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> +  - Donald Shannon <donalds@nvidia.com>
> +
> +description: |
> +  The NVIDIA LSTP (Low-Speed Transport Protocol) device is a USB device
> +  that exposes function channels (SPI, I2C, GPIO, IPMI, UART) over one USB
> +  interface.  Channel traffic is multiplexed over the bulk endpoints of
> +  that interface.
> +
> +  The device reports its channels, their types and their IDs itself, so
> +  it needs no device tree to work.  A node adds only what the device
> +  cannot report: peripherals on its SPI and I2C buses, GPIO line names
> +  and hogs, and LEDs.  As for any USB device, a node is matched to the
> +  device by position alone, each level by the port number in reg, so a
> +  node suits only an LSTP device hard-wired on the board.
> +
> +  Each channel node is matched to a firmware-reported channel by reg (the
> +  channel ID) and compatible (the channel type).  A channel without a node
> +  is still usable.  A channel whose node has status = "disabled" is not
> +  used at all.
> +
> +  Where the channel nodes go follows the rules for USB device and
> +  interface nodes in usb-device.yaml, which depend on the device's
> +  descriptors and not on its compatible:

You again explain bindings. Description explains hardware, not repeats
schema.


Best regards,
Krzysztof
