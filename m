Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667559;
	b=Mcv0oiQWnMyEjZY2CEDFEPdHiUvgDMlIxtWlcgzHLlrcaIVo0NUZTYLpTv819Rkr6QJS
	 9fBGET23+oaZfNcWroGXeHEDc+iIrUTFO4DHyjJGenk7hPdTyg+QuTdThfDjWyBsMk96Q
	 qNB2WDWqq37NFLUXXGOMnStGsmLDpKAxCUAzNrvOR+B/lYOX2lq0Bul04Om8++Jc/VkLc
	 E+cqnf/9had9BN3r4/kfCqTq9YuWLm1ojh0NcMyGE5Jd3bkm3gMdNcRAm7jz5Mu/DRJna
	 GzdSOzBypxEXoQ12iismYTqlfTTCIPEU0yGl1WhmG1WMf8PrnCTibrNLs8lfNiMt8Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667559;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dQKkTV59PA9gDrnFZqTN77W5XNr80hjLVJl64KfD5Hc=;
	b=FSHXEGwCGH+KrXWRgJLqA1ugEUkByRF26moFO4MoCmGYikyCMITRiyEWxoXybal5hAA6
	 P+uQCgO38SvTqLy/Q003ahaPaeHwPEq3BSnrZLbZ0zMhswKq7TG1GmtUdapeBWv0nzk8s
	 eO8QZFMkqs5hl3XSUomAiYWupP8TmiY9k+TRoYsuG0oKrGoIjpdmTXM4PbB5CNcQ4y/8p
	 7utdawJL+gvVXTyCWGSiXv4VOe+kLARRIOS5tacTVLGrhiv+QAnPyVV0W2vF86rdi2t3M
	 c9FLr2mvsE0Lxcrv2Vc+BNHPraXKNI8IuiU2WF0w+xZnerV/MYPpPjqUYIYriiYTGfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kabNH/F3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50D606A33D;
	Sat, 14 Nov 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kabNH/F3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9491F000C4;
	Sat, 14 Nov 2026 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667559;
	bh=dQKkTV59PA9gDrnFZqTN77W5XNr80hjLVJl64KfD5Hc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kabNH/F3S+UrrEuuedgxRELY4hGwCq7FxgQvEhMoV4jRhY7vkx6F92lrJq4frCiFd
	 tXrj8jUX5WG0tI6YZgKKjfOgjsBJWnv1PrpreIVwMmB7UeG+GMKwAvso2kAHnff7Ak
	 EBWG3VYa776D8wSvmgWTHJ3lBgrLY+ckOqxffc9CawGLaCAwry6x6H+ZngBmHhydef
	 SHOml4ylCYxBQJgIdzYAWFXOIBMpghoj+d48h5ACUZH/usWPPfKxTcqAcQNxO9SW4q
	 KF8MiHpo+pul+NID+RkmqAISGpmt8p9yMlk7Y5BuyisPU8igSBWKsvHRoZ7wH8mtkO
	 yUpdCgjtR/oBQ==
Subject: Re: [PATCH net v2 2/2] net: add a KUnit test for the
 alloc_skb_with_frags() tail split
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, almasrymina@google.com,
 daniel@iogearbox.net, willemb@google.com, willemdebruijn.kernel@gmail.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 narcisav.kernel@gmail.com, linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 14:45:58 +0000
Message-ID: <179466755804.2199510.1095568480643973664@kernel.org>
In-Reply-To: <20261110162418.28322-3-yanhaishuang@cmss.chinamobile.com>
References: <20261110162418.28322-3-yanhaishuang@cmss.chinamobile.com>
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

- [Medium] The skip probe in alloc_skb_with_frags_test_tail()
  (net/core/net_test.c) cannot do what its comment says ("Don't report a…

--

net: add a KUnit test for the alloc_skb_with_frags() tail split

This adds a KUnit case that asks alloc_skb_with_frags() for
MAX_SKB_FRAGS - 2 order-3 chunks plus a 7 page tail. Before the fix it
references, splitting that tail ran out of frags. If the allocation fails
and a single order-3 page can't be allocated either, the test is meant to
skip rather than fail.

> diff --git a/net/core/net_test.c b/net/core/net_test.c
> index 2b5080c226636..de4d246f2f7ab 100644
> --- a/net/core/net_test.c
> +++ b/net/core/net_test.c
> @@ -1721,7 +1721,42 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)

[ ... ]

> +	skb = alloc_skb_with_frags(0, len, PAGE_ALLOC_COSTLY_ORDER, &err,
> +				   GFP_KERNEL);
> +	if (!skb) {
> +		struct page *page;
> +
> +		/* Don't report a lack of high-order pages as a failure. */
> +		page = alloc_pages(GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY,
> +				   PAGE_ALLOC_COSTLY_ORDER);
> +		if (!page)
> +			kunit_skip(test, "no order-%d pages",
> +				   PAGE_ALLOC_COSTLY_ORDER);
> +		__free_pages(page, PAGE_ALLOC_COSTLY_ORDER);
> +	}
> +	KUNIT_ASSERT_NOT_NULL_MSG(test, skb, "err %d", err);

[Severity: Medium]
Does probing for a single order-3 page catch the case the comment
describes?

For this len, alloc_skb_with_frags() never lets a leading chunk drop
below order 3. At nr_frags = k, the check is:

net/core/skbuff.c:alloc_skb_with_frags() {
    ...
			can_shrink = DIV_ROUND_UP(data_len, smaller) <=
				     MAX_SKB_FRAGS - nr_frags;
    ...
}

This works out to 2*MAX_SKB_FRAGS - 2 - 2k <= MAX_SKB_FRAGS - k. That
holds only once k >= MAX_SKB_FRAGS - 2. So each of the first
MAX_SKB_FRAGS - 2 chunks has to get an order-3 page, or the function
does goto failure. In total the call needs roughly MAX_SKB_FRAGS - 1
order-3 pages, not one.

When the call fails partway through, the failure path does:

failure:
	kfree_skb(skb);
	return NULL;

This frees every order-3 page already placed in the frags. Since
pcp_allowed_order(3) is true, those pages land on this CPU's per-CPU
free lists right before the probe runs. The single
alloc_pages(..., PAGE_ALLOC_COSTLY_ORDER) probe will then almost always
succeed, the skip is not taken, and KUNIT_ASSERT_NOT_NULL_MSG() reports
a failure.

So the test seems to skip only when the very first order-3 allocation
fails. A host with some order-3 pages, but fewer than MAX_SKB_FRAGS - 1,
would still report a failure. That doesn't match "so that a host with
fragmented memory does not report this as a regression" in the commit
message.

Could the probe check the real requirement instead? For example, it
could try to hold MAX_SKB_FRAGS - 1 order-3 pages at once, or treat
-ENOBUFS as a skip unless a stronger check shows enough pages were
available.

> +
> +	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
> +		frags_len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
> +	KUNIT_EXPECT_EQ(test, frags_len, len);
> +
> +	kfree_skb(skb);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110162418.28322-1-yanhaishuang%40cmss.chinamobile.com
