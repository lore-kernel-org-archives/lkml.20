Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567956;
	b=phwv9BI8aYpq7rtawiLiwRpOLYutBSVnrEBs0840TO3Nr2042o7oCDvJ56OeFP7t90n4
	 cE9qw15D8nhudkIJQ380p8WXShhJPNEkZMkvQTAGnxggi7e8JXeKbED1WKWTtVJYeiiHa
	 926pn6M/zHYfHJ9btvlm+oevx6Apx7jsPlmxEuYCX4iXVKjOX0HvuQzrjD2ur9mDQ4S9d
	 6W1p+wSzeQES9RERBfkGfYNkbGIuiCIZmoBGc3RoYTKB+5x6pCRo//K9NcTN/254GOTFS
	 XUqvkIdlTBtUkJJA/lAY6gEun9D1bWxfxs6Na9y29/wNSGR/tJPrn1gKd4NrXqEkQyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
	b=wX5ySPin/AgLriC+f0SHrf6+cA/tsmN1B3TVf3ljpv9fNUJy2+22KsyIlPOXb+co0Vhx
	 YjKRse+FXzTB09GSdxGA+5OWEjfnpRsix5mprvueOWfZYQajI9CMpEczaYTZi0j0fSGUt
	 Dj/f4Z7lXkFYJz5567rVgl6l4yjCwRF81xlmSq64V8m7K6eumpe60mEn0sshTHx7mOC7x
	 dtK2IbEzxpqs6F0RviiLDsItmvRlvUSfM8dCpgs0bzqgyPOao2brzGmi81p3WBu1WIYVW
	 0UbECVw7vcUqPS8e7TN+dVIpFFGSh4M5aHd4NugkvUm+w7Sumad+yLAvL7H4MpeC3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B960A2614
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810B960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1050169e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567955; x=1795172755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=jo+ONOyCKDe8UX+n1zi00jnNg9W+sqeTQgmGfNxc8ZvZG9lJQrQIxOxdmEH69xpvFc
         qQD2rOGrv2xNeW2DkLhpbBF1D3SgefvWfrLN2fusVXfW3PT7wuHTpbkpbCOQiN1eMTjn
         IoO5c6VmKi/Lw17SHc58MGSL1JJdUWhL7Rn+Z2it220v4DkWlL/96LVdyZCIteof3BfI
         RzAvber7p1RZyS0cuD9zfNr74B0PrH7YWHfrbCfqOFv96Agu8z5yLQyBjXRX2VT++5+6
         mB3glPsueqCs7cQpeu2P1GVFDXTZpTbXXII2NF9gUCP7FwO23Xq4hf42x16FgN7Ke+tI
         Hs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567955; x=1795172755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=XlKhRAOJFsnqGbiCAZG7mWsqdaerJcX0dKnpkcIFvSa3ZX8HHyVk/HP0kV45seod1i
         75X1AfuhHy6OPrnYtqGaYbRgZrMUTU+2TFINJ/5WTzVW89hwD8m37QAACMnGs2CWwIww
         max0OMJC9zhl4S00llSzVR22j46qLMUanyoUCDLW/RIZ1b8q9dTH2VSDFmR55cppzWLB
         iQH0/lIbcT4gWIgvhn1Xaz/y8WtI5EMhIbFWALv2322qRyhzazeI6YLJ+m2nN6dQxc4T
         FtzSs+e4Bzg1fejpGw243SnjqEYqPU2FmGzmSS9LNa7RgyKrYnUOebNNATbSX2Y8E+2L
         wVPw==
X-Forwarded-Encrypted: i=1; AL+hErGey4QHzOscZqqg5Q5uTXg+MaRO9ZLUewUsHxgUzof9jWGanNJqf7EAKgxddCW8y09PUjAWfsH2RxDnk1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tDfHn0vJSqWeiAQzNqpplBpYXTpcWSCNtBe7Cc5BVugtTk7wz
	pONIyUCWadQFsqxox9nbL36ewXVyKoXKkt40C6ay+NIxqpjwA1ky3GdN
X-Gm-Gg: AYBFou3Vhkj9j3Jl4zV1RKFh19uZpUKkFuu9NkEC3j/U+Jd9bSNyHseS/2CrCSjLJWo
	USfKs9+22qKhPjWr7wxgU9880CtVBqJ8g796q82VlYKoMDwlPyyDKCO/UR7/XS/9Hp8BGl4ZjKv
	VGGbNh0c0LWHpLDpQqbYhOuFT2uGD0Atmt8EKuaGnyTB35ixDTwo/sH4oNFWhCOJTRK5lbU/gHx
	zilZ340AqYyO6H4V5ev5kt9FZ8whvxO9DqE7mTAfi4e/gnkir8DQaGyi6R+LYvsglC2pRwwY7YY
	fdyB+pBFipoApOPOEtEg7TnlCU3OLZv7s8LVfpRxC8Nyznd6N9TBhmMq6ZOaJKlphtF0UpZLA2/
	niGx65G4Dzg3hUoWEVGRZmIbtR8wHYuMFVpOMbph6zOUP9QO3RYlEyDhRnabd7QwumF0TzdJ+Ls
	lzZWidSEJjypiSWA8oxIWSUdx2Ctb1+cpTYdsYhNsMSiAkqCLbaRSDix8DsqK2NW5oPrnpsyjRS
	+mwAcNtLZqAhO9ENPfR4qS8sfKyQ/Hgi5XvoEgXW/scmeVYh6uI2XBIytJCFqJl7i2OWomYM5V6
	eh04OoD2tcUwzvmwBngZi4Oerfkr7g7FacQS59RXn1xmk3U=
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id 2adb3069b0e04-5c1709c5b64mr825566e87.39.1794567954595;
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] net: phy: dap8211r: add extended register write helper
Date: Fri, 13 Nov 2026 14:05:44 +0300
Message-ID: <20261113110546.173624-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the phy.

This will be used to write extended registers of the dap8211r.

No functional change.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..4eb50c26397f 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -88,6 +88,32 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ * The caller must hold the MDIO bus lock.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

