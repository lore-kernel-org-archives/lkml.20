Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9670249E5F4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142012; cv=none; b=fkbRoXuwcMpH5OJ9BnmUsPDLqCfF5Z0qnod2B/7JyYG9vB4bLJ+gxA4kor3HEesxPravrlLYWmT4L8p1rYEAQ/Yc+qHAmp7G3jl9+ZREA67+2GOuJocGQHsIeDR1zBpctSRIS20YzVAsp4+C+WYnYnV6P9MRR91yP5cJrZdSOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142012; c=relaxed/simple;
	bh=A4mNJss7r8+QPwLUxRmAnLRSF7/BOBXN3ZTsgkISMUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ps+WzH2kezKlHAW4THJqWM4CM87xNn2TJTnMyTP3apeLNuUtnMzv8k2nBhgJS0ZulLQL4I53EFwuhJOvGMEeSdeXaqPH4GVTXATawX4MEWhdJGxceAiPPw+/IVAplRqYVogtSkSm+zwJS9phl5nwt2NwIuhxVyhNR9K5Elu8Nh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM+z1PSg; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM+z1PSg"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-791fb08ddbfso787857137.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142008; x=1789746808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3r3GetI2bTShh7zQsecV1+PSL1nkUSycIYXk9LbNz7Y=;
        b=CM+z1PSg4p05aZBkFWcjFOzpzvg6CgoDIeSUWU3tmEgf53qqYH+dcBDnB/LFv6A+Cu
         AorQ/ss1Anp36naiK4pkYVuBkKEBbLU3rZhyVKdU16jBz+Y6ZhKHbhernujkO9h+RB2F
         LgzNtXcMsuE7asFhcKFs9HRioUkZEwAco3hf5TSjissALaaHVqxJ4AeLzSBXDsmDujdN
         QaSylw0DpRyGl3NLSwxrMLS04LQjbKL3dvSOlRq6+Gccs3whYiOPAFse60rE77Zt5aAM
         +lOe6TLA00OwU3nh/kPdIvlcljoBZ7iTNbSp5gHwqNdBay8gJPwVZbg/B1e0vi0KgWZ4
         +PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142008; x=1789746808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3r3GetI2bTShh7zQsecV1+PSL1nkUSycIYXk9LbNz7Y=;
        b=I34egxp0Z7ymDvXQEFcerVALkGG5XrvwsCdNWjFr8EZP4i/nUsauvBGN8ofzpGkI/z
         TXEqvS1sfkxWzIjP2JggpeF18/ieaSgXp8REFVpOAuQNc9Vup6WY/TSnZYAM0gtBs4v8
         PpzF4qJHmSsD1md1R+ZN/PZvd1TeNR7+Q9cDMh8hngv3U2Dbe8zURmmPrv6UjH6/t2d7
         r5wYgu5lvmeCkKJSLEW8CuS5d+g/gAY4GfscN6hlNR9y3Iv5JWDCXAk1I+zRP4bh39oV
         UxvmxHA0ZGk1GvcVFNpS9NxSUOTcQ3P+bGdZA6ACeLeV0rjidXbxjwOxPLU9sEgJDUH3
         LrkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7dKBFDEl42jrPRwkShxv6Gq9DfbLxCXQoMYwdnR8g1m4MqKmVyhnxhkq8EZVoEHux3siFnPfNyENQMTY=@vger.kernel.org
X-Gm-Message-State: AFuF++liduqRotiP+TaB+6yLVO+cXQuqaouYIT2/3l9s9wDADkFNs20s
	298yXRapXr9wRpmGXJUOc3KL/qfLwRuuWYTxINypH/KI5GJzdsniu8U=
X-Gm-Gg: AYBFou0n+rrZA2tQARqGfDVg3uv9QmcH03qTKXAzYiY7AhpQQGZhowE9w2DY5uPeuLu
	teUA3nEeMRirUUkHnNGcl8qjJvgXrHaV3DuJhZWVmUMbgysTfgDC5dkylaPFgVGOrkF8e511s+f
	Yh5HPYE3fnZYYjJZm3I8xxKtbIomSz+S6q6DysbUGeXkjrMweDq/k085z6TM5bZVfggfjRsl5oD
	NLYH5aak71EhorOqFSnnArJNSF93zNigfubX4VSzUdVB0CglRIaR61NtMPJrGk9e5A6TL2mczBd
	J71Ym67v326W7Tzp31gjpwfa/Laz9VuGlMbksDtDuwveOnH0IW++R7oo46RKRUh4p2vjOs2xnja
	LZJPJF4jVW8P2+WAueu3VO6KJ8ooxmee38HBswcEm+Rjeq2FtA21/l5PEcXSQU7vo4N930mu42N
	lbO30enbKdBTnQlAqytoX/P+NywS6vIiHbRosaP51JBgreZCLTUZfYofgFYae/wULUdml3vvjyL
	eLgnhpkAUu5L7Q/DAlVxz+4lVBjK+vYPky3RGyAK8E38FyhYMpZ5u1qnwzeu7SaDTE7D/X25hA1
	c4U1lXAfjcLcnnuAc7ZXMKi7OXIkZp9Cxw==
X-Received: by 2002:a05:6102:3a13:b0:789:100e:3d0c with SMTP id ada2fe7eead31-792aad54589mr5833763137.8.1789142008061;
        Fri, 11 Sep 2026 08:53:28 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm23300896d6.42.2026.09.11.08.53.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 08:53:27 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH net] net: txgbe: free the fixed-rate clock on cleanup
Date: Fri, 11 Sep 2026 11:53:18 -0400
Message-ID: <20260911155318.88857-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixed-rate clock is registered with clk_register_fixed_rate(), but
its error and removal paths use clk_unregister(). That unregisters the
clock without freeing the fixed-rate provider allocation.

Use clk_unregister_fixed_rate() on lookup creation failure, later PHY
initialization failure and removal to release the provider allocation as
well. Keep the existing clock registration and lookup cleanup ordering.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: b63f20485e43 ("net: txgbe: Register fixed rate clock")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index dc9f243146580b477a2ae958ddba66a1ac8fc822..c81d485221d56dc1d8d66f5a01ce05c76966830e 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -434,7 +434,7 @@ static int txgbe_clock_register(struct txgbe *txgbe)
 
 	clock = clkdev_create(clk, NULL, "%s", clk_name);
 	if (!clock) {
-		clk_unregister(clk);
+		clk_unregister_fixed_rate(clk);
 		return -ENOMEM;
 	}
 
@@ -637,7 +637,7 @@ err_unregister_i2c:
 	platform_device_unregister(txgbe->i2c_dev);
 err_unregister_clk:
 	clkdev_drop(txgbe->clock);
-	clk_unregister(txgbe->clk);
+	clk_unregister_fixed_rate(txgbe->clk);
 err_destroy_phylink:
 	phylink_destroy(wx->phylink);
 err_destroy_xpcs:
@@ -671,7 +671,7 @@ void txgbe_remove_phy(struct txgbe *txgbe)
 	platform_device_unregister(txgbe->sfp_dev);
 	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
-	clk_unregister(txgbe->clk);
+	clk_unregister_fixed_rate(txgbe->clk);
 	phylink_destroy(txgbe->wx->phylink);
 	xpcs_destroy_pcs(txgbe->pcs);
 	software_node_unregister_node_group(txgbe->nodes.group);
-- 
2.53.0
