Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502424;
	b=mBFO2RjV8rjF7b9xEQhAz28IjM6/f85gjAYnkWmNKgp8J2ftincdatb86vGMc+RL7uHf
	 ywYojbgR5opRgwe1M89BmbSsjVmKslNkA9Rf5WXJOiS32h17IEmebBIdsAFkL9F2brFR0
	 bjvv23AzDXlQ6G7vJkCs/Zwv0I48nnraK25Z1a+zNoxtd4Uj41r5lHKNHtdt0BI33/xOw
	 MxuCKZqEKzAXnh7tWMD2lpzCp0jKd4BPgWDZRfZsIQSflh+HPOB+xDhaFFtiKJgI8XJWS
	 rY6sGGvM8Ze/9PdqiY8VxbvNf4SqS4xHqIqPshMijrgU5w8gZsD7i9/7c162texLdHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502424;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YGlVowyICXxSY3GmL0FDAbeqb2mzJ8MTPMKSU9lgtjA=;
	b=t0GKHW5VaithtmlNcsjRkFTNP8K8E7XOlcuUvRichjcHRnos92GuuvwUXubblveVtX+R
	 U/e+qXL0ijhnYVOBxioSTJdekUbl2f/KKgqzlDE4qH+aBHfozg2fefyM69TVwo67j/XFi
	 YEyrK0v2EIdi289wi3lz4fBhkZmwadHxoEDL+Ww+4amdhHMZNJOgmS9woZGy/zRPtLUWu
	 JXuBivXeL7ao00nmuy3+TZNeus4vDJyR0f74wtllEWXa0Nkcwk8QdV2vPLYxLsm5jZgWh
	 0ygkKQGzI8r5WDCDRrIYDxhTCAAOz9BQPYLAJSXhYM1+1bXqjwqj2BiTXUE25l6/w4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZxQSkQp7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=emZuO0aj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06260A260B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C06260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZxQSkQp7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=emZuO0aj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792502423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGlVowyICXxSY3GmL0FDAbeqb2mzJ8MTPMKSU9lgtjA=;
	b=ZxQSkQp76obljppQZ2/g7owZTCh4EDDThj3MN0eNLnpnoIxHdPs2HUrYZHirNr89LDYLnI
	Mj+btMWYDcQva8of7pkZfoLqQSJKNsuA5E3sR+3sOKTknYki0WQ1WxSos3Lycm30AhdJfX
	hIHXX8POmaSt0JsgbKyT49Ei1a2lqZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-Os8JhlJqNY2t_w2orgW9zw-1; Tue, 20 Oct 2026 13:20:16 +0000
X-MC-Unique: Os8JhlJqNY2t_w2orgW9zw-1
X-Mimecast-MFC-AGG-ID: Os8JhlJqNY2t_w2orgW9zw_1792502415
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c46582442so2080211f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792502415; x=1793107215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGlVowyICXxSY3GmL0FDAbeqb2mzJ8MTPMKSU9lgtjA=;
        b=emZuO0ajij8npHt2ZGqdIGX71COx5ohgnPj23C+VjscEyM/oodIUWkAfhfq84PH5QN
         lXJVUky4f4HMgamfjvigYLeUqIA5G/0skmvtld/L9k4brk7JniQzdEZrot06cjzKoIZV
         cZ1N2shzvhgELIDbVSIyNDkjzIIHzVdMJlD6TFUxvOnU4LWS5gwsrBZqr0Om9YX0xhif
         AFQXEr4xPCBHKEoviWc6uKytkXgyzG7knfo8IuWgF+PW/4tgTqTG9jbTT13MjLzd5i36
         mjwjKHWuU9OZbHiRDvFQ16TFOxIPt8gPzX13G80wfPWBWZ/JGu70tE2YZrL342jxyY4n
         ZGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502415; x=1793107215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGlVowyICXxSY3GmL0FDAbeqb2mzJ8MTPMKSU9lgtjA=;
        b=s2jnwf4iLSMVs9CE39JOUz9U49UgWOLp9S5+noMxcusFizSLwkaJXoPn82/+DMuh/D
         4mLebKsD7Ks3ThE+LyyS9O6osf2YpzQR0veBH7IZCyC/AAfJoEOgbPJXAErTDnpGeB//
         Wmi8u6X56pA9JTDPUl4I92tuiSK0gY6a/GVBGkyRSf+Z3dLWD6ZM8n91kjuvoEgK9qxz
         jZsdPlCJkg0pNwnXkByppgCpJ7lE79flCm4WgCNlSH/UhRLbDu7YbSs2yxEJogVBObL6
         RaVsOkj1VulC8ibzZGTIay2s0J2FOzIxRLLzzZC1b5Stke68DhbM7brSofuhZKJq/lBQ
         e/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwcJz9ppYDkRWCRbHmqtP6TpuE0LCrciaUb95hqDoN3pUzRfs1h8ItxGkltx0MD8/Vbdw5vQ9Ip+bCeLB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvnPoYasr/OpW3qBukRrzFhclsImYc/DFrlZidBQiED5l2+84k
	QCfbm6R7CgqYX2wKHdzxjtMfnN7lngATi68GysagytNAlCA+COqa/sB0ablcyKX0/tROpeVGWHB
	3b8kkgcgUcti4Pp7VxAxE2lAt9TD1hq59NU0u7tTpACWr/Gre9CHpN5tX69XhfLJjEA==
