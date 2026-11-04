Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801564;
	b=DiWmu1vOcxB0EsdMvdYle7LJmRtjF2pc8dE/iXreI3RUJ+SpLEcXTIIyLfjKTar3xlKr
	 yup8tuGVa7njxzq5Uk/NpLMMzpU46YYd7dZI4+oM0jNrBVIFsprE/+hdHWrr51XmRUIhU
	 FsMKrEAIpNrZwEl/KXxpru9NlCvAl20XV2D5K+iuJvP3M6STorH+Jf2b18OKPry1Qy1bv
	 JuQID7WX6Tj8wg22OR8NfQPvHemIVrLNOFWt6gR02kWc89xi+9shb/Lj0TK/wBisLs/6p
	 g4gqQpVp0Ne98Ph76+9DWDwcL+xIgK1mtzkGo65R68a6ll9m9Iq5zqF4ghbXdufgYgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801564;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=38VA2H8qePqwIYJK9Lv4rw/Z1vAKKdfl7oNR3G6+SJI=;
	b=3dlWoPTLKNRIYDgZaU2L9YJhVWSP1zerGqlpR0tpy7L5NgUIRIT0GCGmMcWip7I9T6Zb
	 VUZLy4i1Xcv67Exjvu+LFKWc9FRJcYyJJafOzh1GZDq4R1VwUZ5CC1rtD8pTdIdGCowwk
	 nAshxSMUK/UvkqquTjZ6wJU/5oilx81QlvZLzsuoMJpA5OeUkL00COpTVnqYexM66YU8D
	 DC3XbAAZ5f7uxuS+n5V1UyTawNljAwGSEUX3WDhUczna/tqf0ZhY1X/BDLqHO7cy8hhWD
	 RX27vdRFUtlFkItectNHPH2PnHWxUC2FpYL4SIuZgMt4a0pFS/BUK9Fqp/n8I1wTiNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Y27fbood;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63E606D805;
	Wed,  4 Nov 2026 14:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A63E606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Y27fbood
ARC-Seal: i=1; a=rsa-sha256; t=1793801520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bQYKs196rSiPGxQeYxLhdcR4wUIngL0f/yXgK54vvVTSezep/ONBq+joeSwvY0aIN6IHtfUdz7QiaVQ1/6fx8Fsr2YMeveTe3TdAMNTw7+DYXD3Rf8LGV3zlvPMeCOnPg59TvNsVRychFnZ766sq1LdaWmnj+EXrRhwqaxAYAoY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=38VA2H8qePqwIYJK9Lv4rw/Z1vAKKdfl7oNR3G6+SJI=; 
	b=Ed3ivu8n0G9LKn/VaFdEtkANv7oOLCWpocC2DzEOf13hHdq5lb6kne5LrTCAkMuANzOfUgRq+Kty7l+2hwGoxyqBEwb9qPymzj2KYBOsZpP1cdq1nQ2WmDRaOjuqe15wbNsk/+8j7VGzLDadjNr8nra0wFyZFfhFvmISmPSGX7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Y27fbood1Jniyv7xBGuSLZuTGoPm6SRJ4zpj1RRiD0UfziWrPP8e8/47iJjN3ThiwN6jtIIc6pDWkx57crt/DrtgvUUADfKjKrAVJCQTB+OggOpxRgV6AcDAaG4JwQzzGgd0c/dDYa09v9gK+7W91u0oTuZNQp2pIwhhPXfbmpA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=38VA2H8qePqwIYJK9Lv4rw/Z1vAKKdfl7oNR3G6+SJI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793801515774141.0800348467958;
	Wed, 4 Nov 2026 06:11:55 -0800 (PST)
Message-ID: <ef957061-9f29-48c2-9b23-8764a65d7989@collabora.com>
Date: Wed, 4 Nov 2026 17:11:52 +0300
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
Subject: Re: [PATCH v3 04/10] dt-bindings: media: snps,dw-hdmi-rx: add a port
 for a bridge in front
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
 <20261005-hdmirx-media-v3-4-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-4-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> Describe the OF graph port connecting the receiver to an HDMI bridge in
> front of it. The schema sets additionalProperties: false, so without
> this a device tree carrying the endpoint does not validate at all.
> 
> hpd-gpios is the +5V line of the HDMI connector, which the source drives
> to announce itself. On a board whose HDMI connector belongs to such a
> bridge, that line goes to the bridge and there is nothing for the
> receiver to sense, so the property cannot be provided. The name is
> unfortunate: the hot plug detect line the receiver drives back at the
> source is a controller register, not this GPIO. Describe what it
> actually carries.
> 
> A board has either the connector wired to the receiver or a bridge in
> front of it, so require exactly one of hpd-gpios and port.
> 
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87d0e06a..896f8ffbb5bf9 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -63,9 +63,21 @@ properties:
>       maxItems: 1
>   
>     hpd-gpios:
> -    description: GPIO specifier for HPD.
> +    description:
> +      The +5V line of the HDMI connector, which the source drives to announce
> +      itself. Despite the name this is an input to the receiver; the hot plug
> +      detect line the receiver drives back at the source is handled inside the
> +      controller. Absent when the connector belongs to a bridge in front of
> +      this receiver rather than to the receiver itself.
>       maxItems: 1
>   
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Connection to the HDMI source. Present when an HDMI bridge sits in
> +      front of this receiver instead of the connector being wired straight
> +      to it.
> +
>     rockchip,grf:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
> @@ -88,7 +100,12 @@ required:
>     - power-domains
>     - resets
>     - pinctrl-0
> -  - hpd-gpios
> +
> +oneOf:
> +  - required:
> +      - hpd-gpios
> +  - required:
> +      - port
>   
>   additionalProperties: false
>   
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
