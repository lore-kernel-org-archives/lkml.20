Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0463F210A;
	Tue, 22 Sep 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077592; cv=none; b=EcjdL6H+57HRg13RqJUFDTdkefK739bowOnjIq5LkXorJcbfYfITgufvDMdQDV1G3cjbQ9VQXWy7rdP2FbnGKuYHPcNx6ekjwn0aQ4WBxN+pRzh8PoYEb7ioJN1szWa+ejAVgs44etV3jomKHIO1JX1efayf1jB5Y8afcvWdikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077592; c=relaxed/simple;
	bh=te2JAZugR4Cday7luW0127qIkQZLtCEubZxNQ0OLhgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbaC4x8YBZljJFnqgCkEbRpDz+Zt8vB08rQCou7F8aVabdABPKSP9y1d2weU/jpcyAYLfiXutIHo7n5Cea0T35wsUgJuwcA/hV9ga1XEvnTPIaMPjij1Z7hRV5zWB4j9a2cSDfn2FLGKNpO0umBy+/dTXOnXLpSP+bVws7A5xQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fqdtkySa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fqdtkySa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077589;
	bh=te2JAZugR4Cday7luW0127qIkQZLtCEubZxNQ0OLhgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fqdtkySabCRzSaWqtTdrlKXCEer1OK37ujRXvMxkRKNIJY6rgzyDRlSBFHZdA2nh6
	 bgpJiRyjZOs7/w1/70BIz8HcDfZKbpLFpfSnAXR9wozZ2u3un2EtDTNxK64IovEk3m
	 8Q+BXqFB35o7swuZsnWwAnYWLZjJ4wEI88pVUK73209oc2sP1/t5bwVsKv+ubs8y3f
	 4sm69h9eNtRe0PTQTUebmx7L7TuSZW41hPDAKmfr0S8hkBNBBKlboUoT2GbGticQfz
	 qyNk4P50MkJ4E3qF2zx1E7pSL+4tdkIJrrYPflZ/MG4pssnMNzoYbnqrJb74HbA4TI
	 ZdfmK44fFJe1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E410017E03B6;
	Tue, 22 Sep 2026 13:46:28 +0200 (CEST)
Message-ID: <433d8c01-ad33-45cc-82a2-0b5f2a14c2a1@collabora.com>
Date: Tue, 22 Sep 2026 13:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: mtu3: add SoC platform data for FIFO quirk
 handling
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-2-71203a362b36@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922-6595-mtu3-v2-2-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 12:36, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> function properly.
> 
> The mt6595 IP block doesn't support multiple slots for the FIFO,
> resulting FIFO wrap.
> 
> Fix this by adding platform data with a field to handle FIFO limitation.
> No functional changes for existing SoCs.
> 
> Assisted-by: LLM (debugging)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

