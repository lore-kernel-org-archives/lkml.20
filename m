Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666384;
	b=NDB50ytxI7zuJYy0k726EKuLCP91tK/LILR5DpuIk4ZxBugye0mEJvlztG79lk0U8EPB
	 K0zKdEfSH6KUvRgf0S4ASwp6IgLP1H8Fi9DA0/LT1cqT5OYs3dgjj9mZH2bk+YrtRYsmg
	 su4OpWSB0l+iHU8AXAUBSpg4LFJyf5y6v/JZFpPSTXDI7j34kt6oeW35D279Fko1FG/JQ
	 eVipD5V1Hgj0IovcRu6riGQK+tyVEZ0eIAqkVjZu8ixtaoIvhDHprlJ5kRrUhnB05Evss
	 Vngus4713juijZOpgXI1wSz9kNoZm2kQ8oOre2Z2trlq8e4SY0bW6ItCO1i9FTLhNqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666384;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c5hLouU63MKf0S+VRKxiE981wQdchdO7ZcCZzt70ziY=;
	b=M7IKJiJeOurZdqovvT7jBeocHxK8YSNlT1mh5gGHJF+7ZCIF4Jufx6ceOqSZboJnhd5w
	 PC0KJR0SnyI02Yh4ZzhU4YndRCnPLaZh90S4HI73Gv6UCS+xrITrDtyGHFzRLVDE/UUrG
	 I2ntNrtXh07VI338SpTIJRvLgRTTvZGlrhHLqKiLCpvbnkGSf+hnne1LP5EFqoRWb660m
	 pF6tDG3g3SzgED40Bea31SRoFVXCyuPu3BCv/GSLvnMM/cEJj7WtNCvtaAdoOqTjKl+gU
	 s9ZNPf80pxVq4VGOmNk5QsxPiGSs3owAqcoYvTs94UFhSMqi7+7oS9qZ0C8i827LkQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSHX7OCo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF9606A327;
	Sat, 14 Nov 2026 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSHX7OCo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666384;
	b=Ni9pWeetlRoIbVu++EoUYDLoC3dqPczDVK/O+UENFmOmrxAs8qQliiR1DXoOZbvcXzcd
	 qKsL6mDFgGbPMOecYGHPROxFT1ym2o6kf0m2OSrcvoXf6YZRagibVY6wXUmafWiazzsaJ
	 ykiPwQm5b1hcYWGQeJi5ed8m3cEB2XPTxZ7wwvzouHWot6uF2D8hMe42V7m0d1TCjBkNX
	 nk974RlsFxMZ1myAsLHhHidCXisT6sxHxmaD18ZvFgQ8wEVkJp4j2vT60UIQwtDvrRTHU
	 WEesgxji2jzL+SuBezQWleF5XhtcmGoTzOlkD7qP+YG7TATR0jcFlko47Ldg9TxGKqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c5hLouU63MKf0S+VRKxiE981wQdchdO7ZcCZzt70ziY=;
	b=I1mbt+3kbGLwdubseCPLltPhGpXi6N/+xqWwRaplHG3tVZKEBeRtzW+4flWc5EtqhftQ
	 Je1KKn6bzeGTIhNviaB+Wd/QqOwvFuAFhj3NHaaHI2PqC1VLJ4jeYEm8VRdxhhBpxYvWP
	 pAMM8GZwFYntLSQdnXFIr/AhRN3t9uw+K42QFjZ6qXO5MuIMN5OyInud/90P3RyXyxcqE
	 rCw5Qx+16/iQmD8EAHNbLBkyIjp0yPeCDSk71sxWEFVFOZVXjSqjrirWrkswso3ZM1UtU
	 yT7khSayskSpqIcQP6EACBmf8bRNcfchAvaJltkFXFguxpBN/pkxCwRr24sB/RggOVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1ED41F000C4;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666384;
	bh=c5hLouU63MKf0S+VRKxiE981wQdchdO7ZcCZzt70ziY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cSHX7OCoEIhz3ZIVbAETmk2CGkxkSe2ImUmA5TAKiGZ10zxRF4qv4N97Ih5TeegTD
	 j/2mtjb752evoELy+CV2dQJ7NQN+6lk7ZuOqulg0DqSoN/1ShDPTD5YarHDGm2HZCz
	 6tUN1iiIPb/WqDChYpiFjeb5+M70oaoPrVz8kO6pYvu4Q99A3+aS93JHekkYCw/Ytq
	 vuwtBKNwRi4j169QL8CCOayfC9YWYIa/dTQ0YUAFbmDLy4ya7L7o8Kt/Mav1cYvpU2
	 IpZFwcU22OSlLnF4EQxuy/xrstmWi+4C5vOOEi5Qiow1Byi0xYKmTgOPlVlENIQSZc
	 7DQu2TaEGZfqw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6BDE549E0A;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sat, 14 Nov 2026 06:26:13 -0800
