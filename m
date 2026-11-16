Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789855;
	b=2G7R8cXLILRb3lqFxJpbfaGJ2psCldAdP2Bk9o5/uLLVVEYSQBLtNdITlN/7W2JazsGv
	 Yb/AwctSyGGAbfQn1cp+xSXOfmbLY2/KWk8rR32VeIVA1M2NH3PeNHIc9gu5OxpDWJ8TY
	 M0FjGyLEdC6ZbO9G6+hTg/OUHsl9NTEADA3h/WLfaHSU9Z8FcBlE3ddudlUw1YaoHinAJ
	 qj3tZv4+46sW8DwpXtSQDfZlmvVkISkTvKY+cVOxFYAdoPoa/xQilJ8ZxwQJ9G4QusUTm
	 sRQov0EuSzrOuxKVYP/A6Zg9DET46HK95NqAihWhahtpXuc7nrc1Hukxk2uKanuyI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789855;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ISEuVjYQM8NCj0mZGFd4fsXBhv05BIQupK8d1+cRaYE=;
	b=UzsuWr6djodHRtJVSfJTJLjlcF32IDfvKBA22p3l5l0TxtIp9/lAbUDl2k+DOKBKcKX3
	 XoLluieB5RJckTCip2h9T8F/z8Sa/9cv2rGUNuHjTgw6R94WZtDY7WTow8Ovn/x9NcK+O
	 1gJ1kbPzNuam84KNd6py4jRFz3WtXq/CTG/nbUUars5Dk3aLq6VxTIBW6RHZS68rpNqEk
	 UZFFx+0Gk3Wcf/jz2MbQ0YE4TZL+jUmJmCSveZ9XdYa+I6h1gHdXAkgQZyom1q7iN4KjF
	 Q63s4EeagncW91vs97iLvNkAExt3a74vgLnuflqt+Aa2YiqlhvdhQ+fQPT5ibv5eV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhKuUoN2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B9606A337;
	Mon, 16 Nov 2026 00:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhKuUoN2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DE31F000C9;
	Mon, 16 Nov 2026 00:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794789855;
	bh=ISEuVjYQM8NCj0mZGFd4fsXBhv05BIQupK8d1+cRaYE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JhKuUoN2sfEI9yRCyu1pG3d3cKdyt4ERpoS8Y53YUTXlWV2wA4MXSnKolapdX6jyK
	 mfjBWb6JMNeJY7Iyh3zBogRLSlmAjVZaXAMDrUxML6yNpjKO4764Rmj65MoE9D5Cxs
	 fKzR+OZguQGjsa1Y3NIFHR8jmwE7qi7P5klN/IJpjBdd2QrIKzTyIao2RDZsdW22zh
	 +WTEO5z9zDChgcMo55NcKv/aJTXL8VQT13+h6+Uj2L432f9x0/v+HZBmuAO/Ff7i8x
	 0WQnk1TTqK1RhhgSMe72cuA5E7qtnAYLLazNoGCcoQOzb13Pi3JTUwMW0AuX1QZ4tu
	 WPbz0nQdOYGmg==
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for MHI
 endpoints
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
Date: Mon, 16 Nov 2026 00:44:13 +0000
Message-ID: <179478985375.3136.1235406838106549470@kernel.org>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
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

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Both the commit message and the new comment in
  include/net/qrtr.h say that 'an endpoint using v2 can never claim an…
- [Medium] MHI QRTR now registers a fixed nid, 0x10000 +
  mhi_cntrl->index, and this id is reused.
- [Medium] net: qrtr: missing sysfs ABI for host node ID in
  qcom_mhi_qrtr_probe()
- [Low] The comment in include/net/qrtr.h says 'A collision is caught
  when the id is added to the node lookup table.' One case is not…
- [Low] The host nid is now in qrtr_nodes from the moment
  qrtr_endpoint_register() runs.

--

net: qrtr: Assign unique node id for MHI endpoints

This adds include/net/qrtr.h. The header defines QRTR_NODE_HOST_BASE
(0x10000) and a qrtr_host_node_id() helper that returns the base plus a
per-device index. The MHI QRTR driver now registers its endpoint with
qrtr_host_node_id(mhi_cntrl->index) instead of QRTR_EP_NID_AUTO.

> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> new file mode 100644
> index 0000000000000..e2a8d93564b58
> --- /dev/null
> +++ b/include/net/qrtr.h
> @@ -0,0 +1,27 @@

[ ... ]

> +/*
> + * Base for the node ids the host assigns to endpoints. It sits just above the
> + * 16-bit range a v2 header can express, so a v2 endpoint can never claim an id
> + * in it. A v1 endpoint can claim any 32-bit id, so a collision is possible,
> + * but unlikely as the firmware assigned node ids are either smaller than this
> + * base or in the range of 0x08e5ff85. A collision is caught when the id is
> + * added to the node lookup table.
> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u

[Severity: Medium]
Is it accurate that a v2 endpoint can never claim an id in this range?
The commit message makes the same claims:

  "The base is chosen just above the 16-bit range a v2 header can
  express, so an endpoint using v2 can never claim an id in the host
  range."

  "Such a collision is caught when the id is added to the node lookup
  table."

In qrtr_endpoint_post(), the NEW_SERVER handler reads a 32-bit node id
from the payload, whatever the header version:

net/qrtr/af_qrtr.c:qrtr_endpoint_post() {
    ...
	if (cb->type == QRTR_TYPE_NEW_SERVER) {
		...
		nid = le32_to_cpu(pkt->server.node);

		if (nid != READ_ONCE(node->ep_nid)) {
			rc = qrtr_node_assign(node, nid);
    ...
}

That means a v2 endpoint can insert an id such as 0x10001 into
qrtr_nodes as a bridged key. A v1 endpoint can do the same through
src_node_id. __qrtr_node_assign() does not check the id against
QRTR_NODE_HOST_BASE.

The only collision handling is radix_tree_insert() returning -EEXIST,
so whoever claims the id first keeps it:

	rc = radix_tree_insert(&qrtr_nodes, nid, node);
	if (rc)
		return rc;

The host ids are easy to predict. They are 0x10000 plus the lowest free
IDA index, and they stay the same across MHI recovery. Another remote
endpoint could claim 0x10000 + N before MHI controller N registers, or
while it is between remove and re-probe. That endpoint could be another
MHI card's firmware, an SMD/rpmsg remoteproc, or a /dev/qrtr-tun user.

In that case, wouldn't
qcom_mhi_qrtr_probe()->qrtr_endpoint_register()->qrtr_node_assign()
get -EEXIST and abort the probe, so the device's QRTR link never comes
up? With QRTR_EP_NID_AUTO, registration could not fail on an id
conflict.

[Severity: Low]
One collision is not caught the way this comment describes: a
remote-claimed id that equals the endpoint's own host nid.
__qrtr_node_assign() returns success without an error in that case:

	if (radix_tree_lookup(&qrtr_nodes, nid) == node)
		return 0;

Suppose the remote behind MHI endpoint N sends a v1 src_node_id of
0x10000 + N (which differs from ep_nid), or a NEW_SERVER with
server.node = 0x10000 + N. The assign succeeds silently. The source id
is not rewritten either, because qrtr_endpoint_post() only rewrites
ep_nid:

	if (cb->src_node == READ_ONCE(node->ep_nid))
		cb->src_node = READ_ONCE(node->nid);

A local reply to 0x10000 + N is then rewritten in qrtr_node_enqueue():

		dst_node = to->sq_node;
		if (dst_node == READ_ONCE(node->nid))
			dst_node = READ_ONCE(node->ep_nid);

Wouldn't that send the reply to the endpoint's own node rather than the
bridged node that sent the packet? It would also merge the bridged
node's services with the endpoint's own.

[ ... ]

> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 1040c3c8cfd68..e9377f818b4dd 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c

[ ... ]

> @@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	if (rc)
>  		return rc;
>  
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +	rc = qrtr_endpoint_register(&qdev->ep,
> +				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));

[Severity: Medium]
This changes the node id that userspace sees for every MHI QRTR
endpoint. Before, the remote's own id was what ended up in qrtr_nodes
and in the NEW_SERVER notifications delivered to AF_QIPCRTR sockets.
Now a host nid is passed to qrtr_endpoint_register(), and
qrtr_endpoint_post() and qrtr_node_rewrite_ctrl() rewrite the
firmware-advertised id (node->ep_nid) to node->nid. Lookups therefore
report 0x10000 + mhi_cntrl->index.

How is a userspace client supposed to map an MHI device to its QRTR
node after this? As I understand it, on QAIC the firmware nid matches
the serial number exposed through sysfs and the QAIC control channel,
so a client could correlate the two. The lookup notifications only
carry service, instance, node and port. They have no device
identifier.

In-kernel users such as ath11k and ath12k can call
qrtr_host_node_id() on their own mhi_cntrl->index. However,
include/net/qrtr.h is not UAPI. The only option left for userspace
seems to be parsing the mhiN controller name and hardcoding
QRTR_NODE_HOST_BASE. That would turn an internal constant into ABI
without documenting it.

My understanding from earlier review of this series was that the
assigned node id would be exposed through a sysfs attribute. I can't
find that anywhere in v6. Was it dropped on purpose, or is it planned
for a follow-up? Since this is the patch that changes the ids
userspace sees, shouldn't the attribute land together with it?

[Severity: Medium]
Can a re-probe fail here while the previous qrtr_node is still
referenced?

This nid is now fixed and gets reused. mhi_unregister_controller()
frees the IDA index, and mhi_register_controller() gets the same value
back from ida_alloc(). MHI SYS_ERR recovery or a power cycle also
recreates the devices on the same controller.

qrtr_endpoint_register() now inserts the nid into qrtr_nodes at
registration time and returns -EEXIST if the slot is taken. However,
qrtr_endpoint_unregister() only drops its own reference:

	qrtr_node_release(node);
	ep->node = NULL;

The radix tree slots are removed only in __qrtr_node_release(), on the
final kref put:

	radix_tree_for_each_slot(slot, &qrtr_nodes, &iter, 0) {
		if (*slot == node)
			radix_tree_iter_delete(&qrtr_nodes, &iter, slot);
	}

qrtr_sendmsg() takes a node reference with qrtr_node_lookup() and holds
it until qrtr_node_release(). In between it calls
sock_alloc_send_skb(), which can block, and memcpy_from_msg(), which
can fault on user memory. qrtr_send_resume_tx() holds a reference in a
similar way.

qrtr_create() has no capability check, so an unprivileged user can
sendmsg() to the predictable host nid with a slow-faulting buffer, for
example a FUSE-backed mapping. That keeps the old node referenced.

If the device is re-probed during that window, wouldn't
radix_tree_insert() return -EEXIST and make qcom_mhi_qrtr_probe() fail?
The QRTR link would then stay down until the next probe. With
QRTR_EP_NID_AUTO, registration always succeeded and later packets
retried the assignment.

[Severity: Low]
Does passing a concrete nid here open a window where DATA packets go
out with a broadcast destination node id?

The node can be looked up by 0x10000 + index as soon as
qrtr_endpoint_register() runs. node->ep_nid stays QRTR_EP_NID_AUTO
(0xFFFFFFFF) until qrtr_endpoint_post() receives the first packet.
qrtr_hello_work() sends HELLO right away, and hello_sent is set once
xmit succeeds, whether or not the remote has replied.

Consider a qrtr_sendmsg() of a DATA packet to (0x10000 + index, port)
in that window. It passes the lookup and the hello_sent check, and then
qrtr_node_enqueue() does:

		dst_node = to->sq_node;
		if (dst_node == READ_ONCE(node->nid))
			dst_node = READ_ONCE(node->ep_nid);
		hdr->dst_node_id = cpu_to_le32(dst_node);

Wouldn't that put dst_node_id = 0xFFFFFFFF (QRTR_NODE_BCAST) in a
unicast DATA header sent to the firmware? With QRTR_EP_NID_AUTO, a node
only became findable in the same critical section that set ep_nid, so
this state could not occur.

>  	if (rc)
>  		goto err_unprepare;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-qrtr-multi-ep-v6-0-2eb9885659e2%40oss.qualcomm.com
