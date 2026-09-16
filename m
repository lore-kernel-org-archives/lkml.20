Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E834C14F3;
	Wed, 16 Sep 2026 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554010; cv=none; b=JFzw/q4haEXbz2d0tMI4AA4fCNxeGnLL16aNVhH+D7oLQcswQOUNeJU798pwmkDBYLEbfqzsk1YhMGh5hdBVtFkf1YsDxlZ5779+oz61TQnCnNFgpoqqa1nNHVv+xHhHSkL3atXfB7n90Zn5WkGQc8obboxJhEdZJ2mQ7jwYZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554010; c=relaxed/simple;
	bh=ZdiiynkTSEzixqoDULJaTjJ2JCfd9M9hNholTnj5GQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEW0J0b1wg9YvOJJ6v1UkfUepm0uKR11tUMDtF9CSMlpKf/yCwZJ1oZ6KR7T9+jC13EESYURJZmx/6rOfT4Sx4gVi4YTp/rCCjGh7dAsANTt4UbLD2b1BD+ZPV6ow3fjFT8Qy566Vo3OAnMYDaQkaCGBKHtYNBsKZFW+TpIeXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mSIn0NIG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mSIn0NIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789553998;
	bh=ZdiiynkTSEzixqoDULJaTjJ2JCfd9M9hNholTnj5GQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mSIn0NIG7emGT1WDtVPOGhV9vO5/hD739A2wU0lUdlnlJ41tHMC0YYehbWqSPjDW/
	 BKKJg5d4OVpSEsvqIbRt7c2DlxJ90fxG09yH6/OqQBobMrbLh7OwxhUCOSEBY/zkvG
	 /UFoRyGIc4zvqn9/6YvV4hEgFqAdUKHla2Yx0UbqIqJjBqh8rtwPVjUaFt9LQGQblx
	 d+oebwWbgh8eYTHB1kx3h+UOy+45/ex9QtheyI+CSWJz08SIzYMMA1eONeNbLqutNX
	 6F2kd72D2QJD5KHhRjMQ9ciHXyiqjek7+nXguzHMgLPE7u5ierx9Ircz9sWpHi3l+0
	 KicQ1/YeeHGjQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC5AF17E0420;
	Wed, 16 Sep 2026 12:19:57 +0200 (CEST)
Message-ID: <c8fb208f-c9a8-45ae-93f2-161279f2ba37@collabora.com>
Date: Wed, 16 Sep 2026 12:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 07:00, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series addresses part of the error handling in the MT8189 AFE driver.
> 
> It propagates errors from clock operations and runtime resume, validates
> clock parameters, and removes redundant error messages.
> 
> In v2, there was discussion about checking the return value of
> regmap_update_bits(). While opinions differed, the existing driver already
> checks it in mt8189_afe_enable_top_cg(), which is used by
> mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.
> 
> Therefore, I keep these checks and add the corresponding error paths for
> consistency.
> 
> Compile-tested only.

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> 
> Link v1 :
> https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
> Link v2:
> https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/
> 
> Changes in v2:
>   - Update the names of the goto labels.
>   - Check for zero frequency since freq is unsigned.
> Changes in v3:
>   - Add Angelo's Reviewed-by tag.
>   - Restore the existing afe->regmap checks,
>     making the separate patch for missing regmap unnecessary.
>   - Do not pre-initialize ret; set ret = 0 in the default case throughout
>     the series.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (12):
>    ASoC: mediatek: mt8189: Propagate APLL enable errors
>    ASoC: mediatek: mt8189: Propagate MCK enable errors
>    ASoC: mediatek: mt8189: Validate MCK ID
>    ASoC: mediatek: mt8189: Propagate reg_rw clock errors
>    ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
>    ASoC: mediatek: mt8189: Propagate runtime resume errors
>    ASoC: mediatek: mt8189: Remove redundant error message
>    ASoC: mediatek: mt8189: Propagate APLL errors
>    ASoC: mediatek: mt8189: Propagate MCLK errors
>    ASoC: mediatek: mt8189: Validate sysclk frequency
>    ASoC: mediatek: mt8189: Propagate TDM clock errors
>    ASoC: mediatek: mt8189: Validate TDM MCLK frequency
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
>   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
>   sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
>   sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
>   4 files changed, 154 insertions(+), 62 deletions(-)
> 
