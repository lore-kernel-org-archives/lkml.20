Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261499;
	b=bJ0Ws4+Wn8xAaf04DzrwrP4pXr56KvYIuVyIPT6AFHBfblZeM7v0o1aG8RO5seAFcaJz
	 Y8Vq3s3MGdrbvFVG0H0eOaAMtmzFnhR/y3CqlXnrTOr3Lj6QvweLQiSQk2FAm+yVvUNh1
	 jrPM/hUq03RadxLlIw7/pMXqTjEQoWADJOfVdEK6NwXqRURRVlyLT9TikQ6OyP8cO1v1V
	 +8HOoWlSn/nEAYf8OKsjtNadrD0JKKExHNE094chRB5+DEsfwsB1jBOmatvEJe62hUc/5
	 d2/Ciy/u0tNHvZt6SNo4y7F9w+ic9258hKEnhAfqu9lRUZx97vxNSGBOa4s1cpMLslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q03BRgBOcQNLCRjgQwIL6L5lX3ohT8w/lgFYZ6hcCWg=;
	b=RvnPPyIPiq6xGpMYr7yBzOhue45Vwg34/acnSwHFVlp3md07HfOi+i2ChTWwCNJO0qVR
	 r/R0yIneQD8XPI0ych2HTd65LJxRiea4kGvC3Ihy/cn4oBLoFkGUTlQxa8LWOmz19sLoA
	 5ZOX3dzdTzXhnJ2dXn7GPAxlMmtgto9LGnK0t2aSiom6b5YivMJMZxsCQh+vvw4Wt3ucU
	 pkX2c0JhMIjtc9COjdEBSkwfC9+PnmqwgZ9KXITK5ZAxn0uduhVYibF9UXEns/0VpSBqq
	 b0DeeHI3lFw8hx1ygLKKd/0rebOOWQHasvHtp6KxqEheKcWKZEr2n8C4HPMKIVFhz8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYO9x1Mb;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0AF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYO9x1Mb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso141531266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261497; x=1794866297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q03BRgBOcQNLCRjgQwIL6L5lX3ohT8w/lgFYZ6hcCWg=;
        b=zYO9x1MbNwJ+vVirkbtAQ6GaGoIyfE3bXBdqwm8xZu7VLwvhFj56va0o++rdqRLDXj
         cX66Kt9oSCJSpPoic6oQcGqR90HFFOxD/LZDxfImAPBjX8+96UIQvHzxHYTcIYq3pSn8
         LeGbjCvPRg0P96wlmQyrNk2DlMCC6cpXszeBXUmTCJyxQFuWMC4L2xIu2LZqJqepnUCz
         fUSxPTQaKY9zrJpgs/A4ddA4wfQQfo8q4VgRxWqnISyokRQ7EooIkZaVRF1dd3pY47B+
         aRuCilGOQNLoZlBPm/N6cn25j/fuxjlXwPF+ma6WsWRx+ocCE6JRIri+aWgVv/urFg9C
         e33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261497; x=1794866297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q03BRgBOcQNLCRjgQwIL6L5lX3ohT8w/lgFYZ6hcCWg=;
        b=WFLmb/9lY/G9zp5A6Fh7ZtybcLaTcNTcLofp4IlyKdGbeIhISihgFzbjWoQhePY/hY
         YxJhUa3oa4ZkXvY5m0Aq9sMxeoCQCsOvT3YiEUmJgaXUfJeHsRo8dXqDWMyZ2cWuAS+I
         wVeCCNanOwTzLDnOO7AfU9TTg9stIYP3akHP0bzSQbb2oCXg85leQZrKmNv9JRgz6Ch/
         ioX/WkdC0+yF1hjmqAL7pXOdlAeyAF0g795cOKmhItEwmvDoqDoeBLEk75vIeinXVyj3
         tQ8txr+krrJaRVWbvWLeVDvB43cVuHlc2xgrqFbp6WheQnma35MNpXKPcjqPBIOeERmR
         F/2A==
X-Forwarded-Encrypted: i=1; AL+hErGJEzvZe4m43Bv1v4An6twN1/WsXZkDWawD/hXlX3YMxRAhKKfNkQvKYGv18pzlldQf/kHeW6CLPQkZsBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ji/ABEOuPqR06GBQCM1Att6haSdqwmHmo9ippyu82BaTg8lU7
	zsJH/zWFJPSjxDvGwsGz4DlVB+tQFsA1IQeA1+vaTVb/2I2hgq7XZM0e
