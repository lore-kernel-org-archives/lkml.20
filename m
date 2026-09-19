Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C399340DB8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827905; cv=none; b=tvFM2VPjaaH4y9x2kOkDD/fmWLNb6ZdQfiMPbar0kOgYI1s3Q/jmS/Ebo1SKuZoSiVgHmHqpkgtjiJTQNVw4qjnqtlKrHJvrTOvKS6Bv73eiUtkCmVQcg5gscQrErCYQCzxXs8de6i7SE30/u/oFLWhvk08eg4EfPgmQZ0lufR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827905; c=relaxed/simple;
	bh=S/ViNZ2YtzcrRDHfzV5246E+VEqBUQTYkIoaPYG9LJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0x5HQ4s1dG/C0O/DJh4zlegW2k1LNBLrUsdJEzmIEPZIBbkbAl4RZzUHaMfWGj86OLgFyy7GMh/rKyXAxN70eMXRNn9H4U82JjarxPP7iMrxx6HW/KLkRqH4KaOtV7gdqh/unO26UcWNsH8IKgBULA9odKQOMJgfklLo+/h+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gvlaENZU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gvlaENZU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so8580835e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827902; x=1790432702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=gvlaENZUSvSoUstlazyLHBM3KS9U/VSUHDNpzwL/LSCxzRlPnwxi1fSqCfwPvznIOt
         J5z0TIGlN7URzU53R4atJNvyYznbQqDastpR2tGaamkJyRWxIqw/F52q59btgJg5Wh4k
         7HJrXDYJiMOkj2MOViwvExuM+C+I2fQjhc7YrfrmTE5RagT6DlIJ0J4BKn4F/HVWdm/E
         CSsmy2k8FKA5eCnr9Xqhwdv9J0ZzvX8D2PaAaFpP4goIzaQIFC9cFjxrrp948Kc3E25U
         t4TB7d6rjEop+ayr5R+SO4Zpq/VhmdAd0koVN2jwQY4QUF3yPxIVWIZVSHJqgoLmnpMT
         gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827902; x=1790432702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=ZQCop18JWy8BK8PDsLP3OhTQ0fpvNsMczPQiNQH9DtlXnrvRepRHaFAg4ICk461VEC
         1KfPpaLoGoGLjjdVrlCW8Dsy6y2mEKQQmlKG+oYlWgMG7cNLfjOt2jXUIY58aXVQfmvt
         FAR8vzTrReyfErFgkznzVms078fVPoaR8CXuzJSXBZKUi2FS7VmyXJNrEQ64tIh/P83j
         9UXP8owJCcMOj0tkEPE4AsT7On6Hzt3yIM4cxzN40bttTTR3P/HaWHCb6f5JbmsrMTgU
         WAv6eMuLaiN7/7yGLZiEWA3js7O7dTMC52LIDnbBlLi7DX2uNLILMNm0qEtLTbV9lKox
         0y2g==
X-Forwarded-Encrypted: i=1; AKwUvBxyjMzQRoFhvxBADi6Z5hfdK7MLMZYA92kGgGT5EkEHDIkBD1xCV6iVEhnGjn578LVkWoeA7w+0KWI1M+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nyRF8ANxRtFCl+MjC0KCg5u5Q5ZXv+Hm/Uc8fFLIzTl0M92s5D
	2v+YsColFoZc3Ejp+q8DIazR49+AqQHTDrO65u52gA4c43x9Z3yR14V1gxzuoKVAi5Q=
X-Gm-Gg: AYBFou1857jscRr2NVO4Kaogh9RbpsiAsvDmxsAOyLC7N65k8DYexYudRXZgYPP+x8T
	UXLG+Idl4K0/OaYGDDSQv/LWdJEemgp01QVC77cYhNBZ8+BTWIrBHY9YYC7YM9x+jN7tH7dzThX
	Rf/lW572Si8/dK0AAwYsRXpE9AkNDgonwgsMsiFM+WTBvQ6UeH9d6Ndm3jJ8aBfy3coNhD4MbBN
	zazJ2cTZS5CjgpC8Dj+krMV/xsPrE2y00W9fWXReqT+TMJAtBRqF8JfupXaKCU+Su16s39a5IFB
	sgbaYKzwuHl8zSQ+VXzZj6F/pCytJE6Avw6AsrgziYLOessdpV51DAQslW2Kcc4vNbjMcYkmYWR
	0qc5cY3cOZju+tC8bWs344YXEcrtI1WCIYq5Bg6wPQ6yzY5h1EH95daPZtlZyPDsYjLucOXt9w5
	iKM+etDJNqJxm0swRLMC8ixHgQcXQ/jPa35qYWy8GR7I0Sc4wsRZg4R5Q1tTjMMvQZmLgQlxtt9
	jQAjXJcUoSlxofTy4amzZX8NO6VP+FgfOq6JKiCx2h+EZge3o+S0W8=
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr84151565e9.22.1789827902455;
        Sat, 19 Sep 2026 07:25:02 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106948995e9.15.2026.09.19.07.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:01 -0700 (PDT)
Message-ID: <111e4f31-1c2b-4e7b-ab8b-534544d2ae22@tuxon.dev>
Date: Sat, 19 Sep 2026 17:24:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
