Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64948989F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884516; cv=none; b=Qku5fhYbmA5aRjVSOoSfxvzf6NBqI0MFTA/cHEWUbKixkdRDvqgLz4dOYzuFSmJUyJ1gAiDj3qmr68lkd9EE3uGAGHOuGc2PMgOjFo5pO669C/2KTEbBpeV3WevT3s0AS3W8BO+3+FCdmWox1AwFsT5mT3ubIA/2opoIsTHbREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884516; c=relaxed/simple;
	bh=m6QFNyo/HbUivnhpL3n5Jv3LWRFLievwuPKWr0ZulFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgV/4TfF2foCx8dWfPPA6wK5yfNsDhacde2xcuQSnV5tWL9eG3dh79rPrj5sXvBdiCfDSnjtchmRW3Tecn9lvPclRuDgo5VUwOoD2i0fAMX7whMTqtbYGzHtrVns1g9RuIGCv2OkLp5z5bxOo22IMxtk4iIRf41tbpah1BCu+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebf6zXTb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebf6zXTb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so41473505e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884511; x=1791489311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SocnlOBrWyLM9Sz401rDDmsassHEU6pHgtVkIf4GMg4=;
        b=Ebf6zXTbGNZiMnX3DmcNWp2CNm8QCJpjXAKTZ77Neexhw4QPxPkVNvhqIpwucf5/sq
         uSNuwVdYPxsayu68ENvHwCYSvPakzPHhATdSf/D2TevR3EA0E02H5D2net25MWXumEMg
         K57c6hYl2EYBL9bzElgb8QQmA2HN0KCeFyeHAofqzzuLUIkyUP/TrclRJwwGiIYHqPfX
         shZpHVysF2DXgEbZYqIb3vF+V0UKR8cmm4YxSgrDKbGqXttn94rxaisY1/q4Kp6/hIhI
         k3N89WctGsz1rKON6wGkhlEVKSCLR904/nvtg1o254cRiGZv3G2oQeVLlOUADqpHtGpS
         bDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884511; x=1791489311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SocnlOBrWyLM9Sz401rDDmsassHEU6pHgtVkIf4GMg4=;
        b=cNjJiIgcVARnF0q+OVMN9+0WSDJwctFEZ0A5w1mLVVFPOZnmq+fqsqoJEcJAPg21P5
         jJpnvxg7HsjBnxSU5HBoIQaVlUmw075r7PDo7P6lAOzKIhegC+zZsdMC3vEUMlxLlVrQ
         V5qXDSZE3G5qooo8BZFSWirZcKv44YRe+NGD4D61rpuCE//ubDE0umL5B87sUyDnCYSr
         zWZvXE4B4rcE/E8f/JoJMcoRGsPKd7rxZ8+kTmMZBjUGwzJNX3Zk9aKntL6to3SQDIeG
         jKoTXJJZi/2E7m3N3r+6fzOQPueWV3EeJj661T3K/5/6QQu5Th9RyvFuyxgGiKeub2Mo
         PAtA==
X-Forwarded-Encrypted: i=1; AKwUvBwOtgNE/PtbfVwX0MJs5tBaKLzaAkOAhGkpV9z1iayFnGzh1UJK8ULfFp8JoFLdJ77CZtRTGrNKe/A3JXc=@vger.kernel.org
X-Gm-Message-State: AFuF++mqCt0TWm6DWjJRF3WXncvZqi0qj3q0iH6+t0GECV9ioZE9H590
	SyYdmP3HCqmutT+4y6vOZZTTlYUhd63iIuylCtlm7Azam8xFbz/hJW+l
X-Gm-Gg: AYBFou25FdGUbRWvUXCuerfqsJMlR6pBXQvivpKPAiyZJva7g6ru7z4ZnnfPmVQPmT8
	YB3Rev8+foqPKqXel9nY66/y8BoZnrUEkIx8+s5bGO0T38HfSqRqBZH01EfOcq69TwvTDGyOxer
	xQ1Vvx627WsKeV+YqlTDF8ToD0NP8WxYnUQXhcBUhTMUl0zeBWv9cEK7S/b0VKs2yf4TCn4j8vx
	ABZembrq/PxnuCEzAGMs1TJNN8UB8rTrdO+3eYLiZGCRAFsnMfFIppAl6/ik4avmdXnx6DUMeTJ
	ioTLtKYCDJZiS07/7pBrvJ8sDbobTgecqT8ksO211IuGkQLbH15rqWGMG66C6ToKUBv9BBZ9H0j
	Sg8alHHaq2Zq6+CH3bGjOC2ScX4doZK6ofIHUbwWEie1IaPIECUDGguLp1YGD2hTutMPuNPCs9j
	DD6DAl1mt6Cqby12Ah7zcb0F1tDjajYvaGae6lFvdaCADNHgnvMqc/bv6EJ5JeAkPVEugrA5Z35
	Ti5U6PwWRgaHbD9drk=
X-Received: by 2002:a05:600d:82c8:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-4a027456b72mr15053115e9.0.1790884510878;
        Thu, 01 Oct 2026 12:55:10 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm269595e9.4.2026.10.01.12.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 12:55:10 -0700 (PDT)
Message-ID: <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
Date: Thu, 1 Oct 2026 22:55:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in
 io_vec_fill_kern_bvec
To: Gabriel Krisman Bertazi <gabriel@krisman.be>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
 <87se2pwhzh.fsf@mailhost.krisman.be>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <87se2pwhzh.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/1/26 18:36, Gabriel Krisman Bertazi wrote:
> Ömer Mete Kaya <omermetekaya0@gmail.com> writes:
> 
>> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
>> before the body is entered, with no guard against bi_idx reaching
>> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
>> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
>> walk past the end of the bvec array and overrun res_bvec[].
>>
>> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
>> the dereference, matching the termination condition in
>> iov_kern_bvec_size().
> 
> Do you have a reproducer?  This should be checked in iov_kern_bvec_size.
> We make sure it doesn't go through imu->len which should match bv_len,
> IIUC.

Yes I checked more and looks like the *bug* is unreachable via existing
in-tree callers.>>
>> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")

It doesnt fix something broken actually, more like a defensive refactoring.

>> Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
>> ---
>>  io_uring/rsrc.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index 51b46e624..3d29a0c7b 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
>>  		struct bio_vec bv;
>>
>>  		bvec_iter_advance(src_bvec, &bi, offset);
>> -		for_each_mp_bvec(bv, src_bvec, bi, bi)
>> +		while (bi.bi_size) {
> 
> bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
> need an open coded loop?  If there is an issue, can we just add the
> check below?

mp_bvec_iter_bvec() is called in the for-loop condition not the body:

    for (iter = (start);
        (iter).bi_size &&
            ((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1); <-***
        bvec_iter_advance_single(...))

src_bvec[bi_idx] is dereferenced before the loop body is entered.
A check inside the body executes after the out-of-bounds read has
already occurred. The open-coded loop is the way to check bi_idx
before the dereference. The question is "should the kernel be defensive
itself or trust the callers?". If you find these kinds of defensive
controls unnecessary, happy to withdraw the patch instead of releasing v2.

kind regards,

Ömer
