Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539474;
	b=jsHuP1XLnnMwSaC11IoNFt5YYCe4yYF08ahdJpwN4i+ofZCfsy1L3hDhVKNIYdaeGNXw
	 uaWujJ67FhhXMBvYgWo4KAs0SfZbtYT6Gwh8VDFLhBfVw1KFWQHldzibmcfL5IsN88Pcp
	 geAff6aT5lAYHjeUxDIQgqecSkz+fFl+GXohGlUtjB44IIrWg6jHqAd6ccfPnaQkbTavI
	 5inSIPx28XiLcof6ZoPU4JwaHnteoV6+KlqvFvOXB4ocU6MvZ3LjN7PBULA6viIFcpngs
	 KayHccoejMdf7KeHeVJGvaEbFY6nANzS78jXYlEmN7/NlDp7VdNRpx1j+CAPZpFNnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ucoGans+Z6/DkY4UTOeYgSsSSQakdWd0/LydR6karMw=;
	b=B9pg6jeZbSH66ROpntWl6trilYW/0RU3ccoGnuonI39hWJh66fh4X45fEMCdr/cam1a1
	 znyjblN+A68bEcxOn5+68gXw45FEJeeQ3eb/FFAJyLESQBP7q9xNqEUOgYIDEft8qa+ao
	 qQBIT1K6I+POdGPacXtdG1XNodnmmbB4cH94CcHys5bUmMrkeVRQF0Q0tzozlv5FhoB85
	 MLtHUmzAJC/flOAM4wo0dNPL+JWqZCE1Ln8pZunhDqiVZWJO2l2aDzYKac1R8euHxX25m
	 xyImkzdBkUW0OgcAqoPn22Tw99VQZ5a1DS3XCCcbIcK6mTrh69Y8pSFzZ1OC6qjc6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kA2+fE1b;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EE8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kA2+fE1b
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d1da913so104509f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539473; x=1793144273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucoGans+Z6/DkY4UTOeYgSsSSQakdWd0/LydR6karMw=;
        b=kA2+fE1b/tPF3YnsCgW3qYVaw/PEioEsGS4BBM8os99u7hiSVu8SCUJG/2vsOvmbY2
         jT4DJs76ooKb3pTUlY8hIINkrtcEt/iK1or1IiPfrpxkaTkcXKBgZkmnvMIIlXMO1TD6
         iQvULmHA05BA6M4D+SQSzzgBTTOTiAF8LVR0yWXC1D22hvxtaStReWxn/slV0xNx/w4u
         tYBFqRAdfahspg/DoU68/3wuJkhXmTw2+DThiDMsDmLvaN/A3yuYDzYmIm/HMVzXCf60
         pncMFfoVwDznSeYpl66IEYBCXCPj2rGUIN3fsAZ463uuYZibe7Fsk4m4xV66UgZkJ4Z/
         U7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539473; x=1793144273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucoGans+Z6/DkY4UTOeYgSsSSQakdWd0/LydR6karMw=;
        b=fahK4639h2mHHObl/t/DpQYER/JYUjW38mH4L6363uxUtB4BT+Bir1/PSl7YJOAMgt
         M6TuLllLMoslyuH+qzwfC2O7y76M2jp3pA9nBe+QQEOo44Y6FYEn+ouS1OAUErGtfbb9
         OPXfRYv4yB4zQXPBGKzZeILcLfCERcFvZBT/A4upG6vZ/d/JEZ5oaoYQnLhlBQxN2LkP
         nb4WlOaRp/RgU1QnPbfjeGNueJ7kDapD8B1kvms2gHyKmny/crrgO3DW0FGb2rauGzzY
         eiutvpRikiJ44Vr/RKOVx9FDz5NdZ72BlIYcPBRL5j8wPh27z25c5D9TCrMoS13GGyc6
         XwBg==
X-Forwarded-Encrypted: i=1; AKwUvBwByhtPqHVPbm94lSkAUFGoi9G9q+qpSA50Q7xivvGrEoppYy6tBkAsuiSSNJSN+QKmio2coDeF0IWbQlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRpsT3uoOkF4LtqA7jr2xE5ar+QHnekGJMoO6FVcAiXI9SZkty
	+9MDADamS16j+lCFhbFcO6CgfjftDzoquD3SWjkSNAdbXE2Mwbbzjtc=
