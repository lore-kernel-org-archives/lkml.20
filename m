Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520877;
	b=jI/jNaYsS4NLPX5AfmDf/f2a4Gi5L5ywJBcy2sK6t6ksUxOA8TIyf9eYGHg4/HNYuFy6
	 a5L+LdbcCIpCfRpgLKkcNepXXkTVmgaz4JxLHwFf2hfNAZEeoODMrosLLpJMQVEMTWho7
	 IH8hVGZ5unxPTGJEmDqAS9CLDheo6ZebnOe02pSCZ5I4v2K+zwu85RPh6K7Tm5FtPFmhI
	 Op8PokscZD4u1je5FuKRBd8K6yL+Omqhj2aJRD7bPiBBsWh7FYK+K8gnMeAMoV8b2ONVd
	 VczqzIxxLp9BgLv+9+GlBWcud84GTGYx+WvQtJRMLPGQ+4t6U6GvHn02AsubmGBZEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NPahPdj6bq+f1tXgN0owcrCGpqBtYrj35FRosbGsj3U=;
	b=CJ1cfJ1g+yAwdFb7iDmXsygFXgB1SVo2K3RU/Rzh7W/GIsmPemNJtlHc7M9LutJ3M8k1
	 B3iBlQqEeZAx24Nx6Qa9qpwko0MQmx94ZUBxCJp7i0ddygIUNDyb8FeH9rhkcU8NOKwsa
	 c4lv9ZcIapq1dEJfxgfh4eGyaYN7Mitxoo44dJXtIdgg9aUluyNUtmrrPRvOECp502NkL
	 p+CVyiNSfOXsElXO0qaL7TUSPjYu7PXIyUnu3kOxW74XCGKcso4SHI2bBAP/br3YLRt0v
	 VcKFOOBvFcSKFnp3uL/pmisCrrGOS6uDEQJk9kgvcLsJ8aA3IclKELsZIQCiv4Qklpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crBdnlNF;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C16606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crBdnlNF
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso359202e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520876; x=1795125676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NPahPdj6bq+f1tXgN0owcrCGpqBtYrj35FRosbGsj3U=;
        b=crBdnlNFjY1CopAF5BSuM/Cf9DBpPovYPuQA2z7PeQVyJ+ri4LNxZmxMDPHLkjZzUX
         YXEzOIQeu6jOZ3Vfu257SgR28n2/o9WTUJCp4jX7AQ7CwJ6YZGCdqEvsESdYstOZwtr+
         y5FBcD9vtzU6ScBTuCmwItQBHhHS0Mioftcwxh5sxhRkxZMwdqZs32gy7TnOkO41Z//w
         b+DcVH8r8+7GAwFf+mxoEBW5G262Tu7m4NZhIR8eUceDPkfmewcP0wS9q2g4DVsAbEag
         6Foc7aCnro/jz9/AvCXbzQbLBsNZeaEuTlMbkY+C29++MTkwbwOd/h4YQrFCZBLAzoOZ
         o9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520876; x=1795125676;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPahPdj6bq+f1tXgN0owcrCGpqBtYrj35FRosbGsj3U=;
        b=26ZcRvZvmL7WaPnvajobwtpyzxCchE9/2B4iErHHn4PS5plWJHall1p1xOzphiuPvN
         FivyEGFZNna5lHTznYczMJUntISnZNdfb/EBQdwJx7FW48yvYDD+5cBefXmyc3mf4fPX
         FMO7OqAU4M4B0jn5OuJ5XuzN2H+jdm3jaJkv8rNU5CACm2us33CJqMNa/rdUGh+s4GrF
         P4qp/h7e3OesZRG0QkokuMkL1xtwLZZKA0VUcYaQv1c/GmGwqSY6GRY5uWpHlrO9vER4
         ubGbSYWs2SeNBnOqwyqvXt8gxFvP+YWi7cfOX9mIcsbT9QkxJyNqv8kNia9zk8Q1NYwM
         goUQ==
X-Forwarded-Encrypted: i=1; AL+hErGRQUGPmNQ+0Ncdcu5vOqSGw56OJ6XIelcmu4nFBaEb/K0fJefQY9ORF+uU2LMxLUEdp7kXQTkS+NbybEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IUTXrHLcY/w41C4i1B4VvA7yOc3pq+79eG/hPzTZa3knRgYJ3
	gSG4Igrei8OoS8+Qapv06XnW5DKG3AeBH1AkXwRfkN1D56vtcX6XbiypwtsKyA==
X-Gm-Gg: AYBFou2f07jPldwhLqaE0a3I3orCu3xguC7mS2gYSG61CR+F7NduISp7BHbKwgT/2Kf
	fQEA9LmCz0BP+i08lQB1ghcj70T155l4QVg3aEbxh7n61/zHlqLKKBw62VqUGf/Zkz8CoPUKrvN
	owi7J8/OoIPIIFJYPyvj9aQEDXbOPlo6C8BxxWxic/48PuHc/RJ/Z/uNGOKjNgaFAJLEZ80j1hj
	qcKui0SC927rrNNuXPCfYBxgD8lxpri9nvXQG95FeTgcUx51XYBSFuhzCDlsjb5LeQTRVwfwgmm
	DC9YR85PAfd7pO/IoMq/kRMxMeJXsfEknO6KILi1hAlL7wKF7Us+1nK6EMx2++JpmHTfXZK21pU
	kIZCP820rIud3Rp0eCzz1EUHJGVRqTOjnAFyixnFnVhRPE2O3CoDyZVXuqZ2PIrXrDmQNrbDJkc
	G0d6p4M0FOJdcvuQCSBKxr04+OprtOqiYeiNxvaCZ7XVs0NkHIocl0vynACsJv7Zr5tCr29pPIl
	84rRNU/ikk4Aw1O2rMXiq2AkJR0M/GtH04NqT1EUkAX/h8rAFvJ3KwRvDCs++YKyo55dMcYQt9A
	7g8kXB0Y/K08Kmkm6Trf/TV/mCf3NOtlPI8azq2uYSHKl07UDKVgx9VTqjU/MEPqNi+K6JtK5go
	80Otnwe25CL4roRihrvn/Ca7WpgYE7WzQBUllZuj4xCrBSuf8Ru7mtIukyHvqhi8=
