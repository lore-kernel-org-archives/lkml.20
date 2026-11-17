Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919234;
	b=5aysbHR/qir87XaWqdWo5c57VLtl2zAU4ay3U/hT2bg4LdCTg4adqGc+e9NwYAajbZ3F
	 kM+ZJwhdSvfAXtIxymAOTmQqmfQVD/G3Z0NMf0/Bz8kIGBAk47IMfM/bwjI2D3q7WU5ei
	 FbogDMsUrx0tFaCo4zGpHixTLCz5/FGV70r0jrrTmCzIXwby6+zVP12XGn9l5gmIWLTI9
	 3IXy40/qtDFxqOZo0IPoLD7gFZ8AAsGiPCOZhiOr+J7CMYtZFDH0i0pEGHhNvu8cUGm9t
	 ePSIgiMHtL6fCXzNBq5ZjlCNjmRGa1hgaUwbfHNM5RmzLTPevR4pr8EPrKtbIrb82xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=xxtiHZQ2M2UkKgt1pujR5bea8yAzFv6f/NXR1CsLkIqVfjpnJ9JY6rG0lx3Nq874qwUq
	 bvTjyB5fG4oPVjzC18Y8RJiX1BlL5ifyoqf77L85WUxyajdmUr3jRQU6jdGECfwPJCkLF
	 um2A79ecLWaX0D8bdjhEHUdGl0qCcX9ZkA0dcBrlrVpq1Op2NSgQ0tVTteZSSPPIQ5R+h
	 OFSPaazcEl/rIhfxwHgtAjMIOQ454sE6f9GdOW4OHJ9f7F1tL670Ce5ZnOtpQA70n9bic
	 6WAeCmHpp0YTXbJfuVRPbpC8rGovTrrEz+nK9loaZ+rb0L98DaO39/x/M554s7h7pXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B952606A8AE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B952606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so30990195e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919233; x=1795524033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=D+T+Ton5B+ZaF0fbiHnvyY2YntjQx5xv4oo3SRyis9tE9qZYw01uSQxYEk6eBzqhzy
         cvmfcut5vgU5INUgRiH5RWTEHzaaN/BZpoZOJy6AnGwUHp/muijCEb7AEyZdrRWDQz14
         QBkkqwLVyesjQ9KJyCsvkx/EfcM2DZvmPm59Wf9+62sa0lUTIUS4k0NM6y527mu4E1n5
         9pwJTSrCyHZSjzCtEfFHrB6ITA4MDiQNgU6fD+pIbUXh13IswYSZqJmtnJeVUnQw9Az7
         vGsBeSnOJ/5f31saXQSFTzuF9xCrGqsFPaYo5s8aV6bERRNt/SPETP2xP4W8R5xvd3Vs
         6iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919233; x=1795524033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=eWfxBUzc9OUmwLWf8K2ZWds4mnKVSQEvtp08qmku4j3eFwFKTdIeltTfn6Y4seoiZy
         Ve9eAm0xmpgydbhnSef6OyP7sjs3elZiQWh1F1yCak1pgNXqpPRHx8WJzqnSm60SV2vP
         aIgcCZTnuRlibgyUZxwsWsXl0OUaw1hKxfZ/fshgDciUO86Pg19YTLlDhrEi1VfjSs4/
         eYkGZRthJ50gI6guEdv3NNnzXfI0uofUayBFLSQysIVPfYVreiPVnWih9zCLUieNFfXB
         Fgk7whougvOvSUqC7F2vA1tDqnVopvPbHuvWL+k3BGIyq30WA0cO3hvKdK4Kyrqd3vJD
         uNLg==
X-Forwarded-Encrypted: i=1; AL+hErGenYsLhg5Cyk8KY7G04cOc/o3HWXJ4vBz5N8VSSJ8ejUaD6R5RC4lF60Zcx5F65GvUjGMwtdqD7IxsISs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V6zGo9FR6d6H8w4EDFBABQYBkvqdLUOF0XnPIuaxgBeaWdReU
	mhANMuckipHd6YmMosqbzdUR8Iz5mwR/5xHR1iyiFxKykAhQMCQht7kJ
X-Gm-Gg: AYBFou0XQHaMnlXugHXqwSuA5EWLZWroJaqZ8rnnffRpL9d3aJiX/5qdCxme06xDPQj
	tUbQTGOmBESsV05MFocLqjLagzQnr22zlk7+2rHDJw1I2L+AZtGjabE/3DLYVSMF0sRHajuxJGC
	njug6l6oDb+CLyGskkWYp8i5P7DsZkb8N0BV8Ce+GOSNEjsYRWfN+O3oXkSOIYEd2B2FjZ6X2sF
	2M7MHkoBSCJQ8YFZg8jTTT/L5gX+J4pA2zPOX+Ye4yxEERRK5afUry5EYJT6MFAqVaDlgNR1O8f
	l1mbfmUbVImuoALdZHW0TDWarNFxxlP6NP3OnCAlpXPZglDKusXjw+7A9dTDL4ODdBn/ZsyDjZk
	znu7sKLWsgRRK4bPfal9GePrG5p258TuNJVefftOiql8dnntO6E/uHxG35O2+asR4bLx+V+TMqp
	pr2hu5HO2UNGajl6LFsGrA7sYzqKkN90ZOdiVay2s9hnWE/1MtsirEyi/h3anCNb6UAbsYyOUrJ
	c5er1zOrx9aZzJxVHtbHyK549kW5c42+vEQmKRqFx5U2O48h52I0LR3gAUOir49GOSgMITxcURi
	CshFtCtXe5FWBPjNRO75W5G381F+l72ZvIPs8vhn/wGLZMcr4lmPp0wdxF8v/FZsHIuMGQpufZD
	X5gPj6kpfTrEdfaUgv3MwALKXKtq3t8Bp8w==
X-Received: by 2002:a05:600c:3b2a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb735ad6dbmr119130585e9.23.1794919232533;
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 17 Nov 2026 13:39:52 +0100
Message-ID: <20261117123956.11981-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

