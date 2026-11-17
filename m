Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900046;
	b=dYc95Bd5TSuNCMnT1BkdTqb+CZbQF+DNZ/8jhPk+eV5Iov1LcwLOFbxO+wQeHJounczX
	 Enh+sxvC+Mh+JqQ8lKZIKhiyUf8jMxK64WO7GZdYRDN6rzvnBgc67uounpVQciB8W1U7r
	 684K/4+z3tm9PJ9v+M1vhy2HgwhG+tNqvXKnroydCZ7ntWp6Rk5UMDu9byZsKf0VmaU4B
	 8G1ngmrskbsYQkmm2ZJc3FIpxyu3P3VoP9ps0zZKTkqmmlzSTerm1iQopYXLaXqDBVEZM
	 rfuh6gnfc9iX2fsgkyOcOTf9CUpER+cDW70ywCh6DeE6UPGo6VRwRLfBEeiSE798Zkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
	b=TELqHyehChxWgp8jl2TFGyMogTEU9ghh0gP6hdl/1zYcOFuA9NPQyN3sKzXzGhCkNWRa
	 jwEchIJlrwENkWwM76Zeac/0DMX8NZZQUhNXwj2hrsNXzlKpf8sNsWyUQWdO3s17swry1
	 Iy4KH/mMTq0mKcB7n8AkUF2T2mrZT15/FBe+wvx4kD/6ZYjkTOxhgjBl1qe/bc0ys+ysb
	 EVMrUKGgkZtY8foE66GYrEmbjWXWa4fsd74td4OXwhFJ9J0CgxyEZRTuQ4f459BgNKVh0
	 veMqrNGYeORSTkt5/KqqjI1rFf1oe1nRqkY7AzaV9cXhjL5WXSon0WW43SLeplti56A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=iMDYPIux;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1D606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E1D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=iMDYPIux
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26810995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1794900044; x=1795504844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
        b=iMDYPIuxcJhOnjf/IbvL4Bvjds5pxwpQ37fo/iu5CTvIPGB5N7mFHWgzFAHihy1egH
         83/yOBKyjxxKTG9bsZ8I1REZ/UnLcUikNT/ikodCrqqxe/aLP38al+JXEzOzT5qmRIxN
         uLv26tRS9IWZ8glqbYp1J4Os4afCJguxLfifvhJjmqzy2kUwLTnTUhSHpjeKYuoasYP/
         5m7Qe4RKZU3umVliDjANpxeuG7EOqfzLoJpTfXsNNa7WQMpFoOM9PJUsBzxLTwMZxzHL
         fRnvqziUBxSaE/jpLGGtnvQ8YUQZgD0elvdS9sEA82HKbHGiDBjVyqhB+JZjSt33IN7z
         YByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900044; x=1795504844;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
        b=zfDa+4jzOijCMspYvJKDPjMFulI2R3O6AvY2ruDrY4KtnegFM33oQwX4egU8h+mh33
         wr9Rybqsqe85gMtKf9Mj6V+AF12c6cfGUQjKHNE/sNtKtcwjEbOiDHDUrDNvLRJXhdDT
         4g7mFcq1xdb2soM4IOzMcoWGwIgfgGGsEVG0j6Q3K62azeoxspQC9QJ50VeznGOy6e4O
         RdwNe+igU33978UvVBcI6NQw5cgPgIvgNkzaEgOpRjzQ6ByXm9J0+1T6qKrnxPRZuHB5
         lFFrAOxt5JoYA/GtW1v3BisgDHtbNlGdtAxCP1Qg4y/9ml6jJqy2y9c5qcA3kYnddIzO
         +KtA==
X-Forwarded-Encrypted: i=1; AL+hErHMxkNiKACMw1861ajMEPjZk0VnhOr0jkYiMMr03aQOcyhy1tIHs5/rDI57xc9I7ljtP6heOuJrTrdC/vQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vhToQeuLlCPS9Kr8G0gb7HF/BTC8FaVGOqXiAHBP3D+bnU4xR
	CUrOfmzQEtjN/4FS5n1SJammMLvoX4NM8JgagNZYo+ABO0zwjR2AX2hXetRXAReWXgs=
