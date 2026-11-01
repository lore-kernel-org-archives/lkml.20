Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.158.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545397;
	b=1cwfpsDTtD0Ucw4Qe7hH701qa+A27bm4J6ZPtitSkpCGtLuWKAztISDQ+RAxBHrvLtP0
	 UOE3L9ZiULGMGHUFoFsblZy2K+C36+8sBzZTaRrMAjh+a/e+FMXvH8PAb4lHPzXIa7jAf
	 cJOXtvDmt+flGwc9lbdVmCz90Da2PR9UsYewYSSygbliFhOhtJcbLMqm7+sw3oZaTO359
	 mWEkkWbkfGdwZqbuAAwEUz8UWKZP39wohFtOwjri3C6g+OkhhaymP+YdLLVQtQdY29Ryq
	 H6zuJ6sKzHtOmI76FC38scHb5/jm6ar78+m+Bh/+v1Eah+8f/V6dmVo9yosuR5xMb0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545397;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=PeQatZuCTe50g7/M8SkAi3VgySytcqPBSX9TVmXkD4E=;
	b=3SN2X4hwEgw3n4HMTCrelmTDf7Tc/d8vIDgTOzOM1Dso1HNWmoUMjznVwB9Uz9hRr/Yh
	 m+jA2KNYV2gBom7kCXdpQQrsN/UveNEZ/LwpbZv/p1pqIutRzScqTNWczCeJxNsUqV49p
	 nPOOuaM/j0cgyC7Na0o1NTUnGQD7n9WBj8RYle3RxVyTUHHXr2a/gZJR9H7WUrBKUbKwe
	 /13seqHHMxoJnYFg0GZeE9qM/cVJCNqZt2MPwVWdIM0VZBg6fW/uJBpOBSVpLylWdJ/RS
	 0lp1wOtbsEoWkSQtqRY3l0LukajJLNqB1RjSCtEuC2jR4ASIGDONeNxvT+lokNWX/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=eK6FL+We;
	arc=none smtp.remote-ip=62.149.158.117
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0198606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0198606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=eK6FL+We
Received: from ubuntu22.homenet.telecomitalia.it ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id NX5Ox1MB707TYNX5OxsyUT; Sun, 01 Nov 2026 16:03:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793545386; bh=4f2/gDpALMyB5b46KLMadbqzMq/daeZK3ycde92D7fI=;
	h=From:To:Subject:Date:MIME-Version:Content-Type;
	b=eK6FL+We+t+crs08RH2oRdDX4BsDCTsJeQj9AaBt+zpoT9gdPbH5N3abkxpZ3E4eJ
	 /u3RZ/99egofCBlvB9wEwhog951ECcFBjDjD+ow1rrxTXMKZjYBA7gnlDcY9bZlvRv
	 4djdbthOomtjT3BJ1uTo/7qNzJ98xqSY0iEfbwlnDsFbApadliLhp6xFhQ5TtEAHxC
	 KZQLru050/W2Q5ccVLMNeFj4JAg4pchVbcGX9+XIJ7sGF6eKFjwDTc6qWoGC3bYGNc
	 MDlQtAXn4asbwGIg71PoYaHez8NDY94cSMfydr2kTibPpjrAAKdGmBavds0x5tx/t2
	 Hqp+CHTqIDQzA==
From: Alessio Ferri <alessio.ferri@mythread.it>
To: johannes@sipsolutions.net
Cc: zajec5@gmail.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessio Ferri <alessio.ferri@mythread.it>
Subject: [PATCH] MAINTAINERS: add myself as a bcma maintainer
Date: Sun,  1 Nov 2026 16:03:04 +0100
Message-Id: <20261101150304.1746-1-alessio.ferri@mythread.it>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMCLvV35QuzC2E/w3OB3oF669AcR8OkAU+ihnpWtUHrkn63DPsrDG8QCfbIxJJrLlJGmrhBmyGrJ47pFfkJ/XAalXIKV3wSWdEAH8K1wXeSsb1z/bzad
 MJvcqvTxnEoJhpKEaL0F2JQ6IarpDJazTD21vPmF3OnL0eWgG9ETtnDM+KoEMpCaG1jZPwrRjeJWJz6v3qDx/tBc+vaEKC2nB4x/4a23UXiHnfuSJRIQsRfI
 ZT0dcvrn6MFjO8doXV8AWwJcLASPcwBce82nslORhlt55BcPBVnnU4XADBhfCyAh56/iuf9LO4kUkLnNXQgGDGdvVVdVMno62EaqaX21HYbuz8vTguzH20Ca
 Ja63i1KNZ4RZEhoX35DhQjEefh03NQ==

Add myself next to Rafał to maintain bcma, starting from the
BCM4352/BCM4360 support.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8..e4e5bce20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5556,6 +5556,7 @@ F:	include/dt-bindings/soc/bcm-pmb.h
 
 BROADCOM SPECIFIC AMBA DRIVER (BCMA)
 M:	Rafał Miłecki <zajec5@gmail.com>
+M:	Alessio Ferri <alessio.ferri@mythread.it>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/bcma/
-- 
2.34.1

