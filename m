Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824616;
	b=fdnKqD1G53Tg+BqTQHmNPpX99bFhWQdJe1YWAhL7650fm7DqCGa3TKA8NgvUgLwA8w0U
	 IyOaAV/DwGGGMLEV7TmVSZhKanImuB5yAt5FGFeYjeWS7TiDzpmBqv4B8O0NhVZhXFj11
	 aoLZ3G0cv+JCZSz7YcCky+4KAbUxdTJk4dZPHBhsh/zqQYJJeJKXgMfyzazAQ/6nafblL
	 z3Ps+4Qr9bl5OJleVjaMwJjs+1OhDn5HEMdMEbzkTQV6gh93tzgwtLaHP7x2m6+dQQrsx
	 Ad+I9aILcIlSNbAZpFy1kOhGtEp65UE2mfcEV2hBLq25ZxwQoy6C2XJu0gWTk+1BRZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824616;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aBwn/FZxnh0n0zhteaBKF/cx+9D+nKGywQr5rRvRjQw=;
	b=PnabviMbsGoyHikLGXey4nVPi/0WydgJMBCkw/hAQwFsA/e7rvmBk8wuRgjFE7C+wCQN
	 u/lm4vTt0hkzeVqR2sHVkjnDTeoDQmg9sMXu63sXSxsqH8DtMx3DtlXd9OoPd+dUHz0em
	 75ojH3Q+mF4SG8njcx5ribibPRemftVMEpp/G8NAP4ji3WjdXyAP5jOvslpB1saySQqQg
	 QVmvcmNKAqWWXvjcvUtxp5O4D79yIkN6Be9v94z4DIuyWpdHRSaPbt1fLISoDV/eTpmoI
	 zIRDeImfLcnnwrLpP5cnEblu3hFDQcZv5gAXITijLyfSGOktV628Hw4znFyGei8WF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8TQkxh8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD95606A33A;
	Mon, 16 Nov 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8TQkxh8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CC41F000C4;
	Mon, 16 Nov 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824615;
	bh=aBwn/FZxnh0n0zhteaBKF/cx+9D+nKGywQr5rRvRjQw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X8TQkxh89SfKOCAA8cO6hnyISMYFq93b5suocjtWdmfjAKdxF6JqUIcpUjdvP75U0
	 3w9htdmr7pmO8NbAiufIdXfl/Vpx4DovAswlXDtiK5JYIz6gesblbNjlu0zmRjYfir
	 Ow8DZWDgryXZgLOcOkPR9MRFsKt9aKvfzacHS3t8LkS5/XxiOKj6GCgByeRdwvO4gi
	 aebYOUB6iwFQdkCaKkHAKIgaILWmZxfZ2VGHjlTfq3h+Zi00RL/r/wSgj1Bqm0645N
	 uQ235i46N92iHwjePpdxWRfZdfNNoLoCTbVkorDPwdl2GysNmZ5YLrInE5dMEanJKy
	 PC7hBEuBIGBXA==
Subject:
 Re: [PATCH v2] net: hso: fix tx skb leak and a race on the stashed skb
