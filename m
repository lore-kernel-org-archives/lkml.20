Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099253AD50B;
	Tue, 15 Sep 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482011; cv=none; b=i0/ZXnO1GNzovYxrOu+FTlescmaUsJhA6dSg7gSbSEnb8eX7qKMMZeLBNbNwxg4HQvy7K0rRLFZQi13eOS8zUaiebtQtUqiqRKGPe91ZoVVInSOZnoKMT2GBhEQ7S7Y+PtAZm2FAPhj9lXoT8rbjO5LZYu/dVVsZqwyAEDUMwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482011; c=relaxed/simple;
	bh=X1uRYjOBwsQk4iHixraLfF+7oZ/5RTXpZmOTIJejqFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laPmBNOFf+W5KXtksWdbCMOQt9C/p2X56likwzDq28B7hrByuLn/tzTL7pFUCB0ghDI9XPJ3u6DKnVEk8tcLXF+AxfU+kAcOJKeZNAh7dWd0erG8z+whNlKNqXXmIc3WMtfQfkyiD+E/6B6gOHCAxaDd+Jse6BTog3JrrX0UMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZiDzqsNK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZiDzqsNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789482007;
	bh=X1uRYjOBwsQk4iHixraLfF+7oZ/5RTXpZmOTIJejqFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiDzqsNKBx/4yVFHZvk0UwXUhf6U8SA/B2rLokXztM2+XKBQC+htL3RWI5/VUudqA
	 bkQFhiP0OfYGSbMdgn8w8IHgq2wNhv1ZEHxcYgvjZMpYfG3XNywMkXrVPvRdcDRVHo
	 1t6iOJhQb6vaODAuUfcB/uXehItzGU5ecmtX3bNZIzCHX1Foeik2fBBaXjcCiIeVga
	 sIWomELTygiQHlizuVkCGR4dzKmhcg0mASjsYJNf1cG/VQMCmfhIhfm6pY2t2iqWLP
	 0FLxOhmfm/q36jNXhSrerWHFFqbKIHKoHe47/8yv+NMDBcc0MSGlw2cWUAYuG+KUNg
	 VS3cioWafcfWw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C94D17E0082;
	Tue, 15 Sep 2026 16:20:07 +0200 (CEST)
Message-ID: <2203bb2b-9490-4d2b-8ec0-bebaaa9148b6@collabora.com>
Date: Tue, 15 Sep 2026 16:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915141226.600486-1-tillo@tillo.ch>
 <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
 <20260915155333.821189-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915155333.821189-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 15:53, Martino Dell'Ambrogio wrote:
> On 9/15/26 15:27, AngeloGioacchino Del Regno wrote:
>> You forgot to send the 7988a bpi-r4 patch :-)
> 
> It did go out - as v4 rather than v5, which is probably what threw the search
> off. Only the BPI-R3 needed the v5 respin, because its v4 accidentally carried
> the BPI-R4's values. The BPI-R4 patch was already correct at v4, so it stands
> as sent, and it does carry the plain reserved-memory node you asked for:
> 
>    https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/
> 
> Same To/Cc as this one, sent 13:57 CEST, five seconds before the R3 v4.
> Patchwork picked it up as 14818166 in the Linux-Mediatek project.
> 
> Happy to resend it if that is easier than fishing it out of the archive.
> 
> And thank you for applying the BPI-R3 one.
> 
> Martino

You're right. For whatever reason, it didn't reach my inbox.. go figure.

I applied the other one as well, thanks for sending!

Cheers,
Angelo
