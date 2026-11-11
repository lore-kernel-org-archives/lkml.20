Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407741;
	b=WC8kO0TeA8i+sB9rXH4q7QXMVVcdrIX+htD8ZGE7QogIkzkkLWen1Xab6GAFDtIxOI8q
	 ZkHAiYqfS9lvgAJLOSzQspyka0T7ih2ZqkeFccpiUUYkfo+YrBG2z0EDZcHm3fGFg8Llb
	 S0zoetqbOgUlTUiK4mBmNHLhqj7Vlg22MlppBj8bup5UNw9jG/FdVKA0UIMaqQ52Flcmv
	 Bml0W6vgieJ+9NMnVDIjeP1obgPf6RHsKGg+PtyJ6AmhOHtgeDECy8ro5lOwZOleCz9AI
	 L+La7aZefNvpoAz10VM7/4wuaC+34ogrfbWi/lbMyhSlvaeQhFrpeFQbK1FxuvoNzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
	b=Q/rusRV+SaUTToN732/pYJT8VZ/bKTmCfR5CGpTdwLpmSIRt+MJut3tE0TarYIEivxeG
	 6ewKP2YOKIpBOPNHdou3PgJSa/et4D6aqRvY9Iu34wITCmARfosvyByyHNTKQ0Xg2YY0A
	 TUnRuSNSSxl7VbX2NbE8Ln2fjUsGtxn4CRwvim+1wUd4TAqRecy8Ao2MfIJAsKB6Hoy1R
	 8Pwe5xZ/h4Bhn1ZaQH1gLl8a+pEj5EMZKvflZwP9LYa6R1OurOQW4FYNlFOMI/A3oKPSY
	 Tx9thKoDo9+6QLm7/hpgFaAdTSKGF+bD2OLFUzv8LcPapf74G5LEiOjXbk1A0DJ+cBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E266606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E266606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso22438755e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794407739; x=1795012539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=tApccBJYxGqYQ0axQSwCJPn0mwq2weRps2CbB1jIwhxYbrvOD/qMMKljbwL9hVXS74
         Bq5tsBi2L+q4Tsw5R2xzIDpQyplM1pXPHpAwjgO3otf9997xSSSo60UzxeDoZRbXYryi
         JQdJsy+xVPrCkupI7Gf4vMm6SuqxzvygBY4/qeWw2O2SXl6GCAwasomweInRz+0KoS8z
         I19pjTJbFW4qKAYEGpxjj2eAV44C/SwlA9lLWUKiHNIPtxkXAkEPl7qPJcxUqPSn6Sv+
         ShE9T6jeYB34bMiGVDINraOaVozuMlE/OpN4JPPrNmA5/d8wA0OR7xVzd+AJcPfk/G//
         qdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407739; x=1795012539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=Py3w3H4TMsfivSOzMDXIhpjn+MLyvsuuoauw29TRNBvotPEBwKq7R4gtLSIDzpgiKM
         NlhA3WRzXhpWu6y5DmsOpp5YnuuI8SzBXvTJO3U2UurV4DrSdPtE3tWc3e9mup1TLJHu
         FZ9hOdkiHL8RINxeZ/lZo++xEt0aE2vy9ilYQCWZWVonF/jCDVS2W1Nua+nZhkoGk4kF
         RLQFZn+Pw7lARdjS2D+ARy2NOsMLp5zJUTm4DtvTEtc+qJxAeAO3n312U0fK4vZ8rFQG
         9snO5IgZvEFl6Pleda4QC7ll3XB4aQrDuASvcIjl+4hTMq7lIMfr+NTXVOfVOWIUXdYA
         3xeQ==
X-Forwarded-Encrypted: i=1; AL+hErEbv+FQw1hesvEmfojwinNucFS9JOXejdPSywtRvHbP1zbbsJPnMp4/NSBj6/nVB2XucLvqA899VfsP6PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TMwfdECAAIs4D2R+FXUe+KQAb1Mi1u8OQAt9kJpN2vk+SHcHR
	nBGfyn40ZBATI8NCaKoaTmRW0mCqHTFP+FeiaMQQiTtJ+IMzP/RyyObwgmnvYq5kpNk=
X-Gm-Gg: AYBFou0ZpsZlv91D5FOQvSg+nqUjJhS9VAp9h4RuzikDb6MG8rypNo84N5iHDLWdOKo
	K6x2vGsdoeGnkVlxyF/CynT6HnnkKPN7NRjTIYGOOO/hTlm+CClCpkn9vLuOvd8Js6ePWcnMJy1
	hnL76IvP6dHWRg3Iy6338ih1lppVcJY7rGN+SneUfsPa1Uw0jp8G1Wp/JOiZWPWGYKlr0cyaj5G
	46u9teLO6mnEMKRjHKiAyPSwVlFeyKV+pUteTidfBU8C6LbuasYfSv25ygIXsY6TvTl9Z3jS89S
	oLPHPEHyaiGbKNJlEKcV6ICdUUxU35qa5DXsPSxC3tcu50UKmsu/eL9PQJKLKgF+9sMgES6tFFA
	FC3QQcRRYQppWHvtK2JZd37DEa6iZ8C2UxNv3l5PrJqwSDMkRONXkcQrqMaE/SII8LCbEFybBIq
	JELceoU6qNhYHdYBvwLfdEwVvtES/NeWj0JUmaUxW6btp97lQgCtihFMHNgOgFd0F76gnSZ0GTh
	HNxet3PgwohDnofuHPFPJM6LPbsgkZIb/tdZd727J941jg8a1sEtAXE3Wg6IyGMo6T7Kv81qlkP
	uphlCbcKAVNX0rp1zjUl478+nYwUABY2/S4I7ovT
X-Received: by 2002:a05:600c:190a:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ba0931ed3amr49687875e9.4.1794407738850;
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm11475146f8f.56.2026.11.11.06.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Message-ID: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
Date: Wed, 11 Nov 2026 14:35:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111135338.27008-3-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 13:53, Allan Siriani wrote:
> The RDI outputs use the write masters in frame based mode. In that mode
> vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
> WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
> whatever a previous line based (PIX) stream left there, so nothing tells
> the write master how big the buffer is. If the sensor sends more data
> than the configured format, the write master keeps writing past the end
> of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
> MSM8226 today (the SoC has one, but it is not described in the upstream
> DT; its VFE 4.0 shares this register layout), that corrupts unrelated
> memory.

This is a long and rambling problem description that looks like LLMese 
to me.

I would appreciate a more direct and succinct problem description.

"MSM8226 doesn't have an IOMMU defined. If a sensor writes more data 
than WR_BUFER_CFG and/or WR_IMW_SIZE expect we will get an overrun."

"Program WM_IMAGE_SIZE and WR_BUFFER_CFG to restrict the maximum size 
the write masters can write"
> Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
> driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
> and burst length, IMAGE_SIZE unused), from the bytesperline and height
> of the active format, and clear it again when the write master is
> released.
> 
> Pass the active format to the wm_frame_based() op for that. The VFE 4.7
> and 4.8 implementations, which use a different register layout, are left
> unchanged.
> 
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---

Something like that. Please don't let the LLM write it for you - the 
word-salad is difficult to take in.

Commit logs should be elucidative not occluding in nature.

---
bod
