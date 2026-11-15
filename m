Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777644;
	b=NJxVZG3zDyAXHCF3ElnYpnkzgKjsuDkodcq8nmonMyaBrFJ4mcUe5bqnpHhp1oGO29fL
	 pPRMJLrjMmqzNCQWQlXeX9z0f/Lm/ZHax9uSt3aiQnaAcjVL+MXvV4r47EFx80b7hcsHt
	 ayID0cRCanQiRlFXbb4O+lkrqR+6y/IUkxt5iimyOrJbaBuonAbZ5l9RCo8yZUNtuvqC1
	 UVnAf57nv85aweAeJSV9jkKGy2ydVjkVZ81P/y1z8KjAqyM3J10Ouq2GX1ZH/mrCIZ+Uh
	 78BjIk5x4TINgoPE4y9m1zgqmhw1x+7uiMNXOPY4xxdxbO+SHWiESpbXEbo9qAl03jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777644;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=opYgrvJnVvgx51XRRbQRZzM3SYgGMh1IlhNmFvbK5cM=;
	b=ikqzYS0cSDTKjVQ06Os3KnHoTDz3iJ+JHvxrfTEDO2dARevb21cI2MJedi8pAS6RH3DJ
	 W1ERzdI94imndLTlaNQF9NnpnO9/8CmovDueCxyJRCMKTF4JnoRmFUPDqazo3fwZm13x6
	 CYm5V9cauDkZrtntnjDKhTqNGXOU/JLX1+nVOM3mkseZskDUdb27UqsmLtQaVLtcdwUpw
	 RAtkW9A36zjs4LeopZU85iPu2eC1jUUr3owYwcji0yLI4leYNMipEtik2+jIlxj+SpB6U
	 8tQH66JFHBPKsJRuDi0PoUg8lBuq3kO8f0uU2WS4+/q9DaswUwuqC/hDLwKGhow2QyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6oHKr+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A1606A31F;
	Sun, 15 Nov 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6oHKr+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DA21F000C4;
	Sun, 15 Nov 2026 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794777643;
	bh=opYgrvJnVvgx51XRRbQRZzM3SYgGMh1IlhNmFvbK5cM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q6oHKr+O+0/i/b/rxIPkwE36jmYJ0sbOs0wj/ywyOfmWkhlQDYEvVuoqmDrhtNSBj
	 ZexB6RLHFwAjhAht0UMxyEDGP6xL+4V12NX5Iu9xhf0iPSVxfA0/HWho0jIIHljTC4
	 RFgInGpClflmvherUDfnk+LD+RcGTl+PjHz6jfeClInDWrqzGP/OwIhhGZA4qQ+P1z
	 7BGUSaM3LfTxRGBBYY/7rqEZCw//i9puVdUbHmUmE7uzPuc/zjG6OV3ViBMTMsHGC3
	 TnhFe8yFIglN0hwB/nrnLuOAlQDDKB87b0+JUOn5dSUWwknIdCQGpKwpVI6GweTp0D
	 Tj/MhDCogAQRg==
Subject: Re: [PATCH] net: hso: fix tx skb leak when the device stops
From: netdev-bot+sashiko@kernel.org
To: chenaibing@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 21:20:42 +0000
Message-ID: <179477764293.3136.7267245337781305691@kernel.org>
In-Reply-To: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
References: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch adds an unsynchronized free of odev->skb_tx_buf in
  hso_net_close() (drivers/net/usb/hso.c:735-736).
- [Low] The newly added free in hso_net_close()
  (drivers/net/usb/hso.c:731-736) discards a frame that was accepted…
- [Low] The patch fixes a user-visible, syzbot-reported skb leak but
  carries no Fixes: tag (and no Cc: stable).

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  hso_net_start_xmit() (drivers/net/usb/hso.c:789) does…

--

net: hso: fix tx skb leak when the device stops

This patch frees the skb that hso_net_start_xmit() stashes in
skb_tx_buf when it runs in hso_net_close(), which is also reached on
disconnect. It also changes hso_resume() so that skb_tx_buf is cleared
before the lingering frame is passed back to hso_net_start_xmit().

Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/

> Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

[Severity: Low]
This patch fixes a leak that syzbot reported, but it has no Fixes: tag.

