Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746916;
	b=H1nvITUJkRyf3Y9m72eX6yCZuqNTgdL+gITN6NxKa1abHdb3XX2WcuqDRVoVMrX+4JJ1
	 NSb+VcoRXRCuomyZAHXClDbk9ozgs0ANFrno0bmLfbG4r9x8Kd0znWX/m+thsO2zVbXNV
	 QCIghUa2J0ChPoQzkXGAPMf3HjTWC4MLuPfL9rENKwIR4XOMqgUGSSNHFG7zP1fOnqRml
	 r8OPucqUT5wb3iWt1w7RTc2cEOpviqJxTjfWecXJOoiYjcKIBmjXPuAq2vClYfqbQPJCN
	 7lDnVkkhuWnLxq7Ms2F66ZOcu2PPTo1m+5Jmxegepe3PkjJAmTkFGfWTnadE101DrHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
	b=OITDNUjuod5NQ+2LUd8y4ttnFp0YtjlZt9E8l5AiRlsuAq8jd4Qnxtdo9s9KrIBIh5Bv
	 BF+QJ/C9Ta2AzMltKEKITtTIh+9gFYQUTw7pQh+gMuWHpFASDlToVeO0AtfFnPtZM+vPW
	 +KHgQsfV5XJA+7n1BkfPaLdL0nteUHSg0X83vPLWU/+RZTNekVn3muyoSBFVzdMJHupQR
	 lmKuUhGRop/+xS7q5CGPJ7gmNoRISxp0ukMUMxVBI6shIBVOK397kBPlkvPia2ggl3/PV
	 k9vwJrp4Cm0KjO7kLilF3ajuopm3PEjGZ7wzKbjGCC2JX5GDu/wqbtSVbSyprv4tGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ejRuknpl;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63052606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63052606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ejRuknpl
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b057ce79cfso4304b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793746915; x=1794351715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
        b=ejRuknplcXcfwh/9Pm+1q3vC/nC31j0L2g1hQblwJK5OkYf5XMNQaLwX98fSc4sKPS
         GlGaL7l6UB1isKdH4qlooC+Q7NTE/7R/+LK7iPuKGYZKvFhIFGKvch7/tJ9JAthzMqQL
         iaLieomJSBX4PqAFcgGvzCkJXF+dreeEghrYzYAGGxv1MsYwsMuDtVSR82SSyBtnpJeG
         8yasj4Bk3K207rozuo4ZDf4DHexrvySyZbWMt2T9enCtAByHAXrniLsAkIwHMYqNx6Jq
         nh98owGBBQTmXS16EiJEm2MuE8QXnSZGqCoqXCdtVja63JIZ+TQsOqu7RBjmdqK4JRkF
         PNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746915; x=1794351715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
        b=LeT0ygwsWXWCzbH6lUuaOrljuGlmYmh3xFJeYAiBIpc0sl5rTr/agyt8JyQoQMhR+g
         Q52kglQRzvZKtsNSm6j94waIQ+oGSPYBnnSHJNvKFtIPQ4Y2ODMWJplf7hzDCXEu+dAi
         EPEb9PJZ5qHltPpPh19ESgr6lYfWYReLEGYd9sEf2CM63w36YrFSO8zEV6cH7YZr8lp8
         yasvHwF9D7PIhgbqU+xlocJyUxcchXDEoPjBscppnbwTQiCB3V0tI6Ea7g8TdqCEdWJ0
         QWxUmgIF85Dc4RL5icbntgYxwNSuVcjckPSNw684o8D/HFfJaFjeKD3cnrPwLa6GSz5a
         oH9w==
X-Forwarded-Encrypted: i=1; AKwUvBxvLl9vbwnppNwq6vTRr/t9OtcDAaxhUkI6zjYFE475hT9jjvIr+n2Ff4VY9UVdKqa8ZMKTG/CZYv5R8zY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EoeTSBuNATyOdh4VNMyeGD6q86MVGOs17MzUQvWE2IwdAjtkX
	MHi5TFUv9qQ9tYOGYndCa7zPOBG5edDYzCAqo7j3mRsNpmBD/EthUj/XSV+ECdSkP+k=
