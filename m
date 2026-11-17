Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914005;
	b=KQaicEG9dxFU/4S9Re6cuf6cQsAM77C8wRNz2Cd2xin65Q0HbT5wj+iY+6OeVdEA+2T1
	 aSo1a/A96GLawhdtcoqQMh1ri8NU35lcKyUym2R5CHOeRN6vHUpjOHSbBAUdKTezNqaPO
	 W+c3WDEry5eQRIJij0/taw7PMeQHiRyo3PaGwj/wpMzD+Js8JZxj2hgUViNpb4zRV7C/S
	 7fLaFpSReoqEOc7j0wpjWayKAKpjq37WgXqvANZf9CjaiSRwOGEaLGqonzlJ2iHH4KT9z
	 a0glGeAjgwn566drXfQuwfR+V9ISJY1mMGzGkdGwOWntdchvXByyqcPmIUIGEJh1Dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914005;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=s7AVPmufHz96+sRIu+b8P8lL6WMxsrhav/dLCJI1TTM=;
	b=WhL+3T1NDfQqODujXroCMPD8XBggSUP5tT3BF2PLwC1aYQtGr1Wd/zfMVAS5EsKF3HWB
	 cvA9xLtukFogzDyi7YSACljxLfR0OaGebbDU39aB+VC4OJ9QA7kblMNpSzRhY2464gHvZ
	 oJtahH9FOE+1vy6+97czshCR+sBadO+QMeJDAZdK/uKiWKUzgJ4fDOfaASg5+Sxb3fTME
	 cjm/Jh0nlVYoQPHAM0/OV047W6GrqFYjnnYULXE3VUO0898Q9KEx0LuFXAHfuKpChZQSN
	 EXh76v15vPjbBR1Mvh6QKsE7ZoXs81BOPU2yDBs0/D/x/XbMcCdJNrPpFYuFFWBghWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HOdXKRQR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F07606A31C;
	Tue, 17 Nov 2026 11:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HOdXKRQR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794914003;
	bh=/W4zx8LndX+Y2boNw4PDCj2CCOdKiJ6ihYmq0R+CnYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HOdXKRQRGz3e2Bp/j10K/jECI6tKqoNCEap8PFSYNR9s4DowtlClVF0F4uddFo0Ld
	 koDNjvGVa0sRI7ygVw3zhcEczIkNAe5Sj+cfN12CRnuBrEF5Ixm9+HG3x/J0WuPmKX
	 dpqVoyWl6ekwG61xkP/1o0DNLlsElyxRcymVFjx7bcSPLwsm41kvOelNN7AcdgxggE
	 vEC5qpdEbYLvwyBqlDKzy4ZiczpJszspA3xKlhtRpQg8O5KofLa19FxwdCI69bvjt+
	 06B7itnxcQkzUhDDCeT55QF25Jy5OhT7khc1Ua0tGecJI7IA//AO7+ZuMfIEEtxqBg
	 AbxdlB4S9k+wg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE29117E0060;
	Tue, 17 Nov 2026 12:13:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260909072051.4627-1-l.scorcia@gmail.com>
References: <20260909072051.4627-1-l.scorcia@gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3
 armpll clock-name
Message-Id: <179491400290.166415.7117847128055406868.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:13:22 +0100
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

On Wed, 09 Sep 2026 09:20:14 +0200, Luca Leonardo Scorcia wrote:
> The armpll clock in cpu3 clock-names property comes from MediaTek sources,
> but it's unused in the kernel and not populated in the clocks property.
> Let's remove it and align the node with other cpu nodes of the same SoC.

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
      commit: 0ed020eaeea1bf0854005eb9b72126ca340b8e4b

Cheers,
Angelo


