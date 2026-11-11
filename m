Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364530;
	b=EfiV8gPveaPNsu15jtVxtfE83uyMrZGUozhr9qmr1wIrFMBj7FN5URm/60hMCXkOdYxU
	 W+FSMAEQppyvG4s+cofNgfLm0dFO/VhM4jbd3N/RWVaE32uAr2tZiW/i3/4vCoMl4tm46
	 yq0CQR7T4+REtw4V7Y3I8rvG4JPtAhnN+KiIqaP0vYeNnfBLZuV6BkaSSZD5oA1MJ4fNK
	 e/WHk8nC13teWzxbBJ3bUmHlkGO3uad14VZbvn7ewAmV8zgK4ZBFN6cvuu9jCcshzgZCi
	 pCjYtIJMsyNRyozHMMv0jttNEVIxKrzWHjQxm58IUp1hpckGb8mou6C8aTIdOh0hSWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364530;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=;
	b=3DmCL/gz0lTRy0ew5JiWyDS6iBiWQUnYSLzgkxBDThyYc+269hPbmhLgFb4U39upijVB
	 RsEdV2PgQJAq90T3Trf1G+j8MeBvcL5iOvymJ7bSzVASp9qe/uh6Ozht8ryi8a/nVoyMH
	 48U492XSiNzHZ9WDPGL43qPs58mxU1zJYfAGvdlGtLS1eZQ1dOYper1ERGP1zZ+S8Aoi6
	 26rkevXajTs3xF8nKVB1bKgOtvvhXbRVUzjUVk/etpBkCzhLPchpKL88sa3PQu/rqamGS
	 9t7JcDfNFouZkMjUqEu4eV2UvA8K3v9fWe63P3PoiKHsqOO0Q8DX3V5wIwrV102Rdnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KjpTvGb/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAD3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjpTvGb/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EFE1F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364529;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KjpTvGb/4X9mKEH810dOhhaUHOo5iLr8WVxnxqmWYRpJuVVJU2ofYZVL93GJ5cgju
	 saSlTXA5okLlbwFk3Vx248sug+H1celxydL/n8VJ3zCmI6R1kESsERdAVMYN6P9/cq
	 im7CyIwzgDfu/3dZnhOlNWeBR6DVpOANkbo4m+ePKATjzCXWAgUTKachbkzbU/+OoL
	 bOrf4m24aoleTvqhKcsuJRDPbarAzEIKLzm3bkPj3ljzAtlxdUz/fvkF2Qdl3Tikb4
	 wHT23gf6FnFbm94HxmTH1LKmXDLJZvs0qMgaqrT6K+hY5Od4/rNrPoCp/NCo+/U/bZ
	 YjnjAbs9w8euA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so23526681fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvr/GVbiww1psSMWrfjl23aREkOqmzyWpKL3ODhF5Wb8eN61Lp7QB/3nMsZ+1PQyOL33MExWBBlyM5Qb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jSvYckhgGGp9V1i7RDHA49mpMRNIdpt3k2JaRvAdhQTZLfTHP
	TRD5RK1jpNZoJQUPKuWCYL7AuIDe0mBOyUFo9oftQEJbNHSpBHSQYwbtIiyCJ/pmUY/bLFLL2Es
	yLi6HkoT691y0apGw184T1M2gIjY5WU4=
X-Received: by 2002:a2e:bc03:0:b0:3a9:9a60:2c47 with SMTP id
 38308e7fff4ca-3ae126ed0f1mr1190701fa.29.1794364528033; Tue, 10 Nov 2026
 18:35:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com> <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 11:35:15 +0900
X-Gmail-Original-Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
X-Gm-Features: AclHuK9N0O7U9-W_pxCYXlT-RQ5jch4QkX4b2hO5JJ4vf-cajfPSp8p0sSn_nO4
Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: aiyengar1990@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> always reach the same host controller. On the Rockchip RK3588, the
> SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> which EHCI root hub port shares a connector with which SuperSpeed port.
>
> The USB core already reads a hub's OF graph, with one graph port per
> downstream port, and uses it for the port connect type. Allow the same
> "ports" node on EHCI controllers, so that a root hub port can be linked
> to its usb-connector node.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++++=
++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 908b02d9175e..9dcba539d60d 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -160,6 +160,19 @@ properties:
>        - host
>        - otg
>
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The root hub's downstream facing ports, linked to the connectors t=
hey
> +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> +      different host controller, which then pairs with the root hub port
> +      through the connector.
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]*$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Root hub port, numbered from 1.
> +

Would this patch covering all HCDs be better?

https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/

Also see Rob's comment about covering the port numbers.

ChenYu

>  required:
>    - compatible
>    - reg
>
> --
> 2.55.0
>
>
>
