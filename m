Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA283451992
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502214; cv=none; b=ld5BrTbf+BNv0y3uXURydsUAxfvcqkb2tJLb59yIUc3lzRJ2A3cAsXKAbaxgzZ2pjr200dLVDhXf1g+ImWKDuS9sum2pccp0/LahjFaBu5Y1JNcCk+vX+4rQ6xKiW8Xcn9mqJCw6gqTnaeVR7MUqmQO3Zk7rt3hEktwfAJ3ksTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502214; c=relaxed/simple;
	bh=rZLpj21N4VA3IiZfTn1FGsRHE12qb2+V/np4zmO70lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=udDYW8+Xcb5iIQdqxp+uSwhgRJUTKYFvm69UdjuF16LZNAufo8AMEVyJM34owKa3ncrrZ9duFIlJ5qEUw4HuCwyGKfzkefXF7939XgKrbN3VPtbZAi3UsccI1EqhFzoURSp2RfqGazMqT4L4oHT29mT9mSb7D4ulH/P2HPOQv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpyITVuI; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpyITVuI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec392so909061cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789502211; x=1790107011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFCJ2lFr9tJixEGi8k+dG6GBDM56HP737LMGurM7J9k=;
        b=rpyITVuIhtWqQ6vnsYauT4ipybwUadVrwCeGp21aQqYuDsUHNs5riXrVopkqn0MCvv
         8etWfrsQKa6+8iKhM5jyQL3JPSlHdHqNaIo4qd0gbuoraJ4v4QLNb0XpY7/0RB+TmG/i
         CLnurcFdvkJHNZe5nlYKP5Op8YmXLTralVr9/uBlmEL7k0P7fq9wQAGrU/t4eQtMFABS
         Z3fgH0T6N/Pg8QtvcBDHoWQ6ORtxKOQMfjydgZOUV8W+AQdBMWPBvnEStqfjHvVHPry3
         ZA76YGYRd/vW10PU3xrVT5L31jbGmROyh9iQy+30XrecMQZ+8kljhj9P/tEtHfr4qwSX
         FHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789502211; x=1790107011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFCJ2lFr9tJixEGi8k+dG6GBDM56HP737LMGurM7J9k=;
        b=Pr7BdUFqPdCdn48FtrYqYlP+h8bYud6HIwMXAsCXqHSFE09ApifNETYg2qECM5AGuX
         Uxwv+4f594ZomyIgat1iTWy2Ea19ZF40hHvoAKg7u4al8wKhptGI+6MqINyREhiH723P
         8ycfA9D9B+ian7XBdCkicgoHK42/DuTKEsLYwhT/TYSQI5jJjN1TuEgd/b1Cpv6Szfhm
         0TydCI5z/S22me3w5E6jf/iH3+T9kuhHUym9a8q8SEAZ/CgO9+s8Le7Yv5XShXNTbFG5
         lOMJzgKrEIhQg1Hr6ZfAe6WW6CoiFsabc4+lKBiaKxtSXYcElmmNeqLpQdkzat7ji5hj
         kgyg==
X-Forwarded-Encrypted: i=1; AKwUvBzXfqfwQkZDyHIkjFwSBZSS7BrpPTDxejCwJU7mNKGHdpaOo5g3Uu/E27U1oNJKjdjdhiYXk5bam85PZAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ncrh3Q2z8bAa1N87yn9Z6hl2u1r350mBKnMXdMc/0REHV1AwjU
	WNB7dFbAD9wB6GZoLE2Ds08flbQi0YcHotyzkCn/gxATa+ZMx4eTSmbt
X-Gm-Gg: AYBFou2KwVZ07Ce70SYvfUu7HVLdHtAcuzbxx3yMY5w7DgruMtxL1NULAnzbKbmBybl
	sp768RyBR9Wwt3OXxW7qT6jifqjFctrnPM91LrZcaJPJ8tnn1XYJa73EOpHKj4nL3g8DlktxqHL
	4D1XVMOIgbFG+Fnz5P61xQcMPGr3aZxFk7yJgZoYprQsmtO38CMoB5mcOrXUabGBBjWMoQNDF7t
	NXsf9gkS/qt9myTFLidM04B/IGn0ujLTdRpUtACqBkrKWSMNPoLE+QeUkTn9ovaet1qYPtxEwdu
	m+jXu+o2ZpqOmYJcYipucLMbu4XSNYW+GcvSY1Kc9Dqvgz1bQAR61ipbSa3v1epeLHZzpWd+xUQ
	tPI0VP08bmdnlnGwaNKrGFdeIwEpYvFuNCPu4lPkTke4sSOlFjX9aTd4Vkg+K9fN5ayHOJ9gcRk
	UXxAtMCdHZJBo1OgZPUAUxVvG5xk6H+k/O6YCGi0zi5d/oYHTt2Lf1iGkPLo2cr7vk8ReN8UBOu
	N31s5E=
