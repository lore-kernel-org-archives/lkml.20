Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E53D3D1B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674159; cv=none; b=f/jSsXBHjl0exEUEIxO+xL/MvoMqqP2+9VPYYe4g98cldWBCfIkQgs7H9QAcIRLKlLc84u08Z0xpLQAVdy3opxufZ4s58uKqzy4JhzXsSPsBIZHn9DSh8L85RdUr1OuJXYIOPFiJbrnUxKnH8pk1EcmCkQ9HBumfMjBUkZ+DhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674159; c=relaxed/simple;
	bh=uhUM/M81d4CXxPFscOxT5I7bnlNnmvtxKPyzZsjpw54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYiQMaTB7vTc2lZArg8+JmQtA/LEOBYAEWeJBTNCI80msQBeZxuIeSPqD7+4K2Bu4ovA7dgx8uKGtsIeFiB8xxAU2q5pu46ThW76PCBIg1RgNbnj49Skb+5OW8ZWQdecb5gyU/bqpOxjLy+An/Dj8uPhBhWeKbDOInR9D5shKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epaa0SpA; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epaa0SpA"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso56978885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789674155; x=1790278955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkY2/FLZ13vCVvKQ7BjBhJgp4fsJ4DBBdsauFSxn6kY=;
        b=epaa0SpAQ/f9XlNGGIUuEqj8OQnsjH7BXYyc+bqM4Bqay3bgBlFJUscWrEwDEDDQUq
         1Brrd/k77XO2njTZk3spOcIunAhGLpTyT3NMUIm7ksFdfkPnNZTcvsfC0s/5cWb+51Yj
         axyGHM14lxS1UJTM16TIB71J+FaujhQHOxCHdguCkeEEJH+bBu3jTX0Bc2lzlSu8mXY2
         H7K/eMJ/KSx7ZYAri1TRsnj9xrhKdvVnfzpB/DTf0rsRJdEZX9BkirXaNL8VVjGtDUxv
         eDB7PtuEHMJvek/NpYJaI8EAdGpkW5Ia0r1eDEUjxl5R7BvkqZjBt17O4OQ33oz2nKVA
         Jqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789674155; x=1790278955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkY2/FLZ13vCVvKQ7BjBhJgp4fsJ4DBBdsauFSxn6kY=;
        b=d4sdMcVzhQ36ZfDgvaBnoUnUzSg+kunXoawuzRypMclP0BT2LSpIyoN0pjuL2Y8j2G
         Sx+LndmtSmiP7j63vjL6FnCQVUB1n+Hq+W0UiQq7IKa7JlLuIYruuArT0zxql2qTNiTQ
         ytmGBsqjia+1icfNoEhhukB/yLoD7HmaBiW9Mw+ZVqQ4hcmEyixGYAPOi0CyKXg2PRl2
         a2hCXvNwhv5lqv3RYbNOcfYG8DBDVC4x77cB4VZ5H+5++lnk8ZqItDR5BFvqZ/8LDhkN
         2Snoee3LHNImqiHltY/bXHUZKFJhdhu+npqhuGn1IWOUxUePCYwPxv/oW2CL7udWVkYs
         4EvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1qYYLzEhfnX6e/6J6Z9nvTMz7XPUak4ILZ35UgXDB+nlNvjUnwCZI6TBNH8QjPNQCYTv8jyiadhJBbD0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOxDQCHlHLy4cFJi3kQY5BZosZ9bKNituzQSplAPQ32mbSi9a9
	HaIVGw4cfK8ZEbm3ndBCXSKyxbaL8uA1TDw1wJEeDIzxOrqjjUPtKykkvpliVBLhzg==
X-Gm-Gg: AYBFou0JhsRhhcmE09IjoMvZrZJs0ygsbJCiHuBPdXP85NiQSA4Ej7KoFBAOt0GolRI
	W6nnpVc/L09E2wbCviDHkyAnbXU/fyMN3F40SJzDJ89q7ArzEEj/buYLSIV0hAV9SN+CSxqTauO
	+Q2i/4Jba2YGJJdEDUAIYYK9dYa+hwbEQ803azMQdaH8PMz3LDA81gInfVkPtW7ax34qF6HtOdM
	GPRigS4KlQzhhtKIi5RQSTGxeC+9G6ciQovY4vW1Uc3affd4+BjblbKu+G7Nv8fcjo5FpChls2u
	wfRKDybc5Y2mt2l+DOl5YJnpFtUqUbB3R/It59hKK/6uezG3L3EoQb7lKwAhyLkC3WrYL3zofYG
	ABmdtj1QsEs4+StxgvMn2/Fcz8j2v3EJwJJTHay92006uKo+DzusJLcs2AFH60oN/foStJZO+Hc
	CZTH6RyFVsyX0VGzMgMbfEp6f0OFjXvGCGX+itQk2jks1bvJ2ooRXzg+Mn9zpYi1x8naw3EHHPv
	OYeLoCvtYXbUu8l59HWaHH2g91DFacKdlUcxi6XgqwBh2RKrFyWPLT6Y10ht1LR634cbxDTeNx+
	IqLSviPiX+bX3U7tj4CdECoBW8qsKbejrGOs
X-Received: by 2002:a05:620a:438b:b0:93a:1b82:4962 with SMTP id af79cd13be357-93bb79b5b59mr1444714885a.47.1789674155573;
        Thu, 17 Sep 2026 12:42:35 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780cfa78sm524335685a.2.2026.09.17.12.42.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:42:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] NFC: st21nfca: Release the I2C IRQ before freeing its resources
Date: Thu, 17 Sep 2026 15:42:33 -0400
Message-ID: <20260917194233.65921-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler accesses pending_skb and passes received frames
through phy->hdev. During removal, st21nfca_hci_remove() frees the HCI
device and the LLC state, and pending_skb is also freed before devres
releases the IRQ. A pending or concurrent interrupt can therefore access
freed memory. The HCI probe failure path likewise frees pending_skb while
the IRQ is still registered.

Release the managed IRQ before removing the HCI device, waiting for the
threaded handler to finish. Also release it before freeing pending_skb
when HCI probing fails, while keeping earlier failures on the path that
has no registered IRQ to release.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 68957303f44a ("NFC: ST21NFCA: Add driver for STMicroelectronics ST21NFCA NFC Chip")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/nfc/st21nfca/i2c.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index a4c93ff7c5b0..894eb100ab5f 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -551,10 +551,12 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client)
 			       &phy->hdev,
 			       &phy->se_status);
 	if (r)
-		goto out_free;
+		goto out_free_irq;
 
 	return 0;
 
+out_free_irq:
+	devm_free_irq(&client->dev, client->irq, phy);
 out_free:
 	kfree_skb(phy->pending_skb);
 	return r;
@@ -564,6 +566,7 @@ static void st21nfca_hci_i2c_remove(struct i2c_client *client)
 {
 	struct st21nfca_i2c_phy *phy = i2c_get_clientdata(client);
 
+	devm_free_irq(&client->dev, client->irq, phy);
 	st21nfca_hci_remove(phy->hdev);
 
 	if (phy->powered)
-- 
2.47.1
