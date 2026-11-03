Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735262;
	b=s473zgCWgh4AUkxxGXmT2VZ4jjFXLFOlZF2r6KA+OS8uL4TbcnyTHkb62NVX75a0NEC8
	 k/KLyJcYy65Bh7uw6tyRlYaAR4RtuZ8MespgNfuCHE+vp7aC7f9IxuOJHDyTUO+HbVPfw
	 gH18DYXnrLj81HE8ZRWI+qDuZNUF89TjZ1kb4fMdtQioaesYir5oBd498zd3qa2AjknH4
	 ljSMCCkT7X2uNV/EEzm9qM6dSqZ3sdAn+YSQhVJEGs0EFMDReLRY/UNyOrCEMJnu70D8U
	 WeAGAnChvDXWw3k3PQmD6rAhYEUjca9R5oGbGzaEl38b8TyEbwbvI9+Hwxa5TW1B8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ydjni9zb1eg48+F6fhT6E/9ItDiahQVxW0eKVWZs69g=;
	b=5Iv3EZx5oYJIH8KTWXYeuXhYr+XwcgIf8LIY7429l6W/owOoWuk4aSpVk/pvgg+L+o9G
	 QBHotVFguFA7grMCKF2YkgtL2lnzibUqXyh9OnGthkDPmgGl6cJJ/frql3fgnlJfNr2iT
	 QLjqg8FfO3aVxNuSKTKyo/6QwbLn9PHv20h1UuOpT8edVptBwS9SbbDwlJ3zQjXoqckPJ
	 JZb2HmexRPq11owAmoQM9bkOjX4k2fzK6I4ThphzzYsvh5pLlwgYQUOs6cvf9dhERBtsh
	 TAFlcaEOKtQziM574Mu4e+fjj3HLCk+UfUeSu0LcoHtQ7B7fjP0ylR/pesxvi0+nG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TVXONl+t;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF92606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TVXONl+t
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso2940081eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793735260; x=1794340060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydjni9zb1eg48+F6fhT6E/9ItDiahQVxW0eKVWZs69g=;
        b=TVXONl+tDquMYbP2dkE2DjCrFaswdKzQyJqHsuepjjkdVwBKW9l73XnoPcLZ6WPGDr
         ZR17GliT/xHXj0zzhmNmwgGHLdfh0uP1VLNA9Po156IbuTZPWsUkyvjbot9UbncXZ09W
         Cb/Nr6W5RmprMAYXhE6kpGjSF5hE3x+wTQ4rQb0bELDt7Y/U1LJ5GyhoNaoWUuRZACfF
         04c3dNnWE5QSzVC+RKt0Yho+5ZZg30ZOuJj4roqOUKVgLAyFwHuFNx71xieygefI20ia
         1uAJlXzedu6ojs83HrJlMpCYhn+VzsGCRKrvu00BfP/vD5Rt0+jwul8qj7Q3dJu8Rd2D
         KQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735260; x=1794340060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydjni9zb1eg48+F6fhT6E/9ItDiahQVxW0eKVWZs69g=;
        b=s3AvCWfeFxSLAN6FBPR6/BJq1LIlqMmm21ZNDmjP58N+6ZHQE472rgJc7IOJkr5kJD
         0YfdehLR7HDcA7YiW4t/Nx5+AQIf0tl+DF30Bg3TN5baPntiljlSWbF+abRtTip5fPjD
         J28JDrW2aozDCFml6y8Tb9yZN1WEM3YoJGUlL4iPirIvxNWgjXPnwTHo+jO8fuWLT4AU
         6sXGnUugwgHKrO6nTcDhOzyXJns9c3BV/GFLRku+E7GzyCa9+LB+daarkVMLk8V8Yoj+
         wl7iuSkQVGULyBrU4hYuM31aAuGJKakn3jCz+kbm9BjOjm2hYbVzxCUkdX6krSOLDzHh
         zsLg==