Subject: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign a
 unique node id
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9753;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=itpNcDJIBJ3puJEbvOx8X3vEbV1CcVXXyMZImRMrqBY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+Lqsf7WRyyALsoiiLhgISSH7S/iaH0G+EJG
 zXj0BDWJnmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhviwAKCRBVnxHm/pHO
 9R0dCACYgNDnM8HvDJandAjPcrDCUimBm2MNIfoh11meyuHyMIfKfPIbA5dHCiQ50V+zzzaCIsE
 vc4I6kSb9afW8Qeq3YWHp4sCD1vhi6qYPjwujzpKFxK65ouz1H7F1gDmXkUzjpGVPcIbdokWBzl
 p0mtrhFH1X450PYkHBQJswYG7N3/cdUDt+GfM3Rl+lWyGjW+grU8qnYk6LyLrdv+midKUev2/dC
 S3HYnWEkXZobmDfvxxnf7G0APL5bRVkhQND369wVSh9+BAixq7YhH3+nVXywZjCIBxzaZ4qFwBo
 rPVNRQFBAq4X+QotK2ClGUwtxO/3uEqA6pAvrQ58EVwvdRYa
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Currently, QRTR identifies each remote node by the value of the
'src_node_id' field in the received packet and uses the node id as the key
to store the node to the internal 'qrtr_nodes' radix tree.

But this approach comes with a limitation. When more than one remote node
share the same id, then QRTR can only add the first node to the radix tree
and has to drop the successive nodes with the same node id as the 'key' in
radix tree has to be unique. This prevents connecting identical Qcom PCIe
WLAN devices to a single host at the same time.

To fix this limitation, allow the host QRTR to use the node id (nid)
received from the endpoint driver during qrtr_endpoint_register() as the
unique node id and use it as the 'key' for the internal radix tree. Also,
store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
differ i.e., an endpoint driver has passed a unique 'nid' during
qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
'ep_nid' while sending the packet back to the remote node if both differ.

A node can also bridge other distant nodes, so the source id of an
incoming packet is not always the id the endpoint advertises for itself.
Keep adding such ids to the radix tree as additional keys for the same
node, as it was done before this change. Otherwise the bridged nodes would
lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
for them.

Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
routing behavior is not changed.

Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
qrtr_endpoint_post() to cover both types.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 16 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 45cb8e8c36ca..fff1d70fd8bf 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -118,7 +118,8 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
  * @ep_lock: lock for endpoint management and callbacks
  * @ep: endpoint
  * @ref: reference count for node
- * @nid: node id
+ * @nid: node id assigned by the host QRTR
+ * @ep_nid: endpoint's own node id as received
  * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @hello_sent: hello packet send successful
@@ -132,6 +133,7 @@ struct qrtr_node {
 	struct qrtr_endpoint *ep;
 	struct kref ref;
 	unsigned int nid;
+	unsigned int ep_nid;
 
 	struct xarray qrtr_tx_flow;
 	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
@@ -349,6 +351,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 {
 	struct qrtr_hdr_v1 *hdr;
 	size_t len = skb->len;
+	unsigned int dst_node;
 	int rc, confirm_rx;
 
 	mutex_lock(&node->ep_lock);
@@ -371,10 +374,14 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	hdr->src_node_id = cpu_to_le32(from->sq_node);
 	hdr->src_port_id = cpu_to_le32(from->sq_port);
 	if (to->sq_port == QRTR_PORT_CTRL) {
-		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->nid));
+		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->ep_nid));
 		hdr->dst_port_id = cpu_to_le32(QRTR_PORT_CTRL);
 	} else {
-		hdr->dst_node_id = cpu_to_le32(to->sq_node);
+		/* Put back the endpoint's own node id */
+		dst_node = to->sq_node;
+		if (dst_node == READ_ONCE(node->nid))
+			dst_node = READ_ONCE(node->ep_nid);
+		hdr->dst_node_id = cpu_to_le32(dst_node);
 		hdr->dst_port_id = cpu_to_le32(to->sq_port);
 	}
 
@@ -424,23 +431,75 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
 	return node;
 }
 
-/* Assign node id to node.
+/*
+ * Add 'nid' as a lookup key for 'node', and adopt it as the node's own id if
+ * the node does not have one yet.
+ *
+ * Callers must hold 'qrtr_nodes_lock'.
  *
- * This is mostly useful for automatic node id assignment, based on
- * the source id in the incoming packet.
+ * Return: 0 on success; negative error code on failure
  */
-static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
+static int __qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
-	unsigned long flags;
+	int rc;
 
 	if (nid == QRTR_EP_NID_AUTO)
-		return;
+		return 0;
+
+	if (radix_tree_lookup(&qrtr_nodes, nid) == node)
+		return 0;
+
+	rc = radix_tree_insert(&qrtr_nodes, nid, node);
+	if (rc)
+		return rc;
 
-	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	radix_tree_insert(&qrtr_nodes, nid, node);
 	if (node->nid == QRTR_EP_NID_AUTO)
 		WRITE_ONCE(node->nid, nid);
