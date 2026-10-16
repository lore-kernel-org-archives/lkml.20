Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F53C1F57
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133476; cv=none; b=GNlG6X+bwasTXn89J45Rr58ZfFqbw+HoqpTYe86/LbblkRlB+0cunGE7AhJY0IkvlbbkRdLwHNGOOkJ5EN7m0bD57rSyrQbW3CbbPsmDhNbZKh5MpFeCpXQsZfV/JvenX8cy3Peet4TGaxobw7c1Wkybnc5G20ODLgwZy86+hyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133476; c=relaxed/simple;
	bh=lCT5eQI3T6CFc5K4WWsKWLdWWTgnuJ3yq/JdbXGvWrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iScXrVCN7jzYGuj4NVyN0hd9uanwk0IvKCgt6+uCjG/mhorrW4c/ssRDfFtAcYgcB+s3IF1yF4X3mbtDEemz9/qeMHGM3wgb9qJInzrEatPbAHPnn5tXlT4tJM4dCfSpWrZu4zcRYfyXnbDjD8u89dtjvh0JNsdyL3M7f65AZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9KJlRRk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9KJlRRk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2399344eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792133470; x=1792738270; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkUjAgS3p4LeEjKgy5L7LfWzR0DWI89VQPIY4JkskUI=;
        b=W9KJlRRkOIFHslTngcXEvlwybRS68Q1vLuhVZNfVIWZB7efJhhBYdKTvlQq+QCeuQ2
         +sgG3hzKjHYNOgbyH3YDeg6QKaVDACsuBkyomwZaiAY1qlFySMyT1SpbHpIG1UCS13/m
         OjwNMdUc4+yfxCy5sL1ncDR9Gky5OOel+Q+iWsmTHuE06ksgvuhoDg3P2fsBnuOOqXoe
         Y/t4OrDsvpFphiixX5WJYkaM+zA0XvxTTq0LEUvf2OIcqm6L+sx+nqN2HOz8LWj8JKjS
         tUuiffhRfAoDz1AxQBiQPI1+lzTnCLKcHZHop1JLXIWMRv5Rd3rIQz1VXZ4wz9zYhXwP
         yscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133470; x=1792738270;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkUjAgS3p4LeEjKgy5L7LfWzR0DWI89VQPIY4JkskUI=;
        b=oGuYPlzUFtMp2vFxCwaHxjDpdb8XYmCgpW+1m7mi3G8VzrQucThXAgnV5+5VjWHieX
         3kzLtd4wTH0ZgAlJcZk1EYjHOKZGSrzlPanwoocGQU4GB5yGb43qNg8f9w9EVGGenejF
         SOXc0Uugb2bcgEw2cC6fZLe1VtFQqQZF6iOmhBKi3NCK55Q9OAHMJ36pQ4t+p1qeDTe9
         1DOuacxN4p1OblNV/RTqd7XniF8S6JN0GTSj5BdJwdx+2kiSzjkZ7COR3m478/i+Yvgx
         HBu4IkM3FZW+CWgIp6rSIsKLXFoyblNg38jUis+JCwezB8vExUAQ/yqhbimt52dDYwhw
         05tg==
X-Forwarded-Encrypted: i=1; AKwUvBzm9waO6S6Od3YHl+Sjvp4hOdl/ABByBZ/Q1VJBiWESBJ1I+EH/qkGABdAYee93moNmWvM7JJTywBewl2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAyYYFs6FYRViTDHUlQie43AbettBsbPsXivAR0fFNyV+DtVW3
	V/CEdwmbZEGufmSk5yCF2R3VXlRB2Qu88S+YJTok3jU+be4WS1ysjuPK
X-Gm-Gg: AYBFou196BET2HUol1lIXhQUmu4JvxwD3iLm/8O1q1/YJzwB+M/DJ2OPu2tRWCzzAmI
	jtTYYETjClTEGE2tgrF6uWZle70/MItuNXyKR62UjaHkeUARyY7k0T/S1/Nk7mVBoHotipr8+gU
	citqrhNmV3gje+BzUVgGyHC+OkXkp2DO1/dAtJKPsglEb2bHQXibGvbVTxfsY+ltUvDa5EPI5Lu
	lbfkIaGbyT1UY1Ss9Tk/CVKtJZwsHF5HLev32pd1IZDVMCeYitCSVpUn9TZqF2ZJFYwcgPUO3qd
	b6towXn+onMKdQSzlef8P7LIqC64olRR8h3Hb0zfvTE8wUBGcbdXm+OLDiWfqeynUMRgojkNTTo
	AVktjks6Z4R25C0TDGBE+Z+fVpPkqtmv7Tk6FdiqjJrOZxwokZWYyu0pG2tJffSx5i3AcYeP2zN
	DFGJIusBwewB/WX9miz7ceGRelyrkO8VXGyJHwKS634TvcAwzFVIkZ/8rjLCDg1tJ/+w==
