Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507173;
	b=AHSC7J4gzYb29wp8KMBb7ouwweYY4JWJyedXOYJVLFfjvbn6GXuzpBYoM96oerQEnkTo
	 WGqn8Q3zQKM0zE/Qv/H1hiqaPCSHTXBdB53qlmfqTukfIVxtEy94kEGmK6eYxEbS00qiQ
	 zys0U6ilsmZL/SpzugSoK/dUXdOEXCJptRBy7im9pKykftv4RqnhPwnIkzm675eTT1NZs
	 ofJr5Cn49GwOJ6Sw6xTq3IpCtrDAD84yCTaBZoxFDq1AwWjsAI8JMU/MQ4Nvu9TR3U+A5
	 X1BLk7hSX0jFdx1pRngyx5v3DSRjSmTMF4sPH5n/kYMCaiyOZ8LLtChThHcx7k/EpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TAz5HUAuhl+iZRwwDUFp7THQQfvQJd0tH/rHV2w2wmo=;
	b=sDl0Wr8Ule8WdEyxy0Z/nz0FjGdqhR0ISvmaYD0qqDTlnlcSZ1RQyKqfBG+RvT4fWgT8
	 ebCNY1ZwB4G7ApDs/RuOrN2S0q1RKAngdVHWg7TqYnUMPuyW9napIadGpxCIpshY8B6GV
	 N/TFcpDbd22LQumoBtYbbeuMN7pbO/rSVUAm+EkkuaBcxvaDuqQEs2Y5GOF/HuzFqpGby
	 ihZLQkeawPfVi8d22jbiuNcVYze3jzz0qN+2Vg4HH9IoSc5/3UQaT/hFK2sVlwGi0Ve7W
	 4+lUoNdrb8Ql3IhQ8REca/34lF1UV6QGKT9lR2CyoHv6JRwUM/WFb9FJ7aB6kamN06A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XAka60kG;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E7F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XAka60kG
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1226076eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792507172; x=1793111972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAz5HUAuhl+iZRwwDUFp7THQQfvQJd0tH/rHV2w2wmo=;
        b=XAka60kGQCDYzLBujwoDyaziGz/wxKWOk9JDjUEnThjZQh0kSEDckkjNWPh9Sqfpag
         LjzanvOrEw+E5z8IW3l5Uij/VNEMTl8Oxtavoq8ZxtdZ6K65LpHEmQ+RQwTytiMyYBsd
         7nGU54F7hUmRkBU0Re08WpfTDdq0TkBpVxtqpRj7PcDaavTG9VJ6ty5APHoux1eEakQQ
         i4iF3EOD205Zs09120H/IUAIdn3b412qgqSIo1wM7RYLLWWQoSJrV2QVY7MZNYQgPxuP
         Yvp6LB/O5EykjqN/bjAB6qysZ/rr79RYznvopS8Gkg4NF/tkSqgoOHWjFhFme6g4b8RF
         dknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507172; x=1793111972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAz5HUAuhl+iZRwwDUFp7THQQfvQJd0tH/rHV2w2wmo=;
        b=xCDndeHDqiy3FKcL+WFXsGclEacPcFar9mi7zFlhJgBKyElKqV4GUZRPICn9uxK/hh
         9hCY2xzv45wukviuwv9/8Zy8prf8Bte0YF9e/YGBQ3um5QyoEroFepXXmt/E89jXcmag
         pbrL32nq3fDajcZdlBy2KGnYjBMPKKhe2C7mwlfz66+o1OjMPYr6V53FLRkK54Gmz81m
         Ad/5IdvFYiIYYu5upESZ9E2hj/znnBAQEe+zCmuM+0OsJqBRusfi+L9EwQCvVkyPySBo
         kNmFf/r2J7AY/035olY/ScuPgbX5Lmm0l9bkrTjOxnNB34L2rRdqpKGZdxIiIegbWEQ+
         Cm2g==
X-Forwarded-Encrypted: i=1; AKwUvByb9Snxd8ls1OYgZUIVqV/rg9BydBv+OPM+OxsjnsA04Q8fIzbRDg1YRq9DxSSom4bllnzOC0i6Vme66Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIudXiNqpBcYSqR9W5+N6VI/W1UG6dEJYd6/Nj2uC4w1eYwb8Gi
	WmcJPdHgeOzLZA59zuaCaZhnusD91a9u+ZFX6KXpQOxo/KOnRYmFQH5e7TIzCFgxGW97T0dLmqf
	7z0kzE6I=
X-Gm-Gg: AYBFou0b1aWn0wdesaFaNGDKQ2PiqP0j9qGOBGN8VfTs58XJNJDsaVvbWcen9JqIle9
	WE9Z7axSZI8dKCwbbwmRv7NW806GMN5j6lC5VyhUNnk1dugi50UsoqFM8e6qFauHrDHFxekSWaH
	rZ4vYKjJWZZUY/V7Ls2Nf/WTRxU4zG6xDsLMTua1MxHRFI0aX9knqgSIgKGn0A04Czja6X6rMws
	cPWbs0ffAL0UtW8CLOOYg1xzkG4OXwLrks7INn7BPpDGb+CYdIt8cZcldfSk16Xnis4t0kqUAvx
	fXO7JJeaplPIivH91WOsnDA9/C830mJHefNIc0BvK27U6Q0iQZISnk8TYyU1ZICEuqqicXSdz2Q
	XHANiQxgMiq7Ug6Zq7Lu/yJkhKAL5CEFiV5+Fc6E9VGquuqvD9A1/kt5HLgYBbGTExjB61U1p2g
	cS+yalVpKz42/fpBoWx8ZPwGOQhCnC6QMn3EqA4wNInF8FurFSd9dJ2VkQUc82iWhJGekO4Ictg
	AJ2i5dLDMTepIniSR2HOSQy72HHqrlNeciREk5MUsgsGlFx0xk41w040VMRAccORk0+KwSgEOQ0
	ABVVf/j0sLY=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id 5a478bee46e88-361a18634bcmr18267849eec.17.1792507171481;
        Tue, 20 Oct 2026 07:39:31 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm40225365eec.11.2026.10.20.07.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:39:30 -0700 (PDT)
Message-ID: <29692751-e80e-4f29-a07a-ea0221f1116e@kernel.dk>
Date: Tue, 20 Oct 2026 08:39:29 -0600
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
Subject: Re: [PATCH] blk-mq: clear stale inactive flag on hctx reuse
To: Bart Van Assche <bvanassche@acm.org>, Nirmoy Das <nirmoyd@nvidia.com>
Cc: ming.lei@redhat.com, hare@suse.de, dwagner@suse.de,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261020125129.430600-1-nirmoyd@nvidia.com>
 <ff516ed8-d4b0-463d-952b-14cf110ec8da@acm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ff516ed8-d4b0-463d-952b-14cf110ec8da@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 8:13 AM, Bart Van Assche wrote:
> On 10/20/26 5:51 AM, Nirmoy Das wrote:
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index 025a799f35b924d..00b75eb95dd943a 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -4002,6 +4002,7 @@ static int blk_mq_init_hctx(struct request_queue *q,
>>           goto fail;
>>         hctx->queue_num = hctx_idx;
>> +    clear_bit(BLK_MQ_S_INACTIVE, &hctx->state);
>>         hctx->tags = set->tags[hctx_idx];
> 
> Why clear_bit() instead of __clear_bit()?

Since this isn't a hot path at all, going into details like
that does more harm than good. clear_bit() is totally fine
and honestly preferred.

-- 
Jens Axboe

