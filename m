Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492317;
	b=bpYVWBdVGC+AqfC1vDENkHLOJosII/dZM1u7y5lYsmLcx3MWKSaJ5ouHX+1MYI/11293
	 ZB6OaIM6kCHzVbq7/kogenQ3IhufYqd0/xtZh0V/gCd3tBbRaVhkTugrP27FPsjKQz5cO
	 7wHdpJxq6UodFj8XVKSZUeUlmPAC908T/O0RWN01FXWvOb8d8DxMSl4TUw90SjcGOI2NL
	 LORalfaruTXmAmkaDlXVN/c7lkvre8F7pxp1dF48Z75lBJVK7+thmYq6QwxWxIs98WKD2
	 X90VYmdtGS6hohHpU7ZyTHSqX3Ox7J6fuyvkb6PtvbRj0/R1T31ssUQqM0eWcCdj35Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492317;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qwOHr2x3L679VhytAnH3M283eQvtUAQoXPmyYPQX/nw=;
	b=vTkP7FQMqGFYkMAV/1xsvhnf0fKUfWVVHbWf9vcrx8uKpMYbpNOxs0jsp28mlxjF9EpF
	 rWxqCbj6RncxQjvXLiXpkzfLdfD6+JcClgTXywFXLfElpAcwR+FvZjGX+gvyUsLYPhMTs
	 hh1wqc98MbSPfO0/Bk8TXI7BszwwuDdb0XR5eQgjpWdOSzKif/MpZm/TZmHxYTdFAXP5I
	 fMmZgjJ3/L83Y0W6weA78Eyn0gZeoprXpJ2XX06eK9cZEua8+5i9ZZSrFDgmsa7OydVqK
	 kMEWLUJLyI2Tw+U3fLTpvWlisTNjtEAgicZVnZBw2ZmYXSb0zarGy7OdQPcU6Baig5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="fI/l4XZW";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g+cw5PSh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E3606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1E3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fI/l4XZW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g+cw5PSh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794492315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwOHr2x3L679VhytAnH3M283eQvtUAQoXPmyYPQX/nw=;
	b=fI/l4XZWEisf4VO5sxe76eUST3pzAeeoLaztAegxnmOhpLuPXmeg3h+hJVzX+WqvZJQHqo
	PxC7FLa+Cg0C4sXxe7zkFXZu76ztnBguHQlyJErUDCfHjUE3DybE1uWUS03VYp9b/VlNby
	uPdT5Ue4gIu+6W1xKxPKsWNs+MGBNHY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-L929vT6lOYet9-1MgPvhKQ-1; Thu, 12 Nov 2026 09:05:13 -0500
X-MC-Unique: L929vT6lOYet9-1MgPvhKQ-1
X-Mimecast-MFC-AGG-ID: L929vT6lOYet9-1MgPvhKQ_1794492312
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b9f7cace4bso39959905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794492312; x=1795097112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwOHr2x3L679VhytAnH3M283eQvtUAQoXPmyYPQX/nw=;
        b=g+cw5PShQ1TmdYi/Ffx1rNJE34Y90yiPGG5zzOZ1RoI4DT9ZjcLp9bDkZDnQDXwCGW
         n7Vnqx9eDfmgQd88aMjG7A3GtFd3Ab6OGtEixjGIigoDrq9NAYQv1T3aDP3E3FYRFHwu
         O/3UyX8tMOBIcY8vnhAzJBC2jNnJjTar6RNuybDwIvnvvrtsTeG0lJDl+tygtU6LpQha
         r7qmXbC7XIqF9Sh4aCHVlAyTIE9zOM1TwbeHNUizKZSZn44kT3BspMC9q8m6mgketHAa
         44UqaWzNr/ZgOr3OQPzlMTOnbtbV/ZO7m+BgQ+2xZNLPJArYW5mKz+IftthH7BTk5j1C
         5Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492312; x=1795097112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwOHr2x3L679VhytAnH3M283eQvtUAQoXPmyYPQX/nw=;
        b=wHDWN3GZLwcD8+FDyZJHuTvy5MNzTQ8HSjFaeM5uGbRVLYwdB2J8ZBnBU/zADCpNrZ
         7ujpTXI1TgPbRhn4Q7+6HYv1+AyjoSt7EAeg+ahoo7ZQriCANpRZ3fMntdqGN9COa+ka
         IKpeaY82x/Xr3u22Nwq/NV6OugAMhurNxYI9tLKCq0O/fPD1ONtjB5+3nlnVTUYYd9s6
         WIPrDAB3lT8cRTu9FuRvyTM8Cg+nrcAXqSbSUT8JAvVoZCIbMPiR8CQe35SFbULD/CwY
         VLuQ8dQpU4hBDV639pK/+n/khGbLeF/6Vm10kJijYrWJJ5JqwqfZ+eg561JUqx49OIZk
         JD5Q==
