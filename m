Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141523;
	b=0TO8IXeCH4awo2BntpdYkkt0sOdb4iWfZNl5MxDx5riJUIxXgF91cBz8oeA8krjG2ChK
	 W28uz+1fiW5vC2JsAH5ASswMzVuC3k8Cv8f7HEg1YdOdOkyYyP0Ihsev0ypIWOF5NOcHS
	 RgD+VLljlErFfSsbqsBNxxAftKikiXI/gY1pv1aGBe7jBJUnDnWr4eWACavThooxhvhWs
	 vw+rSuSA9I9OcR3RJ1XRdneIbucPPKelnVRiRnp1DfjbxiJief7Ja0p7uHZZteX5Z/kXB
	 mbwajc006+YXrzxaz5H1zsNzdgilZYqfQvMOqKKaLEaGHQj5EodYsMVy8ufGl4E763w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9nLhzNnuR7rMVo3Esh8395rEk4roZFjv/lWnMw/Mzgw=;
	b=DTIlkfVV16o9HtCjGFwPlBMDbrJwH3+L9x7VwEWQZSWUe5C75ymZAeGHOY8FxycOl3tH
	 W8ie2KKrgIrtfU85h0EqrqXUwY0o4eSviJIuCVUM19oprI2pn6V/R+l1k1nEVq8uKOQn6
	 UZZ/T9cDDfsoUM6xrADKxZxthX+Ae1by1CmA2ytxHWgx6SxZbVigNHoB8H8A32NeXsfgo
	 jNS7YBV+WkFS2CVINuWOjVKRejvdK1lKqr8MhiWxjNJ9iyApvRBZSnZTytRYDqNvNFLun
	 r2xICqE17md5cwLBWXs8QL/d0VK0tnVaQb2sbEjIqBL2N74q83+oMIbkN+FddAivFWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+IpKiM9;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339EB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+IpKiM9
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso262587a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141522; x=1793746322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nLhzNnuR7rMVo3Esh8395rEk4roZFjv/lWnMw/Mzgw=;
        b=h+IpKiM9EJt2thLQz1fBkjo/WZpclRTehidHTaDMWs/2As2J1KRXkq5WjU7mWFvA6f
         m+ETDsnZifKaqRyTJrVwxTJDB4rvr+WvlMqgB9CQpDZsnkPSEtaXUki5XL/ER0lEg/I6
         7jeUBtEbST9g7e7iqOTug9MPf5PBwbqnJt6Ai2rqj0GNGcEMLFYZuxoMwSefCjD06X3b
         I46MVsDVHmB+yhlFZaUkLkJMov+Bj5XmNkBoTc3uI617g8yxV7ZID6NiYhDmBIijL4/F
         RSpIudgAxUs06IE2i4kne682u9l1XiM0c6JUWyy48dFyk7DdBR6zuOjW5UqnRPBHoUaw
         ZLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141523; x=1793746323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nLhzNnuR7rMVo3Esh8395rEk4roZFjv/lWnMw/Mzgw=;
        b=BC6M9JUlUhXJRtGPx6UNAPa/lJIppgPU8U5crkqt76f/STbPgTTYhyQj7ufkOErHrJ
         OkmqLGYxWZWUAHKgq6VzKDieIkoURYQKSPmXnSBzzLmdMD3dZ3+6/QUk0R7Hu4SA6upx
         FWAfzKdYlEYvEcjp/gN9vU/RB4cLglD8/Eg8eXp2USnCT3BSITyeDQYR1gF9Rbf0oY5C
         ZEs7TwT+N/xih6RM9YltTcR8nMS8XnaAh3HEqzKuXzBopgXm6NdLXKMLghZDMkpzsAWn
         Iq8XT1/HgzwH79RUd8HVtmRPlGGiPABl89fTyPGHq/XZWgqaGNYrPCy8Buu6SWUYKlJ1
         16rg==
X-Forwarded-Encrypted: i=1; AKwUvBx9PLOTGPSo2OOoNzSzXTsG3xs1gFz/9YF5tendZl3RlXYTXaaiKRZBa9mxhFnUCyR2IzQUqgmyhPhiC5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxOrddg0VgEHKGXbytwaGkkTr83iIpx8Er+WtIBopa06TRC0Y/
	WnvmPXdGuIWxgoeIG0mC2CHVGwDw2wCuw5NUZZaHwYpZvNfv6Mgf9Fea
