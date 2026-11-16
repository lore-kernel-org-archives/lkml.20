Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789853;
	b=l7QCk8cW3yoQgAfsPTHAjE87j4ndriIa5gLL+O5T/dmjYoeuIxrm6DVd+3hFivaXfOLh
	 RhMCAIJ2TjSuhxM+l9MtZ02I08mx0VKO5wYooJSxDTkseU7TiiAyKK+WSR8SClWHcTVQa
	 s6iXuQKJXxWad+TYJCAgmMrXsJubfQYNvPcOeTWvXH8oSJgMAREYQPgOWY6+Abgahn4Wo
	 7B1izBW84uJfiYRppfGFDIcuujJqsb//Rc8XA8GErUI+5bnCH35idVbe4lyy+iSh+vdwu
	 ZrtKjam1j/aaH4H6U7CPTC9rR3AloD7XQe5kpY1EBLgZSoVaIZuC3YEwKEpczIfhP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789853;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=boP3TDoFz59Ih81IUQg+NDTi2BNfV6i2vvoA7UF1O/o=;
	b=IALCaT6Tb7KOvtdncJz1sxsaMe+B7M5XfDCpQrWZYeSOIs5aLAkLpomr4fsf8dfvbBfM
	 lX1DAo+t8ZFLgklOo3v//zIKW6WZyMUfPkPs1Xvc4s0rurAdJ/QPK38YkfXBHvWjF9r2t
	 52ifDSqf1WN2WiOubpP8X1qrdMzLWESEsWKzq3X8qsc+9+cvAmWVZBR7zPuXfTQ6yNwBp
	 M3AoZNXyEK2SstKmC/qtfoTJjVzSYKRGwPIwsgf30NuUFk8bwRGWV9SwqeH6I1Xjf9evv
	 NIpeFyfHRQPBLM51WP4hK3+DGXMwGpYuE2cC+YdnsGvRofk0HHWr2d9sf7Bfxq/+Kvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOWrmDTo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0B606A32F;
	Mon, 16 Nov 2026 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOWrmDTo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB3B1F000C4;
	Mon, 16 Nov 2026 00:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794789853;
	bh=boP3TDoFz59Ih81IUQg+NDTi2BNfV6i2vvoA7UF1O/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oOWrmDTogG20YLkFe/iPh+utOr2EnTfiQRd9sOHgZ7uM5Fgf+PYrx32vKk1pdFFAo
	 ve3l2wVYahMq6xlHCGjG5pJbIqVFnckIO3ReiPA6N36hBPwHqY7RulYtNupMbps3z5
	 myDQJ0wcfU9GnR1TvyTKfCokAzJFS2c8+po+JFtO9E1+pcvLjZCU4yoGPTELhJnUK1
	 FyHWbePJMIzwBWjh7L+UgLfkZ9ZeiFg9MSfDoyT9DsWIIWvcUxikvjZqPoQ3fY00xi
	 /qayuR7NSOjxw26QCxTRzi7gbGYOGJUf8aZgYZAFxNC7BSYUiUKyiyTbM8duxor4Jp
	 VIH4ypphiUD9A==
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
From: netdev-bot+sashiko@kernel.org
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, jjohnson@kernel.org, edumazet@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
Date: Mon, 16 Nov 2026 00:44:11 +0000
Message-ID: <179478985187.3136.15328141866524028119@kernel.org>
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] A failed node-id insert now drops the packet, where the old
  code still delivered it, and a dropped HELLO is never recovered.
- [Medium] In AUTO mode, nid and ep_nid can end up different, which the
  commit message says cannot happen, and the rewrite logic then…
- [Low] The TX path now uses node->ep_nid as the destination, but the
  readiness guard still checks node->nid, so packets can go out…
- [Low] The new control-packet handling is keyed on the QRTR header type
  (cb->type), but the consumer acts on the payload cmd field.
- [Low] The struct qrtr_node kernel-doc describes @ep_nid as the
  "endpoint's own node id as received", but qrtr_endpoint_post() latches…

--

net: qrtr: Allow the host QRTR to assign a unique node id

This commit lets the host QRTR use the nid passed to
qrtr_endpoint_register() as the key in the qrtr_nodes radix tree. The
endpoint's own source id is stored in a new qrtr_node->ep_nid field.
Node ids in incoming packets are rewritten from ep_nid to nid, and
outgoing destinations are rewritten from nid back to ep_nid. Errors from
radix_tree_insert() are now passed back to the caller.

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 45cb8e8c36ca2..fff1d70fd8bfc 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -118,7 +118,8 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
>   * @ep_lock: lock for endpoint management and callbacks
>   * @ep: endpoint
>   * @ref: reference count for node
> - * @nid: node id
> + * @nid: node id assigned by the host QRTR
> + * @ep_nid: endpoint's own node id as received

