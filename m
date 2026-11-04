Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804137;
	b=p+JumOx/gW4S97UAhMBZ3n60gb07Ls1oVBHeP5C0zsuXN3pt7LpxwHCvfqyT9oed5n6C
	 WdkzDcvWZE8EMSAkmjJ1mroZu04exW/XmKij7nB3t57v6GIQACYGREejvpwHp1xbZQd9r
	 ZDBttruKekBsnH5OtC/PyPZ6asBSKwsC/ipIA4CUDS1DkZEc1Qc7T8C3qSHuCvmV+HXlX
	 A0T4BTvZq1h+zG9VcoGcTnNUmZXURZWoXyC0Vt5Rc/U6xLCEvnVO3Q/spdReqU7y91Dk3
	 iC1igZVXp3u6YFtQtrs4RH2rq8EpXQR6L8hKCJO5xEWkcT+zKSqWXf9GJ2Wu94yB+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ptwzGsLXJirdc6QOOXq5I0id26b6wUOyvC9JKtjtifc=;
	b=ZW/MAollNhNf6qDn5s58bmlj5RpqPDVqtUcAw7+kMi921TAQTuh/wfhuCpVFIGq43HLo
	 4s7t3BpeI9FgWYixLSt3ypLBq3aK7gJ0L8pQ5+tjyPPXaAsHD1SGk3iP6hum6Jm62LzpZ
	 a1Msh3Gzo+Z+GRu7ovCC/IICvbdBCBgojlG4DKkUE8wUpQomVqGBCDsqsYNuBYKUZPf+v
	 FaPpn7nmwmbw7gNxqF4Eupa1M6+FHueHsu3iztjIXcG3Xvkq4ZQB4em26LYyhQdwIaxii
	 TmykW4x9mIsdkYRHIp6qcHnPYp47xUF8xaQ+btQG2B8GWoYgHTaxGJZsYYdljM1VJvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m4rtwzE3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88266606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88266606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m4rtwzE3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7325745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793804135; x=1794408935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptwzGsLXJirdc6QOOXq5I0id26b6wUOyvC9JKtjtifc=;
        b=m4rtwzE3uffGq10IxEKWz1xmhflD4XnLiYhNC4aA7237TAy26zTCWA0G+glDs5gT+x
         /vYTkcmDPh7ABasEIPM/82NeVKmtzpRiezwrJAV3Rku/acmashFk5LRIIXhWgqbkoyaK
         ktOCdtF3xfAylFK23jBcvZYYY44MZi+xeTA3XnXiDlR3FouNyRAM6wU54/4bGF+oXTWi
         Hr8YJkPLBmZWlKgEBwU6H6ooAYcN6ucjtVERW2LQiqrcge1XFAFLLVLfsHfpbnf3pNZO
         V9SOEuvAVVVAnySCtJcl2W2OZZ6nry/aYRBd9FR/qQQeMZMPXCOCCw75Rtw5SIuJlCOl
         BTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804135; x=1794408935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptwzGsLXJirdc6QOOXq5I0id26b6wUOyvC9JKtjtifc=;
        b=zm/LS821CAnXaJVGH7OU008sjCZiXh9cgJG+H8bYa4i7pnLo8gIggxBnAzqPG4wVQ7
         s6I88mEnQDHW/YdTwsivdK+VdfkaXHW/tOHP3umS6nQ1qsR2d7oKTGqDWBvIsAJ/5/uc
         6o7Ut+XyHmqc6pckA4sR+/hynCiUN8bjFuxybhvfCFcZhKyW2XbTNIbKY/uNOyxixhWx
         JVvRfOyI9jnBkejM94nYEdjoQ79VhD75MuGI2ZuDpfna52/E8HjZ48ISf17cBL8z5760
         eDT2zLou2wboMgGyljskTe+d4G9weBUzdSkZtYCqVTyWcv1ZMPXdhJpE1ZXfr2rf960j
         jrWA==
X-Forwarded-Encrypted: i=1; AKwUvBxfWNESrDyZF2DJSDMjS2ger6/RcGgbUofIwY6ufWGICAp42w8r20mh8Gq5bZt/9gTDPoXS/cUEtEsNWwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mkdBd31DSABxKiFDzihH2f00tOLIeRs+StaHupHtH2zCTsOPz
	trzBrHXKi73l5oE5JjIZznXWIu9wO8BnNqyzE3Kix5MHXa3Ch24X9RE9/oC69P3gqmY=
