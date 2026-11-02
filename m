Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627916;
	b=wogWnFJzQ6RzD3keNYa9c4xhIOU2ZP4Jl0eGepYS54L99RUefdppYq00hR/GQSN3gEr+
	 xyn3IevOih9kX9Fti3mIncETz8PQiOTlJbAm1nrojE6kxYKg9IMQPqdxV17BlEZlGZZWl
	 byewiplPCC9w128sMNQNQOLnhDwG+WGr9UnzKKH6VWsvEdjrjzYp0H7tm9txQbanfhzZK
	 dbIkQ1o7abX89JqrX5NYKVjfm1g+E9YfxLisq1yiU4uu85gXPIE8Ukj7GIQTfn+WlTGPC
	 K9ml1CnI4m+uBaOq3pW6vSNGnOVOyEaeAd2oQOXYTTITcQiWl/9QQ2Upane4XG6NYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627916;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=OFOJ0CkitkjiYmHRbTcKJuO87cltDnxGLCT4kpHTcaQ=;
	b=mxoXFCsHzDVflFV4to9A678r1zFxKhJOS/FPIfPZ6dCLlwHTRQhvuI0Q2UDFlV4jNiR6
	 k9110wk6r3vZwhNpentnnObLweaIVAqoigy1L216Xig6lPyHDnd7QJ/FqWpPUlWsGLW+H
	 6o7tOS+YAK9M/JmGvWWjKtBmUxvpNdqqyBPTreGcXYRipJGTIzXmcyE9VUyfvi1K4OfIj
	 VjbYtEhXIG0k9n37+W87d3Z4jEzm+Iog7REAqxi804PNTsOZoDXhjxp2n3bYk5Ia+i22M
	 ZpphXbtfQjMnLOnXEKAlIx+gMGciRCScCzqtNRXSMViR1bzLDTNmkZlHDYfR4Ej5NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFirtAy7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027960A261F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFirtAy7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780E11F00A16;
	Mon,  2 Nov 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627915;
	bh=OFOJ0CkitkjiYmHRbTcKJuO87cltDnxGLCT4kpHTcaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lFirtAy74/wxz57qMDxqmJeRT7c+HC4TIxoV7rWrwA5TwjE2Qd2T6+GFhwy472oso
	 9bkM4Nh6gWxRw0mMTL9M013dj3Ug1auAxmp6TkRadQqJEsL1p3IjRl+PY4gk89QIEJ
	 ciaWqXnCOY61v/EUVvY/T1WQzmX10jEaz6nQpvWx/YV0tZNZO2zikf33X6Pp5JKwYO
	 khVG81GbrKdQRiMjFjCuxtGg+/yOMpkxQSNXv0GF3NoeNI7kjb+sGUrQzExReKAGC9
	 WwzXZTb40wktOwR1icfJ3jAwNWbXYEfPzxlOFARqPW0SVLGTPIySuSmr1kx/kxHeIf
	 Qu3R3N2XdpxBA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
References: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH v2 0/2] memory: Convert drivers to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <179362791303.178192.8180558210148079389.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:58:33 +0100
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
X-Mailer: b4 0.16.0


On Tue, 25 Aug 2026 16:11:16 +0700, Triet Hoang wrote:
> This series converts the Atmel EBI and PL353 SMC memory drivers to use
> DEFINE_SIMPLE_DEV_PM_OPS().
> 
> This is a straightforward cleanup with no functional change intended.

Applied, thanks!

[1/2] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c402c2c002616df803c2bc80949c7fe37217b890
[2/2] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b2219e9b406dbe62681a55f3d3bef5a07fec752b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