X-Gm-Gg: AYBFou39+Q1thwezUWRHxyWujaGtnKQqRDHT/EPUVEE7gZn0Ao5IOCOQbLViTEVS0D1
	MeDAeitHvQKAidPGCJfsmnwpO+CCNzl136UU+BBTRg9Nx5IsprfwXmuBDvwVTrBq0Z3inzLpLrn
	MQ/279vNuY+8G6J4BlLuanHcQtG1g2pnKQX6nJlQLAWFX0i73xH6ypGNO580cCKPmQpDHmNDuN/
	cGpUSRQFB0PVVHuU3XHhIMb/JVwstYkadRhhRhND3vAf/DT3QcxZSQBg9jOOie0wifg8i40Ntsq
	vM1wCrNL16SAH6vGaM9lCcCAeHav/9dU7ZfMaWErqRZhfpPYcYeXf2/8lII7JeFPqEX6XcuyT8F
	Qjy67lxPTJDd1Ie+MKksp0YYZPAITHigCaio+PWGjY6FDKwtrgbz4olStkac4bTxVwg8FXif2Rq
	4e40hlML3V5/4QIZzGVBdWZfsOoGQa7GZCZr3/48UizyOHbclo6eIg4+P3J4z1L4j/a+YNzj46Q
	3tgL4Opo8b9+xTHeztVM/oUx8QCtlw4poNj+OVg5sQ6+0IAPvZT6o6xjXM4AipM5yaVvETFI26R
	LrxBRcTFHtwXHlGMs8zo19Zp6vqs3JIlkBq/Uwues0BM
X-Received: by 2002:a17:90b:2745:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3ae58317899mr361987a91.57.1793141522593;
        Tue, 27 Oct 2026 15:52:02 -0700 (PDT)
Received: from localhost.localdomain (ip67.244-167-222.hkg.ten111.net. [222.167.244.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a944acasm192658a91.7.2026.10.27.15.51.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 15:52:02 -0700 (PDT)
From: Guoshuai Yang <yangguoshuai@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Guoshuai Yang <yangguoshuai@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v3] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Wed, 28 Oct 2026 06:51:55 +0800
Message-ID: <20261027225155.49607-1-yangguoshuai@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179308626642.3134.14988418944940808850@kernel.org>
References: <20261023065311.65031-1-yangguoshuai@gmail.com> <179308626642.3134.14988418944940808850@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 07:31:06AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Is enabling rx-gro-list enough on its own to reach this case?
...
> Could the commit message describe that topology? Could it also say that
> this half of the fix depends on TCP fraglist GRO? That feature is much
> newer than e27cca96cd68 from the Fixes: tag, so on stable trees without it
> the pre-pass does nothing.
>
> [Severity: Medium]
> Is there still a BUG_ON() at this point? In the tree this patch targets,
> skb_segment() handles the condition like this:
...
> Could the commit message say which kernel the trace came from? Could it
> also describe the behavior on the kernels this patch targets?
>
> [Severity: Medium]
> Can fragp point at the ->next field of a member that is still shared when
> this store happens?
...
> This relink pattern looks like it comes from ___pskb_trim(). That function
> handles skb_shared() on every member before skipping any, so it never
> writes through a shared predecessor. Would it be safer to privatize every
> member walked so far, including the skipped ones, or to copy from the first
> shared member onward the way skb_cow_data() does?

Thank you for the detailed review. All three points are valid:

1. In esp_reset_espintcp_fraglist_gso(), skipping a shared predecessor
   before checking skb_shared(frag) means a subsequent *fragp = frag store
   would overwrite the shared predecessor's ->next pointer across both
   clones. Unsharing every walked frag_list member first (as ___pskb_trim()
   does) before checking SKB_GSO_FRAGLIST guarantees that fragp always
   points into an unshared predecessor.
2. In the commit message, I will clarify that the BUG_ON(!list_skb->head_frag)
   oops trace was captured on a 6.12 LTS kernel, whereas on current mainline
   kernels skb_segment() hits DEBUG_NET_WARN_ON_ONCE(1) and returns -EINVAL,
   causing validate_xmit_skb() to drop the packet.
3. I will also clarify the topology required for TCP fraglist GRO
   (SKB_GSO_FRAGLIST) to reach esp_input() (e.g., rx-gro-list on a device in
   an outer netns forwarded across veth into the netns hosting the espintcp
   socket) and note that this pre-pass applies to kernels with TCP fraglist
   GRO support.

I will send a v4 with these updates.

pw-bot: cr
