Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160920;
	b=p0gc8rrdf5GVx0/3TPlSiu6KpJlXK700gUaor6VUkAJ+cNeXdktIxU5AiA+gMOkC6JsF
	 iRS1kxKCGHbGn6yavrQ2vCY9mCA0ehry8XZe2mbkkayTL0iEYBH2UOl6HuoRZOGp9/V/k
	 RkK8q1zv3BH9bhQ78gReitu9+SCHTn3+Nc1nRVdqlW1FzcRToOgzCGesoACIOT8eBbm86
	 dPaV5IlLR/Ki6MwnHyD1h4PYTZnkfyERTTrmemFXDa96bZG/DDjJwwZzijlR5XIclhWSJ
	 V5mMuYgUwajG/MJEecMSsU8wi8krC7FgnoG5cmjRqkPsIIhik2Eze/XSHxrTfry5sbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AryQU7CqG24/r+NiOYec3B/lZ+GdRJNknAEAX2AGwNI=;
	b=hZ5jRI2oYRtGVLyjhL9BUBq1iY9PbYiCHoTo9D8E6qraQ7YJMyPUJqQVz9tAI4WB9K2x
	 aE+/qzqH7GHoBGhwuWGR4lMX/Q9rjPGTmVwWmfqdML5M5/1WT6MeXcvWYYdsfqO61PcK1
	 aXbjyWdoWTRq5cHSqKhSUahQtzUO31p2S6NcQI93qcmUB51R4Nb+Fdu8yA35luJmSXRwb
	 xZcYFoapZXrsaGUfgdMlphUyOcxEUvJAfj5xvT9JcewEN3UFpkG1x7wHI0Cg5ItNIOuXI
	 qHg+C5u0OoKVsOK0+WMKloi+dPRRJiYG2l+WoI/uv73vDqbQCJYDA5oeCYNm0za5Slg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1xLzpOI;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B5606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1xLzpOI
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f6295304dso200468eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794160920; x=1794765720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AryQU7CqG24/r+NiOYec3B/lZ+GdRJNknAEAX2AGwNI=;
        b=d1xLzpOIyq6asfMwyCX5apfZAUs4htmNuZZRjPMHPuUK6AmH9L3jOh1gL7trAlxxyG
         iu4pnWURf4R+Cj1bD9O2+j37+caLY0fW7eQAyz33KFX9dN/Ss5o/QgyVQLBh01OeKniP
         CHMghxoo6oJa+F0QrC5ZiClEO1l7t6SyOduS6AUrnf6S3aw1IwkaF3N5J1AvyPFFtuA4
         DSuttrWNMn5vNR8rHkCzQABrGnlFf2uYjYZ6bbzFS9f8sMeaQ2BlneHztHQz0zdU/QfH
         NyOy9Ym9NIRfcK5yD04PEZiFaihXwJarjfyfRvW+UaxrVfeUz9dJDauvZfD6e3u3m02W
         o4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794160920; x=1794765720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AryQU7CqG24/r+NiOYec3B/lZ+GdRJNknAEAX2AGwNI=;
        b=W43JBMVXKXAS/QCBdR3+eoZYdj/OXpcr3wIpt+AIvNyKrjehVtjSl7F+ZND/0L9+tP
         F7NfPmLfLrQB6L5KVflAn4P8ftmOVRu818AAMOqADy6xlw6E4widd9fy8Pn77KvlPPjQ
         xnpqZp9WjzQZ13U8c1Sg69cRyaLIIDucD3PhOypYZujjBXIe52BMbIuhncegG/ubSJNk
         eeqhPadYno2pygEkKXshq1tQHcxkfa6FU1roYHr13S2i9NSsCWn3nAeEdtm9zpC28dfK
         2QvQRnmau+FELMiIHMFhSzHkUOWwyZM4i/AGiN4lqTJJPTYyMFj/G/Wyd/GVfQAGbIy6
         FZGA==
X-Forwarded-Encrypted: i=1; AL+hErEsrkZSmRuOVGD//Y+X423C5Cssb5cbq/o0jXiVqVNVjQj9f4oAZ5y3isLwRbwW/SkwWND/AqafUbtMB+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jvM7E/smJfuCA4sMROSfuWPmk6uX0+rerdq14FnoTGynuwzWT
	i+EtWDngXN+Mh/VC+kYMxGoHZWctK3xQGzlK8zUmtBLftDa/gO5wMM+k
