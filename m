Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600362;
	b=qBTSeYrsPNGzPq4/rCiJiFnZj7r4HAOORBbUua4oA/uwOr9zRkn/iGawya3NTcV3S9/x
	 Ton8b1asVhc8qX3GsWeHSvLcPiLKRMBQlF+yAL+MEAAa7KIKOHMXlM8N+Er8ChbRn4pwq
	 MPqbK6xSeveK3Ef5PX0wisGdNjCaRmoFmzPZ6H92xpHhaotSX3VEJ/Gq3bmrBvWU/L3bP
	 I0bBLN9e9GlpOciVvzZYDgYa/Fnw1kdQVDfQKWVXqoq0o7Mtr6HIFhsjRZFd4aeBPhY/A
	 eOS2qbG+Bzp7iQm1wXpRi01KSJhE8DfRKssL0tS/lhSBl0xyt1m/z799SSJ5gXEBKUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dC+5Lunx5dUQ5dWu37CHLZRWRMYn1XOzLPwBfQqIc2s=;
	b=eyTt6MqyZ9tE2k0mFh234XzmMragjGLkot0PlZkENJ/NfNdMhT4Sk/thUmnDGiXc2WkN
	 ufa3tnH/+5r7rbhNJUxORLGhzEaDBQkykbBw42RThpQZLUYrU+UpCCuE/zd2HRbn0rExz
	 8dZawQpC1ukSiJKsOJoNS+FI5/F6ez91wEUJ1ZZXq6nHLlb3M+yGbU/WXX4OXYsvqnEHn
	 FuH0S8wx/4QJxrR1/mbJSDXmFfshnrbUZxWkVFHmivPktZohjkseAlGQqyJHZmknqwnke
	 ggFQOYHuh+3XyHJZ/rqryMaCEpOQxwwe9i05wlUQcI+jhvq0CG8VzdWrTsiQC4Bkotw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ok0zsLYF;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A345606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A345606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ok0zsLYF
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so513643a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792600360; x=1793205160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dC+5Lunx5dUQ5dWu37CHLZRWRMYn1XOzLPwBfQqIc2s=;
        b=ok0zsLYF6Jt/8Qjs3Kouo2Hzmuakm+SQxEo0XQvD95+U0UY1ZRvyAH9axs1/PubNR+
         ySRUGtxOsFYH7B6eJCgGD35Q43GfFsIAm0ds7WDg5uKXytYT+K2bu/MiXsK96XEahIrr
         LmV5/vV18/k2UtrB48TVICp3aKT/FrH3PED1mJRwpfur3y4hfNR/I+rq4BGtX8PYXBYe
         xuvq3hZy4pyuzD7ozUn7eG6lO50PP1Rd+k0qvZMyaSA0Kew7qmSo4GZC2IkXbxrMQEmo
         kshvDGnk6gF7pa6O5v63sFlndH/DRnUPOP605Q/EmggJO2qII0sYznH5JUZoXWPa6TTR
         /hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600360; x=1793205160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dC+5Lunx5dUQ5dWu37CHLZRWRMYn1XOzLPwBfQqIc2s=;
        b=iLV+AhiBhDmuckGhoiVzN3H0v/eNBDFceZaVfCnIMqZMtT+oGuxJa4cv3bfUq7pVYy
         G/KKIFAMEAGJnCNcP7e39dkm3deUMplVLqDtO+b1c8xpC3lNvF5b7qEMg0oKM4LkK1c2
         gG8vqEyM5HH9EWeKxaOzzje8lYRRyVyQSlmrqKTk0gFr0+1FTkDx6f+8q0FP5FjRrjEH
         WXQer3OABV2Orf3GMS5TM91mcq/m4ssEEGFs/jOnHxcviYQglgOYv63wCQ7cOMDvjFPg
         GGinyRisA4g8Wr3uR3RS/bYsVJxw0UqzktVXyDo0mfIbcApJObclzEgAZQ30zkfzUy1h
         MtwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHf6aA32mskMLMDo8MyCqnV/L2lad6L2tt3JoxFfuSPAR3+wze+zezHVwACCTKa37WTfVWQ11enit6L00=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDCqZX2+HoGP95bMaZ4ZgOiwsT8+TJiC5eizeAjRpHMuoc8evY
	QfUOnYNpkZwi/Nm3Y26vv64tO+yvIbjzuIKnmJASZ3eVqe+0HWDMKYFHNkooyNTQSu0u2KyimgW
	ix5qem9s=