X-Gm-Gg: AYBFou15GUhQNElvK7vjXgih3vLujIHWTg1kZGm7Sn+atQRyiX2P1TEO+u4RNdbeOBy
	M4b93NE4gi05lQRDYrdW5abYUTwEj8aKEXYdk/sDql8nTAPS0/6/iEN01w7mqYlBi33D1sdN9Ch
	3kI0QcpUQrEBBFXvT7vMKu6I5OIOpglrnHcGkUhjR5bjLfuAidNsZ5SNGIbu9IYrnHSvtTRGRa/
	Pk/p32FFrBmf3piJYiID0mzcCgJxTGMq9xxIHDhRlhx+Pa5mLYLi+SR1wJJJS2ps1M4Hn7pyTmw
	eISnXRqugbtpMr/ACsipWJhvqfy6zqg2Wu8jtFiWWUf8l+thTuS6j8ncyCxb/uGHNXJFaBgBuQv
	vOawWqZOVYtFgdXazBnDRda3yx7RDtzikkw/r6uurjqkiOBEeQEFU3J6DXVnMp8khF4sIrtL4ig
	==
X-Received: by 2002:a05:6000:2583:b0:48d:ee31:a07b with SMTP id ffacd0b85a97d-48e07f9adebmr25137923f8f.42.1792502412459;
        Tue, 20 Oct 2026 06:20:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2583:b0:48d:ee31:a07b with SMTP id ffacd0b85a97d-48e07f9adebmr25137177f8f.42.1792502406697;
        Tue, 20 Oct 2026 06:20:06 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8244e1sm5905840f8f.44.2026.10.20.06.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:20:05 -0700 (PDT)
Message-ID: <5a195aa8-eb68-400b-95ad-e51e0ac95545@redhat.com>
Date: Tue, 20 Oct 2026 15:20:04 +0200
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
Subject: Re: [PATCH net] net/mlx5e: Fix NULL deref in PTP TX timestamp
 recovery warn
To: Carolina Jubran <cjubran@nvidia.com>, netdev-bot+sinfo@kernel.org,
 Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Alex Lazar <alazar@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Kees Cook <kees@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
 Mark Bloch <mbloch@nvidia.com>, Richard Cochran <richardcochran@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Shahar Shitrit <shshitrit@nvidia.com>
References: <20261015080218.1102172-1-tariqt@nvidia.com>
 <179205178078.408196.12399315538524843906@kernel.org>
 <842aba00-2293-4fd8-bc17-dc109b16da56@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <842aba00-2293-4fd8-bc17-dc109b16da56@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/26 11:37, Carolina Jubran wrote:
> On 15/10/2026 11:09, netdev-bot+sinfo@kernel.org wrote:
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>   - How the issue was discovered, e.g. hit in production, hit during
>>     development, syzbot report, manual code inspection, LLM or static
>>     analysis tool scan.
>>
>>   - Whether the issue was actually triggered, or is only theoretical
>>     (e.g. found by code inspection). If it was triggered please include
>>     the symptoms, like the stack trace or error messages.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account. If the series needs another revision for
>> other reasons, please include the information in the commit messages
>> then.
>>
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
> 
> 
> Hi,
> 
> The issue was observed during our internal regression testing.
> 
> The kernel reported:
> 
> BUG: unable to handle page fault for address: 0000000000002ea8
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 1a9bfc067 P4D 1a9bfc067 PUD 1a9bfd067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE
> RIP: 0010:mlx5e_skb_cb_hwtstamp_handler+0x10c/0x140 [mlx5_core]
> RAX: 0000000000000000
> CR2: 0000000000002ea8
> Call Trace:
>    mlx5e_ptp_poll_ts_cq+0x228/0x5b0 [mlx5_core]
>    mlx5e_ptp_napi_poll+0xad/0x380 [mlx5_core]
>    ? mlx5e_napi_poll+0x750/0x7e0 [mlx5_core]
>    __napi_poll+0x30/0x200
>    net_rx_action+0x181/0x2e0
>    handle_softirqs+0xdb/0x340
>    __irq_exit_rcu+0xd9/0x100
>    irq_exit_rcu+0xe/0x20
>    common_interrupt+0xa4/0xb0
> 
> So far, the issue has only been observed during our regression testing,
> and I am still working on reproducing it reliably.
For future patches please include such kind of info (specifically: the
backtrace) in the commit message itself.

Thanks,

Paolo

