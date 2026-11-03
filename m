Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742308;
	b=05uR3vJrLfTYvI8no9Ami4i51iLCGuJDFaXZFa+T5rx9pf6MKEePePMDZFSDLnjrlHX3
	 ZguKRHE1iYF5Jtvp2sVmubsXJVFRbtG63XMQ0GxZAmHu+/PQFgt7sDeS3/TSAs62YlTAh
	 DckPLhtpI5doYFbw6n3QkZWlYmIzTW62yuZiEqd3MEc6HR2nOiTwHiYBEK658gPUI/hkF
	 a1X+6KPtMGqlHCK6dC5dvcHe6jdk4EeHx7/dzoqvEf7ao+SHgCnQnzwWKf4qaJ4yehXPb
	 5C7IrDBUC7KsqwvEjxVLU0GYWMQg8E4mHH87jfVxlFL9rZefIGKmNXcD01W4LFb5rrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
	b=h6/QjU+MHxciFqE9ueypkfQRkPwSwezEocifpM5rLNfoW/0BHjdDFsOPhqP4TCuH0I93
	 bkS3BSbtVXcO/s7hz47jRfxPUWnPWah19mcUzPREV92p3L+Mr28+IkNCujqt96X3xVIXv
	 EjxcwFOZdYA4qH34I0S+ZXqjJo6iPU/Ap4PLJj5OeIPjeDlhsbS7J5DUASayGBUp1ZvJ3
	 VBjazGXdguMtP8MK/4NGNj9mg1cDf6rqQemk5DUOcis1Smv/eRtjGNN8Jmc2SICuCUQb2
	 DXavahrOXY1epncACwj4tw9JpvknA6K7RCERS3GUOrldsFc97CXUxbQZuPVDPvpt4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pta7O0Fb;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AE606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430AE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pta7O0Fb
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso852854a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793742306; x=1794347106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
        b=Pta7O0Fbv8w0e8LBRL1im8Q6uNXDtuEJIxVyW5IqEevEXa+Q1M2ZkaaA8t6UYpT/uw
         j6upPM7yggUu5MMTieBus01I0J/3rgB+FvADMK/lys9TM3/oMUmJU0EoE1M/YKS9bAkP
         ISauA7l/y2UUh8NGwfoNpwt2LAfyPUKaeujslHc8RY0xU69v+vhnbiUbOiYjJA7z8kJB
         wPOYTLpIiabkHMcH178CcxVm/XgnaP0yc0zA2r6+gCN79DmEYq3UmNCnPyPFxYy+Zgx9
         ifVZos1Aj3UFvx+jEGhuuiMiMiCbX0jbubaUh4+J+qQrc6launIT8JRbUYdte1xVv5Rp
         vOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742306; x=1794347106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
        b=CSxJozsV7Hy/ebOo0Eq+WVF6sQe6IHjWHZNBrycFZhTUVSBMQn0NbWBxflJPu8G6kC
         5a8XjYBtRT740DhVJ1Xp57X+xK/2rrC2FR0P2iJo2MJgNWtapYHH3rTHcrEWnPZoSmO/
         alsayMyrK8s8I6nQSkoNc/VTMglY4xMFG0tqAqWks2K7yv9xZbU4GwKIvDhBEtW92gYD
         wbKzLF1cWxU1iMjHyIvKXyOFngPSJiRfDWNcSSdAHoKl40SRZspO+HZ80PqzERRi2CUp
         mXPDz/VZQcvJqL7+cU3YTlKyF8FvyPUMDdWicqY7/adXG23lITNWYLz43/Zcat06fba9
         0a1g==
X-Forwarded-Encrypted: i=1; AKwUvBzmuV098DlGYDTPpCuP3MEbPh9bmqGi45nkT5OlkUTHSad90OpD7b01dYMRB7hfKwOFvG8M8Yhog3+0tqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iQ3Y1lGtkYhTXq5DU2idbW8jIShLkKmGnN4d33deRz1vcpJZ3
	XPBFm6aBs7dmqeJRUJ+FWaVyiv9WG1cS5xHHKqVbd9wEZmHqtbJLFUtHAP87mQydDNI=