X-Gm-Gg: AYBFou2d4poABLXEZTk/UGFl0/wYprD8HCSfalQ7Z7wvcE61JXZPa7F998s3HGbZdC2
	pHXe8boohKUYFvUNX0epNZI0gQ9ou5vumgB0FNNpMJQmZloPmGOJiaEH9i9mlonOc+nNGGoq6Ho
	JEYR2U2ruDQOh9vZxRb0yco4nRBa1ATKhLXbvAsXbTwHQ6GR/DtSos+27e+PAyfkdXCNHbACK+h
	UdWf5H3qx713ZHuUBes+B+xxBvMrkG4MrU7dnM8FftvNUEy62Vd9/PkpE4+TwRKTTk5rlOhahGC
	SixUh5Ltbk1QlDrWuKMJ2d573QCDN8OjwQKkP2ciHIjYkAi3MoUU2hb4pMntsHvUgNHaNvGT68M
	k3HMQOa99/tWdOSVJe9a6cuKkir2vURMS+ww0Zix4MH2QYXGllaD+JHO57/9/1phUcSgv20dQXp
	r8cSOODw8wbbboVdaR5KzLBB8s25twtf8uqhBJ3o5TuEZku4a6uCcdQmdg+3/b+YNVPoVWMX+7y
	sXqOPvzkh+EEWu1n+4FzfSd6aUj2ObYalvmQKfN9mnMtjLFeb33J3x93w5YAfbd1soPCy1k1r0N
	LhPflldzkuFfTGyJHEnYCnwuoIUHY64Ddv1FKnje
X-Received: by 2002:a05:6a00:28cd:b0:8a0:4032:af85 with SMTP id d2e1a72fcca58-8a9b7916fcdmr12491838b3a.0.1793746914675;
        Tue, 03 Nov 2026 15:01:54 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe108dsm161105b3a.6.2026.11.03.15.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:01:52 -0800 (PST)
Date: Tue, 3 Nov 2026 15:01:50 -0800
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 3/7] ipv6: mcast: convert ip6_mc_msfget() to
 sockopt_t
Message-ID: <aupn3m8q2oAKeQ59@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-3-2d36da923578@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-3-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:02AM -0800, Breno Leitao wrote:
> MCAST_MSFILTER reads its reply through ip6_mc_msfget(), reached from
> do_ipv6_getsockopt() and from nowhere else. Convert it, and build the
> sockopt_t at the call site for as long as the caller still carries a
> sockptr_t pair.
> 
> optlen only has to cover the fixed part, and the real reply size comes
> from the gf_numsrc field inside it. Userspace relies on that, so
> sockopt_expand_out() grows optval past optlen, for a user address only
> and only far enough for the sources the socket has.
> 
> ip6_mc_msfget() now advances over the fixed part and writes the source
> list through iter_out. Its callers rewind by the reply length they
> already compute, which is exactly what the callee consumed, and land
> back where they used to write: offset 0 for the native reply, gf_fmode
> for the compat one.
> 
> ipv6_get_msfilter() and compat_ipv6_get_msfilter() only store *optlen
> after their own copy succeeds, so a copy failure can't report a
> changed length: -EINVAL, -EADDRNOTAVAIL and -EFAULT all leave the
> caller's optlen word unchanged.
> 
> The old code stored *optlen before writing the fixed part, so an
> unwritable optlen word stopped the fixed part from being written. Now
> the fixed part is written first.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/net/ipv6.h       |  2 +-
>  net/ipv6/ipv6_sockglue.c | 64 ++++++++++++++++++++++++++++++++----------------
>  net/ipv6/mcast.c         | 19 +++++++++++---
>  3 files changed, 59 insertions(+), 26 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
