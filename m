Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D3368D4F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585595; cv=none; b=E7JMKQjlq9DEaL4mOstUzD8Y4Ni/zc1YkCvFr5vJqEPEJpZR+vPRl5OCxx9Hun6ZgCAStbwHe2C1azVheQ3oa5jTWfzZrjHr6U/m8sRG19d36lPDyJsB2kzvDO3ojMKyrIuRF44VfOlWfIRCOU9464+O0OrIZI7/jrl5zGRTgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585595; c=relaxed/simple;
	bh=sdzykupViogycc1IkiJSYzUXd4kKXkJ1zNbTv9tTNXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=srOIKsgwJwcPb4l0YUAb8MbOzNTaS6oIQGu5ZPg0qj3mSwEuSc5y+ppxwGMjdVObRmZY2qZuIsWj0muWeDRI34sbWNBip/5mVa7V0ayNYHQVSLaDjJoOmM8XzxJcsQxgjSE4jnbPkr0Itj9KRc12fr8JfEYjEESfV6ElC8ZRFSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGOLgiE5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGOLgiE5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so15317645e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585591; x=1789190391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9k8EBOfGDuJtIXvKucG9Bdu9gT/QCztUqra4D8q8UqE=;
        b=bGOLgiE5F9pfVT7jjNMkZ4rgXS1c5mqopVBj64sYDfmf1rfjcYKg0VwLFb97HaDXi7
         WMIOYa15bK8LlBy+QFfcSBT09UKUMQwVxobEgk1xoBed1ZlrtgJdPj3ymeJ374oNUqK3
         /Mc7noKsc6Jif3RRmXR9gGcmhad6NkB1Bu4zB2CUYIcTtyAZZw2sg562GiS42t9NJjVK
         mN/LbmXmyEcT/t2X3oKqxerLBfM4DvCrwJEWpwlym6y6IPjGwPs6aRRko6s4MbSHhcrL
         bz0Stqam3HdHFfGBdKvYAHi6E2EsI6aJAGLRAyXSjimCIDpsqNd/vR/4SblvPR71hOyJ
         2Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585591; x=1789190391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k8EBOfGDuJtIXvKucG9Bdu9gT/QCztUqra4D8q8UqE=;
        b=q2De5z/SkYIPDMH03piVPn9lOjVwbYstrGX+wUVAg9fP6WyeEsOmMuw/ApOIkHh8S7
         xQXmxtegzbEeQcpovHojKJgWwkriTYxppT7XIRfCALMEOzBe3DIvJZN8/3TRTMHJqHT4
         uB6+9pcidOVlSvSainSCUJRy62t77WHVgHXlIfVYBk0OWkTe/Eag2LAjuVw6vQovfGTb
         23ZxLClYMaollChFwshobOuT9t3NHPSUcVd2EryVkXvuk1YSaAWxvFisGAhsl4tOyUt8
         dXmCxf2spQHwD6hJe3FQeMzNRMvFpsBZpGLdltr303a7TmmmpFt/dZ/zkCiPuFHE3GTZ
         JBWg==
X-Forwarded-Encrypted: i=1; AKwUvBxim7G9ovSohUoTO2oZOBEeJ2B+XE1NjandkZ8F6psUbhvQDdhgiQg1mBzH+aMXGa5NfSehrGaUJGKGVMo=@vger.kernel.org
X-Gm-Message-State: AFuF++nyOGKi9X5hzYO1ihp0khOJf5slG9yzNGvO8oX94E/l9OxnPCj2
	Jj3w2YJ883lCT9ExYgsDPOL7K7pCIgf+53eQmYDNwu0tV31YT/KBCdi0
X-Gm-Gg: AYBFou1ob5Y6SSl7a21wAsNk0bgq83HI4fcvE7k5ic4Eo4WgUsRvd6MK7InMtXzq4Yq
	UXN4hzYEsMbc0Wm3yZrE4YJYJ7x5Y4llY3O4qZXgfYKO95v5ZnATc7d2pXDrgnCNjHeJKq8YQpT
	ARntTPfzft3f4PwlwJEMNMTBtejC+XA/hmxTmn8O6mioyD391msP5Eu466qZJJUt749ypqpReFo
	lM+T5CTw1padkBRK6gkDv9wHQZ6PlwAFZiGSmUpGE42slUs86XOpjumcQzOw4bjG8PUm/H3+Cz8
	aI2voQFS8jyVEmBRvl5AMprpluu995Ee7vCw/nPVBv0EPsx4/f8kuxO6blJ4jFLCz3z7nBEz8XE
	fKX4EVPKGVlXXfGr5wKIH785ITvgrRvN8RgMMOuLGXM27ocLOyUGkcUDgQb4UaIAtZeiNFeYflx
	O/V97SEBdEHjEDuquFV+s7wUsvMp869FaReXekFV5moEpGoP9kCSNrWAZGe831Fu2jY3ljh13hN
	vxEjC4ju5mTFcGTbCnK+pr7vDdn2V6QXUDp3IImB3EnjuX9tTIAgeqlQl27BjKPALdUCq9ablk8
	KaqHohMbWZw7znrdK/DGGXBY6yDH5OnFnVyInRZJKDlmFxdSLxcMrxljg8T7ZIcdWGI=
X-Received: by 2002:a05:600c:3496:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49cf7fe62admr181581535e9.2.1788585591062;
        Fri, 04 Sep 2026 22:19:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm203614475e9.8.2026.09.04.22.19.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 22:19:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: smc91x: Remove stale documentation reference
Date: Sat,  5 Sep 2026 07:19:44 +0200
Message-Id: <20260905051944.11604-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smc9.rst was removed with the separate smc91c92 driver. Stop
pointing SMC91X users to the nonexistent file.

Fixes: a3fb9a5bf660 ("drivers: net: smsc: smc91c92: Remove this driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/smsc/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 66bca803b19cb..99e22d3e16ef5 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -29,8 +29,7 @@ config SMC91X
 	help
 	  This is a driver for SMC's 91x series of Ethernet chipsets,
 	  including the SMC91C94 and the SMC91C111. Say Y if you want it
-	  compiled into the kernel, and read the file
-	  <file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst>.
+	  compiled into the kernel.
 
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want).
-- 
2.53.0

