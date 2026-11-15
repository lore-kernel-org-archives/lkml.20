Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709575;
	b=WQI7YRZwlaTLSEgclTzFF04596LsYYTEg8YBT8H9T2dGXjnDJcR204T3MahEBtERPfVW
	 ev+SOPHNoA/gHom/dtmxTehc4rqRX3kKEQUKzymwdCCgfuPw6p5srCJ0vWsDJ3H8e+XMf
	 U38Vj+/oX3Btl7oPAyPUBVIPJjpMl6hJ3xPCr5tc9fIc9hU+jw1uqHeMCb1DbQa0h4rU4
	 OVD1FCj7N4mXBjqtn96kKc1a7aPHUH3eVJkmWmM5e6Vf4ZBio6G0pgzNKo+9k0IhJBn7B
	 9qEDYNScorMBVBPTT+e1BsAym+NWil6m4BhcFwvFEL3FF4/xZ2CS0e776L4SVssMnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
	b=JpQuMYXqal1ve68D1oxna5MnpbEWRE22TTcMh1qtGS8JqUtsQ4kzm4CeIEjBnKm1S2oH
	 chT9Kzk35ppQIRnj60bdfcBEtkK0+AEMXa1pIZpikubFVfQEgWFuhzPl41JpGGXzkkBH0
	 onpdjy15h3S9hwlWXRRHV9IaXX0Pnnd1222G7rTRuRbbhKRBT2t7FR9IaQAavTv8sTRiL
	 fmOOggSMhF4r6MvPLbdXtFhUGrRAFPwHznmzEQyJrjOUm2W60+6hfaMwgsSdNx2xV3EJn
	 iFtmVohae1+ykBJA4qNhe6iOaEYKDKQH0PDY8GDBVkYRTmUkCL5rPCkCsKzJh8mS/sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=COOHOC3S;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F260A2626
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4F260A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=COOHOC3S
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so2675312eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709574; x=1795314374; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
        b=COOHOC3SNj/KpBxEcf/QsRSmnqlsWhi5e94lm/DSozC20Xn5GGuvZPrPmA5/+1rLOv
         Eyi+EPYkkFRySwyZPu3AWpwoq6QMkdjk4qCwuGXhBsT0A59477mEYb/Pk3uuzAWQ9M02
         L9PaxbGISch72Ro5qJ3GBaUPt1AxEFWQ4V96aHSZ+/RsBhaJEsxC5jw99QNeRE9ZItJN
         mVZ+Q0l5OnEJQsw1Pb0L3joXS4QNXTDXYQnDaNUoimGy8sdSTOfByuF/XBfErko3S4yM
         VmmcMkFnlIflA+as5noXOBy4MnLkMrXRRlS6130chLy86IQrO3Gy3nCyFSFesymRFc+N
         i0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709574; x=1795314374;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
        b=Oa2DAIci/NYth/CiD4ey3IhY9Pv5aL4Wu19+YAhDOmif6vZIHzAbqHG39/UDlTWBpE
         N4unfjNkjFLW6LcSuM+U0Tv0hqh9TdWFNkPJX4IO3PPuyNitdOpJhfCMWD+PuPAts98U
         JAeBOhHfeCWeNidOgdnU4Fmj9TlahkPhSJwQ/qd3jvYmoMNBOF7UnET0HzS9EfOZy2jO
         8EyRSrY/va0cf+OvkHv4lsKlEahXu3SOQmSVC8oEzypPN99hbzN0os9cUjXD6FuizRn6
         A9FBXnke/Eflt5yP1eIpGg6r9y8MbcCCeKzFtIOVqyHDLh3uJC8F9EBPN0GaPU6oNpFa
         xE0w==
X-Forwarded-Encrypted: i=1; AL+hErE3i2yerhFhM0wHCAtG9bnWi52B9m7sbLMO90BXrXbGRzBFeVqmzLwsaAUIsfxk7BdLcztZ8HS88nF0Dx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z906CSNe9DfEuqPt0aDoucXQtUVRB0oz+XZeIIIoPWQufe+K974
	rfYxR2UdahQCKZR9m8DCyCOFHfU5ksilrMuVudE/C/lxbxnTfHqB0UrjbtovVyQQDS312xyItA8
	1R8ifRnu6T5gYr0N0XHOaw8gdUw==
