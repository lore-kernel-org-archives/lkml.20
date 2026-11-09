Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230509;
	b=Z4zFctb+AWO8BAiF9LSwC6ydr1Agsz49QgUXepO6HI3x65UT2h81F2IvWsmzKUcJ00Tr
	 h2R+xp8Tl9jDiNv8mwCnvGhS3jDnFUq8KopGLxdlbSAAOZ+35jyHgjMErcZ9i55Zxn/d+
	 L6kgDfzvHF4ikVV9Ru4R4WwyVRmRpDLwnef+WYx8o+9nYBX6j7OymuIqMJRKM7OETfQKp
	 5RUlas9rMBavPS/TZK4R18rYK2h6E70RD3+//55klniCceX593syVgAPrH1ih3N7FdjXL
	 F5LwMQyrxGO2x+0rZTUlvIMgntBrnv5hw2zIhem3Hbuc6rVWrDxVu/w4KgVdgCXYKiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230509;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aM4hcpEAYE4AQGcwCoRlsvLuMHTZKS0gMuARZziOX8Q=;
	b=33OwqAsir5cNEzpJbOyjCJfnI/Ox807kbl2/CYqe+2gDBuU3Xs/SE+w3jYQbYENQB9Hx
	 VBZzwvC8mQx2h3qA4V10VAU7ztp3tJy9hYph5bdF+3QhGbUDVnA8g3vTCZsevF0phkhVH
	 oepuE4Z+PIj4HPIZ897WFi7Xk5sUASapEs+ChhxROdwgM7wtsHUTydLnamzmC2+lb460N
	 E+jvZBXs2o868z/H0okNoOJlxXOHS+SHaYoN9rJHtrmbKTDmKjEj3Z61P3bIuCqVdz6UG
	 ANNgAtza/N2P+B2k26GOUogRp5z8WhJ3YgtnB5QOqaTNbHD1iJMAr/3QFQDP/HnHBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X/LViXCN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C27606A325;
	Mon,  9 Nov 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/LViXCN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CAB1F008A2;
	Mon,  9 Nov 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230508;
	bh=aM4hcpEAYE4AQGcwCoRlsvLuMHTZKS0gMuARZziOX8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/LViXCNZCk8meobQtpDyO3W4Ic4iip/1bG0zCnqIQf1YOFjZ+j3GGjKhuogqUNfu
	 Quivt+w0tbb5xjmb1vQVxLOAJ1IWmgEYxMe3RLISMFJ7yOlkxXdMmg4OpAl4Xd3jou
	 fAEiJCLNJiaHaXza9drh05qHIf8SVBubOequDGJSLFzegSZ3Emd1Oj4SGo4BTv5OKI
	 g8b+xJvl7Zha7eCJ5lNeeHOk0TKFYnrZsY8+j7klbZ9wjwCR608+OTZewMpTQIxXA4
	 Yw+s/Lqe0/3gIBaMmWump6Bm+GwZGXkTzZZeKSSDG4g0RNpNw7avHonDhhGXhXJ1H8
	 Xh7Jt3c/oIgVg==
Date: Mon, 9 Nov 2026 14:21:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zakariya Hadrami <zkh@mailbox.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Gary Bisson <bisson.gary@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
Message-ID: <20261109-impartial-ludicrous-asp-fd8bfe@quoll>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
 <20261105210622.523747-2-asalde.le1@gmail.com>
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
In-Reply-To: <20261105210622.523747-2-asalde.le1@gmail.com>

On Fri, Nov 06, 2026 at 12:05:59AM +0300, Alexander Letuchiy wrote:
> Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
> with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
> X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

