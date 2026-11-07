Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068844;
	b=GyrjsrO+cmtp9DBmepzwGlZu7Az3LqfITCFOrO0OexHh0SvW4BXJfEZV3E+uEWOjWE4b
	 mDB4MChtJncYB+/06zsPWKbqavrQPkspGZSahXA95AMNoUUG/GnKNhziSGezraSyvmfxJ
	 9Ceq+QDjZxwa/7ZPsP62911aVq9S6132d5mzKtAb+Dt7n32drtpTIhmw247w/W40cla2c
	 9cXIoVIS7StTOSsB64eRhlff3eupJebgqpr+orSR37IVvPoRjNwOUKO5wghlqGttoenaf
	 Py92p1+4NQqRXiTOsVPLuJoGOxNc6ySJe0N7T3yhLZn0idhPqahsnbkG1umCWUQgMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8iDgo6XjJcvB5XRw1w2M3oqlB25XsiQDubeqinQmBrM=;
	b=fCjnGLYoe5FuPkliEn4AOVF3KzJxXqAYkxT01CNcYaZhLfPbE6PmvyegLyZhuJDVqdqv
	 n1pQuEqYZ9/14yIDI4ZanpngOAy98uyTU05iwRXyTxiGpmiX6/d6PnS/TECi6L0d8M+34
	 vN4vtOg6YUk0OJ74dBjnkTNfCVsbeJed4PQeNcNUL+qunvWXolZGmESh74rCxVV8nz6ak
	 nWMRzbDlBqbcL6fOWVloWlSmtTQomaH1Zw8/sfc7MGbNkJipTP9qtfSjGYxhMVzHMgJKj
	 R4LZHLavjup0E8CBIFBOUZlZXq08ldmk8WP2MF5CxDmNLPQNSIFsOgKHxomuI9M3sQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWDsj2Cw;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D300F606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D300F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWDsj2Cw
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso2359962c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794068843; x=1794673643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iDgo6XjJcvB5XRw1w2M3oqlB25XsiQDubeqinQmBrM=;
        b=wWDsj2CwAZa7+glxJkIliQdsvFrzUPRaa+1MfUK/l/CTx/1bu8Qat8tT551GBRkT6V
         9uzHPdIZT2bVCs3gRP7FmiLWPavC25Ktm/6kv/N74t6mzjCHOzFbJIO9WpPrXpkjyyHH
         CzOPIJEQ6RITHqe2bp4t9SZD4+KuXhajqA6LLK0SEMbPQ3N9+LNmQwai9NfbYJ7rLK5G
         XWAzre+3+3ZoQ+nuvhW6bzT1BWtmQes4eigvar3t6cTk41KYmM0nA09LOcCuzKliR7ae
         3AlRjHCiJrNbFOj31v5TOoZqjnz0Ju4WJCc+VJuGhJznnZIY+LLRgXrHI7+D28Tgea5r
         rPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794068843; x=1794673643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iDgo6XjJcvB5XRw1w2M3oqlB25XsiQDubeqinQmBrM=;
        b=ZR3AQC4+lLYnENhHBBmxUbMSQpC8+2jcqpu7g/HOLvrcMTEX6sO6U6ky0AQxZ91QbO
         0d4bP0qF0EieX5rELx88tpyNE9nmazcYeUrzAovHi98JrJOE/bIlaKXeCukozApK0U3M
         UhoEBemSACqiWc+dmP0f6Glgs5iteyQq8qxn8sAt3QHyEFeklurHwOn18RDB4DlnCNwS
         kiGKL2yItPHzOGjE9Nx/R13+7229UMYBEkbl16yVWQZb0+v+u/3iyRq1763/3Pwennb7
         gfiJmk74sMDewU84kxrQ7fJbrQZsfmI6wdUFOuweJd/TFLJZ/rhKrudI6UA3ajm9zbtR
         Pr4g==
X-Forwarded-Encrypted: i=1; AKwUvBzKtOG8WaFVN8NzuBBm9uL6Gz09iP9PrM8KT5hu80rfLgF0EnFGh5Bn0pBneMkwO280xyRdSSiRmRTmv9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KOeJVTzUZ0WxnUBRVlxxVpXTKYMWw/ASsBVgdFZ8N7mrwWwfS
	nRKbJ+IqKq08ewTr5IEcdUKvEGEItJOL3iMREYyIbciM7/f1O9XCpFbu
