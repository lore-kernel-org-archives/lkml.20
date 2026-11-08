Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145220;
	b=s45GwoQKpSJgyH7014oAHkvQ5ba6ExSM0QxsrTkdOLYRKrRQXnfwoGzELpMW+u0FjA3B
	 j4X1s7YKYNT+NXLOF1Ofn4He/qzFxcdoCFrTjcYZ4gkdy6mRIBafxj14YxLW69VRvMOsm
	 KXr0I4jcl/24zYQXOSzahi3Dip0vOusI/iMrOiFfAyH4cf4ZW970dxWvLvoXUJ0Ul55pv
	 sv1OQTf5ANUgbXBhv/Nlb3fxZe7dF6x9EScCXGeAmCCdBL78hiFS8KFkWlQ4I7CBVgcrk
	 Q57fCQwJuLyISQHnCmjJnxFimJAjrJ0Hf0kOX+Lorx8IzGb3OmLiFYU+CMRQAl//MyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
	b=XPpqKLklhqSfOkMAMmTVLNSQvQ0lBaB/mPZ9Z0N7YVN0vYLGHCD8qWChbVERiV9IHHFj
	 B39MSo4lyIQ4tKICSyQ0eAQ32HuK/qc2F9Ui05dU6YlSe+dxFR2ZRp25HUffQXTIVu06V
	 +mUkxySWBw7pgPVhnz3bIIZNMDwTTgfIsQHrexdzRWP1YfDJrHIjw3YPHAMX1Z5jMx5CX
	 GoqyGsZo9rJHti32TkbZTwi6xObd9tB3wOwrzpXkkWoBPXaOMVEtuqhCNTi2CVqKK8GXw
	 9xTk48CKgaQSEX9+QOrFiLRjocl8+fmIJYjTILbfLTjOhWCXCdjtnaCm7UKOAmEZD3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e16XaiZe;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A0606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e16XaiZe
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so79868c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145219; x=1794750019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
        b=e16XaiZeLjFiJzZ4yWhuC5nleaQjirotE1wjpBOurW+JbGOwqzoNfQSfBcGaaRSdJr
         WEFfUvrpC7ZMcYDJlIQZ3V819iVTpYG+QyvktBF+D5mgtRhwv6VQAaup4bo50gRa00dw
         fNeO8B5WXtACt42ECLy/r1lGXAR0Ixn2GUhc94tNH+do7lCgT+1BtTg+H8S4dHFwIt/9
         4/iZ+H7GS4XFWrzdltdv0gpg/6k3TYxjdeC7t3QKmKTSs/ELPBoL6o1scxNQavayR/aO
         HDRkiJbuaL1gQoVtIAIpRGbu02dfCNX/UEnLKd+AD69KYYmRIMT+gqqXu21/XyGKSwj5
         psaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145219; x=1794750019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
        b=C7YFL3MXd9id6qXId1RhRJXC9TEjpIell1sGznhfAhHCj7D2pqAbEqSN7vwsynrhSg
         h8RT3BzuVT7HoGhKHxz4vPEBJGIDpC3AAbA6ZH4cdYlqrjcBcosc4njihxidNaVesLuR
         cFL8jeigbSZk3yjwOOht/R6RLeUlrLIhaxeFgVTuQbGBVDM6g0H6nt7qas6/wP+NZQJ+
         wtNc/G4w/vRx4Sjwp9h2hxbVaxc67ggL/zr/g0coKCLJrDb1PBqeqkVBeK1EJFPnFrFo
         QT2MFGsSc2Ubb8vzWhHwIj4+WP7oayrQjuyrMSgTblSlTa+PGeIj7lPjOiRfzLf8tY6k
         Rzlw==