[Severity: Low]
Is this description accurate? qrtr_endpoint_post() sets ep_nid from the
src_node of the first packet that arrives, whatever its type:

	if (node->ep_nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->ep_nid, nid);

Nothing checks that this packet is a HELLO, or that it came from the
endpoint itself and not from a node it bridges. The commit message itself
says incoming source ids can belong to bridged nodes.

Suppose the first packet is forwarded from a bridged node Y. Then ep_nid
becomes Y, and the endpoint's real id X is treated as a bridged key. Y's
traffic is rewritten to the host nid in qrtr_endpoint_post() and
qrtr_node_rewrite_ctrl(). TX addressed to the host nid in
qrtr_node_enqueue() goes to Y.

With the later explicit-nid MHI change, would the ath11k/ath12k host nid
filter in their qmi_ops_new_server() callbacks then accept Y's services
and reject X's?

[ ... ]

> @@ -371,10 +374,14 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	hdr->src_node_id = cpu_to_le32(from->sq_node);
>  	hdr->src_port_id = cpu_to_le32(from->sq_port);
>  	if (to->sq_port == QRTR_PORT_CTRL) {
> -		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->nid));
> +		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->ep_nid));
>  		hdr->dst_port_id = cpu_to_le32(QRTR_PORT_CTRL);
>  	} else {
> -		hdr->dst_node_id = cpu_to_le32(to->sq_node);
> +		/* Put back the endpoint's own node id */
> +		dst_node = to->sq_node;
> +		if (dst_node == READ_ONCE(node->nid))
> +			dst_node = READ_ONCE(node->ep_nid);
> +		hdr->dst_node_id = cpu_to_le32(dst_node);
>  		hdr->dst_port_id = cpu_to_le32(to->sq_port);
>  	}

[Severity: Low]
Can ep_nid still be QRTR_EP_NID_AUTO at this point?

The readiness guard in qrtr_bcast_enqueue() still checks node->nid, not
ep_nid:

	/* Skip nodes with no assigned node ID yet. */
	if (READ_ONCE(node->nid) == QRTR_EP_NID_AUTO)
		continue;

When qrtr_endpoint_register() is given an explicit nid, node->nid is set
at registration time. ep_nid stays QRTR_EP_NID_AUTO until the first RX
packet. The later commit "net: qrtr: Assign unique node id for MHI
endpoints" makes this the normal MHI case.

Consider the window after hello_sent is set but before the remote's first
packet arrives. Would ns broadcasts (NEW_SERVER, DEL_SERVER, DEL_CLIENT)
and data packets sent to the host nid go out with dst_node_id 0xffffffff
during that window?

In QRTR_EP_NID_AUTO mode, ep_nid and node->nid are written by separate
WRITE_ONCE() stores in qrtr_endpoint_post() and __qrtr_node_assign(), with
no ordering between them. qrtr_bcast_enqueue() and qrtr_node_enqueue()
read both without taking qrtr_nodes_lock. Could a weakly ordered CPU see
the new nid together with the old ep_nid?

[ ... ]

> @@ -533,14 +597,36 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  
>  	skb_put_data(skb, data + hdrlen, size);
>  
> -	qrtr_node_assign(node, cb->src_node);
> +	nid = cb->src_node;
> +
> +	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> +
> +	if (node->ep_nid == QRTR_EP_NID_AUTO)
> +		WRITE_ONCE(node->ep_nid, nid);
> +
> +	/*
> +	 * Add the source id to the lookup table only if 'node->nid' is auto
> +	 * assigned or the packet came from a bridged node.
> +	 */
> +	if (node->nid == QRTR_EP_NID_AUTO || nid != node->ep_nid)
> +		rc = __qrtr_node_assign(node, nid);
> +

[Severity: Medium]
Can node->nid and ep_nid end up different for an endpoint registered with
QRTR_EP_NID_AUTO? The commit message says they stay the same for these
callers.

ep_nid is set before __qrtr_node_assign() runs, whether or not it
succeeds. Consider an AUTO endpoint where:

1. The first packet's src X is already owned by another node (-EEXIST),
   or the GFP_ATOMIC insert fails (-ENOMEM). ep_nid = X is set,
   node->nid stays QRTR_EP_NID_AUTO, and the packet is dropped.

2. The next packet is forwarded from a bridged node Y. node->nid is still
   QRTR_EP_NID_AUTO, so __qrtr_node_assign(Y) succeeds and adopts Y:

	if (node->nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->nid, nid);

Now nid == Y and ep_nid == X. From then on, packets from X have
cb->src_node rewritten to Y. qrtr_node_rewrite_ctrl() also rewrites
NEW_SERVER, DEL_SERVER, DEL_CLIENT and RESUME_TX payloads that name X so
they name Y.

