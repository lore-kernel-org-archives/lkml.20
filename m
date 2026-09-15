Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0A2EC0B0;
	Tue, 15 Sep 2026 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459729; cv=none; b=XxEMc34DfO5Q4aFrS8fIVj6B7TjlT6b93wEvg6vFVZFKga7YnO+yPrNjjFAd09rJndkwT1LHJo37aBMeJaxgV9zS7HIUqvC7FsJLPZbkktt6Ou/kpF56eab/EkAulia2WMbr/ndxd27ngUzHlZffUHpPNS6+lFWDDPeRnrRPk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459729; c=relaxed/simple;
	bh=/8p1/KKgF7AZxygHlK7kYYuUeZFkVQJJgm7WNvarre0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BinOgaybMCH+xCmrVBTrdKwmYkb8MTai9xZ+ABWNbUVKrtw+0XVcXB/1p3fKUULyofbp8Ze43INyAa69pk4Ii+hqhs9ifG0kJA2dN+APbTkAUjfAn0FEdYMlDtDL3fEkNOn/fxyIFuIAi9dGnyOovy0TBMX69kfHwSH9bE3PD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ffqRXUHK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ffqRXUHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789459719;
	bh=/8p1/KKgF7AZxygHlK7kYYuUeZFkVQJJgm7WNvarre0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ffqRXUHKzmjQxpo2VjQtOyqv6/ogfbfK6zjfcEghA/fd9iiPcjW5kwKqWGT5+0dH7
	 K+EK4R7ozILyaoaOWDNQ2Rbi1jhtynjwrKl+DJiVoEJbXlG2WpZqlbdhNUgw5OEskB
	 VjV7ZeRd2xVkybWSx2vC/6yO4oLqyWnskIXipUvITvz2h2vBeAsdNqqcXHdfcFme0N
	 rd9jBNjgpfyaUIbpR0LSFFkiSQ/knJoiOCgBRf4ZOCvZetSx8K4vFcwrtxP3vgq4nc
	 04Z5KTmOllRmdTRLaqvLktW1ZgmTxdM5d7zREvgJws8AFpE8XO9jnXw3F57sKZ24Yl
	 ePnNsiH8KwS3g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A4417E0A27;
	Tue, 15 Sep 2026 10:08:38 +0200 (CEST)
Message-ID: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
Date: Tue, 15 Sep 2026 10:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
 <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
 <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 08:55, Bui Duc Phuc wrote:
> Hi Mark , Angelo
> 
> Thanks both for the review.
> 
>>
>>>>   Though practically speaking the error
>>>> handling ends up being the same as if they couldn't fail since if
>>>> something goes wrong it's generally catastrophic stuff like locking the
>>>> core up completely so the end result is the same.
>>
>>> That was also an implicit point (that should've been explicit from me): if anything
>>> goes horribly wrong here, it means that it already went horribly wrong "some
>>> function calls ago", and the platform likely already locked up as you suggested.
>>
>>> In any case, I'm not against doing error checking, it's just about not doing it
>>> when it's really useless (I'm sure you understand my reasons), and I believe this
>>> specific case is one of those.
>>
>>> That said, should you prefer having error checks in such places... it's not a
>>> performance path, so I don't really have strong opinions really.
>>
>> Yeah, I think it's fine and sensible to skip the error checks in cases
>> where we can't really do anything constructive about the error.
> 
> As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
> It first passes through the regmap core, which has checks independent of
> the underlying bus:
> 
> https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834
> 
> ----------------------------------------------
> if (map->cache_only)
>          return -EBUSY;
> 
> if (!regmap_readable(map, reg))
>          return -EIO;
> ----------------------------------------------
> 
> So, in my understanding, checking ret here isn't just unnecessary
> defensive programming
> for an MMIO write, it guards an assumption about PM/cache ordering, namely that
> the regmap is already out of cache_only mode by the time this runs.

You have reasons, of course, but have a wider view and check the full picture:
apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.

That call can only happen if the device is not in suspended state, so can happen
only after a call to

	regcache_cache_only(afe->regmap, false);
	regcache_sync(afe->regmap);

is done in mt8189_afe_runtime_resume().

> If that assumption were ever violated by a bug elsewhere (


> a PM race,

That would have worst consequences, and your system won't be saved by this error
check because it would crash way before reaching that...

> wrong resume ordering,

If limited to ASoC, that would break most (if not all) sound drivers, as that'd
happen at the API level, and would get fixed immediately since that'd affect way
too many platforms and architectures.

> a register missing from readable_reg, etc.),

..and that would be a driver bug, which is not the case here: the error check
though would be useful during development where you definitely want to paranoidly
check for literally everything, even "useless" things... but this driver definitely
is not in development stage, is it? :-)

> this is where it would
> get caught and reported,

...but then you still wouldn't be able to do anything about it during runtime, as
there would be no way to handle this and fix it: the driver would still act in a
broken manner.

Cheers,
Angelo

> rather than the driver silently assuming the enable succeeded when it didn't.
> 
> Best regards,
> Phuc