X-Gm-Gg: AYBFou35v8xu8LF7J35B2jywa9L9NioX1J0vQbAwWv0/mIevEtjcd2sx6VRuQ5FeJjp
	fcvjy9eK7+FApNvCOuji4GLaaoGiGlJcrE0Tn4TGBAE7Rlm70kJ/DNpP+fLzC8o2vL0G+FJv/4o
	AP60fhWnZQJ/91lkA1xmX99ChYOyHha1eMB30ZqzuzwfpVwsSidJVNScLhNDfsCwJpYTcmk6FRh
	S5zlgBqtIZLs5gxC/JHaA9y18Uzrytl7e+9mUOIfxr/0R521aImoFpZjJHsqzi/mxi8fg5bVgds
	fjUd2xvcuBJUHq86QHp2oYy6yYNftnjq5r67StUduq4i0CWRutSAhT0RODCDGIVMj33rgCJUvaC
	b2eY9DskjUcwnJyOU5h91jJciOnNfbY+fdnApjUgo36i1eZZvRbjtwVwmU8ubKWOXb4Vp53InXy
	F1IjRx1HYu/zXf0cHmdmZ7Ng4HzeQS9mLmUVWe0+ebZI8OofmMYBaGCGzmSIdNDaCfgFErnVPD2
	2yxvNWdqlwZoNSdKew12HmqZ8SIY5nTgaZHtd2FeQdCc8BRUjf77r4XdpJe4T8Z+TxjEIxm5HA+
	8GJj0QgUYsr2sI5y0R+GCiEn9F0i8pisa1b7IZuttg9sC2pXjlFp0E696AVvR3m1e/pfTw==
X-Received: by 2002:a05:7300:c3a5:b0:373:5561:8d06 with SMTP id 5a478bee46e88-37355618d75mr936629eec.37.1794160918896;
        Sun, 08 Nov 2026 10:01:58 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm7072856eec.26.2026.11.08.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:01:57 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ata: libahci: delete the SW activity blink timer on port stop
Date: Mon,  9 Nov 2026 03:01:34 +0900
Message-ID: <20261108180134.734111-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

The software activity LED support arms a per-EM-port timer (emp->timer,
ahci_sw_activity_blink) from ahci_sw_activity() on I/O, and the timer
callback re-arms itself while the LED is blinking. The timer lives in
struct ahci_em_priv inside the port's ahci_port_priv, which is allocated
with devm_kzalloc() and freed when the port is torn down.

ahci_port_stop() never deletes this timer - nothing in libahci does - so
when the SW activity LED is in use and the AHCI port is stopped (driver
unbind / module unload) while the blink timer is still pending,
ahci_sw_activity_blink() runs after ahci_port_priv has been freed and
dereferences the freed ahci_em_priv (use-after-free).

Shut the timer down in ahci_port_stop() for every link's em_priv before
the port private data is released. Because the callback re-arms itself,
use timer_shutdown_sync() so a concurrent re-arm cannot resurrect it.
em_priv entries without an armed timer are zero-initialised, for which
timer_shutdown_sync() is a no-op.

Not tested on real hardware (needs an AHCI controller with SGPIO
enclosure management and the software activity LED enabled).

Fixes: 365cfa1ed5a3 ("ahci: Move generic code into libahci")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/ata/libahci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 001a6f5..873645c 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2605,9 +2605,23 @@ static void ahci_port_stop(struct ata_port *ap)
 {
 	const char *emsg = NULL;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
+	struct ahci_port_priv *pp = ap->private_data;
 	void __iomem *host_mmio = hpriv->mmio;
+	struct ata_link *link;
+	struct ahci_em_priv *emp;
 	int rc;
 
+	/*
+	 * The SW activity LED blink timer (emp->timer) is armed from the I/O
+	 * path and re-arms itself; shut it down before the devm-allocated
+	 * ahci_port_priv it lives in is freed, or it can fire against freed
+	 * memory.  timer_shutdown_sync() also stops the self re-arm.
+	 */
+	ata_for_each_link(link, ap, EDGE) {
+		emp = &pp->em_priv[link->pmp];
+		timer_shutdown_sync(&emp->timer);
+	}
+
 	/* de-initialize port */
 	rc = ahci_deinit_port(ap, &emsg);
 	if (rc)
-- 
2.43.0

