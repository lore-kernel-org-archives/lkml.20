Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599239;
	b=xEh2ZvSf+XhHaoxvcCIi5Trlu1T6KLHvikU3yPN9M+vZfeFEakNum01heBknOsMc0c3U
	 3gQ96yQOgBKEPdT0sqDKII+QH9Woxr0DZ9IJW7cPKLTqdynMvh3Buj+n7lefca1MBk0c6
	 Gr2JwW6cAyPaGbOU8OZgGxzkJGxIB1rX8lVJn4fkH6tKTb+U9CaV6Hl2FPyXUyBt5Wf31
	 Ufmi9GIaboEhOu8/eA/v77tu5VrBU3c7tOvEzhcYDTFpbx2cp4QHipyMMnUbkuyMY0ZcG
	 AyJbNsd7OZQaM76NFu8bvM4ci3yDPWxnqJdpVL2H4Bdss8myV2ItDUZ2lo4eQcv/8iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/9nRTsMCBEjGYriwMi6KDbDPDyrebmljKz2z9iwLKU4=;
	b=l1LsXpr39WAI1EHgVU0rPjKqMMH6XQ8UYBDb/2GGJjWbpVfg4tiLS+q1jlPpnG3tGc+D
	 sfqB8aeNxuSAPI0v4003GBwDJFhLsSuFwEtx0+iyn9aohtj4pCTVsopcUwy1kncusmth2
	 TXAnsq/GJrpLQxxs9U1D7ueaiD4vj7QVxtCnQgr4QxTskppsxR3ePUWstYaV52YhL+P+o
	 DaKc59Z4pWGao6mAgFbaNJ6OzVApOybHffqh4OUuz6wcL9tR0IjbEljPgUmaqQ/WJMCpn
	 +avLClyVCQ6vsYP/9z05HQ98KXiKddWDjBs9GaYLhBbifgOWSoz23X56UPg04JcMclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qBuypbcv;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA238606A547
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA238606A547
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qBuypbcv
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so9778e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792599238; x=1793204038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/9nRTsMCBEjGYriwMi6KDbDPDyrebmljKz2z9iwLKU4=;
        b=qBuypbcvcufkndLhuQlXxV8oahce5Iot1Xn6uY9JVIzNLFvF4bsY7hC42qXsuxmOXp
         x1iI/OcSRiSHDa8EhPUDdREvfZo40di41jDoB9R2vwfc2+8LZDfePPNjEk2ps9SGRPvd
         xZBnNrGgXzm1jHmuobQLH3aDqC2OiAG8Rx2dMJNf9aP0hT2XbQ/cRCWf0aZKOQovSCN7
         Mb5Qxk2rhxukVBCmTrwVmSVwbXwK2GpUBcLWJCPwffPXa31OU+74YG+3afG404xMPSZE
         RkP3qZ2cxF99J7lwPr2FpXU/wvMwryXay2kShfs4M9J0paghwERNVOHFVlBU7toTXRz3
         rZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599238; x=1793204038;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9nRTsMCBEjGYriwMi6KDbDPDyrebmljKz2z9iwLKU4=;
        b=q6SDm06LxMbVstjAIceNSCxMo8Kt7uQ4Kk8RlD96u56mbzGCaGnch5TsD53fD+gAZx
         Cuo3FUq4zs9kQowoBhOLWL6ZMOg3yPM4rgSBcACr+YsSXX+5t8GbTIpy7hvcj69QX7dX
         W40yHQ+aOg1dMcZkKxip+ZIXGIF+6VfQATjD30YWJP3GyEJo3yjqwcoYvSFLsgY0CM4q
         0HWw8p56QNnldxhBqWfL+ZKqLF1BNihtwfLO5f11F/25aRWKrtMoxj/PJNfFn+B8XPXq
         pFXb44RX6sqm3geSORkCqkNOfZhK3mdmW9phJrLHSdxbJ7LdjCBqOrounn69KN47e3CD
         HlPA==
X-Forwarded-Encrypted: i=1; AKwUvBy/epCjhUHgoQV9XhdgrSwU8tiqIuR3fYWjB93yl8Sb8jlTspQAFpy1wtG58eRkbOTYvEu3bBK8VeENwHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMMX81ezAlqnELxYEaaTfFlvm5PnrwIm93gU+iXbOIYmV3dSwI
	gy94jccaNcCl4xhP1QhskKSVRnK6LothcMCPMVRNBD/tLaeKKvJssF25
