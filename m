Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608441;
	b=1egu0wyZIqaA3rcfFVsOoxkDONXQ9JZXG8sE7p9cA6ScnO+tNVxKmx4d0DSCqu2d/a2G
	 qry7kkBENg8mYZl4U6+6EZFTG+kNcr7HgR3ezA/TL67TjwvYOGUSZO+52qgjDorFsVEQF
	 PaUCRnDNpIAuugNrHo/n8aWRM5AiC/qE1man/uN1VlKP6mHQM8ivBNZ3+fJ9PbtUku9Ul
	 oFjKF9y7Gm2qOSUySiYXtOb5eTUlItkW7WSYQIRuKdoghCxyuTFQNUWYvOEoKd3IJ2PvY
	 KW+9CxHQlOY8GtlMDiy+8lBT95IvF3UcGHKiHhJTpStGgch9zjZ1j1FSHdOWr/Yg7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=;
	b=z7H2Xo9hKpoIu5Zi1qLucn0l4zv/h4uHWrTgx0kSLCA0vQaAg1sO06+QfnupVLrQYeC/
	 s3Q7ETcKg2fv9jY/5EDZq2M04b7reaf5B8Y2UWYup6o3C6UH8aHWu34DFRMF6jiFv4n9H
	 Jr5ReT9KVJZ0xAF66jwy44AONPEIz45g2xO4RLrSKUd2PPfxjSJTqW9XTeAw/E1BD5Rwd
	 zczSn/SKEMednunHrugAvulbVpIvX/1O3TyZch4s3hr7Cjy8fFPqkd+8iP3ifJ45e3Tb3
	 8o2rMQUe1LSPBfkIDBARyAuqX0X7jCjZ0lPqBKcRGe4yQXDYJFd2hXl+yQqRBbBWwag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4479606A326;
	Mon,  2 Nov 2026 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD72B1F000C1;
	Mon,  2 Nov 2026 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608440;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjcIfigcEay+9mD67vEIw4WuUOPv1d8o2geaAAw3ij6AdOdTKKnFQpYCaUtTcnrZL
	 9BP2uKodggt8ac7X2qSavE8OaTOhAJFsxNC8sW3X45OL6vcpNMyxkvoJQqb1G5xzmL
	 elR9MYPpUUyCiC/r1kLdnSuvjW4aqrGkV/ldoCoY81j8iWVfFiCXEFzUIqYYMKuOYt
	 GACW4TQSWR69smxs8VGJv0FQCDAr0o3t/jKhBbPYjzcsRkvwMAArHPkomnaSAbk68g
	 grsLk0e64iiD883qVyJUdpkWfBn7v6r42BNmTiucvlMxq7tyM0AOeoebVw8uI3pyMf
	 D4yV2bu+mEzNw==
Date: Mon, 2 Nov 2026 09:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20261102-little-bee-of-shopping-aff1a4@quoll>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
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
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>

On Fri, Oct 30, 2026 at 01:10:09AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
> 
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
> 
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 77 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

