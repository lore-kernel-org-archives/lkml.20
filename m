Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922682;
	b=hW3o0lgHMum1tDaz9YYU8qYYuC/Ol5T4gqYwdt8iXMth33E5e1Mi8xVshQjX7adpmSqN
	 9g6Ap6ZEU9B6OMrUDBYLZwSQDU/UTPZYiUxkaGMxOsnD7bUcu8JZaKj+oKwYtlkK1o6v7
	 dFZMZ07HGyt7GVuEZcM77xjkHlsuj2WGTVEz8ecyzVEvRYBoQEWgFL3x8jNCs1GzzABBQ
	 JzPYyrt1nGUYHglKw0YiFDzIOnRoeiYMDbu6L6mxalL4L7QNXpa34eKz7nxRgcSd5LGUU
	 kP6q6xl44ikPc/8Io3g68wa3B7EtcNbp/JKkDNlsmyRJpO1BEfz+k9sw/GEA7NdiZlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922682;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=slUfvfIqFIUcI6mKtrZs1QJBfv+t10WcDiqUfYRfSVw=;
	b=2R8VyFQT30kVyphdztF16dmJly+v7lYv0rJt/wCa6edHu7P3ZjFjgMJWq5o0e3cPItfo
	 EPuLkWiSf3ZvlD6HK7k8LYoIFwbs6vhtKRFQWObXu5fIzMft+N7B+5caliISZZuGszqbW
	 HmYmkbdrEL5JnowDBBbl18Xt6I+ej6tI9gXZjxfhiVjX964Nw6Ymnvb04GGWGZJMp1iHE
	 VOnDkgVrSw8areVZ7Q/iDvbep1Pjqq+8ap73Sft/wIe7XpjAP6HZmXyl0vvov0k+ewdrh
	 aGsQdpjw6px6AtNMpwqDvKRn5z0DB9EU2hGSxpVEVQjPqT93a8RXFzXhRbgRRCpmKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oEa1fA6G;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2352606A329;
	Tue, 17 Nov 2026 13:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2352606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oEa1fA6G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794922680;
	bh=i5GOUYtipkjBwuOdde9Bcs37tKsx9Bj95ZOzvKeJVlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oEa1fA6GsRULsaAerhm02910MylbInm6oIqOsjXDllcPW7KHcYW/oAhyIAkYqj6A1
	 9VPnK1o0KsvV36cz0tyL6NCGFGK/wsieVwkpAOHu38/gZLiXJymSZMO/njueeLYCTT
	 w5m6Z4VomWqWh94c3PRBkGgrw/NLI+/YhhEHGxFy/t+0dY/xcCJ8NOG5wk48JkeOsQ
	 Fz8rR4AEC/J/Yj0r0PKlfrQxVyLhji+LykuiJ/MZhcF2NOW6JXId+9EQpSAK8dYBFj
	 AsGeDGy8hGd19ibc+CW0E+4rnVflPX1hUFbFuhXLg9Zg/Dprtde1HtRSKSLqiIoLhd
	 Y+r6olq4z6DSg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C607317E00E8;
	Tue, 17 Nov 2026 14:37:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
References: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8370: fix CPU map core
 ordering
Message-Id: <179492267974.193585.7125119331951320635.b4-ty@b4>
Date: Tue, 17 Nov 2026 14:37:59 +0100
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

On Tue, 17 Nov 2026 13:22:07 +0100, Louis-Alexis Eyraud wrote:
> In mt8370.dtsi, the child list for the cluster0 node of cpu-map is
> overridden, to reflect that the MT8370 SoC, as being less powerful
> variant of MT8188 and MT8390 SoCs, has less ARM Cortex-A55 cores
> number than MT8188 and MT8390 (4 vs 6) but the same Cortex-A78 cores
> number.
> 
> How the cluster0 node override is done makes the core child nodes to be
> named in a non sequential way (core0 to core3, then core6 to core7).
> First, it breaks the cpu-map child nodes naming convention in the
> cpu-topology bindings. It also causes the arch_topology driver to skip
> the A78 core nodes during its devicetree parsing, leading to at least
> incorrect CPU capacity computation for them.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8370: fix CPU map core ordering
      commit: 14cdd904db60288b782ffeac59f4c626ef11e9f5

Cheers,
Angelo


