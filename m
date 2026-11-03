Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742435;
	b=KDSkQTbMHqKl80fGep3jvqMJ6bqG9rcoWXuegXusK6EP9/rk+zpWqUxPQJjMR0xeLPs+
	 Z9hPmmp93IHik/1To/NWIS8EEZft1p7Z7sFfk+9Pt5DD+lMl39ZEj+rUIlNJqfPGDss/8
	 8WqxyaDPuZzH87JXYF7WuWhLaAOMRTwKdqrrjPFf05EXU0by37854eh1eBO4hguY6QQI3
	 PCTTtCGzD3MqFNeUHpP0BhLNIM8ZJeScDPUSwabwpHayUJZefUWArE+XYEiuTnyiboA/G
	 WKMbV0N4bI6d3EGC5KmMZloWS+86DCeEiiJQmCIufGlcgqSKxHN4F8PNQpb1kaIGUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
	b=MDdT/RB7F0VrZJ8tg0omzOoBlioZJe+WuCckFfkEqsaOx2kQAGX99fAPEtp1jAEZ8g2l
	 YAIpY9voktvqgE5fnu+iO53tVdmDq4Uq9pDQOPWkPT3l5UiZh+pfPUNiXm4cDHkTMNAXT
	 M/yLpODwj/QJ9tPHiBILiwyw/RSJn1G9UUC2Vp1P5khkdFAoCjM4QXg0BfZYOIajqt/6j
	 eGmPNudytjpEz6krJNYtw3NKHGkWUU12KiIcDvo//p9J7GcAJiVYQkT5vzXZR8P6VuOSM
	 0SVshPRLTy4YZagZRd/Qnou4y/0UC6Q7fCuZBnKEyq3mEPYImUVmkEnMMUUHky50qQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rz9zp9i3;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF28606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF28606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rz9zp9i3
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso79858a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793742434; x=1794347234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
        b=Rz9zp9i32GrLsqYq1Wv4k+MOEXRHkge1QpJ7C6/aNofnyPzJwsED2mBJ+BO36t2Hut
         U/X3EX/P4yEQJBoeXN5o24QnyrjGOEkzSU+wtx5SH/xuFKBlH+Cty7/2p2y+FTtjgmls
         7I7QCjDZfxEAhev/iKP3MQSpbIsLV8Ph/6Q+DPR/n0huTq4GXHNbcfILEA1X4NPlfLj2
         ND391PjSxTHj0exOiD1aylibkcBR08bsztmT24DXhejY8LZmDn5tUiL/cjmU17IMgXiy
         Yh3kpGdUO96yk7UD5JPAXXx4ItoLfJNwcyTu4xlyq02RpXu59D1Buwn7SqITNQ1GbrHI
         y5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742434; x=1794347234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
        b=QBHxfjZWOU+KnWov5/eSjhyW1p4RWlzP9SiOh6AfQA920zYPlKPBVbBbJ2qAJJYmdZ
         RQnTRhEIxzQOs0iCT0/uemYYgUokO0s9J1lrK2gk18joERfX57SafMBOpv6uJHj1VCXp
         k159aI/pp7YUjlsSlj/Hd5c8+mroMhwiSnsd4FxM21szdNuTtWHa2C2oYx/JA6m9X1Xr
         rr3wgIJj0aW23ZUygacfaJB6m2beHNlMIVsAhiDmbtKKptErQ/npfPFt8NPD3pcW7722
         KOSiL5Dhh2YwR2TOfI9lWGHT67poHXy0lHHPviG19zAEUFtmhQl/gm+RIYk5rCfHsyrf
         MlPw==
X-Forwarded-Encrypted: i=1; AKwUvBx1uc1OWCB4iR0lSFmaC7N78Wx6mFUMJbRScaX+RHWwaPlH5jgAsUT8n8Ycmr47qhD5G+zd96t0WPsp0RA=@vger.kernel.org
X-Gm-Message-State: APuU4Z80zcaHzvzf8DTk3Q/2Z7dXexnnB2lFHPpBIr/PpslnqTCX3dCH
	iTzgm6nQy8iANrRK3j2I9MtKS5jWbKldjRk8W7ZXrCRwx6K9lmdT6p0vIbD33Ht15IQ=
X-Gm-Gg: AYBFou1ZQ6HzRH64cjwzgbvY2q1VGGFDHgkzOHGsdEMnfCn0pqdC2W9ZT+Ki0+84IgJ
	GWg43Syax0RedTa5RzliyVt3cgyz1JkvSKvAieAFTrEL5nyfXchzpMDbOUnyONJW2E9lDFOmpfk
	XRaFmrdpKNQgt2c927rnTMGLkhUyJkLB2GiqLI4fj9cUQLYFLaL0BawJrRnb8Icv+nQjVF8RvYu
	+IVx1edAcS7WovOzlW2ZH4zoxgYUza3KNdJdmoKJkrP9alN2QmYwGV4VbbuAlm3WW9DJimQqRY5
	nDV0tjU+xWlyFzFA7wiPj2jLVUbdrCdRu7wbCkufDdOv0nV9Mpm1PAsdVxXvoeYjV6HtZUx1vz+
	V+fiBjm4EsRrcaxwTmKGIAoH89cSSwyspEhzSzAQcoJx2m8lQILo+aRQPOlIbh60suXhyRY5FUO
	IL1v7V9VJGzonr//VSwvgE2hMBMxjVlZisOGROu9OrTX30rkdV4sKXwwhmqZLVMAPQYDIBAcJhn
	OCAhaeuvvToR9UPohTozsef/WU8+Czowpi1sbeU58pso1C/g/larYLEAGbSEFPBjlJ8/6q8ZZAn
	O+8FcVQUtgjjjfL19BU7y23lNdtWbiq/CDIa+iAGVeCF3EMKwkvhUlajzIrU3t8=
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr10608128a91.56.1793742434015;
        Tue, 03 Nov 2026 13:47:14 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm12790312a91.4.2026.11.03.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:47:12 -0800 (PST)
Date: Tue, 3 Nov 2026 13:47:11 -0800
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
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
Message-ID: <aupWXwkFZIQi7Mae@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:01AM -0800, Breno Leitao wrote:
> sockopt_expand_out() grows the output iterator up to INT_MAX, but the
> MCAST_MSFILTER getters converted by the next two patches rewind it with
> iov_iter_revert() once they know the real reply size. iov_iter_revert()
> refuses to unroll past MAX_RW_COUNT:
> 
> 	if (WARN_ON(unroll > MAX_RW_COUNT))
> 		return;
> 
> MAX_RW_COUNT is INT_MAX rounded down to a page boundary, so a caller
> that expands into the (MAX_RW_COUNT, INT_MAX] range and then reverts
> hits that WARN_ON, and the iterator is left where it was instead of
> rewound. So does a caller whose optlen already covers such a size.
> 
> Cap the size at MAX_RW_COUNT instead, before the early return for an
> optlen that already covers it, so a size that could never be reverted
> later is rejected up front.
> 
> Sashiko found this while reviewing the conversions.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/net.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
