Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913424;
	b=MDlI9n8UrMFEm/YwAJ7WSTUIJC7dyiKVmStJZ43wW1KvMk62o3bUVSlQGaBPNObLQDrc
	 l5FMMchBA2e5MtePx9YcOM27rIug/CMvC4mS5YU5SihRLgk3wWYKLI2bWFbvMk1FTjZxJ
	 o228GLNv8bRo0zNUEApdcWhTa29ck+znYGn6OYoUyynEsI4MIJIDJkPg+s+CdZgZ77VQl
	 Qr53/2BCg6SaoJa/yYDx9oWzN7stsZsNdf44MAvxfa6leX1u9woLEJwwvKsp1XFmkB79h
	 YMezDg54JjgjIjqWjGjYNnWzzdGeuo3ltJ1J4z4wnR9pPUGk/oCuss9pN6cNfcvpQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913424;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=px2yzMZb+00ZKFAUheOTtZTROwrHpwZ9llnWmqj6+d8=;
	b=mhzXHLXCeCHC2YGiNbXW1qV9uyoMfThcY5Okz7D00/y8jUpa6Xmd2WQAsBRCXI1eGZIu
	 Mi/7J9htFjqrXT+xk9YkmUFqrJllHteh6mNNMkORkncVSomqFdwz6YrZiXsPVTtxyOghD
	 +eeGsgRmE7pq4cfm4dlEpDlaFgfmNNsalaRbWyOVYgfKYn0NBZLPyr2Obuue3Rhn1RGoZ
	 c3LO66HDkfaou2QZIYyBzL65OcSfV9S1dSuPR/uVcyHw/W4/EoTmIga8tfn0Fyef3rHWr
	 fEZicuZ8VU144aJcsepPL1ZBPzOAHqbB7XO2YPzxabYK/dbWickJ1h0CfWY7PE7rgNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dFPHcWSP;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C86606A31C;
	Tue, 17 Nov 2026 11:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dFPHcWSP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913422;
	bh=I99eKTieG3r9N5pwxWknTLA2rNggoIxISoFLRuvf9gE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dFPHcWSPFhEf3kOgHsix8TRHG5+yhF8Wde8U/dCcnkyNELHv0w8554s6O88KesVXg
	 AH/wq8Rv92MFEapC3Uu0BXOaQCBvijSMDMSQgaHyllV/GO/21r45X+rvvH+RSIMK5e
	 UTk+RzWp+CidMx6OrWM6Sm0DJBBhYgLroJ9FABTq+h8Wxf7w9ipAy7FJSxMA6XLOer
	 97HQ84eKfeHWFN/QzweDZgEUmsJI9wyg/bZGV0lWTTfoem8rXGCiyhZr5IzaN/SGwJ
	 Q4UyUV3HrDmsPKW9AB6pnPt8PnJr3g19w5jd6nycszO8bJIvKEGeHWzlatzN33MC5m
	 wIRNQ0YNWZjAw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5754617E04B2;
	Tue, 17 Nov 2026 12:03:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, airjinkela@gmail.com
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, 
 Sjoerd Simons <sjoerd@collabora.com>
In-Reply-To: <20261028134544.594888-1-airjinkela@gmail.com>
References: <20261028134544.594888-1-airjinkela@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Fix malformed SRAM ranges
 property
Message-Id: <179491342229.161638.8257695418556840247.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:03:42 +0100
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

On Wed, 28 Oct 2026 21:45:44 +0800, airjinkela@gmail.com wrote:
> The eth_sram nodes on MT7981, MT7986 and MT7988 sit under the soc
> simple-bus, which provides #address-cells = <2> and #size-cells = <2>,
> while the SRAM nodes themselves declare single-cell addressing:
> 
>     #address-cells = <1>;
>     #size-cells = <1>;
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Fix malformed SRAM ranges property
      commit: 55e9f03de754eb92e45404def36faaa5942a3877

Cheers,
Angelo


