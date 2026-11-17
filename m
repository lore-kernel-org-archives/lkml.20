Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907219;
	b=GkWNsgvSSA8UFhe2qtptaagqAPXcqw02m8hZCpbaIaIBgJrGXNEHNKF6nRpTXoy/B08b
	 f38rjerXc+gkNfgpVDzU39ACY4EqxL4howbm+Ooi80GUqVfH6B3i9aVxy0eAs6y54mLyH
	 9bMNK2v9FET5Ss1ZxOM0GLTOnLwsdHd10OeaGY332oIQ66Hc8LWiA627cv1EMT8I+mGKq
	 M1nmz6hZhFn3ZYiRcDRAoIADYKJI4wcO3fENfIa2rXUmU6DiKiWPnTyE3djmj5I/y5Bs3
	 rKUSxvZjVbsLfNFuxzEWaTRnhRKJcMqdEC74kG8eEvkyRl7Kj/9DPxZmJgbqdG5BskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907219;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=946TruoBFg89z3o/ur1VAln3zknG3qaCgtUQIi72OX0=;
	b=Y9oWb4yTL7/j0/FJKPwwpDoskA2STQcPEhA8IAyja/UYkRMVzGqr005s4yQvD45R1gOs
	 rr55EtxhkRgzTyonV418Jdv2Aky7fGjn7UYn6mmC46AyNVp2Kd2RQbXiw1AKjlq+qIzES
	 j8EqRG10qQB80Cfy/sr8NzF1t14q4n7YyQ0NFLKqBb8D4IZ8YsDRafM3vBjOlEhG04MeS
	 csUcOkIjk9wl7FwNqfKuDL/YIXfiMBjeafecLwK1Pc4xiA/ZqXEpGHmC/J4RAvlUlBFcP
	 Z+lcvTisIzW/DYyQbKMbDs35rbO1EbFjfYap1eLLK6jW9Z8NOTbTt869+cSYwUq4cpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EfsIUM9a;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449E606A31C;
	Tue, 17 Nov 2026 09:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D449E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EfsIUM9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=94
	6TruoBFg89z3o/ur1VAln3zknG3qaCgtUQIi72OX0=; b=EfsIUM9a87UGXSCC+p
	/5meEbUm7SZxGTkB/V0HPCBkSSEXHsUTN9NMIDcBoyM8m+CoTLnCxk/RyJ6frnC2
	bAT/8nHpamqsyfKPNBoulLAh2v2SDXEj/m3RMthCE1++qWSJmhNcTgcUhFKJFn1t
	KEIYkGZRv3EBRBaBw/B3vooKg=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3ggpIHPxqlKNEGA--.43112S2;
	Tue, 17 Nov 2026 17:20:08 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: phy: generic: request the vbus supply only when it is described
Date: Tue, 17 Nov 2026 17:19:56 +0800
Message-ID: <20261117091956.12103-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
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
X-CM-TRANSID:PSgvCgC3ggpIHPxqlKNEGA--.43112S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4DAw1xuF4fZw15JrWfuFg_yoW8ArW3pF
	48GFs0kr1DtF4xZws5Gr4xJ3WruFs3JrZFkr1xGwn5Wa4DG3W3ua9rGa4fZFZxur4kX34Y
	y34DJFyxCF1fu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6mhwUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7gjyJ2r8HEhpfgAA3m

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

