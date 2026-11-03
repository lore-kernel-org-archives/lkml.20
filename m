Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708600;
	b=GkLBs5qs5rTsaBAdgFbpRTd2MlpVgJNfColUVOn7trhIm1Hua5nQkbt4j4GkKy+G3Idk
	 uiVyu7YeG5lZSedzKzblRSvhwNZiz5ZATYsdybyT8xUotn1M9q7WJL1YXx7nlIjQ3CGGB
	 gyjzvbZQ5XlqH6z1tlFXWEGRhWBn9ZKPoQi8Ho6M5ahv9b1sAhO+PLh+nGVAAQdKbFh+H
	 OO1biA9VwL33KFvMmnutvQ36AfHW+qhfNxpXpXgRInG7Pes0SqFGGSMvthSJ3vBwfvmEJ
	 g/zaT3DPFYVceLsdw3MtnmL++x3DbAg/iHlcPZano388ZI+6/dUzP5i6hmG6w/opM5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708600;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=RtuVHL9/omrRNBvcHmS0u8yV6iWbKVJcQ8hfDOCEdpQ=;
	b=3+j9Gg8Vb7Blu37ERs2zabQxx3XfX3P1EQqFuAOXTeCwWQCONrF9Y8duHdNMW5mCIaXB
	 /m+cJI4WYe8wEN0VymxYvCXZcOyApbti2eSdRBUtzH5xN7efw4s6PtiqNC5rANwzXe3fg
	 eMfjj25wJCdpGYAY/ugHygg17Mvw8y0VSQesKBIYC5MoLWNTMaj2F6Eq6X5qk7kYX1p7b
	 ZcSa1UyWw7V17DWuGWzxUN/T+R4EGiNx8fnC5v39ZUuNJ+iq39e3IlA/egdCLJq/QscGd
	 GDplWE1Wp7fCZbyuVGZ2RFAW1eFb3cXsTjqA6Bus6KsiAmbPCQRfhO86jGcSDkwBlpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xsp6i+Ui;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30E606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E30E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xsp6i+Ui
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C276FC8F45C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 317DB6046C;
	Tue,  3 Nov 2026 12:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D4E610328267;
	Tue,  3 Nov 2026 13:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793708576; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RtuVHL9/omrRNBvcHmS0u8yV6iWbKVJcQ8hfDOCEdpQ=;
	b=xsp6i+Uijz5hhHj3zfrjW78ybSqI/l5L3qEFLrOa4jDyHagGWK5yoBy/HME7hqKJkBAT7C
	Ix5/4mTO1xybw1/N8nWSsb+KEOLqbQpPUTH6effkk/WGhOyFJUt7IvwlKH11kuuPHabQYC
	q2kwEktXdGYcv88blWjZmXRx/jio1EPgRipFMqvkoeKSJtfZVvDuiVebnW3nsuU1MPqI3N
	KUqnIE/VdX52OHhljKg9MptV6mfNYosrVaSy/XBI+pSmAgCSzlJMxna4VwF/HCMlUHNHCY
	B70Tyand1vRZwQfM+QEeJ3RfdstG6RExHCJWAfTkn6wEFnsuV7VlqpOSwUvLZw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next] net: stmmac: selftests: Add missing endianness conversions
Date: Tue,  3 Nov 2026 13:22:48 +0100
Message-ID: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
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
X-Last-TLS-Session-Version: TLSv1.3

The kbuild bot found some endianness issues in the stmmac ethtool
selftests [1] let's address these.

In practice these missing conversions didn't cause any issue, as the
masks / values on which the conversions were missing were either always
0 or ~0, so skipping the byte swaps lead to the same value being passed
anyway.

[1]: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@intel.com/

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This isn't worth sending to net, I've dropped the Fixes / Reported-by /
Closes tags, let me know if I should add'em back.

There are more of these endianness warnings in other places, but they
require a bit more attention. This'll be addressed at a later point, I
don't think we have many big-endian stmmac setups anyways.

 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 40811df8f2b7..df696e2c1528 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1216,7 +1216,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
 	sel->offshift = 0;
 	sel->keys[0].off = 6;
 	sel->keys[0].val = htonl(0xdeadbeef);
-	sel->keys[0].mask = ~0x0;
+	sel->keys[0].mask = htonl(~0x0);
 
 	ret = stmmac_tc_setup_cls_u32(priv, priv, &cls_u32);
 	if (ret)
@@ -1463,8 +1463,8 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 
 	key.src = htonl(src);
 	key.dst = htonl(dst);
-	mask.src = src_mask;
-	mask.dst = dst_mask;
+	mask.src = htonl(src_mask);
+	mask.dst = htonl(dst_mask);
 
 	cls->rule = rule;
 
@@ -1594,8 +1594,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	keys.key.dst = htons(dst);
 	/* Match the full IP proto field */
 	masks.bmask.ip_proto = 0xff;
-	masks.mask.src = src_mask;
-	masks.mask.dst = dst_mask;
+	masks.mask.src = htons(src_mask);
+	masks.mask.dst = htons(dst_mask);
 
 	cls->rule = rule;
 
-- 
2.56.0

