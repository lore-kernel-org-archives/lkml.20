Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747010;
	b=uDSLJD2l5avwtRvYRUXLNe9FL1kyAVzX7o8wP/IFFUj7tIByPcfyWyRBoAJDYYOFLJJJ
	 aj7+l7pDb6y5TYlx4oOKUU8Ag31Ayt94nWT0GyQTuVnLSdQa71zSrHNo8tzBR66DapfTd
	 8qG8a1mGF0rCKGYu0bCcMmxLMD2+jzpvYfs1j1uc6EuAtWrJ2Wnj/99VgO8JD1Bha0Ln5
	 P2ZzJvBTteCdN6yfHi1FR6ERJmLDTNr8wqY4uOiT0uJx1xY33kLTKMR19RGudvtYRHcQ4
	 VLn2LZGfiPTw+CAdypMwIhuMcnNGo6oNhtcA0n/Awced9F0BZs/6Mw054+IUpXEo67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
	b=mlzySE/VIh73jdMg6BJvb0mWNYw2mjO8/ONJt2gtWyxk+R+QfbgFTBZsT5Fa4t6K6+Jg
	 xkKsjoBOy5xuBW+0laAnDAI1lPve/SgHVGlAEyPJ3OKu0lo5H4ouO1re3zfjIqCvVgLZH
	 bDL3Kd3pSw2hdF98nohcIMl9oVNQYj5siv83NVXhRB0BbqkMssv6iZ5sNHTh8Ce1wL4Dw
	 DoFabow2mm/rMr1ZmeF5QRZwe8Ov424lBDgeO4b6dnSHfG3Hp9Ikz7MGIq4L5wctPoDed
	 76ARg4Bagu+jJQ/o+CzkT5Xy35UdiKqI6COBc0s7KM5Lc//sI30S3kh6z1ciM6NlJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kpwSVOrl;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1A606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D1A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kpwSVOrl
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso423525ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793747008; x=1794351808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
        b=kpwSVOrlE5nr+/Gbvw2ZwoGd5KDAngbKsPFGSFjG5uZDqDrVI+gLbg5Ff495N25ok1
         /MWhAAh4jBKMFUNyKUGu2YzW9+2b0TL8VX03ypiXw4ssVIJKJ8NdQIdG9nN2L86viunP
         0GQeIke56pCMcajWzsKXoEzb3qyZLHuNRs26ySYLuk5afWNHqc2hxHe5Kj87hslle2R9
         0HqfFeDQeQaCcAimFol3FR5VaxoRVhOlwEu6ZJ0LDsrXDvONJ+G5lXTb5IuudPJXXsHu
         iX2D7vhnsn0beYOgAG84IpsrPPkPEpqzt74z1aG7nR8CPk+sBemoQJWqRSQwhJAJ/2x4
         soxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747008; x=1794351808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
        b=FpppxWWuD0jApgz455adnt2sLQUBiCyJJctBBHyAbC6ks7gzWGQtBM9Y8EmxaFRtAA
         Si/QTo9ALEgMO4uI2APXgX2bNQfz3vwd6b5mNTQOj9YBUCGnM6aZVq2ZnC1oEzhkdzSh
         c2hnrBD4RoHrBPNxmgHe+inQ9Dwh0ol9i7xFsDQnMMTyuV0d107BR8Rr+KsHse93Cqvz
         9fNZWelh34smttGfNZzPHZu78ZAc3kAFuqst8WoxfsRDx/qB+A1sOHTzjZyoGvYrDWj9
         IYQUqS1qvsNuIWHEn/0Ap9LW+2/jqUtMOlGWuD3Of9p8IYlaV6OoowgWpzaZL9MSp05n
         1Xew==
X-Forwarded-Encrypted: i=1; AKwUvBwvE1UXsguG5XVRkM1IqIVtKyUn1VFrsXb6vCgSiyVQc866txf8Y7Hh9wCv2tdqREHfjXs3vZUEKfU84J4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qaHrkatH0c3ugfvN28Efwfwqp+V2S8dEMz+u/qw1juNT92Jew
	r6wzY/pp0GjNbYmA8tmhBcao4Vy9uS5XmFr7naLggh/QnP2FFH5TP42aBdlFHwz/ZEM=
