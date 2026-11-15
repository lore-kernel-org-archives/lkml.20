Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732866;
	b=4JSP25G41445+kgxVbtSVgyF7KB53iUyrfg1R6byqtNrEwixmNw+Xymua+E3KIsyTxC9
	 gwSfx1kAGyvUhVD1yItHJ3D3LOwiuBi1thho+0xvupbw0V2rkZX5url82VgF6fYbjv+x0
	 3Yp0VMosbed9ZIjL+D0hY9338rvvWRX3s9CpxAcDML52JgtwV09Ml7UIRnGcA0XdPNgun
	 OQ+xqaHMC5tRzoOjaQ7XA3EqbJ3jl3iIYLRyLXidQ43LlUKaGCV/nmcopC+NMhcPLMQtZ
	 WYyLMdrmyTsyke/PqPUCIgAIlhifs+xH1J2FH+PmTrl+aYeATjPxUrV6k94q4OafgGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
	b=MSH+5u4zNxiyHlBWefovA8W3LBxzu5u8nyYyz3Xgli6QnD8SgF5z4h7F9Zjk8nzLF2Tl
	 jXg3bkmh6CKYt3Bz3ThNs5Kb98Zp5MqNYa3/teNpTAC/A/80o6vXSfj00jStITAMwHKcM
	 Tf+lHEP0TQlgha+kstxtn0IpjmbEcCqG5nOQDqC2c022kWGsMAKydeFWH+sBQQTqJmlrZ
	 ZQmN0frAtHw4+9SIzdKK7Cl97CWHYNuh9HusnOeaexfkYLXI0ihf0Hz+gtwvgerS3+D4X
	 zvyuQ/mtehXv4Fcz3w31OpLeJqkwiVPMJY/nIBJ1Wy5QFooIormiZxcNRQ7irJfXCpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsmfTUYf;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673BE606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsmfTUYf
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1212778eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732865; x=1795337665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
        b=jsmfTUYf9Zp/e0epLXvwAdxeVcb8c9E6NfI2YdOmZW9bc6soKN3+DCmJnj//3qoi4b
         RYCGU6g+Bo2/Hx66TXuty9ztzjnaRIFy5b8CiUWLhzN5qEA7ZJBbVa/4ohg+t46vOT0P
         AdTtCENJjN7uEXdztQ1ov3k355dd9Gfc5kV1KTHF6T036DTYdGumEdDILm9Uq2W/p6SP
         ZWBkvdifyprjbugg4rztU8kEEbd3Hrc0BdnUbfl7jyf1ws3T72+Fx+tFkEjho/x+JjqL
         /sliJ3cdR1MMX3/nQBhnpwQiZhkj8mDgh+6/YlqKMIGr+gHFfwlYKfpHV7AySsAcf4Zr
         K4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732865; x=1795337665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
        b=PQaHivbhfK/otlmMDRhWITDUuI9uYWyYfNLkaIQ8CneZNGtQZTp73sQB+VaOEBNWCB
         xm0MEHnVL/siqXuUKFW8jBt/Ppdp/uB+CSRWHpqOUi1n5vLzVn1JKycxt4W7V7CMs6bs
         4ykpz1byVtdo4ubfDNbXQnLTzTFGz53BVEbMgmdNPTLBFp7D4nY8RgYZJAyvJ6FoGHgq
         QL6G0UDIG05k43UUMdkswx3WiB6YFmqqdJa+/nLJcqYLgi9wy+WA/pF4uYt5QBdIrnE4
         irz+bY1FWSTsvkVjuTT67+BA9XYqo+W+Fj3Vu7UhcEJGXHf0waomwjkTImsn/E38BP0/
         41IA==
X-Forwarded-Encrypted: i=1; AL+hErFNxtxvE3xXFV58KHryDWCysXAJhAyJEtlrjIKetbyH60tnCBpL+YWbRjbGxcvzSz9pnqwaDyPQB/mcX1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O3QL/clPku5/g2vpwcaJwgniX4tXFmB9o9mZjnDnzmEtf8JTZ
	kmX8t5jVPjmQzBEVJzDK3I1fNTUwQvhJd1BbttE9zT45/I3PiMNxvynk
