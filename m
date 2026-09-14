Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CFA446825;
	Mon, 14 Sep 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392423; cv=none; b=JWNoAYZ2rAWv1kUcL4Q5lmNjDDeEmOrIVbAWXRYNpdyxFzyPfLVHckO1+inSEE0DOvelten4GdzIjakmV/5aTQ12cl5bx9FPB8N6y5UEnM4iu2OmM8PIPxdP6acsOXa33qLPxXPaMEtTW7um9b64c0j6uGIzBTZYbgrTreQHFnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392423; c=relaxed/simple;
	bh=XC69gvVZiYhJa7pRhxgITvDTrC3MDY2qfawTaSxCKZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwiPMqXDEr0rLqBhTezjcMJd5VZZlJfP/8iMWtvWCny0nV+8Cqq37ZtZxvN36r/hHf/PyIVq4tV2k2WkIWDjm/VMX6rP62enKsxIIALjuKIhn/h6b4RTAS74kHfHenNRlT7Zw9bxTE7tuRZB2YPMsZx+DQtcZ4cXxEmNcuIHkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RYvj2qBV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RYvj2qBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392419;
	bh=XC69gvVZiYhJa7pRhxgITvDTrC3MDY2qfawTaSxCKZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RYvj2qBVaZwxb5KKhbaC+AAmziCSDFvLmwclGGwfxDxXm/nKS6NdjRRXbik6Ilpi0
	 vAfb/WCvVH1UCEIG7j44wEnX+M7JDIF4MXdtLXVUPpYBci5WoxPmV7saa76ppi37Cj
	 /eQms8bgaJp0H5KOvnVOj27Q8C/LGAXLeNZY8Ton9X0PTU1JOti0fh9SDSK12o1TBG
	 65XPiPPts1oRTFk1PXrUaNOi+fAuJR02YUSpgVJpsT5iZu/0TO5jfWT314TBlarwW0
	 HKRiae1zG8e2iPLbga16EWu5C0qB7q7JhLGi474+AwZmhrJPZYS2qqw2NJHTIvJ1QQ
	 E5DOlgh41tT+g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AA0A17E093B;
	Mon, 14 Sep 2026 15:26:59 +0200 (CEST)
Message-ID: <2a4b5af7-89f0-48a8-96a0-84a25c4c0ade@collabora.com>
Date: Mon, 14 Sep 2026 15:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing
 regmap
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
 <20260914072842.24420-2-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_afe_enable_top_cg() currently returns success when the AFE
> regmap is unavailable.
> 
> Return -EINVAL so callers can handle the error.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