X-Gm-Gg: AYBFou1lrn9+pMpkH6cTXTyolcQ8vu7r4DiG0YqhB6Mc7e+6vMHTznFxuO494JTU0Ir
	JYbtwPUy7Xy2bccC54wULKUVNW3vrsFBaafZewsBpIHmhixafT3P3ngKbYzZnmDcmNnTyn6E+I8
	VIGjUkAJ9X3Y+I+xzf0EEkWvMmUpYDF+j7bxwxlLp5uMn5aLHZ9YzMFhjVadHm6k9uy/NGLiXs+
	+V3RkZZJFQwjU2X3LWfJjlhQVNXoq97X8Pdl0Qhfki2lp9DDb1w1RWhVf6RlrsGt0RmfiAHrlq+
	BBS+6+R1MGq4mZO+K/SIy1vUM53bap5hpkLZFj3325YFitakpWl2PImVPY56YiGjv3KVMSbqTUm
	pGNoq/Hf2LCXPsVkkgf+h9QhbmMsTHSu9SHNRJ8uI6UrceZlQBVcHQc3aYDCCfGvDsekMyVRqxG
	19woFQmU4vIFVBjotTO/exMKZ4f7eu0st9DATlZELySIfEkB+di3QGUIcX9FiMh7M8JE0bkeRpJ
	NrP7VKx4fU0GWiTELTopozC9tDOUHCbGOs6F+Zqyl15XsiZ7I4bnQW3KjpGwnw60ws4A1aFeaqr
	HhuH5vt7ivlTdCPgJk6Vn6N9wZK/uTKtmoaCoqxCT+tSNkbCbYhojgNjL2gtvlM=
X-Received: by 2002:a05:6a21:3991:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e928634704mr8781404637.1.1793742306503;
        Tue, 03 Nov 2026 13:45:06 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b65fcf5sm120759b3a.41.2026.11.03.13.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:45:05 -0800 (PST)
Date: Tue, 3 Nov 2026 13:45:05 -0800
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
Subject: Re: [PATCH net-next v4 1/7] ipv6: treat a negative optlen as 4 in
 do_ipv6_getsockopt()
Message-ID: <aupV4R2eAVlgupXZ@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:00AM -0800, Breno Leitao wrote:
> do_ipv6_getsockopt() reads optlen into an int and never checks its
> sign. Most of what consumes len compares it as unsigned, so a negative
> optlen reads as a huge buffer, and the reply depends on the option.
> 
> The int options clamp it to their own size:
> 
> 	len = min_t(unsigned int, sizeof(int), len);
> 
> so getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> answers 4 bytes and reports 4, rather than failing.
> 
> The other options see a huge buffer. The sticky options reply with
> their whole header, IPV6_2292PKTOPTIONS writes every pending control
> message without a limit, and IPV6_PATHMTU and IPV6_FLOWLABEL_MGR pass
> their length check.
> 
> do_ip_getsockopt() rejects a negative optlen, but doing that here would
> turn a call that works today into an error for a caller that passes an
> uninitialized length. Answer it as 4, as the int options do, for every
> option this function handles itself.
> 
> That leaves the int options as they are. The sticky headers are cut to
> 4 bytes, IPV6_2292PKTOPTIONS gets a 4 byte control buffer, and
> IPV6_PATHMTU and IPV6_FLOWLABEL_MGR fail with -EINVAL, as they do for
> any other undersized buffer.
> 
> MRT6_* is dispatched earlier and keeps rejecting a negative optlen, and
> the netfilter fallback still sees the caller's value.
> 
> This changes what callers that pass a negative length see. It is a
> behaviour change, not a fix, so there is no Fixes: tag.
> 
> The conversion of this function to sockopt_t builds its buffers from
> optlen, which the standard helpers reject when negative, so the answer
> has to be settled before that.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  net/ipv6/ipv6_sockglue.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Joe Damato <joe@dama.to>
