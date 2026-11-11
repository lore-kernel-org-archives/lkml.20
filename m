Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386956;
	b=ioCASx8tKaPPIz343GQKXhNwZa5H8fE/pS83ye+E1DE5eOil4cnJylk/MMSbpeIwlMFf
	 RQ1PwPFCrQZ+TjXj53voOh9QmUeW/EHgx+M+P2qq6D8ZGBSo7TUO2W6Xf6+T7/PrjIVXt
	 zPOsXsoh+j50xxymlS226nNfDQ/9zurkOT52i0b5mMeWmuU9qbV+zCHFuRMw0CZ81WQ7P
	 q1ybnARb117FT6OvOzaJouwsM8aKzZJBj1j0r+rOXkehCVBsheqWC3yxgSWcd1S5Sk+1F
	 +kUuiyTiFdPLorYgAdvo88sBU7U+5yJze6OSqZ7d/fQ521eYN+7KIQhURMYTJHghj2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386956;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CRn3mVE0RkwOGkFOvF+BIusmbUtnKuihvtdJFqK68Sc=;
	b=5PvcyQgkI/wRatnOsF1iWko5vRgFWMsxjqj1U+gsMPxKHb04tfWcoDKhVL0JJ2jcLpcG
	 Fsn9RSWh9ExFGHHo4yC2HTokjDBmGqu7WPdXlhr8mXXuBVnCMhfx/tP/NSIXo4xo2fjwk
	 EbQulgguOIwU1m734VHfWltnkpCVI0epWl2v/JgMVSwU5nly9QGTtd/+v3hd6gqTaUzqZ
	 D91jnJo0tl8m3JFDu/uHw+XtbzFFIR2nrGgdg4aaZMJIwRLLTQywLS7NuvjSA+b7DSCHA
	 Dc/Doj/vKaQbc9chH+9wxxxq+cxhNAS+ugZeQ5yA4wRVLPDQvasFYg6PvMq7rvdibow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KY/1D89+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306A0606A321;
	Wed, 11 Nov 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KY/1D89+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF28B1F00A06;
	Wed, 11 Nov 2026 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386955;
	bh=CRn3mVE0RkwOGkFOvF+BIusmbUtnKuihvtdJFqK68Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KY/1D89+QkqCYw3Yzl+Nh77q+0zMCNzd5WQU8wj0j4yntRlLYsK1A1Z5uiK9il6q0
	 r4bxjFfBh7pzE9w16ugNPumvEXQOf6y3flgo2i1QVZ5JKc3yhnuW85bC567qiWPcK/
	 U+4zjMT4iS1N1e0e7QSz6M8mwbH3urnrwe+HlcDZj6lCnHE/AhdIK4A4UgYTob1ueS
	 84LjyzxBVPN79JLY0tnCxYA1DHfT6Oj2gpaLGwJl/Jvcm0TCi/35PA9G7y1R0q8EW8
	 MdVS/EKA5GMtQ7esG8l94oNHpEdNlV1sYeb7pArsH3SR/+FRdq33bHhUN9dSriLUh0
	 /h0OA+tA03HUQ==
Date: Wed, 11 Nov 2026 09:49:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <20261111-placid-tall-dingo-a6e31a@quoll>
References: <20261110130515.45819-1-azuddinadam@gmail.com>
 <20261110130515.45819-2-azuddinadam@gmail.com>
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
In-Reply-To: <20261110130515.45819-2-azuddinadam@gmail.com>

On Tue, Nov 10, 2026 at 09:05:13PM +0800, Adam Azuddin wrote:
> The RA8875 is an SPI-connected TFT display controller by RAiO
> Technology Inc. It supports display resolutions of up to 800x480.
> 
> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
> ---
>  .../bindings/display/panel/raio,ra8875.yaml   | 86 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

