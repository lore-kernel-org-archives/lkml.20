Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747236;
	b=apND2PUnT1U6bpVQXFWRFtboMx1l0cG+tEegoAGI1cBD8stqRsw7k+7/Wyq49InXPpaW
	 7Lu57y+bZA1M7DrMnJBh0VbDfW7Qh/LUyxUBYhMHYlY41OauZYb73FEIXVPrZabtAmdwX
	 yLhlYi2Jv1LQKJhkj/qrlUCTOFRmA2XRAKsoKQzUGPNXaWi9NSOxI54tbZVXI7DAtUM2I
	 E+Be3Xmp4JpX4uHIcQRo1tZaksJLfunwLX2gUOvErWv8uDiqKNoJ1u21p0NznH5iHL14q
	 bygJ9pZYIEjnfS+2mB5az4+ywrd6exviNb0ZiGkac7qCX6YkzrahmC4GQgHS32+9DOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
	b=M5JcN2fZ5/fTgsQj9UHNLYQc93S5Z8PbYaKHkObQI3e/KOW2yF2SAsBn7Gvy1o8DF6Fo
	 Yq93Hh+yhNidDpVB25plrfyNlpSsOgu58k09uoS0VylX1Q04Uzy3T9rbNKUslCdlMe8hw
	 WyFC3gulMHS6Ig4FyKjx53/0CaWhEDNGP4gFZGDW7VxCDsgVfwbabCU95zAs0cUJbTWZ4
	 T6YOqj13yiFh/SFfpGynnMX6hdGNmWHtbLEhULxTquYgRNA0gr33hjg0aMdlv6OaU351E
	 fewubW9Zx9pvD8A5x0WQrPXett5TAeaDOUii4YaMb9z1bNnisz3N6IE4+d6CiPOZQNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F1hoXgMf;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06087606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06087606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F1hoXgMf
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so57345a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793747235; x=1794352035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
        b=F1hoXgMfAF0/YbEteRqywfhn3WDCOe4J+F7YsQfU+D/3o6FmVI2GwIO0WaM1ac3baR
         35ufkik72WxSbkFRY1fRv5bpxm5vqEkgCD3Ry3wd3KX4fSQ5h3k1T6JTywj8JW1BiUAN
         BJDk/LfHH0wjrSawD0qSpmMjDcJHLbrEs0pX7M6rHzXtfw6544U58ogzWEn0XlTP9WNI
         PX70yT6wNU8OUsv6fQPZ3psN/mJhhv4Al/IZiqXWsFzrMdy63A6V/Vq0RQBoDoDCESwX
         He1opzYj99jkXpfmO09oP2DTaQHyfTbXm3byGlSEnla8MbyTnxubrAvL/NdTbb8kIoEE
         65nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747235; x=1794352035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
        b=mZffvVqL5lfFHcxs6hdWGtEDeIVKGmX+FKFyKa3LoaPZCdXK7FB1Mej3fUVGvYOhcj
         QkhtgRX/ep9sk1SKbqkbtG8gojG5eWQCEnQXnQTgOhtuJWudFrAZIkB8qZEy9Np6YB8r
         hSQkbk4I0Pe2A0l6s+9+VtR4Se9Mr7QBK0I1aFF2hlk7zp2oPQ2zqt2ptaQcotd6bneI
         MLPDAQK7hyDFRIz1GspOtfPrgDZ1Fg8j5VZhYmF2GvpsaGqs87BknDalyjjNmPv6U20K
         Q+eFUGlfAPKo9HZqAjfsJsNIB66cHWpsFC2B5BqNUBWPTTpQYezFBlFfc++kPCFX8sCb
         N5sw==
X-Forwarded-Encrypted: i=1; AKwUvBxucxf8i0jZ3GxDQP3A2+wkj877SZDnS+GTnjJyQFbbrBQyt4bUswHlBZ9mMDgWy2ThdAAY92hB15VpQZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a9YC7LRe9t7XLdnTzgaUg3IdT+sICefaKVXeV4eyOvWCk5Vu+
	iMTX6HZdyT2310cm5H/S0ZhUMgB7RD8x/JQ4Hp5eUlU4vpvMqPHTj1Oo80oxbnGIE2s=