X-Received: by 2002:ac8:5f8e:0:b0:530:b2e4:4e30 with SMTP id d75a77b69052e-5312640eab1mr35615791cf.61.1789502211210;
        Tue, 15 Sep 2026 12:56:51 -0700 (PDT)
Received: from SurHub.localdomain ([195.242.214.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be946f0sm6691096d6.27.2026.09.15.12.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:56:49 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: subash.a.kasiviswanathan@oss.qualcomm.com,
	sean.tranchetti@oss.qualcomm.com,
	horms@kernel.org,
	kuba@kernel.org,
	Abdifatah Suruur <suruurism@gmail.com>
Subject: [PATCH net-next v8] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Tue, 15 Sep 2026 22:56:42 +0300
Message-ID: <20260915195642.1912-1-suruurism@gmail.com>
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

The gates cover the configuration paths only.  Teardown (RTM_DELLINK
reaching rmnet_dellink(), and rmnet_config_notify_cb() unregistering
the bridge when the slave device is deleted) is intentionally left
ungated: link deletion is normal netdev lifecycle behaviour, and the
changelink series this matches (vxlan/geneve, CVE-2026-68432) gated
only the configuration paths.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
v8:
- drop the Fixes and stable tags, per Jakub Kicinski
- drop the explanatory comments added next to the gates, per Jakub
  Kicinski
- shorten the extack messages to "request modifies device in another
  netns", per Jakub Kicinski
v7:
- state explicitly in the commit message that the dellink and notifier
  teardown paths are out of scope, per the Sashiko review
- drop the master-moved-into-the-real-device-netns rationale from the
  rmnet_add_bridge() comment: on the add path do_set_master() resolves
  the master in the slave's netns, so the rationale only applies to
  rmnet_del_bridge(), where the master comes from
  netdev_master_upper_dev_get()
- use the netdev comment style in rmnet_set_coalesce(), per the
  Sashiko review
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
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 21 ++++++++++++++++++-
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 11 +++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index bed6f63facf25..8bf385ab44a90 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -312,6 +312,12 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (!rmnet_is_real_dev_registered(real_dev))
 		return -ENODEV;
 
+	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev))) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "request modifies device in another netns");
+		return -EPERM;
+	}
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	if (data[IFLA_RMNET_MUX_ID]) {
@@ -441,6 +447,12 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 	struct rmnet_port *port, *slave_port;
 	int err;
 
+	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev))) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "request modifies device in another netns");
+		return -EPERM;
+	}
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	/* If there is more than one rmnet dev attached, its probably being
@@ -489,7 +501,14 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 int rmnet_del_bridge(struct net_device *rmnet_dev,
 		     struct net_device *slave_dev)
 {
-	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
+	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
+	struct net_device *real_dev = priv->real_dev;
+	struct rmnet_port *port;
+
+	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev)))
+		return -EPERM;
+
+	port = rmnet_get_port_rtnl(slave_dev);
 
 	rmnet_unregister_bridge(port);
 
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index 4f0ddcedfa979..53802b485a813 100644
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
@@ -240,9 +242,16 @@ static int rmnet_set_coalesce(struct net_device *dev,
 			      struct netlink_ext_ack *extack)
 {
 	struct rmnet_priv *priv = netdev_priv(dev);
+	struct net_device *real_dev = priv->real_dev;
 	struct rmnet_port *port;
 
-	port = rmnet_get_port_rtnl(priv->real_dev);
+	if (!ns_capable(dev_net(real_dev)->user_ns, CAP_NET_ADMIN)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "request modifies device in another netns");
+		return -EPERM;
+	}
+
+	port = rmnet_get_port_rtnl(real_dev);
 
 	if (kernel_coal->tx_aggr_max_frames < 1 || kernel_coal->tx_aggr_max_frames > 64)
 		return -EINVAL;
-- 
2.53.0

