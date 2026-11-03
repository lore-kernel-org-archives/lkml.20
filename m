Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734405;
	b=MNC63Y1B4Z2hsVTJ7c3D1TAKc1hUjdFhKrvEmsAZhID3fYxOZFXH8Bf/qbkOY10gcjrc
	 fC+vdfo8xjH0ew8hlcFwZT4fx0RwqoT5/Gl0anM4DtSYLQpef8YVFIomIuMS6anhyblym
	 mqEwUxUO3cUhtJ8dLYQzsNvunjIfFFEqQXDfuVfrV94KsA3DwDga8i+9qES8CFq1k1zId
	 1TSQkKBDwZQfkZumDCIrHKZRpCSQmMIeaz0xR6BAML+bdCx1YA7SRE/NU/V7ggiUrxcq7
	 FaRD7jsufBzYwD/7KMoDayyukp+W9AIgwJAQLUBo7cQexpAYTiTRYlD88SsLtTF6HCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=15RJraNkt4G9imlgns/mzHRKCrlWGmqvpmr2tllrIBY=;
	b=tkLRixgbW/KdurPzcP+q9MgjEuIO/w5WsKGsMZoAflB4ubDphvnaqIBvCs5cTM06utxR
	 cM1lDcRx3psCFZ1IKyINBmzDMJ2Mb0CRuO9zZmK9dBinyBTI1PrMhQFIedyUh7IClHaYg
	 ADf6PsLyB3wm1o7wJ6advPnFeVwuiQX8jps3OBu0IL1djlSE5TtC2isfBQRZI+8f6MEe9
	 uuLlG7vz3SIXOlBqij3AJ5isDKlFwRldw6mrP5Ya7QX3+X7yXjpkjZ/uYi888wMSG9tT9
	 OFFry9AxyRFycB/CIs0AO1jQkg03/IuB4W5mW1nRyaNOqnsJBpchnWjuIl6/+Kr7Pag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wV02aST+;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D3606D808
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966D3606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wV02aST+
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so2934846eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734404; x=1794339204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15RJraNkt4G9imlgns/mzHRKCrlWGmqvpmr2tllrIBY=;
        b=wV02aST+LnFuxBvV4bpYViFOafiBAI18U+cmy1u7/O8lBLjisx42g0f7VqlS7j6qWi
         fzZdeH2AtavuBEinDao1789fn1sBOJr3JreFzWRfnqHWIS3MgMOBh+kCvVGAjlYJmkjp
         QgfY3aVLjOO27toy9Do9VDZOcgWKHeLvUXUJt9+QhVCfgJ8B4pweYXZ1VRn20ajx22In
         N4rtQdS+6e7xZeweLYsATcu/Kuk3bCtZw5GIGxJKzMd7MVsi0m5Otgs1Yi62uqzl21Oz
         tUF7KmL6ccLm27Tb19Y4GTxqG+Oyz0lqfrSYtZL/ELJWt//50dFblUY+uRpGpFRRPic4
         ZEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734404; x=1794339204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15RJraNkt4G9imlgns/mzHRKCrlWGmqvpmr2tllrIBY=;
        b=s5IKXgU6w0nAoWUOdCnwNvwa2ic0aPQ+VzUGaMxzP3z+cpcWf9Mgiq8x1Im6Vee3/k
         mAxWet0y/MBdU6Op6apN1+JwcGpDb3LRuOokJNKGClnn53fLiimP5s3K66yjjwMhwb64
         cj16ZNyJK+6cAwN+jQCRlOc2ImgtK6FNq0JSkf2TA7LSAxaikBh5h2PTiFkkzW9gxZTU
         JtD6Ndlc4GkzSkt3didGpv/kczVytNDJ2PT/S4LrUgdTFyRh5rCls2PRJrrRrTqjkehh
         4ZmOR9XyyndDqqQgEM2eGvVcuA4R/fuXViy56q95aXykk/bq60/9DhDPIBGETNUNTdVL
         QK3A==
