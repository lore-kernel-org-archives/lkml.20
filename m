Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D264F4446FA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387237; cv=none; b=ld0F0KDB3HW+0kGaSDk1ZfOF30zAvM0w2/fytyuGRJsN/G5R8TfqmAzIpw0Dj7bXao+luOKLgitWt2wh5TevD9aFhNDFgpdzGWiQkBnT9Rd9QZexUGNXfr7geIb/ED5XevKn+a1QGpMmI5904n1gO8fRMlJgcCIf0PbfejM/OLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387237; c=relaxed/simple;
	bh=m9JcQKlRQjZVbqhQ2VHxzc4rLiM20zJgOt77Wk2JpRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBecSBS/YriY8vkuR827bRi5Y2oydLVrC4+29SDVlCSDYi8kGgunCJ3vSFweHzNxFgrUsI7T852ODWkoFnslKnVYDVL34KHqsKx/XXGq58SRQuhjn/0y9Q8Go27hBCuO5FCxP7ntiBPWNZdkRVtfTKVoONTlw1hZKs8GO3x+REk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DL28zptP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DL28zptP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387221;
	bh=m9JcQKlRQjZVbqhQ2VHxzc4rLiM20zJgOt77Wk2JpRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DL28zptPOAtc3ROz1NSReXnmLvC9uHrd51vXm3BhIu5SY1RHWjwyyGf2zn4K4b3X3
	 /GG2a+EMVTAAGWDPSpdQymSJFflzKqTXJjWEeHxzs/F5n2tkftkuYh4xgqTItszt4C
	 bQ9ch3SP1E6EE2sXuhDzzKeCUp+NDbCbhPDfNSEfXCaA+8e+Qgh4hvLxdgztG3LDFT
	 jgxv0FfJ3JXfK4FCZUnqKEn7kpiXPbrEbgynQirlQXWvz4RnFUX+40jjEWiBEanLil
	 KGOhIE1fz1CMLRaJQMqmn63ghDrbfJwILs+CExOoaY/us3qh73ppfZoz3F09520ine
	 VS2Pfftwcx2Uw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 843A817E0074;
	Mon, 14 Sep 2026 14:00:20 +0200 (CEST)
Message-ID: <dcce7b12-edbd-4764-b154-ba178b74eb78@collabora.com>
Date: Mon, 14 Sep 2026 14:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
To: Julien Stephan <jstephan@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tommy Chen <tommyyl.chen@mediatek.com>
References: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/26 14:10, Julien Stephan wrote:
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.
> 
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