+
+	return 0;
+}
+
+/*
+ * Assign node id to node.
+ *
+ * Return: 0 on success; negative error code on failure
+ */
+static int qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
+{
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&qrtr_nodes_lock, flags);
+	rc = __qrtr_node_assign(node, nid);
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
+
+	return rc;
+}
+
+/*
+ * Replace the node id in the control packet with 'node->nid', if both are
+ * different.
+ */
+static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
+				   struct sk_buff *skb)
+{
+	unsigned int ep_nid = READ_ONCE(node->ep_nid);
+	unsigned int host_nid = READ_ONCE(node->nid);
+	struct qrtr_ctrl_pkt *pkt;
+	__le32 *nid;
+
+	if (host_nid == ep_nid)
+		return;
+
+	pkt = (struct qrtr_ctrl_pkt *)skb->data;
+	if (type == QRTR_TYPE_DEL_CLIENT || type == QRTR_TYPE_RESUME_TX)
+		nid = &pkt->client.node;
+	else
+		nid = &pkt->server.node;
+
+	/* Rewrite only the endpoint's node id, not those of bridged nodes */
+	if (le32_to_cpu(*nid) == ep_nid)
+		*nid = cpu_to_le32(host_nid);
 }
 
 /**
@@ -459,9 +518,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	struct qrtr_sock *ipc;
 	struct sk_buff *skb;
 	struct qrtr_cb *cb;
+	unsigned long flags;
 	size_t size;
 	unsigned int ver;
+	unsigned int nid;
 	size_t hdrlen;
+	int rc = 0;
 
 	if (len == 0 || len & 3)
 		return -EINVAL;
@@ -523,6 +585,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		goto err;
 
 	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
+	     cb->type == QRTR_TYPE_DEL_SERVER ||
+	     cb->type == QRTR_TYPE_DEL_CLIENT ||
 	     cb->type == QRTR_TYPE_RESUME_TX) &&
 	    size < sizeof(struct qrtr_ctrl_pkt))
 		goto err;
@@ -533,14 +597,36 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 	skb_put_data(skb, data + hdrlen, size);
 
-	qrtr_node_assign(node, cb->src_node);
+	nid = cb->src_node;
+
+	spin_lock_irqsave(&qrtr_nodes_lock, flags);
+
+	if (node->ep_nid == QRTR_EP_NID_AUTO)
+		WRITE_ONCE(node->ep_nid, nid);
+
+	/*
+	 * Add the source id to the lookup table only if 'node->nid' is auto
+	 * assigned or the packet came from a bridged node.
+	 */
+	if (node->nid == QRTR_EP_NID_AUTO || nid != node->ep_nid)
+		rc = __qrtr_node_assign(node, nid);
+
+	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
+
+	if (rc)
+		goto err_nid;
 
 	if (cb->type == QRTR_TYPE_NEW_SERVER) {
 		/* Remote node endpoint can bridge other distant nodes */
-		const struct qrtr_ctrl_pkt *pkt;
+		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
+
+		nid = le32_to_cpu(pkt->server.node);
 
-		pkt = data + hdrlen;
-		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
+		if (nid != READ_ONCE(node->ep_nid)) {
+			rc = qrtr_node_assign(node, nid);
+			if (rc)
+				goto err_nid;
+		}
 	}
 
 	if (cb->type == QRTR_TYPE_HELLO) {
@@ -548,6 +634,15 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		smp_store_release(&node->hello_rcvd, true);
 	}
 
+	if (cb->src_node == READ_ONCE(node->ep_nid))
+		cb->src_node = READ_ONCE(node->nid);
+
+	if (cb->type == QRTR_TYPE_NEW_SERVER ||
+	    cb->type == QRTR_TYPE_DEL_SERVER ||
+	    cb->type == QRTR_TYPE_DEL_CLIENT ||
+	    cb->type == QRTR_TYPE_RESUME_TX)
+		qrtr_node_rewrite_ctrl(node, cb->type, skb);
+
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
 		qrtr_tx_resume(node, skb);
 	} else {
@@ -565,6 +660,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 
 	return 0;
 
+err_nid:
+	pr_err_ratelimited("qrtr: cannot route node id %u: %d\n", nid, rc);
 err:
 	kfree_skb(skb);
 	return -EINVAL;
@@ -684,6 +781,7 @@ EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
 int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 {
 	struct qrtr_node *node;
+	int rc;
 
 	if (!ep || !ep->xmit)
 		return -EINVAL;
@@ -696,6 +794,7 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	mutex_init(&node->ep_lock);
 	skb_queue_head_init(&node->rx_queue);
 	node->nid = QRTR_EP_NID_AUTO;
+	node->ep_nid = QRTR_EP_NID_AUTO;
 	node->ep = ep;
 
 	node->hello_sent = false;
@@ -704,7 +803,12 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	xa_init(&node->qrtr_tx_flow);
 	mutex_init(&node->qrtr_tx_lock);
 
-	qrtr_node_assign(node, nid);
+	rc = qrtr_node_assign(node, nid);
+	if (rc) {
+		pr_err("qrtr: cannot assign node id %u: %d\n", nid, rc);
+		kfree(node);
+		return rc;
+	}
 
 	mutex_lock(&qrtr_node_lock);
 	list_add(&node->item, &qrtr_all_nodes);

-- 
2.43.0


