Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A3388E74
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829099; cv=none; b=E09meCUAEAAwvXkFMZBIrdIcNrVd3/Jc4H/Pk47nWuECeVTi5RH5TkXxUFKGS7aaIeME8qIAVgGVbgf0nv/BrSVD/NGhzcfGL+YUmI6/Gj7teYUn5E/2KvDKgOaCJnuZC5QfAQndfhXhayyDA6qj6tCPLfDbyx4LihNBGGxQaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829099; c=relaxed/simple;
	bh=+bggdvOODFl71zz1ONn5aE0m04Kzv+BjknZIOAjQHTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=an+QE56ClCQ5bHYFMiM+0fsa/HQOA8bTU0EEskr8ALG7fReDGjFd7jkUOzUNVDvYBwZhb/is+pNDFzYbcJ59p1Q9S6IhQfzyTUpaMxwaz2+xXB77uAq7zxYcXCTVZVdKyK9S+4liUfwMDF8q3PfUiwSE4Ve8DXBpu/e4rqnX4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSdVn9hT; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSdVn9hT"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4db3c747ad8so3896337b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829096; x=1791433896; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4Vf2DmeXuIICczMLsgHOQylq088gF7uO3L3in1vUSo=;
        b=DSdVn9hTZ74PjhBxFpULihkXy/rWfVyIhGvP0dLWU3dp0IqO5F0NBoBanaF+lx7u3B
         Uafo3r8kCHybs/KnrQwCfHNeU7ikvmRHyOBaRl0GA9ZoOj9rtB06eUp3ODJPUpUSM++L
         nMKqSOeUQRiUsbIQVBr/4YQNrHDDzLtyjjLyYcpoUg/F5Igc93Xav/OtvUe8yAb1qET+
         Gv5j95I5ECQFSR1iqu0Rk+Cjtm9NGXqhkyD6j77xG1W5CcfxRATWENSBbeMneQZ9ufRg
         aiR7T4fq8z1BS1DpLPvMPRx5138/5KBYQPt0KXwJp4K/6ovZDLZgq/TImON86bFOAo8h
         KH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829096; x=1791433896;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Vf2DmeXuIICczMLsgHOQylq088gF7uO3L3in1vUSo=;
        b=Jle5HPO1LEzsgEY/bAMv0dE5WlNK2zULVn/s9xEUkayqf9+1j7Qwcl/S9poqxWtHp/
         Q+4pNYIm4bfH4nEHsKaF3dKyR8FXd63x8+qkmLT/aWe/X1vVGvZfiH0c8x57MwxaZuIB
         vDluMw0HJWIQ2EUFLUMSy/2Q5HPEeaTzvAHmgN2cOdcV/ZwldxWGfE1Gg0wtQ2YZZ/i7
         FwRZXKH8CxjE1RUFmzZquWih1BlVf3kzOdjm4g8cUNi4cW5NNWVeBBN2w5kCCL65JS7p
         C1A0V2IPmvpRwu8myTFTnf63euZMHeTt54CBawSi24K4ySfUGY+eOMGQjpshjUcl3sZ6
         77Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxpTmvydPqkKeELiFJ6T8bh4YPJc63BNrjSqGTaNj1Wg+dil1EBVWKtbPrLqlmTpzqJjWDcF0s5AdJj0m4=@vger.kernel.org
X-Gm-Message-State: AFuF++mpZ7o3TDR0WfArFFxQqiSv0NJNO+UWBQj38I+N5LFdCO8Wteco
	JB/79m4Pn6tV1W7c4OTVB09dzQTW29u/pzyfz6U0nMu//3522UjXAi7S
X-Gm-Gg: AYBFou2yNxsgi6UT+qPctfE9d1ZmwQsazMoOpDwP+djGaZh8M+4BVgED1cpPqqxWdzB
	zEMj+OQnIDUrx0Mw7KOboTAagVNqNJ0j9yYy5R8D2CPjvwOcofiMVzS4qvyb5pJS9blIWhwxQQa
	06TWJQ4FHDfy+GCxGpWD41LBZgYCMke9lHfkHnEBiYe7v4gwkjgfKlknTKkjoeA5Cv/DM8SoDy+
	gHPkFXiiOeCIcSO69rL4Yr5tWo4CGQua2lISFnyWIK7B3+cRItHUUU1Yaclsp9QXFWIwtgyRULX
	J4L9QOxVfG73HSt8vSyIaCEs9FGsrQTpPsLIg/LkPjteSTf8vu8QdV8ZZMYnA0vtAdQA54h/hEP
	moml4vpMuRX/DrPgXcJ9fqHEpedF7047GybDXp6BMwzYCMCYcJP2rN0UvCAOiFFuoU1S8vIhRmA
	X/o8TRU4+lgTuTLo7HF6EgNn3qmPlbyh2nA8jCWgGqzWUp2ZPK9jZoXuOq6W9PdXCagUWvSOAil
	METegl79YNVmteW82uxG6wxdSdaKjtX6WFuLii2AusrrGWQs9j0a4y3/em02xSj02GIiD0U4m8N
	R6pn8MI2u8LdxLREb40Jvj0RpmjIRVgHb3T5p/cg6WE8sEyME/NPy/47aTlSQPV0pp+ZzOVoPLp
	gV0kq6JkoF9iRBlM41hetEA==
X-Received: by 2002:a05:6808:10ce:b0:4c3:db9b:3eae with SMTP id 5614622812f47-4f1b76329a7mr4055713b6e.15.1790829095989;
        Wed, 30 Sep 2026 21:31:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f349a4d20bsm1378430b6e.5.2026.09.30.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:31:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:31:32 -0600
Subject: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MQQ7CIBBFr9LMWpIpVGh7FdMF0EFnUapA1aTp3
 SXq8v2f93bIlJgyjM0OiZ6ceY0V2lMD/mbjlQTPlUGi1DgoFLksi/WC00Ns8cVxFuio1wO2WvU
 zVO+eKPD727xApALTb0z02Gq//B9nMwm/LguXsbHGBets10tFyrf67JxE7LzpKATjcdDaSOcNT
 MfxAWAG42q0AAAA
X-Change-ID: 20260930-stmmac-irq-unwind-0be86901638d
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The safety IRQ is requested after the MAC and optional WoL IRQs. If its
request fails, stmmac_free_irq() frees the unregistered safety IRQ and
leaks the WoL handler. This can warn about an already-free IRQ and make
the next open fail.

Move the safety and WoL cleanup labels into reverse acquisition order.
This also fixes unwind after later per-queue IRQ request failures.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..4f3d452c3503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3797,13 +3797,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20260930-stmmac-irq-unwind-0be86901638d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

