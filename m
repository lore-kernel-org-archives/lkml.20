Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908765;
	b=gyeQz5DpKeXarkZHOIlkzun4Lk0GtrSxyQfQo/HsiyFkpQAcJa4TEPKr1GZYBu2xfWDw
	 +ihJ45KlJz980nSf5nPRCEtnK8gvXrLiaNjq9O/DqTTXWtj/FM2C+Bbet2av0yGejA12L
	 JnJuPRu5M5EZeImtZrolvTTJMs9hlCaJZkCMmBcw3t9xUPSfl0H42ZfQ8faNQNk3t/Ty2
	 9b5Ts3hr0yWCeyu3bv8Vg/gygQ+gijMA5tz6EqoFnL08XTdo9EIjpI8Tp/r9egwZM/KwD
	 VIC9+XF6l7vG6g3r4J53WXvWYTWU63jDFA7y9euUfG0p0ASXXr0L4m+fQtSMbhNcI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=hDf0mhHNCCxUznWDBQ9HeMybgv0XHsXOZ6MyJPAO+Iw=;
	b=mJUG8sv6eq4eZGgQ65OsNpb145IaggKVkJnCmNAxAJS0U3mHazxVkpNMuRiImd5NM94X
	 inZ4SSgH48laAv0AgTV0K7sZPw/YTXWO5pxfND0CpAmHz6zIrh4gVOkRmk2ee6Xu0DQIg
	 VnmnL9Ksjf2Qswxp3o2XKmI7enWTsXzN2X530tuPofu4vDP7Hy6/mzi09ONedOuuX/mQ2
	 jhSO+cEPVGKGjC639aRDDjw6sQpP5M+feLYDfHEEAidGXAtKej5d8NYvEuRJ2ITJaea/u
	 l8D31ZM20fg0ktoK2HFWQxoQHUZZlmu2K6WRGcjSGDG+tw9QWiWlTcHnQCY/DOG5txA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fvL5dE1X;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599F606A31C;
	Tue, 17 Nov 2026 09:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9599F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fvL5dE1X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hD
	f0mhHNCCxUznWDBQ9HeMybgv0XHsXOZ6MyJPAO+Iw=; b=fvL5dE1X7Cnq4xXpXX
	iVrA371ZystQMd2CC8ydQvM5vUFd19qXZuC9AK2d47U/mZL9Aio/wYPiPO92G668
	BrWjOYsZVWCBOf+AJK0vY2o/+Av3XgdsRsUbnKlZ3GrutV6SytaWrJAB5fAi3mTi
	b9in4FCETbMR4JHrSUuwKUgN0=
Received: from SYPC (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXg4tOIvxqd+vlGQ--.29451S2;
	Tue, 17 Nov 2026 17:45:51 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: phy: generic: request the vbus supply only when it is described
Date: Tue, 17 Nov 2026 17:45:39 +0800
Message-ID: <20261117094539.13527-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117091956.12103-1-hsyysy@163.com>
References: <20261117091956.12103-1-hsyysy@163.com>
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
X-CM-TRANSID:PygvCgBXg4tOIvxqd+vlGQ--.29451S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4DAw1xuF4fuF48tF13Arb_yoW8CrW3pF
	48GFs0kr1DtF4xZws5Gr4ft3WruF4fJrZFkr4xGwn5W3WDWa43u3srGa4rZFZxur4kX34Y
	y34DJFyxCF1fu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq9aPUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7Q91qWr8Ik+WjQAA3e

usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
regulator. The legacy usb_phy_generic platform device registered by USB
glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
up in the dummy-regulator path and the regulator core warns:

  usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
  exclusive requests (id=vbus)

Only issue the request when the device firmware actually describes a
vbus-supply, and keep treating -ENODEV as "not present".

Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v2:
- Add the Fixes tag suggested by Sashiko.

 drivers/usb/phy/phy-generic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index de26b3023..24b7ba536 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -238,7 +238,17 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 		return dev_err_probe(dev, PTR_ERR(nop->vcc),
 				     "could not get vcc regulator\n");
 
-	nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
+	/*
+	 * vbus is an optional supply that only exists when the firmware
+	 * describes it. The legacy usb_phy_generic devices registered by USB
+	 * glue drivers have no firmware node, and requesting an exclusive
+	 * dummy supply only makes the regulator core warn.
+	 */
+	if (device_property_present(dev, "vbus-supply"))
+		nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
+	else
+		nop->vbus_draw = NULL;
+
 	if (PTR_ERR(nop->vbus_draw) == -ENODEV)
 		nop->vbus_draw = NULL;
 	if (IS_ERR(nop->vbus_draw))
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

