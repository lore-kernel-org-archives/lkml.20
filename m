Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4FF4C10CA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671141; cv=none; b=cyDHfw8Rx6uDCK+VYoWmlcsuuh6cfmei5L0F49C1qjJuET/YgvevASDeMvmCNliYYg5ViOmII/K6i9mo22kQBKJJlvc7MYkFXYnqExDlQYttQUBfKq8bFG9Q3JPHIPVqPCkt0QBUsfw69TyHKJSAXUEksUjLc0VS/gyr3av/C6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671141; c=relaxed/simple;
	bh=ib2A9udkzvYv7FD9VshCB8nL6L2/m8X7KTuloEvFaWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPVueG9eS1gJbjH/o9XIX3YSsallhVr/wbX748GbxXQ5IcTmsgkwk3+rN+TIUxcikZuiySclUYhDROCWvsunzydSg//RurqKRChSCoUn9EwSq+WgHyWk4kOw1Eh9iVPOWJzaeA9YFod+jO7DQSmNX7AZcGNHIKUr4ckxZnLT+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sv4+K562; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sv4+K562"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so12366795ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789671139; x=1790275939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8YqplBJKdZ9jG0Stk9hqmzya10hEbvLDTdw7GUxkAQ=;
        b=sv4+K5626ODmhWj6rA4JXkw1eu3JLEtFyAOoTtDlXozl1K+hRaUd25rpwRfH5Z8Pl3
         puHQSpxL08ExNpdP1zLPI78fCUG2Ar2sE8tTLxiqSlzC4iP9Z6ba1ITjMHxGxTxdV58B
         8RhfCvuWuc2tBm8ge83Mt3BVMvL5YJ0rl/qz/N8TmlJg88+ds8X5Xw4Yw4Od3pFztEpn
         P/uk4pDSosmP45VCkQJtfalvg3sL7Zy6FSzQAx3QM8FMkHD3ByTtHuplPm4UYNFwHbQm
         fOBvafWk6c85CZw9wJY/McTSx5NrmZVjHeWC+Tu7hVFKs6QVVrl7sSVdIzEbKY9rn7KS
         SjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789671139; x=1790275939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8YqplBJKdZ9jG0Stk9hqmzya10hEbvLDTdw7GUxkAQ=;
        b=nuvTjhauAogFzXsENDiy9F13ppPnWmrmn8kIkxy/VXtdVRXOAc3gQwf0z7DwvzebRe
         6HwJrn0S/Eelv3x1plCNjnBte/VszALOI+s4qhaG6ueC5o1QG2OY9I6fYg5NvDoGvS7K
         8NPQw0Bd8HU3Od73jMLbN5mplavbzDQeVAZ/ZbuIXrg301wae3/RiHT07WKDc4Io4+iH
         RNadHrGOOslfdqfTifG1xsoJItOO5qgMYyiAMVNvSEv839kZ8hsUUNuQ9sRfTrtqmRgC
         xnvBXhqA6jtYlI8q1cW8q9xdUyWE3WQDezSIlN2s4vrQ2YxCDqX+GWaBHu1Usx1MbICj
         0vtw==
X-Forwarded-Encrypted: i=1; AKwUvBweMwkKFq1JhgJ28dDKNsiiQIb/X/wBcQjWETOLb2rE6hDoWovWZQMFI5OFKaWzwtxy7g1aoOJ+vwa7ra0=@vger.kernel.org
X-Gm-Message-State: AFuF++nlJfpjyo/nFgdg/OR4Pp3QdBdUKE5IE2fNiGCPFjIvVToUn3GD
	ru6AXHfUMhZFf+2RRpk0Q1HrI7EGlmBT2Zz3/lCuViMriQBmOXPEl/mC
