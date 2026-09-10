Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816B5452A8;
	Thu, 10 Sep 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068946; cv=none; b=azKI/MzwCc2e3ehPxEWJOL4VvOqd2TjdwdYDsAWZAVmuh8Lb8e7V/OxwJ2Guuy8qgcBG1oSu34PzDvoI2NiYjzfuVjdgCj90wD650ZQ5GyvEajQgxwe5vfcw6h5Ow4VpvWvDrFtA4TvNUNf6pEIOR2UBmnWPGsNwY2hLt49Ok6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068946; c=relaxed/simple;
	bh=rGQb6pWP3s8+ybob6/+wvJRTEta0FaX+zgcYWjwrBM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCbKhoQFGCU0Qa5jhT682qN10Y21sRF0Yq4jC0u+kIq0MIwUrc/qkdSc7Q7kKsDQLzzi93aXBFqIIopD4hk29mVsfZmmBsMlaRboPji9grUZp5hx50XimmJzetG4b2ttGMlrzE6x42CeeCpmPP2gP6bpcKRPdKu8/JDSq4tt3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHS9bb1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHS9bb1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF061F000FF;
	Thu, 10 Sep 2026 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789068944;
	bh=NEHLUGTnGIvTiSnbPaTYiuHz7Py0xQtY1MUskUwmPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QHS9bb1g4bOEu914forL0x7kDO1MY6HoyQrVpJA2Zm2D1LVGbRvWNR+VyFLDiCt8N
	 8QfYMhEEX+Kyhwi3OfUTg0Styezbdjj2ltVim1F1O3W2zHp7SODgeElbwy3NAZNPc5
	 wiRrATApSFP8PeH/VYFIgvdZSOF+zS3qaGiLd7m9jRhljhA4bvbX9kj+3F9WuSJhGJ
	 I2Zfaq9CfVBf39UClc+CFWuGgk9fK1saxN3UFa9EyAyGqormI/1bzY47F+OJWLwV5Q
	 wt5/C2qFDN+hrYSbvscC+6dUrPNXBhvdnmDC7mKaFUphaTDcdGaf6UaSraPExJ/Aop
	 7S5VLmQxxIptw==
Date: Thu, 10 Sep 2026 14:35:41 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <aqLGFfQ20mCGFkfl@baldur>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>

On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> Add device tree overlays to enable support for the Raspberry Pi 7-inch
> DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> 
> The overlays configure the panel on the primary DSI interface using
> a 2-lane DSI connection and instantiate the panel MCU on the
> corresponding touchscreen I2C bus for each platform. The changes
> allow the Raspberry Pi 7-inch display to be used as an external
> display option on both EVKs without affecting the default platform
> configuration.
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
> Shashank Maurya (2):
>       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
>       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
>  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
>  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
>  3 files changed, 169 insertions(+)
> ---
> base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> change-id: 20260907-rpi_dts_overlay-58088ffce047
> prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>

The two dts patches in this series clearly relates to those two
regulator patches, which has received change requests.

I would have sent the 4 patches together in a series, but as you didn't
you sent this series with unmet dependencies.

All I can do now is reject this series as well. Please send v2 once the
driver changes has been merged and you have validated this again.

Regards,
Bjorn

> prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> 
> Best regards,
> --  
> Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
