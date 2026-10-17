Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AE3F58E9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792264059; cv=none; b=OLxx1hJEkIDruspS/lWtNJfqUraZlT9WUuKycgI8Ocia7tTdQ5itM4STZOziPCqgzlKa02fzdeCb2XOrTNUn0wY5PIRxyXd6+GeOnKYeGtU5RXA9j/r563sOZfsvMoR6MAHi1J+kWkBIZV92m7mwx1fG1KDjThWzsmkFX1ZOt2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792264059; c=relaxed/simple;
	bh=vXXGGj/O3XlE802SkA2Kw8WyP266TDMzmDqDKHDiBcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnZNYYKtsyL/SUu09gy2t1uS/OF3fqya/gFPGAAlmbD0+h65twVXEaOv2uZnWgUeLDLSwi9F32XtRMzPiq4Be9Vzh+fZ6+xuqTaCbMhQnSqjp+ALsPW8nOxnnQl3Kzg/HWkKYfRlmSMqhcWqwfAgZZZvEQD6GzAMQmZ5B0Bajm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsVd/bSq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsVd/bSq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so649304f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792264055; x=1792868855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E8a2PvgIUCT1IDNK7mru3JGGIez7qd+preTii2J3LQ=;
        b=lsVd/bSqSehffRpgSHComw2vEczHheCxJp565NXKcrDn6kjiZZNRd9zGjySC+3kA/F
         gojSbIWv6hOd0FG/djIjchCPNolTxpq2PNmRyPhYWlUnYv8rPYerhA2hBayjTZxielDb
         uGX5+K2X0aQDye7W/z3HJMKYpx5T7mWUGDTceHnBDdi/zDHr/NFUtv8vF0/HOw2jDEWa
         eSZOaXrOd2wauoKMr07hylo4cJuI+By3dabhFZKNoNphPtx2puIsjmUUeUJStZYEXUQX
         SG0OWScm5hSIzqQD8GA7DssZC7bwx0gSuUDf7O9rDBspFe4iqL2a/coiv5nggf/QmCL7
         5drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792264055; x=1792868855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E8a2PvgIUCT1IDNK7mru3JGGIez7qd+preTii2J3LQ=;
        b=rM1ziv2MKrlRitGFg1XH8VDtaS5kUY67t95dcoBoBCKGPSp0KrvRiAZbMKqu6Cxn8q
         nCxl1rVzgQBkI6v1dkCDBQbI15hhthRUjrES1EZU6oxF2EBdvJwX4Unnj+MDXPkp3lSE
         daIfQYfbKtBzw+Jz+rc1KPsWej77XB3/SBW0rgMRiddYZot93ac7nlZJcX5Xfx0xAQcA
         5u55GyzOx58+nfTWirG6NXnMMVGpzca6zml/n3yJ6tGT0YubVAL+Lt2N5SchbAFLViyy
         yf7p64thLGFZ/WsJfmYTvL2pdkjgj7ozOZpddpBzR7jcC0TvMkDeUw+XTZ/7LbCIt5di
         cZgA==
X-Forwarded-Encrypted: i=1; AKwUvBxeQyb+LQX7W0QUUCs1LkqJyS90BALycjR/DRQaGXFA6RoJ3zwGMJGe9SM8W6d30Mpq3qOlFDyylc5eF1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8UbQSmqE4YLNCGNhBxYukoDp6JtThpXHqF23IXKyQWPHAON3
	Ru/Dzv/QNPJ0yKyTqzXwfUNxFfQmRTHMgAN1MdrUvrRkPZRkq9848n/waMw3D5n4
X-Gm-Gg: AYBFou01d6Q7oJQij8pyb7tiUTGtB3eaN1f4aoPuvAUdycoXJVBMZ6ZcIYoIubt3XuZ
	4DQNqHgsmTaLWhi7uXNgEDkXldlOZfNQqkL9t570YRkc3r8VhcXN9k/s7LQWDHr6koVA9nNU/fH
	XkN+NpdmROSvDdshnsJ9t/LlcKfbTQj6HMuHrp6JjfT/z1Jo2hRCpSTXlCCeYSL5VEo++DV3Hn7
	S+ucAQVnXUjqVsPTlbAffiH9sGgfl0olNPQslnFrwg9wt/qPjZlu7tGa2GojlfDhPlZ5jDJEI/i
	BbjQ76ZmwJcgNIQ4hNX+S/hBFWY/guJ4gasZNvvCo1FeSFOQmcWzRTvk+ilsU7/sX30YSQ4NBQ+
	FOxwc2AQQG8B3nGXwEyA838TS8fhp1VjgYzdO8MQ8UJsizN85ajeQ0BeRLklMJ2DWK7Bd/llUmk
	SPK272sakA5ZL9GQIA+wbW2bkETF2+rw+ABx2MvrWS239lZWRm5TZHgZKP5hoy5gCDrIg=
X-Received: by 2002:a5d:5d08:0:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48e07911cf3mr7339685f8f.0.1792264054717;
        Sat, 17 Oct 2026 12:07:34 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm12491778f8f.29.2026.10.17.12.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 12:07:33 -0700 (PDT)
Message-ID: <ddb1e84f-2cfc-4a99-85c4-9a8c6415dbb1@gmail.com>
Date: Sat, 17 Oct 2026 21:07:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: hugetlb: enable CMA allocation for PMD-sized
 pages
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 12:07 PM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Allow hugetlb_cma=<capacity>@<page-size> to select the architecture's PMD
> size in addition to its existing CMA size. PMD pages are 2M on x86-64 and
> 2M, 32M or 512M on arm64 with 4K, 16K or 64K base pages.
> 
> Give PMD pages their own pool without changing the original pool's sharing
> among other gigantic sizes. On arm64 with 4K base pages, 32M and 1G pages
> continue to use the default 1G-aligned pool. Unsuffixed arguments and an
> explicit default size still configure that same pool.
> 
> PMD requests use only the PMD pool, even when their order is gigantic.
> Other gigantic requests use only the original pool. Apply this mapping
> consistently to allocation, CMA-only policy and boot-time accounting.
> 
> Move CMA allocation into the common fresh HugeTLB allocation path so
> non-gigantic pages can use CMA. Align reservations to both the selected
> page size and CMA's minimum alignment, and use a bitmap granularity no
> larger than the selected order. Keep the original CMA area names and give
> PMD areas distinct names. Document the syntax and pool selection.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

[snip]

> +	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nmask);
> +	if (!folio) {

boot-time hugepages= goes through here too, so hugepages=128 with
hugetlb_cma=512M@2M already uses half of the pool at boot. would buddy
first and cma as fallback make more sense for PMD?

[snip]

> +	if (order != PMD_SHIFT - PAGE_SHIFT && order_is_gigantic(order))
>  		order = hugetlb_cma_default_order;

doesn't this take gigantic PMD-order pages out of the default pool even
when no PMD pool is set? would trying the exact order first and then
falling back to the default pool work?

I tested it on qemu and saw no issues, but I'm hesitant about the points
above. I can give a Tested-by tag on the next version :)

-- 
cheers,
jose a. p-a
