Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C044CAE4;
	Mon, 14 Sep 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392420; cv=none; b=T6RcwJXK6g2+AcUPXMeSLdTi+BykabDrFYCFTyuDWbjMxEM0Z1Pp+S0tVlY6VIYD3RgZdW/XZ0j2f3uLmXdtjb5S+aYcY+X3I/QIKtDFq7Jn780N8jAh8xauF48LhOCzliDIJQZgb6/MJafHkyt0aQwEgq720ogTLEiWQ9G+ZkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392420; c=relaxed/simple;
	bh=VlDvCei3Ewb2SoPuYgJCEPOPSVxpLt3TODjVs4hS56c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXlXfmTEaw58a0oFOEWxptb3GSylmoRu7bisd+FS0+q8PYGULb/fJyXR51oufJyJ1XvMznpI3BlxLYTO821yL1DAurC0Jd2aH2sTTHQo6Qxgje1lRuJhlHq633gWZbirthnyBO3LG9xhfh0L82nq6AbEGVVSstuaXPgufW8OL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fh88qEzc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fh88qEzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392417;
	bh=VlDvCei3Ewb2SoPuYgJCEPOPSVxpLt3TODjVs4hS56c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fh88qEzc2+dSsZSK6i+MXYgENumL07wsca23XykwLS2+F9N+g2opfMVJAZCSpPw9I
	 RkkFDH7ru/ugJBrHqXd8qkEEBcl/0+blRFecNrC12YLrLr4ADl47K7JeMsUElk5vIG
	 hiW3HP6Uo3EWp3YGt4T8JWnSeLWKlxKcH0Jg/sy5pu7dL9Fx7kRrFAayII/XlHv5KK
	 HQeCWLLEFZJjL/0nHfS/OWGQR/WhHHXjqsoHXWR9rqvTN9GSRqDqY5cJ6x2PyzCGQz
	 xrLSkE3O5sL2ZKR9JRbhQzMexSOy+ssNovyD22/OzI0Vr81Ef7C78hlH8+zc1KKkd8
	 92MR4PtfpgzBA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D4B417E020C;
	Mon, 14 Sep 2026 15:26:57 +0200 (CEST)
Message-ID: <6f55e127-a39a-4c9b-94f0-57cc951d7ed6@collabora.com>
Date: Mon, 14 Sep 2026 15:26:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for
 clock errors
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
 <20260914072842.24420-7-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-7-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use dev_err_probe() when obtaining clocks to avoid redundant error
> messages, particularly for probe deferral.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

