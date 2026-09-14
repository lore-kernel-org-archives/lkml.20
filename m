Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2553BE179;
	Mon, 14 Sep 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392513; cv=none; b=rpupuN47GeEsNYOpZrnfg650Ga9Sew78mJyd/e4sjftMFUX0k5v3a2puS+iLocCOcQvtD0Kd5NxP42WTtlEN1A4iX7qtwhHoBhhhvE9oLCuBAbtW6bcVeeefpfUSxX46p/pZOxqqwFqKB7K7xyTPCk1LZxa8vVUi+Q3E/xBhQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392513; c=relaxed/simple;
	bh=YphF5hhPQGlAuPhEBbNU9Ky2p6aYoj0ev82XKFf9Mqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKauFMxKrhFFhzMk4XePZ2JFgm9x6TJkU3ZylisVZH9z9qjXjcBWcwLmnjV4OdLKssfUT+gmyzgh/+BMILzLZ/yju9/2Lnk4K8kA/wSlmfiX2/6YBtNRTe7FiuZiG23cOjYV/NMnpjsA9qExgLFxilwLU8RU+n84zfrEsEiegmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QGFfLeqQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QGFfLeqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392510;
	bh=YphF5hhPQGlAuPhEBbNU9Ky2p6aYoj0ev82XKFf9Mqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QGFfLeqQtPEsoHecPPd6TT4T8kkjNPr7cpZlNXkVpsTNPMOLXKq8zlLv3y9LKBr5E
	 Q2z/eXUhsHJUt+Mw/hhUZCfqFiWHa8YCIq31uj/n1NJ/+k75w21nsjzWDM+CuhrAAr
	 PLTePy+Q3PMPNvlutgW0qRTq9xpmDkoe3BTqmosRHN4M2FIAFdr5kV2OULGGT3PJ2l
	 oUHrdJBW5KVS/E50DvgRIZR9m7TbfluzkRiQtx1yOhi2mwVVvewt+EWdFVzsDHOp/Q
	 UNaQIcDTWATq2w/G07Nq5fWn/FF0nKpfXuK5+eRIHH2JWPqLt0kpfaNq4jW9QeABJx
	 21nSTmtn1HgRA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A23517E05D3;
	Mon, 14 Sep 2026 15:28:29 +0200 (CEST)
Message-ID: <c8c6c9d8-624b-4543-9c88-1265f16fd492@collabora.com>
Date: Mon, 14 Sep 2026 15:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] ASoC: mediatek: mt8189: Remove redundant error
 message
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
 <20260914072842.24420-9-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_err() and dev_err_probe() call is redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

