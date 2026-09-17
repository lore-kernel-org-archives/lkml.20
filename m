Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F8B4E50A0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626671; cv=none; b=IUaQpoSak2DIBV66wqLvCeBjCCnzK5+ZPKjZ2S8KHuGtutZXLOaeFpnlQKpafMIl6ZtUGhMaIQGlg2HNJ8CJ9/XuN7A/CcZSby8++/0njsU5fkU2m0i2feDD/SXXlCoJHIJTHpEncJ0T911KwTngPRLbw9YiH4i4U2HDwT3LIB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626671; c=relaxed/simple;
	bh=JehPSF5TxlwvlmTjCN46peQR8ueBW5Q4c73ezLAcs3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ju+o3Gore9CbYPZr94esPE5TFPK1HzQa/oPaW4ONJ0mEQQrz77UCoqg15etm15tMBh8JiVC/45nit9pEDYt6G1PPGegVMUXuffwuENu1KipZQ18x8agjXxn6LpFzr1/grci2SYY94/cvEDaLigUXjcX6P6sPkQdB2o7cZZxAelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl1wrdmQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl1wrdmQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so5897985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789626668; x=1790231468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNbDRRbXjT+vvhz8XMb2s7oJBDClC1T3pAgXRXk1T9E=;
        b=Bl1wrdmQiD3IY2f5hNSa+2hKfSnYI2o3NTXG1gnl+DsjAmQ8sUdieQBzzf/T+hb7iM
         o9VatQih9QPqcty2z3+QlyEzpv39gXaCZKMsqLABpb9kAZAjjv0nhemzl/5EQUCAXh2E
         kdJ9w71fQhGNjKciUf5QSUyB9apWpejEj+MNYriHQisqqYX+w5qO60rYok2sb6f/nces
         DsBbVfxDuJbQhsNs1FAijLHhcYxAp613uiM5E1EdzKD6OlgGIF7ccz6oKHRSXgMcf5kO
         ZzVhN/voRR2GR0LQpN2POROT7u0C636XXLYNEab82rIA86YOtfP5rcJe8GNDbiM9lvln
         vAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626668; x=1790231468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNbDRRbXjT+vvhz8XMb2s7oJBDClC1T3pAgXRXk1T9E=;
        b=SNLFcUnZuLk2QfW/wGe4AXW6PjDly1iQD7tgQ/ndHnJ2H0uds2Q/fAW7170NnfnGzo
         eVaDykwCL1LGVrb8jw/1SyS1BZC0qz7NTy9a8LZH4jucBMKpgNhOZ4xXgLaxAZunuULg
         tjkJLWPHvwxM+enYH8ClMze+Quww/sRQmmfoVgujnerJjbqEQpiobjlul5vO7E33XZtE
         C5F49fzRDONSY79m1KIoYFsxqyb6UAgM4tcGhrAUth+x/SmM4MAot787hIhP7ZXXK9MZ
         wAI9oopsKswdPY+I84Oi9JO6W4amSak/7WdZyAj68ymATWD1hf3jrNXKB2IZ2eh2xmlA
         30zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdOeSzQg1BDT6TXK35RiFzhmuNY0HaR5Me/BotfpO0PEQo10PJ2SFuT6CiNtooJQCF2iSTTpm171LesFA=@vger.kernel.org
X-Gm-Message-State: AFuF++kSmSkB0nQJmsHHaqy2hMnCDNaDf3ImK7b6Ous3nrGf/6QkrYyP
	qp/hmdt2EXvY720lcAXWW3I2/n06DPwlCj3hN3M/SrmdGhU1gbciU+i+
X-Gm-Gg: AYBFou2yL+ogvwPzxMifjBoDJET9g22bBI1jzI7e4axFlUU9aHpp0AweyIWxQYy+KjI
	Ew9KYmpCFDuJMZIEQimZg4lyjD0C9OPAG9j9SNh0FKiFMjTUdYPfO/ECTSMsZAiDoMj/EMMOfLV
	1khVsPBO9K5y48uq7JgP35VJKMuyQynpWon1h6qLvhkZvx5BnPRkiHRCjFc2kOHjMZDBip5uDje
	1w6pHnnNATEMegrtWZi2sYAlwGygKjRuAWnQUioj2kseoI4BlkgMaGAcJbpQeAotsNU7rkL5EZd
	w6yj3SZ9+jo6Q4IBtCVYGMaoerLkO4eC8sY2HT4hDsOQDGW0EBwaXwvdSxQeaf+axoEBqxz0oTr
	mb7CNlV9NDWvSHUZa4WEnrgksHoa5l5gnSpKodK95DbO0z0ZD25nfl7yYrDtmg6M9Jgs52ifhED
	J0Vr0wcQlS4nj1ypXZ7OpHGwVoV9Qyay0+N2sqkXubt0MBq2MQEYkhaq0FfCUIko+t+TxucX2Np
	b9qwNkWxBQtWMbsGrWony08/idHYT0JZdYFXPIOWgQCbyITU5GCQ74nxZ/B2D+vdE+BxuMX8s/s
	JCXiVSNzAevSP02gcL4mf3etFbk3zBh5a7tsDQb5YyLjbpK0SkJ0lrfOY/TYY/BcOB9nPPA2hDD
	A
X-Received: by 2002:a05:600c:a14:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49ec053a640mr63989475e9.27.1789626667710;
        Wed, 16 Sep 2026 23:31:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm47683165e9.12.2026.09.16.23.31.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:31:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: phy: Fix device_set_wakeup_enable() reference in kernel-doc
Date: Thu, 17 Sep 2026 08:30:51 +0200
Message-Id: <20260917063051.52727-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The phy_may_wakeup() documentation refers to
device_set_wakeup_enabled(), but the function is named
device_set_wakeup_enable(). Correct the reference.

Fixes: b344bfacf1de ("net: phy: add phy_may_wakeup()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Target net and add a Fixes tag (Andrew Lunn).
- No source changes from v1.

v1: https://lore.kernel.org/r/20260911204201.95270-1-kmehltretter@gmail.com/

 include/linux/phy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5f8d65868e0ff558c163421cfea5a6f3bd73a53e..da2febc6425ed340248d9872dd8f2ef79b665168 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1697,7 +1697,7 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
  * phy_may_wakeup() - indicate whether PHY has wakeup enabled
  * @phydev: The phy_device struct
  *
- * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enable()
  * setting if using the driver model, otherwise the legacy determination.
  */
 bool phy_may_wakeup(struct phy_device *phydev);
