Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735609;
	b=jD1Y8tCQhfLqhhYeJRFogWy9nrbOYRGRvltIJ72+w6vWPeNI0LrvyE3LLiNtgiMISeki
	 qs+99YpmEowIPicdmUiwXwDZRcn6fimD5EWcBPIA2tz+oEUaDkVkMKFo4+bAadICWXX1Y
	 MsAFPDVgpps23JT8Blqre8OC2ZQOznd16JDOM32FyBmiRBQB2SsjnvX1m+JAJZZl9DWQE
	 2ksOAsNYtzWUTCgZ/+rGt0sqVUPRsM8gSIPbWH6ub4zSSddGn8I8YV/0i0SFX0pIFI421
	 bYMmMoZY2jk0b6lL0vIF301iOWMGvXA01ON0D9nNbZ7DsLL5HoE4Xfd+0zzEYq9Lacg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735609;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Auji9buz7SC60r+Rg/chnteRrB53AV4gVEU0ZMZqUdI=;
	b=rGZKKN3zIhYvG5yuIfkIV78lg14mpmMS8tSOtFXLLYMEReEJF27czoETxd0oyEcPFNid
	 H4OA/VdQBE08Bjax8AG7g/UazlqLNVp5j3FLKObn7/OsnRUnNZY8lrqprmOoWpP2tlL5T
	 Nb7VKw3+/YJkWmBpHeoiYWJ01SZg6ugBDM+UQEek41sucwfi/HxQp+IZvSRfPaz1bgV6m
	 gfZ9RY4+5HhXEalmuxQyXa7aAXMN1OCELQnZP8t7Mfolr5aJBQ5dzlkHqDQZBjoY4kVtM
	 CGxN+P4NS+zNygNGlDXllwYLGjBiYjnL50AJbFEjuiCSQkNL8hycScJUgTOMxUZIL4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=UQRlNGn8;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EA606A31A;
	Sun, 15 Nov 2026 09:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=UQRlNGn8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794735604; x=1794994804;
	bh=Auji9buz7SC60r+Rg/chnteRrB53AV4gVEU0ZMZqUdI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UQRlNGn8hLopV55LMiNIrBGxtjhrPRSzhQ9hReMvVWMJt3aeZBGrqDzLXVw60E94U
	 MbZbsiySCfWteVhXXn2Wfj5MgcQPsWWR9l63bR4mgpy6WOZhQt9LQroPWMtPXbw8o9
	 WZ8WlnG0Bl2eINRVpHCj3qhB2WI2eLvcCaGVVBP/n7u6QuADan2kwO3l+VEF9ktvNq
	 5FJsmKojZ1IIQFMN9dzxCDTgeaznEFSTfUsgM93syFd7Z7S+mSNZ6hUzSNeRXmO7CN
	 zaaLPTbwvAd21TJE4h5WyK2qvy84e7/SJz3RpYFenHMnCM5iurUIKqhRq8GU4dsHHK
	 8HucgT50kNuMA==
Date: Sun, 15 Nov 2026 09:40:01 +0000
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Jonas Jelonek <jonas@jonasjelonek.de>
From: John <therealgraysky@proton.me>
Cc: leksij Rempel <o.rempel@pengutronix.de>, Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C device ID
Message-ID: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 6cab9253a13400a28241ff7c52ae7468db8bcade
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: John Audia <therealgraysky@proton.me>

Some Ubiquiti USW Pro Max 16 PoE units (boardrevision 3) carry a PSE
MCU that reports device id 0x0238, so probe fails with "unknown PSE id
0x238". poemgr names this id RTL8238C.

The high byte of the id follows the chip revision, as with RTL8239
(0x0039) and RTL8239C (0x0139), so add RTL8238C with the same power
limits and power limit command as the RTL8238B (0x0138). Tested on such
a unit, PoE works on all ports used.

Link: https://github.com/blocktrron/poemgr/blob/17771dd7b3a74a64c14351d1cbf=
8e61676934cbe/rtl8239.h#L13
Signed-off-by: John Audia <therealgraysky@proton.me>
---
 drivers/net/pse-pd/realtek-pse-mcu-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-pd=
/realtek-pse-mcu-core.c
index c70b09ca2012..9ae61184b573 100644
--- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
+++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c
@@ -43,6 +43,7 @@
 #include "realtek-pse-mcu.h"
=20
 #define RTPSE_MCU_DEVICE_ID_RTL8238B=09=090x0138
+#define RTPSE_MCU_DEVICE_ID_RTL8238C=09=090x0238
 #define RTPSE_MCU_DEVICE_ID_RTL8239=09=090x0039
 #define RTPSE_MCU_DEVICE_ID_RTL8239C=09=090x0139
 #define RTPSE_MCU_DEVICE_ID_BCM59111=09=090xe111
@@ -159,6 +160,14 @@ static const struct rtpse_mcu_chip_info rtl8238b_info =
=3D {
 =09.pw_set_lsb_mW =3D 200,
 };
=20
+static const struct rtpse_mcu_chip_info rtl8238c_info =3D {
+=09.max_mW_per_port =3D 30000,
+=09.name =3D "RTL8238C",
+=09.pw_read_lsb_mW =3D 200,
+=09.pw_set_cmd =3D RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT,
+=09.pw_set_lsb_mW =3D 200,
+};
+
 static const struct rtpse_mcu_chip_info rtl8239_info =3D {
 =09.max_mW_per_port =3D 90000,
 =09.name =3D "RTL8239",
@@ -746,6 +755,9 @@ static int rtpse_mcu_discover(struct rtpse_mcu_ctrl *ps=
e, struct rtpse_mcu_info
 =09case RTPSE_MCU_DEVICE_ID_RTL8238B:
 =09=09pse->chip =3D &rtl8238b_info;
 =09=09break;
+=09case RTPSE_MCU_DEVICE_ID_RTL8238C:
+=09=09pse->chip =3D &rtl8238c_info;
+=09=09break;
 =09case RTPSE_MCU_DEVICE_ID_RTL8239:
 =09=09pse->chip =3D &rtl8239_info;
 =09=09break;

