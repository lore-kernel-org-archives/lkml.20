Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56C48FF9F;
	Mon, 28 Sep 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588120; cv=none; b=bHQd7yNVPvfeLfQDcI7eIZDh+dpbFdomYE/mpjcjXjfM/mig+iMslmgZFJnoxS4PY2D+y6t9Tz9CHNaGHJruxXehzcVZtVNBPFNiydCGR7UJRqra8fXcCcKefcfmXBuqNUQuEp6tWFNkfxXCAbHL1pZUn+A5tk96HQWCGwNWmPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588120; c=relaxed/simple;
	bh=2cKoRX86c9SEicEiJ8E04BgMQG7vb6iFVsufSGKHS0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maShy+qW6n+rGOORXNYekKZkkaL44npf7fwZGjcyLcH0LtYfqrvQAijd1yHYggv6Yk3XborMofAoOkKQf3TD7gwFZxS9onGr/MDbCYPI4+3WtTqWv0PGNOoL4Qr0EVHhUs5lL9XTkzVzU/HxhKLbV8ej+Vmtkyovu0Wa2LbFgBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AanTJQPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AanTJQPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9391F00893;
	Mon, 28 Sep 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588118;
	bh=vCm1L5q7AiO4jCOp4zLM7mfHci9BZuAuRJddZz459kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AanTJQPNbURukvEMvdXrBHsQC7iLUm/dDYRbZ8IBB9R6yKl3ndAwU7Va5Y60GDV1P
	 Kpd67UL6jqN6DeMA6YAaNaAtNoufh9PGBTnrfZpuSQ/nOs0kpO0WLgpJ/GmlMjgKKc
	 pXrVfaShp/+58J0xYRSlOKhQeATzy7ar372SUR7qAmYWbazBpUHs0cf7Y18urmuCLK
	 u8S6pdsrL0SicXZwPQ4Ntdc8Ub2YHJKe98X4MUXwxVo5eNGjil8/OgIWuaEk37AplY
	 rGcdThi2/0OpOZOuE1WebDlXGfLEHZg9ld/CndFYCW8rXVMz+qZD+ocFONuJWDS/FY
	 +hyi5hG/ndXDQ==
Date: Mon, 28 Sep 2026 11:35:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
Message-ID: <20260928-big-hyena-from-atlantis-0e48c5@quoll>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
 <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 09:01:59PM +0530, Shashank Maurya wrote:
> Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
> panel V2 regulator binding. The panel controller MCU is powered from an
> external power rail, which has to be supplied before any I2C
> communication can take place.
> 
> The property is optional so that existing device trees which do not
> describe the supply remain valid.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