X-Gm-Gg: AYBFou3wzQvLl8qS7UicnfRGzvgqqupAYyVXspYwaEpC34yMQom0PuWZGCs7GfkZsBb
	5h/tfUpwA9cx3GdCEDfuPf4C20R9v6Ifn8zA7hhaaRF8gIfVDzS2LNERF4RJTsl29ocYpBZMBpd
	2uo2npVMK/zKfmcveuYk+z1tZzzPV1UPRBCc7Wc8UN7APSQkp59SwCbFCyjJm/sZE0gjiSeWnxH
	Re+EL9NMtq5bcVwSVQvc1PNyhuvnkuD8rPk4FaJzcB7AGpjmRiAQsTTBxxIlhpeuv8dLyWmw9nL
	IgbRmDROWG+z9PEndY7c7KwsYxXatBBE4s5BG5rUuh+HzsDHaOFBW/Q1ri+GvX/d4+7RyBtK2Yz
	+WPLiw9S4iTDQI+me2WHyXStkgvuYoYlCJNR2n8El5rvBJhSg+Z7Or8/N24gBC+QTmLWMOwtqLo
	4RP1uYBBix2gi4bmSDU2P7l2zsOl41oo7148jOD6WIadni9m3KkQbFDpK4W4ONyougVVfLYCKS4
	/lwZtKsnlqGLdeGheIFWAtMWEaaHl90b/EgkeuUe1mR
X-Received: by 2002:a05:6000:4013:b0:48c:58b9:f17c with SMTP id ffacd0b85a97d-48e1e7b672dmr8287971f8f.12.1792539472559;
        Tue, 20 Oct 2026 16:37:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8109:9d9f:2700:ddfd:9840:a7b7:c1d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258426f4sm1532763f8f.54.2026.10.20.16.37.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 16:37:52 -0700 (PDT)
Sender: Akshay Ubale <akshayubale.dev@gmail.com>
From: Akshay Ubale <akshay.ubale001@gmail.com>
To: netdev@vger.kernel.org
Cc: Akshay Ubale <akshay.ubale001@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Kees Cook <kees@kernel.org>,
	Matheos Worku <matheos.worku@sun.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] niu: bounds-check phy-type and model VPD strings
Date: Wed, 21 Oct 2026 01:30:07 +0200
Message-ID: <20261020233007.71945-1-akshay.ubale001@gmail.com>
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

niu_get_of_props() copies the "phy-type" and "model" device-tree
properties into fixed-size np->vpd buffers with strcpy(), which does
not check the property length.

Use the length reported by of_get_property() to reject values that do
not fit, and copy with strscpy() so the destination is always
NUL-terminated.

Fixes: a3138df9f20e ("[NIU]: Add Sun Neptune ethernet driver.")
Fixes: f9af857489cc ("niu: Determine the # of ports from the card's VPD data")
Signed-off-by: Akshay Ubale <akshay.ubale001@gmail.com>
---
 drivers/net/ethernet/sun/niu.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 54dd7281191d..fab6af105df2 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -9260,7 +9260,7 @@ static int niu_get_of_props(struct niu *np)
 	else
 		dp = pci_device_to_OF_node(np->pdev);
 
-	phy_type = of_get_property(dp, "phy-type", NULL);
+	phy_type = of_get_property(dp, "phy-type", &prop_len);
 	if (!phy_type) {
 		netdev_err(dev, "%pOF: OF node lacks phy-type property\n", dp);
 		return -EINVAL;
@@ -9269,7 +9269,12 @@ static int niu_get_of_props(struct niu *np)
 	if (!strcmp(phy_type, "none"))
 		return -ENODEV;
 
-	strcpy(np->vpd.phy_type, phy_type);
+	if (prop_len > sizeof(np->vpd.phy_type)) {
+		netdev_err(dev, "%pOF: phy-type property too long (%d)\n",
+			   dp, prop_len);
+		return -EINVAL;
+	}
+	strscpy(np->vpd.phy_type, phy_type, sizeof(np->vpd.phy_type));
 
 	if (niu_phy_type_prop_decode(np, np->vpd.phy_type)) {
 		netdev_err(dev, "%pOF: Illegal phy string [%s]\n",
@@ -9294,10 +9299,15 @@ static int niu_get_of_props(struct niu *np)
 		return -EINVAL;
 	}
 
-	model = of_get_property(dp, "model", NULL);
-
-	if (model)
-		strcpy(np->vpd.model, model);
+	model = of_get_property(dp, "model", &prop_len);
+	if (model) {
+		if (prop_len > sizeof(np->vpd.model)) {
+			netdev_err(dev, "%pOF: model property too long (%d)\n",
+				   dp, prop_len);
+			return -EINVAL;
+		}
+		strscpy(np->vpd.model, model, sizeof(np->vpd.model));
+	}
 
 	if (of_property_read_bool(dp, "hot-swappable-phy")) {
 		np->flags |= (NIU_FLAGS_10G | NIU_FLAGS_FIBER |
-- 
2.53.0

