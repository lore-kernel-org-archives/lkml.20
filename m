Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672643E9C18
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548596; cv=none; b=hjOz84FEzgisyWC16a9WCBNoH4LSlAUR7XQhaXSdmnCpag0LgpZEZb7QbXjgMK4ADFNwXs47sdejrp7sFRYQI7gUuizNIAxKPyL1Sn3rjjE1QgpwiFnC1stDeOp33AzrFXepNMv3Lbz53Dv9QWOoPaypdKX7FvnfkQVKWjPDEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548596; c=relaxed/simple;
	bh=g+9YyrCCqwkQj25pBhc80E3Us3WQgU4LquXHfZWmm68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxh1chxfxz5dOXRSwG0xP6lyB8uB4+kcEybOGWHpUePS2rEj6qsqc5DJHm7ZQOsFdKztx4k3yqM5e2sMB5NW/6nvODA/TM9pOcXj5yw1A5moZVQq796cyoqiZPUwKGumoHGgCvkgCsTMIVXHO/772ErOLyITUOWr23Zs00gC5EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=SFNrcwsI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="SFNrcwsI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10927665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548590; x=1789153390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj3tsvbtNJDWZnFH5pUKMKwa2zoY5MXACQtNrJLPngI=;
        b=SFNrcwsIy1g7mN+pUwAi1aZAClIb7TZzx20jZyB6X8DR1SoBcTtGPc9dTBqiGx4N47
         92/UGLYM4+sEWDBtLzKuJidIcMBBrc2D/e8QHkgxJpJ+z4agD2Rue8alZ8a1j3eKDErc
         paYRvTzOUIWMAj0Qkvfy7GdhbMeLUPjZFTeMGqKAtS8G2ty7L5tF/VynaEMJI41CzFt9
         Nfvo+7ma0SEAdYZBtGjZ24ZEAeEMpq3mSht1OocPg52EnZFs4tjgQEmA6ofAMNhW454w
         btePYf77B0l2OZhJYgUgQVtE3vMJ2SDq5Hl7XqAIjqZCw+wVcWimsY8WZvUkMIL0XgVr
         qunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548590; x=1789153390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj3tsvbtNJDWZnFH5pUKMKwa2zoY5MXACQtNrJLPngI=;
        b=qB8pwqpD7gAsVRpHm38iP/sc+ws3gBBWiCa2HImxN9sVmUC9e3DTwJ/aH+t3mXEhMZ
         f1vq8OJv/HQ4A/WP+kO981csnHkUNeLYEQ2jFU1FkmITN5s6RAOTShFN7+0kn9h0SjLs
         I8NpbjxBmT2tbuQMb7J/uZWNpDzz6oAawWcg5OA+ZT8eez7u0D1u5d7XhOIs2eQ7VqdB
         s4iCPAptSUFNVeB9JAKekWEnHSCUAxAtMF888/PMoCg+ATFOzJveZ4693OHA8f0OkgyQ
         5NqzsQEfWFueAvZ9G1qldjTLogh0gqW1MaQOxuEigwJSKvBGk3ni9wOY03wMbYyKgpAO
         GL4A==
X-Forwarded-Encrypted: i=1; AKwUvByeDNeE7YC/d5iSUeoMSi4ayi0oio1gBcsAWYK3TRdyUgPJ74vmM6d/m3fGAIoda/f0GM8zW8kq4b/aqWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kmUbDX9M0AzBPPdoTE82RgG28oG86bdBFGPDxuVH1MSHGhko+i
	y/UvYeBAU8jdbver44CSgZuEOTl+KEbaJBZ6s6PoSlXiY8XJjb8K9LKISnLPS/b4ecc=
X-Gm-Gg: AYBFou3fxhWbiT7vH7K3Vxd25bgUm+QnUWKbx9vTeLV5mwT2IskNbd4YxJsd2SdrDAc
	2vOcyunx2GyHeb+OhlQMSHjFPFdCWTVCsDRS9HDCaPY3fvJ9Se/eXj6QtOkWcwrhb19OcHJ7Vyh
	ZGbBVIdXDna38YdEGRueAfIAXMJP6EQhIIWF9aGz6Oop2KwEfpOEANC5SUKPARJoCNapiMYF4Px
	ZPzkihQ133qJp5VVEwapOQ0Q/Idv2msfJuOnptKc0ibZdvjg0KzbBq5A+/+iBzUKBAjuF39DbVf
	FoeiJnhzYdurJ7uMT0Gwec89UgZ0fTmK3kTDOwUeDpGFNpxc5NLOGEkCOCQsAt1jO6bcBu8RUmh
	tPe7vlxRQ6hdh5S3NlYzB/S/84U6CbN9np8PHJ9mFN2waX96oIIWzCjbBngNvTfmiCp0GsHkFIv
	7z3j1CDBefhPnFiqOhVOsppyv6CZ86ZFnOkFeVmWA=
X-Received: by 2002:a05:600d:864a:10b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49cfc8960ccmr41262475e9.5.1788548590621;
        Fri, 04 Sep 2026 12:03:10 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:10 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 03/10] net: phy: add mdiodev_lock() and mdiodev_unlock()
Date: Fri,  4 Sep 2026 19:02:57 +0000
Message-ID: <c634c01d84dae0745027c7264b59efac992f12bf.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __mdiodev_* accessors require the caller to hold the MDIO bus
lock, but the wrappers that take it, phy_lock_mdio_bus() and
phy_unlock_mdio_bus(), need a phy_device. A driver bound to a plain
MDIO device has none, and must reach into mdiodev->bus->mdio_lock
itself.

They sit in phy.h beside those wrappers because struct mii_bus is
defined here, not in mdio.h where the accessors live.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 include/linux/phy.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1c..8c10c8ae21b1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2284,6 +2284,16 @@ static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
 
+static inline void mdiodev_lock(struct mdio_device *mdiodev)
+{
+	mutex_lock(&mdiodev->bus->mdio_lock);
+}
+
+static inline void mdiodev_unlock(struct mdio_device *mdiodev)
+{
+	mutex_unlock(&mdiodev->bus->mdio_lock);
+}
+
 void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 	__printf(2, 3);
 char *phy_attached_info_irq(struct phy_device *phydev)
-- 
2.53.0

