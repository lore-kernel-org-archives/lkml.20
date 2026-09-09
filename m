Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E22363C72
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929895; cv=none; b=NadMdERnwMtWAgRDePGRN6a54TkOBe/u9ovo722oUs2kost/43KBmxO7yJpL+OPNBou+O3F9CU+N7kGeAc2XH631GtnDE6JDfMJXSqTt481hxZQsevoHuZVXeTI37GmjHX9si+yLheuSVmkdmxfjNh8i97lA2O8EJyb4FtWI8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929895; c=relaxed/simple;
	bh=xV2CxxpHiPwlcqAHa0fSPbXIoxKcO92bZb06sqkypXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdiJa8OanSLT1VOfLVAsgAmQrxK7DL+AyptB0LbMe6SeK6UVtQzAWeEgVucVJpA//9pENBunFRSMt8Hg1He3pGShzx80jW0JOBbVdKU91dc6DQOeRjG/h87E7GQg9zZkSP/3fT1zGEx9dFu0bYQxVZ3ZVXf/T6DIXo9WIYQwioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz5r7WVH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz5r7WVH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so598388a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929891; x=1789534691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MR3MzU2Zp5iN0UaB3/KxSwNcrbqRw02veejgAfQ5Gjk=;
        b=Iz5r7WVHGeCHEAd05HD9KBvQNTPYc+Kagp+SU5HjXCUGvArDXMc9J4ew7BntrZE9SN
         H3KHgBFSQ4y4UJXu6vcXXjwaQS6+ebrAVh3xRRsDoh05n0SjfE1V8Yf0NcI6GDoB3Skj
         cexnIs+w0Z/McLZRWEG884mYate2mdp13Lj25MuoINnLJvVdE0A+Q5h9pMyDQo7Tf6qh
         zuVYorqOZa7mQDSmuJetjYqhdWZSWuvFiWyDswHAHUPKB57sa7U4FTHGaVO//VhbR8FB
         DQrpik7sfNq5bA5bjH/pPRYYJZbQQXIT71iVBsh94lOJ2S7VoByz7gZtulH8BUkUtubH
         0pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929891; x=1789534691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR3MzU2Zp5iN0UaB3/KxSwNcrbqRw02veejgAfQ5Gjk=;
        b=OFMQmdNlt+argyD4Qx1//H1Ca705aADh+dVxtccaJeHwwg7scMObSvIeX6+zD7YqjP
         Jv+UWIvtj4vq5n40t/Xj6VI/QI5vI0+00arYHYF3WczX3LVH/MXYKFd+akH0d5CCOX0D
         +2yAY5x4yWFoZcvN6tXnkwWax9lY2sFMzuqqq9F3ebHWbmB7+Jj5MuB1uwZb2gzcxdYw
         Pwnd17ewAmSz5vZLBuyZXg5sDz28NzXCmG2dyUdOAWeFVf6qxJE/wLSG2Rdv+hXqZZLD
         JxMlJ+IVhCzRwqNwVIOL74VsAgtX2ISgkRWBR7c6ux+N5FxIy76bNmagV0UUqo8CZ370
         jA4A==
X-Gm-Message-State: AFuF++nvxecoR6jy1qwP8z12wh2mkRIcBqzE0jaHCiiiga9/bKO7cRpv
	kleHZbZYrrXJaH/lp2YM/DfVXD8mZCkopsORdBHkOlo3t+Dpc1IaJalm
X-Gm-Gg: AYBFou3izIayCiabwfqVM7b6WTS9cCBnDvv3whU/eN1wRd8MbUXuxWgabLs82iX599x
	QuVqV2a5ZyJVJTYrxXHBJtqG4Ubx0P8GLkx4wCYAQLJEund6wKDWTjE7Ca6PS89DaIp0z6gISz8
	q4xoV+S4rHPmb6uJBWjLoqCdNAERwZuDGeU13IyqqzXXFYdhyE+/9du9m4FYeP0nqqxD9c7Xzrj
	BxmwImtdVHoZmiSg1by/jqLYQoJdMQmjcxG/vaAFMrjRBXAk1CEWTm4cRN12yJ3qaa5lQm2b7Wc
	w22hVwJR0p5S5gTh/FVeEUIP3fhRabu8EchG0nRbQCq/JmfNM4qUaLgL7ntkZcYO/2dWaCiUrhc
	7intpNnPjMlhlCVGdXG/JSflvup0+EdEBUKsCEWORb++tC4s0QYsc5Zu+X4MDvCBXSSGjvGXNFP
	SAt7RQOLRrZ4WXBwzxPSgdhXF6LroA6SuE442E+F/eBt3UWgCrDtLuKDck5dd986xqwsekCxOn+
	4ZR76DzwczFWqLpQezKr1KxGZola1LWtemERu35TPBGYGSOwHYh+cpcgnjdBB6fUD4qyEdFpvtG
	AjXwjoLHC0Y33AA=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr5568713a91.18.1788929890882;
        Tue, 08 Sep 2026 21:58:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm28999461a91.14.2026.09.08.21.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:58:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v3] net: davicom: Propagate wakeup IRQ errors
Date: Wed,  9 Sep 2026 11:57:37 +0700
Message-ID: <20260909045738.16705-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The wakeup IRQ is optional, but errors from platform_get_irq_optional()
are currently ignored. Propagate errors from the IRQ lookup, except
-ENXIO which indicates that the optional IRQ is not available.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add a Fixes: tag.
Changes in v3:
 - Remove the goto statements for the error paths in request_irq() 
   and irq_set_irq_wake().
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/davicom/dm9000.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index b87eaf0c250c..e294b365eb06 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1511,7 +1511,11 @@ dm9000_probe(struct platform_device *pdev)
 	}
 
 	db->irq_wake = platform_get_irq_optional(pdev, 1);
-	if (db->irq_wake >= 0) {
+	if (db->irq_wake < 0 && db->irq_wake != -ENXIO) {
+		ret = db->irq_wake;
+		goto out;
+	}
+	if (db->irq_wake > 0) {
 		dev_dbg(db->dev, "wakeup irq %d\n", db->irq_wake);
 
 		ret = request_irq(db->irq_wake, dm9000_wol_interrupt,
-- 
2.43.0

