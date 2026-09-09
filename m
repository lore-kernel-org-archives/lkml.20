Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5346EC98
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940938; cv=none; b=Omgug3sMEPouUDIUeOk4auYPsEKp72CCzoiuxE/6LmDyr8b0VnHtOiYcpiMjWl5ryGGoDHAsvZCsMPTik0YDai3GtBO5UTZKDBCf9R3bVlDt4tMI8WS7duS0NANOxK8tlnL8f8HY9YraAyElPGpnDjIqdJQLeg+ScyQYVzfKT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940938; c=relaxed/simple;
	bh=Jn6WB6gHElv96qrSzSmASQP9AhHrMtagblryMeSycnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2c5it++yMS2OPMthQOer4nJQwIB5QDnAaA989O50rsAL8hzrToErPselcZFRozOeCw7aFXN+7ItTptXTxzFie2TZbYQWeZzTlbLHNWypwK187LiG4DxP7H8uO1lNpyDjCPEqehcD8+Z/d/JBVlyIL+zp6Wy4XnR3fp6B1cLqrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvk3hvcx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvk3hvcx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4859245e493so2993845f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940934; x=1789545734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll8VAgV04XQDjiDhfgtl64C8SnosCd5UNG3ReUXeI/c=;
        b=Mvk3hvcxnPP5f3M9yW8OlQdUWgRqtUVu+HV3sD5txndFnP4Ncefn7qwV/gge0frsx0
         1/hogQw5+QN/SjKGubcyONR+OBoYuQFo9ipsCLaJQ3daX0Rm3k3y+6V5siHbMlAEDIJb
         DRGZFGtqOz6K6KMav/6evUbUj51DGU4ssOVZS3N30r0OQEMow/ofkJ5ITnCqMsKzVutQ
         8w5i07V5O4nO1RnxJAjQcfTy2YrmrHV+J9rlb36yj0Swgu3jYUtwPRc+TTlqjNxkPQo/
         fu0jDInQI57beYLjBX87Rqaof6LWZ/ab2X2gqkF7W0SBysqJ63cqR40JRkSfCEXMoeQZ
         ccKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940934; x=1789545734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll8VAgV04XQDjiDhfgtl64C8SnosCd5UNG3ReUXeI/c=;
        b=dc1GoHcwCnjVg2xQa5whMEgFTSX9o8MR8tzGINzLSYQx9ZSktylnvkSdNqwmOkskYQ
         1IPm95yHVwB7AOKxN4nNHYZTwyf3ejUtFizvSGM39MFdJXU4mcVePl12nl0AMJiGzAoC
         ZloV/iphkNFHeQu9yIPIXiprSEDPj9lZ3p4Ei1Hhq0Jd41vjhUIz85ib6KU9nh0Un+Qy
         tEcEiLaJ94K8XF2PmV6tFHz6dnbCD84gC6GGuv5TxrtCrqqhe4nuh8B87wFeN4iOQdHp
         2VZ4baQuygUUh1eFGGXh+d0V5M+utbpVKV9M3X/fhSqvhbP5ZO8gW1SyrOMVGJCdcjSU
         4n0g==
X-Forwarded-Encrypted: i=1; AKwUvBx6Y30Cocoz2ZpF9tA6MIwzjjvfvPTtYceU6n8nraN78kFI8lKbpt+zeYJG7SOEMdFYYAuJ7fPvjvkjFrM=@vger.kernel.org
X-Gm-Message-State: AFuF++mpKzmWdiab1v90iw/CGUaqDjN0thQkjKyS634kLMxwoPqnO3ex
	CqoPd4kSOGWK3Nd2U7JsC0a6u/OAqzBqLKfbe+aPhBOBxb+Y2+JbtQHx
