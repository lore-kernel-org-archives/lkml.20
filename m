Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479833;
	b=VxIP7LycOIeGB9jMVIGFmdqEGpHQVcv9OIpMRm3DZuKr3yuGW/CzPjvOvcFG86XrS3Su
	 5LgzRMzhtW8eb2IAWlbtlDII8gb/1Zb9clVzGyk/fwL6JhrQUznbJasERPmabINoONysT
	 HQe8VQw+OAU1m692+jrb6FApPOaaCwEe7nakxcmC7Nc7KUswLfcM5USAA+GFrBWFz9QJa
	 8ZRQjiGuZBUvH1AYWOGuNllHu9J4s3F19b2ssPZZz+ANVkWmSbbM2hzfbbPel97sBHltm
	 //905yJzYIztTVO+FOIiSetLE5eS5JATLNC3f0DmUct0tU6AXc/Q0zRRrlfwBAYLxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kzqp5iGyk++So6EO/Kp6qWBhwWMWDzt/i/L4ZdkxQQk=;
	b=NxVPiQ/qBTwOgs1XDMB26Ww9JxS4h3rQDImIqdobx+9yAGsaU4HCizGEHSzACpth/pTu
	 y4d3CPMgGnpDuSXk3IHqWYMdFSr9IfsycZz512/DjvY2HX7Tu1S53EnNxq6hZC0yS2Rtv
	 TiHdp6t3bQeNQUqihidjX6q7eZ2C5oy0237OzHUcsrG8j9/qWVBNvds+LovjhkhRk0koR
	 /VTwvXtd1wfI88+Cc3/cEGwd4jLDaNoD8KbK3g4pnFVI2g4N1RCjAjM4nIqmcVvU643f6
	 hvjZVP/M4dQSZXh2S96UBXB3nvTn20RxxaicrTMfVPMNzL7jkbimTKqje9Ql4ig20hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGh0F6w4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FA606A321;
	Thu, 12 Nov 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGh0F6w4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A181F00A05;
	Thu, 12 Nov 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479832;
	bh=Kzqp5iGyk++So6EO/Kp6qWBhwWMWDzt/i/L4ZdkxQQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KGh0F6w4o5tT3aaRjJyR2mSvD+mRV/4eW9/IrbnWkDLToYL+XlbOoeFHUFGNagRSp
	 ie4wY8eZFlJa2N0LZ+/SpEXwSCoZJOB38ZQS51GWQgb2KpKiYKuaU+/FnIK6v/sknJ
	 Y+VlyA3YXXM3uGu2igjvE4nwIo5R6zXknjaLtOcPqhVzPG1C6Oaf1mSNMoN4vgjp+0
	 rXX/NYzxN2S62j1Mqy8QHCxqEjJMFSjd5XKE9wj031IwzuPJHfODUjXthX++LhoX+E
	 6I9oMhpMNSr7oOsIP3OJYNUbEAJPqR0NpuJ0ictLkVZkj3fPZZ2LnM4XMEyjLjnYkw
	 k1vAnQXpOj9HA==
Date: Thu, 12 Nov 2026 11:37:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Message-ID: <20261112-memorable-ruddy-auk-8df30c@quoll>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
 <20261110051723.434009-2-gary.yang@cixtech.com>
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
In-Reply-To: <20261110051723.434009-2-gary.yang@cixtech.com>

On Tue, Nov 10, 2026 at 01:17:22PM +0800, Gary Yang wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec@30 {
> +            compatible = "realtek,rts5453h";
> +            reg = <0x30>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                data-role = "host";
> +                power-role = "source";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +
> +                        typec_hs_ep: endpoint {
> +                            remote-endpoint = <&usb_hs_ep>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg = <1>;
> +
> +                        typec_ss_ep: endpoint {
> +                            remote-endpoint = <&usb_ss_ep>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };

Drop all nodes below, not really part of the scope.

With this fixed

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