X-Gm-Gg: AYBFou3pZYCD0MG+fZbzN3O/TsgPyyAurOD6hXNok4wbny4bJqvuTWOq1oKfyCSWCbQ
	rfXb4IENFHaymccdlcii+chuEj/Vu2okIdewRYoslsoTk5QXtAtmKSa1bNTGj4Pww8qfJd6YQiH
	MCJj5jGuleS7XZU/h5b2ymlFqvuD9WnON0ZzoXVHz0TdKz9RTsjK6zAWKi7iwyN0pxGNOjdYoWV
	28DIB4UNYaeEiGDpOhNNJoGYoF7kP9yQmWtvcfRhc/dMe/oYEDh04n+WsUOywflnkP5nSSq+NUo
	y4HoqteVQGUhI7LK8W1PAgQT8mzEM6r3AVKLKbIr80KfodQA56rJAsseBsEUsZu2rOZ0ywS5Xzt
	Tp4ujYjfT9+5zMCtWTk92zmQnh78NsFFMXq+qVlaxQE0EWCyRXI7idFNZzsJk4yTD6OL6SqyTtd
	5K5Zs1GhpR6xIUOJy2pIDCrhiazIup0DNQ1eYstHU7O/lVMv0o9UE/oRZKuqGvOBBWemV+i1dvt
	9d9yhwnByLvxrda1RMo9HHMD/jH5uGOw5jXqLcAJ8VsIUOueEYUTmzWlr4csGW91Iwtx0iqqNx5
	IJSPso6GZCS1eohrDTAdA7cDTdFbV1JkqkWEo+jUkMd7sg6/wEXY7lXGliBwCllLlJkbLvH19jo
	aGoTypl+wrnj/0fZp3rZU
X-Received: by 2002:a05:6122:54f:b0:5ea:b598:4547 with SMTP id 71dfb90a1353d-5eaeba065femr915799e0c.0.1792599237596;
        Wed, 21 Oct 2026 09:13:57 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97be251sm3632217e0c.8.2026.10.21.09.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:13:57 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:13:56 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Paulos Yibelo <habte.yibelo@gmail.com>
Message-ID: <willemdebruijn.kernel.2a00482371091@gmail.com>
In-Reply-To: <5de86f1afe1165a1a13ac4ef0615b19f4a10cb7a.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
 <5de86f1afe1165a1a13ac4ef0615b19f4a10cb7a.1792565282.git.mst@redhat.com>
Subject: Re: [PATCH net v4 4/7] net: resolve uncommon partial checksums at
 ingress
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

Michael S. Tsirkin wrote:
> As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> others, credited below, found more ways the bug can affect users) a
> virtio net header can place CHECKSUM_PARTIAL at any in-packet offset.
> If that state is retained, later checksum completion can modify the
> packet after protocol processing has made decisions from it.
> 
> Let's fix that: let's validate csum_start and csum_offset and only keep
> CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> UDP header, while handling VLAN headers, IPv4 options and IPv6 extension
> headers.  Complete other non-GSO checksums immediately, before any
> protocol processing runs.
> 
> We can't easily "complete the checksum" for GSO we don't recognize - GSO
> assumes knowledge of the protocol. We could segment ignoring the
> checksum then do whatever csum_start and csum_offset say, but that
> seems like an overkill for something that shouldn't happen.
> 
> There's some risk here:
> - non-gso packets which can't be parsed get checksum calculated in
>   software, adding performance overhead
> - gso packets which can't be parsed get dropped
> 
> To mitigate the risks, the following patch will add a sysctl knob to
> bypass the resolution. This is reasonable if the setup is such that
> there is no protocol processing at all.
> 
> UDP tunnel headers get the same handling on the inner header.
> 
> Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> 
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Reported-by: Chris Arges <carges@cloudflare.com>
> Tested-by: Chris Arges <carges@cloudflare.com>
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/net/tap.c          |   8 +-
>  drivers/net/tun.c          |   8 +-
>  drivers/net/virtio_net.c   |   3 +-
>  include/linux/virtio_net.h | 276 ++++++++++++++++++++++++++++++++++++-
>  4 files changed, 281 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index d7520622e809..f2a9bb443980 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -653,9 +653,9 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>  			rcu_read_unlock();
>  			drop_reason = SKB_DROP_REASON_DEV_HDR;
>  			goto err_kfree;
> -		}
> -		if (err > 0)
> +		} else if (err > 0) {
>  			atomic64_inc(&tap->rx_csum_sw);
> +		}
>  	}
>  
>  	skb_probe_transport_header(skb);
> @@ -1089,9 +1089,9 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
>  		if (err < 0) {
>  			rcu_read_unlock();
>  			goto err_kfree;
> -		}
> -		if (err > 0)
> +		} else if (err > 0) {
>  			atomic64_inc(&tap->rx_csum_sw);
> +		}

All these belong in patch 1 that introduces these branches

>  	}
>  
>  	skb_probe_transport_header(skb);

