Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882732B111
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 03:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912680; cv=pass; b=Bphw3LAGnL7332OcZyVwLJHlJo2JK27Yez60FMA6XxM8hVuUEHkI5I0ySYs+eev/0jCzw+73GzvLlGpmGJIHsP7YJf0X8XQwPWnDqdA3BmfqK59QeZphJr5BrbSyPLwIikY6kWEVId6WhCb4WXimkmn5z2DY7eqIekEzjDr7mh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912680; c=relaxed/simple;
	bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiWYxz9ZIHa13cwFca487u9C7oNAbf6YGhf9wLROCoEa31XPL/sIuFpeZw00GTD/+tWoqBcH2H3knP8GR/ZyhcaS/8n4cNRwLfGSyCSX8XryVzLoFxKRHleO4398cxqBSdywiy6WMcQI4UVpsWh51rEKQx4SlgdEVxGarsrn7lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz2KgTlQ; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz2KgTlQ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49e560a98so5189871fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 20:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912677; cv=none;
        d=google.com; s=arc-20260327;
        b=OGaKU39N/FSNvNJQjNdQQBNNmlBfkVrSWIyDa137IcW1a7LecTF+JeA0tVBmf1GzS0
         +NqYtmK0hpSSjnZibrtwybWmUET4wbQmAjXloOjlNUKZqHXHipyteLgeJ9u5kW+GTFN1
         7392t2okDeEXjf3frFWMwVPlejK4Eq51z8+27qEZwEi30pkvYHdzS1qz2Skpm/n8jH0W
         gJTBtgutEOWwuEQiQJT9rw/5/R03e0cZeKCfzlwyn8oJyO7FrbMx84A+Ne7vpv0sdMQO
         Z9dWIFbLEE9DCCijih5RUJ3FqpHCTAmipphFR1cyJHtIe13nJG/Pr5O7qqfSuNtvkzyT
         JpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        fh=2wTPWsIxUR6iHHCxGBpV7iE1Ii/BziiG/evF817nXBY=;
        b=jHg+2UV5WK/kJlJlNyRg/YXaco36CuI6FB5X4jbMXZNDxBEmGmiEpiZ68cLWBAcqSI
         JLykWGGMfqRbEbkZHAu3eeE7bFzRvjTdPNWAdeCMXHE6Ooe72EeR+Oqar0bRlQGZnwWp
         O5L56RVu8WcAMLcxB2LGadV4BHNo1SZJJ8BL4RQZgPetEn0MLYYGKM0Uamb5fYSHZ1RD
         cxgePYVfX9wlN8gyy7516C1pWf3xiJoCGdsfei7WUtJtbo68wO8rG26/owOfhchN3AVn
         2VI+61/gtULQm/5c537ObghRgs7jNPDwLVxCoeXodXhwH+iAh/uWjEhBYzGkr2iX83aT
         /tMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912677; x=1791517477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        b=nz2KgTlQQwOk0jEhd1N/BO1GDGS+g9qJaynBe1mXXsqOX8hXonAtGNmYaHPl12cUtz
         5yYU763JSB7MA/njhiKvAFC9J3ij3WDVvtmED4S/FVMi/DXoFxvJzoSYLeo8K/7+C5UB
         uvg8kOKTNsvxCwf+pUuFoKP7plANgrA5FUEaXsnR1j1IRIL34M7u6Gr5BymKY5MaNhgr
         qM+HV3DLhEDK7zweNdTABzcH7/SPyGemSzkRUCXCAhoKrek1yJE1C1CokT/VxFstr1vA
         Sn38G+6uWODXjzuYnhVoiUDRW+6FjeJWw67G+bnR9HZaa1JervKOVWDpcsr529ZocQcp
         q0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912677; x=1791517477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HReWgbpmu+EyMkLkA/hcPWjBoAE+oDWXlQs3CH3gA4w=;
        b=wDIBulvd00XBTbnsWvzF7hF0fAN51mupMZJ1VlSP2EGpW8z1aFAH17fEjlqCGxID9b
         j6HArnzq20wWdoRoaK3nBRtiKApt/XbBRJL5zuRO6OFD27uJrYLEAChEUP0MqiUvzh4Z
         aK9obR4Fa8SePA7/XKfeFUFVmlwcZcTPk96CSHNeOaK5Yh/bVHb0XYAHzzU1LV0WNnfI
         qkloQdobdVQ2SB4TEaY8ZF6lIVYjjLCdm9z0/5hSYyTI9PYcm5j8RIbRCioKDA6RlooS
         4TpBhCDnb3P2Nu/iSfyZjQ/a4dR8/30Gsbo3SUeEtzga5yWm5+w7cNSWKzSsuke3RtJM
         1hMg==
X-Forwarded-Encrypted: i=1; AKwUvBz1fPFda1x/kbFsV5YxeoTh2n+SErCmSgzy+TEFEz38sqXuYriDqmWLl9AZ3d3IoskedMQe/W8K4vV9kJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ7P/1rz0rtJB340UGHqnRTrL4QiG4d4j88+oyd1t13IVfXy2i
	IB4dWHENK81jd7C+90ASAwCiBChCDp9A1Pd4oC7BCESyAb6lVIn40bSxgruTxnSIrruxh3EmOHQ
	8yIOhgunSApc1J4BUWJugQKsJa3tz7LU=
X-Gm-Gg: AYBFou1kMoYL6LdXlJwgOtAIdD3zSOKQoFMWPxwCCZHt3Pbz2EO+pH6z0g34o1R1nYU
	Eom4vHWWK/TWpBHWngKv7b3OEvPusBed5YzzEjgzJV9m/DWtialBKwLg/5mOKWUigCTuUGkrSri
	ov99efq7qYYWtg8a01EBI/Ps32vcTvAsTOps5A3oGwRaKJ5ywJc4I4jExvk4vFX0AM8Farr3Q9v
	0rKvV06eudlK0sOVck9u/W4+it72wQPJFq3jIMwdNed5JGbZpWvVeznBGOPk5jHiWRhpY3Y7MIK
	gIKFglNHqCih8ZbH/aINyc3BsiS2haFOgXU6bqv/+SgkhUO+ZoJF95hsdZud7fl9fUPd69uP0en
	vxbe1YDTkA9VwUkGmXYh9GDb8ewQuDXtJt3wc
X-Received: by 2002:a05:6512:4011:b0:5b8:ef9a:40ba with SMTP id
 2adb3069b0e04-5bb9bb1132dmr353216e87.4.1790912676690; Thu, 01 Oct 2026
 20:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com> <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
 <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com> <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
In-Reply-To: <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:44:25 +0800
X-Gm-Features: AclHuK_Dh5pXV_8N5Am6Vpr68aVyRU0--ZbOln1WgpOW5_eCBnb1L7DMrifY0iE
Message-ID: <CAKspUhJRG1hh7OQQh3a9yx9pRbKFOOMmhghhvxpQ3UKRob6qgg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026, Jani Nikula wrote:
> Oh, by the way, I do think the series as a whole is worthwhile cleanup,
> and having the :Original: fields is the current practice. Removing them
> should be a separate change.

That makes sense -- 4/4 only brings these four in line with current
practice, and whether the practice itself should change is a separate
question. So I take back what I said about dropping it.

Thanks,
Chen-Yu
