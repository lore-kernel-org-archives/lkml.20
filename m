Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653100;
	b=AFt8cb6NmOLNYo0auoeWyol1ccMA04tX1mVxCGMQ6pq9DBUubUmfgI2HBFDz46Dpoycv
	 Fl1Dte+NkR2w4T7FZnVJQeZ9L5BIarsZJ1WTD7mIccYK6keNRh0vm++e0B62WWMhVcf9z
	 oy1A/5C2fbQMY76JyvD70RjQPk1GvOCf5qcZ5jZojWRt544dTWItydoWrmsaSdiEsqMTs
	 QTS3/BGSlfUisEzi9ERl4Oudi9I6xv/RZFo2naTesSo5rw28jko+M9Dp5SrnsJ14l2wGw
	 t6QVs5KyUbkPna9NSt3zaXqXNJXsdELjdsMvlkeD7NrRu+uwpfo9W9oJ60h4EY8tgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
	b=JzRLMaRYUV5HZ8qvo/S5lwpIrUuG8lJ0q8wvv+QUz2KgjjU1vWJ2GEM1FWu8ZmvzWE3b
	 XHk12HkPZ5s4w9NVxossvkcHbocN579BVdv47RsPxFAcoGuSRrrTbzZ4nrhOkK20qRukB
	 VXO7S3SEFi8Ic33Z8e07XQQxRC0SlPcNrESySFfgNPtRJ1nAqloyrQDMLHExdFZ8UDARA
	 3TXIT9ZKHEqqt8g/I/+/KvFrbPvtum4jPm78nLeXOlHhSN8gPMrLYNBthBZaPQ3vtqhmH
	 ChFpslSrvwk/DNMd5xyGkWGomYFv0M2ObRm7pmJk/fbSR3/3GTabWr/UetfR0xTfnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B0606B954
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44B0606B954
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso3767665e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=Hh4jtnEeY3Rr0KON++uTGejBqMlfxJn3gIiWmWlmp/w1Y8KYpSHDD8ckECMiBkpAHx
         l3XtEN1sOm6CYFaZx/XwPB/JEaH+hPLA+rj8M7Ac9fu5Aiy3/4/Nx3aMPK6uUSX7cpho
         uWC5hS3BNMladdq7gEDU4eel1iBe0h9W0umalPVdwRARqShKscKh1S//LfyOUAWfKRTL
         qT0sNUi+Tr4zgBnDq1l8aiu+55uc9dBYTBRyu9OrC3BhZCpJu9PkDKyXwnpeTI1PvFAS
         HnA+xYJDeOjnmRvcNIFboFt9FkZHhQa3NDakZzfpIV9ifWviN7L9Z2dEaWReMr/qZW+S
         h72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=U/11ZaOLhy66l/JxJ5I9zl9pHw+9zpJeC0vpvl7OqSxvqZ75xZKJ6GgRhAe0ExXGre
         btNKKVxJl2PL15IeQ0nrxioyHhS5naMwILbmpc/ybRP+zBIJDtZnpjjnCsjd6zKKE75f
         sx5iSi7RdEeujBLrChUSd+wgGwhQVpayXZ6J/e0200k2u4ucAKVx2nXl2emhLtXx5X1O
         qjXWc4TfpDfqtxop5M/SRDKCcoQezxA/Gv3Xd8LtkNh8Grl0Ls04GgXNaLQgzNigDCrU
         nXvPQ1NKLWyTab1PLRnE1u24/1zapi4rfuTxHXLkUMcsLHLmbDQ/43P/21cBg8IY6iHB
         uzpw==
X-Forwarded-Encrypted: i=1; AL+hErHrXKEwcSDTy5DL4xM7vX9rML3B8I2ykXH13UaeODQbyqbOoVqfVWl1Amwy0C865KV2fYYAZjHJ9UGCEK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wQ4unc54bCDsej2lL6AqdQ0UqQKCJTi8LpfvzKVr4c7L11yVm
	h6Y/9jbd6CVLSoj7Q4tfWiTKlWu1RPL+Vr6cbJvzRzVf4QibuOyPPHbo
X-Gm-Gg: AYBFou1A82Y6VivG1ev63RF1jclljfQIRjXx4dZhkuWXpWH1FHWsCvZ91MM0NzU84KY
	x1KuGTLLqH56ftlW+fO911a5tC+mt+tZRp/3WS6ARHEHuVAvJD5lfHHfqgM6Rs2+ZFEAgTv7oeo
	YTQStiRfcZVkEVBXznF6gAjbIjdNxlLUtUNjjunFIrHOZVpMxTK2uoQfrNmnoxmY+fsKvYNd9za
	gF9vYDbKq62oYnEZm1QA/h8V+ittP/4+zVrTis+FM3igzS8dLTcAfh/E/ATiDvd1liDwhZ4fdmZ
	C5qfB6dx5UZKkGj2amNXW+Xd7qRp/ZwrzNaCVBCezLMhn1kVacS7xbDHLKbbc5I7nqGg25P+IJ1
	O0jF8QOkdSIqNgOfPwsa3jEOSXQWrAlVZ+GnpWrYw8yvNl6yT97EAjJSDgdRnsZwqbRHJT7nOLU
	7zcj2Pqt49GpYocCojQcUN4vMGI/HzLfsPyMv//83H01T2WEwFBSR9w1fTckQoh9abuHZ7nS0e5
	zttXHTaM0gS7N3N5ii2ZvSL8NlkX6JqpdI/V5KveI45/76/FnKvSkXl/nOmP/nylsvfK3DeacWF
	LqK/Ua8GayDxnYAQ8hSTA9/Y33ksE8qOV4ho0uOLBmOuxxLAM6SGdFen/2+QpJV8+8rzZYa7aFo
	NCCVQ/MVoSBWrQ0wlu32YqzLnVbZDUVUGbg==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0

