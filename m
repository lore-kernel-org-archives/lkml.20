Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026116;
	b=29JO9McB9VHCKvDfm806qa8+oBpovKGPLyqZPsPgSk+JbWkb4fR8BTsuRez7MgQ3ztvs
	 E8WTiKXK6A3eGWa5KsrCpVpuv2UG6ZgexfLrCS4B1Mh4bqrYGzlpkpOmS7Oh14ytY4Pay
	 u9xWmxX2i2rUFfdrFdOydU83i6oAOdkHRn3Ubs8nUuNT4ASa5rKwwRUFo0RNgfUXdVSs1
	 haoAYa4/miucG+h69o9kBb5a8iJ5Jgzui8OSyYZNlCVPEKc7zP2yZR05ydUzIpuqmhWMv
	 aM3xwirhJ1foEr9KcEBmp60BcSxOZTpX5H7WvWyqfgXRrS43IL4hBWdZvFYOwyRKqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026116;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=qpv1IMTfP7iqXzxzvwIn5n5Lxxhas+0tJm39mkiU4Lw=;
	b=d5bis0SrT6Vq/x/710b7cAGYjEE9WL/2tNisJ0Ts/a3MoLd5kEinu69rULNuy8PWazrv
	 0Y0PqakaXso3SdurwM3u1prOmtkcrfs7fOJlxZAdejFqCVXuqumZuvY8eXXwofeU4ShIM
	 7JbXsP5WNv/pLi4k6Smdx8fUJFn3MQVJYIH3b6SNDu2gPa5BZAPUZd4Gqtoq3G/n9CnPR
	 /koPhJgRttEesGAy9Bp6uXC+IJ1aPCHn6PAcxwUr/3OFp5nogi+RL/JrLXIsG2gpqOYaf
	 if3dX5dgp99le5Myxtz79zlmmHU0l2G3pLRcG+gqO9OTLYE5vbWmRTsx/9nVhF4Yiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SM7x6PWZ;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13547606A31F;
	Mon, 26 Oct 2026 14:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13547606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SM7x6PWZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qp
	v1IMTfP7iqXzxzvwIn5n5Lxxhas+0tJm39mkiU4Lw=; b=SM7x6PWZcGFqh9XsbH
	iqgtTIxVfOpJQl7dFM54PPjvHJGBpeshbkr1xjTEp+CT7cXiwduDq5tosFGJ4vCZ
	Y2Q+jr3mutB3heO90HApmi91H/gJ0VzFlq9SaMGx5IZhZyjytOgTRsac2NZygHrB
	2ph4qbDHeUUToJCc3dL2AfDuI=
Received: from SYPC (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHzXk4aN9qXYziBw--.45867S2;
	Mon, 26 Oct 2026 22:48:25 +0800 (CST)
From: hsyysy@163.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] usb: phy: generic: request the vbus supply only when it is described
Date: Mon, 26 Oct 2026 22:48:00 +0800
Message-ID: <20261026144800.1392738-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:PCgvCgDHzXk4aN9qXYziBw--.45867S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4DAw1xuF4fZw15JrWfuFg_yoW8AFyfpF
	48GFs0kr1DtF4xZrs5Gr4xA3WruFs3XrZFkr1xGwn5W3WDG3W3ua9rGa4rZFZxur4kX34Y
	y34DJFyxCF1fW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pilks-UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7Rm67mrfaDn3ggAA3x

From: Yang Siyuan <hsyysy@163.com>

usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
regulator. The legacy usb_phy_generic platform device registered by USB
glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
up in the dummy-regulator path and the regulator core warns:

  usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
  exclusive requests (id=vbus)

Only issue the request when the device firmware actually describes a
vbus-supply, and keep treating -ENODEV as "not present".

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
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

