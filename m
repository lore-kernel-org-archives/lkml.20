Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125733;
	b=RcRZ6AWpM18HAqtobQDyDQpb/wtmbso55LpYB0nbfXkLlEgvHStBfZpPwaEx7swwXzYY
	 PtD1fV466n46KJNCnba5WXh2haZCkSLr0pJWv8P09msOUTnSUTYPNCoJNBw5DQMAN72ms
	 X57c00FBd+kBZ7yoex57s4UzZBllJP0P8x+Qur+y7TBsVGT6ngfDEybf+f29UoJev8sSs
	 WSq6Z6+9YMTKRuf1CtgtxJ+UavLxekjItKDfd3fpzAf202D8WNs3+iXrJCTG4Xh0LjyuD
	 eRO5ZLg9HDRnezCkOuqnlo5KGW0blxIZISiQqWhlCZcZ/FelNJrP/Oo7yuwrixOxM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
	b=xYHQ/pC2barUD5QgX0ZZu7DRhjkIxlqCFbgdrJ4LyyMWqu/Ig8XgNpQDx2teOUgPbQX5
	 V1aoNdEzyGzLFxXOvQL1RGZuW4PfS8cDl8P6T6iDIgGu+it6/LdnmRvuhX1BR6PrgV8U1
	 NbskDTLkUxQltvfZUzdguqClKAhG5gGVhTAVH3hoo6xAjWlo79AX9ZheNAj2uAVFShls4
	 vowL4n2yl0pF82/8gnTIy4WbN5j2Co4qj5SKzxsKM9fc58F5bR7zCVnuurH33MblHm3FW
	 KGfkBymN4NJZ+NJmo5RI7u/8dInkPb9ISwIAkwK5V5J+hVWhWq7GhHMzo1WcJt46p0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IzuVmn/3";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D53606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D53606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzuVmn/3
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so137424f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793125732; x=1793730532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
        b=IzuVmn/3PK9k7xpmQcANtQTaHfMbFHFVZuCQQjBOZcwHtm9l0fcAnfhVtYYXkWluIT
         w71AMui723QvIQqh5zjvS+Np2nRcHflIOKTGYdUNpV8vgv4xEyY506P7MQj6e72izXZ0
         i+E5hp1Yq6Lwl3WJ+WJ/9yIPFzgAp//w5FFtv3M0Jr4WdLpaIV78oN2QGHTbDB4dbbXu
         qjMgzh+W/tRdSMASwKyRnLFWP7gG7UXgblH8hluuvE8pzPnzU5Oa59G79Yg6Qdso0yig
         hvMsDOzfkUrikadI+u/5jNAghab5Umy3QgQxkFXyurFUkaAPLFfxgmSq9DLmKqkawzUN
         aBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125732; x=1793730532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
        b=LzdITWQJWlyql1HGAcbtC51mM/ye9G1A6QQR3HdeEfzJ4dnJJg91oEkBYWTHbrMs7f
         QW8ixYpooSCpfW/p9uDOE9jlAWTKovJ8k4HXK03WxC5OzsttrfFFFyQNPS44uuus921Z
         /G1HA1D7yeSmjKfDCbdQbxH/m4wvPB1/sV+BWLEwxA2YXi9swZTL+O4bw35u6crYh8Ha
         bW1g688ael9ykpBwtQMMHGLHsDs/7M1rPtqUz/VMXuZsGhtJjWGjU0t7oQ03yqFLGL8o
         S+tSNZuzRRzej6wMDOLaKb5bOGX5Au2m9SZsmaMBkbOfwPqOAhLs8OGJvHP/M1W8g6aT
         HgIg==
X-Forwarded-Encrypted: i=1; AKwUvBwN/7gBYEVAH4G1HNQdpx1Yh+OBKlwlXXj8pO8h9idhHSQLyRMtFNhufHoF/hLKlIQlN8yUh8vl0HjKhnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK12OWCk3DfgF5NfiP/HrEhHXKFMAmheHLjGbNWu4GYIrvSusIk
	AT992/pYytpBnDVUCOJOzcJKkdAw8nYGH6lfx7quQdcHDwWEIP25ZxpS
