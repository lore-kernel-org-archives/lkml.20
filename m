Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F7437F725
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891494; cv=none; b=B8qe9wzE7KK3yaHf/jzLwCpc0vzohin6mFcwBX3MzzkhEnb6Ah2RouOOIrAKgzTAXbFVx8H5ZQntAlYjTounat1xJCGf2nzS6z2YOSkCDt3uWVlzcjmvHlOnOA3EFgQDEZmn8+3k8UbplH1E2wV2GRihQiFdIK2Xqn+LlAaIhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891494; c=relaxed/simple;
	bh=djo5yKX6IfxvUJfhcsOufrmLRwvOgrmjCKsvciG4XFk=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=FRPDjfgwuDLlaJeDKTtJm8OwKmMblzCVTdwLeAs0rgWqQqEZjlIZ+AmGOzFZic8+j9W6Zp+k0rgPPQ8zvCOU00oxmtiNGPdTsrTjiA0eHFSSeW20o9IMNRtCjXdK1jzrA613xR7vnQDB8my657uJv55dhuMf2JtSehu7U5UF1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=jQL1MG+H; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="jQL1MG+H"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c25420fe973so872570966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788891488; x=1789496288; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gIrDYrcRFL0UG1Ku9cpIdiffr0L0aeV9J+6pPKl758=;
        b=jQL1MG+HT9P/APXO4QjYG8PU3a1ZBz379SZy5UCuUt4DZbP0NCZEPNbetQiq+Lq774
         sMbr4K1cajZl7DXPE+8B6XwGSusbj7//uYi2RPGa5rsccc3Jh+oHGILDQRM7Pfd4Vvs7
         syJj1n3zuM+UKBP+xCHcx306/FEhyl1Ha/fjl9YUSGIzDwlimnlO0qIQPWPPu8e6HaUL
         zJbmEsy6ax8HaS3N/kQyEkQCCviuABu9h27//Od/CD7wntO3VSvC2j7tKS8x/n+Nu98I
         ipCESwjrQPfahXH59qmTtZ5E+Kr8ORKEOdA6mb+lSGnXDvELK1wN4mTiA0t7oDWeYdaL
         VLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891488; x=1789496288;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gIrDYrcRFL0UG1Ku9cpIdiffr0L0aeV9J+6pPKl758=;
        b=FTyFUWA5eEazNmYnuZRDQ+7x6Pp6msArkg+YkDxZ/wyrUCXJfLFgUHaf6T50qCyB5w
         5x2VQU50eICq21JeQm69jyuY26uMhyXTKZqkXpKkxpAEPn928YT2hXicin/+Wo2CUNXM
         wsaSsr2AgyMxTI4HOf8wneAM9sXLg5kqXu1BhecQ2dyuNahu93lXYR3wvszc/pduxUxp
         EPT3cJ79lQJTvZ7GPIk8lewoV3XyDRNiQqyw4WLhcMOUKsW52JfuRLtXyrF3zNSrIr/1
         nMzylRhCM7YsgWb/q4BBo/NhMlvNg3z7ulGFyvmuWokBYNRBZ6RosqQZtQX9mg7Hfxx+
         iRpw==
X-Forwarded-Encrypted: i=1; AKwUvBzcGzYOn/+z9KGl+jwzbzwDhz39FWdOpIcPwH+HTP94VGsTY8/XRJVInA0wFqo5B9tL7Pb/dCBmaI9QKKI=@vger.kernel.org
X-Gm-Message-State: AFuF++n0mJBkGKuW9FsueCqKw7ybEMlVGLYTADI1gr2E9zrL7nweqhu8
	qPL+GNu+d3UncyUqUQYlNCQT0CgYKAVlIuQU68tSP8dt3tI+tChvYx+fx+pOLI7yMkg=
X-Gm-Gg: AYBFou0FKW1qG+eHgoJ/0hFkf+xSElHGf2274AiMyI59oFh/I+hPO8sw3Iq5h8MpVH4
	QW25yWNYaCJOCeOKweqfhgxZ6sw0mzKce6GizHe1CybxzOhgoSmtyZpk/dNVgSFNMvm9fPPyTxq
	Eghl3LgYerVwAKNF621nSZvnekWd28G3VgS2QD2SlSREzH7+iKAl4EE2GQ2EMbqxGJKyktQMD0+
	ogl6ztS2rciT/kAhpLtZgU928Ligv9DQVvbCCf7tIcz4PLlco4C4hhZSKIjuqWqXuDCu7S+pY7p
	CZcogbKVPGDQse4FVhY06iH7R5hoKhtPtvwto2Hjdm501VK1lLc6XPzduY3TT0WhAXe99BYvJcK
	k7xgQ1j7upj1mA79luMIF7NMipiy2kwD51mDFtxfw0CeaJUWGSTPUQVp+PPfHlTpUsMruXer85L
	XEiDJoIpL7SndhQOtU7xVPrLHNOSal7l1eQ7rv/U4O8rgC1xkdgUIp2R+QiKfSNGSVViofaNuhd
	oGrFmWVQ8YuuM00iUOwnyWyS3ZBklll3pIE9ob0NrZPyuM/