X-Forwarded-Encrypted: i=1; AL+hErHtIgXBc86LXysoJMmRWPi/PE6Fe03TcKFHGxk0khvNCtlhj+RjV8BfpYDpQ+MgUOpIH/jlFiA9GPUbO5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gHbZaVUWMA24yF0kniR2gOthaztR/STlV9m/YA3xAqC2vq8KW
	516p6dD3HaRQmv0IIXLl9x32iK3KFiLThW9ADsf0/+E7qP1Sllv7WwYIaV3cIAhi8NDYI68HIJ3
	Y7UX6FCo0gn+INhpXNC90stLRk2fHTkQW3+p+H3nmQtU5TG1S7FJa/ZVAWbHlMMdZxQ==
X-Gm-Gg: AYBFou2y+xkAb5wfLJpMHOvBa6sSn4wpoDcMrigZGk2Rynf2KPSjnTvUo0SZWyLKxH1
	fc8ujeYyXhE/oJe36BI63AyxXywTYZLNNljZi98cMpGcFSMp4/zz1ZaOuiS2ZVhaANjI61yT2OY
	zzVRReqGOggplT8XXIoujlL0EcSUalrVzETzr+L2PA+Xq3xmyLqeKxOuDp8cNF+S8ikLfoZaIjI
	kuD4c4TMt8oBfBxidwwMEB9DNxUb7rR+HlYl7TMP7KD36gWwCk58k1xW6T3zclgH6FYywWU5oSe
	lGUGAzfGzuOJeTZGNEIK5H2Sp3gGD0flCm7QiHd7VBvlCLSsCMX0uwyLCq2JoD0066Mj/LcMxSG
	rBPCeyHcrmyYmCnN3cFulBYe7YAI63ubLKw7R/qKdKQKwo2Ea79iVWIo3jOyYaGwNMgNP0+3Qr1
	eqDlHwloWd9RJ5X1g90feIYuv5fEV1dpFCMydZGrSch9Gi
X-Received: by 2002:a05:600c:3486:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ba093b981fmr95344795e9.20.1794492312284;
        Thu, 12 Nov 2026 06:05:12 -0800 (PST)
X-Received: by 2002:a05:600c:3486:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ba093b981fmr95343965e9.20.1794492311603;
        Thu, 12 Nov 2026 06:05:11 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c43f4sm19847458f8f.47.2026.11.12.06.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:05:08 -0800 (PST)
Message-ID: <06c0d36d-3492-4fd6-a6cd-8f328b202baa@redhat.com>
Date: Thu, 12 Nov 2026 15:05:07 +0100
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
Subject: Re: [PATCH net-next 3/3] selftests: tc-testing: add gact probability
 dump tests
To: Linkui Xiao <xiaolinkui@126.com>, jhs@mojatatu.com, jiri@resnulli.us,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>
References: <20261106064114.3592670-1-xiaolinkui@126.com>
 <20261106064114.3592670-4-xiaolinkui@126.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261106064114.3592670-4-xiaolinkui@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 07:41, Linkui Xiao wrote:
> gact probability attributes are emitted by tcf_gact_dump() only when
> tcfg_ptype is set, and budgeted for by tcf_gact_get_fill_size().  The
> only gact cases that look at a probability today are 8e47 and ca89, and
> both check it through `tc actions list`, which is served by the netlink
> dump machinery and never consumes the get_fill_size() budget.  The one
> case that uses `tc actions get`, 525f, runs against an action with no
> probability, so the RTM_GETACTION reply path -- tcf_get_notify(), which
> does size its skb from get_fill_size() -- is never exercised with a
> probability, and the netrand random type is not exercised anywhere.
> 
> Add three cases: adding an action with a netrand probability and getting
> it back; replacing a probability-less action with a deterministic one
> and getting it back, covering the tcfg_ptype 0 -> non-zero transition
> that the unconditional TCA_GACT_PROB budget in patch 1 has to cover; and
> getting a probability-less action, whose dump must report no probability.
> 
> These are coverage for the dump and sizing paths that nothing tested
> before, not reproducers: RTM_NEWACTION, RTM_DELACTION and RTM_GETACTION
> all take
> rtnl, so sizing and dumping always run in the same critical section
> and a replace cannot interleave between them from userspace.  They pass
> both before and after patches 1 and 2.
> 
> Verified by running the tdc gact suite (38 cases, including these
> three) against a kernel with CONFIG_GACT_PROB=y and this series
> applied; all passed.
> 
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
I think the value carried by the added tests is too low and new tests
consume nipa resources. Let me apply the first 2 patches without this one

/P