X-Gm-Gg: AYBFou3MLkmCDjCd3nCLk4pyO6dONJoyJUo6hvSqHkmIq4JsL4B+NxMQq2K4zWO+RVs
	mTBQzkxJYS2DvN5ZqcIC6kmj5/Y6OJklVrqGMeMVe8cOPxiELV+c+osDSVREcE3HPSbjuyyNuAN
	HWKsaZnlwC8c1fC9vmkPxRbddwzmh/8RljnUhrzLkJFk18e4Tv7x9ZDmv24r+CdE4A5MpD9c6jk
	bCVX+XkSERg9sBX/7nIG/TLxM/4idcZcKw3pTNGnn8WnrFb3yxPpHwYbidVkmVYm0icnWtgzY5y
	n1E/QVzNPXcw77GkcK/s/1eAyNxe1KjsZdqnAuE18RKjpEfvsj/0hamoLOvsj7wlqoVReUc5qlY
	fxR4hHymjGrPODJLfBllkpq4BwMrMp4PkuKE0w0oC86LKA7z4N7XjRRYpjtoKZCI6+7cslsVKY9
	7DXxu/MFD0tHPsf8HAwfhz36mCfMaSXi3GsE79OEJYqC6ioDKBgG68T56Hq3huWQcf8HoWpQwT+
	V0SIYQ=
X-Received: by 2002:a05:600c:8b8c:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49cf7f4aea6mr331141235e9.0.1788940934264;
        Wed, 09 Sep 2026 01:02:14 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412796785e9.3.2026.09.09.01.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:13 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	subash.a.kasiviswanathan@oss.qualcomm.com,
	sean.tranchetti@oss.qualcomm.com,
	dnlplm@gmail.com,
	linux-kernel@vger.kernel.org,
	Abdifatah Suruur <suruurism@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Wed,  9 Sep 2026 11:02:09 +0300
Message-ID: <20260909080209.6348-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An rmnet device may be created with its real device in a different
netns than the rmnet device itself (rmnet_newlink() resolves it in
link_net), and the config paths below only check CAP_NET_ADMIN against
dev_net(dev), while mutating rmnet port state attached to the real
device:

- rmnet_changelink() rewrites the endpoint mux table and
  port->data_format and, via rmnet_vnd_update_dev_mtu(), can shrink the
  MTU of the rmnet endpoint netdevs.
- rmnet_add_bridge() and rmnet_del_bridge(), reachable via
  ndo_add_slave/ndo_del_slave through RTM_SETLINK IFLA_MASTER, flip
  port->rmnet_mode and port->bridge_ep on the real device's port; with
  bridge_ep pointing at a caller-owned device, rmnet_rx_handler() then
  forwards real-device ingress frames to it.
- rmnet_set_coalesce() rewrites the port aggregation parameters via
  ETHTOOL_SCOALESCE (ioctl) or ETHTOOL_MSG_COALESCE_SET (netlink),
  whose capability checks likewise only cover dev's netns.

A caller privileged only in the rmnet device's netns can therefore
rewrite the shared cellular data-path state owned by another netns, and
steer its ingress traffic.

Gate the rtnl paths with rtnl_dev_link_net_capable(), matching the
"require CAP_NET_ADMIN in the device netns for changelink" series
(vxlan/geneve, CVE-2026-68432), and gate the ethtool setter with
ns_capable() in the real device netns, mirroring the check dev_ethtool()
already applies to dev's netns.  Report the new rejections through
extack where one is available.

Fixes: 2abb5792387e ("net: qualcomm: rmnet: Allow configuration updates to existing devices")
Fixes: 60d58f971c1077 ("net: qualcomm: rmnet: Implement bridge mode")
Fixes: db8a563a9d9024 ("net: qualcomm: rmnet: add ethtool support for configuring tx aggregation")
Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
v6:
- gate rmnet_add_bridge() and rmnet_del_bridge() on slave_dev, the
  RTM_SETLINK target the caller was actually authorized against,
  instead of rmnet_dev: a master moved into the real device's netns
  short-circuits rtnl_dev_link_net_capable() through the net_eq()
  check, so a caller only privileged in the slave's netns could
  otherwise attach or clear the bridge state of the real device's
  port
- add the Fixes tag for the commit that introduced rmnet_set_coalesce()
v5:
- also gate rmnet_set_coalesce(), the ethtool setter that rewrites the
  port aggregation parameters of the real device's port, per the
  Sashiko review