X-Gm-Gg: AYBFou3XleNeNM98RKqWzjzGkjVcBtLhIo2YZNhtmNHxJCkw0Moi9v5dCXtLD8+fodD
	LH1+k7kk7NCa+BBuw+h4v8J1nJgE6P7iUY9WLnWvBLsomitxfkgkDO4owf6nGM2KVFbU5vjH5oT
	AKT3pEAr1xvg85/X0t6jPs7kjzmsOy00hpe76RDBNx3f0k66jU3CqrDAwzpLAosMUiU1t1lqfIm
	QWmi014OR00M42FwD0psTurTe068B/LpChsGGwku2ZehOH3J9mp06qMZDxx7iAKQk0IlQkAsJ9g
	lu9Lus4lQwO7R5eZ1alXMGagquGWERCd+36WVKUmFYMHRIFf+lg6zAa4fMnOLgZyhIaegmzjUPn
	DVPk/9cLZGDDypCS077+oEnPK8+ldDYZyZM4ArzOHFXD9pPw6iKrUGvbM01A9lUIC5JPs1w2aum
	kPhNhDKL7opeRq4kV4fzjO0mr8ZBSslBoTQpfNQkNSX7sty30PLGZlWtTXLzyaVA2tHNuxHDJjP
	PUHmK0YLEqCfl7VPqrDc3B+tbkXBNBavSkFWZRAkkIAPj7xMQjHoPFNLgXfpCPF5O3KiZ0uU7oT
	5iZgJ1uSmknEBOIkVdi27whHJj12sP35yxUGc4STccTieYGM5nQVND3aNJ0EIFyCO5M+mUHFG5Q
	YYEb6zMU+tpInkDHhlegekhe0luPRIE8UdOH2EgA92Egwkr+m7X6YQl9jQUY=
X-Received: by 2002:a05:693c:4141:10b0:36a:15cb:30bf with SMTP id 5a478bee46e88-37966b52639mr7954428eec.13.1794732865444;
        Sun, 15 Nov 2026 00:54:25 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm22437361eec.26.2026.11.15.00.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:54:25 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: davem@davemloft.net
Cc: edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	yuantan098@gmail.com,
	n05ec@lzu.edu.cn,
	ylong030@ucr.edu,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH net-next v2] vlan: remove MII ioctl forwarding
Date: Sun, 15 Nov 2026 08:53:43 +0000
Message-ID: <20261115085343.53218-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VLAN devices forward SIOCGMIIPHY, SIOCGMIIREG and SIOCSMIIREG to the
lower device. This exposes the lower device's PHY through the VLAN
even when the two devices are in different network namespaces.

Bonding used MII ioctls as a fallback for link monitoring. Commit
23a6037ce76c ("bonding: Remove support for use_carrier") removed
that fallback.

Remove vlan_dev_ioctl() and its ndo_eth_ioctl hook so MII ioctls on
VLAN devices return -EOPNOTSUPP. Applications that need PHY access
can issue these ioctls on the lower device.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
  - Remove MII ioctl forwarding entirely and target net-next.
v1: https://lore.kernel.org/netdev/20261106124639.12584-1-dennylin0707@gmail.com/

 net/8021q/vlan_dev.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..cff36d3fc6c8 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -406,29 +406,6 @@ static int vlan_hwtstamp_set(struct net_device *dev,
 	return generic_hwtstamp_set_lower(real_dev, cfg, extack);
 }
 
-static int vlan_dev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
-	struct ifreq ifrr;
-	int err = -EOPNOTSUPP;
-
-	strscpy_pad(ifrr.ifr_name, real_dev->name, IFNAMSIZ);
-	ifrr.ifr_ifru = ifr->ifr_ifru;
-
-	switch (cmd) {
-	case SIOCGMIIPHY:
-	case SIOCGMIIREG:
-	case SIOCSMIIREG:
-		err = dev_eth_ioctl(real_dev, &ifrr, cmd);
-		break;
-	}
-
-	if (!err)
-		ifr->ifr_ifru = ifrr.ifr_ifru;
-
-	return err;
-}
-
 static int vlan_dev_neigh_setup(struct net_device *dev, struct neigh_parms *pa)
 {
 	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
@@ -1105,7 +1082,6 @@ static const struct net_device_ops vlan_netdev_ops = {
 	.ndo_set_rx_mode	= vlan_dev_set_rx_mode,
 	.ndo_change_rx_flags	= vlan_dev_change_rx_flags,
 	.ndo_work		= vlan_dev_work,
-	.ndo_eth_ioctl		= vlan_dev_ioctl,
 	.ndo_neigh_setup	= vlan_dev_neigh_setup,
 	.ndo_get_stats64	= vlan_dev_get_stats64,
 #if IS_ENABLED(CONFIG_FCOE)

base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
