Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667558;
	b=0u7VBpA4LeL+LjJsrxLyuixLV2LD28AwmbjxnYICWFnma9Fb90rZwyT04LX7S6gqsND1
	 pIGEElj2cK48K1FIqh02PmikWemlDFCl9VEvWz9JKUQE3TlKfN+Qv+wcLokqgAQTPgoHf
	 ltxVaVS9y5tRhnlZpcZsEmEOeECU+H1r9rnpdjQvMrJIRq4iYBI4Q4jzf8M1uQcygLtBh
	 BXVZLV2RcSQBGqyszx5AOvnUMF7hFcQctCPYQL0+PB789ZHKuFU4EneuwAcRZ94AcDcow
	 rNYPClY+e76zfXvAPNv1wBHIjjNwY55jWx7w+KXTF8sFXdFMw/I+8T9wfOlY4UopIQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667558;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HTi6KiMLe/91F0sP8kELjed74P02vvwuZ82h3xlxCL0=;
	b=JEvVvNYuf8ak1hFG9o/C33qQQy3ph0zrSfBGX88MsTQdWVedLVA52tufogDGTmFuOOJY
	 tThJ9wMSt0P0Blnqyzmm53wI2zIWy7txyGgaaa8+bUBLLOK87vOeota5dlpCDifFxcEpJ
	 UTGEthR6JrbNlEEuqNxwLiJ6IDkena7X07Q8bueQZbcpp7BE5dFJsoNXPBuXtM12N2Yco
	 QsExJuy5hdSIZZDpAiCi9DEV8DwB3+IMIEDJPwdH507veBUqMhqqLOiPkWOJZVMFE76L/
	 7L27QWiLme0fjPVZVtkKzKzAtzTrKkdeDJ+eSB7iIyetXdKwaPxB+LZm7gy7A8ufKqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fuyoSMAm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B780606A32D;
	Sat, 14 Nov 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fuyoSMAm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161F61F000C4;
	Sat, 14 Nov 2026 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667557;
	bh=HTi6KiMLe/91F0sP8kELjed74P02vvwuZ82h3xlxCL0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fuyoSMAmN3PdDRlkzEMrgqpxVRKNnbZKic7xLFDRXugpSfDxjWOx8u9kKBMT8ui7t
	 HbVj/HwCzjPZ76UL6/z+F+ht5nN2y1g+uyG2/zIzVwHUdMtCOuzyQ5VZyYjOcfZWQg
	 aL+9HoEVeWv0OSbg3+7XoW+oiIzm+t8uQhwpZkjoxb9OwpBOHJo+OraweFUHvY4mjW
	 kvM3Lg4eBoFWXJAO5VfDJKYADuGVNEx+1KCcswPfYNxNrusCqeR7uIERc8vLb2eLsH
	 upJrsWpmf+zsFTf+rgHRtaBZk01gjl35wANJ9O1HXJNoTogL6FHTZDmRPjzwAtJ+Kz
	 yoDgp+9ug1ppw==
Subject:
 Re: [PATCH net v2 1/2] net: do not run out of frags in alloc_skb_with_frags()
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, almasrymina@google.com,
 daniel@iogearbox.net, willemb@google.com, willemdebruijn.kernel@gmail.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 narcisav.kernel@gmail.com, linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 14:45:56 +0000
Message-ID: <179466755661.2199510.13284928932985381147@kernel.org>
In-Reply-To: <20261110162418.28322-2-yanhaishuang@cmss.chinamobile.com>
References: <20261110162418.28322-2-yanhaishuang@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] alloc_skb_with_frags() (net/core/skbuff.c) can still fail with
  -ENOBUFS for a data_len that passed its up-front check, and the vhost-…

--

net: do not run out of frags in alloc_skb_with_frags()

This patch changes alloc_skb_with_frags() so that it no longer runs out
of frags when it rounds down the tail or falls back to a lower order.
When lowering the order would need more frags than are left, it retries
the same order once with the caller's direct reclaim and __GFP_NORETRY,
and fails if that retry also fails.

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index a7d555b3d2f28..da9025e6f0c3c 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -6906,15 +6906,41 @@ struct sk_buff *alloc_skb_with_frags(unsigned long header_len,

[ ... ]

>  		if (order) {
> +			unsigned long smaller = PAGE_SIZE << (order - 1);
> +			bool can_shrink;
> +
> +			/* Only fall back to smaller pages if the frags left
> +			 * can still hold the rest. If not, try this order
> +			 * once more with the caller's direct reclaim.
> +			 */
> +			can_shrink = DIV_ROUND_UP(data_len, smaller) <=
> +				     MAX_SKB_FRAGS - nr_frags;
> +
>  			page = alloc_pages((gfp_mask & ~__GFP_DIRECT_RECLAIM) |
>  					   __GFP_COMP |
>  					   __GFP_NOWARN,
>  					   order);
> +			if (!page && !can_shrink &&
> +			    gfpflags_allow_blocking(gfp_mask))
> +				page = alloc_pages(gfp_mask | __GFP_COMP |
> +						   __GFP_NOWARN | __GFP_NORETRY,
> +						   order);
>  			if (!page) {
> +				if (!can_shrink)
> +					goto failure;

[Severity: Medium]
Can a guest still livelock the vhost worker through this path?

can_shrink is false for any data_len above
(MAX_SKB_FRAGS - nr_frags) * (PAGE_SIZE << (order - 1)). For the first
chunk with order 3 and 4K pages, that is anything above 278528 bytes.
If the attempt without direct reclaim and the __GFP_NORETRY retry both
fail, alloc_skb_with_frags() still returns -ENOBUFS. The data_len passed
the up-front check, and order-0 pages may be plentiful.

A guest can reach this size. tun_alloc_skb() clamps the paged part to
exactly the limit:

drivers/net/tun.c:tun_alloc_skb() {
    ...
	if (len - linear > MAX_SKB_FRAGS * (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
		linear = len - MAX_SKB_FRAGS * (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER);
    ...
}

So the guest can choose a paged length of up to 557056 bytes through the
descriptor chain. Tap and af_packet clamp to the same value.

vhost-net still treats -ENOBUFS as transient:

drivers/vhost/net.c:handle_tx_copy() {
    ...
			if (err == -EAGAIN || err == -ENOMEM || err == -ENOBUFS) {
				vhost_discard_vq_desc(vq, 1, ndesc);
				vhost_net_enable_vq(net, vq);
				break;
			}
    ...
}

handle_tx_zerocopy() also retries on -ENOBUFS.

On a host with fragmented memory, wouldn't this give the same 100% CPU
vhost spin with no traffic that the commit message describes?

Previously the order-3 attempt failed fast. Now every pass also does the
order-3 GFP_KERNEL | __GFP_NORETRY allocation. For this request,
__alloc_pages_slowpath() runs async compaction, one direct reclaim pass
and direct compaction before it gives up. Each pass can evict host page
cache and slab, and the guest controls how often this happens.

This seems to partly undo fb05e7a89f50 ("net: don't wait for order-3
page allocation").

The commit message only says "fail only if that fails too". It does not
say that this failure still livelocks vhost-net, or that the vhost retry
loop now runs direct reclaim. The note that the retry-failure case was
not tested appears only below the --- line, so it will not be in the
commit.

The KUnit test in the next patch does not change net/core/skbuff.c, so
this case is still there at the end of the series.

Could the commit message describe this remaining failure case?

>  				order--;
>  				continue;
>  			}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110162418.28322-1-yanhaishuang%40cmss.chinamobile.com
