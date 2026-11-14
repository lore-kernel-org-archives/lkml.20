Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653499;
	b=A8UH25gcA1LxjjmgjY/8mfkRBCKKWd/p8XULTa4bC9Dta8YEm0kCC3Nf2GReaZYOWDif
	 3lyT+i5nTLwBfUJDsi76ATPxgogoVHlnej6+mmPDQP8jgZlBU0r7Eq2ciyAuk731UXe0e
	 IVdiN0wo3oEUfVLP/OyVlNMoX0z7sDmQq3dMIH8W9GCX8WP0EOZoYfXkZh0fYyiYfHzVD
	 RK9HKVby87Zo0IZHbdow8j1DtxTPtRrNo4NT0di91P5GntMeazTjK8sPIQmRzPrLEvJNz
	 gvHyju2swVQFJxVxgbyKtQozsOtWbZrzas1dw/XeAMAvZRzNqgxTH8Rph2XKVpu6YFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653499;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ln1CUdYFcwFEe4dDBRhaA7UnFZFQE3qSIw+JXD++nI=;
	b=2N2hkzIylJ7hJve1pY/8+OT1Nriw9ji1zsy0TcxoJMxUwcOJcxYX4SWeJITqjElDWrzU
	 oUMArBulGMyC0QCGDX7GW6CcaTMxwE07iXNQJ4laWLiaW2jXyWYI3HIk0HC6Z1hBrb3aV
	 QD774E7i+SnpZM7w3e8Ruciczr918TfIcALZgzKBRhsQjPUQFdVkUCkHBpInj786dcIgY
	 4StEYXZmw00MeUBKulePGx8zwcnHAavVxD12saIe0K/Mocl78rvMWJrbYJoQaSD020E+C
	 /ockq3CXHeH/VQPoWH4UsHCZuZbGL1slnVfrerTjNpSHL8030+AOITQOMjQ0iLJiM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mBtvqgQH;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oZO7as72;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9150F60A260C;
	Sat, 14 Nov 2026 10:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9150F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mBtvqgQH;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oZO7as72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653497;
	bh=1JQfZA672J6OveCAyEFBpwt3mdwIiAJM1L5TlYtB+GE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mBtvqgQHgycpkAVKkqxQlNk7xMxukkwwXX63I3m9JtDINe4IkMS93+M348ASmwGLm
	 7m2/1E1irqzk+TrZZDh0IxDHwnphgR4f7l5bjuXsu6GyfHggk0xfOAp4zJQbUvJwvY
	 8fmGQwXOivXMcHq0zLBZiNhCh9H6s+nsgjYn6QkEvMkmgxgSCg9BLtzXmFKQ2TN5R8
	 m2q1T3edAb306nK7nhdhe1Thyr30VG5W/+bCxmbWD2eUsMeK+MMU0VxOSlJnRLjVnu
	 dDXg5GBvPwC7SqHcisAi/jiyWi04B7KAppIUoyFXqqTIkqXDWh45TGPVkap7KCpTNU
	 vICnhVbBIN92A==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 1EC58489E1; Sat, 14 Nov 2026 10:51:37 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653484;
	bh=1JQfZA672J6OveCAyEFBpwt3mdwIiAJM1L5TlYtB+GE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oZO7as72SOqo5dmCDURrRSuk4qrCPIHk/Z4Fh1wkIEDqQKAwnegXTao2qeT67Xvej
	 skVOCrKzeEgNIgseMGP9BQEmDc047Iai6gY1o/RzOwITuIxfVBFRv0sRwedIFMHEsj
	 gPQMKVjvHGIZOndaEDQrhnO1oeXR+ypLRqjvYm2xxyHFCtT86DB3zlucn55JiWn46p
	 lNxWmdTPGayShT9IkGJWez5gRcHmKomeKbssYYrN2Gs32XzGBUW7CRUQ8LCS09f70g
	 yVoycaj5ytbaguve84tx49EYJ9AJs37kv++eMVp84hQe6iz+Q1jxJJLMuMCdUOXGgv
	 mLhferQB/UBfQ==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 65F78489AB;
	Sat, 14 Nov 2026 10:51:24 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:06 +0100
Subject: [PATCH net-next v21 10/13] ax88179_178a: Add ethtool get_drvinfo
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
Message-Id: <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
In-Reply-To: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Emir Beganovic <beganovic.emir@gmail.com>, 
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.2

Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
to provide information about the device firmware.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/usb/ax88179a_devices.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 01d6a35f68b2c56f79acbe2875ce8e99ccdfb197..69095110e70435806a99274c50d79e86016ec9a0 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -235,6 +235,20 @@ static int ax88179a_resume(struct usb_interface *intf)
 	return usbnet_resume(intf);
 }
 
+static void ax88179a_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
+{
+	struct ax88179_data *priv = netdev2data(net);
+
+	/* Inherit standard device info */
+	usbnet_get_drvinfo(net, info);
+	if (priv->chip_version < AX_VERSION_AX88179A)
+		return;
+
+	snprintf(info->fw_version, sizeof(info->fw_version), "%d.%d.%d.%d",
+		 priv->fw_version[0], priv->fw_version[1],
+		 priv->fw_version[2], priv->fw_version[3]);
+}
+
 static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 speed, bool full_duplex)
 {
 	struct ax88179_data *ax179_data = dev->driver_priv;
@@ -340,6 +354,7 @@ static int ax88179a_set_eee(struct net_device *net, struct ethtool_keee *edata)
 }
 
 static const struct ethtool_ops ax88179a_ethtool_ops = {
+	.get_drvinfo            = ax88179a_get_drvinfo,
 	.get_link		= ethtool_op_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,

-- 
2.47.3