X-Forwarded-Encrypted: i=1; AL+hErGtIaEA9pty0xJtV6RAEjqs70WVUKmRuflf/6E9/qstWIhEBhHdNJ/QWaBl2MoxIbwy0Ci4xXC55ICbL8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MCC4z8h1YKcopOq2X/MXMjkGHATeQEgslwGBLQY0Edz1tfK00
	JatHX8t5+xULtjGvRGeMJ2i+85p7dqeMhLYUZxlqcG7wmqqLLdGGBoaQ
X-Gm-Gg: AYBFou3xpBdk4Wx3/igysDVwRSD9/8S3QB10L/BBoh0RWi1MCADJDU1FWSck+248VkY
	WuzmzWXen4+VFW/i/7H1oE2DDsIiaNaSD7BY2+CClF3Og+TGT9oHBjJTsjoLUI/ePghvO49bxyE
	V6l4xwuuDlbXeh38ZPAQGafumuyeXEEVZ57AEp0+E410U+ldwYRnVZp0yHDtuU0yXIpuypoZgrR
	oXUi3h226w3H9FRDgoKqDGJKTTCNnqoiJN66ejxZsfhUX8l/e/tlXS3gEq5HndYUjUCMqISloEi
	S/MTDXcfVDFkSOrUsXcqCpl3AVi6jJ+fY6nFJvIGYI/x54FAQa3DPMTBTJR0Ak0YdojYsfdJJyA
	RYw5fFM+z09quOUowsg/eaeE/Q2Kss+21CBtbcsi21hfrlJzUNxqXbzD1MtZHun6plu80I29uoD
	Xeep0FDjgfp6xskkozZ5qK3cU2gd7imy/rblPYx3j7v5xW0zxOj/l4vgebt6ru9wH1lV7QZaRYk
	NfOaE4bdAWJ0D769VIzG9jaiEM3bQzpeu3unWyBtzbQ3QOkZ4caEH1P2Nf1EMKKLKJkXGL0BvgF
	OM3PGaiU890V5O2IwUleifO9j88Cbr14cDsf3PMNZ6U8RrDa
X-Received: by 2002:a05:7022:ea86:b0:160:6a5b:7edf with SMTP id a92af1059eb24-1b39ff1124cmr2107985c88.44.1794145218579;
        Sun, 08 Nov 2026 05:40:18 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5435920c88.13.2026.11.08.05.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:40:16 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: phy: cancel charger work in usb_remove_phy() to avoid use-after-free
Date: Sun,  8 Nov 2026 22:40:01 +0900
Message-ID: <20261108134001.536207-1-hj351016@gmail.com>
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

usb_charger_init() (from usb_add_phy()/usb_add_phy_dev()) initializes
usb_phy->chg_work, which is scheduled from the exported
usb_phy_set_charger_current(), usb_phy_set_charger_state() and the
charger-type detection on VBUS/charger events. Its handler
(usb_phy_notify_charger_work) dereferences the usb_phy (notifier chain,
dev, chg_state). usb_remove_phy() only removes the PHY from the lookup
list and never cancels chg_work, so a work scheduled just before a
provider unbinds can still run after the provider has freed the usb_phy
-- a use-after-free.

Cancel chg_work in usb_remove_phy(), after the PHY is off the list (so no
new work can be queued) and before the caller frees the usb_phy. It is
done outside phy_lock since cancel_work_sync() may sleep.

Fixes: a9081a008f84 ("usb: phy: Add USB charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/phy/phy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b935..caae749 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -731,6 +731,15 @@ void usb_remove_phy(struct usb_phy *x)
 	if (x)
 		list_del(&x->head);
 	spin_unlock_irqrestore(&phy_lock, flags);
+
+	/*
+	 * The charger-notify work, scheduled from usb_phy_set_charger_*()
+	 * and the charger-type detection, dereferences the usb_phy. The PHY
+	 * is now off the lookup list, so no new work can be queued; drain any
+	 * work still pending before the caller frees the usb_phy.
+	 */
+	if (x)
+		cancel_work_sync(&x->chg_work);
 }
 EXPORT_SYMBOL_GPL(usb_remove_phy);
 
-- 
2.43.0

