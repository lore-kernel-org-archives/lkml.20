Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734406;
	b=D5XAhdQ9BYAaVbUbhC10GoQE5rew18TAKMPmPv7URuFYv262Glm9wlzfrDgKiP0UHUOA
	 TljPN17Z5GjKKNWR5V1tMl8pU5aRtkbBjJAKEcEg9lnM6FQPQaSPkLdP8QH/I7We6aAzr
	 aEmfS+E3qiMBU3Nxblsnn0UvXlAEmqElL6mCxSAy5yyfWNi4V4dv3eIaoaD/faygNq5GM
	 0gZFtrIPwmm6Ps9Hia+G4BmzmlNLIzO/Yng9SHtQahyrAvBC3J7LnLqBFYP4K5bg1ah8A
	 oS2MEExHvWoxIxdEM1TfB/mawrCzHarMXRwx+Z9BMrheSMbtFjlUqF2yfQ5YNeAjkNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
	b=JrcBtoyyP8Vc0bfKXhh2MYNNyFI/6pBmnv4RODRhx5apIgAvmw/12aSNEV1ZQ1+zZ0Pr
	 YFlS32V5dF+wb0EHF/h4PiWF3EakF6/FApgglQmTxUt2tY67AXdr4mVv5DssdNuFdvHe2
	 v12GYqb70+ypgM4ypN2DJ9kDuNgiEcwoVXTlmsfCZ7rBpLgqlSp0oaBUAjNj+vJur7O7Y
	 jATLn+oZE3A0/hgQ1Fzl6I8L2j4yGc0gaZZpkj2zhMAsxlzatcG91aP0OPUxLC+0NDX/z
	 T/s+KYhPUumLSkJY77vEfXfbO4ZvJ+19ITK6VyZCnHshbSQf7/XEUJcSmwUaS1nY+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J61wv2ex;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB4606D81D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BB4606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J61wv2ex
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1789925eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734405; x=1794339205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
        b=J61wv2exN8htNK9lYuklAxCur6wcv0gV5hEC4LTnv0vsbzjE6WiHCt7vWZjwAitqGZ
         Z7QJGrGIyNMASgr4gdZuZj1Pu4FrPDgNq7pR64TF8oxW2MfIBxs8YSw804DfE+kcoqFa
         Z+DARbn0OIX1wVOExotXpAuNN6Bq0mUytJTfXlWwhCDJKVjg6shwf838sdNKtiGXZtNA
         kTL3VZ2irXkBCgWt7lgX730fCFRMNjbgrM8zlymS/OyKDhqfczbPlbUjQgX4NgsTN56b
         nnhnk4sJ4BnyPDMipav7BMCwKwX0BrEMBZAwBM+9E1xFpuf2BeG33U/EQifOTZyox99s
         xi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734405; x=1794339205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
        b=lfb8pTa8ZNtfnwPhObqNQF6z/Ofmyd6V+rHhlm4kLFqN7RS1gQ9Sj6FAnwca5/A7B3
         TJf9cIWErJKkoGZUo18r9MGRl7kFAbeI45KB/OpIPnDNjyN4/D37ZHv6i4tcoy7PZWcJ
         PqyrFlVi7WWpyOoqFzNb5aScTlrxQyf3tSN9Ysd/iuEtf5uhzFXFVl4nSGrQmneGPYs4
         Q+fPtJ/BogBgoOnd9gVoMOkzwy0zzGwPuI6qJ/9p7QZUim0qyxfHdoCyrzkKqbdiNLTi
         THuE5iBuVskQiZ2AjW69aF/BOAtIKGIzgme0KQ11b3gFiJqWUwI5v0eopuF5QlyIyf9Y
         qyFg==
X-Forwarded-Encrypted: i=1; AKwUvBwRhNX6omOewMouWm9FIBCmvRr5tIwM7YkUkXCICH5Vtq2zDVhwUFOGSXPgkq3P3zF0ntFUeQr1m8wP5jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+REj4/cQphovvnycENo33cb9MevfCtIBrh+ireIT72tvMZ4OCZ
	axz43MNHGw57r1xXtIoCA6+t3LJ8UMEFfdVhE2PXFp6763fYfzhHJ9NZ
X-Gm-Gg: AYBFou2SCpgwIyCmVtkVSyj1AXrhY6n6dOBOKnQgfBdZFe2eUuta/03HKRzxcHuucgI
	Rb+HZkvqcTSpQheircye4O5hN5CFnpb+XGfORjo3wKPuAvZxdutBg4dds4eeWyLOPE0TmVS9HzP
	FGdPL9S14FTqnRSFP/1f6Q9/8d+GY0whp4ljPfbqihtTrdjEJTR1ySaxZahgSGApJTQ1yXsd0b5
	hqGrV6XYuCVsNIWBD/3D+AEugMtgtDPc2yXgpxsfB+GDwD2G9zR47DxtSVbb0mbAcQjLtXS0gyS
	FNTE2F6/PMx7498tHTVLSlC7vSTob3c+PqKlldQ8b2955rUErxNbSLXVBJLwv1EPq54BW+kDdnV
	rhFYt1HDET1+ICZG+OiyXNJlf8xciaE6JsWe1ayrXsfmTThRzVwzSPaRWmziHsJa1OWWxoLfND0
	MBH8G7NLdWKEg2xP4IQeXxo7+3BvIcCY69xkuAVa2dalBc+4HYw0XMHlmgLNof+NQJI+RtBnRfF
	2Wo1aA2B5JpT3jLFL15s/MUzvqIAZ8usQ3QvPwd/x/FTD+au91RasrXewHx+XQZED0RoQYQp6Os
	aM+OrYqZhy0YO46zhcuLDQ==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr23017109eec.18.1793734404871;
        Tue, 03 Nov 2026 11:33:24 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm285396eec.4.2026.11.03.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:33:24 -0800 (PST)
Date: Tue, 3 Nov 2026 11:32:55 -0800
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
Subject: Re: [PATCH net-next v4 7/7] selftests: net: getsockopt_iter: cover
 ip and ipv6
Message-ID: <auo24Z7c121m91VZ@devvm16445.scu0.facebook.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>

On 11/03, Breno Leitao wrote:
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

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
