Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DE429014;
	Mon, 14 Sep 2026 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392529; cv=none; b=e5wYKcyebsBZIlRJKQki/oZYWOeoHh7ywEVlGpVVcqeSa0RqiieFipSoDpS7hZYbxIzQEh4DickSLO3en7ozT0CZPZQpfa0eDGsadLomWAeUF2QBvVwLiH+EErDcSXksgeZssfPhRXW/v81CJijIf1qThwLKqkhaDSb0KjBtBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392529; c=relaxed/simple;
	bh=REg4uHosenbAzdgcoWyyerJu0bET1xnnXP0zRa4SxuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJeOqCuhWBaunwojmSdylQlXVh0y8xWr4Mq8jGMukzmRUb88cND+9FlhHrxkEMub+QX03Nv83TXPl7izYYJav6mu4Slh0OvYFfJdNgD8hEVXGsyXB/zXJXcjoUQT7oyL5tywA3RDHsZa56Qi5kEun7gGdXY2saauY579+K3D60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JtEKlTZq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JtEKlTZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392526;
	bh=REg4uHosenbAzdgcoWyyerJu0bET1xnnXP0zRa4SxuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtEKlTZqyP4QCKWctQQaSU04v/ZcRaHosFekq2SlpKf+qf8lK25dl3pdTgqNQLUJq
	 NHo057bIdCakhw2D7kMI1eFfaSphIsjkaeOvT0v7vYuqmMLgn1HDX3XhBTJYK6mkAf
	 piay2ebCwrdAg9BKqvcyWy03vpJP6Ilab2ukxf7cyh9aq535Mj46OXdW7dhkcAbsfi
	 +jJxow1i+99lq88nLKOEshluO9DIcX4CfGNgwgSClCYc5xFIgph7IWoNaPyjHCDwok
	 F1xTTiCjq/KVutWK5mjB4Hk6jRNqm6Nz083uDLu8Qra0mYRIB2wiB/Gz/yMeCEnrVq
	 5YaqWYIVIcYsg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24D5817E01D1;
	Mon, 14 Sep 2026 15:28:46 +0200 (CEST)
Message-ID: <9a2059d2-3682-4716-a8b7-82acac520234@collabora.com>
Date: Mon, 14 Sep 2026 15:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] ASoC: mediatek: mt8189: Validate sysclk
 frequency
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-12-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> A zero frequency causes a modulo-by-zero error when validating the
> I2S clock frequency. Reject it before performing the validation.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