X-Forwarded-Encrypted: i=1; AKwUvBwF74BlhAaiyIxLC+UShHOwUlJWDC2lL5hs0U3Z+TkVufr0HtmPqKPwDQLaYTvNNNCnIdgs8GyQbpI2ysA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kVVmEhLGEbEI/BGmG5eIeaVfXsEL0pNa0ukurij02FpIxG4ZZ
	B2P6ouIExQ+0uJtelCIqi2Hjxs5O/n8j/CzCVbOM5yKRm/02yGwA81DG
X-Gm-Gg: AYBFou2llx7VzLD2UVU6G3o0+DvZOYDJVEP8aL1ug9dWhdvo7GvmeWAmkhUW43Jtrro
	gjOb2wLsVFO1/i3XVdi0EMvLfSZuU0IRK52mXSIa52cKiqRWQrrrstfdd4P7I5yxgwW36oAmure
	YsPpZErkkDmrweGqUb5h0b33TcB/p5I42hnKU2TliBqgzhXDS0Zitmn2cdHoh6eDjYMPIRFvl2K
	CLSAA0SNU5iYWb9cvBX2mQDkJH0Nv/ULwSxx0lqw9yVop0kTQVpi/XcJnORnhvYTDKTkVKr0pn9
	V0xf8AMRbobhU2SMCmGKA0zUaF028UdcCPim+JGc5TRgWS3PDSXgza73H7DeMNaTMuHewf/yFzI
	6NxIf7DOQx+bU3jIjcRMBstb2BtmxGaJM+YwDm1GOfdwa+q6qDu/Jbj28hxD1akUQy1M/vvLyqW
	Z9LgGTx8H0XihKVUbxEo21XwjttrtPeaj2qPGFr3B2wkVE3JJYnO1q5LeHGirT33i2orEH0S9gT
	Nscfb09BrRmR7E3jd+drTCXOQskUWkU+JEHQ+fjnbU8r/NJkxrZhajYUlmGESn4KXWIr5K76ilI
	1a9w2iReWn21BhIElvpS3g==
X-Received: by 2002:a05:7301:103:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-36c9af32cb0mr2691600eec.34.1793734403660;
        Tue, 03 Nov 2026 11:33:23 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm527244eec.3.2026.11.03.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:33:23 -0800 (PST)
Date: Tue, 3 Nov 2026 11:32:44 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 6/7] ipv6: convert do_ipv6_getsockopt() to
 sockopt_t
Message-ID: <auo21mFFkL2zH2MT@devvm16445.scu0.facebook.com>
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-6-2d36da923578@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-6-2d36da923578@debian.org>

On 11/03, Breno Leitao wrote:
> Convert the SOL_IPV6 switch and its two remaining sockptr_t leaves,
> ip6_mroute_getsockopt() and ipv6_getsockopt_sticky().
> 
> ipv6_getsockopt() writes optlen back unconditionally, and
> sol_ipv6_sockopt() builds the sockopt_t with sockptr_to_sockopt() and
> stores optlen back as well.
> 
> ipv6_getsockopt() cannot use sockopt_init_user() as its IPv4 sibling
> does, since that rejects a negative optlen and this level answers it as
> 4. See "ipv6: treat a negative optlen as 4 in do_ipv6_getsockopt()".
> 
> Instead ipv6_getsockopt() applies that rule itself and builds the
> sockopt_t with the new sockopt_set_user(), which sockopt_init_user() now
> shares. MRT6_* is the exception: it has always rejected a negative
> optlen, and still does.
> 
> The write-back also happens before the netfilter fallback, so an
> unwritable optlen turns any error into -EFAULT and skips the fallback.
> Likewise optlen is now read before the MRT6_* dispatch, so an unreadable
> or negative one wins over -EOPNOTSUPP.
> 
> For the other options, a failing call that passed a negative optlen now
> leaves it as 4 instead of untouched, and the netfilter fallback sees that
> 4 too.
> 
> IPV6_2292PKTOPTIONS and the sticky options used to return the result of
> copy_to_sockptr(), the number of bytes not copied, so an unwritable
> optlen made getsockopt() return 4. They now return -EFAULT.
> 
> The extra code in sol_ipv6_sockopt() will go away when
> sol_ipv6_sockopt() receives sockopt_t, but, for now, it only moves the
> leaves.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