X-Received: by 2002:a05:693c:23c6:b0:351:1f56:3a89 with SMTP id 5a478bee46e88-3537e00a83amr40808059eec.23.1792133470086;
        Thu, 15 Oct 2026 23:51:10 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm4839555eec.3.2026.10.15.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:51:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 14:51:05 +0800
Subject: [PATCH net-next] veth: set the real number of queues before
 registering the devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-veth-init-queues-before-register-v1-1-f48eb2bb25a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFjJ0WoC/x3NQQqDMBBG4avIrDuQWIjQq5QuEvsbZxPbyUQE8
 e4NXX6b906qUEGlx3CSYpcqW+nwt4HmNZYMlnc3jW4M3vnAqWXeYStLEeNvQ0PlhGVTsCJLNSg
 DCVO4R+fjRD31USxy/DdPKjAuOIxe1/UD5E+6zoAAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Since commit 9d3684c24a52 ("veth: create by default nr_possible_cpus
queues"), each veth device is allocated with one rx and one tx queue
per possible CPU, and veth_newlink() reduces the real number of queues
to one unless the user asked for a number.

Both devices are already registered at that point, so
netif_set_real_num_tx_queues() and netif_set_real_num_rx_queues()
remove the sysfs objects of every extra queue that register_netdevice()
has just created, each one emitting an add and a remove uevent, and the
tx side also waits for an expedited RCU grace period. This happens with
RTNL held, twice per pair, and grows with the number of possible CPUs:
with 240 of them a veth pair emits about 1900 uevents, and udev
processing them slows down later sysfs work such as deleting devices.

Set the number of queues before registering each device. For a device
that is not registered yet this only updates the counters, so the extra
queues never appear in sysfs, and the error paths that undid a
registration are no longer needed.

Creating and then deleting 500 veth pairs, one ip -batch each, in a 16
vCPU guest, median of 3 runs, per pair:

                                   before      after
  16 possible CPUs    create      1644 us     520 us
                      delete     11822 us    9750 us
  240 possible CPUs   create     17253 us    1339 us
                      delete     17082 us    9941 us
                      uevents        1918          6

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 drivers/net/veth.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 38f263d4f06b4..92ad064567327 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1875,6 +1875,10 @@ static int veth_newlink(struct net_device *dev,
 
 	netif_inherit_tso_max(peer, dev);
 
+	err = veth_init_queues(peer, tb);
+	if (err)
+		goto err_register_peer;
+
 	err = register_netdevice(peer);
 	if (err < 0)
 		goto err_register_peer;
@@ -1904,6 +1908,10 @@ static int veth_newlink(struct net_device *dev,
 	else
 		snprintf(dev->name, IFNAMSIZ, DRV_NAME "%%d");
 
+	err = veth_init_queues(dev, tb);
+	if (err)
+		goto err_register_dev;
+
 	err = register_netdevice(dev);
 	if (err < 0)
 		goto err_register_dev;
@@ -1917,16 +1925,10 @@ static int veth_newlink(struct net_device *dev,
 	priv = netdev_priv(dev);
 	rcu_assign_pointer(priv->peer, peer);
 	netdev_hold(peer, &priv->peer_tracker, GFP_KERNEL);
-	err = veth_init_queues(dev, tb);
-	if (err)
-		goto err_queues;
 
 	priv = netdev_priv(peer);
 	rcu_assign_pointer(priv->peer, dev);
 	netdev_hold(dev, &priv->peer_tracker, GFP_KERNEL);
-	err = veth_init_queues(peer, tb);
-	if (err)
-		goto err_peer_queues;
 
 	veth_disable_gro(dev);
 	/* update XDP supported features */
@@ -1935,12 +1937,6 @@ static int veth_newlink(struct net_device *dev,
 
 	return 0;
 
-err_peer_queues:
-	netdev_put(dev, &priv->peer_tracker);
-	priv = netdev_priv(dev);
-err_queues:
-	netdev_put(peer, &priv->peer_tracker);
-	unregister_netdevice(dev);
 err_register_dev:
 	/* nothing to do */
 err_configure_peer:

---
base-commit: 6b3e73774815910a39d8ca75b9ad7df963f61d50
change-id: 20261016-bug-veth-init-queues-before-register-eebe763a01a7

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

