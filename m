Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559016;
	b=ClMl8Va8MTMK2KMn+E8YN8eeef3fAHkJl/QvmNsRiar5fwvEJ8Z6yipG92eLWPq1yo3h
	 i5X5gSYoRvNBBUl81kHbdmeu5/HujfYOWI0ms0TBACEzuWYU5rS+DnwKtGwUidvtSnjZ6
	 KTP6G3myQFfksmWbLrIg44ZHMZuy1ecwzp1XgP0GB2LTl2/QT/tf2O/gj6ekcKs2ZnKQb
	 /xvFMQlE6ZSC+VBfg9eZSRpU9nlYD33T0DhMDJTEf+oVBK722USNI5OzpQ99V8Apq/Nmv
	 EI/hfiaWifozzunM09GEg0giIZAXfa17WxM8Kd6fy1mYaaUHbty39O59htgPKzei8Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559016;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WcbMZkXCoDF1VinxpXAJnqvIlxoOmrzgyATGNwq43+A=;
	b=UzShy4nC8vTExP8jEyNFeY+PW0vTmrqDTVsi1yMiamY1NuNl4WS+XGiSNiMSa0F3Kpes
	 fbyqkKBlNtTJWHkr3B6iAKxFxGK7/a8HFMg8FGMFuuc95cqzw4ij4zHTGEs8yveY7DVw5
	 UqB04vxxfwKln7jL44PjVaEGHFvB3AuQoyYO1c+KBKH5q6PXIixZZmRdvHpuzbR3lAeBE
	 NyqkoivdAE79IkO+2v59scbUfBndbKK8DtpC4MLZAQTKkSD1s3pD7e793m3NIHBUAnMQo
	 8rzJQJjSBA2YXXcUtYcv9sbbY991I7sdZtu3f7oLXWWxXLdLRODVwTorw9iraBtDcJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBzV4Wsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D4606A31C;
	Fri, 13 Nov 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBzV4Wsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5641F000C4;
	Fri, 13 Nov 2026 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559015;
	bh=WcbMZkXCoDF1VinxpXAJnqvIlxoOmrzgyATGNwq43+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PBzV4WsppZXw4ka2DOy1kwykexWL4bAIMtz3UGqpszC8BjXZOqibQVEak+Kq8c2AD
	 E9MoBORWZjLCTHwkZw2yNrZpnDZYomFvPvujDxPrnlTKZhareQb8KW03DjiHggPsVD
	 tKHuFgUA1YCBXSlUCpujHQPA63MU1r4pjl7ydLipOTatGwpsKnG2FqYBuSZz0w9Qcy
	 8VYFjAuReeAASmkWQEv7vtyws10AHAFWupq+Efm/0Pcw3uODhzFFTmxZQW9IbZ64c9
	 Buwdmzq1v2xC4k+hKLTIiIQ1FoKFwnZTNDkNRnOtkRClPBEcafGl1qVLk+RzZWSyaX
	 PHmF4rAz+hHjQ==
Date: Fri, 13 Nov 2026 09:36:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sergei Khomenkov <shomenkow@gmail.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
Message-ID: <20261113-eminent-vociferous-walrus-2d63df@quoll>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>
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
In-Reply-To: <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>

On Thu, Nov 12, 2026 at 08:30:47AM +0000, Arun Iyengar wrote:
> The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
> reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
> They are needed to recover a core that is stuck on the bus, which its
> registers can't stop.
> 
> Describe them as optional, so that existing device trees stay valid.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

