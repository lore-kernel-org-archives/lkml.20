Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970594;
	b=X3S+BLhaFkjiZZxZmINCik8NwNtW/Sb9UQfnM3BJBbxTKGW5CsHjV2Io7/C4G7c/epC8
	 M6c31WaRr6U/oLDgU3V0nxe+0oT+/s+kI2opA0dHqNxhVIC+IPpI/i5Ng5MF1AB1glWq5
	 ClJ2m2L/8PxstDa5pUJ+HToau7ohdVOKOodhwv92P+busM4rqCoIWNxKitiYT9TM5oZdW
	 q+uD89DPbmJiefLhgNDBK+DCJvCwYT4pPRy9/4R87CyywkrzO3foBxW+LAhuB2OizZQB+
	 Dfd2JLvxWtgskABJWFu9OKYRlG3bcaK/wMzPvdUYGcA5UdYRbeQhpPls4sgUiTvoeXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970594;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YbYmA1eZwnjs5cetbTbm+E9vWC5lU7xrhcJ8nb//OPk=;
	b=wHsDXh2XLVdsAXhVu2Sy7j9QV4cj9wDvfntJurmWinOWNSiIoBhal13neONihasa5l3A
	 A5KYz5W1mZRQgpJAQ6Sjdzq2wfZ+xQogE0siajGcBFmVAHlXwJ9sHsGzrdokpNIcog2OY
	 VJCK/h991389q/GXH1Aw49Rs6sWh3A+79tmlt2ppsbYldLeXWrvs28htHeDFWr/sRXU0S
	 fC4CRCpglKn7ao0h/aXViudG9Ae7GSivGvbTrTY/ZrYO+ZiuVs+zw5SEiX4Z7UFQH0ysO
	 55FnTRRW3tcPrKPpI5fBtGKjTzKWE7h4Qoor59j2/cMRvo5fNr9sfDRM1xOcYa4i7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCh4IE6I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FDD606A326;
	Fri,  6 Nov 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCh4IE6I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004CD1F008A3;
	Fri,  6 Nov 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970594;
	bh=YbYmA1eZwnjs5cetbTbm+E9vWC5lU7xrhcJ8nb//OPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCh4IE6I/dmpvq5JKNNh09E+DHfZN3PXvtR9ors0GxwXeoEgXPTkZyEidzIPOHbHo
	 YYfkAMdpXrjqhYpU5NL++Ggd12xlQOdvZ98VdlziV04uQL4Iy3FnJo/C8GcuyYg7wm
	 N5gXtkclZ7dF61MmBLOqOR4FKIuOV2Eh0D3lcZSW9JX2S9LRr3vYhUGImLluNCON5T
	 yfAWTBCWKvDx7Mt8hxIzIB+Hjk1ffJwLzM+815MivU26bk4b1P6njBvX0qwFwxXkvY
	 yCRfRv0OIgetQMuZIKzblh1phP5gqK9xdvWZcgaCvoVzFR5hHzfOWV9WtRKcxBvu3O
	 xtZaya/jZSlcw==
Date: Fri, 6 Nov 2026 07:09:49 -0600
From: Rob Herring <robh@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add
 amlogic,meson-s4-sm
Message-ID: <20261106130949.GA2536456-robh@kernel.org>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101854.46569-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106101854.46569-2-christian.koever-draxl@student.uibk.ac.at>

On Fri, Nov 06, 2026 at 11:18:53AM +0100, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 secure monitor implements the GXBB interface, but its PSCI
> SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
> driver has to tell it apart. Add an S4 compatible with the GXBB one as
> fallback.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Missing Krzysztof's ack...
