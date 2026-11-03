Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748773;
	b=zMbNpcULgap9bA1QXtNldz+vPHUCtYYm+gEtxeQ9tDWA6QeQjUdjNWjtd6dTOWr5kRLj
	 /tudWj1fPKLRP5+1MjsIwvOBmViieXkH9TYzgmEeOKn0MEBx75EZjn8XQcMGIYimhyrqV
	 4lfpUus5rFxPW9Inrcl+QZ7puvLlBqtRL/XOVJChzKgLyIzzGVIwxZtT7AbXrd9U4MKCP
	 /2KFURRpTI4vNiR7cr3upS7cxb9Rw69b36zPS+bFpuw7ehVG/WLvGanW2LgMa7Nl42v1D
	 c1OfE7Gq0r555LIsCbS33HFi8qiyYI/jAJeuq2FsZi8WSCYRDMtLCbs0yYMUwzzbbwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
	b=s55KRMRbPM9/aIYVM3pK3RIWBvil1eOaESHsI/+HDznBXC9R0GdpsMqTUDMzqpAmqfhO
	 ft1PWg7KH0vSNwkdHrFchMaqAiUBnBzH38FeRLoOy3yc/VQ0ecs3RW9/Z4EwCtqIqRhBJ
	 mLQGmdJW9xM/8Hcfivcxo2WulTM/buQc4cQ9ZuBwoYI/QcR+/3SC1d//GOV0rsZmyEnlx
	 MX6+pxr9g/eAk6jQrsTqUVSng9BPOqRZsDjqkc77tIzRykE4lmSU1W0JUdXIGLh7MIHU5
	 tFLm+NRI7h2u8FsdUhaC6wO/GOEyrY2ZS8nuRHddGSewrucWmXnS1mUn9ex1e3s93ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAm9GhIv;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F27606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAm9GhIv
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab41538192so152631a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793748772; x=1794353572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
        b=KAm9GhIvM1i3lQ09CP6GFl7b6KUngZUbIdfMCDVP8Wf6Dy63FBDa9vkG+6GSxV9tUI
         WoVuXlmyuu8mTEXG4dXlKdpE88vjFBSLFbYd7ddyTXWEnX5Row7dRvJ0IcIEs8QprX1n
         R0kYIwLZaqpi6zAySJPBGlDz6r3AnRwd5tt9I9Nx4nzobpA8PuifSRThpiGEdtritx8O
         x+2pPBOxnJkXR2G/YTun8ZoZC45aYX1aJi92PUgdu4DgvPSwhADCeqo2pYPiSZ6OFGGH
         VcsyWyoUFWBz7pGQ3H3gfJ3jTl439DsVVTAQzseRUNXoL03a8TyJyc40KM6t2Z1ThQ7d
         6P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748772; x=1794353572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
        b=eoZiD5ETb/5JYDafbdIkrgX+XOEejO+plXgiwOasUZt4bJFixG9mebyBnyuLPIn2vw
         6bVj4f8DF3KCQs2Kag63QVgAvQt3aWiRysfsyYqROLjD8N8nLaKBdpi3mc4O81nD3mQ+
         657DuIeAV2+AfEOl9+5hcO9V6dNkEOi41stmSo1ZzgqNjYofXf0raiJ8JzfbqqiRHfn0
         vRTq6dA9JacfM0AIDaQVAc6H0Vg4SiW5emdfZEJ8ZCjPITWySPjG/dPtGWh2VgGpa5G1
         BBS0CXYx/+uVkBn13cqII7A43B7YK4gkIgWwbNodxfbIE51wTHe6n0hW80WihQSfXiY+
         ZH/w==
X-Forwarded-Encrypted: i=1; AKwUvBx/Zs2kYGEBFMAzeyJtQoXQiXPkfYALOWM+pn3nQTyg8o9QYquNBBFlTDKd3U3ZLnBZJj1yGlu+h3XTl+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BkHo9QtLJEsH2LD176NVca4t//8+qyvsCCQY/273lh6KxzuDj
	XA/dxluBw6OezFjAjmhoT+u0KRIjtdKSvQcc+cEF1edQlzbJcfVq+mtVBfCtJJldqlI=