X-Received: by 2002:a05:6122:2906:b0:5ea:c3bc:c54b with SMTP id 71dfb90a1353d-5ee34a512c0mr136619e0c.3.1794520875632;
        Thu, 12 Nov 2026 14:01:15 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e32f83sm214802e0c.6.2026.11.12.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:01:15 -0800 (PST)
Date: Thu, 12 Nov 2026 17:01:14 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Looi Hong Aun <hong.aun.looi@intel.com>, 
 KhaiWenTan <khai.wen.tan@intel.com>
Message-ID: <willemdebruijn.kernel.2721e06a6436@gmail.com>
In-Reply-To: <20261111053728.2611070-1-khai.wen.tan@linux.intel.com>
References: <20261111053728.2611070-1-khai.wen.tan@linux.intel.com>
Subject: Re: [PATCH net 1/1] af_packet: Fix wrong timestamps in tcpdump
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

KhaiWenTan wrote:
> From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> 
> Since commit 97dc7cd92ac6 ("ptp: Support late timestamp determination"),
> timestamps may need to be retrieved with input from the driver
> .ndo_get_tstamp(). Support was missing from mmap'ed AF_PACKET sockets.
> 
> The problem was noticed using the igc driver, that since commit
> 069b142f5819 ("igc: Add support for PTP .getcyclesx64()") has migrated to
> use .ndo_get_tstamp() that timestamps were wrong on the receiving side,
> when using tcpdump.
> 
> Fixes: 069b142f5819 ("igc: Add support for PTP .getcyclesx64()")a

Fixes: 97dc7cd92ac6 ("ptp: Support late timestamp determination")

> Cc: stable@vger.kernel.org
> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> ---
>  net/packet/af_packet.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index cf6429f09477..7197236c8a3b 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -456,15 +456,20 @@ static int __packet_get_status(const struct packet_sock *po, void *frame)
>  	}
>  }
>  
> -static __u32 tpacket_get_timestamp(struct sk_buff *skb, struct timespec64 *ts,
> -				   unsigned int flags)
> +static __u32 tpacket_get_timestamp(struct net_device *dev, struct sk_buff *skb,
> +				   struct timespec64 *ts, unsigned int flags,
> +				   unsigned int sk_tsflags)
>  {
>  	struct skb_shared_hwtstamps *shhwtstamps = skb_hwtstamps(skb);
>  
> -	if (shhwtstamps &&
> -	    (flags & SOF_TIMESTAMPING_RAW_HARDWARE) &&
> -	    ktime_to_timespec64_cond(shhwtstamps->hwtstamp, ts))
> -		return TP_STATUS_TS_RAW_HARDWARE;
> +	bool cycles = sk_tsflags & SOF_TIMESTAMPING_BIND_PHC;

nit: whitespace line between variable declarations

> +
> +	if (shhwtstamps && shhwtstamps->hwtstamp &&
> +	    (flags & SOF_TIMESTAMPING_RAW_HARDWARE)) {
> +		ktime_t tstamp = netdev_get_tstamp(dev, shhwtstamps, cycles);

Does this call need to be conditional on SKBTX_HW_TSTAMP_NETDEV, to
interpret the union as netdev_data?

like get_timestamp, resolve the orig_dev.

> +
> +		return ktime_to_timespec64_cond(tstamp, ts) ? TP_STATUS_TS_RAW_HARDWARE : 0;
> +	}
>  
>  	if ((flags & SOF_TIMESTAMPING_SOFTWARE) &&
>  	    ktime_to_timespec64_cond(skb_tstamp(skb), ts))
> @@ -476,11 +481,16 @@ static __u32 tpacket_get_timestamp(struct sk_buff *skb, struct timespec64 *ts,
>  static __u32 __packet_set_timestamp(struct packet_sock *po, void *frame,
>  				    struct sk_buff *skb)
>  {
> +	struct net_device *dev = skb->dev;

validate skb->dev != NULL

> +	unsigned int sk_tsflags;
>  	union tpacket_uhdr h;
>  	struct timespec64 ts;
>  	__u32 ts_status;
>  
> -	if (!(ts_status = tpacket_get_timestamp(skb, &ts, READ_ONCE(po->tp_tstamp))))
> +	sk_tsflags = READ_ONCE(po->sk.sk_tsflags);
> +	ts_status = tpacket_get_timestamp(dev, skb, &ts, READ_ONCE(po->tp_tstamp), sk_tsflags);
> +
> +	if (!(ts_status))
>  		return 0;
>  
>  	h.raw = frame;
> @@ -2424,9 +2434,10 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>  	/* Always timestamp; prefer an existing software timestamp taken
>  	 * closer to the time of capture.
>  	 */
> -	ts_status = tpacket_get_timestamp(skb, &ts,
> +	ts_status = tpacket_get_timestamp(dev, skb, &ts,
>  					  READ_ONCE(po->tp_tstamp) |
> -					  SOF_TIMESTAMPING_SOFTWARE);
> +					  SOF_TIMESTAMPING_SOFTWARE,
> +					  READ_ONCE(sk->sk_tsflags));
>  	if (!ts_status)
>  		ktime_get_real_ts64(&ts);
>  
> -- 
> 2.34.1
> 


