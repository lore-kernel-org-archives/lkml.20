Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707936;
	b=uwCx303GmsPwgNpCCIj7+j8PbW0tXtRdMSjEM2Ako1S9QrmseGOur/9mS1/S1tNILv3Y
	 ioFUXXiBB4tksIqGBqw2tiIgDIjF2Hyua6B2TF3SgjtLnJ2w/ezSfEsWnMtC7Wh63iyiO
	 1rrwLGPAbP6Z6OhY5PgvqzP9cYJ922zt2kAJKV6fRAcnxBsa2anIrUDrmw9JFhliZOEnx
	 JjrI+5YBfJ3MkwHoo544InhKk7JLvqo/peYxS9DQPnHbOMvatiTrUGV7BZIz1k78hm+gg
	 pyOrQIZTUbtCoWtZLIHVbM05WmOx/86YvqX0bInedY3IDNum5SFvkmrgePphQt06q8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/OA40tUqMOdAoYzZGtz7qynGnlFfj2rERGVim4MgYtI=;
	b=Y9Opq9U0x6dF1jtxsZw7fWWp1WzymMMfxn1bs2/XvYCHzd+EAtQekcckxByxskH8A0uE
	 u2iJOmtm2SU3D9DwiMPGsD7O55NiTIFkPmaPMJcPWoiA/5uhxe2Joghrn/AGRvseqEYgi
	 hfaXJkAJWTm8xnssFMG1bFRAGtnh4rbpIjNbAl7FVt7xvKwqiOR/B9GGSsbrKsmCZCwUd
	 GHNi9XCd9dGMKaE9lcazrrh1Y15F7hi5vX99xu1ZGnqnz/qfcUoboAcB54wvLeaj3oMM5
	 GB8a7fCc+y5MDya4jN0LRwK04OOayBubD9dPnMW5zxZcTmlxMq8wsWVK+fHvjLhpCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqCNFppw;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E162606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E162606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqCNFppw
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1089037a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707936; x=1794312736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OA40tUqMOdAoYzZGtz7qynGnlFfj2rERGVim4MgYtI=;
        b=BqCNFppwAvgVulzuwP0LIlMReuwYec6PKbMRYxoU2oNLxU450OZdbO4kttW9oZAKm+
         Klw+F2eDtiUeZ5fTO0mjjcakUxL0nZTrX6ETz1c7wHg4USDfVMbfLDlXPSmJmiWYWny7
         rbXRLtsMZNHMpBhyqc0r+ORgbevjyKFSX6i8/sPYCVYb9BRd/iEupCJrbMj53LuVEy8H
         1YxQE06J4ymnXly3ghJWtMlZZTmYMDF175c3Fa1Ty68qVpMc385rjNglWJ5Y+x+MKgFO
         aahC+SAhuMFJRtz5FeK+CNZ2qcfeqPmBjjyKhB6Ss2er589ZxH8LhubfdihkrjHYI7v4
         dLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707936; x=1794312736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OA40tUqMOdAoYzZGtz7qynGnlFfj2rERGVim4MgYtI=;
        b=xGQQJJI5s/ZqaCpV0520rU6T+iCDraO6gjH/y6tut181qb9FpIu+tbZU0rhzl87bb3
         GKqnZdPmKEPL9/ZtRILQirqJrgxVictTjE53TWZcU7UKPzga+MaxmteubunYNQmamfmO
         BVZAavJFrPCGk6Rux+PuaBe9TO+4tnoVD7qluhKUb0jvhO74Tzn5qXGzL1Mzk6IBYfDi
         bMlyFob2O6YIEfbXeJki5nW9ohWslR11E5uDn9/GLqg1Kj3WqLB4EIF/HFEmiguhCDOk
         AhSw1SOfHDBueIEZqeJ2MqgP4HXmToiNfAus1sLIxbRGuuq8/A/8jw7sAPmGvRQ6d+jV
         /6ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2ttdyy1/Qs87Ufpzi6FVaMJ/ncbOTmU4qZW2du4blB4pU1wHDKcAjmxK8jdlPxrHt+BeKC1rfGAlNR4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nvAql9NWKsomFJwuAcg5lmV7RiqFtfBMJwFe9+BB9mwTyOzzO
	IxBBpytygSRPdw12rTuUMtms4uhfziERID6FKnUSskq/RN564x9mZXw=
