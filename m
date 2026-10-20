Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487257;
	b=JTPWAuA+W2WaZo1UmgELlcD2bgDu5sBts1hPslsyFdp5HYL6anWG0SiexGGa+kL5OCzM
	 Igf9iY4JGIKpuzigK/Idjf7/6goD7VyjNhRPkk7zHBr0GcMzCqU+SJKpqnk6EqtOPJOgR
	 3X+nJyIgBCgWNlIvIN+hFLBE5p5QbsqqKV7sOvSA4VXVRrbMu0rV7vlAbkBSX1iA/2JHk
	 bzOViKvMuOMitYb3Fa2BQBNalo0JhmR5TSswcol04+cEXQ8jJVlIcB5fwOcISvN9jtLG5
	 F6RkMPzb0xsaHx0hSS9jGYXD2xq5pSCUXVM3NtkBYyn8aZr2HGSRp+0NSNpMEuHrLnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487257;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4bn3cWdwZrpBaWzYJtec/Ntiw0Eowff++j505Mm5iEg=;
	b=FlOu+wLSU7kah1G6jr3FOPPLMRawfPNmcF2C/NND5GprI5DP01uQXp5EsRC/wahaSOAO
	 k6D2+NosQnIMkadiQ6ahaW8Oumygoy+Rn16ud5eRvWZXiO5kFmLM+b0l7Inpz4d9d3i+x
	 Dx3Z0Xz0pGtKP2FavBhe93aqwo99duFMElHKCzrXdf1VYpeAp/VvUA4sroMSzHggYeNWM
	 5GkgAPL8c5Rf7h2aKJ6MeQNhtL8mf9xuSp8MNiKks9jXYOPWS/XJeL5C5InboyEcEjmCj
	 ffnwLuF/xPFwPoC6vFWXQjTP8Rv5K+lUVFe42XPaNiYVOk2H3nbF+njYz3beWE4zi/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JEWtc8B5;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83990606A319;
	Tue, 20 Oct 2026 09:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83990606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JEWtc8B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792487254;
	bh=oRGsM1bXUyoQFClOurpdXPfqoj3kEqrQ7E5LuNfjomU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JEWtc8B5ei7AdnCgumD9wkGPxVmZIML9X0/Yp+0gePGNvkKYFhQ6trIgjFIuJmcmw
	 +juMBVqWVYgBwBNztcO+GKU0qVKV5/YR8lmSZ8sKcjBG4hoaXh/X7/GJ2HFXvwiXHn
	 GQl7ZKuGv6Ni3JlB1R3rHGeOA6WlV+nKUZVE5vE5DN+bCw7T8Ir1IURKlvcvq8CMty
	 1ODove3DUBjKOYLnRfNmRSmyBOxkrVCRuEJz2gBQIqtS38KjLiyrA4GsXEUmbq2x2P
	 mbTUdVmwVjtuOuaWphb36gnoQ8njOl7BO7TmpxKu1CLiBZ5p2pj+Z0GzLlr9lq7p4j
	 sOM/TsMdMYt1A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1320317E05F3;
	Tue, 20 Oct 2026 11:07:34 +0200 (CEST)
Message-ID: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
Date: Tue, 20 Oct 2026 11:07:33 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <179239867012.642420.15110854236483587234.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 10:31, Alexandre Mergnat wrote:
> Hi Angelo,
> 
> I'm working on mainline support for the MT6363 MFD PMIC.
> 
> Are you planning to send a new revision addressing the review feedback
> on v12? If you don't have time to pick it up again, I'd be happy to
> help address the remaining comments and prepare a new revision,
> if that works for you.
> 
> Thanks for your work on this!
> 
> Cheers,
> Alexandre
> 

Yes, I do have a new version locally which didn't get sent because of the SPMI
series (introducing the new helpers) that didn't get picked yet.

Cheers,
Angelo
