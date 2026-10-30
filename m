Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358662;
	b=dC0DkOS38ThRJuAKxDDqe4X9ZKORJNl8ujvVoDOmfm2el2HlLcwMLULuuVS/ZcO4vrAM
	 JAJa00Phb88L8zezVeF2CB2AAY+meMR5dn9rIjDV5wGFgk+/8e0BkzGjfpvx6OcCTWMZZ
	 H6wCoXgcRTJxxB2jQa29f1h1kg7RKKP/Ny3t6dJHmFaTIb1GdZbsW922Ep5/gajp0Tg+m
	 qoHOrRk7KXblw6gXPak0T5HQGq2xMUGthJr/66/QhnDxybkK3LePMskE0G5qY6xXneXDM
	 q8c21ySWJGsxguij0wKa6gfnEP0AdKxYxolm5oOwTVlQfKEmrWaK39i8QQc9S5+X+Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358662;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=zxZ61noBemOEJ9Z/Swm3wSwkY7NkjJ1S3EShVMj989I=;
	b=rW9Bmox9TXQCzD+1nUtsxOnyXPb+DavVakmORFA5MKnlQjvv4C9UKfIHt+mEY1IXVlie
	 9AMdOGEATvA3WgvPxcM0W6vTx7lezHKQfrjuGFhn8QKgwEFC7uYJ9QRjzSWqihUwVp9OO
	 tA6/2Oy12gQ79lBX5ixQaODUWuOZvtiiW3MW8ZkORitFOT3pZOZ2S1s7Fl1ycECwE4ohK
	 Xz5soRzJlRKpc2+MgjIaET2Oa8hvZc4NKguBxiZ2ryBO7UApnd+aDQMneB39Isr0OrAd1
	 fC+H/50HyxTe1B2gxXdig3WnoaJs9+/wpatH64TLw691JvfvcIt18a/lwSlz8OFaZwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6wz9Fxz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E809606A327;
	Fri, 30 Oct 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6wz9Fxz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD301F00A02;
	Fri, 30 Oct 2026 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358662;
	bh=zxZ61noBemOEJ9Z/Swm3wSwkY7NkjJ1S3EShVMj989I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B6wz9Fxz6TcjWK5RVkgW6OK/pRylEpQuIfP6QSdziPqzdCOAuAFyIBvq/pCr7qsw5
	 RfgaO+FBxRrCG1LU3kErftUbiB6gvDTvFbV9W2hBdFTN6jk77WWFZaWZwIcYvxammu
	 6jzm1CHzHKNkesPb1ERuda8+n5pEP3J06XSRzDXcmJgJmrk/r4jGn7QcrpLsEwqyG4
	 Z5lzbOp3Y/ycXRLdiqX2+jnRxPjswUlwyzi/o1OKjnruDxpaDCMUROAmawG2BmSc43
	 Kroj/hsVhjz4f89dQrGEs8kFHbFad30/9x8vNTJMEZAtZeHOS0xXIDEimf/9MEE6Hi
	 /0MUq4weqCK+g==
Date: Fri, 30 Oct 2026 12:10:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: phy: amlogic,g12a-usb2-phy: add S4
 compatible
Message-ID: <20261030-chihuahua-of-perpetual-current-1d40e3@quoll>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:22:01PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 USB2 PHY is the G12A/A1 design with a few different analog
> settings, so it needs its own compatible.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