X-Gm-Gg: AYBFou1SrPI7qVLlGbO5I8CBZuF3sG39uR/nVp4cxcwyQoHkBG3JZStSkh9YK5B4E0n
	sBdaTJBcv6GiY4a0R8CktQ9wQAaPS+ABBnbhBBUXvQBHk3NbP8YHTkmvuJdvN9hCdioBfzuqXJT
	RnkR5e/fjsNqH/DlkjKAUhWrMtEdWnR4WA8rYsRA3j1akhqgYWsrTzm4tM3YAVhjibmIKoFB1Mi
	xIBXHbAOI5TAmmRL7Vb4ry6wWfcq7C0aWtFPGYmzDH9MkWd8LZVrf0GIM/xeaJ2ScAx4mimQTfE
	T0Df3jcrH1WCnb6YhucSHYyWlEVWxK+TtiNJLVXIZmadueBuZ7lEE8YBy3Fl2SVdHfopcu6oU8k
	aPeTehkrwyS/lPwlwsEKwsqbEL5kE0ukSQRp+wZ3fhGM5NKBOXRmTXCJbUmcVs2YOYlRAen/PRF
	dJJIDqZlRbUoAjgu5pf5phFaXxsdpebjT9J8WYlF6NvgW3shfgcFK0n4lfjlqa2PcxcSrrupJ4z
	5ViSRcv3y/odesVkeS8lZuv6ikM+VDuBjBe16M5GzfEKflZ06/y/hzoxj84lOvH12bKWF9+7Hdc
	vY9fhvZttiouE9eypUdYNtgPONEr40ZZcIZ1v5MRk9exs8bAKHZRVCWcE58v
X-Received: by 2002:a05:6a20:9154:b0:3e0:b445:5612 with SMTP id adf61e73a8af0-3e287dd624emr2111224637.14.1792600359159;
        Wed, 21 Oct 2026 09:32:39 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b8482048sm247328a12.7.2026.10.21.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:32:36 -0700 (PDT)
Message-ID: <db225771-106e-4014-bc43-3cd8f0e459cb@kernel.dk>
Date: Wed, 21 Oct 2026 10:32:35 -0600
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
 <29692751-e80e-4f29-a07a-ea0221f1116e@kernel.dk>
 <a39c904d-4d84-49ef-84b2-16db1b28b706@acm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <a39c904d-4d84-49ef-84b2-16db1b28b706@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 9:18 AM, Bart Van Assche wrote:
> On 10/20/26 7:39 AM, Jens Axboe wrote:
>> On 10/20/26 8:13 AM, Bart Van Assche wrote:
>>> On 10/20/26 5:51 AM, Nirmoy Das wrote:
>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>> index 025a799f35b924d..00b75eb95dd943a 100644
>>>> --- a/block/blk-mq.c
>>>> +++ b/block/blk-mq.c
>>>> @@ -4002,6 +4002,7 @@ static int blk_mq_init_hctx(struct request_queue *q,
>>>>            goto fail;
>>>>          hctx->queue_num = hctx_idx;
>>>> +    clear_bit(BLK_MQ_S_INACTIVE, &hctx->state);
>>>>          hctx->tags = set->tags[hctx_idx];
>>>
>>> Why clear_bit() instead of __clear_bit()?
>>
>> Since this isn't a hot path at all, going into details like
>> that does more harm than good. clear_bit() is totally fine
>> and honestly preferred.
> 
> Although I'm fine with the patch as-is, I want to clarify that
> the concern behind my reply is code readability rather than a
> micro-optimization. No other context should be accessing a hctx while
> blk_mq_init_hctx() is in progress. Using clear_bit() instead of
> __clear_bit() might make readers of this code wonder whether any other
> context might be accessing the hctx concurrently with the
> blk_mq_init_hctx() call.

I know that was your intent, but it just reads the opposite to
me. Whenever someone uses the __ variants it should only be
for optimization purposes, and preferably with a comment
explaining why it's safe. Unless there's a reason to do so,
using the normal variants is just preferable to me.

-- 
Jens Axboe
