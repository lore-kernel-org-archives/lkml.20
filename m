Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358951;
	b=ulLGerL+MVcQg6vixPtMuK1ex+mdIM4GhTD+MlgKQ6QwZ8OGDrqEik7FBh2nakMTb5fG
	 INoOmY/3To1o1RbFTfYfp6zGeHRdzYcYaqaaQmy8XnK9/22fmu+lM698Iqk4oPmegtH21
	 Ha51KlMvtUZsHiWLKNUdboTeEFUIoetOqkoR7whbVo5d3PuMIeGFr4L6MnIFd0QozQYVD
	 MtQSGmNrJfOAy2gwFU6IaR3AtGSvztcWJkm8TlqBTOG/o+7pzJGkG+YSJB1RGvikoD9c+
	 9JNyJhEl0qpgBfFBFqCNt9sW9PIaaMjnT/EA/yoWuoeJNUsVOIKpxtzBryJYL3EFfBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358951;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=HWU9fFp652U4xTY6i7RlylLzrPsnJZJWAWqkWZithbQ=;
	b=Rje6ZFPG2JB4D6WKeo4q0xrQH2ZLD8uDTHoH+D5ZiTlan4EB5v2w16XM+owZ/oAqsFay
	 tedQSXHUmKNJjTZ24N8c6lGIdI950Vyy9XMIwHd2Agh22tkylpzOtKJ+VlNvIx7Xf+Y80
	 kr3eAmAD6qRzSAppVjZyzaU8Kz+ApekB8DEQu7H+u97BkOR8Z6t/AX8vewuH2j8/pz8cM
	 noMy4Gfr41e4qII95of47P7gRGdgGhriyuFD9bjb6pGRskd51x880dQ3REOuprn6J2xEW
	 VWwenP0VLWCcE5OQTEPqy/tcp7EBwlJvGtBnauDsdPNAmoxFItgYkhB4bg9yrq7HghA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TKE/9gn8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50340606A32D;
	Fri, 30 Oct 2026 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKE/9gn8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B431F000C1;
	Fri, 30 Oct 2026 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358950;
	bh=HWU9fFp652U4xTY6i7RlylLzrPsnJZJWAWqkWZithbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKE/9gn8bHSQVea58VLpEheSWIBby85i5/M/Jg8F86ZXLMp4dimxi0Hc9J4Uiw9t4
	 6GVKb2Sa0lSdoSgaPadeHA3Buu8uok/nP+khOeyl2vVe31w/Fdt99FZbXVjsIOeTfz
	 7gVtQnMQ171kq3KhTyjzNMLfXNWlPq7ESNvxspt/L0vv5MZWn+Ptlea82dP63o2ki2
	 Rn4NlJEYoFGcjqxGfi0JKvlklmLdhFqLUmI16NvPfgUdqqW3/zpa9tda5XlDuT0LQb
	 yBn6mAhY1Yx8Wt5hvklTdicXPeDOzQc8hAPFLcOT20tlZWzXCF8x61XZsaGp6FtKbX
	 0gJpNeB+qZxOw==
Date: Fri, 30 Oct 2026 12:15:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add
 amlogic,meson-s4-sm
Message-ID: <20261030-tunneling-wyvern-of-plenty-ed4f19@quoll>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:21:43PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 secure monitor implements the GXBB interface, but its PSCI
> SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
> driver has to tell it apart. Add an S4 compatible with the GXBB one as
> fallback.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

