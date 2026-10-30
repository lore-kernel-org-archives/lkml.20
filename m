Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357602;
	b=WLBnWXumWMWUq7+aDvahws74j5M3PpKGThuL80Q4OEue30ksZ54sKpUV6BGApVh6ntPO
	 ooP2YPLEeDgnpnLvqYXEjVQkYCBtTZ+jJRYER/+jM4XaWkVB7ne4R9m2UKsktsTxJp3TD
	 OIwppUrJIAaZBrfw5x5G60qUCYqAfj5rQZNerSov1nzxvSiRrISFTVnFgWI2c5Exigcfy
	 AP14btO0Nanz+m0fG9ZfmVWp4XV9s5Ok1D7DgIQ6IaVb8a3K/57ySQUjpP2wuu/LfniSH
	 mG1T6WVxrG5Oj0zH/d1JQVvNin/CwzpfF4fRRyygAQQIN2fUUE6cN7FZqpeMH3Q9PdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357602;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0taBla6Au0NPXTfxydAuOM5k4uhyp86nch5CdGgj+dY=;
	b=2F9LnFoAyRc/a3s0/7KpzeVGg037TiAtjM1p7V2rORrO14HAEgXax3fwhAN9EHhqxu3Y
	 PnK+DgUTzYUxYh963uYYIyRj/7/isLcGIw+e0bHPt05my6g442pKoc9M9hvNr7l45jknR
	 m+jMTEC89g0lK+sFWySQ2U4Xmg5KYT1XcIk3cT/QMdmc97hhKTeFiyID5aX8cTS0l5InU
	 MNL2xX658mO7LchjQUF/ci7bVEZMD8hn+GNgIXFEyTepblanGU5jnR0ASTcOykxWbhDU0
	 qczxrfCuekIPN58z+yRJAsitLiPQ1kJ5CHx3alx0A3XcOujWuUrfImHEfYo6Jz+PeUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikPeZdZ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420DB607080A;
	Fri, 30 Oct 2026 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikPeZdZ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD66E1F000C1;
	Fri, 30 Oct 2026 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357601;
	bh=0taBla6Au0NPXTfxydAuOM5k4uhyp86nch5CdGgj+dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikPeZdZ0w7So+JoNXmdih6mg/9/PKY9qx672IcmqqNXaKkdadPL6ZxS+bUVgkLb+g
	 wwW+ewMWIuO1keIPlmWubacwdfEF1KNxPMMFXb2CbculHYztB50R8K/OCXDHWpzKC/
	 yWEkqN7YMMDRXgE13Q+X9rFAuJYOijcgrTH3bd93a8v4dTTSBqyDEAtSDwS7ghBH2q
	 pQMIe8rLvz0ZuxrFcY+/qAFSu1aXgA+xzxAQLKwzOJkEHcljmbN4h+haNF0YyjUxbu
	 pV93aIdYmOkGLWQwPBdcGDvccs6Cfe12NLhdogAisppAIQepRFD20c+Aew7XeRDUQs
	 PXU+MBNmKp53Q==
Date: Fri, 30 Oct 2026 11:53:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chris Morgan <macromorgan@hotmail.com>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Coia Prant <coiaprant@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hrushiraj Gandhi <hrushirajg23@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Message-ID: <20261030-loyal-bizarre-stingray-4f67cd@quoll>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
 <20261029082541.469999-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261029082541.469999-2-liujianfeng1994@gmail.com>

On Thu, Oct 29, 2026 at 04:25:20PM +0800, Jianfeng Liu wrote:
> ArmSoM purchased the CoolPi 4B hardware design from CoolPi and confirmed
> that the Sige7s uses it without hardware modifications.
> 
> Document armsom,sige7s with coolpi,pi-4b as a fallback to reflect this
> hardware compatibility. Keep a distinct board compatible so that the
> rebranded product can be identified as an ArmSoM Sige7s.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

