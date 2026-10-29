Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268258;
	b=bR08y8cbqnxw1rrQVeaGuJDX3MpRX0Ef3PYKxqyJyVibLnmSWSy3B6fG4caJ32tSSD9r
	 TPq7HofK5Y8QdQWA/Zkduch6mqzKAaEOCx0snZTS3jO+iTKpwkp4CnW3phREQyX6y17FW
	 GRqIeKkMQNSOK1K2w8XCn9d4NVbiPOFhLN1omW90B5M7Cg6jloMTFAlDHDpFyUO6VdaqJ
	 T+yeE/9ktvB8+FUztzsnI3bEcgb0EPTsn8Zes/NvJ3Zaa1E8pv8FGlTvIglDWKPMEzeiY
	 ei5fjPxq9LziHfz3SqWk0PS7mj8kSvwSWrSZJn/0kIdiN/ao+fuzlGe/+6D8upHVo0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268258;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LB/73nfCAHiY8ms6QFBHreSDwl9iYXEvUDaC3DV6Zu0=;
	b=pTmSDJqx9ZXPsYPelsK9Q+SoxMB2H8yoJP2uqzycAv8vU4sWEG4pkYAATx8aJ7XqgxxU
	 tOmaBrvFeDOqFv0joaK11qfDO1BeLxmIBalETNm/tI0vo5nxmYmpoazaxtB2bldPT5s9i
	 N/gDTfo5Pu/c5fX1Rw2bxJBe5+CGqMu0wPJV5KPaaEWfQ7PdC5WG+wyqx3M1t8KRcWAGL
	 d4vK7vz9P1DSjeyKZUKtE/RYPm3KDoCXhAirTlAcGTnAYLVNI3s3woXaRAL5MPi7Q7Bnl
	 ych7nsdJ/dzpp5DjXtoUYxcF+toWctNocrfdTV7TWNOVCQ2L/O6eajhbGEkJ8vMf62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTU78u7k;
	arc=none smtp.remote-ip=95.215.58.221
Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05853606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05853606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTU78u7k
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BAYzLGPgGf5837fXM6g/DklP8VVuXY5OJdBGwkWAxDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793268256; v=1; x=1793873056;
 b=nTU78u7kXKe6fJXb4mdOo3cLUl1W8+j6jW23IQ8ZbftY929IH6CvYEOhwBSWyHqCv+6MADeL
 2mrGTD319VdqsFjeEqhWqGRa4AjJGEDt/ItJM5qhr9Mwnnrm7QD6V7fU+Lg1W90HpEWDpC/q9Re
 LUdXm7lMRptxlcA5rq9RRANU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9324b428c442bf0e;
	Thu, 29 Oct 2026 10:04:15 +0000
X-Mizu-Trace-ID: 9324b428c442bf0e
X-Migadu-Flow: FLOW_OUT
Message-ID: <d06638d4-72fd-4b35-9d78-a2e45856d83b@linux.dev>
Date: Thu, 29 Oct 2026 18:04:07 +0800
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
Cc: cui.tao@linux.dev, josef@toxicopanda.com, axboe@kernel.dk,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, cuitao@kylinos.cn, ameryhung@gmail.com,
 alexei.starovoitov@gmail.com
Subject: Re: [PATCH 1/5] blk-iocost: move shared definitions to blk-iocost.h
To: Tejun Heo <tj@kernel.org>
References: <20261028143534.135968-1-cui.tao@linux.dev>
 <20261028143534.135968-2-cui.tao@linux.dev>
 <3f51067b3d4d549e8414bc19bb612cb5@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <3f51067b3d4d549e8414bc19bb612cb5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

在 2026/10/29 04:09, Tejun Heo 写道:
> Hello, Tao.
> 
> On Wed, Oct 28, 2026 at 10:35:30PM +0800, Tao Cui wrote:
>> -static struct blkcg_policy blkcg_policy_iocost;
>> -
>> -/* accessors and helpers */
>> -static struct ioc *rqos_to_ioc(struct rq_qos *rqos)
> 
> This isn't a pure move. The comment is dropped here.
> 
>>  }
>>
>> -
>>  static int ioc_weight_show(struct seq_file *sf, void *v)
> 
> The blank line removal is unrelated to the move.
> 
>> +	bool				user_qos_params:1;
>> +	bool				user_cost_model:1;
>> +
>> +};
> 
> The blank line is new, and 2/5 then replaces it.
> 

Dropping patch 1 resolves all three: v12 folds the definitions back
into blk-iocost.c with the original comments and spacing intact, so
there is no move left to keep pure.

Sorry, I should have caught these before posting.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

