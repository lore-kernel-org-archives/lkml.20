Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878138;
	b=5HMlbjhSVB5v0+QLcsNfXGnU8+77BNInZVRrfS58rOAlknXz1W1aGW+oiieGn3Vi36hl
	 B56RZO7NexSzUaHhSlmLU6f3DMDGiIRdom2/RbAP6V/LdSgDNkhPgHb9VlCBaslVb4sCP
	 JuJLrrRCuHq26UMW2y7FPIcM251xGuH0pDdEUV6dDfPBwrKNGk2ZKpt8UWNmlaWMHnXQE
	 hBPEZJuWL4SxZZ08gZYeXTZ8V7zLMFp79+YlqpgiuSs9MQGw+/cbk4YaeOYylM3T4AtTa
	 WDcFpaHCMHRNdXOBRd4nUKQyOTTODXWsRhcERj5AG1GKtkGSu/OzkoJgQr0HfOWbOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KYuAf/nYjeBNHG1mG8AOx1BUbgAUnA1j6gAMCPYxxlM=;
	b=Ty4GTENShV+REJDqeYdicVlGIoPE1tqkiyJKioM2GMmCwD1NgFjRs9Lix00RiwqWq17/
	 J6XvM+tnBI74warp7T7Xyto5SQPwyp1e6Y3/lP3wVpf4xS0bviKfaO6yngbZ4yZYBJ6bf
	 BIEPUEUdWcUizOtOrv8VOjsIwBR+QwXR9fhYjOGDEKtMbLvEgVTjXz4ouF8DFKMG+UmuL
	 eipsouTjsInumziBJSV4lI2JnpFxKACTK7DRUvo2OZN1Hj2AyUGkf/nUNALuw6Opc8QDL
	 8ciRd6RqxhQ2H3cPf0GqaPWnOkS62hQx9Iqo+OTKEgvghoOzwvMicEgTA39wvtMT6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gqx8gRD/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DD606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2DD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gqx8gRD/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16440605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878137; x=1794482937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYuAf/nYjeBNHG1mG8AOx1BUbgAUnA1j6gAMCPYxxlM=;
        b=gqx8gRD/xAb7RuPGcePdw5i58wmVjCmdROs5keeVRsQ+e2FiKoCw2xe2wLD6r0eLTr
         KHS62rHjipUJbgzcUJm0UJJFNQH84tknqVP1NKhf4RrRFF0DXKC495rhGra20vqL+SdZ
         LPTESJdsXY1i33d532BzUnFcBlAmWFrNnRDtv2wQRyNyyZNqQZugtCwz5tbgS2jC+Qaj
         e3JFtJuxOUhYudTFkFTRmFe7anxpOOIsHbtyG91/iDvDN20qSNsgdH2698O0wM0D1HpP
         7o8G2JvBXOIrHelgOM/7oTsIOraf5Ocdxxsv8+jwMP45cwBaHf0ao90s4qrt04njJ+8W
         JV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878137; x=1794482937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYuAf/nYjeBNHG1mG8AOx1BUbgAUnA1j6gAMCPYxxlM=;
        b=hhVdkKSmRp0vnuRsJydMxMgsjur+6A0p1rPkjaCP14M4kZQHWmcoBqrCgR5RDFJQ3G
         jN7ujJLcFiuL/g/sDs5QE0j21apcS2dJTcNQCEQI6e+cH/XZDeaDzgqg18G7eNSTKlDL
         a2Hzfx8RgsOqu70tVZpaQzZj2IsG4w2tmNW6+3O0y/lZW0pfMZllQMGpdhYwHLuTsXgB
         xBJA0t8tutlTmgyda4xLtmMLRplPL7D+xMHEQVtSTlg/pjuDzHlQRaf7KKN9gsI9mg9K
         0H4AeiS21k4bvpkItUX5XExj5wpDohn8mIJ5fArr5StxUFIR4fCH8UHHaABJTKbhJG4J
         rzCg==
X-Gm-Message-State: APuU4Z9OEarWbFw1I7B57c1S+ftwO1nusNximA0kzZsDVuq2H/EgIM4p
	H9LMMxUfYsfT6ckwPU5wljZYzJ2shYTdPBolOI1wuV2Wvq2FdkoNeN0e
X-Gm-Gg: AYBFou0pDo3yKYZGBiFRgSakfGw1M44/pnzVSPI+gYW6cWfwtoSLc0v7sKEh5OIdOJx
	Sveur6+pBEnx9H+WClvHh93Wq6QwuKTMwOgV6q486RH18YSlXcYgdj2vx5DGKL2Y9rnNFVQ3wkW
	ZRYPeiWpxtdDEb2iGsvi/6ygaay5vLbdX9Pc0cQwwPe5k+unODev7rcgBghflOuk9GONr/zROXQ
	xd72FC+Bi8G4FcuxuyWLP3c1FHLQ3vH5By05TRuX06ZKt0R8am5I7R2WtG2oZXdfdtsN3FgUvK4
	SEzjjsIESQgQdx6/xDBwBPOv6m8KbRpZzl3Q+hvqurZHLzdPRkCiYYF+JbgbKpE8BlyHQrARhP2
	g8DkuNEAzXvzIDT+vSiAKw/MTIGxQ8XLBnWKvsNJHcHdca2FaWxd5mQ/N+tqNSz2amZS2PUkHUw
	olfZ1gq1UwHmpi9TLwjKPGdUikQathlSVokvg1pQj2w2dZSEUX4b05S0gDPYCaI0GeGA0UucqDz
	vdv4730mLb6VUaGvPq+vBRIXcCwO6G2TjP5MCUwmkqmUd6fxrlK7JHTHipV5uCmYq2fF/F5R+hH
	+L9abHgnnQYEM0X6YtmNgtE=
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr461927035e9.11.1793878136849;
        Thu, 05 Nov 2026 03:28:56 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm102176495e9.3.2026.11.05.03.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:28:56 -0800 (PST)
Message-ID: <4f63ce1d-4e74-4fed-aa97-e00cd30781a5@gmail.com>
Date: Thu, 5 Nov 2026 12:28:55 +0100
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
Subject: Re: [PATCH v2 3/4] mm: hugetlb: fix GFP mask propagation to CMA
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org, lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 5:07 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
> during the first MPOL_PREFERRED_MANY allocation attempt even though
> the caller clears __GFP_DIRECT_RECLAIM.
> 
> Pass the caller's GFP mask through the helper so CMA respects its
> reclaim constraints when trying the preferred nodes.
> 
> Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