X-Gm-Gg: AYBFou3nVlYcGJTZ4qedrjxCu7qxw7f+pKuwyP/usThxSvysZ6iCeIo1suFi4mW8CW0
	7PDHSqmmJQkMNLZ7ghzASSHJXG+TWK8AUu6VpNEo0aG4KLcF3/H2a3iLqE2o7MmD0go5h0QBqfb
	q7XkSqvje1p5tyBzYMEu1hGghjLfZSlBXDK2Gj7/W2n4Wcy5t6WT0sEwsoaLQRonOzUPY1iOW/k
	EaWCgyAisyjDe8RZ67gTrmFQ6ynL/qiUsKbuJfk15dW83/vZaqAtNWgdh8e6NLGkidOSRZJJvvM
	npvwRnp7ehgpv5DZGJuPa1ujyZrTrdycp5uD96dYNjLSm++pjxgC64AuV7/iS10aID3/5lC5GTD
	JdA8rJvk7Pm6aMVgVW2leVBbb5BSI8vWCu0SKtHKOq8PC374l6gcWJz+ZyNmcCPQap0nT4l9wLe
	6YTZ6CU/twEg+LgQppZrQg8NwnEENI06DYWZ9lAAIQCOsn/Miv7SuqHDa6F5TPP6TdY3tUO8oNI
	5p/kJZ/UAgCMFDHVm3tCGE8KyqtSE6fVNMSHq8XbRiAsrXC+zjEUXslDwoFwSmWil6ORxJsYVZq
	lUiFVOkqoeRG11twUkaJ/hEP8qG9hlDZ5npcDeqymA==
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr12303028a91.56.1793748772265;
        Tue, 03 Nov 2026 15:32:52 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm6343342a91.8.2026.11.03.15.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:32:51 -0800 (PST)
Date: Tue, 3 Nov 2026 15:32:50 -0800
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
Subject: Re: [PATCH net-next v4 7/7] selftests: net: getsockopt_iter: cover
 ip and ipv6
Message-ID: <aupvIuOSQpv8nJ5F@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:06AM -0800, Breno Leitao wrote:
> Add an ip and an ipv6 fixture, pinning the returned length and errno
> across buffer sizes, the branches that answer empty, an unknown
> optname and the options dispatched before the switch. The clamp tests
> also compare the bytes copied back, not just the length.
> 
> SOL_IP answers a sub-int buffer with one byte where SOL_IPV6 clamps the
> int. IP_PKTOPTIONS and IPV6_2292PKTOPTIONS want a stream socket;
> MRT_*/MRT6_* want a raw one.
> 
> ipv6.pathmtu_negative_optlen pins the clamp of a negative optlen: taken
> as 4, it is too short for IPV6_PATHMTU and fails with -EINVAL, where it
> used to pass the length check and fail with -ENOTCONN.
> 
> Only the two hop-by-hop tests set IPV6_HOPOPTS, which needs
> CAP_NET_RAW, so the other ipv6 tests run unprivileged.
> 
> The MRT_*/MRT6_* tests skip on a missing /proc/net/ip_mr_vif or
> ip6_mr_vif, rather than on the ENOPROTOOPT the switch also answers for
> an unrelated regression. A kernel with CONFIG_IP_MROUTE or
> CONFIG_IPV6_MROUTE built in no longer hides that regression behind a
> skip.
> 
> The config fragment only had CONFIG_IPV6_MROUTE=y, so add
> CONFIG_IP_MROUTE=y for the ip test, and CONFIG_IP_MULTICAST=y, which
> IP_MROUTE depends on.
> 
> MRT_VERSION and MRT6_VERSION are spelled out; linux/mroute.h does not
> coexist with netinet/in.h here.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  tools/testing/selftests/net/config            |   2 +
>  tools/testing/selftests/net/getsockopt_iter.c | 372 ++++++++++++++++++++++++++
>  2 files changed, 374 insertions(+)
>

Reviewed-by: Joe Damato <joe@dama.to>