- report the new capability rejections through extack where available
v4:
- use the netdev comment style, per Subash Abhinov Kasiviswanathan
v3:
- cover rmnet_add_bridge() and rmnet_del_bridge() with the same gate;
  they mutate the same real-device port state via ndo_add_slave/
  ndo_del_slave and have no capability check of their own
- correct the impact wording: rmnet_vnd_update_dev_mtu() only reads
  real_dev->mtu; the MTU store lands on the rmnet endpoint netdevs via
  rmnet_vnd_change_mtu(), not on the real device
v2:
- drop Reported-by: (implied for the author), per Jakub Kicinski
---
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 40 ++++++++++++++++++-
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 18 ++++++++-
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index bed6f63facf25..8df9e455110dd 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -312,6 +312,16 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (!rmnet_is_real_dev_registered(real_dev))
 		return -ENODEV;
 
+	/* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+	 * but the port state mutated below is attached to real_dev, which
+	 * may live in a different netns.
+	 */
+	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev))) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Changing the port settings requires CAP_NET_ADMIN in the real device network namespace");
+		return -EPERM;
+	}
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	if (data[IFLA_RMNET_MUX_ID]) {
@@ -441,6 +451,19 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 	struct rmnet_port *port, *slave_port;
 	int err;
 
+	/* The rtnl path authorizes the caller against the RTM_SETLINK
+	 * target, slave_dev, but the port state mutated below is attached
+	 * to real_dev, which may live in a different netns.  Check the
+	 * capability against slave_dev so the master's netns, which the
+	 * caller was never checked against, cannot short-circuit the gate
+	 * after being moved into the real device's netns.
+	 */
+	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev))) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Attaching a bridge device requires CAP_NET_ADMIN in the real device network namespace");
+		return -EPERM;
+	}
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	/* If there is more than one rmnet dev attached, its probably being
@@ -489,7 +512,22 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 int rmnet_del_bridge(struct net_device *rmnet_dev,
 		     struct net_device *slave_dev)
 {
-	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
+	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
+	struct net_device *real_dev = priv->real_dev;
+	struct rmnet_port *port;
+
+	/* The rtnl path authorizes the caller against the RTM_SETLINK
+	 * target, slave_dev, but rmnet_unregister_bridge() below clears
+	 * the bridge state of the real device's port, which may live in a
+	 * different netns.  Check the capability against slave_dev so the
+	 * master's netns, which the caller was never checked against,
+	 * cannot short-circuit the gate after being moved into the real
+	 * device's netns.
+	 */
+	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev)))
+		return -EPERM;
+
+	port = rmnet_get_port_rtnl(slave_dev);
 
 	rmnet_unregister_bridge(port);
 
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 4f0ddcedfa979..1f4a3246f254a 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -4,9 +4,11 @@
  * RMNET Data virtual network driver
  */
 
+#include <linux/capability.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
 #include <linux/if_arp.h>
+#include <linux/netlink.h>
 #include <net/pkt_sched.h>
 #include "rmnet_config.h"
 #include "rmnet_handlers.h"
@@ -240,9 +242,23 @@ static int rmnet_set_coalesce(struct net_device *dev,
 			      struct netlink_ext_ack *extack)
 {
 	struct rmnet_priv *priv = netdev_priv(dev);
+	struct net_device *real_dev = priv->real_dev;
 	struct rmnet_port *port;
 
-	port = rmnet_get_port_rtnl(priv->real_dev);
+	/*
+	 * The aggregation parameters live in the port attached to
+	 * real_dev, which may reside in a different netns.  The ethtool
+	 * paths only require CAP_NET_ADMIN in dev's netns, so require it
+	 * in real_dev's netns as well before mutating the shared port
+	 * state.
+	 */
+	if (!ns_capable(dev_net(real_dev)->user_ns, CAP_NET_ADMIN)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Changing aggregation parameters requires CAP_NET_ADMIN in the real device network namespace");
+		return -EPERM;
+	}
+
+	port = rmnet_get_port_rtnl(real_dev);
 
 	if (kernel_coal->tx_aggr_max_frames < 1 || kernel_coal->tx_aggr_max_frames > 64)
 		return -EINVAL;
-- 
2.53.0

