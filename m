Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620124;
	b=BAXtAdKwS7hYtRj5d8xGd/zPvPkB00mkzsZPoKXs0lAmvkMFIcoyHLdAhadRzuuKGgZH
	 onZxqlkrbBMfR3oMOXuZ7KyhM+/1/xB/z75m9+SY6UTBHIucQQHgNQoH3nX1TG6xQKHOF
	 u6hXtCldlo9sqXkk50drbwJ6FLWQbgsbuA8qI7cPaMqHLQZjY1Nc4UXxkw9y0AHYgeamx
	 LGo3mO0kTHvC0hIiDaTYXWnYxugFZwmutnrgeYKah1bgp1F433Tus4Fi87jnSv6TBE+WL
	 ArqGP63vjxW8MY/DA8kDS5mih461QXLyRuGWmQrEF2Y+keGCIR0RPN8OZ+G15w4CVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
	b=3WAelRRwaky6jCoZ5rk/29U51KUeG0e8yk1C3c/EqsRJcG7OH3LGc3G9bd5PhDUY5OZ+
	 NKCU3RKXnwSGI8X+bx5qPHiBaoHKugKOKy80LXhI6AwcZzZr0R3lVtDt2naK9b9HQ4q8g
	 2w/zLUqJs9x4IdXA5SW0n7zLBrzoh4e7jcN1EMaRSZjqdoQl2yWtikxMpG2cPRdFdSqfI
	 U1W6aqGP5goQHIhlRWLOKwguhuCkZm3fz1LnA4EPXrvYvjWH/G2ZU3oE/nWh28tu7tk9v
	 ZXZm/VavaJHHzgSgD5glo1t6iwEaJT4VRVwcaWw+KSy+UXciNd+InsmzRNI01i7hhBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwKC63E7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+2Y3auc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D3606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwKC63E7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+2Y3auc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793620123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
	b=VwKC63E7gXAt7jA8i1/2TWcGW+eW1SHGmaLpx1JpVxzf3X7GnbHRurQM7+SvR4ihOQyHEx
	rx22CY8yzl2Uec6ATjyEHLclK2rtj2PisTTTnJ/CBeoteUzJR/eRyr4bLTGCDBpNu07isr
	Vb0yM2vKvsHsf+XzvaSofoCgPYdI6HA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-CHgtsqs2NDacWBVeGDdbkQ-1; Mon, 02 Nov 2026 06:48:41 -0500
X-MC-Unique: CHgtsqs2NDacWBVeGDdbkQ-1
X-Mimecast-MFC-AGG-ID: CHgtsqs2NDacWBVeGDdbkQ_1793620121
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so2056584f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793620120; x=1794224920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
        b=V+2Y3aucgs5B+MhZba5RM/XB9p8JwmNL+C8mWwAACltGp1ifrzmBTEL/EU+BWRC9J8
         fObcOHZHLdreIpQzJPaMVPVetnfkQypmbM9+IqiNN6M3EppD68doozk2sYpFVeME2Wk5
         9dpsZn0gyEOGz/JPnXPOHd3tZen98QemsrwA3JY6vU6lWad6YLMBJmmVxzrpyVLllbAf
         c0/MQglXNNtBghT6VQljgimsU2zYgd42opEnzJpN3mla4FPv9we5zn1waEBnqRpIX8o2
         FNDaZOCNojx+T+08Rx53sNpd/Mom44tSYjXBpMhAEG4s6iEgthETvaK6uEOuADoN/iYF
         W84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620120; x=1794224920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
        b=0kJxp9KafCj87VdP7naJ/yisw3VKrVflEKFcWkvBN+4PFB3apwETEu0tbS3/BEQ4fj
         CV4S5P9RlYquv/EjuKAyK0fAuMXrVV2chayE1QkUq3YIeuR5pYsMLbIahE53HvZxYOvu
         tP8uOS+0ZUd346+FYb6uHewZ2HowYJkk/6UJ7Fl+Z9b4VZ21xten06WKt3nRNaXUw+/P
         X8IB6j1hJvL2487VOf6n+2GxpJORRdJlyKS8exPLFZ8feR6rL+99ULehmlDAeQNaNtKa
         1WbODX31iuDYOErtA+5DBdx+80/LvhGJf6geftCa//IUPAiZCf1IHCKPfzGtAbHIpOCD
         6/LQ==