X-Gm-Gg: AYBFou0eMRnFgLn5u4I5yhOj3bN2ZhsmVoYZZcE3olykJk3x0UwDPrcZjtKZvJakHHK
	8hmNuhVpDweQTeOu+KHbIPVKLYlNF6H3NT0AQ1xUd6xLbD+femA0c7LQRwkRR0Wuod0hhoq+W9X
	OsTPcuzJ4VABpDcEWx8bRr6O0Rw4rw0+ZhAhN2OZZO8ClW1VwsGNmcEyH/MmzElAQOi/QlFUwOM
	PF5IU42x9e+ZerSURwr0FsVnhEy4+ru8qNXhMy50rPpqiABHZ26kVoBieUt3AuFQ3cRXkNnKpjO
	CVqvse/ixEFpAoAGGwABqsDshrWWVTGGgfs/Myb0ngDWBgMuM32EgZnA2YPU4Cb+gN8OKP0PQfa
	BqB5HuLR6gLIYyN66ut9hcWYV4b5W5k822ktKgRfPPl1YFLA1hMD8Oq7WhP6LbL3iq9pLUyESpW
	Ip9q2JWN7Jycq6BQ+5ooAZtahKPpHsJfjTaHX1fg5dnheasWFrXb855bAOgE6ft4TZyY7UJiNsc
	LTbcrWO51ALKC75bxpAAnhYfFMwBfnhzmFMzlnLfiG4lIBIgV3e/vyFPfXfttAZIo3vC13ihXsn
	9r+RLkI+LZ/TT8H4B/c6XW9VENHlh3Hog3uZJ0HMhjhqADoHgUSdt5stmkQ=
X-Received: by 2002:a05:600c:3f0a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb55a702femr252699885e9.15.1794900043776;
        Mon, 16 Nov 2026 23:20:43 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783853b5sm47198985e9.2.2026.11.16.23.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:20:43 -0800 (PST)
Message-ID: <5bf25689-5939-4c45-8155-48e1fa4c7032@blackwall.org>
Date: Tue, 17 Nov 2026 09:20:42 +0200
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
Subject: Re: [PATCH net] net: bridge: fix skb leak of reinjected link-local
 frames
