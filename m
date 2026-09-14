Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA446EF7F;
	Mon, 14 Sep 2026 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392425; cv=none; b=W7Fpv6ue3oeWekiEgSRrBBoQjaqZSWl/F5OgUN4htdsXzFtlOuL+GX81k0F042P03ltHC4EiAKYc8gGhjFtxJaTufEMAIRiiTcjLlCWj4UB55DZ01OEUn8/GuQbEfxSNd1ljGgO6pM0np8PJfA//MGUQImDf4tQfSIpsogyzjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392425; c=relaxed/simple;
	bh=ZLWzRh/4EYz3n1+8RCQ7p4cc+9o5k5IIHVgaaSPdljQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCldpSkNbxJ/OzGuiTkXQFAQVRQmSpwlfryHN/q14dZB1xpnOaSA8wr2cPvb7DZycGJ+qVpl4s6P9QwK0cejoEpZiUzBJyX8Gq10FnfyUD2G+Ty5jFKz7Qo6r8GlDTGajmlnptIt7dh94c3GJX/q/eVufFSvvV2tlZ3EquO7q8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZpGoEPdz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZpGoEPdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392421;
	bh=ZLWzRh/4EYz3n1+8RCQ7p4cc+9o5k5IIHVgaaSPdljQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZpGoEPdzYuU6oWBq1ZafzslhKtbnIzWMr+xuk8LJ1OutWYuPWY8QU8iccmd1u1M3b
	 PK620bJerk6XkAvmhOOWAUdnjlC0fGs4tAjSOyI1rOIKCEDWeSjQIMi5Ib1icOHPy2
	 7hj+/peXskv5Hd6V8+jALBwHsdEzLoD9n2TjOzp5ch+5Jyv8mCTZBt+HPBcUESpiLg
	 PyjtSot2+P87VRH35klcD0I1QXEPEkykovxFZlGfLb2deZLqDmoIfhKTkkqGru7EVS
	 YPmCQbH/I4NyPM75pWRoPMNmZXIqd2Ayp/Bc0OKSzvyMUGzN43VaLItRAK/Lf4w2gC
	 BXZOYKoKxFjZA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40EB717E0A27;
	Mon, 14 Sep 2026 15:27:01 +0200 (CEST)
Message-ID: <5b150f7a-0e40-468f-b8c9-18c5b3035928@collabora.com>
Date: Mon, 14 Sep 2026 15:27:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
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
 <20260914072842.24420-5-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_mck_disable() only checks for negative MCK IDs.
> Reject IDs outside the valid MCK range as well.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

