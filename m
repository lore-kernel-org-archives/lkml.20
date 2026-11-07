Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039234;
	b=m35HUqryXF5fPh5Gs5HJIjYQKw4NwfTHmKNJyfnzDm6Y3AOwvCZ+AskobMyzqksDRvHX
	 SwUirSq+wzO0YtWoVfo1iL23hpZToHiejnfMzT5X5RYOEXuXCqMpEbJ3q0wOtAc4CJcNZ
	 lauqg+84H4XQVwz78kwB0X1+rHTnANtdsLQyWSfT77eE33r7zSMXY/ETCQvpjH+MXfI65
	 XI/QCudP9P/uPr+UBTb5iFFBBp0wBJyS19amNcU/hGrbk/QwkZ8MQDAezUxhtX1HdVjqe
	 2A4VALCWFIz/L0jm0jZQkVsxK6C7G04ZGHxAgn6Hr2S7fG0qK2jEv+vqpwTDokPcErg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039234;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3UgaVUMTazCqkUjPb+NK9SOhfNMM9f3Jk8NTZVck/G0=;
	b=U+iAsDBupoArJUD8hwXuPK8qVDS/pmYW1zRkFdGG/w1isRSIfqArZJWLm1m2Pj179nw5
	 j5C4ak3U6n852Tq8xqDaa6ZcTR3h1m1f2ECLb8wUtBZpQhX3Xgh+3SSPAuM76bWNa4/uB
	 mQlXEpG6zada+4N4CufeFbLZoG5rGSSp7nJ83xdDEj4oTYX12pgLNO0oRnJyximuoXJM3
	 x3Y+9P08Uk/gpYYiAXcYiXRL+TFZoXIbpJQbpSDqk6YbNev8xm2x7viPK3Msxflac2WH9
	 bi5VVy23uK8PYUGV8mEPG/k46BpY7Pzya1kJClTvX/5yt0jMEk6Vuqj6CwBI5qyxKSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ohnOnvtI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB3606A32C;
	Sat,  7 Nov 2026 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ohnOnvtI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794039233;
	b=xwGqpTv5V/8h8rMLKtgzBCLJPVr+9sDRSJ2PcVnT0cafFlhbfFn+snvQQp7mD19Qd6VK
	 /JiloyljY08FfTTq85lapOtQSO64KWtZXOpFhFIrQ6MmGKzflBntyaUQtWxR+IOah0Hyc
	 PjwhU+a4VKiZ7zNF91KighAbf2xGJjBsa1/uHl70mF1fQaJKI2BLATq34Q4fBIdXFk71R
	 RfpaU2zSjb+OfbVXQPFNSiZkn+u6c6X47hKB4hWvzzpivYb5U/FnxyOSqbd8hppAQkahr
	 Dn/jnGtfw0XNsy/s5TdXb2Goc611G7Oo0VhkWPXN9+b+UfEGC1XXBpNapkztsvroxBg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794039233;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3UgaVUMTazCqkUjPb+NK9SOhfNMM9f3Jk8NTZVck/G0=;
	b=QflwAfGWBzteyNsqPdkFXem9EhWYppVoRn2w52Mx02yf2p5xyfPg0zX0zL7I7hnzY+ET
	 PYyxnsd7AQaENKY79SHTx8OQY8qylLo8Bgb9cPnGNI41jpT7EokojPqQaPP6g/Z8mv3n8
	 U36F5zK7bYU6uhBHtM4TB1CM4n4U56kLbgiQID+tFvR7i0ITczOs9m8dtlJ3yJxdLBUpW
	 Zq+2fM8PiMIliFTwQHP8dsk8HHv6dPjcNGoVfBBQaHuF0To6lkNHYucj6rezoqW7G5lEO
	 3fTKTXpd/rXqhh/T9yOX3GRv9B83e8PeLjRhiXilQQwCjsGn4XeQLT1ycI0775Kw7kA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 874CB1F008A1;
	Sat,  7 Nov 2026 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794039233;
	bh=3UgaVUMTazCqkUjPb+NK9SOhfNMM9f3Jk8NTZVck/G0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ohnOnvtIyqu1EECH6RffzhERRTXUbfq0qOHlWBDg9KFJMInWm7E/13IcNCLJwP/u7
	 5prVbwakRKd75PoBZZ5QhBb8e5OG4uXIaXqz8nSiZCjBmDxKwtsG2JsIfL6Ydj27Aa
	 mTwiYMU71chrm8kGPo/TnB4hDIqDISUE7qfY+JSCFGeEI1hJu1j7OZ3qg0ot8bYrVg
	 FyjUG6buR1eAaAptjMClwc3RttJ2dcebsJhKtXKL0AhgTWWJTP2NhuGOPfLaYjUTri
	 BbjbN909kagluvyW9pVu20yCtPRhngK+CL12xkaHjmTZsIdE07Aj2QbK2wckwkF1WK
	 aiug4KODadrJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DAF9247B14;
	Sat,  7 Nov 2026 08:13:51 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 02:13:51 -0600
