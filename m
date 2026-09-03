Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E6D423EBA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431259; cv=none; b=aPqWHUu35MvebgcEpJgIKimbnrY7GcqN2E3QBb79YPJ+f7D0jvSwkJkILAHcAd4JFtMYDWd5aD6TG2meB7BDQdkOoY/v6k99aM91sPDvbCVhSMmu0i//lUFxVB2OcdVq40o6qd9op8snxD0Vwafbi81F275S7b8WIin3xHfDKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431259; c=relaxed/simple;
	bh=LFkbEPJMXtlKlu8k0CfjzImXNJSiYxotiw5JDji/Bhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQ04ztksSF2sRQGOJbDXc58ljRA4UhY+Rhhvlxfwrg1bhCLfk+Cm6iCCGReRWFY8usqM8H9jtaIfC74bmIdMlc1i8tdNgG1U1Nz8KwO7hXjZOR2VZBnxVqyHTqcpSto3Bft7ScE+1HWuQSBkYWxLH8zyV4EpoOfB0QtXo/159fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXO7UroJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXO7UroJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39927410578so3855132a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788431243; x=1789036043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CQkGuc52z9Az9JmaiqvdXOtnpX3mU1OHrbdWMMw/t4=;
        b=SXO7UroJc4aGkQcR9AmFBP1bOR/oVEshJwuQJG8xn2t05oUpZnZJ2YClNeuifkIAd4
         BOWXgPj3esln8Eu+oKREC3Pe+0pXanlOVuRRN/hshABabSSkceDSI/PKtBJSglokAvRx
         tMDQXmVw5sGfvlhBQwygAp1YF0UT03Z5JIKUXLWFxSnVZ/vnbj7KlH+xgzx1bekgzMtk
         QxRrENBqDBB93s9i+2GUtKVtVdX9XVEMmF/V1OBY59TIB7Sy/FEHRzdvn/Gu5Orc0NLl
         AzVtAoeqMXp9GnzziLJk6aC6uwbLKb3/Wq1RN3CddfM/Ma/206cjUk3T+FKt4xK4iTKT
         L7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431243; x=1789036043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CQkGuc52z9Az9JmaiqvdXOtnpX3mU1OHrbdWMMw/t4=;
        b=Qc6la9hm2ohxeMQYUTpD1116JgHkZ4xbmWxp74bHRM81fv1qE0puAtQgW9t9Zer3Rz
         b/WjFtWMU4y1gN/XOvVao2/RgzxP0uj2lIU8AqJM0UqSo5EC7hF3TLyc8yYNirEoKR93
         pDBbsDuRWpvufRK9dW3lajZy3dQ9LI01ZOwwqeI2URDWXh9mLKg6/eMfjtf4lqj3kC7w
         8DQmWDPr7SgFeC3Rjh8TgH0lyDr5NRp9qANsN+31p8bWXFNE8kKj3M9UnImr0C8HJd+U
         2TMN6MnqNaZtjC0gSdtYtRdzEZ+CijU0AWBlaSWzGCF5V4MIs6Wazym3ZRVIbZfZ4ikc
         SISQ==
X-Forwarded-Encrypted: i=1; AKwUvByUAolKCof/d7p64GApZDKcUYCAYIVdN0v3e/ZfdT6330tenosQ3ITr8bhHVichhf5S6N4c38ZbkTICBic=@vger.kernel.org
X-Gm-Message-State: AFuF++m5gEO6uPqVznhgMIeZuHNAo4Pw9qWsuVU9hDa+uMYLHyMb8qIg
	uPB0R+EF6hTJurX5BcdFACfKmUoag208CDajSr62SgMaxpLvnJ/aXBQc
X-Gm-Gg: AYBFou1Qe8OF+HQrPe77O3X9cPLdeBTnqjw9+7+8iA66GiVUPftAQyX3SaTt34clozH
	0Vrb8BCtzNY7rCBlJruh3JueaXU3xTur3CZuhKPJe4D8gKHUszV6KhDzvrLlucBCF4kC0G/W1Rw
	gNi1T9vY1RKjGMo9rwyd2zZvOxyoNu5sNdfyQeYrcktjC9CqFslzme3wnUMMLgjet6LjGGRTcQI
	YgiZfSUcgsjUlfuHvt9veuz+lDt5SoFuS0wJNUm6k1D2NsOP9cAUdf8+A/AZmS1kf0qHpqV4U2b
	juUb8HKjtC38c3VmlrulaJkJej1zrU0K8q2Kzn/27TsyDZd32Bf/gImZsUlNZSeirkkp/SJZwsm
	2TRBUWczksnNIvmV4uRYxWUjIfZ0nHhYCY2Rs5/WxoGnx/+NOMfA0/h3Zn2znNJMiMeNYShD6G2
	BHNif04EEHhMDLWzk1DNPvVPSTZs7tdMU2+WUvcGrzvwZbeS0m5ZfEvUlk2r8yWsF0tLyiitekl
	sCLZl56prSXmtWfz5lrZRyy7dzyTXBOwZP6hJXg2YG3LjQymW7Yoie4CBluUjiXVZq/3xj2VLaq
	VDoOKAQZFVAxVBeD
X-Received: by 2002:a17:90b:3d84:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39aedf7cc2cmr18831032a91.2.1788431242712;
        Thu, 03 Sep 2026 03:27:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm4723578a91.17.2026.09.03.03.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:27:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v2] net: davicom: Propagate wakeup IRQ errors
Date: Thu,  3 Sep 2026 17:26:56 +0700
Message-ID: <20260903102656.370039-1-phucduc.bui@gmail.com>
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

Also propagate errors from request_irq() and irq_set_irq_wake() instead
of continuing the probe after the wakeup IRQ setup fails.

Found by manual code inspection.

Fixes: 2e2696223676 ("net: davicom: Use platform_get_irq_optional()")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add a Fixes: tag.

 drivers/net/ethernet/davicom/dm9000.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index b87eaf0c250c..904b859f0a63 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1511,13 +1511,18 @@ dm9000_probe(struct platform_device *pdev)
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
 				  IRQF_SHARED, dev_name(db->dev), ndev);
 		if (ret) {
 			dev_err(db->dev, "cannot get wakeup irq (%d)\n", ret);
+			goto out;
 		} else {
 
 			/* test to see if irq is really wakeup capable */
@@ -1525,6 +1530,7 @@ dm9000_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(db->dev, "irq %d cannot set wakeup (%d)\n",
 					db->irq_wake, ret);
+				goto out;
 			} else {
 				irq_set_irq_wake(db->irq_wake, 0);
 				db->wake_supported = 1;
-- 
2.43.0