X-Gm-Gg: AYBFou2xOjRw10DfjbsoC5/QBUrsrCl9EEZQmmf5d3vDzCB38TkdXsGYNciZzY/rcHY
	e2Ie+m34OTvMc8OOpCcJ8HA9TOLeuCU29PleIVXDpflZwLE/Cpddf0O05IKqYNUCbHCinjkq82l
	IJ7jFEouHCPTDN5SM9ZgKqjAPRC1TzXaDaMg+TtPLJ/FENjydhiHZzGCXQ7SAqU2ROIAnSqsLqL
	7CQIUFVhNafd75wBUvt54W+oy6h2PvKF+Q98jE1REJN+quz9Uj22JLd8tQaNbP3XS2NUOVKHaau
	7TzNgMNdbk0E95xj26MibxEaTaDQIK3JDuCM2o78cxDCfm5StZs+2yit3BOEnSk5HzEGlHQnWF1
	kVV2OxIdEhrdSPKMLSwatvCKIJ37Q9T+U1xGoVZsMCNIYcxowGxR+2ycCZHzoORUCkGkqqxq4HE
	US+wrwPP2mKVcIsu65YEp5u1VH+sULroKF/+SlU+jYdthy6/Keg2L9NYtkUmobZPiWl+MCYMgZY
	0Qc2E2JTAsjBmlzMFR84Gje6OA7bhhhp/65TxoxIS3Zf3YvbWMS5s1bWo9GZuZGdilcdQPljKbc
	p7HcID7hyxhh/h1AxVT+/erL1HHirlAaZxpW+ntk48ksXWqzPJG3DLhbABhLV+pPkmw=
X-Received: by 2002:a05:6000:26cc:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e5d313b51mr689662f8f.54.1793125731380;
        Tue, 27 Oct 2026 11:28:51 -0700 (PDT)
Received: from [192.168.42.93] (193-154-207-67.adsl.highway.telekom.at. [193.154.207.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm23765915f8f.42.2026.10.27.11.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:28:50 -0700 (PDT)
Message-ID: <60d0962f-8769-49e8-9674-48ec98278529@gmail.com>
Date: Tue, 27 Oct 2026 19:28:49 +0100
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
Subject: Re: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027070037.1809112-1-andi.platschek@gmail.com>
 <auC3nGX0hA494DZL@SMW015318>
Content-Language: en-US
From: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
In-Reply-To: <auC3nGX0hA494DZL@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/27/26 3:39 PM, Frank Li wrote:
> On Tue, Oct 27, 2026 at 08:00:37AM +0100, Andreas Gabriel-Platschek wrote:
>> [You don't often get email from andi.platschek@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The pl08x slave engine channels are only ever handed out through
>> explicit requests: DT clients go via pl08x_of_xlate() and the
>> platform-data path uses dma_request_channel() with a filter, both of
>> which end up in dma_get_slave_channel(). They are not meant to be
>> published in the general-purpose channel table.
>>
>> Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
>> core treats it as always-private. Without this, if a dmaengine client
>> is already active when the device is registered,
>> dma_async_device_register() takes a reference on every channel,
> Code change is okay. Are you sure the above description correct? where
> code set it active when dma_async_device_register().
>
> Frank

I do think so, because

async_damengine_get() -> dmaengine_get() is called from 
crypto/async_tx/async_tx.c and increments the dmaengine_ref_count.
This way the dmaengine_ref_count is already >=1 before the pl08x 
dmaengine probes.

dma_async_device_register() (in dmaengine.c) iterates over the channels 
inside of the following conditional:

  if (dmaengine_ref_count && !dma_has_cap(DMA_PRIVATE, device->cap_mask))

and in there a dma_chan_get() is called for each channel and increments 
the client_count. With a client_count  >=1 we fail once 
pl08x_of_xlate()->dma_get_slave_channel() is called.

setting DMA_PRIVATE prevents the client_count from being incremented by 
the core, keeping the client_count at 0 until a real client requests one

hope that makes sense?
best!
Andi
>
>> and
>> the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
>> because the channel is no longer free (client_count != 0), leaving DT
>> slave clients unable to acquire channels.
>>
>> The memcpy engine stays public as it is intended to be shared through
>> the per-CPU channel table.
>>
>> Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
>> ---
>>   drivers/dma/amba-pl08x.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
>> index 543c2eb8cfa8..06881d3f29a9 100644
>> --- a/drivers/dma/amba-pl08x.c
>> +++ b/drivers/dma/amba-pl08x.c
>> @@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>>                  pl08x->has_slave = true;
>>                  dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
>>                  dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
>> +               dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
>>                  pl08x->slave.dev = &adev->dev;
>>                  pl08x->slave.device_free_chan_resources =
>>                          pl08x_free_chan_resources;
>> --
>> 2.47.3
>>