Subject: [PATCH] staging: octeon: convert from ndo_get_stats to
 ndo_get_stats64
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
Message-Id: <20261107-octeon-get-stats64-v1-1-94cdedd8e9f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBvI7Ie6SrSwHGs2Go5EIN09a
 fkt3ssgFJkE5ipDpJuFgy9QdQX7afxByLYY2qYdlGpGDHui4PGghJJMkqFDPVltOjdtTvVQwiu
 S4+efLuv7fnJlqaZkAAAA
X-Change-ID: 20261107-octeon-get-stats64-39d3a4f9bf15
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794039231; l=5749;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=930QtnvR+WyHyNhL3+z3ix4Trio4JE/UI2vQH0/G6+I=;
 b=Qq8eUm8nI7O48uCTmo+hq1hLVmpOTKwmflK/g5TrenJCfHgJB3m08+eJwnKjmgpyN5O9tovDd
 fZyPcYqn6FaAzpVbN22AezCFHwElo2/5CU5/isHyW6G4ohRZW41kPgY
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Migrate the network device operations from the legacy ndo_get_stats
callback to ndo_get_stats64, populating the caller-provided
rtnl_link_stats64 structure via netdev_stats_to_stats64().

Update cvm_oct_periodic_worker() and cvm_oct_common_init() to avoid
calling the removed ndo_get_stats pointer directly.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..c61b1ad3f9b3 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -141,12 +141,12 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 	struct octeon_ethernet *priv = container_of(work,
 						    struct octeon_ethernet,
 						    port_periodic_work.work);
+	struct rtnl_link_stats64 stats;
 
 	if (priv->poll)
 		priv->poll(cvm_oct_device[priv->port]);
 
-	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats
-						(cvm_oct_device[priv->port]);
+	dev_get_stats(cvm_oct_device[priv->port], &stats);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
@@ -208,12 +208,12 @@ int cvm_oct_free_work(void *work_queue_entry)
 EXPORT_SYMBOL(cvm_oct_free_work);
 
 /**
- * cvm_oct_common_get_stats - get the low level ethernet statistics
- * @dev:    Device to get the statistics from
- *
- * Returns Pointer to the statistics
+ * cvm_oct_common_get_stats64 - get the low level ethernet statistics
+ * @dev:     Device to get the statistics from
+ * @storage: Pointer to stats64 structure to populate
  */
-static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
+static void cvm_oct_common_get_stats64(struct net_device *dev,
+				       struct rtnl_link_stats64 *storage)
 {
 	struct cvmx_pip_port_status rx_status;
 	struct cvmx_pko_port_status tx_status;
@@ -239,7 +239,7 @@ static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 		dev->stats.rx_dropped += rx_status.dropped_packets;
 	}
 
-	return &dev->stats;
+	netdev_stats_to_stats64(storage, &dev->stats);
 }
 
 /**
@@ -421,6 +421,7 @@ static int cvm_oct_common_set_mac_address(struct net_device *dev, void *addr)
 int cvm_oct_common_init(struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
+	struct rtnl_link_stats64 stats;
 	int ret;
 
 	ret = of_get_ethdev_address(priv->of_node, dev);
@@ -449,8 +450,8 @@ int cvm_oct_common_init(struct net_device *dev)
 	 * Zero out stats for port so we won't mistakenly show
 	 * counters from the bootloader.
 	 */
-	memset(dev->netdev_ops->ndo_get_stats(dev), 0,
-	       sizeof(struct net_device_stats));
+	cvm_oct_common_get_stats64(dev, &stats);
+	memset(&dev->stats, 0, sizeof(dev->stats));
 
 	if (dev->netdev_ops->ndo_stop)
 		dev->netdev_ops->ndo_stop(dev);
@@ -540,7 +541,7 @@ static const struct net_device_ops cvm_oct_npi_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif
@@ -556,7 +557,7 @@ static const struct net_device_ops cvm_oct_xaui_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif
@@ -572,7 +573,7 @@ static const struct net_device_ops cvm_oct_sgmii_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif
@@ -586,7 +587,7 @@ static const struct net_device_ops cvm_oct_spi_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif
@@ -602,7 +603,7 @@ static const struct net_device_ops cvm_oct_rgmii_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif
@@ -615,7 +616,7 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
 	.ndo_set_mac_address	= cvm_oct_common_set_mac_address,
 	.ndo_eth_ioctl		= cvm_oct_ioctl,
 	.ndo_change_mtu		= cvm_oct_common_change_mtu,
-	.ndo_get_stats		= cvm_oct_common_get_stats,
+	.ndo_get_stats64	= cvm_oct_common_get_stats64,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= cvm_oct_poll_controller,
 #endif

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-get-stats64-39d3a4f9bf15

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


