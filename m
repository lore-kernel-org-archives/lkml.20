Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665346;
	b=Dh/vSgf1POruhGwAbIzkEIyMb5kz+ZwOn4wA36l62ByyxUUGnXZYEIMNIWAQZ4wb7zyr
	 fLoZ47uvWPkBxlk8C5ECNVcXVg9OuFLoypkVofhdLgAs2bS6dvzTTvI4Xlh//g9SCVuu2
	 jg5hUA7t79XISl8g/J6WLlhfR4zx7MUK7fsFAKGwxSXhQ4s43e6ZSItF1t8/K9qPStDV7
	 zbtcpsnx5d4XJAZJY0Q7/Bao2S2RqX8iwNat5ytpZUUECyKbJ5cF6oeSFmLKf1vByVibt
	 I2HK/6z8xyAu+6g/FzM3ILGW60tX52A79jhCNBAWwg/YXJBfN98yacKR6izrXiUsSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665346;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pxxacMxVePFTDz82jsHDl0aYmUO9B1dpY0NS6vSmFbs=;
	b=1TDytY6fPvQNZkPqdKf8zNjTI9Ffr+8BVtDYhgDm3M6RbbASHvLQ3g9N3sbrmOvSbT5t
	 v8K2qACTNvh7fO3S7IMRU0xWTa7moZlEaNOZ7kDIyGGP95+zwv792DdLdkLGofC7tgAPH
	 U7OKO804jIV7//8MyG4n40zfZ0qvMJKRf7BrkTt/1DxLZ2x6J/Jfg6moscEPkuxeXID/4
	 yEQtEqWEfR3OSPGcGFBavWYqLv9LvwgvqOKEJi/GoxQ5gp32R6L4rujOJMtJNmJ7wnq+b
	 4pJCsuGIHp59I0DOskzs6R0TNHmtICdeqwfjkomajoEIDbHc4pOkL2WKFrHAZE+wXSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNT2Nmfi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A5606A327;
	Sat, 14 Nov 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNT2Nmfi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1500E1F000C4;
	Sat, 14 Nov 2026 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794665345;
	bh=pxxacMxVePFTDz82jsHDl0aYmUO9B1dpY0NS6vSmFbs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GNT2Nmfi6jEnqJhxLaz4x1wAPeqHnv2My5LpcrnoJCbGBxGJjZ3Q/uiftkNGqA6x/
	 VffIUjUGvLKKoWJgTsbeQuoY6dCmwVgJVPLeIxcVK0+PtAlmXakIT4hYUEzj8QP77j
	 zV5oyd7vNWOXg+Hg0mfNd+5JBcFd6HRcY28zI50k42jZytOrJQNOiiYOaXXx3M267h
	 pfqL1QtZrqs2S9CeZxQFnAhwjTralnWBXcRcZHWVaGIGk1LQ4nZsN4wmdeYAdHzvV8
	 5mhJpyTjI0c3K67CIhNeSjMJmRTPLaTN864O5jKzaRfwKOOF0yAhlkWAbqz/f0eEz/
	 ORdaMw52JjE9w==
Subject:
 Re: [PATCH net v2] net: usb: cdc_ncm: don't underflow the NDP room check
From: netdev-bot+sashiko@kernel.org
To: xujiahao@cmss.chinamobile.com
Cc: oliver@neukum.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+1994e2ecf323ed90f255@syzkaller.appspotmail.com
Date: Sat, 14 Nov 2026 14:09:04 +0000
Message-ID: <179466534452.2199510.12286844115122956221@kernel.org>
In-Reply-To: <20261110151624.696101-1-xujiahao@cmss.chinamobile.com>
References: <20261110151624.696101-1-xujiahao@cmss.chinamobile.com>
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

- [Medium] The code change is correct, but the commit message explains
  the bug wrongly, so maintainers and backporters get a false picture of…

--

net: usb: cdc_ncm: don't underflow the NDP room check

This patch rewrites the NDP room check in cdc_ncm_ndp16() and
cdc_ncm_ndp32() as an addition instead of an unsigned subtraction. The
old form could wrap when skb->len + reserve exceeded tx_curr_size, and
then skb_put_zero() of max_ndp_size bytes could overrun the skb.

Closes: https://syzkaller.appspot.com/bug?extid=1994e2ecf323ed90f255

> tx_max is only clamped to max_datagram_size + max_ndp_size + the NTH
> header size, so tx_curr_size is just big enough for one datagram and
> one NDP.

[Severity: Medium]
The code change looks correct. Is this description of the clamp accurate
at bind time, though?

cdc_ncm_setup() clamps tx_max before max_datagram_size is set:

drivers/net/usb/cdc_ncm.c:cdc_ncm_setup() {
    ...
	/* clamp rx_max and tx_max and inform device */
	cdc_ncm_update_rxtx_max(dev, def_rx, def_tx);
    ...
	/* set max datagram size */
	cdc_ncm_set_dgram_size(dev, cdc_ncm_max_dgram_size(dev));
    ...
}

ctx is zero-allocated. So when
cdc_ncm_update_rxtx_max()->cdc_ncm_check_tx_max() computes:

	min = ctx->max_datagram_size + ctx->max_ndp_size + sizeof(struct usb_cdc_ncm_nth16);

max_datagram_size is still 0, and the lower bound is just max_ndp_size
plus the NTH16 header.

If a device advertises a small dwNtbOutMaxSize, can tx_max end up well
below one datagram plus one NDP?

> Here end is 0x140 = 320 = 140 + 172 + 8, i.e. the one-datagram minimum.

Can max_datagram_size really be 140 here? cdc_ncm_set_dgram_size() clamps
it to at least cdc_ncm_min_dgram_size(). That is CDC_NCM_MIN_DATAGRAM_SIZE
(1514) or CDC_MBIM_MIN_DATAGRAM_SIZE (2048).

Also, sizeof(struct usb_cdc_ncm_nth16) is 12 bytes, not 8.

Could end = 0x140 instead come from alloc_skb() rounding a small
tx_curr_size up to its allocation size, rather than from a tx_max minimum?

> A second datagram in the same NTB is therefore exactly the
> case this check has to reject

Is this the right case? The room check only runs when there is no NDP
with a matching dwSignature yet, because the chain walk in
cdc_ncm_ndp16() returns early on a match:

	/* follow the chain of NDPs, looking for a match */
	while (ndpoffset) {
		ndp16 = (struct usb_cdc_ncm_ndp16 *)(skb->data + ndpoffset);
		if  (ndp16->dwSignature == sign)
			return ndp16;
		...
	}

cdc_ncm_tx_fixup() always passes the same NOCRC signature, so a second
datagram with that signature never reaches the check.

Wouldn't the triggering cases be the first datagram of an NTB, or a
datagram with a different signature? One example is cdc_mbim_tx_fixup()
with several MBIM sessions.

Could the commit message be updated to describe how tx_curr_size ends up
smaller than one datagram plus one NDP?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110151624.696101-1-xujiahao%40cmss.chinamobile.com