X-Received: from dycaa9.prod.google.com ([2002:a05:7301:5409:b0:36d:d73d:fc3e])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1a0b:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37965ca86fcmr6555223eec.9.1794709574090;
 Sat, 14 Nov 2026 18:26:14 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:06 +0000
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-6-almasrymina@google.com>
Subject: [PATCH net-next v3 5/6] net: devmem: resolve physical map_dev for
 leased RX bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
virtual netdev in binding->map_dev without tracking the physical backing
netdev at all. When the physical backing netdev unregistered while a
leased RX binding was active, net_devmem_dev_unregister() did not match
the physical netdev and mp_dmabuf_devmem_uninstall() on the virtual
queue skipped unmapping because rxq->lease was set, leaving the dmabuf
attachment mapped against the freed physical dma_dev until
__net_devmem_dmabuf_binding_free() triggered a use-after-free in
dma_unmap_sg_attrs().

Return the physical backing net_device from netdev_nl_get_dma_dev() when
the RX queue is leased from another netdev, lock map_dev around
net_devmem_bind_dmabuf() when map_dev != netdev (matching
netdev_nl_bind_tx_doit()), assert in net_devmem_bind_dmabuf() that both
bind_dev and map_dev are locked, and reject binding when
!netif_lease_valid(map_dev).

Now that binding->map_dev always points to the physical DMA device for
both RX and TX bindings (never a queue leasee), drop the
!netif_is_queue_leasee(dev) guard in net_devmem_dev_unregister().

Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 11 +++++++++--
 net/core/netdev-genl.c | 19 ++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index a17ee27dc7cef..31ef17641ef19 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -267,8 +267,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 				NET_DEVMEM_BINDING_LIVE);
 		xa_unlock(&net_devmem_dmabuf_bindings);
-		if (!netif_is_queue_leasee(dev))
-			net_devmem_dmabuf_binding_unmap(binding);
+		net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
 		WRITE_ONCE(binding->map_dev, NULL);
 	}
@@ -323,6 +322,14 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	size_t i;
 	long err;
 
+	netdev_assert_locked(bind_dev);
+	netdev_assert_locked(map_dev);
+
+	if (!netif_lease_valid(map_dev)) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return ERR_PTR(-ENODEV);
+	}
+
 	if (!dma_dev) {
 		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
 		return ERR_PTR(-EOPNOTSUPP);
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 9e56c26fc65f9..442362f23fe88 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1005,12 +1005,15 @@ static int netdev_nl_read_rxq_bitmap(struct genl_info *info,
 
 static struct device *
 netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
+		      struct net_device **map_dev,
 		      struct netlink_ext_ack *extack)
 {
 	struct device *dma_dev = NULL;
 	u32 rxq_idx, prev_rxq_idx;
 
+	*map_dev = netdev;
 	for_each_set_bit(rxq_idx, rxq_bitmap, netdev->real_num_rx_queues) {
+		struct netdev_rx_queue *rxq;
 		struct device *rxq_dma_dev;
 
 		rxq_dma_dev = netdev_queue_get_dma_dev(netdev, rxq_idx,
@@ -1023,6 +1026,11 @@ netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
 
 		dma_dev = rxq_dma_dev;
 		prev_rxq_idx = rxq_idx;
+		if (netif_rxq_is_leased(netdev, rxq_idx) &&
+		    netif_is_queue_leasee(netdev)) {
+			rxq = __netif_get_rx_queue(netdev, rxq_idx);
+			*map_dev = rxq->lease->dev;
+		}
 	}
 
 	return dma_dev;
@@ -1032,9 +1040,9 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	unsigned int niov_shift = PAGE_SHIFT;
+	struct net_device *netdev, *map_dev;
 	u32 ifindex, dmabuf_fd, rxq_idx;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	unsigned long *rxq_bitmap;
 	struct device *dma_dev;
 	struct sk_buff *rsp;
@@ -1104,16 +1112,21 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	if (err)
 		goto err_rxq_bitmap;
 
-	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, info->extack);
+	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, &map_dev,
+					info->extack);
 	if (IS_ERR(dma_dev)) {
 		err = PTR_ERR(dma_dev);
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
+	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
 					 DMA_FROM_DEVICE, dmabuf_fd,
 					 niov_shift, priv, NETLINK_CB(skb).sk,
 					 info->extack);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
-- 
2.56.0.611.g1030f0b940-goog

