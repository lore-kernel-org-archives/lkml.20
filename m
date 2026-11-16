Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846889;
	b=3ONztEKz5HTRlM1VjZmtnuxD4Cdm0NPfuZvZvRcuMbIFoCx59mQGMzGHnlRCHc1p/8Hz
	 ZhlsfKHMsy0MPs2TRVrnYX7y+4c8ihAcIp+P3O2USQiMPxJRKKqFa1npN6eAcvYHSBA7T
	 J8BRgG3wrz81wCLqqDTeoPf4ccut6515bqspqyoaU8XrR8jXUMA1YihNonTvCU1NQGv6C
	 TwDq02m4jq7Muj51T9KiO4BW1QHEbgrU26xuLRL4XuWlaok+Ftb4aOh5Hsfp6jP2xdT9k
	 SxQuqoJkcNxBPOFDX9pDma2yPKf8QHRJyDZg85a7PmW6H4qK+2PAOtBA+hZjckCakaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=tsGpas9LqjfjRO0QqJmNGNnoJE/n+UW+TNoo3Fp94rLJoPIqJEJdXL1vIIzc3Zxu2vls
	 8ePb5kkULQPRpsLCjkZvyyEEaqCDRYhD6oS3HFQzPviJQB0+tgx5oRMO++rctBokbxtnj
	 u/wD+ZT1nnPKW7Aj+oV98fxQMfLOR6+Zv1yehKb4bG00CQkHXXj5cvCCtYfuvxFukEsOC
	 l1bVmxniz/pOC1sikfdeNYZTPeS9WrvlNefYG5/Ffjzma9Jc8uXJCye6JUwpa/XHGuCyN
	 +bmOToFlGNulgd6vsTVb31b9K8tvlpB+NyLdjxmHpPEj03+7lllRxptet1blln2wMrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AD606A8A9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52AD606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so12392025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846887; x=1795451687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=khscm5EO2wQ0GmDlIq/x0ONqH6COf/dtb0YR2P1Sz/VD/nyinRdmqw2SvZ4pxGR9bW
         voHoX+GHV2/G5gnrUps/Yt47XjudwHHE1jqjOAwkLZKhFNVavsv0aUjrTvp2S5M3NokH
         PUWiJjSc4HWDZVS4o/vDHG7qRLeBYVNkelMp/moV9fNJl42oVnDvQYB3vlJdqS8hbHpq
         L3z7/8KyTjMascYH8YhvvXubaDS0AM9CN+uZT8lyuq+83xgNg4zi3M5mmWId8pstYJ0H
         x1tS60tDOIZP4viUvemVb1aHqTQk/zvgnELQk0aDt4OR3S/+FarUteduUNKtsdOPeUg4
         i3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846887; x=1795451687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=dAAFPo9FJQLwJctmiwhPKF3shXCGqW1LpDBP9O3PZ+AOTcODAh7pFeXu9Rim+ZoImT
         bJyA5u91y5VUtDr2zOvjUfYu+4OFsGOrr9GpzTZ0906gE8lmw6DvK3nD3pDbeW6yRNbP
         70LJ02vp/2lx+9G1IvB5+I1IpJD4rM/2e8ourKIgnT37v8DUsLuwtcHusRvZ3YIeBdVq
         uF8SH6hg0x5LavGKtoL/CHG1tn8RABi5IhHpzRrlX+uZQzpz+mA2QrGINQNJe2rL3CW6
         vdQg9lS8hbDMTqdvvhZ5H6aiaXL1FiWTpqhROeFlLyzziNiOK9lGPOIVdQd4uCTqlyvi
         Bnvw==
X-Forwarded-Encrypted: i=1; AL+hErEX5GjfE+glNGDh41ZDKq04KxALv6td5UdlNAR+hPOirDLZZil0iQFy5mcjodptAZk5Pl+OdC67XK08+4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S0wRl1tCU17zlRovP8sLOF9v486rVd6d4CXaoMgPdLHrFxm64
	V+npqY2/0kVUvypb9q14KfEsV6FaR5jbunz+KkmzRpfXIieRmPS6duhm
X-Gm-Gg: AYBFou2a180Igv6kiE2v06OKAKTsxvDnl2yI/6QolF9UkQsOp/6qIzyZK7ymQoG/TnZ
	u+z1u6LlfJVcx2NhhmYJC6umCwJNy2Q2SZCQznz6fTmfLYGjJTst2Ij2//0jEpOLNeBJxuOROWS
	ODRJDhToO9WlP+iyZNeJJl8iDzlyS+7Q/u6UFLCDU28854x8836egUMXXIcPaldkdtoICOV/Rrv
	2/VF0bSruySqyZUUcEd/C1vf0LK/WlhnlSGjwLaAvjuALmXlKs3p/vUbadfSCqkm5IZ3Nphh5S4
	dEYMzmlcKzxwkZgyDYPvmut8KJV9tTIF2ImcpOKrPTrlWsa5WnQ/BkSONwCfd/Oss4GKEN/fvhD
	CT/gKiadC5DFYVNaSL/zYuMSSCeJ1dHwTPFxY1UN8M+FIWNDFPWSiUfpW1RpcPyxbG6w2DlSDCe
	UB91Np/FBr33qrKKBlSxKdRccFRNr1xSHKv65uZH/Gb2BDt+eOiCWVxAnBPr9sHLrKhySXPzTyr
	tI8g+zqWylhQspr/25z+7hHR+xKjLlW/AsNkcUkPOlkasbe9A9llmy18VNBoqTmJ5E6VygMo51O
	GyGcbsCDOp0k+2A30S1pS7e4t1g4em5XGHfrAU1r4kKiCtYg1OrzhZ84YWj/1Mv+hfo/5iPbjiq
	DiJQhvy/BF98pMxuB6H4k/dcHHR1+fvxHDA==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr236465685e9.25.1794846887115;
        Mon, 16 Nov 2026 08:34:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:46 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 16 Nov 2026 17:33:56 +0100
Message-ID: <20261116163412.551438-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

