Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384516;
	b=cd5BmUUstgFUpBW8uvhtm/c5KO28Hlk1KgCJpF+75kC3xcn33oS1y1/tKx6tM2sAg5g/
	 79A6UCZGbNb38zrJV0T4jLF+4IgGgkhj1oNFdSy80Led2orQIdHZY58/DZpIOIzapLgFg
	 KP2KK9Tp8GWkuQMZxS4pVAuux963MMqO1kGEvECDaz3vqbxw9aoj7zbKWC/ldti8DU9dZ
	 4/94epLlHt/VDLJC92xpEQHAZT0Rq/rTHhys+19zY05bpTlsR/JbOXwggsAhNYG5c1DQN
	 uVUSVQ8CrLnhrn5a7Ler60ltmfD5usmITZr/3WSzXy9n5elY2Cf4kKVfKRWk9hBrs6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384516;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=5nv0wC5Go1XJNaxDD1nOfqVCMVLbai1ksiJmJqJBQiY=;
	b=HAad42M0GpVjZ3oRKNbhAScmNyVKnGmRQfPYInmegTbmvuBy6vZDpJtDwyN4Dc5QCN2W
	 VrlQWkOeqM/g2GnfZgdke6UEdpyy6P+bc9WUDnlydnWrCshfyrTTxKsjOxNeBkmbF17k4
	 DoHU9UEw1OOufa6ccFbeMiYHYGSvbZsV37owj5XiqYgUVt9tgi9AYdfzCOpzYPKArLAfA
	 XkrWkrc0d0BVTkqD3JMqu8jfSvMJQ3i5Aa3ds8U9pIhyQ5pNZpb6tWqiG38aunuMlfGRN
	 cHzHVgLYKuO4wRk0rPTiZB7cJBW9c1ombdZ3YM3LdoR5o4+H7HOzg/2k1Ut0S7GCGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F2ISqEj/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E50606A31A;
	Fri, 30 Oct 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2ISqEj/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731F21F000C1;
	Fri, 30 Oct 2026 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384515;
	bh=5nv0wC5Go1XJNaxDD1nOfqVCMVLbai1ksiJmJqJBQiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2ISqEj/jPFHsaWT4fWEIwvawOQdaVOY4wkBPBZLVvmitSZblbsI/J643p8P7gpbc
	 Hb7omRlAG9gvX7leULcIVigq+YZfKDVsRrTqb9ZS9R7Xu1pmuhAor805J6AsRJIjpQ
	 BR7x/471R3zaQZvk8VDig1A1VxrPjIQU4ro3lSdFTq2hDgGKjbFfSNurLKvAM1YTu8
	 16jhr4K+Y9cT2tlBeehNwizvzvRWsEubccTWjQeMIIlpiwd/yp6pxDprc8LqlpY+St
	 WwWx+ONeNJUmFgoYDVxh+YOHlaRemuEQo3poj9WuljxHGS85YN6pEo5HnxwtpyPYs2
	 rfT/Fx8AEt3VA==
Date: Fri, 30 Oct 2026 13:21:51 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261030182151.GA1206797-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021172819.668120-3-florian.fainelli@broadcom.com>

On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> Northstar Plus uses the Northstar Bx PHY register sequence but also
> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> clock enable.
> 
> Add an NSP compatible with a required USB2 DMP phandle. Describe the
> shared PHY relationship with EHCI, OHCI and xHCI so initialization
> finishes before any host starts operating.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> index 7fd419db45d0..00d69b86cbff 100644
> --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> @@ -14,6 +14,9 @@ description: |
>    Known B1: BCM4707 rev 6
>    Known C0: BCM47094 rev 0
>  
> +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
> +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
> +
>  maintainers:
>    - Rafał Miłecki <rafal@milecki.pl>
>  
> @@ -22,6 +25,7 @@ properties:
>      enum:
>        - brcm,ns-ax-usb3-phy
>        - brcm,ns-bx-usb3-phy
> +      - brcm,nsp-usb3-phy
>  
>    reg:
>      description: address of MDIO bus device
> @@ -32,6 +36,13 @@ properties:
>      description:
>        Phandle to the DMP (Device Management Plugin) syscon
>  
> +  usb2-dmp-syscon:

brcm,usb2-dmp

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the USB2 DMP on Northstar Plus, for its interface clock and
> +      reset. All USB host controllers must reference this shared PHY so that
> +      initialization completes before any of them starts using it.
> +
>    "#phy-cells":
>      const: 0
>  
> @@ -41,6 +52,18 @@ required:
>    - usb3-dmp-syscon
>    - "#phy-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: brcm,nsp-usb3-phy
> +    then:
> +      required:
> +        - usb2-dmp-syscon
> +    else:
> +      properties:
> +        usb2-dmp-syscon: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 