X-Forwarded-Encrypted: i=1; AKwUvByLyJF9kIteWYRryCtyjuTaaEs6fVVfvaVdC6Mqb31cotNd2r0mFw2GeuEjb760B3ZoawME3YhnjWDSKnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYyIbKU6cofUxCqvKWzrkUvGw26dRT7mo9cwW2LVB9x9YYc6G2
	qHaz9gpXnQra1mLvJHa/Q4MWHolREVPSpGXFEW3RHserFmVvrqNyB3WgHXU5hDFgt2BnfThEoe+
	RMCKbc0TO0h+UEJDgflfHz/bbJPdkshl81ZfiYIG99rAgF3UgEadqynTs2VF7tgKHCbNMnmOYgA
	==
X-Gm-Gg: AYBFou1XGFvqvZPMi/UiRJlteMmb7wbhtE9pgveEYugftJOMROpVaT6ut7RrdgdhBXw
	WwJndxJAosUpjSMJpDZRZ6nygEBmz9fSbhP+3bAmbL9kTJ+MQNnGNVvrV0PMmkezBa79eX9EswX
	iBdrrEiQe8MkJNyzWw8WCvO85r+rDLzQ3v/MlXCGVZmIDnRyg9hfVXu63gkntHIuwGMvYZDXR5B
	2K6+DTYL0BEW/lk1cPELyROzMwrW8/+63APQ5J5AoVNEkwGDYImqicQZAVUW9vkIuJcOYjXgmFd
	Ao9Z6aC0+dNrhbcD12jmcOssyqVdzbEHqjUsf7v1JGPfNctPHxWDvlL+JX3wrw/Qu3pbwaNSFEG
	/idIGuRgkmimjDSnZ2N/dpGHRJrmr4DLHR9iRI6rC/pKQY1DQ1+DprxuchwIqMOkhg2DPsUHs8o
	WhhWQLPbGQQxUfc4kazLg/KS3JU3o62iQwOtEcqLvQDf0=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr220535635e9.3.1793620120527;
        Mon, 02 Nov 2026 03:48:40 -0800 (PST)
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr220535305e9.3.1793620120207;
        Mon, 02 Nov 2026 03:48:40 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm337173005e9.6.2026.11.02.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:48:39 -0800 (PST)
Message-ID: <4de42b50-1f80-418b-94ff-95d656f08bd2@redhat.com>
Date: Mon, 2 Nov 2026 12:48:37 +0100
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
Subject: Re: [PATCH net] ppp: remove SC_MUST_COMP
To: Qingfang Deng <qingfang.deng@linux.dev>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, leitao@debian.org, norbert@doyensec.com,
 hataegu0826@gmail.com, paulus@ozlabs.org, Brice.Goglin@ens-lyon.org,
 akpm@osdl.org, Matt_Domsch@dell.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029074935.40509-1-qingfang.deng@linux.dev>
 <179339596607.3131.10030375792154782283@kernel.org>
 <84396bab-166b-435f-9663-0aa2939de3fc@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <84396bab-166b-435f-9663-0aa2939de3fc@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 02:28, Qingfang Deng wrote:
> On 10/31/2026 5:32 AM, netdev-bot+sashiko@kernel.org wrote:
>> Would it work to keep the define, with a comment that the kernel ignores
>> it and that it aliases SC_DC_ERROR, while still dropping it from
>> SC_FLAG_BITS and SC_MASK and removing the checks?
> 
> I found no trace of existing users (searched GitHub). Even _if_ there are any, _and_ SC_MUST_COMP does not alias SC_DC_ERROR, the logic is still flawed - received packets are silently dropped without noticing the userspace.
> 
> If the goal is to prevent the removal from backports, I may split out the removal part into a net-next patch.

I'm sorry to disagree with Simon, but I think we should not
change uAPI unless strictly required.

I would just mark `SC_MUST_COMP` as obsoleted since <revision>.

/P

