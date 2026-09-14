Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CD147A87B;
	Mon, 14 Sep 2026 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394313; cv=none; b=Sfn3rhRKAijks/LBGJfmfxBDkhAVmTPEgsgo0/rWf1A10LVMIeKrWtEc1BMsRT+5mPdHXtYWyIPDUVbbziLedQYAwg06TSGb7DdBBtagOpwDgXVYBtYpxheonO3s7MRK9LXSJdb53M4qM3MO361Vl2NFyAI9aGpdw44Uhj6gkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394313; c=relaxed/simple;
	bh=5PRno6bDN7rPaMhefe1EXNUdAJWaB7rxNicPHWb0KnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9s455G/HYdN/kOaWwyi8hBrK3TwE6sgQPYpQNGn7IWV/NacfCuQyk6Ajza0Ge6t+HZAAhPRE9Em/MVBPq6493aocBM7P7TDiaV/pY30LXrtplT74/Twphfz4fzrmVdyzz8eksL3QSxO3CH2wtPYiOI25sL9bmeHGekSwAnB2fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=II0/Ohlb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="II0/Ohlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789394309;
	bh=5PRno6bDN7rPaMhefe1EXNUdAJWaB7rxNicPHWb0KnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=II0/Ohlbjh/tfLR/rkI11YDxsqnSLpLp+L9XW6BiNCOzRWEC3mRcQEVoLdXNtXCcA
	 JTYgYVwNw031zm8hW0Bfk8I59I6BPT/8j86ie4Mgo4jzi7DcK6m3NejaDjdZ6MMM1p
	 XzWmDJDt/qAdomZoyDki5Kldwq9LGkpcGdj5Ao5iCVE7yn8vJYi66/1AHibngIeZUh
	 QA64XxXu3Pl4ZP6Wxy5Ul3VP8gpUxzwcfcMZpb0duA2dxuvw+FlmG5s1V4cPcSdf5d
	 CCVKZdP5gTiY7bPzYpgRrKvLCHk+y6B+Dw79gkN0R15OU/pD37PGw7hcNhzxYS8B7Z
	 ZKdnLoN1eCrkw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E739917E0700;
	Mon, 14 Sep 2026 15:58:28 +0200 (CEST)
Message-ID: <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
Date: Mon, 14 Sep 2026 15:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
To: Mark Brown <broonie@kernel.org>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aqf7B_E7_Gv5iK2A@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 15:47, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 03:22:21PM +0200, AngeloGioacchino Del Regno wrote:
>> On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> 
>>> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
>>
>> Well, this is a bit of defensive programming here.
>>
>> The regmap pointer is already checked by the previous function call, and this is
>> a regmap over MMIO... and MMIO writes can't fail.
> 
> Oh, you sweet summer child :) .

lmao

>  Though practically speaking the error
> handling ends up being the same as if they couldn't fail since if
> something goes wrong it's generally catastrophic stuff like locking the
> core up completely so the end result is the same.

That was also an implicit point (that should've been explicit from me): if anything
goes horribly wrong here, it means that it already went horribly wrong "some
function calls ago", and the platform likely already locked up as you suggested.

In any case, I'm not against doing error checking, it's just about not doing it
when it's really useless (I'm sure you understand my reasons), and I believe this
specific case is one of those.

That said, should you prefer having error checks in such places... it's not a
performance path, so I don't really have strong opinions really.

Cheers!
Angelo
