Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B084963A4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453993; cv=none; b=p6o7ykfmYl16/0TClpnLSELRskElfK7+ld80VlrJcuPKT3MQxUwW9Xp2f7b4xQcJyca3z7K1ih7UckncnPPu7Q7YkAyWtj5iHrwwCht/HU5WeaMl4sT6NrKVMmTL1bh3c+6qNCntzuCJ7pe4Bi1Gh1yR788UiWtQabzJ+1HQ6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453993; c=relaxed/simple;
	bh=Yb7aozIWbhfC9RlhVeAQwGbDEaom6NMXRd+O6Gx9Lu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYkFtjiOVhv5jwTJOxvB22BzIAZZCWRkWUeeP6tmlGh6EwpwH3P/vPMgLK35Pe6HpwdZdz8wXRdzy8mOZOBTiR0aronJK81DXJiJrXih34cD65WBAVdN4uP8WOohnvWKTH/kmFxioOzaqmDfldGBvlZI9ZPWd5Hv9yB+6WvxdRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1ZjMGuO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1ZjMGuO"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca80d708489so16030a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788453991; x=1789058791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nbtg5A9tMPTALq5JCB/R2RWYnV0svBUsA+9JJg47pEA=;
        b=k1ZjMGuOeaB0LgOoaVPgt/YewX4KhPgvNOHuKR0HdKUnL3q0Yb0TpqaOn8GgTlijze
         I5KHNKKgGwH6Aw4HXnFjKdEw0ofPEXc+Qs5/XwTitHulmg0X87tX2vi37LESIDuRkicd
         H45X94mCCJihfqjw89a51L9JXJi6rXB2bKxFzO0WdXq/ZM//wpoyfwFnX/cEjuFjiELm
         GuIuSPCOtKi+B/j1XySJJn3tGIkxbTk2e698Nt0ybt5V04QALRF877mGH2sgHvsXQZXS
         SXeIpg/dOBoomFWB9AhC0KaMOB6svGssNigXhP4gKd+0rgEKN42/ege68bH8w19gDVsX
         Fiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453991; x=1789058791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nbtg5A9tMPTALq5JCB/R2RWYnV0svBUsA+9JJg47pEA=;
        b=mAn/YYGSSsOGfy+1txQlEnbeRpfRuWK7UrT6PxdI6Citaojh6Q5rTMuLrx3b2JOrCl
         keOYPv7odWHR/Kb3JugoUJ85BE/XCpNxtkiyyxk1W27AAnucwK5PlB2FC3+ZlVgVHi3q
         Bw+kCPdah6sMEcn5egPOor/Njw4lJl4wta9Em9G6Q1YZg2uMQa7mHJW08J685l/4LzpI
         tFF4/zN4X0CKbV3OSPbHhHpMo+usPjywYTOm6Qj/1d9P/ggURsqCLC3TaZHgWxWywWn1
         Vv6cH3mIK3sxoSDQx+qVQZYLIBiQViXziZ7kIZWKAEVCS56UePuwFfZNDrPfDcmGvylM
         95hQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6TcZZByc0GsSh2fpT3aADrcAo5StPECyW8AdLnaeh481/wMrX1sC3MgssOZ66vHhaY6wbmBi6eMYtxD0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ywFsvbEfzpDLe9lgiz1e4ajS19YWpP+ibv9xMvw30/y29VA0
	zGkhcLO/ooZ4xl/WDSc28PiwOmHrUdpfi1YgCnPW7XqhZxHYa4yWfN9Y
X-Gm-Gg: AYBFou3qBadnqk13sLAHRPDS8klFf03bLGE0D9pmLLyQ51rhfX9cYFq+xGUFruqE1nS
	rE2OQbnVtPEq0rcrRHRIL0QKBlFyuLO5Mm6pikJpGehY0UY4IEyns3Q6wo1JuXy+tCeQkV/SIS3
	1CP8EOFkTE0193RPkS7/X74PNqOr7sq4CxqR8E3yFE7rdo4VLDadRobe+gHFxB9pTmwot9eFCux
	yMn2nsmOA5xCrmIsNUgZCyg+/Lor6quWqd4W01ReGOp3f9grSrcXBgQQzPFoxiCMJpVDsTx6Giq
	B1rSnOVzznSyNT4uwZQRuLQB7y77Ht7mW+mo6MsLznJqeGOVVbzI1Q8AG8ot032+BOc4Hix2j9S
	LRK00SfA13eeCkLRD6R0nKFom9/RUEymJDgt8m5gW4iGqL6fGNirhpz5KmfC4us51crmNtcWJlR
	Yj3FWU8NqxXs3FAtBjKA7SUH3u32ZoBBcUNFXsBbIO9Az3hW5LSShIC3kccfYXpDMIlz2w3dNQd
	5YgHq/lnf6nNN0WnoM=
X-Received: by 2002:a17:90b:55cb:b0:398:c0a2:8f8e with SMTP id 98e67ed59e1d1-39b087f5eebmr8125570a91.26.1788453990512;
        Thu, 03 Sep 2026 09:46:30 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm163664eec.30.2026.09.03.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:46:29 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com,
	alex@shazbot.org
Cc: skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v3] PCI: quirks: Fix out-of-bounds MMIO read in nvme_disable_and_flr()
Date: Thu,  3 Sep 2026 22:16:15 +0530
Message-ID: <20260903164615.5744-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvme_disable_and_flr(), the PCI bar is mapped using
NVME_REG_CC + sizeof(cfg) which is (0x14 + 4 = 0x18 bytes)

However, the function later reads the controller status from
NVME_REG_CSTS - offset 0x1C, which is outside the mapped 0x18 byte
boundary. This violates the API contract.

Fix this by increasing the mapping size to include NVME_REG_CSTS. Also
change sizeof(cfg) to sizeof(u32) to make the intent clearer.

Fixes: ffb0863426eb9 ("PCI: Disable Samsung SM961/PM961 NVMe before FLR")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v3:
- Changed sizeof(cfg) to sizeof(u32) to decouple it from the mapping
  size as suggested by Alex Williamson.
- Updated the commit message to use "violates the API contract" instead
  of "undefined behavior" to avoid overstating the risk.

Link for v1: https://lore.kernel.org/all/20260817092448.4395-1-raizudeen.kerneldev@gmail.com/T/
Link for v2: https://lore.kernel.org/all/20260903040049.5460-1-raizudeen.kerneldev@gmail.com/T/

 drivers/pci/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b09f27f7846f..06436a96db30 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4090,7 +4090,7 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
 	if (probe)
 		return 0;
 
-	bar = pci_iomap(dev, 0, NVME_REG_CC + sizeof(cfg));
+	bar = pci_iomap(dev, 0, NVME_REG_CSTS + sizeof(u32));
 	if (!bar)
 		return -ENOTTY;
 
-- 
2.53.0

