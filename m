Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202723;
	b=I0pVNrSdCe61ilGIxtMtipQT7XQBG001FN/E9by9+I9N1Fw+fs2xYPiyy/skdsiMkMnR
	 3JCHKnV3TcT4n8sgzayRHpwctYIoA1AzUTGK4fA2Xm/kHHzCOXEURIQv90pUPvsK9fqjY
	 fhaPfvaN1zHhXgSUgtOp7/uOJsldsO12+PM7LUdGskN1yb+jYvJ3eQVIqjGx2xn0KoQCd
	 DlN6Ol0pkKOwlQcxYy2E9GRzbp5suFqvgX2CJN0SEuorXlWJTr4f9Hw9XKdqHjRvpBkV6
	 +rQpxXubBgCAuplNJxyHaZnlV8vov4lT2CUJilfvJh4CvaCBq92Mn3cFxdrQXzkND0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=rWxNWXe5G6wjh9IGFPGDGAkB5T+2UjYSyeDpEVeA6SI=;
	b=LJaMoPdIWqWzSilcx7uyVNTtwWRj6GluNHH8j7Zr50JERhZd62EHPVtHAYWdaFDtUAA5
	 +kBgPeVfbHW0zJgDb/d6VbN73LM/zdUw8FGbPXcEOgAwBvyaQQNqsSRotM+0OLLGu9O1s
	 8p5DM98KDRXv+LGSEMW9eT9q6hsme9/y3O+KAFK8zyt/SqwAxrfIaOaTL4KRUI5oFjBIj
	 hiblp29EJU46S/+O6F94bOlG+oZjhFVVUOOAfmnV1aH0KUM6N81PPEm0RV2mo4hwpGVBt
	 k/68GbAI6Ip+awI2Vd7AKEP6cQPWptyHyRKXUyXl9JGG1VefwitzwAcFTSF4OrT7B3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nu8L+VRD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nu8L+VRD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1148474eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202722; x=1794807522; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rWxNWXe5G6wjh9IGFPGDGAkB5T+2UjYSyeDpEVeA6SI=;
        b=nu8L+VRDGTxdgpVmpWsOijUDss9X3eZpMkEbshj7cQW8hJJoF3mU6p1o56ubnge9f3
         JBfIKW+lZf5gK6DnTTJF9WWGlcfyGkjsStXXd87YdwU8pAXZOvekYXmhAV8Sjw7uzy/B
         qHq6Otj2gA04+mSWYkWRZ0taJCCGxleW/ZdaybAF2SQno1nvhrxHaOPLEVEWIWIecX+j
         gZW4SaFvaNB7Lm2Ok/YMJOiz/tw+ZHVdMxAEDJLeLRtUrnssPB2Yci2kOiepBQ/G4FI8
         kwtrWABJOmBwC8Uvxvw9tHcHKP0DDB4sbXIo47uHJ+1+IvxId7JTc/qI6WgO1JTsUfdf
         oYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202722; x=1794807522;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rWxNWXe5G6wjh9IGFPGDGAkB5T+2UjYSyeDpEVeA6SI=;
        b=FUiKRPXOUC0WP21LIKziQzmu8vVaWC4T6vrHifD3d2820YEYxCEsaXPWbHa/hKg375
         efqn/HtGE8a/jc3uCP8kiyi20aTGne1FYSIfx6W/G4khR8NyxXBBPk70tExKMAsGWffT
         X86OHt3BzqGmeBmYEpUkIeTT3ZNvnldcbYlL+X2Qq/BlWV6Fy//uScYd63k6ZbAlQLgI
         M6vCWZSzi3owSwnxWvuM5e0kXPSwG3vDqygnnmHcbC4McuowTHL0GEFqvi18AGV27azg
         yMfkcbwYCbOauuQnLiLCQOVSOWwEmv4LckrP5wKkS+7xk/TwDKCiFacdeEBN5WkmvfbP
         v8hw==
X-Forwarded-Encrypted: i=1; AL+hErGzda4LQXYZTFBKb4HvuF62nJxsml7+inazjGrfO6ADfyIFthW/5mvqt3lmWMEba/h+1gdb7PQZa8KQTaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aueEvStMTK1iZFnikxyiVUF1+O5dLyZMH//m+vVVHS1YOrQLn
	sURza9qlKle87FKlVfxBIxx7LrOrIyN0otwzpYkvvc+gLZmDkUILZAbV
