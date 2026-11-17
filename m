Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925973;
	b=hO1qfd6qVHRtu+/O/Cjx+TWZa55MUYn335Y8AgQRrVMPEDTXRk087X1unjqmR0tVn6Kg
	 PJPUDowMBzO4z60PF+rwW+CAT4ed2P+uGkyPtjlE1glD+pKhJQ2XRwe6ks5Dws4miyLQe
	 nhlcMtWyM9kYYdJdr+m0tBFC8Q1+GJQwYwKE4k16JebqQPlv2MaYQpq48ctLpmhSLOpkw
	 4ZRyb+OTQJv0uvGuQZV3yomip9gcQQUDu++E7PvUOJ8mB2OySlSHpZKiOHAxXXkVoXh8m
	 ouZxhZO3/85YDVqrvfn9p+yy6OElB2VkP5vXkDG7+jwzbD7cMQ0+wASkwiV6RqHCRYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925973;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qD+tzylpE2ufLWvEITjSReEtXMBKjPc7yP4ypKilhew=;
	b=cNY60Jc3Pau66LKQ7Fmg91FilobQETjblhDdlii0nFfoYe5ok42mPxwH7gLyiWU+dLZ9
	 riTFOItgYUdRES/NBifHCgRY45ZyAb9wnhtV1NvnmssqXO4ctASqKU08yoVq9bzlwek23
	 laPUe3I6oNb3AM0VeNjQVtmSYfn0OtzCEgVl2iN03UHdyPlv7qfVAc00HXo9FdM1A/50+
	 xZFWLaZWrf5lEWWsTPf1Fyu+0yFqZ2etivFYyqihAMEvt8nzBMKAufzRbSYvElTQqfOn8
	 fXinBytibMtdnwgCzpHjUiTUqgQuOqavTr7T/fXN7r/wXKEpIMF6WdPgr4f1BpwUuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XZFomuKM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61C606A31C;
	Tue, 17 Nov 2026 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A61C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XZFomuKM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925970;
	bh=S1+CM4ZTRDhAuFdTnMRVUvSUePFWDrIJ2UJw22fjbTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XZFomuKMSY2LtFqd5jpC+E1y4h3Mb8rfKdpzXryTW6Z0TW6SqHygAx6f5dh+m3KPD
	 HsyCq/GFncQ+CaBq4vVX6auQiYP7DAf0LI/e4s2F++EqFSZ0EdZcxvkaudu3bSTHSQ
	 Af88IXYLmSF0rG0+SwuOR2U5XVzVwovs2W2cIQuhfSJ0tD9MHGcPkit0l/sJri2UHe
	 9jsdCngF3+ZXCXsKxOZICgUc37Vo3n8cx+iuAGMaaB3Pmub3AQATm2VfK6sOuWpQ5l
	 YpkHLPfNvZKB6Z+IHqtNFCVW328Mj4OQQWZur1XfN6WVM1gjYTv42v721USZopLQGC
	 zoqR/GNuVK4sQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 301DF17E05D6;
	Tue, 17 Nov 2026 15:32:50 +0100 (CET)
Message-ID: <a08cdf23-cf6f-4aad-a4a5-315393bef9bc@collabora.com>
Date: Tue, 17 Nov 2026 15:32:49 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: pwrap: Add MT8163
To: bengris32@protonmail.ch, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
 <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 14:28, Ben Grisdale via B4 Relay wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible for the PMIC wrapper found on the MediaTek MT8163 SoC.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
