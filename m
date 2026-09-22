Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5791A3DD862;
	Tue, 22 Sep 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077496; cv=none; b=oB8EPMCU27M39f/19Eavd26cUfFvKHu0c8555ozJQm6t1d6i5FBXZW70gWmljDqVrQ4ebnCYMOFz14Y9FzPXeWRlDLPg0qqQCiwrkxh+LZVwciC0cjkkz/ea5VhR6lIgfIpwIQfNS/JvMkm1PiaBTy6y0eWZk99B962UQJoXS00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077496; c=relaxed/simple;
	bh=W+7CB1tky3BRVS0DPQGa+VxhsQuoLSseXPxz/cl6bvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEHPY4qR5OO/DYJAdaYlynsnlUVk6e3OpHyY1lZPxBZbnBbCps3nwdXkMDsZTcqSfx2EgxN2/2VAcGhVw8qZte6JKDgLdzLsYqtcRAwjLJNKDBfWASsDSYxd3wkZ86L+vcWS8NScR9twcCCxMqHmz6P+fkQFzat2nSFI6JkXbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TOwCfCes; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TOwCfCes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077493;
	bh=W+7CB1tky3BRVS0DPQGa+VxhsQuoLSseXPxz/cl6bvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TOwCfCesqdcEZrUL30zGh1tottDeXc8EQHe9NfbzsfE0stQOlZiN/Yy9YlHuwkmDM
	 DScFWtm3IreUeoVxdGRFG9A+fmjGIESxO9G42kDcOxtUKjDCJWEBrPIGhxsFu6th/5
	 at8iSCo4obkHoPlVsjTMdwqc3pWQWkgyRdEMD77WDPOIGqbP8SkNdXo7e0nZXeHzg9
	 cwlNJlEnSYUfPC4KmhAvIpRDbJCVNcw40UIRJaw7Uw+ABNbsA+sO85gc5BRx9EkVOj
	 H8U0y/TD3mDIiXHvPma52E/VqdE2UhQ7KfFHoW6LIFWEXiiXmuK+apqvNptczsFxqs
	 ZkvYzRW2Vks2g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D29A17E03B6;
	Tue, 22 Sep 2026 13:44:53 +0200 (CEST)
Message-ID: <4e68e679-f4c8-4a5f-9b06-f1c61dbff7d9@collabora.com>
Date: Tue, 22 Sep 2026 13:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eugen Hristev <ehristev@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260921232819.3137721-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232819.3137721-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 01:28, Rob Herring (Arm) wrote:
> The correct name for the MediaTek MT6779 audsys compatible is
> "mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
> binding was correct.
> 
> Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

