Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D86305665
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254636; cv=none; b=Lhu96z/qqtH5Gg/nbCNE9WNl6V2vF4He85oi71Y1ZmEUpkkODLuADx3do+fudPQVb033+EzCjnpAtmeitFIM45SIDKQORB7hiHbxw7qsRd9zIhpMKIFrbD6WwECfgH022iwaR6RYnG5wDD6lvNp4dts8LO7RDPwWBHVuGNwuwRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254636; c=relaxed/simple;
	bh=qO0kj9PE3B3BHU7L9oKJMgaMPTafszLp+ZSfz5gzDLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZZVx3R8yoTbBXcwHuXtAoGxrGxuvf7NDpEkmoUmAQvOmHy9mvMFzw4dJ1d7e8FJ6OtyYWk86SEpD74f5JX/EEXk5JrtQ3jo4VVesKLeMBZIm8GEh8yaeH4gqzn5pdpWRvZV0skYrAu8xF9H9tm5+0j2lj09YvxSpa6uR1KbjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LW7QsO6h; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LW7QsO6h"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so333516c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790254633; x=1790859433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pevCrRcNO3jk1yVeVzTiK99o69tfb2DiDsJdfsvZ4aU=;
        b=LW7QsO6hNJO5D72KAhOv1RfeZJ+a66q4U23s4dQ3+/aepIHGhuXeAcBpHsHzsK9nPe
         HUZb5e8AckQ7n/dBel5MsXyT6XxyEPB+Vn/VJXG9Nq7K3h3oCkkdyCxU54uZEOowhTSl
         SifJxz6dkZHbrWR2Mo0JC3aDrCSFgy6uOH2B/5zKvRygjP1rpQ/Wh8g1BGKsZ6HTzaYb
         yjfRlqRD5Gvm4OuDc2YfaFznXbE41KQVrwavUWv4CkFk4VWQ5/7bUy6c9OA/lvMAeUga
         c8HHo5Jm7TFkQdyovVDkHCtoN8OwHLaSCPjqAYdHgJjU/nqDyV90FUwLPcKM67ReZfQz
         JH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254633; x=1790859433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pevCrRcNO3jk1yVeVzTiK99o69tfb2DiDsJdfsvZ4aU=;
        b=iREzeRa4ioUswkkeesSUiQuI4C6R9Z0/cIhTZ1RNfUI88NMDi/PpJTqN1mXQXzx91O
         SR+t5tRlnTOL3UqYDsjjVZ839cRJVGDPeTnJc/6Yv+LLzeMAi/fKAGwJq5yIV2UQ4MfU
         0PZQE/mxx+s36okpQleUqoK8Cgya76e/7fH9XSXllDyz75LUkcJTiCix3xAPQme3Ww1T
         2Q5U98SEipTE8J3LOwXhU4GVDqDdUvlRzyby0LiJ/AlqFj46dIpSoozCUNHnecSbyFqy
         lACh+jps2iF2O4vmpX/Gci1rPpjRqufzm07+Mn5BZ79EQY6A0wpLAi1EqAa74GemXIjH
         b4jw==
X-Forwarded-Encrypted: i=1; AKwUvBwzfpGfF56qsHbNmIUHeTOoNWFnm/iWYlX9GVl+fHEAqghqiWKVMxwBOVpVrzRQ64S6y5oykxXifjBs31Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l8AuEFOHvR2+2tVXdmcJvwvHhTqW7TjFW6h/0XkdTaPmQpnhiJ
	PD725klUwsbbx68dRtsTzYYZkSpd2idX8CdTfXWOo60k+q6NHW8vXR/Fqgtirl+GSZF076x0raf
	k4XP7ElM=
X-Gm-Gg: AYBFou08km04+VwUNuvN8Ux29PvoeddlyGmnG1YrqwoS04Bs88EITjdFACgZKrMTEz6
	ttoyGfUUdR7rTLspxvpJZRcvYFcIak71Kt00rUhK9K0aPDKPcorNMLWfcmrJwRNNOoK6PBfN4YC
	27TKm/Ke37zYL1/+d8cXXyXtEaoX44qCwAx2sqEZkndmvwryKPkzeCCY33D2qysnVJdsze3xvsQ
	asEc5KK4RZPmZeU1WgNy1sXAzxNj8tBl2aWZJtM56lQOMLfAEMXiwGyieurFcQzzwN2l4YdO+7A
	32m5fWnBxuy3melfV6QV36o1lK1TBO436QW/n+6/JiMAMy0qXxGuV/55QBGVkh72MyFSiKQO4n8
	9ZVMqQY4RjMxAA5MuQkvLAhUv69ZxJ+Zp4ODW/6vIAwThAyxlaLUI6u7rnOWi3LnanyMRQJAFLk
	EEDwVsRSOTuaBZTABDGupaPObhpE9kNBrDzOSTlId1Q/OHo17WOpCIa1rNNxIMamTLvVynXXNtq
	TQHc/WqtJcFzi+xudr82c+RWRRrIABTAZp9IN0LR3+pcZEaRG7sUV/7fbVJPOzSyu9v
X-Received: by 2002:a05:701b:2083:20b0:137:f532:e360 with SMTP id a92af1059eb24-14504030c73mr2106323c88.3.1790254633130;
        Thu, 24 Sep 2026 05:57:13 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm12812367c88.15.2026.09.24.05.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 05:57:12 -0700 (PDT)
Message-ID: <73b530eb-ae36-4c20-b9d1-b657410ead97@kernel.dk>
Date: Thu, 24 Sep 2026 06:57:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] io_uring: fix CQE32 and CQE_MIXED ring refill
 handling
To: Hui Peng <benquike@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260919203516.2581409-1-benquike@gmail.com>
 <20260924063525.2500081-1-benquike@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260924063525.2500081-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 12:35 AM, Hui Peng wrote:
> This series fixes two issues in io_cqe_cache_refill() and
> io_fill_nop_cqe() for 32-byte CQEs:
> 
> 1. Restrict skip CQE insertion at off + 1 == ctx->cq_entries to
>    IORING_SETUP_CQE_MIXED rings so pure IORING_SETUP_CQE32 rings do not
>    emit bogus IORING_CQE_F_SKIP entries.
> 2. Require 3 free CQ slots in io_fill_nop_cqe() before emitting a skip
>    CQE for a 32-byte CQE wrapping across the end of an
>    IORING_SETUP_CQE_MIXED ring, preventing an orphan skip CQE when fewer
>    than 3 slots are free.
> 
> Changes in v2:
> - Split into a 2-patch series and drop the third hunk from v1, as
>   requested by Jens Axboe.

Sorry maybe my reply got lost, but I did do this work for you and
split it into a 7.3 and 7.4 set. See my branches here:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.4/io_uring

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-7.3

Please take a look.

-- 
Jens Axboe