X-Gm-Gg: AYBFou2hjPJiwMMFfRFsTvuDiiLOeEN6lsD+Dy8vZRGL9FuFCc4lQDDXFvnFB77O0KL
	P1iMaPYrinR6O+U5XsOAevUf6k8d/A1Nza47Dhz26YfoJh+htUMCxs/sCsIZxm3OPLQj3PdLbJw
	7CiE0rGzVwCj8DlUgRscT/4jcBRKnaVUa+TJ0yH/ccA2aQ4mesJOpAkZN7yOg2HBn8g6Gn5NAqN
	aNmC/4QqxDk2p9rznKCS+4xxtXZyHmEpG+gT5bT51SBsm+LRD59Dd28VDNULELTRx/Ag6Wrc5Y6
	SRXDonMtc4d5MufFkra3LYVkmo53WsmMQJA5WAX5iGGS+lUiXi65j0vtIqj2/tNh+v3hi80yKe8
	7EXyKsTswBZiRHXkz+DPDoeZDdJARbcjOM3TBdnCBn4Eb46E0G7SjTbYloOrpi5CU0lBSfPSFF0
	30RrkTRm9vOUourGV4i949ecHoRkA+3J0mIozCAHYzmSzlZwLAUrdjs0vs49JGUf+PR2axN2KxT
	bJm/A06UFDLaXihMffx8kvSYzsMraVbRBjJkWjdwjTlPxCdfO9kwL0102DynogkM3OV4ayB0Efn
	PWsa3bL66Ei9v43IEzSdm4jrSwD/EpUEUuZkvgTj+CCh6g==
X-Received: by 2002:a05:7301:dd8f:b0:369:21a:dcca with SMTP id 5a478bee46e88-37256326c2dmr6432760eec.10.1794202722040;
        Sun, 08 Nov 2026 21:38:42 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm9593242eec.11.2026.11.08.21.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:38:41 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 09 Nov 2026 00:38:37 -0500
Subject: [PATCH net-next v2] veth: set the real number of queues before
 registering the devices
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bug-veth-init-queues-before-register-v2-1-d7dea61811da@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFxc8WoC/5WNQQ6CMBBFr0Jm7RhaFYwr72FYtPiBSaRoWxoM4
 e423MDly8v/b6UALwh0K1bySBJkchn0oaB2MK4HyzMz6VJXqlQV27nnhDiwOIn8mTEjsEU3ebB
 HLyHCM2BRVydTKlNTvnp7dLLsmQc5RHZYIjXZDHkw+e/eT2r3/6WSYsXd+QqrrdUXU9770cjr2
 E4jNdu2/QB/hsBl4gAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Wang Zhan <wang.zhan@smartx.com>
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
with 240 of them a veth pair emits about 1900 uevents, and udev takes
minutes to work through those of a few hundred pairs.

Set the number of queues before registering each device. For a device
that is not registered yet this only updates the counters, so the extra
queues never appear in sysfs, and the error paths that undid a
registration are no longer needed. Creating and then deleting 500 veth
pairs, one ip -batch each, in a 16 vCPU guest, median of 3 runs, per
pair with udev stopped, and how long udev stays busy after the deletion
with it running:

                                   before      after
  16 possible CPUs    create        902 us      295 us
                      delete       6180 us     6147 us
                      udev busy     > 300 s      4.5 s
                      uevents           126          6
  240 possible CPUs   create       9354 us      505 us
                      delete       7343 us     6916 us
                      udev busy     > 300 s      6.2 s
                      uevents          1918          6

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Wang Zhan <wang.zhan@smartx.com>
Reviewed-by: Wang Zhan <wang.zhan@smartx.com>
---
V1 -> V2:
- Rebase onto net-next, where the peer's queues are set from its own
  attributes (tbp), and keep setting them before registering the peer
- Retest in another guest with udev stopped, where deletion is not
  faster, and add how long udev stays busy afterwards, as deletion times
  with udev running mostly depend on its backlog
- Keep Wang Zhan's tags, as the code only changes by the rebase

v1: https://lore.kernel.org/r/20261016-bug-veth-init-queues-before-register-v1-1-f48eb2bb25a0@gmail.com
---
 drivers/net/veth.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index a61842b2585bf..0539b3661793d 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1875,6 +1875,10 @@ static int veth_newlink(struct net_device *dev,
 
 	netif_inherit_tso_max(peer, dev);
 
+	err = veth_init_queues(peer, tbp);
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
-	err = veth_init_queues(peer, tbp);
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
base-commit: fa5196392691051963726787944db872420dfa75
change-id: 20261016-bug-veth-init-queues-before-register-eebe763a01a7

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