X-Gm-Gg: AYBFou1BTK1icavSUf11V5KigxxwpCi0HglZLCn2U2m8z5sLT3Oxy09HrqZBaQFCGUt
	eLjuS7UxVWHHTZkX/jGGqv1hh5tI4OAU3rEgXEtFBwH8R9+70K4T39C4ZbToRVlupHnmk2kbHQu
	lFqztIlA+njw9IYjXfSPgiGfObnGPX/SglrHge5KefF49RqvQPLSOjd96ljxpAcMoiQMmfY46SD
	YoXcPWtqGdxaIOmji01mxsVwZj2J2mwNRG2Ra+c00n8EKSFps4Sd+Y/BZAvJxbG62LPFNbgXaFT
	wCfOSvSG76XBZfGTdrsNNT+1oBSGXsXDtVcnck1GfTENkYbT3XOqXaOZUhdaNZHuUkHMnYrtkN3
	HVknlLyik+LtwUnRN1NCCOC0C6DTt870wLwDAS4HFYzw2qrF5VheMKeL22KF/YkX0mVHNt/30G0
	wSAB5yVWxAufbiSq0uzs1bOSxralT90E/v5HVL354cCHghbgQpcQr7m6Q0K2DCV/Ou0G1yuQCGN
	5D6RZxF25E1NkUQ6cKhBU2Ku6gG1VADPH2ID2YtVXM9P3iGdvPfT9PAtvSXdIulCv52q3KM/J+E
	Z16r+A4EgXgnvwH55504wanyU7blXSlZtgMpKXk=
X-Received: by 2002:a05:7022:29b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1b25d3499f8mr6609198c88.20.1794068842773;
        Sat, 07 Nov 2026 08:27:22 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm29025370eec.15.2026.11.07.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:27:21 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andrew+netdev@lunn.ch,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH net v3] tun: disallow setting IEEE 802.15.4 and 6LoWPAN link types via TUNSETLINK
Date: Sat,  7 Nov 2026 21:56:49 +0530
Message-ID: <20261107162649.282982-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A userspace application can set the link type of a TUN/TAP interface
to ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, or ARPHRD_6LOWPAN
via ioctl(fd, TUNSETLINK, arg) because tun_get_addr_len() explicitly
recognized these types.

However, TUN devices cannot function as genuine IEEE 802.15.4 or 6LoWPAN
interfaces:

1. They lack wpan_phy, channels, PAN IDs, and MLME operations, and tun
   never initializes dev->ieee802154_ptr or dev->ml_priv. When an
   unprivileged user creates a TUN interface in a user+net namespace,
   changes its link type to ARPHRD_IEEE802154, and issues a netlink dump
   request (such as IEEE802154_LLSEC_LIST_KEY),
   ieee802154_llsec_dump_table() unconditionally dereferences
   dev->ieee802154_ptr / ieee802154_mlme_ops(dev), triggering a supervisor
   null-pointer dereference / general protection fault. Similar
   dereferences occur across net/ieee802154/nl-phy.c (ieee802154_del_iface)
   and net/ieee802154/socket.c.

2. Similarly, the 6LoWPAN subsystem assumes via lowpan_dev(dev) that
   netdev_priv(dev) is struct lowpan_dev. On a TUN device, netdev_priv(dev)
   is struct tun_struct. On netdev events (such as NETDEV_DOWN in
   net/6lowpan/core.c:lowpan_device_event), it clears bits in
   lowpan_dev(dev)->ctx.table flags, which corrupts private memory inside
   tun_struct.

Rather than scattering checks across subsystems, fix the issue at the
source: disallow setting ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, and
ARPHRD_6LOWPAN via TUNSETLINK by returning -EINVAL.

Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")
Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v2 -> v3:
- Include ARPHRD_6LOWPAN alongside ARPHRD_IEEE802154 as agreed with Willem
  de Bruijn, preventing Sashiko AI flags and addressing the underlying
  lowpan_dev(dev) memory corruption.
- Minimize code churn as advised by Willem de Bruijn: drop unrelated
  USHRT_MAX check and preserve tun_get_addr_len(), headers, and existing
  block indentation.
- Fresh standalone thread as advised by Jakub Kicinski.
- Link to v1 and v2 discussion:
  https://lore.kernel.org/all/20261101092219.1278751-1-skalpesh942@gmail.com/

v1 -> v2:
- Instead of adding NULL checks in net/ieee802154/nl-mac.c, disallow setting
  ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR link types via TUNSETLINK in
  drivers/net/tun.c, as discussed with Andrew Lunn and identified in Sashiko
  bot review. Virtual IEEE 802.15.4 interfaces are properly provided by
  mac802154_hwsim and fakelb; TUN devices cannot function as genuine 802.15.4
  radios and lack private 802.15.4 contexts.
- Add an explicit bounds check (arg > USHRT_MAX) to prevent integer truncation
  bypasses when casting 64-bit ioctl arg to 16-bit dev->type.
- Remove ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR from tun_get_addr_len()
  and drop unused <linux/ieee802154.h> header.

 drivers/net/tun.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e60..05eb28578b8 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3362,6 +3362,10 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			netif_info(tun, drv, tun->dev,
 				   "Linktype set failed because interface is up\n");
 			ret = -EBUSY;
+		} else if (arg == ARPHRD_IEEE802154 ||
+			   arg == ARPHRD_IEEE802154_MONITOR ||
+			   arg == ARPHRD_6LOWPAN) {
+			ret = -EINVAL;
 		} else {
 			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
 						       tun->dev);
-- 
2.53.0

