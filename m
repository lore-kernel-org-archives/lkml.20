Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC2367295
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808795; cv=none; b=oHZiFLdbYBOYfKqk33Ldly55tYG3V4xtphyRBe0Lw+uHYx81civyBOHh/SygtK/ZwnBGIGflZ464xMfo947KgpmiW5HjQkiMbgOF1QyYpJJgt27VG7Q4CzFEPC05xkxfrPNFIjqq5OVt2md+watwthGLTQrHsB2UxbF5plnVdOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808795; c=relaxed/simple;
	bh=kKsh8G02HdVpc2N26b3iNoXlx79rQU6xtvF8QVQccEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDAz8PEgIOmLmh+091nCpOiLqUB4kAxTgk6RRwBi7O5sOvwuDDHPdVMef90iZh71dsKERP+QHH2IGZwAGhRIKR92JMdQzhIp32RA58Q+27FFM2l7WDLObJ8fxUc5S+mMA2hH15Sw4C/RAkYQ6fXvEUllxNu438GCTh8AhaEwYlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QklsIe0/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QklsIe0/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso34341705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808792; x=1789413592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/o46YaC7pYeVZPsZJcV4phXeXLrFAX/x8xzi7YXaI4=;
        b=QklsIe0/OapVD97Bf92t/2A6sKwPm3bOZa4FJT4h07/A8lqI5DRcxsEwOCetwsjlLZ
         hzUXd0ziQiSnHTb1GnCPPkpsrMNWgB31txX8J3gLX2vwnNR3l8HE3LQ/d6WYW+jahDHZ
         Dsg2wPKjiyNFugocDYFqhhequA2c5yzUiAExVj6MRjVqb8dgE6yLR9YcvoihZdjGbvjU
         RJsB6rShHkzwC+ePYcdSrf8WIFelgqJlYXcxD/RbHSHQk+h6aGtc8BDx6bXYIJDR4hcJ
         KBIzjYD5qQvtXWvNWnPYGxHap/+VzZBeXwHH2rhbTGP+P+mh7EOMxsDYQ06T13E3zV2r
         4IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808792; x=1789413592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/o46YaC7pYeVZPsZJcV4phXeXLrFAX/x8xzi7YXaI4=;
        b=PU021kjQvBEBpN3kpGiTLq8px2bkrl4C4jCwdaWhFw0+R6N1kLT77g7vDXv+B3jBqs
         0p/XFAnIBDSNcwHldE8NEJI5S6r/Ey57Iq4pk9gw0tY4qs9h/sWwzit4+fogFbkka5+B
         tX8w/FjkpKwQthKf8DKN8yLnZCC76tJEE4uuL4LQiyCIZxck+KIrNmyEzJPkJR2Ykh7J
         9D9szPAU/42z9i/hKf+NItME9qD2zPHoB4O5zeNBiHKVqoqvJm9Wj9hjc0UzpDAHSKLZ
         wpIREAcAAf/hh1WcCkkJM6Os6is3ZqISMOfc+TWkYj1tFb8SX1R661+thrJyWwcuQGCR
         rMdA==
X-Forwarded-Encrypted: i=1; AKwUvBxIZkkP52Gjgs9JO6St/BsVo8I2jbtXwuPwKjijxeDd/fZ0fHYeN4YrFpQE3+0MIf+ajQfFDu/DBgF69hE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpaxL6hRJsD2OtvnhAi4QuY4vkYZtKMlY1ukAN+ygEorBcyuqz
	knQnFiEw0a01y1zBDH8OXEsZQ5KHtreV/Hv+8dOq02tZyqFTDv59i2DI
X-Gm-Gg: AYBFou0EUI0vfZrUA4hMdvWyHn38evmc3y7ZIprkpbJ8V05FdllHhvcKfOvQV/ua0mc
	YGUAwNLl7JoNJoIrBPcaVJJgL65rMMLeVKqvFSk6Lt91QlGGlA2bS30DwOpkd4l6cNrYyo7kODc
	nVNyr3MiLY3hcKtgetXP+Su1I1N6xuE4n5JXazm0w82+swVELn1YlLqSMIUbuRLd0P3gYTbkkZM
	ifXe5fFgXYPZh/T77qtsLozAe0xi5mzaxFfa345+N4EkNXVBd6Ha5ckCQ/x0OBo+HwhQe/Vsf6Y
	s5ULk1fAQP0WGKqFgO5T9dPi9v60fRZ1SFTIR5fqnXw620Xnw4hpRtmeF2+JB0uxol8HmR7toFt
	Vz4I1XzgPdp0HnGvNx9QcHJ5R98zZFz707QEKHXiX4lurLN/YVTtU+q8nIN5adQ8WrTYNsX3Dg2
	lgrkQaQldfsqSPztmRPph5It5LIxLQ+SPt72THxcRQSzH1VvMMRNrJPnLHIt3ncsKFCq9QoQEnW
	8h9gWB8V0l57d+RHRfQljB4XdivJA4ThAHDEDa6
X-Received: by 2002:a05:600c:4685:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49cf7f32214mr252352075e9.0.1788808792027;
        Mon, 07 Sep 2026 12:19:52 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs692038.centertel.pl. [5.184.246.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm231242835e9.0.2026.09.07.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:19:51 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Alvarado <contact@c127.dev>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH net] net: dsa: realtek: rtl8365mb: let the SerDes PLL settle after the data-path reset
Date: Mon,  7 Sep 2026 21:19:45 +0200
Message-ID: <20260907191945.806751-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vendor DW8051 firmware waits ~98 ms after the BMCR data-path reset
(constant SGMII_TIMEOUT_98MS in Sgmii_Init[]) before any further SerDes
register access, giving the SerDes PLL and analog front-end time to
settle. Without the wait the SGMII link on the RTL8367S can come up
half-alive on cold boot: carrier up and RX passing traffic, TX
permanently dead (measured on a TP-Link Archer AX55 v1, IPQ5018).

Fixes: 0b577e2fe06c ("net: dsa: realtek: rtl8365mb: add SGMII support for RTL8367S")
Suggested-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -1408,6 +1408,14 @@ static int rtl8365mb_pcs_config(struct p
 	if (ret)
 		return ret;
 
+	/* The vendor DW8051 firmware waits ~98 ms after the data-path reset
+	 * (SGMII_TIMEOUT_98MS in Sgmii_Init[]) for the SerDes PLL and analog
+	 * front-end to settle before any further SerDes register access.
+	 * Without the wait the link can come up half-alive on cold boot:
+	 * carrier and RX fine, TX permanently dead.
+	 */
+	msleep(98);
+
 	/* Keep SGMII in-band autonegotiation disabled: the link parameters are
 	 * forced from rtl8365mb_pcs_link_up() instead.
 	 */