X-Gm-Gg: AYBFou0ykH+e4itxWILADgN/TxZS18YzPZgvuHe1J0b+Ltl4o6n64sg08KfpMWeijt+
	ISDuwCx56VW4cGu+XLvsvW3k5Gdr8zQYdqRXU5Yfk9BKtmivLL0ONEuPIMIj5ZFOEJRYt8vlKjb
	N/0F9UKFSWLASCGLkAE4PJyB9NmV8choYuY1Nr+D3a4rAKXeB/fyviMNHVQetYBPCMXyCxS1SmY
	18qCkMf1XXZJhPqouDJWfA3tK3HJyIIEGKvnUj6jxY2aerggD3n2jrbCHn0HyAr2OC2YA3sckJ3
	PIZJPxme/pwxmMOQ6JZaF0Rz6ePKoiy/8acJwY3ySVvwpW/MzbgbGXsSvIlS78HT6o4OvyG445Z
	G05ghxRDGGFmGsBkrfXRfxvVTz8WJDjNIcRnHKNMh0tHZjfB6aY9GWV/qtvMZFMvd0oRCERc+1f
	zmGmfVO0eJh4ZZF7hfDTP327jl4WwfWF1NEGELSFsz7D7cdZ1GSjsFXS9jeXe6QhW484ZLTiaQp
	S83fNlq6oxoKKRuXDyaRbnAcow0RzpJcgk1d0fE6BiI40bkGnwjOCc/QXh9lSpMifCGnw3sdRlz
	zMPKpf210BwJ5nXV7VoQyontQh6JJksmXu9QPUP48yB9Qoa6TuOF7PYBQGqKTr9j0SEuZx2PQt/
	U7f6N2g==
X-Received: by 2002:a17:907:1905:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c50491c3b10mr53885866b.7.1794261497276;
        Mon, 09 Nov 2026 13:58:17 -0800 (PST)
Received: from ?IPV6:2a02:a03f:a75e:9a00:b7ed:a37a:5b51:f302? ([2a02:a03f:a75e:9a00:b7ed:a37a:5b51:f302])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a685f99sm20298666b.82.2026.11.09.13.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:58:17 -0800 (PST)
Message-ID: <1c0bd741-0e5d-428e-ac89-3907d62c4eb9@gmail.com>
Date: Mon, 9 Nov 2026 22:58:14 +0100
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
Subject: Re: [PATCH net-next] net: lwtunnel: use GFP_KERNEL in build_state
 paths
To: Max Boone <mboone@akamai.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Donald Sharp <sharpd@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Debabrata Banerjee <dbanerje@akamai.com>, Nick Hudson <nhudson@akamai.com>
References: <20261106-build-state-use-gfp-kernel-v1-1-18084382f878@akamai.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261106-build-state-use-gfp-kernel-v1-1-18084382f878@akamai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 12:40, Max Boone wrote:
> Since 3d25eabbbf67 ("ip_tunnel: Add dst_cache support in lwtunnel_state
> of ip tunnel"), build_state runs outside RCU and all its callers can
> sleep, but paths still use GFP_ATOMIC.
> 
> For dst caches, that limits allocation to populated percpu pages. A
> large burst of SRv6 nexthops outruns the refill worker and will fail
> with -ENOMEM despite there being free memory:
> 
>    percpu: allocation failed, size=40 align=8 atomic=1, atomic alloc
> failed, no space left
> 
> Batching 20000 RTM_NEWNEXTHOP under QEMU gave 10-109 failures per run
> before, none after.
> 
> This commit converts the allocations reached through ops->build_state()
> and are called after the rcu_read_unlock():
> 
>    - ila_build_state(), ioam6_build_state(), rpl_build_state(),
>      seg6_build_state(): build_state ops
>    - bpf_parse_prog(): only called from bpf_build_state()
>    - lwtunnel_state_alloc(): only called from build_state ops (also
>      affects mpls, ip/ip6 tunnel, xfrmi and seg6_local)
> 
> Signed-off-by: Max Boone <mboone@akamai.com>
> Reviewed-by: Debabrata Banerjee <dbanerje@akamai.com>
> Reviewed-by: Nick Hudson <nhudson@akamai.com>

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
