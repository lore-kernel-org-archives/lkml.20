Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798126;
	b=U6F7QcgyyFKmPelyQG/z2hxZ+Lo6up15cQqBgH9YBbX2bKh+Lpv+y/PjdLYt44KIaQjo
	 MyPPuhZQX+4Bn5UffcBdlF51clF5MQtdnDBrF3rD7J40NaCsIJLMkEPiCudd/b5lr2nd0
	 Ws07x84ItvozL5kdnazTTENQHI94Fvg01OxtPsJMa8oCkgjKWkyCChYBH3wcZkvYV43ZP
	 QSQSoWtwdiAm7GVPmehi1W0JAkVUpmgAW2W1A4XA/K961p3WNwbjscoZnTC0l1ljIyLzt
	 mzQ25jPTF3MLMMUaJHXZxSHvbgj4olM9ks80QIUfKPnbNkyB75TleYQF3ex9N04/sQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798126;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FYpkozZQqv5x8iGDJjbaY+F1srftlQoPOW5hP9D9X1Y=;
	b=5Bgfs1TP4WIncoyIZY7dplOSrDWIJQY2mCngNZU/VY1YU/ziw5MrV8msDk/O3TLwsu2+
	 30D146db/iQI8USqnbDGSqdOX+/511WqA1UuHwhkAtE2i2igp2hjTI0yP37hhwthQ+4wz
	 tq8DN8jOnRUV6ZF6pNoj2UILMUB4QNJ/e7gQgjxeAXcy1gJdKn/UiRK653zyJh7rM4hjh
	 MXQYUi9jMpiET27SoOiJBtMqkfO4R3VTqdgTQR6cTwkjbVe/aq+5SiGh2Nvmz5U7XQ+Dp
	 SgW3Qrw80g16AMD2cJat82Y+asWKNCQpplT9AFesqn8X19nv/REB0gADqNYbd7RzcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI6RFciy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2339606A328;
	Wed,  4 Nov 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI6RFciy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C1C1F000C1;
	Wed,  4 Nov 2026 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798125;
	bh=FYpkozZQqv5x8iGDJjbaY+F1srftlQoPOW5hP9D9X1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jI6RFciyCCWXNetAAeL6LGKusLjRvuvWTJ8+RHwmtT/2IiFX5IfOAy8MSAtkWPUip
	 GSZqGcD3pCUTusSIts9E5lgJQohwbGovx7ec86EX1qsk5uYKPOtGZcB9NyhLPUdP/a
	 VBlGa2wJ+JnjogABNC42/9mj93Jp2xqiZKfWakmfQOM8h8vbBqnEGo4t+/nY9beYQ3
	 5vj8SdWcZo9H+qJEApj2vqBTzm+jl+27bC/LZFAgZhDo1/RDj00IYPrsm0RI0E7EkG
	 fKa5g4uSBAWXh+8hffpU75CNxhRlQmVN/0+DtNrAQjExQbyQuX+5EsuYDdY52vApuJ
	 n+EKyQLHrrG8g==
Date: Wed, 4 Nov 2026 14:15:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, sean@mess.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: media: amlogic,meson6-ir: allow
 wakeup-source
Message-ID: <20261104-taupe-eagle-of-experience-d3b6ea@quoll>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:23:18PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