X-Gm-Gg: AYBFou15ZJTQTg32bwYuwIOIEn5tY43nSH/3mSl8at7fGuyxlWiymVJwpqMqIBHeD5V
	mlcwOpavXGI0I26TSM6Fosvuizo623f5ZpM7pUXHusL7dHw83WwacU5mr89ES4lHP00oxZEaaDB
	iA0+wOhPBJph/XV2zUnIBIIc8Qv012sylOnIUosuUsh9uwgXzc9+QnfgtoX661tElarUY61ltJZ
	dvY5G2GRpAXnOAqCdvuYry7GOjtX2Hhz5GBJiyExTnMgxSw7o9vbIFuztwrTBYxVYwMSyoVxoYk
	bpslD74c+K4jPjxO544NvESS+LUMptAoaU/3xijVXeP/HS8R8G7sUGwveKEUBWaDbAwyvse0kDI
	wnWFMDe0BgFLss7Uw0v9fSq0uSv/Rfv8HM3PWTGIzrW3NUJTFzcvUkfZWZPt+gdev7rg49dtVvb
	7pk8lX1Z9IzrjtL7CF6iaqwMbH8OZ6SGCrG0atT6ud90ehidbdcF0rd3izg2bcqBfizXK9gnYbo
	w4CDxGWnJJyg7E0jfs0PTZd6hnlUQWfUvOSG04BNW8aL8Dq3rZpkpLZpsNXSy+OCjw8Nci+cZVY
	b5/wOjK3sL1uyEkZYtBR8UOam8GP5/VKSLnjFA1sXQ==
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr10743037a91.56.1793747235227;
        Tue, 03 Nov 2026 15:07:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46444698sm276077a12.4.2026.11.03.15.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:07:13 -0800 (PST)
Date: Tue, 3 Nov 2026 15:07:12 -0800
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
Subject: Re: [PATCH net-next v4 5/7] ipv4: convert do_ip_getsockopt() to
 sockopt_t
Message-ID: <auppIKnm1NvzBIzH@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:04AM -0800, Breno Leitao wrote:
> Convert the SOL_IP switch and ip_mroute_getsockopt() to sockopt_t, its
> last leaf on a sockptr_t pair. The IP_MSFILTER and MCAST_MSFILTER
> bridges go away.
> 
> ip_getsockopt() builds the sockopt_t with sockopt_init_user() and
> writes optlen back unconditionally, because IP_OPTIONS and others
> report a length and can then fail. ip_mc_msfget() therefore stores its
> length only after its last copy, so a copy failure can't report a
> changed one.
> 
> The write-back also happens before the netfilter fallback, so an
> unwritable optlen turns any error into -EFAULT and skips the fallback.
> Likewise optlen is now read before the level check and the MRT_*
> dispatch, so an unreadable or negative one wins over -EOPNOTSUPP.
> 
> IP_OPTIONS with no options set and IP_PKTOPTIONS used to return the
> result of copy_to_sockptr(), the number of bytes not copied, so an
> unwritable optlen made getsockopt() return 4. They now return -EFAULT.
> 
> sol_ip_sockopt() builds the sockopt_t with sockptr_to_sockopt() and
> stores optlen back as well. This extra code will go away when we
> convert sol_ip_sockopt() to talk sockopt as well, but for now we are
> converting the leaves.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/mroute.h |  4 +--
>  include/net/ip.h       |  3 +-
>  net/core/filter.c      | 18 ++++++++---
>  net/ipv4/igmp.c        |  3 +-
>  net/ipv4/ip_sockglue.c | 87 +++++++++++++++++++-------------------------------
>  net/ipv4/ipmr.c        | 11 +++----
>  6 files changed, 56 insertions(+), 70 deletions(-)

[...]

> @@ -1711,43 +1707,25 @@ int do_ip_getsockopt(struct sock *sk, int level, int optname,
>  	case IP_MSFILTER:
>  	{
>  		struct ip_msfilter msf;
> -		struct kvec kvec;
> -		sockopt_t opt;
>  
>  		if (len < IP_MSFILTER_SIZE(0)) {
>  			err = -EINVAL;
>  			goto out;
>  		}
> -		if (copy_from_sockptr(&msf, optval, IP_MSFILTER_SIZE(0))) {
> +		if (copy_from_iter(&msf, IP_MSFILTER_SIZE(0), &sopt->iter_in) !=
> +		    IP_MSFILTER_SIZE(0)) {

The line wrapping is a little weird looking to me. Not sure if there is
anything that can be done about it and not sure it would be worth a re-spin
just because I think it's a little ugly :)

Reviewed-by: Joe Damato <joe@dama.to>
