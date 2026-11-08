Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794138543;
	b=1T/io+knUTrb6wtWkdcUGb/5DDMJWZeR7ZA9/ubjv6e6YRQv+RtggwShPxshGwEaqAUA
	 ti3Yd34/HzBhKWJVNTH0KvhguGZ7nJFqLU9fTpBRyKejjtefLy2HT3IxqATY1QDg9V/oT
	 sP7lLqB2yVusEXsy/mkHl9bFOGYizhakH+YqNGDStiv7iJaUVEieUkZ2qODJiYZe0qCUg
	 RNzRXlgrNjyf81wUpGcMvKcZsEKQVp3fpnLT0ngUNa6KoIY43wY62Ge6xsHIcgcD//ss2
	 /U7Z+G3WN898eJNiWazwzyaRsYh95xj1dWeuNQVcUho+423lTUAS7M7HXMlsDvyzQvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HrrrAZ/z5QTRe8ofirHULDZGHlDx51HhF+wmZeZwV30=;
	b=lKf7iCnHeig0DHHfQBPzvAitCjLOAVlhRxrKhdMZNkL0BD5ThOmsA8y+6AOj5RhZ1CAA
	 efjl+atn7evn42uOGqE10aoE5r6loo6zxuh6spV8bb9XGkdAfc9mkQlN6/2OjaZzQyNk+
	 vbsUMi3MWaJlvlxn8kNh9JvpcEjPQaUTh44fM7GbwbsYsK5UgXujXaDWEAuXy9Yw+3ARM
	 dyJdhCPJvF0alwX5oE0jCrvChredLGSsJagoCoBIPBRVfSH4bawDCl2I3s1CFFLwHoxbg
	 1qRHA6V1gF2olGikh+LX7/NVW5/811NCLFBhgxesRyY7RO0K3ioYj7hhh3DQwwaVhBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZkHVpTu/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78D606A323;
	Sun,  8 Nov 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkHVpTu/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794138543;
	b=BWuVWWQuw/dG7hXs5uTGXmpv/gmx6GQU2iK09sE5NqwcwBR1g6/K/szokYEPROB4N5eI
	 wqtZinSpOb8VPNPlLs07WW7J41w7am5c8wufm8dfegQJEdTn+bk0qqEgM0/L8eOYNCn+Y
	 Be442LPrEk96jCJw619HeVeJKy5NtCcYcRbWzJ13RCKDCd4osx580dHRcvWYn0m6booi0
	 HwV0xrYcOIzcMtZJ9LbQVIXIZFendvS5XOyqYAC85p+SYTJ18lLbnRblb+Byog0o3om2W
	 /JQvBVTAp4lTSxVhtaJNh4VkZJR+dMXDQ4Tr3tLgOkK/9/lSntRYmGIfOiddc/KqwUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794138543;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HrrrAZ/z5QTRe8ofirHULDZGHlDx51HhF+wmZeZwV30=;
	b=qJuk5QNZt6nqJ7KQynlB+25xJZAesqKXwV2PMDY53O9N2aEveyJVcL7GF0v/L48rTCE5
	 EM488PXJM/8i4FWEEQ/FugyAFHHvFJuS5htMSGA4qE9ruPUZe7B1IPRpqlUNiyUBb1HL/
	 k4f7V6+PDKFcKZQZuvSc5gpBgWobJTJfyTiYBmx73OEjhGw6r8Ps/IA9n1866qkKMo4Bn
	 hYQ/S8vmBPH8E+spA2gWIociNP+qk9JOrtDncrPi07lPC42jp/KntHzUgtNQ3MoUjZ8b+
	 n9Mi7UKSu6UHhlcTgVpLPfL9mL0W7zQsqyTqG1t8VuYtg/FQgs/i07PbmIoW/ggYS0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F0C81F008A2;
	Sun,  8 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138543;
	bh=HrrrAZ/z5QTRe8ofirHULDZGHlDx51HhF+wmZeZwV30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZkHVpTu/OVsgUMRzGZWs0ueIBQ6Oxe2KsXknGLSlUSsNjuH4x46wPD+2nqDu0+Jgh
	 wzFewJr4TNLn0gV5L7XlFfSqOkY4IAM96Xd8T8pkUzeTUVNTzXoRjwcTQWxGF+0nE+
	 PWetnm4Nri3ecY4tlPvuCV0l2jUaGKkd2/0jTpJaHLxSLrzXqZ+GZHj7GND+cG7BVF
	 Fb3u5ddnYT4ulN1Z8Qy8WnfFAlRGYCCQywarkixYTGC043ktOqq0qo57SpUiqxpaPj
	 ugw2SHJwxmUECGPYRH3I+KUisl1KNaL+QQ037x9Sj+0lvjQDXi0dvfKaEewyB6lNHV
	 JaMPjTJdAuUjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9386847F2D;
	Sun,  8 Nov 2026 11:49:01 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 05:49:01 -0600
Subject: [PATCH 2/3] staging: octeon: convert from ndo_get_stats to
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
Message-Id: <20261108-octeon-init-pipeline-v1-v1-2-eb2c6c956279@gmail.com>
References: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
In-Reply-To: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794138540; l=5570;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=ZufJWbIWbCDXlIoq6too8A8+bhO7h13T111FxAvX1JU=;
 b=Qc+sGguk1iiCvCWxIsO+Fe28Tw+h3eeqKA5cCDoakwwdEmF/tySlv0q4eCsycE4ReXUe1mhJY
 EPutbKncRLhDOKSSni5yzxcqxWY1GsVAq4+NQpbmcpTi8FQNbRMKn98
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
index c77678cb351f..8f9dd87752d7 100644
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

-- 
2.56.0