X-Gm-Gg: AYBFou1JVEdUd2k70ebm3/HsDAi+pGUbOjt1AXR5bKGqLu0qvbdSMDavTontlaLJeXn
	gemJBPjtctPc30Vx9XNmCjzVM06oRIN7Rvdo7V6AfZAtACTMrfUUOoNNZev3uQ9dsgo+zR0eZB7
	PqxD9tFK0EUVXGoU1Z19ZygMYZOJTfYWmGN+uvcFfkm7Fkcveq+R1GnsjZ162F7EW0TkEJ78WvR
	taAJO0fcwc1FukFUjJCzoQ3BazaKUW5JwAe36pybqzKHdTF/VbeQWBSwJzkDJ+r+ZkCMQ6EL1uy
	JqCwaLa5D2fhDC0zhvE96+sayVlY7IGoTnym8Wpm6ZyA9EGkc847hUWPTW/ZszlU2+IiPG+Hjuk
	XW8Rb1Y3B5ql79Z+Hg7dyYVnFBLmbg6t1iuBXQ8JPl/lpeHheElhwl2Q+u/g/auWFJjPSp4T22J
	t3kkzcVac9p7KdIH5Vwms7BL5MKeJkRtN4g8GDFkGhUWSezUvGgt2+daFH9GhQc3/Iljd7vTAWo
	pFdidh2vJeMkj7q+yFduVupS1mXbBA1piBMcSReZWEEGWc0HzXXCmVN4kPAuFcENzxa6mKuPJUG
	EtNFR62cEVYX05TTcGxs0/6covmlHU7Mn7pHzwOu7MlSTaBC16F7QVT3Ux+YbWthcxlExfxjFQ=
	=
X-Received: by 2002:a05:6a21:7701:b0:3e2:6837:3766 with SMTP id adf61e73a8af0-3e928a54acbmr9309268637.61.1793707935673;
        Tue, 03 Nov 2026 04:12:15 -0800 (PST)
Received: from [192.168.1.45] ([45.127.46.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d4092sm3083481b3a.41.2026.11.03.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:12:15 -0800 (PST)
Message-ID: <110601ff-f60d-407f-bfba-05a13c14d490@gmail.com>
Date: Tue, 3 Nov 2026 17:42:11 +0530
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
Subject: Re: [PATCH v4] iio: chemical: ccs811: Make sampling frequency
 configurable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
References: <20261101054019.10188-1-nikhilgtr@gmail.com>
 <aunD9kPZ03d8s8AI@ashevche-desk.local>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <aunD9kPZ03d8s8AI@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03-11-2026 04:52 pm, Andy Shevchenko wrote:
> On Sun, Nov 01, 2026 at 11:10:19AM +0530, Nikhil Gautam wrote:

Hi Andy,
Thanks for the quick review.

>> +static const int ccs811_samp_freq[][2] = {
>> +	{ 1, 0 },
>> +	{ 0, 100000 },
>> +	{ 0, 16667 },
>> +};
> Now it would be better to have a common enum to index above and below.
> So it will be kept in sync
>
> enum {
> 	CCS811_MODE_IAQ_1SEC_IDX,
> 	CCS811_MODE_IAQ_10SEC_IDX,
> 	CCS811_MODE_IAQ_60SEC_IDX,
> };
>
> static const int ccs811_samp_freq[][2] = {
> 	[CCS811_MODE_IAQ_1SEC_IDX] = { 1, 0 },
> 	...
> };
>
>> +/* Drive mode for each entry of ccs811_samp_freq[], same order */
>> +static const u8 ccs811_drive_mode[] = {
>> +	CCS811_MODE_IAQ_1SEC,
>> +	CCS811_MODE_IAQ_10SEC,
>> +	CCS811_MODE_IAQ_60SEC,
>> +};
> ...and here in similar way.
>
> ...
Agreed, a shared index enum is cleaner than relying on "same order".
Will add it and use designated initializers in both tables.

>> +static int ccs811_update_sampling_freq(struct ccs811_data *data,
>> +				       int val, int val2)
>> +{
>> +	u8 drive_mode;
>> +	u8 mode;
>> +	int i, ret;
> Why is 'i' signed? Also keep reversed xmas tree order.
No good reason, Will make it unsigned int and fix the declaration order.

>
> With
>
> 	struct i2c_client *client = data->client;
>
>> +	ret = i2c_smbus_read_byte_data(data->client, CCS811_MEAS_MODE);
> 	ret = i2c_smbus_read_byte_data(client, CCS811_MEAS_MODE);
>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	mode = (ret & ~CCS811_MODE_MASK) | drive_mode;
>> +	ret = i2c_smbus_write_byte_data(data->client, CCS811_MEAS_MODE,
>> +					mode);
> 	ret = i2c_smbus_write_byte_data(client, CCS811_MEAS_MODE, mode);
Ack, will add the local client pointer and use it in both calls.

>> +static int ccs811_get_sampling_freq(struct ccs811_data *data,
>> +				    int *val, int *val2)
>> +{
>> +	int i;
>> +
>> +	guard(mutex)(&data->lock);
>> +	for (i = 0; i < ARRAY_SIZE(ccs811_drive_mode); i++) {
> 	for (unsigned int i = 0; i < ARRAY_SIZE(ccs811_drive_mode); i++) {
Ack, will use a loop-scoped unsigned int.

>> +static int ccs811_write_raw(struct iio_dev *indio_dev,
>> +			    struct iio_chan_spec const *chan,
>> +			    int val, int val2, long mask)
>> +{
>> +	struct ccs811_data *data = iio_priv(indio_dev);
>> +	int ret;
> Why? I don't see any followup, without which this variable is redundant.
Leftover from the earlier claim/release version.
Will drop it and return ccs811_set_sampling_freq() directly.

Will update comments on next version.


Regards,
Nikhil