The resume path ordering changed here seems to come from commit
89930b7b5e3e ("hso: Fix URB submission -EINVAL."). The stash and
teardown logic dates back to commit 72dc1c096c70 ("HSO: add option hso
driver").

Should one of these be added as a Fixes: tag, along with Cc: stable?

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..03956fa8ee537 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c
> @@ -728,6 +728,13 @@ static int hso_net_close(struct net_device *net)
>  
>  	hso_stop_net_device(odev->parent);
>  
> +	/*
> +	 * A frame stashed by hso_net_start_xmit() will never be transmitted now,
> +	 * so drop it instead of leaking it.
> +	 */
> +	dev_kfree_skb(odev->skb_tx_buf);

[Severity: Low]
The comment says the frame is dropped, but dev_kfree_skb() is defined as
consume_skb(). The kfree_skb drop tracepoint and drop monitor will
never see this frame. net->stats.tx_dropped is not incremented either.

Would kfree_skb() or kfree_skb_reason(), plus net->stats.tx_dropped++,
match the intent better?

> +	odev->skb_tx_buf = NULL;
> +
>  	/* done */
>  	return 0;
>  }
> @@ -3055,12 +3062,13 @@ static int hso_resume(struct usb_interface *iface)
>  				/* First transmit any lingering data,
>  				   then restart the device. */
>  				if (hso_net->skb_tx_buf) {
> +					struct sk_buff *skb = hso_net->skb_tx_buf;
> +
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
>  					hso_net->skb_tx_buf = NULL;
> +					hso_net_start_xmit(skb, hso_net->net);

[Severity: High]
Can the new free in hso_net_close() race with this replay of the
lingering frame?

hso_net_close() runs as ndo_stop and holds only RTNL. hso_resume() runs
as the USB resume callback. One way it gets there is the async_get_intf
work, which hso_get_activity() schedules at the same moment the frame
is stashed:

hso_get_activity() {
    ...
	if (hso_dev->usb->state == USB_STATE_SUSPENDED) {
		if (!hso_dev->is_active) {
			hso_dev->is_active = 1;
			schedule_work(&hso_dev->async_get_intf);
    ...
}

The two paths share no lock, so this interleaving looks possible:

CPU1 (hso_resume)                    CPU2 (hso_net_close)
if (hso_net->flags & IFF_UP)
if (hso_net->skb_tx_buf)
skb = hso_net->skb_tx_buf;
                                     clear_bit(HSO_NET_RUNNING, ...);
                                     hso_stop_net_device(...);
                                     dev_kfree_skb(odev->skb_tx_buf);
hso_net->skb_tx_buf = NULL;
hso_net_start_xmit(skb, ...)
    memcpy(..., skb->data, skb->len);
    ...
    dev_kfree_skb(skb);

The device is configured again during resume. hso_net_start_xmit()
would therefore read the freed skb data, send it to the device, and then
free the skb a second time.

Before this patch, hso_net_close() never freed skb_tx_buf, so this race
could only cause a late transmit or a leak.

Clearing the pointer earlier in hso_resume() does not seem to close the
window. The load and the clear are still not atomic with respect to
close.

Could the stash, the replay and the free be serialized, for example
with net_lock or netif_tx_lock? HSO_NET_RUNNING could then be rechecked
under that lock. Another option would be
cancel_work_sync(&async_get_intf) in hso_net_close().

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. Since
the patch adds another caller of hso_net_start_xmit(), though: can that
function overflow mux_bulk_tx_buf?

hso_net_start_xmit() copies skb->len bytes without checking them
against MUX_BULK_TX_BUF_SIZE:

	memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);

The buffer has a fixed size, set in hso_create_net_device():

	hso_net->mux_bulk_tx_buf = kzalloc(MUX_BULK_TX_BUF_SIZE, GFP_KERNEL);

hso_net_init() only sets net->mtu = DEFAULT_MTU - 14 and never sets
net->max_mtu. As a result, dev_validate_mtu() skips the upper bound
check:

	if (dev->max_mtu > 0 && new_mtu > dev->max_mtu) {

After something like "ip link set hsoX mtu 9000", any packet larger
than 2048 bytes would overflow the kmalloc-2048 object. skb->len is
also used as the URB transfer length, so the USB controller would read
past the buffer as well.

Should hso_net_init() set net->max_mtu, or should
hso_net_start_xmit() check skb->len before the memcpy()?

>  				}
>  				result = hso_start_net_device(network_table[i]);
>  				if (result)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114093133.465-1-chenaibing%40cmss.chinamobile.com
