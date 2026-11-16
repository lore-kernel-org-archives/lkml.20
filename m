Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852103;
	b=tvCLiCqBp10TX0OOuv6A8SOZjTpDmkLayJnWveLqOocmij+LcTA/mlFAVQ+5SHaqnJn1
	 +NDl5wK7zA7STN8Z7l/dwyIc4JPnA5+XVMJAJ7wDPa/ALaN7UAyiNR9lxJ8BJWI/+a3kI
	 8d+4pvAuVGJH7vCSK7l2WBZe9l0vRMXiq2BJYmwYbivKL0KnRzQACvGM627XHifuJU67U
	 XzXV610BK9s8AGBK6yGD/4vV1p67PgX3gmuaqJ6Hyy1nSTWkwKcPptf9+C9dxf4ClAU6T
	 I07Z1GVaMiQ9VR5hvwnQfyxXGD77Ae+APB21d7b3/lS2VNa35wjxw7PYQFwthFpw0Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852103;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=fSJQ3TO/0mJb/kzZHlIBvtfMwySuWem/xgRkXkS+p24=;
	b=eRgA/jaX1fBezxQu000ploupMltmOGla58EadR7RTYJa2tIBg1HwaZiNdZC+2zDOVO/+
	 sL39JdjVzvQPfpXGGiVgQiJLdph0sUACF24i+nVYeraxnAW/D2rg0FErduyvkeHsggC4f
	 AqnwrZ4G6XI626bc/R9qOPYbOqVAgkWjqINz+KMGsf8B7MuMZI8T3OfV1N0cIdv1Qs3sn
	 2z9t0tD0qsyfEXg78nFFP5IbU9m/QBDL/aYTzvp/d8na8m7wA0GMvB2FAveyVjls6EvMa
	 HhOp8qBkgFff2axvCI6pUQHAeF15l3eVv+oPIKyj3Deoa2W0csrWdLsEmQBOlfEoIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U9fa/LBa";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3A606A33F;
	Mon, 16 Nov 2026 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9fa/LBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742181F000C4;
	Mon, 16 Nov 2026 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852103;
	bh=fSJQ3TO/0mJb/kzZHlIBvtfMwySuWem/xgRkXkS+p24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U9fa/LBax4AtOV+YjYJYeYtt7gRlPvR1Y94LwiaByGlhj1mcwDS1/5n9EcuXHsLQ6
	 5LvUs9nO2HkW1fOF83D8mnbUWG2kXNyz6BbhrTjqvf5ywyHJaQxQOaiNU0N5Ow5xHV
	 Sl8MEglV75B0qx6DyOFXdSv4sCbOzi9TCW6tR5KtE6D+oDqlITPBJTKOXFS+7wLMSW
	 FfmFNUTwJZ006ahZavzHDs8h/uQmMfPGoLte1issOElvrxw2ivgWh1UeQKyf36JS7I
	 /lyc85goFIiOHPg9eCpnyrLqDIiZ56ONxif60sB8To1H1hdOiGLI3HTcw6XKU7/dAP
	 YCZJJ8IbofJBQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Message-Id: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 02:01:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> Continue Jernej Skrabec's April 2025 series, adding the board compatible
> and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> 
> Use the common Orange Pi H6 include and describe the LTS differences.
> Follow the schematic's LED roles, remove unused USB ID detection, and
> use generic PHY discovery with bus-level reset. The binding patch is
> unchanged apart from rebasing.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
      https://git.kernel.org/sunxi/linux/c/903a676a19ab
[2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
      https://git.kernel.org/sunxi/linux/c/a203a4bac331

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

