Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793749;
	b=PCzRsIPC/a4Wk4v9KUD8dhgfEJ77+drWtAhLfIvV5TFZ+EwDf6yZemDBoLIOuc11Ibpx
	 LjkTg0zyUR5g4dLVUXW182rBlx797p7HSTSFI/lwBOJON4ks9XUo0+Mg/bDQemoRCI65S
	 2kcYycG+5onejMe6P+Uy6eS3NXDnFj0Ydr7l4f4/tN1Y2PmgZ4iR9fwu5fF6VNsA00OsA
	 xuYz1hHAYkGfr4xZp/ko5sy07ucKeGYkz2oj1phRMVAYNcVlLyZm9/HEFTP/I90Wh5oKV
	 sCQgy3fTwihX86O5IUCpDIBtB30qQKDGftI1Bbvd0EOe2qw8KjrSVfYkSC509i4ReOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793749;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rekfepe5axDxfYyni0ajF7ujUuhN9THJ7yTWEHuS3YY=;
	b=Acj4Ui1mgxnk6ARSu+Q7ZAiY8MJkNlaxRlhIfQ5yTIQZa1hpTC2I1+uj4DgImKaAe9EZ
	 dQOk1JnlCde089lcY8F4jw+z3WX6AbM4pYhIFyVhtN3zD6sVTCo5hB8xrsSNnbuv9d0S6
	 t7tXsGOMGUXzLtjgOleQxNMMQqseVs7GD1BQnhZkb+OVXC/7wm/PWY8AZNXBsvUTwxWTj
	 LHWlK8VtkzISUNX2/50eOqCuoA7ViJygqQdMM8TOg6dOR438tCxj+XYzXWCveSW8GyOAz
	 jgvzRRTlDrUmFsjf41+12pA0Ml89GMr8eA03i7VakGxWFmmMwqqoJAwsaLsswsysg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=IB8iYmWT;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E0E606A336;
	Mon, 16 Nov 2026 01:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E0E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=IB8iYmWT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=IB8iYmWTpHDQG+taqhqaKNRIp339AzhOyFN6jHbDhlgyBNqHbbW7BXbI4uIH4YDXYkdHKrzIzRDnZ
	 4qHKDw8gEJdzM318m/3hgO3RdAhKoj4nxQObUGt/4KQzuyi2LIJGtg7cdqMMIdoe7C9SNd6zuJyohG
	 hHnzvsgs5VWOA5fo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afa6112a69-ff127;
	Mon, 16 Nov 2026 09:49:07 +0800 (CST)
X-RM-TRANSID:2ee96afa6112a69-ff127
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afa6110083-77031;
	Mon, 16 Nov 2026 09:49:07 +0800 (CST)
X-RM-TRANSID:2ee86afa6110083-77031
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: hso: cap the MTU to the mux tx buffer size
Date: Mon, 16 Nov 2026 09:49:04 +0800
Message-ID: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

hso_net_start_xmit() copies skb->len bytes into odev->mux_bulk_tx_buf,
which is a fixed MUX_BULK_TX_BUF_SIZE (2048) allocation made by
hso_create_net_device().  The net device does not set max_mtu, so
userspace can raise the MTU up to IP_MAX_MTU and make that copy overflow
the buffer; the same length is passed to usb_fill_bulk_urb().

Cap the MTU at the buffer size, keeping the 14 byte allowance that the
default MTU already uses.

Fixes: 72dc1c096c70 ("HSO: add option hso driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/net/usb/hso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..45713c994 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -2393,6 +2393,7 @@ static void hso_net_init(struct net_device *net)
 	net->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	net->type = ARPHRD_NONE;
 	net->mtu = DEFAULT_MTU - 14;
+	net->max_mtu = MUX_BULK_TX_BUF_SIZE - 14;
 	net->tx_queue_len = 10;
 	net->ethtool_ops = &ops;
 