X-Received: by 2002:a17:907:d01:b0:c26:19de:913a with SMTP id a640c23a62f3a-c2619dea224mr1018894566b.45.1788891487697;
        Tue, 08 Sep 2026 11:18:07 -0700 (PDT)
Received: from smtpclient.apple (80.49.147.201.ipv4.supernova.orange.pl. [80.49.147.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm657092066b.15.2026.09.08.11.18.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:18:07 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] net: clear stale traffic class mappings when num_tc
 shrinks
Message-Id: <16E3A318-5532-4B5E-8D03-86D21B463A2D@doyensec.com>
Date: Tue, 8 Sep 2026 20:17:54 +0200
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

Only the entries below dev->num_tc are valid in dev->tc_to_txq[], and
dev->prio_tc_map[] may only name classes below it. netdev_set_num_tc()
lowers dev->num_tc without touching either array.

netdev_txq_to_tc() walks all TC_MAX_QUEUE slots and
netdev_get_prio_tc_map() returns the entry as it stands, so a leftover
entry is handed out as a traffic class >=3D dev->num_tc. Taking that
class from netdev_txq_to_tc(), __netif_set_xps_queue() rejects only a
negative one and indexes an XPS map sized for dev->num_tc classes:

	tci =3D j * num_tc + tc;
	RCU_INIT_POINTER(new_dev_maps->attr_map[tci], map);

Any caller that lowers num_tc leaves such entries behind, and
mqprio_destroy() tears down with netdev_set_num_tc(dev, 0) rather than
netdev_reset_tc(). After mqprio with 8 classes then 1, tc_to_txq[1..7]
still describe txq 1..7. The splat is from an XPS write to txq 2:

  BUG: KASAN: slab-out-of-bounds in __netif_set_xps_queue+0x1eb9/0x2440
  Write of size 8 at addr ffff888110e978d8 by task xps_oob/573
   __netif_set_xps_queue+0x1eb9/0x2440
   xps_rxqs_store+0x24d/0x360
   netdev_queue_attr_store+0x61/0x90
  Allocated by task 573:
   __kmalloc_noprof+0x246/0x6c0
   __netif_set_xps_queue+0x8ca/0x2440
  The buggy address is located 0 bytes to the right of
   allocated 88-byte region [ffff888110e97880, ffff888110e978d8)

Clear the entries the new num_tc no longer covers, before publishing
num_tc so that a lockless reader cannot observe the new num_tc together
with the old mappings. For num_tc =3D=3D 0 this leaves the same state as
netdev_reset_tc().

Fixes: 184c449f91fe ("net: Add support for XPS with QoS via traffic =
classes")
Assisted-by: LLM
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
A follow-up for net-next can factor this into a helper shared with
netdev_reset_tc() and netdev_unbind_sb_channel().

I can share the reproducer on request.

 net/core/dev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index ecfbd72..e63e36a 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3145,6 +3145,8 @@ EXPORT_SYMBOL(netdev_set_tc_queue);
=20
 int netdev_set_num_tc(struct net_device *dev, u8 num_tc)
 {
+	int i;
+
 	if (num_tc > TC_MAX_QUEUE)
 		return -EINVAL;
=20
@@ -3153,6 +3155,14 @@ int netdev_set_num_tc(struct net_device *dev, u8 =
num_tc)
 #endif
 	netdev_unbind_all_sb_channels(dev);
=20
+	/* Drop the mappings the new num_tc no longer covers. */
+	for (i =3D num_tc; i < TC_MAX_QUEUE; i++)
+		WRITE_ONCE(dev->tc_to_txq[i].combined, 0);
+	for (i =3D 0; i <=3D TC_BITMASK; i++) {
+		if (READ_ONCE(dev->prio_tc_map[i]) >=3D num_tc)
+			WRITE_ONCE(dev->prio_tc_map[i], 0);
+	}
+
 	WRITE_ONCE(dev->num_tc, num_tc);
 	return 0;
 }
--=20
2.55.0