From: netdev-bot+sashiko@kernel.org
To: chenaibing@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 10:23:34 +0000
Message-ID: <179482461473.3136.10520991197009365626@kernel.org>
In-Reply-To: <20261115101646.244-1-chenaibing@cmss.chinamobile.com>
References: <20261115101646.244-1-chenaibing@cmss.chinamobile.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The v2 ownership protocol (xchg() in hso_net_close() and
  hso_resume(), plus an unlocked test_bit(HSO_NET_RUNNING) in…
- [Low] In hso_resume() (drivers/net/usb/hso.c), the new inner
  `test_bit(HSO_NET_RUNNING, &hso_net->flags)` re-reads a bit that the…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  hso_net_start_xmit() copies the whole frame into the fixed-size TX…

--

net: hso: fix tx skb leak and a race on the stashed skb

This patch frees the skb that hso_net_start_xmit() stashes in skb_tx_buf
when the interface is closed. It also uses xchg() in both hso_net_close()
and hso_resume() so that only one of them takes ownership of that skb.
On top of that, hso_resume() now drops the stashed frame instead of
transmitting it when HSO_NET_RUNNING is clear.

Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..ba59bdefd203d 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c

[ ... ]

> @@ -728,6 +729,14 @@ static int hso_net_close(struct net_device *net)
>  
>  	hso_stop_net_device(odev->parent);
>  
> +	/*
> +	 * Take ownership of a frame stashed by hso_net_start_xmit() and drop it.
> +	 * hso_resume() takes it the same way, so only one of the two paths frees
> +	 * it.
> +	 */
> +	skb = xchg(&odev->skb_tx_buf, NULL);
> +	dev_kfree_skb(skb);

[Severity: High]

Does only one of the two paths really end up owning the frame?

hso_net_close() runs under RTNL. hso_resume() runs from USB PM context,
for example the usb_autopm_get_interface() work that hso_get_activity()
schedules. The two paths don't share any lock.

Consider this interleaving:

CPU0: hso_resume()
    skb = xchg(&hso_net->skb_tx_buf, NULL);
    test_bit(HSO_NET_RUNNING, &hso_net->flags) returns true

CPU1: hso_net_close()
    clear_bit(HSO_NET_RUNNING, &odev->flags);
    hso_stop_net_device(odev->parent);
    skb = xchg(&odev->skb_tx_buf, NULL);    /* returns NULL */

CPU0: hso_resume()
    hso_net_start_xmit(skb, hso_net->net);

Suppose hso_get_activity() returns -EAGAIN at this point. That is the
"device is still not ready" case from the commit message.
hso_net_start_xmit() then puts the skb back with a plain store:

	if (hso_get_activity(odev->parent) == -EAGAIN) {
		odev->skb_tx_buf = skb;
		return NETDEV_TX_OK;
	}

Does this leak the skb? Nothing frees it after close has done its xchg().
A later hso_net_open() overwrites the pointer with
odev->skb_tx_buf = NULL, and on disconnect the pointer is lost when the
netdev is freed.

If hso_get_activity() returns 0 instead, usb_submit_urb() on
mux_bulk_tx_urb runs after close has killed that URB. hso_resume() then
calls hso_start_net_device(), which resubmits the RX URBs on a closed
interface.

When that TX URB completes, write_bulk_callback() returns early:

	if (!odev || !test_bit(HSO_NET_RUNNING, &odev->flags)) {
		dev_err(&urb->dev->dev, "%s: device not running\n", __func__);
		return;
	}

That skips hso_put_activity() and netif_wake_queue(). Can this leave the
activity state and the autopm reference raised?

The new test_bit() narrows the window, but it is still an unlocked flag
check used as a gate. Would this need real serialization between three
places: the stash in hso_net_start_xmit(), the check-and-transmit in
hso_resume(), and the teardown in hso_net_close()? That could be a lock,
or having close wait for a resume that is already in progress.

[ ... ]

> @@ -3054,13 +3064,17 @@ static int hso_resume(struct usb_interface *iface)
>  			if (hso_net->flags & IFF_UP) {
>  				/* First transmit any lingering data,
>  				   then restart the device. */
> -				if (hso_net->skb_tx_buf) {
> +				skb = xchg(&hso_net->skb_tx_buf, NULL);
> +				if (skb) {
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
> -					hso_net->skb_tx_buf = NULL;
> +					if (test_bit(HSO_NET_RUNNING,
> +						     &hso_net->flags))

[Severity: Low]

Isn't this test_bit() checking the same bit as the enclosing
"if (hso_net->flags & IFF_UP)"? hso_net->flags is the driver's private
bitmap, and HSO_NET_RUNNING is bit index 0:

/* These definitions are used with the struct hso_net flags element */
/* - use *_bit operations on it. (bit indices not values.) */
#define HSO_NET_RUNNING			0

IFF_UP is 0x1, so the outer check already tests HSO_NET_RUNNING. The new
else branch with dev_kfree_skb() can only run if hso_net_close() clears
the bit between the two reads.

The commit message says:

  hso_resume() also drops the frame instead of transmitting it when the
  interface has already been stopped.

If the interface was stopped before resume, the outer check skips the
whole block. In that case hso_net_close() has already freed the frame
through its xchg().

Could the outer check be changed to
test_bit(HSO_NET_RUNNING, &hso_net->flags)? Could the commit message also
be reworded to describe what the new branch actually handles?

> +						hso_net_start_xmit(skb,
> +								   hso_net->net);

[Severity: High]

This is a pre-existing issue, not one introduced by this patch.
hso_net_start_xmit() copies the frame into the TX bounce buffer without
checking its length:

	memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);

hso_create_net_device() allocates mux_bulk_tx_buf with
kzalloc(MUX_BULK_TX_BUF_SIZE), which is 2048 bytes (HSO__MAX_MTU).

hso_net_init() only sets net->mtu = DEFAULT_MTU - 14 and never sets
net->max_mtu, and hso has no ndo_change_mtu. dev_validate_mtu() in
net/core/dev.c only enforces the upper bound when dev->max_mtu > 0.

This means something like "ip link set hsoX mtu 4000" is accepted. Can a
frame larger than 2048 bytes then overflow mux_bulk_tx_buf in
hso_net_start_xmit()? usb_fill_bulk_urb() would also send skb->len bytes
from that buffer to the device, reading past the end of the buffer.

The patched hso_resume() still passes the stashed frame to this function.

Would it make sense to set net->max_mtu = MUX_BULK_TX_BUF_SIZE in
hso_net_init()? Another option is to drop frames with
skb->len > MUX_BULK_TX_BUF_SIZE in hso_net_start_xmit().

> +					else
> +						dev_kfree_skb(skb);
>  				}
>  				result = hso_start_net_device(network_table[i]);
>  				if (result)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115101646.244-1-chenaibing%40cmss.chinamobile.com