X-Forwarded-Encrypted: i=1; AKwUvBzxFUsPpkyrJFReEXW3TcggE0SkLqVkE03Jxdu5P3+F6BmoFDfleUKW+uIEu41RousLtdxmWg0tGaFzPpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z94ZV24hPK5X1sOJsami0lhraHF325rm9eXo35ZmXOHgF9jHxIe
	jVz98vuztIB3Y5UnQLyKt5cZ88Mxvm7XlbaTc/F3WxCyTiYsvGB/pLX8WRvcygr4IQw=
X-Gm-Gg: AYBFou3sgI6J60ELK4hJr6jDZRiWAttcBIm2LXP8ge6qubxbI12Xo1U1VOQIqMuF+PC
	byPF0kqH8NQtsW70SE4z3ntXjvjys/GuDBB+iZHPijHOYnnLq3wS9iyGis7/2sqMyJchXpJxhMK
	hqzGcFcygAUGzq4uHzo8LlVUpH106LaYWX1rQ0w8zbJ/2scQ89SuAcDUvqk2NPDZlQIE0dj2mhG
	OspCu4HNJ4M7TRtK46342zrscW3BFLCo6pIYpAY+Nb9IbkGaPjACOcB2bICE3jfgjE4K/2UwwZ/
	8fBRfcFhaOo7Lj/XkPdOqXD4+w5r/kdbliQuFzFPzxxdbdBsbKmC+YVpTN53nA5JvSiX/qJJLv9
	w3pkhzQ1+v7T8tx4cuYmHGTLoSYSziVb2LEJBY5LU3SheyryljI1FLXkA8UcMrYaHRLiilENNHm
	yFDo5Ju2RiKEY3NOd/Kk7QNrIHrXZmvUGhiUqewVRU09JSlO7sg8npTtCK+tuzd7Bidxqy4NEtx
	E35vM1L9g7CQu9CzUoaAGjuepvNeGUMOmQVinzgxpsbcwzoQExCjLxH53nhvIFXrzd3ht5TCqxX
	/XZCXi+OBAFoGZDWnTvbvUz8O0hcy/lTWDymmHYlhWC6W0lg0Xag9+gII3M9SIwY5c09vDJD31m
	Hnp0G51iFwq5xX9sCHIICCpJuD2Gr6Q==
X-Received: by 2002:a05:6820:709c:20b0:6f8:92ab:bb53 with SMTP id 006d021491bc7-714f2489a3cmr5196705eaf.41.1793735259648;
        Tue, 03 Nov 2026 11:47:39 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c129a718sm30815eaf.6.2026.11.03.11.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:47:33 -0800 (PST)
Message-ID: <d48ad87c-9cec-4da1-a896-031b7480c117@kernel.dk>
Date: Tue, 3 Nov 2026 12:47:26 -0700
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
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
To: Keith Busch <kbusch@kernel.org>,
 Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chao Shi <coshi036@gmail.com>, kernel-dev@igalia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <auo5a1kRTSWsAYtF@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 12:43 PM, Keith Busch wrote:
> On Tue, Nov 03, 2026 at 04:18:25PM -0300, Mauricio Faria de Oliveira wrote:
>> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
>> index 2d8f681079e85601a92624d196e77f1ba3ace34a..3ba0666da7be6a3de2e5f0fd50155af115b4e1f6 100644
>> --- a/drivers/nvme/host/nvme.h
>> +++ b/drivers/nvme/host/nvme.h
>> @@ -708,6 +708,11 @@ static inline struct request *nvme_find_rq(struct blk_mq_tags *tags,
>>  			tag, genctr, nvme_genctr_mask(nvme_req(rq)->genctr));
>>  		return NULL;
>>  	}
>> +	if (unlikely(blk_mq_rq_state(rq) != MQ_RQ_IN_FLIGHT)) {
>> +		dev_err(nvme_req(rq)->ctrl->device,
>> +			"completion for request %#x not in flight\n", tag);
>> +		return NULL;
>> +	}
>>  	return rq;
>>  }
> 
> Is there something special about the NVMe protocol that makes this
> problem unique to it? If not, why doesn't this check go into the generic
> block layer instead?

Pretty sure I've nak'ed this kind of thing before. So no, it
should not go into the block layer and bloat it there. If a driver
does double completions it's... a driver bug.

Bigger question is "why does this patch exist in the first place"?

-- 
Jens Axboe

