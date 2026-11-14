Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653494;
	b=JJ4ZNlzxX2LMFUdxeCAQa/phVnZSIyePqyQf+CDAm/FWkUr9k9hoWLTFJEbeLRzlFFw5
	 jw1dxp6Xt+5yiFRZPafgpOx+k5db6W80o8IrnrVwazs2KG4pER0Nx9EoelffA0f8qP9FX
	 546Hp9C0PvvJNRZFSVkXP5dB7bWW03hBYJIBYDoFxYieSMUdTG2fIlLjJ2E4IYktwxhiV
	 NZebkRVtyk0rx0P4OfisWdzjS3vl4ZvG+9UW+PDSFsAdcmI5lHEKt4AvSNuh65HPJyjPP
	 fMgvgmmrkCtt6qqvFnegrPLrBGGToH0bhmUOq84U2k7BtKYrB0eHInHypWksWMjsSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653494;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=26rwK9emvjRNxgkx1aM0VjRaoRMNaYYnmRitPoyIuNc=;
	b=ut/zy/aGOPntwpNuxwnD5G+ah/yMQeWJ98NTYEJTOMnMdD1pWJgEINydsPU9VYQjohN2
	 TG+DycFtylZe4z8928dLTZ3NpqoCKTavB9PZBW87kaDt/35wajAKB8/V7pN6t7pEDgK49
	 b1vezkQbyIjIkOE+t0jXSs75sq0bxIUc0VTna9iPqwgiCdjKYhKEm3kzoVBxelgI5Ni+L
	 OJervgn0MYzfYorBLu83eEJMr+qv9oBd+5HxZU4Z/WC+sIX/h6m/SobDapYDjfGrfftLT
	 jsNCAMbnqEQqeFrKDNwR7ibB5y5PmYqqGX1ioDEa++f/1oD2NRg2vEjN0eXPjlr+mlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tNZMJ7y+;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=eCaFyk2m;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87F606A884;
	Sat, 14 Nov 2026 10:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B87F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tNZMJ7y+;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=eCaFyk2m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653492;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tNZMJ7y+XxG6bUYUHnGy4TRMQdh6DShmYpUKfaF227OphH+ymXgX3OxOkiiTxsz/A
	 a30XXnWOA4Qgp3hqUGKT+9p11MdJHZvej86p/c6O79jIqwwelEXc+qaSUaMYiS8YYB
	 8jlE+RJc3Ne0aOMiKSxSI5EWdc3q5qmZdbdXt+xu4MWgUdMfO3YaCoFudqREzhe33x
	 tWRLle0eqbOS9V86569GffyIIEVdtpCrvtNJvw/OjrOcmghryrtQF0YHnlwV91PcKY
	 DO/IW8mwxKMdKt7QBDgXlAwEGLC27R10re3hkHosGnLlN7R8l1tCCreOecagOKv//y
	 NnXf5nb7NciSQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id F350A489D7; Sat, 14 Nov 2026 10:51:32 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653482;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eCaFyk2md1bJvtKY+z6/gXxhMNSJaYmTliVOJInr1KEbhkb/0q15wp3XZJRjaT7at
	 i47Cgpy+4oAfum/0p4VB3YJTUHfE17iBTW62YQ1xp3pj0l3wp8WP0AvBKfrCJnPPJi
	 TGQOwZKEIDynkZF55VUKAO2jEQtr0ErbZ4IVnVuhjPz9aFg0WHYFLC6NydCoXrO53I
	 MIcRd9cWEWBsRjk7fuKNB20/o0Us2mb+f24udjQmO5L1rgrUhlcmedA6P/LUiGWJhb
	 musj2Uo3jmthI4LJ9arZNASQPs5x+MKMN3CVfyE77oc/pWMfZod4hQXJ40iC0sGQA2
	 PP282iUvS/WSA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id ECA30489BC;
	Sat, 14 Nov 2026 10:51:21 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:01 +0100
Subject: [PATCH net-next v21 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
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
Message-Id: <20261114-ax88179a-v21-5-c2d34410bcbe@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A uses a simple HW configuration for EEE
via a single EEE configuration register without LPI timer support
Add support for setting this EEE enable/disable register in implementations
of mac_enable_tx_lpi/mac_disable_tx_lpi.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179a_devices.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 1aa8479422517bff6758c884c5e47258c5d3ed3a..62619fd68c408f453e48c94020bce2254da9a1f9 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -395,10 +395,27 @@ static void ax88179a_mac_link_up(struct phylink_config *config,
 			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
 }
 
+static void ax88179a_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
+}
+
+static int ax88179a_mac_enable_tx_lpi(struct phylink_config *config, u32 timer, bool tx_clk_stop)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	/* AX88179A does not provide LPI timer registers */
+	return ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, true, 0, NULL);
+}
+
 static const struct phylink_mac_ops ax88179a_phylink_mac_ops = {
 	.mac_config = ax88179a_mac_config,
 	.mac_link_down = ax88179a_mac_link_down,
 	.mac_link_up = ax88179a_mac_link_up,
+	.mac_disable_tx_lpi = ax88179a_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = ax88179a_mac_enable_tx_lpi,
 };
 
 static int ax88179a_phylink_setup(struct usbnet *dev)

-- 
2.47.3