In qrtr_node_enqueue(), packets addressed to the real bridged node Y are
rewritten to dst_node_id X, so Y can no longer be reached. X is never
inserted later either, because the condition above skips the insert once
node->nid is set and nid == ep_nid.

Before this patch, node->nid would simply have become X, and Y was routed
through its own key. Is this change in behavior intended?

> +	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
> +
> +	if (rc)
> +		goto err_nid;
>  
>  	if (cb->type == QRTR_TYPE_NEW_SERVER) {
>  		/* Remote node endpoint can bridge other distant nodes */
> -		const struct qrtr_ctrl_pkt *pkt;
> +		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
> +
> +		nid = le32_to_cpu(pkt->server.node);
>  
> -		pkt = data + hdrlen;
> -		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
> +		if (nid != READ_ONCE(node->ep_nid)) {
> +			rc = qrtr_node_assign(node, nid);
> +			if (rc)
> +				goto err_nid;
> +		}
>  	}

[Severity: Medium]
Is it intended that a failed node id insert now drops the whole packet?

Before this patch, qrtr_node_assign() ignored the result of
radix_tree_insert(). The packet was still delivered, and node->nid was set
anyway. Now __qrtr_node_assign() can return -EEXIST, or -ENOMEM because
qrtr_nodes is a GFP_ATOMIC radix tree. Both goto err_nid sites above then
free the skb.

For QRTR_EP_NID_AUTO endpoints (smd and tun, and MHI as of this commit),
these cases seem to follow.

If the source id X is already a key owned by another qrtr_node, every
packet from this node is dropped. node->nid stays QRTR_EP_NID_AUTO, the
insert is retried and fails on every packet, and qrtr_bcast_enqueue()
skips the node.

If the first packet hits a transient -ENOMEM or a stale key, the remote's
HELLO is dropped before hello_rcvd is set and before it reaches the ns
control port. Stale keys are possible because keys are only removed in
__qrtr_node_release() at the final kref put, not in
qrtr_endpoint_unregister(). qrtr_sendmsg() and qrtr_send_resume_tx() can
hold that reference.

In that case qrtr_hello_work() does not reschedule:

	/* Pairs with smp_store_release() in qrtr_endpoint_post() */
	if (!smp_load_acquire(&node->hello_rcvd))
		goto out;

Would the ns then never see this node's HELLO, even after the conflict
goes away?

Even with an explicit nid, a whole NEW_SERVER is now dropped when its
bridged server.node is owned by another node. Before, only the extra key
was skipped.

The commit message says:

    Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
    during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
    routing behavior is not changed.

Given these new drops, is that statement still accurate?

> @@ -548,6 +634,15 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		smp_store_release(&node->hello_rcvd, true);
>  	}
>  
> +	if (cb->src_node == READ_ONCE(node->ep_nid))
> +		cb->src_node = READ_ONCE(node->nid);
> +
> +	if (cb->type == QRTR_TYPE_NEW_SERVER ||
> +	    cb->type == QRTR_TYPE_DEL_SERVER ||
> +	    cb->type == QRTR_TYPE_DEL_CLIENT ||
> +	    cb->type == QRTR_TYPE_RESUME_TX)
> +		qrtr_node_rewrite_ctrl(node, cb->type, skb);
> +

[Severity: Low]
Should these checks and the rewrite be keyed on the payload cmd instead of
cb->type?

qrtr_ns_worker() in net/qrtr/ns.c dispatches on the payload and never sees
the header type:

	cmd = le32_to_cpu(pkt->cmd);

qrtr_endpoint_post() accepts any header type sent to QRTR_PORT_CTRL. So a
remote can send a QRTR_TYPE_DATA packet to the CTRL port carrying a
NEW_SERVER, DEL_SERVER or DEL_CLIENT payload. For such a packet, the new
NEW_SERVER server.node ownership check and qrtr_node_rewrite_ctrl() are
both skipped. The cb->src_node rewrite above still runs.

This seems to lead to the following.

A NEW_SERVER payload that names another device's host nid gets past the
new -EEXIST rejection and is registered in the ns.

For a DEL_CLIENT payload under a different header type, from is rewritten
to the host nid but client.node stays at ep_nid. The anti-spoof check in
ctrl_cmd_del_client() then rejects it:

	/* Don't accept spoofed messages */
	if (from->sq_node != node_id)
		return -EINVAL;

NEW_SERVER payloads are recorded under ep_nid instead of the unique host
nid.

Also, qrtr_node_rewrite_ctrl() chooses the union member from the header
type:

	if (type == QRTR_TYPE_DEL_CLIENT || type == QRTR_TYPE_RESUME_TX)
		nid = &pkt->client.node;
	else
		nid = &pkt->server.node;

With a DEL_CLIENT header and a NEW_SERVER payload, would this rewrite
client.node? That field is at the same offset as server.service.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-qrtr-multi-ep-v6-0-2eb9885659e2%40oss.qualcomm.com