Content-Language: en-US, bg
To: Daniel Wade <danjwade95@gmail.com>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115130211.7724-1-danjwade95@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261115130211.7724-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2026 15:02, Daniel Wade wrote:
> br_handle_frame() passes the link-local frames it neither forwards nor
> delivers (01:80:c2:00:00:02 to 0d and 0f, unless set in the group
> forward mask) through NF_HOOK() at NF_BR_LOCAL_IN. Since commit
> 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets") the okfn
> only learns the source and returns 1, which becomes RX_HANDLER_PASS.
> 
> That commit sent the nf_queue case to RX_HANDLER_CONSUMED, which is
> right for the synchronous return, but the frame comes back: on
> reinjection nf_reinject() calls the okfn and ignores its return value,
> because every other okfn consumes the skb. This one no longer does, so
> nothing frees the frame. NFQA_CFG_F_FAIL_OPEN leaks it the same way
> with no verdict at all, when the queue or the listener's socket is full.
> 
> Each frame leaks an skb, and one sent from a local socket keeps that
> socket charged, so neither it nor the network namespace holding it is
> freed. Bridge, rule and queue need only CAP_NET_ADMIN in a netns, so
> with user namespaces an unprivileged user can exhaust kernel memory.
> 
> nf_reinject() cannot free the skb on a 1 from the okfn, because other> okfns return NET_RX_DROP, which is 1, after freeing it.
> 
> Call nf_hook() instead of NF_HOOK() and do the learning and the
> RX_HANDLER_PASS return in br_handle_frame() on 1, as the 0x00 and 0x0e
> cases already do and as vrf_rcv_nfhook() does. The okfn then runs only
> for a reinjected frame, which br_handle_frame() has already reported
> consumed and cannot pass on the port, so it learns from the frame and
> frees it. These frames were not delivered before this change either.
> 
> Also set *pskb before the new RX_HANDLER_PASS, as the other such
> returns do; skb_share_check() may have replaced the skb, and the commit
> above added that return without the assignment.
> 
> Discovered by an AI code review agent and reproduced on unmodified
> mainline under KASAN: an unprivileged user in a new user and network
> namespace bridged a veth, queued link-local frames to an NFQUEUE
> listener that accepted every one, and leaked an skb per frame. With
> this patch the reinjected frames are freed and nothing leaks.
> 
> Fixes: 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Wade <danjwade95@gmail.com>
> ---
> Tested in a KVM guest on mainline b3dfbde62cf1 with KASAN and
> PROVE_LOCKING, running as nobody under "unshare -Urn". No kernel
> modification, debug patch or injected delay was needed to reproduce.
> Before: 192000 bytes charged on the sending socket, unchanged 2 s
> later. After: 0 bytes, no KASAN report or lockdep warning, and
> br_input.o builds clean at W=1.
> 
> Not tested: NF_STOP, NFQA_CFG_F_FAIL_OPEN, real EAPOL traffic, the
> netfilter and bridge selftests, CONFIG_NETFILTER=n.
> 
> Applies to v7.2-rc5, v6.12.117, next-20261109 and 7e1392a42ea2.
> 
> The Fixes commit was checked against torvalds/linux: it adds both the
> "return 1" okfn and the RX_HANDLER_PASS return without the *pskb
> assignment.
> 
>   net/bridge/br_input.c |   18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
> index fc2e381..b5bd9d6 100644
> --- a/net/bridge/br_input.c
> +++ b/net/bridge/br_input.c
> @@ -257,13 +257,18 @@ static void __br_handle_local_finish(struct sk_buff *skb)
>   		br_fdb_update(p->br, p, vlan, eth_hdr(skb)->h_source, 0);
>   }
>   
> -/* note: already called with rcu_read_lock */
> +/* okfn of the link-local NF_BR_LOCAL_IN hook in br_handle_frame(). It is
> + * only called when a queued frame is reinjected, after br_handle_frame()
> + * returned RX_HANDLER_CONSUMED for it, so the frame can no longer be
> + * passed up on the port and has to be freed here.
> + * note: already called with rcu_read_lock
> + */
>   static int br_handle_local_finish(struct net *net, struct sock *sk, struct sk_buff *skb)
>   {
>   	__br_handle_local_finish(skb);
> +	kfree_skb(skb);
>   
> -	/* return 1 to signal the okfn() was called so it's ok to use the skb */
> -	return 1;
> +	return 0;
>   }
>   
>   static int nf_hook_bridge_pre(struct sk_buff *skb, struct sk_buff **pskb)
> @@ -424,11 +429,14 @@ static rx_handler_result_t br_handle_frame(struct sk_buff **pskb)
>   		/* The else clause should be hit when nf_hook():
>   		 *   - returns < 0 (drop/error)
>   		 *   - returns = 0 (stolen/nf_queue)
> -		 * Thus return 1 from the okfn() to signal the skb is ok to pass
> +		 * On 1 the frame is passed on here. The okfn() only runs if a
> +		 * queued frame is reinjected later, and must consume it then.
>   		 */
> -		if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
> +		if (nf_hook(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
>   			    dev_net(skb->dev), NULL, skb, skb->dev, NULL,
>   			    br_handle_local_finish) == 1) {
> +			*pskb = skb;
> +			__br_handle_local_finish(skb);
>   			return RX_HANDLER_PASS;
>   		} else {
>   			return RX_HANDLER_CONSUMED;

The fix looks ok, the commit message though - next time trim the AI slop,
all of that could've been 3-4 sentences.

Actually I think there is a worse bug in there, by the time an skb was stolen and
reinjected, its port could've gone away (I'll have to verify it) but we deref it in
the helper without any checks, that could lead to a null ptr deref or wrong ptr.
I will take care of that.

Anyway let's not delay this patch,
Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