X-Gm-Gg: AYBFou2YQEsLfheDpDq5xFc+nPLR5oAUHYunzw0B6OM8IYX7rOO16x7hzStgZd5uqnm
	E641IJkCDrSIF0zKNXo8A2sfp0PY3FzYRdTgd+ewvXGz6ZLKZcPWuXCUnan4PiTROf4emY27gsR
	Gfwk5PVHPI5+Yr8FlhD2g6TRWAKesBFG3Pecc+Ou+MybvAn0ythbu/4M/luDLcp52A7GdI4Ytjr
	Wl58D/iQoj4KhDTc5TCOrZwGWAp9WkCszo4StwNUwM0HXwR2au1V9VHBajbgskZusaJy9VUMyZE
	3qH4gGGFdu1MeAjSR49PlS7aB605oeqTcqBd/H1BKlX6HqAFn+iSZDbj/aWQmqyDAo78nCC2dNZ
	D4VToR9O1WWhm32s/b9+9o6UFiDX4VwMVWjDB8uCi+UFUpi3q0CSAvmTp3CC0E4+u6ePLQv42ak
	CpxLRiND3OQ6CTPVgSLKY8x0M5vY/tChRZCJNO/2iHENScLxch8h3eKV+e1gl8jVV2HZpB0P8HK
	PiePdvA4bTBz/Z1C5J0OsnLls0HasIZqjlhnruusaqBVt/KroWni08kGXZP2gnp72Vp7XJU0p8E
	jqj7TNyXBDsGXyHG+SUKTGtLhuHlRC/T
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr347576545e9.0.1793804134676;
        Wed, 04 Nov 2026 06:55:34 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm4443977f8f.15.2026.11.04.06.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:55:34 -0800 (PST)
Message-ID: <ef1891a6-f53e-4f9b-8fa3-b8ea17e05c89@linaro.org>
Date: Wed, 4 Nov 2026 14:55:33 +0000
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
Subject: Re: [PATCH 0/9] coresight: Fix assorted bugs reported by Sashiko
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
 <3a778670-846a-4c29-bf8e-2f2e255d14ef@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <3a778670-846a-4c29-bf8e-2f2e255d14ef@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/11/2026 10:25, Suzuki K Poulose wrote:
> On 27/10/2026 14:55, James Clark wrote:
>> Small fixes for bugs in the CoreSight drivers that were found by
>> Sashiko. Mostly reference and resource leaks on error paths, plus a
>> deadlock, a missing lock, and a sysfs store that should return -EBUSY
>> while a sysfs session is enabled.
>>
>> This series depends on "coresight: Prevent per-thread events from
>> sharing a sink" v4 [1]. That series takes coresight_mutex for perf AUX
>> setup and adds coresight_release_path_locked(), which the
>> etm_setup_aux() and coresight_build_path() fixes here are based on.
> 
> Please could you post these based on coresight/next ? As these are fixes
> for existing issues, I can queue them (and potentially be backported for
> stable) without additional dependencies ?
> 
> Cheers
> Suzuki
> 

Yeah I can pull "coresight: etm-perf: Serialize AUX topology access" out 
of the other patchset and add it to this one, it's also a fix and the 
only thing that these depended on.

>>
>> [1]: https://lore.kernel.org/r/20261016-james-cs-multiple-per-threads- 
>> v4-0-dedf961aca0e@linaro.org/
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> James Clark (9):
>>        coresight: cpu-debug: Fix PM usage counter leak in 
>> debug_enable_func()
>>        coresight: etm4x: Remove perf symlink if config registration fails
>>        coresight: etm4x: Fix truncation of nr_ext_inp
>>        coresight: etm-perf: Fix sink device reference leak in 
>> etm_setup_aux()
>>        coresight: syscfg: Take csdev lock when removing owned features
>>        coresight: syscfg: Fix deadlock in cscfg_create_device() error 
>> path
>>        coresight: Fix resource leaks on coresight_build_path() errors
>>        coresight: etm3x: Don't ignore etm_parse_event_config() errors
>>        coresight: etm3x: Prohibit modifying seq_curr_state while 
>> session is enabled
>>
>>   drivers/hwtracing/coresight/coresight-core.c        | 6 ++++--
>>   drivers/hwtracing/coresight/coresight-cpu-debug.c   | 4 ++--
>>   drivers/hwtracing/coresight/coresight-etm-perf.c    | 4 ++++
>>   drivers/hwtracing/coresight/coresight-etm3x-core.c  | 6 +++++-
>>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 5 +++++
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 1 +
>>   drivers/hwtracing/coresight/coresight-etm4x.h       | 2 +-
>>   drivers/hwtracing/coresight/coresight-syscfg.c      | 8 +++++++-
>>   8 files changed, 29 insertions(+), 7 deletions(-)
>> ---
>> base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
>> change-id: 20261027-james-cs-sashiko-easy-fixes-1-692d80016a89
>> prerequisite-message-id: <20261016-james-cs-multiple-per-threads-v4-0- 
>> dedf961aca0e@linaro.org>
>> prerequisite-patch-id: 81acda380ba25acd3845eb58d5ded812175b9631
>> prerequisite-patch-id: 430caddc9c87948d4e9a0d1967bf3d8a50bca06b
>> prerequisite-patch-id: 633377150141300f7578b265fcc02eba52e592a8
>> prerequisite-patch-id: 9a82ffe5d705ac1fdf1250ff6bf242cfcd9d8fbf
>> prerequisite-patch-id: cf211801575d6bd0aa7fc0f6e19c3b90cea446a0
>> prerequisite-patch-id: d22fee48bf4aa3e01536e4683ccd797b3dbe1c91
>> prerequisite-patch-id: 55eeffb37cae55a1f47c2827899e0512b47a6efa
>> prerequisite-patch-id: c542d74cd4bc76158d5872bab12b8bd7a00f0c27
>> prerequisite-patch-id: 71cd37ed83d3e01d7a0321cdfa5cfc5ee113fe7b
>> prerequisite-patch-id: 74c1e3ed6dba4e25bfd3c39f06d43b079eed45e1
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>
> 

