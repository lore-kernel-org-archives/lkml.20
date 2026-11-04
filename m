Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825634;
	b=F8O56CQ1Ntv+T0TDSlsszUQtMtCuirn9xUNgoY4yt3fj9ZIzkCuqbJT8AT9CrHfGQw6d
	 gfh9wAF1uYd2FgNomka9i2VYlKqUbfuf4OjQDvqEFphiT1qHtfEkC5wNC9c90jQ88ImYT
	 aZOviLxOHh5ulc3i6ksKvlMJJZqeXM2mMe0X5/7fsu4BBG/0cYQ5bGdExsbapJuzn5qjy
	 WphDCp34S7Jmb2wd7bl7I/APsBcBA5GAR7bm9A9TDnYjZKtX6RGhr5Gqy8kCeA6BK5NV+
	 E6H75mYqlb7z0QGMd9ofuE3RMQ77+U1Br6NIfx+ej7IJyDfGgzaemE5lYzyF+1CAjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825634;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y+PC7jHTM1E8Vn7cVLdmAfNEOuE8u386qwA62Ju0uyI=;
	b=3FIuAKEJL1RtntGNuKhIJdEl5Zw1+f0CgDRttBrsbGccEEmC2XM62N8HpahVol7y9k61
	 MVJTAReHL5DCx8hr+6kV86z2u6tem8M6WgSYaPLx1BBNXcxHHAFBNW6pEVnPr4plFxspM
	 JgZLNp80ONoumcn7BIZcISpD85ywNN4bl2ZjEgksnquteJFMG6+kpcijlT57Ayr7gqzc3
	 Dwj4QFmTjzLl0sQXPs86tZjiWYRCVXehXbmKOMv0NMj8zNhy4y3Cr7Ss326juosIpwbv0
	 FIJ94DiaKBK/l9vBUrXQWdRm1/cnCRzpl3ljYaMM8GF8sUaE3Oicwn1HWkNg5kojigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sb+q5FLD;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1481606C59F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1481606C59F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sb+q5FLD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2eu3NaYFL+BtaLJBYIyCWYYqp3hmqybleGi1ZXsiZxA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793825630; v=1; x=1794430430;
 b=Sb+q5FLDG5lfdr3gkjg+cdm9VO9nU24kfKoqEa+tr2kwaitFJyDrj3nvrm8qGMmIyZn1XzK9
 cUIUfO1pB7o44aZI5JDu9QXb9Bfn+tZeb/BTqX7Dk7dM4wDlP6k/iNfqdDep+wBnxZZTweq61CO
 iSKzKsKTzDAxbJaA6bJl/4IQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef2066239f9c474a;
	Wed, 04 Nov 2026 20:53:50 +0000
X-Mizu-Trace-ID: ef2066239f9c474a
X-Migadu-Flow: FLOW_OUT
Message-ID: <efda3685-8a09-48b2-9592-7a74fdd3238f@linux.dev>
Date: Wed, 4 Nov 2026 12:53:46 -0800
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
Subject: Re: [PATCH bpf-next v3 01/12] bpf: Keep the 32-bit range across a
 sign extension that cannot change it
To: Eduard Zingerman <eddyz87@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
 <20261020161907.2115379-2-vineet.gupta@linux.dev>
 <9720ed1ff19dea17a1b379c02d7dd52ae886d807.camel@gmail.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <9720ed1ff19dea17a1b379c02d7dd52ae886d807.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eduard,

Thx for taking the time to review.

On 10/29/26 3:30 PM, Eduard Zingerman wrote:
> On Tue, 2026-10-20 at 09:18 -0700, Vineet Gupta wrote:
>
> ...
>
>> @@ -6192,6 +6193,27 @@ static void coerce_subreg_to_size_sx(struct bpf_reg_state *reg, int size)
>>   	if (reg_umax(reg) < (1ULL << (num_bits - 1)))
>>   		return;
>>   
>> +	if (size == 1) {
>> +		field_smin = S8_MIN;
>> +		field_smax = S8_MAX;
>> +	} else {
>> +		/* size == 2 */
>> +		field_smin = S16_MIN;
>> +		field_smax = S16_MAX;
>> +	}
>> +
>> +	/*
>> +	 * The range already fits the field, so (sN)v == v for every value the
>> +	 * register can hold and the sign extension changes nothing. The test
>> +	 * above misses this once the range straddles zero: it only looks at
>> +	 * reg_umax(), which a negative smin makes huge.
> The `if (reg_umax(reg) < (1ULL << (num_bits - 1))) return` check is no
> longer necessary, the new check below subsumes it.
> Please drop it, otherwise commit lgtm.

Agree. Dropped in v4.

Thx,
-Vineet

>
>> +	 * This has to precede reg_step_reset() below: the extension is a noop,
>> +	 * so the base/step line still holds and there is nothing to discard.
>> +	 */
>> +	if (reg_s32_min(reg) >= field_smin && reg_s32_max(reg) <= field_smax)
>> +		return;
>> +
>>   	/* See comment at reg_step_check_unsigned(). */
>>   	reg_step_reset(reg);
>>   