X-Gm-Gg: AYBFou1FiJN7LyZLNfRoVJVwmxfA+I7ZEVLA8el+PCHO+drcLp/kwt/Nan0nIUi8yJI
	U/r+0oZyzI/QJb2SOY0YMUa2tfiHi5XK3r+KilsFdGrRcpPmU4cP4aJJsxCxDyKzkFD4/1SXtuN
	+3wJEfV41qfBZIWCMkcacFKb+MXe/EqweUy/hyuVoWI7BxhiarvM3na83EPfjMsY8QFsvlSOHkQ
	4FYKlQJU3n/Osx74R+DMaTWggsI2SSa40d92hdSW+Mt2L2bV0B+AGMfOkiWHdy4eTI2VPOSKpGU
	x5LK2sQ2vvDJNOxx6A6OtAxPFygOjV0ysVLDNUEqi6P1Ha1zxQ6Sz6qIheUYNvZEfTL6dYPSdmv
	A4HR3N2mUt6zIX7qY9eamxUqCzS7lpvkaiVg30RQCf/nNq3LL8pqGEePZKMhBhiEN7X8k5seq+d
	LnKVhlfRKItLEzas8YGn9+/+05oa8Pm1NdN4G0Jz55NVKRm51Iuo8u3pu9AqdtIkxQNyDZkIH6O
	UKB4RYUuIOumEI1FTnaBimnqP3ZN7oF/isI/IB0cscCV5USVIXEtpNAMAN+qwWTlYYzWNB0CTac
	TJPAfcQJHVm9rY0s61McaEA7ZyHkjKps5/BCKCxALA==
X-Received: by 2002:a17:903:1cc:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb364e0730mr142081315ad.47.1793747008425;
        Tue, 03 Nov 2026 15:03:28 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091207dbsm301785ad.49.2026.11.03.15.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Date: Tue, 3 Nov 2026 15:03:25 -0800
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
Subject: Re: [PATCH net-next v4 4/7] ipv4: igmp: convert ip_mc_gsfget() to
 sockopt_t
Message-ID: <aupoPbQlx899hNir@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-4-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-4-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:03AM -0800, Breno Leitao wrote:
> MCAST_MSFILTER reads its reply through ip_mc_gsfget(), reached from
> do_ip_getsockopt() and from nowhere else. Convert it the same way as
> the ipv6 side, and build the sockopt_t at the call site for as long as
> the caller still carries a sockptr_t pair.
> 
> optlen here only has to cover the fixed part, and the real reply size
> comes from the gf_numsrc field inside it. This is nasty, but userspace
> relies on it, so sockopt_expand_out() preserves the same mechanism: it
> grows optval only for a user address, and only far enough for the
> sources the socket has.
> 
> ip_mc_gsfget() writes the source list, and its two callers write the
> fixed part afterwards, at the head of optval. iter_out only moves
> forward, so the callee advances over the fixed part rather than
> addressing each source by offset.
> 
> The callers then rewind. The reply length they already compute is
> exactly what the callee consumed, ss_offset plus the sources it wrote,
> so both land back where they used to write: offset 0 for the native
> reply, gf_fmode for the compat one. The bytes are the same.
> 
> ip_get_mcast_msfilter() and compat_ip_get_mcast_msfilter() only store
> *optlen after their own copy succeeds, so a copy failure can't report
> a changed length: -EINVAL, -EADDRNOTAVAIL and -EFAULT all leave the
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
>  include/linux/igmp.h   |  2 +-
>  net/ipv4/igmp.c        | 20 +++++++++++++-----
>  net/ipv4/ip_sockglue.c | 57 +++++++++++++++++++++++++++++++-------------------
>  3 files changed, 52 insertions(+), 27 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
