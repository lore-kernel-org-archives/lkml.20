Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495103;
	b=LzgzMukDKHyrojRXhcGyRYIAoQrbN3dGCyGgirqw7a+rr7qAdRHa1dUBWY0JWvN2XWmI
	 Qe46U8RJsb8yWkPW56Qkd4cSJdStH3/1sds9ug3RptIePHjygTS52vnxRgX8ZuMWkI161
	 SlIG6De/Ii09CpvDk6TnfmmEN168g/hKdhRVJEk7aRe8iHu0slGD875a5H4/NW+x9I+Dj
	 xmffjCXVlX3EuqaeD5MrHTjmj/HMFQcCJGqLIsIHrCXaEqXy8v9aMC6bErGxXzLMTOxo8
	 nuBy6ZVn0y9iM4uqraI6S6i1BRP3NG5ZQSeL1+HWB0Fgsc2dLThX3s4hzH9jBcc67RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495103;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R5IQJPZPaZ722ekjdLCDgWz4ITlLwSuM6xAfRDg9ni0=;
	b=RiivS6V98KEjkzlgKmv/fRY8Tl1A6hF1vnd5Od5q5xi2P77r+zE6lNARoYSNHNGN68+o
	 aUzsAIYiuM+QE1YG4+eNBv5MPSHpapQu5tdM7iabC18owuvtfXf9NEdurrvWDRtB2cPy1
	 Or+4JkS1ltrTErZbN1sKKBQg2rEWe6w0iqRkJjE9eOUkyMfNGFA+jglWlKncJhpyIR/TI
	 PZf81qHpHSDGcrJrnLoXaUuF2oMVk7uUunWwYtfUleLXxJd1+q2QCzp3YINiPfGMC0Ev1
	 UPIEvUJ+ea3/UpI9qiPR+AoyanbeaVppklrGqNATnGAClEr0XaE67Sy5l84uS/vtSvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dk4k5rJ2;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F361606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F361606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dk4k5rJ2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R5IQJPZPaZ722ekjdLCDgWz4ITlLwSuM6xAfRDg9ni0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792495099; v=1; x=1793099899;
 b=dk4k5rJ2uBJQaK0Ebxj+ZRKGeR7+0Dzboqmb1PAWhUgNDcQrvmS/Q6DIv+x0/jUNhCjPP81I
 hvVMRm2bPmIP9yN8+OhNAY907Bgu2YUyLLpGSbukh7MLi0HivgX9e9PTJ2XIn9ooDJwHKZLE6V/
 OOJPryfOPQ5r4u51Xx+w3T60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 380707f91af7ed82;
	Tue, 20 Oct 2026 11:18:19 +0000
X-Mizu-Trace-ID: 380707f91af7ed82
X-Migadu-Flow: FLOW_OUT
Message-ID: <21053bda-1be0-45c3-80a1-fe012886ab0f@linux.dev>
Date: Tue, 20 Oct 2026 19:18:09 +0800
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
Subject: Re: [PATCH net] tls: check the right open record in
 TLS_TX_MAX_PAYLOAD_LEN
To: Sabrina Dubroca <sd@queasysnail.net>,
 Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: netdev@vger.kernel.org, john.fastabend@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, wilfred.mallawa@wdc.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261019222626.745408-1-rjethwani@purestorage.com>
 <atdJUP6Jb0jODBYE@krikkit>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <atdJUP6Jb0jODBYE@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sabrina,

Thanks for your reminder. I totally forgot that thread.

I will send a v3 and update the commit message to address Paolo's comment.



On 10/20/26 6:58 PM, Sabrina Dubroca wrote:
> 2026-10-19, 16:26:25 -0600, Rishikesh Jethwani wrote:
>> do_tls_setsockopt_tx_payload_len() refuses to change the record size
>> limit while a record is open, because both TX paths size the record they
>> are filling against tx_max_payload_len. It looks for the open record
>> through tls_sw_ctx_tx(), a plain cast of priv_ctx_tx to
>> struct tls_sw_context_tx.


I guess sashiko will complain the same issue:

https://lore.kernel.org/netdev/20260901031931.1636980-1-kuba@kernel.org/


> There was already a patch for this
> https://lore.kernel.org/all/20260901072927.128688-1-jiayuan.chen@linux.dev/
> with extra locking to address sashiko comments.
>
> Jiayuan, were you going to send a v3 to address Paolo's comment? Or
> maybe resend your v2, since it got marked as "changes requested" in
> patchwork?



