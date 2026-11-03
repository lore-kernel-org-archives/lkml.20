Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698427;
	b=J/Gue6cDwxd5jfwYdPGLPwy+LuTcjTt9HqMSQiDfSCFYPVds1Jlmi4TM6cTNuSXa16LZ
	 dxAskS6mYv8TWfGOFtB0T5KuWrrzO69FH39j1Mc855zNrncIhIkS6t56a3uh30ZBwvdz4
	 XSZFEpFVxOWflDh3MylsVtXR6/Y9ArnMKO2IXujsZV/ZKjcrmCzMXikJBajFyXrW4SMuf
	 n7kSGxkMBA0sMKuNriIbuHpInHaBPLUL0R8J47/x9zWqpkkCnfpa5EuBnPV9q4AJLX18V
	 X28j9P2gOSbi7NrikXgw/FrybfKH8+v0Sk4hplBcPv4AWG2QsFrSPOVmn0KHSzpnTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
	b=fa9DRj0F1Vl8eb90x3225JdREQmyVE9prddUPiE8yHpi3UqUaWx1XmTnxn9AqAL9kbDn
	 C6Qu3bzix9j2K+zYg9oF6vhf6uFP66DNfnAN/5W5PBq6BQbwJ9/bNEIx3z48QqPgvYokE
	 tf873uDrL6FOkv1VEp4bW42Od2D+3b0XaiCSvR4AMw1Vi5l/1w32UekEmWMggqf84VAhL
	 noOSo0fnzZpKZKtUYllgOMrs7Xq2OsuceGhEEtsEth1pdMhSa7UxARRvSgTNHOjq6T1Cx
	 N2I30y29fGObq1fM987VVfKZcSTaEpgdLVBMr62AGcY4J5b4TQg9yjr6Q5vBQ24IhVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnOF5gQr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72C606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE72C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnOF5gQr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so26273155e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793698424; x=1794303224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=YnOF5gQr8IEIkW6HWm20AuyPACLS1OptSJKmzC+7y88SO8N31+NVbPs4JcqFkm7HoE
         gWfEs7JEUNGGE8CCHmw+8v34umJM0oBTRoPEW3rHBjm/LcKoFUEvBhdTYiM7CSqQQQPC
         irEh5Aguvm51tcn+pqCn6FsodUqOXc1YoSRX/DeDs1Pt3NQhvY4LThC50Oma2Ukdx5NV
         xRGd+QWnnCYFKqBiLiIbnSwSmnKZcXIGPk7tNJELq1ekU3m3yOy1IxGC0J7f/AbvvR8y
         BfU7HY4zIsVKAhWaHKlQ/bcPN0/vcdjr/omLstUTAnFPa4W5qB0fvdLA4RwNpUN4BNao
         UU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698424; x=1794303224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=hRRVJOGdTqA0pA1BQhfEMYc3eIEIFHssvmNFHcDN33ASUIZrPSdSMuJ+J4zstDyxUv
         vSxyuC1kouZvfvTapIsj+qgqPy6tGBzVftgs7+xTARVo5unv5cnY4BlgzEJwlPnXSPw9
         +eE1P00V/nJCtoGAHAReX55w5u2+qUlU3FY9jFiWczWR8X7qTXa5oEVIqEr3p6HG6yua
         7rk7lAP9lN8O+iWFNNVIzglWWW3u1wl0xVuRg5OSXVOviJy2VMENAbYHvog+eaxw1sL7
         DKUPL6l7pCoAl3jeTdEJLH3qaWJ8xGMGO9lyzugAyWQ4oQCwLsTfZd/zcO/Im4Xj8yJ6
         ghuw==
X-Forwarded-Encrypted: i=1; AKwUvBxSSfPDpcdzeJHZM6Gjtntv3BjNs2yX2/+YYbQpPl1bnrrOzrkQs4YaKZEmLrj1PITRyEcmWDU/JUjpdow=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DtPfi4PEaW69HXeJrInf9zwvUshLCg6ecoQETuZNEaxicfOCW
	0ZCdUREAWaLvPsskhT5CyJBpm8lrOqbZ4k7K/eAXKcqRDD+uGmd3WcDw9yUD2QD8FVo=
X-Gm-Gg: AYBFou1mMxU5sEu2siCH2GLPQ7yMm5Vm/H/rnoa5pUOBzsrwQUbJdp7Uactuy8ZvyhE
	w1FnLy6WYrfVemDerKt4uovNr/71cNtLNCdWyFLagORiNg+/ZUY5Yy8T1rsnOjTRiml6oGZYIbI
	AaJiZq1L6n4GMdS9Av8flqufw27AucuWn8/XiOHzftyPmrFkR+bPIuN+I3uTcK01zAyhjVCFsLp
	WIBzvj1bCWulXDfslyLQlPWD50+8B4mdbKEZ7gQolIYFHLZSsDpxKTVh+xJsbAJFJkacMQZGkU5
	Poqekf4JqZC7fMuKr+EaqjaOgcL4bhwiT/SUzhWwWSMuWZaKMF9Kyh70xIaLj4OK6hDseme3Dh9
	VBOlB0RmrlBs8lnGH8hSdwugOa23Rcq5O3WT2hzjMPca60RpIRiO+BoHHRrFALPNwpy0rDnQgyu
	e9O33ceEXbgCxslxXnrD4UpmHuwjKpTh9ObvwTZGt9E6LIc+Be4Z1pTzGtW8uEYzVgncg0IYbON
	k/Fxq9OEhzAxvJ2sHQrLQ6elflbj6WZcwDAbSuClmXvbQjKX+Y9odq5VROIBaf7ikT4e232gFiU
	BhiphjS0BBb6TENma84Lf0uZNALS5KSI
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr286221315e9.25.1793698424122;
        Tue, 03 Nov 2026 01:33:44 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm25836221f8f.32.2026.11.03.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:33:43 -0800 (PST)
Message-ID: <5d15b4aa-dfd6-4d01-86db-df748d84aa74@linaro.org>
Date: Tue, 3 Nov 2026 09:33:42 +0000
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
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
To: Ian Rogers <irogers@google.com>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
 <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
 <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/11/2026 18:01, Ian Rogers wrote:
> On Mon, Nov 2, 2026 at 2:52 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2026 18:31, Colin Ian King wrote:
>>> There is a spelling mistake in a pr_err error message. Fix it.
>>>
>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>> ---
>>>    tools/perf/util/cs-etm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>>> index bdcf94813129..65bce2450549 100644
>>> --- a/tools/perf/util/cs-etm.c
>>> +++ b/tools/perf/util/cs-etm.c
>>> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>>>                        continue;
>>>
>>>                if (!intlist__empty(etmq->traceid_list)) {
>>> -                     pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
>>> +                     pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>>>                        return -EINVAL;
>>>                }
>>>
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> I was curious how this passed Sashiko's review. Did Sashiko flag the
> spelling mistake but the fix was missed, or did Sashiko not flag it at
> all?
> 
> Thanks!
> Ian

It reviewed it, but it didn't flag it. What kind of typos is it supposed 
to look for? I haven't seen it flag one before.

I have a spellchecker in my IDE which didn't catch it either because 
should is correct and t is only 1 letter. Maybe there is a setting I can 
tweak.


