Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766092;
	b=C2WMlYtMQG5ZTfpa6Ftmw/n4/YiHE6ibY+a1cz2kbbwVJmVn1m26mI3Q8utSgtmT2lr7
	 N+kKZrQch+zRn0hNDABiO4N/K/emrlI5+zKg7BF8FWEyDqE24kJvQIGQSa8Hz0PZ9Rs6U
	 xFPVs9dD4K/3QqkljdTkDe4BPEl28CE0nazv+ybBeOVmzf7Twv85QO7tCPU5UqFJIlek9
	 8po3CssB2HxPd5OaB4buOTaowt0m7c0S2rl0bNs9Jrbf956wkQnVXyuDyvQ8Eddtc3ym1
	 N2TrKm+82ZzgTFOUxoB6PBpYi2GKQ8ACp40P7ILV6/gCLbRKZxHuBOPZ1AxBJ5fGEGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
	b=oYn+0ICTyiz1HQ3Fg5/HlGAL0/EUwbHu92gHIkAm45MEbCqX0gLyiXvs2zNJeUfLtPum
	 yJEyf8JgzMP3v5rObDnqC50VIm6BCDsQkd/mYQhDC+9C5RKgBAGpPZpeSS4shOYqoghht
	 jCUACQHRrynEQpZtWcf88otSmEBoq2FqMZ5uBnjb0ZfgkjIJK+Hu89nL/H8WYP6+8wYFZ
	 5VP7lfdVAGSE0cYeUaaCNy5y0nPXtYbrS5e1R4BNICQqYQD0ASdxjlk3nMO8w9vAhB65L
	 2uJY0MGtDB45I7hKWesTqbtuoPQ8bPVgdXlQj99wndu4zP7gCUzI+wxnv2/QpEyboDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1Iv7pYL;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAA606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FAA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1Iv7pYL
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so29358361fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794766090; x=1795370890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
        b=l1Iv7pYLM7Udcm6uUHKM8AjbbrJVp57EBUL3g/5ZXETlYC/1BRfawLE3cP7fy7tclT
         Yr0pqtAGM2ya5rkH0BFOKC1vQovnDHDtN0z6KEm98rsHCCVrZQ6CnC11ybLI0VRP1Uw1
         bGsl67qowtYJg5lCGQtGz1U8BzRL96A6wH4PRkcl4cMbXSc+hiHplAdtS47vRQpBN3NE
         agsz38YCRhkOzMCMO2iN6XEqwEXUmO0Lci1D6eAU4nCVTQqPvTp1cOpcR3hxG4R+k2lj
         JzNNt9xcbe7N6I4ZSjNHsxnimVbYsGZ469za3NSSyn8O+/BYBkkpxZsX6veZNiODgWaP
         WN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766090; x=1795370890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
        b=JolONNStg2HuJcMIdLTTv5wGqnw4bWV+Gw4WnSDKbmjgy4neNPU7P014qhUX/g4Ufv
         KXdHli4TSGJPHNudQHerfpbvL8mLMw441ysjouNgDIKUxpF1pSBkjG829thuAvranfZS
         pZN0iQ1d+eC9jKEnjhHkxOOZiKT+2xCj0x/nSK//d/T3fm9cOnFCYuQ52wp9+gHdNwE5
         86s6vCOEQSFI0Md8FzPjcp6xIbx1+MdItQzScuU8MwkCSlriYg7FydDjmvxOkrsSjcfo
         RXZv73fHFoIt4bmvR2vhJcq2PnmXtRKetmiBuC/Fby1WoCYZVQC9M9QTB1vO3blS+KtT
         a+Uw==
X-Forwarded-Encrypted: i=1; AL+hErGXaH+DbRvzSj2CWqRwT6TjL80vx4iIJ4MFqbuzeFtOFcJOiqylXE1dmS9INFctwChsMwBJnTkRfFrOB2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KOvBmVVnVGevvFP4sOnBrpyS3j7DqyPd3XatpEzLvjODLH4lf
	H3B7iIbyMl+2iYVcpuWG+y4kfurSRD+L2K3Ox6BvrOvAaSb5e9mSF3KG