X-Gm-Gg: AYBFou3AZXVqxf6MSnj5NOLRH3QHaz8TYhXip+SYBfJxuyB4LKXKujV/W/JfdLJOB7u
	/c1Q4m66ghbxtFmyhDW3oenRTung2zqA30a8UCuTlr7ErW1ZGjL0weGtTn080pGUs9qAu6lul4p
	zJfkU4ida79C+8Ez1kL8WiAirVqUutjOtrqFM34AcleDoSLkFbnjf4AHqZo326MggDvb+obpfd6
	c2sVZIjk7ZyqiGzn629n2knUgJAkhH24cSnAxL8hYnb8uidPZerc4nD4qQm+vc2gF6Vxo60k5Tm
	GLwNd+K53Tg+/BWPdApM7T80T+UXuZ1Jro+b7qr24fDObtmSxvhWPVTbLT+Td+DIrZOCm6qebUj
	7reAloVLQNOdbtydHBOfldXEDfZk8nsantdtfl0P16lQ/3VncKCtu6/Cy+wxa2FJRXS62BRryKV
	NEIR4tu5HuqNl4BWV5l0Ha+qmHnbRXHjHHltq4I7zh4OriIvcQyaEI/e5ATSZcD9TR7r6oQKDxb
	moeh8pcmDkq/iYFiNEKecjsRg==
X-Received: by 2002:a17:902:f645:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2ddb1b79d84mr2382095ad.15.1789671134278;
        Thu, 17 Sep 2026 11:52:14 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm31032655ad.82.2026.09.17.11.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:52:13 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 4/8] net: dsa: motorcomm: Fix register bit field names
Date: Fri, 18 Sep 2026 02:49:51 +0800
Message-ID: <20260917185010.3189199-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917185010.3189199-1-mmyangfl@gmail.com>
References: <20260917185010.3189199-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Review and fix the incorrectness in the bit field names. No functional
change.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 3 ++-
 drivers/net/dsa/motorcomm/chip.h | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index bcc9542370c2..5049f4be8aa6 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3742,7 +3742,8 @@ static int yt921x_port_down(struct yt921x_priv *priv, int port)
 	u32 mask;
 	int res;
 
-	mask = YT921X_PORT_LINK | YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_MAC_EN;
+	mask = YT921X_PORT_CTRL_LINK_AN | YT921X_PORT_RX_MAC_EN |
+	       YT921X_PORT_TX_MAC_EN;
 	res = yt921x_reg_clear_bits(priv, YT921X_PORTn_CTRL(port), mask);
 	if (res)
 		return res;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index fd552f7dced4..3fb0c6a69dd8 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -42,7 +42,7 @@
 #define YT921X_PVID_SEL			0x80014
 #define  YT921X_PVID_SEL_SVID_PORTn(port)	BIT(port)
 #define YT921X_SERDES_CTRL		0x80028
-#define  YT921X_SERDES_CTRL_PORTn_TEST(port)	BIT((port) - 3)
+#define  YT921X_SERDES_CTRL_TEST		BIT(6)
 #define  YT921X_SERDES_CTRL_PORTn(port)		BIT((port) - 8)
 #define YT921X_IO_LEVEL			0x80030
 #define  YT9215_IO_LEVEL_NORMAL_M		GENMASK(5, 4)
@@ -94,11 +94,12 @@
 #define   YT921X_SERDES_SPEED_1000			YT921X_SERDES_SPEED(2)
 #define   YT921X_SERDES_SPEED_10000			YT921X_SERDES_SPEED(3)
 #define   YT921X_SERDES_SPEED_2500			YT921X_SERDES_SPEED(4)
-#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))
+#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))  /* Bit 7-0 shared with PORT_STATUS */
 #define  YT921X_PORT_CTRL_PAUSE_AN		BIT(10)
+#define  YT921X_PORT_CTRL_LINK_AN		BIT(9)
+#define  YT921X_PORT_CTRL_HALF_PAUSE		BIT(8)  /* Half-duplex back pressure mode */
 #define YT921X_PORTn_STATUS(port)	(0x80200 + 4 * (port))
-#define  YT921X_PORT_LINK			BIT(9)  /* CTRL: auto negotiation */
-#define  YT921X_PORT_HALF_PAUSE			BIT(8)  /* Half-duplex back pressure mode */
+#define  YT921X_PORT_LINK			BIT(8)
 #define  YT921X_PORT_DUPLEX_FULL		BIT(7)
 #define  YT921X_PORT_RX_PAUSE			BIT(6)
 #define  YT921X_PORT_TX_PAUSE			BIT(5)
-- 
2.53.0

