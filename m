Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915886;
	b=b0PpMeysGt0OHb0/eTQRyO6bj4E7gmQi6ax369U4+YMX9bCgiS8kC788NkEQzPAoi8ow
	 mokA3xnCnNgZbRhTMcgpgpcQdJCozZaJt70fFo4PjWU3QxrW9s3pgn36nqn5Ya5UIUcKW
	 5JCKKvwYMZ4qZpT8wRXzRJCc6/PMKjvLrJ0YYLUB5Jhdypf6UKuUwczezNd1OfVoTMot9
	 5RlJS+hQT5RyGwwRCcjyPU2JDA4bCwDE5J+iSYuW7g4FITFjQ/blokZDlE9OZ6FUZR0f8
	 L2wJvVptuThwM6yTWCcMxkd5g1P2i2Aa/e9MO6nTofBLWLrhx444abROck9c+SnESpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
	b=B0/g+APwsxXAvAu//FNPu2lmYtw+J5GHN+WcsgdH1PbUyHTM+TkHOKuWn/1SzE1Ff1ZD
	 xdrT2XnVthZwSAIXQjjvID4vOJDp4soSSn7kloJyLc500g/kWlIy9BIbFZnIfBXgjynbe
	 9Q3gh4YlAmoaoNuQmtQ+kdE+CbsvHiKPTNpG1ZVtuFwFUq1vBytEQNo8r3PJszB+Fghqx
	 YKwBipk1AaW543mEq7+APtPeI6KfGbbNjMUhX1eZcXqj8HH/5M2WaCCqR3IUKTLqJ5lkC
	 4HjBIbdkP70Zj1Vuz4eV6qKq2bn7l5Kf2sPnorpnZzOJtxbRNdhUw6PFMBSzKaZpD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD107606A89A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD107606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ace304021eso43297261fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915884; x=1795520684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=f7erzHrWDUVlSzQxnWriHFURIiNqowkSJORhhpLcTPt+vtcUeeOIpBgejK4l/YsU0J
         V4lzAkcmDs15Az5xGiXxSV1ceLSnjv1cN917v0Pmiczd1lOVrSNKun7URJ7Pk/f3jm0G
         cpnlKqlANYS3CqQJWmwjM2SRfwj8pc+KWvWifnd7HJLE3oKjETRb2EH5NQcEl5Ne8czV
         73p0nBib/73qaZ5dGTcVm2RLGrYqZG6iRoX//PwN9YJV43QF2uL6N/yA+Dz4QZRiUF4i
         nBQcKtGZ4e8vIJsS7MoT8ABh4KFz3CN6dP1hH3qVCcWyRx13d8LK6lFbYUDkME/+sBxd
         p5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915884; x=1795520684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=FBV2aQrlC68XoM/QgFGUwRUj7xwgtz0hIrrYsfa1mxSxqg+a0HBM8cvR1IQgZ7yI55
         D+jVAJmrF4/z5DMJDEq/1oqqwHulFaPmpggUCo3sBkA7BAkzXGy+9Kpn++cFQuJXXeHZ
         iPUH4iLW3zX0hcvYcXxKRZmaooM1DUlNJJP9LEbGXjUMBwZCSqb60Gv1UL9d1nWFtUtA
         B34q19NoFEc02o82PHS7HKvH4tuscLRWb9B1qnGYDS2rlzuYAoL4PvvSrTI/62U7w4Y7
         wGPSsICRNrXABeBVShs8/TzOe9VK1TbwlLThM1MTNCG/jKrBKFk4wsp6W2/oCWvFAgFS
         PMlQ==
X-Forwarded-Encrypted: i=1; AL+hErGGuVSi3YBarok5xTcHjOeuDAkLP1oa4aS1YFhxbs856P1q5JB8CL6+BlM7ffe+equhe45zFOdprmGsSrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qXhzi15plp9282N9S4Jp+od10mz7ji46jIiW6btCjN1tmGnKp
	l/9CEg7Qrhl4yhIF6V+MCbkPOGfFDBGtLMCPFQFSoVnRRDb0z80LXOUn
X-Gm-Gg: AYBFou31GBXuU9Y803sChKvrv3zYWG10qyJXRI+85vuwQ8YD+pkQJIt/Vr2OkxxmJ4H
	Y4LY6N4GY/Gxi3ZzSVy1UVFNvx5ORZtgndqMPvVa4WnV4XpkLUxnMdtZHdmx1oqINUW6YVj6YN1
	gNGGdawvFI5YyWJldpIdq7gL1/SxRW1lGoHiSqPAbUJ1qOHNtQ9Btj5h2mpbx+oT8J4XSnbfHxe
	mnZ0GjFUoS/Uxja2avKOiDGfJzBzawKSZ3AfIYuhBDoOf3pAp/hWYSJ0cfl/45pDh6tQxoMns3W
	Yjw/WhprrClddqrdM+aSfb4kIfOIjxObo54Ssuc6KlfBzlZAPlOng3Y78VhLqbep8RGFPr4CZyY
	eWRvB5BPAQKSXqKJaHN/rdzVQh+Z/LxzIX9BjU7/yQziP5owCvhsJHBNJvevee7zcx5oFUa0txA
	pLzGlTvhlEOn8//wzjzWDlPk1AIi4LvOYno/TZwpz4qnW4lNzWQPr41AG/AS2Pl252uFED0eq/D
	AFjpwMuOJOa+8G6vG/sJQ+Rq+IFrEz8ejOGbU4hHkxIze/VgH1eOGcNWaN2sbt9+iXaMa9V54OA
	VtbSzC2DbiOVOPOTsFi5iNKnm8J2Jk/iAibCXiyx8TuQFt4=
X-Received: by 2002:a05:651c:2204:b0:3ad:f29c:e89f with SMTP id 38308e7fff4ca-3ae2b4e80e9mr39665131fa.17.1794915883850;
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
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
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended register write helper
Date: Tue, 17 Nov 2026 14:44:29 +0300
Message-ID: <20261117114432.2794961-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
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

