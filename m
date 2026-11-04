Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761713;
	b=oZ46Wmy0RgZR7NT2BATasRqGU4WzTtThsx1yauU7xInL46fuX5BO/TLhlETA62e/FJT+
	 wVCAeDIKyUzAZ2Mjq3/EIwEqbfqrmObphuYXoFH24qFewr8hhuLuX7tF4umWwNIyj6Z/T
	 RqQgRim96SgeB3en5hpdFtM67DANovasEupVTGdxfoCvVrRq0TcAHjQLLfsoKjMUopVgg
	 rU1qm2mNzpLtgriWKfI/9ZBeIFGArmW8d/wT/2RtIzzkdNKIy2H9DNyX6c6OOti9u+XcZ
	 FmPdbhIyPxc4lJc9D/8PeC2Yb7l0HvY0VW2TkWZbhnxw6JkB1fpBKZP0X68qUfDMjzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761713;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=28TICR5om8gEAA17u0Mkh2XWQT59vv9alAkSUCUqe0U=;
	b=cVh7X5+P92zSYc33fNQniH5mitfxOWs1rHpAt7TxeQIeonEOrze/w3JDH5uFPqYUSFIU
	 oibOhgVJR+y0Gqd49EnupDV8iDfA+v8u/AvtRFgnQbdSxerSB/QrhSZ5VCouPiRZpkraY
	 K8UaDgPN5tZu8ZrljkMVxUcuQi8yOVXwt2G/NyVg2Qc3QCH8q90KAiqe+hn+pW+M8b2De
	 Ne609A1oT3DFd6SjZlbR/btSr3fxZQgupyFF0ngd/bqnlf84Vco0Jud7sz1RxCNJUsYIn
	 YdAb20ChqMRnl/TXov7VL/FXuTToU4mxX0ucwtWksU0z81hf7J784o5n0l5lF0oTSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sJGdFMO/";
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35764606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35764606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sJGdFMO/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZvICwksGFdvGheOHbOECoxnMVa3CC+IOa71TpIVxlVo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793761710; v=1; x=1794366510;
 b=sJGdFMO/1wRKo4GYdURwIYpO5u0qXaUqYZjCIgqeg432nHuAX2K2jiiapWbd6g2PXiqB9qtD
 cRB3NtLbgzC5w2Ie5Zm+9ludyRlTx7CeaPCXu4sPEZBGLuK0tpep+SL6aJKoip41nL6adGvPF+H
 yHSmAxoj4f9NWpwvZTR3RPmE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b902d48028398e0a;
	Wed, 04 Nov 2026 03:08:29 +0000
X-Mizu-Trace-ID: b902d48028398e0a
X-Migadu-Flow: FLOW_OUT
Message-ID: <0e226208-57ab-4311-9a83-5b13adf768d1@linux.dev>
Date: Wed, 4 Nov 2026 11:08:24 +0800
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
Cc: cui.tao@linux.dev, cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, daniel@iogearbox.net, linux-kselftest@vger.kernel.org,
 cuitao@kylinos.cn, ameryhung@gmail.com
Subject: Re: [RFC PATCH v12 1/4] blk-iocost: add BPF struct_ops cost model
 support
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, tj@kernel.org,
 josef@toxicopanda.com, axboe@kernel.dk
References: <20261103132613.1952975-1-cui.tao@linux.dev>
 <20261103132613.1952975-2-cui.tao@linux.dev>
 <DMLQC758A2C3.175VOTFQ2Z8HD@gmail.com>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <DMLQC758A2C3.175VOTFQ2Z8HD@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Alexei,

在 2026/11/4 00:51, Alexei Starovoitov 写道:
> On Tue, Nov 03, 2026 at 05:26 AM Tao Cui <cui.tao@linux.dev> wrote:
>> @@ -3223,7 +3306,6 @@ static u64 ioc_weight_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
>>  	return 0;
>>  }
>>
>> -
>>  static int ioc_weight_show(struct seq_file *sf, void *v)
> 
> Unrelated change. Tejun pointed at this hunk in v11.
> 
Right, Tejun already pointed this out in v11, but I missed it when
preparing v12. I'll restore the blank line in the next revision.
> Overall makes sense to me:
> Acked-by: Alexei Starovoitov <ast@kernel.org>
Thanks for reviewing and for the ack.

Tao