X-Gm-Gg: AYBFou0niD6NkSzCIY1+2NAIWGTzivkiMN2UpiZMibM9IX3kkJOkUYXdaKrP5svpCWY
	xxOu0SaphfolI5HEu0oH1Zki29PotDWU88JQzzB9bxzAhjIPzyD6NVrW8UylEemYt1Y585KbxGr
	fo6di1nZSUtgjndj9NiupP4y+e3bJ+2d/rc3zrvgUQ6RNXbNBb7oETwZqx1Dh+UvsOUZD7v6GzU
	HoXVv3cuHz/f3YXCX0tk3MAPVh1vZns4hCHaTvIx+tW+VJI65/ZCN0QGYpyVbg2uW4I7Sd6b1VG
	12A8Ai452EagXDpSE3Kt65J0jaX7GuexzIsYLZxsI+aLyk8reoos0a2M8bmY08sX+kBSGh3a9xz
	BE37fDsGIwUIojPTYo9aecuyz8NKwadhiCTfNWZOavt9hhqHxP8gPl0c8IJVSAbJGO1OOqYaI/4
	ZqbWRSpGcRZzI6PQiIysN29Z8I4zkY3cS5jKJSSX9f9S1yK85I1E1GxG8IHPKnzIab9HM9T7OkJ
	wrZABc0EfOhyofZN3/xRmT3Jm0ns7sD4MCfY/KwCyebT/lKk0E0pGQVWvctW7OiMlcKazsR2AGo
	HqD8gXuDZq4kyTjXtwaoyC24ryIaiQUEG3MR/i3H/gwpBDxoSsrk9ogsT9Ros/RsdbTvUL7PNRF
	c0QKcERs=
X-Received: by 2002:a2e:a104:0:b0:3a9:f130:6ede with SMTP id 38308e7fff4ca-3ae2b4da76fmr24776831fa.13.1794766090334;
        Sun, 15 Nov 2026 10:08:10 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm2567818e87.36.2026.11.15.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:08:09 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev@vger.kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: phy: et1011c: don't write an error code to the config register
Date: Sun, 15 Nov 2026 20:07:35 +0200
Message-ID: <20261115180735.649299-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
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

phy_read() can return a negative error code. Use an int and check
both reads before using their results.

Found with LLM help; fake-MDIO KUnit error-injection tests passed
(6/6, KASAN). No hardware testing.
Signed-off-by: Elias Pukari <elias.pukari@gmail.com>
---
v2: Drop Fixes and shorten the commit message; no code changes.
v1: https://lore.kernel.org/netdev/20261113221917.3542509-1-elias.pukari@gmail.com/

 drivers/net/phy/et1011c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
index 6cd8d7758..603fe5a1e 100644
--- a/drivers/net/phy/et1011c.c
+++ b/drivers/net/phy/et1011c.c
@@ -62,16 +62,22 @@ static int et1011c_read_status(struct phy_device *phydev)
 {
 	static int speed;
 	int ret;
-	u32 val;
+	int val;
 
 	ret = genphy_read_status(phydev);
 
 	if (speed != phydev->speed) {
 		speed = phydev->speed;
 		val = phy_read(phydev, ET1011C_STATUS_REG);
+		if (val < 0)
+			return val;
+
 		if ((val & ET1011C_SPEED_MASK) ==
 					ET1011C_GIGABIT_SPEED) {
 			val = phy_read(phydev, ET1011C_CONFIG_REG);
+			if (val < 0)
+				return val;
+
 			val &= ~ET1011C_TX_FIFO_MASK;
 			phy_write(phydev, ET1011C_CONFIG_REG, val |
 					  ET1011C_GMII_INTERFACE |

base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
