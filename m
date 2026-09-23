Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4030135DA5D;
	Wed, 23 Sep 2026 01:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127013; cv=none; b=tGLT4yLinZ6PbVt9yoB687l7x4XHTBVbtANjg92Ij1qDHRWpyEg7fVPNgnp9Gw/5TLPgazVpe2ethKsGWIcEebcz/54SQF5M6CEFF904+htASFp3dAczlMXtVgbdEOcuEYX3DKmh8+EkvU5JiI9m5aKYFIhROtxY/m6eiverhvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127013; c=relaxed/simple;
	bh=l6wavfWFqIPbHOP0VOBZlGD4ZV9dL1W6BaDPspxND4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1a6tV15cIqCr0U65zzCEGlPhJKnC/1aTSwhmHqmh+F1Iq0U9Hoo+LiwyjAvaem9Uma7uqtILrM3SATvGKrggjpld58b6b1ix7D+s7cN2CcGEMh3T9flswrYfrVGATENYmjmXocrxB6RdTSu4BKcmgaq/cPqjnMPDKtOlOUOLu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4ce5d14ab6ee11f19a56ed5b684f684d-20260923
X-CID-CACHE: Type:Local,Time:202609230918+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5577916f-1f5e-435c-8de0-25e55880b9c0,IP:0,U
	RL:0,TC:0,Content:18,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:18
X-CID-META: VersionHash:7db8b62,CLOUDID:30e527e91fb5a7723ef191353456febf,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:4|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ce5d14ab6ee11f19a56ed5b684f684d-20260923
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1757878694; Wed, 23 Sep 2026 09:30:03 +0800
Message-ID: <86bb39db-6602-4068-9789-e3c472fac591@kylinos.cn>
Date: Wed, 23 Sep 2026 09:29:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7
 14ASP9
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922123029.534152-1-zhangheng@kylinos.cn>
 <arKCdpOu3C85owdO@sirena.co.uk>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <arKCdpOu3C85owdO@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Since this commit was only from the author's side and doesn't link to 
any URL, it's also hard to determine whether it was placed in the wrong 
location.
