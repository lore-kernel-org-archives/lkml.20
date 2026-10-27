Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070490;
	b=NkjRckOCekF6h/3qLy77dnkxtsEDpjM85i7HughkHQxmYxIkpzyHXJ+7IT76G4Ac3anX
	 Q/HBwYDaiPevhZzykrpA8WKhfs1gxjJj6Wmt5RJRdi/8rfg9CNkxX3aHoGDeueENIUOcS
	 tolBmUw6FtMGKt8qtW/uLcSLca4f4ONyVdUtSGSS/cI67LbmRLra84Zfb2tY9cEAfEjnL
	 +z1QV3vjy8y9Vg0O9X2vf7o8iMTS42sglCt9f6Rm62yCOTyR+THX/BjivpRkWrchBjpMT
	 44nuhSnd4v2cqdEztk0jZbc/of+Pba2u5DfY8ezIhpvIHQjj+onqg91JDCJmkCaCkdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
	b=G8IjpCGxg/k0QKtjayEJJUUpFUvc4rWqOhrZc3i/lA6pLYT5pTryDGgNgD0FibuohDR3
	 57cnTGM3euR8N3tV5yiIBLaKs6cErwbfTAu8EeWltOldDH890n23LeG8rw7AhQqSrZTUE
	 OY+t9pJjq5sG6qVUyE2Zy3oEt+ys3MIaUfsdfs2OYCYfkdnha6xD8DhSR8+14yMuuP3cY
	 7BmNetL5/C1E49+Gq8d3iBmMzd2lcYhjhdwo56583D1R4CuTwuhsaEl3LF5df5oIZioS9
	 fJVIZTfDlLuE83sSnUJ8moIXnkalDEQNj+54J250UVEn1Pk77pj/aV9rHucfcx8jzxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T3mmvNcK;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T3mmvNcK
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9cf928dc9so2231795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793070489; x=1793675289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
        b=T3mmvNcK8/rhpm5cNcIOD/CQ5n59Gin70ROvTsrk7xbOnpt/692Iw6ZohmPlR9U9ZU
         +0AEIaXN+wLqA2Sh72WSFc6myjIbFm6Y3+5IfL/cj1DfRZfzwwgkYrSnZPPH4D9jKO6J
         4fVjbYe/bYW+IfC69xgKyaK8ZC8hyOuOKHdGl8reeH6DsjS5L2b1Ow2bZDkS1Id0kJlZ
         Al7XyCuT7vOhk+GSVN5JjrMWG8pAVhEZxCBEjlfhdYGvs/bHF2AAhpuZu76cJDR9pnbm
         sxrEfmaauC/b1VucXRe2JFNa5xoJvenuZXFqKWuOMwFTQNHSavPCJ6HaBvqTgYRwbkOR
         vVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070489; x=1793675289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
        b=UkdraXo8E9Wv8Jgcrnv/pIRPidsfVfOKLinAbjTL6EupRI+6lcUWWvS3KU8ZQchBN6
         kOcCDZimw9m9UKOoWPx5XQxT855a79ssi0YS91Dg2ZcD1Yw9tmuLeKlWAJF7k9bsu7nG
         FZUQ9bdh6ICMpzt1KCx88auxhf+QhobWXNBdRPvh65VWErErnpCyLoP8UShhKUIjhc3r
         Bl5Q7skaDtrVJ8Jsw7jDUso4g4GbDecleh38jmyhaRWr7uZ4/CTfmBNp4OG5vVwHlUhO
         3hjbzPU//NbN2OSqDMxz09xanupXKtyOeXHy+fqB4UILrVUNDtnc06UXIz0J7ajPS/6o
         jLgw==
X-Forwarded-Encrypted: i=1; AKwUvBxERWL5km1YehXJbKN3gY3RNDE8/laxXuxPIAygWRXhzl9OJLqMZo8VFoTMVdMD6hIa7br1RbLz9Qaoi8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcyw/2PmCh9NMHHEwY5lCC0HVKoARij1B14ZUVVyah7mw0wNMj
	fk9kVtJNWXObZzKphJPShXI1QG2RJ3GFbVit1mXK8EVmD1EEN8pHUiBy
X-Gm-Gg: AYBFou3z1AySgmwbJdA3k4hBo/+c8NmDGmpic43Ny321+Bcew03zPs31ir3fWrFy2dy
	q0iJBDKG55CZIVpLI7k/keTxSZP0DmU18SIe4cXfDkPKgfMDncMi/7VduUhVGDfHV1DCzG3FnLK
	b7RAIz+tG/G0+uLbf2DE6sbzwoUqInNnDM/maFgoRXQ8oE3hzz8lr9YpvHwGeZ3/q+JWz9Ytq2I
	sIb2n5FBEfxL6FgFZC2JFwIHbmg0luEl/KQZx1LSlStIzanZAJ6IRGEUaJBlkxwWhH0vsuPCmyB
	RNqLGJEupjxzlxg+ayrXQg8exxp9vz+2KLEhVhefrNoOXnJc5aGKE87zV04e96wW5NyX6y2bSmB
	bk1ocx5t/8XqNV3yeojM5BFyO18Bor4ZT/6Ppv1EWQINb6Zfy08xAYzNk5HJL8IBh+GYAgJeol0
	IVGj9X25A8bR1hYdVpC6xM2AvGw0SR6Kwslma8ky7j3NBvBP2mufCA5g2Iomz1n6KPSttTFTtEr
	w2dhLv3vTTvdrD9Rb4qFm/qZnTPycLxVMLlfFhMFPyWf6FlgBjvtQf3eU3Lg/NL08GRdtxk0Lvf
	ntjZtmzz4xhg35FE0SHC7T44BSE=
X-Received: by 2002:a17:90b:3142:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae40268bbemr736527a91.8.1793070488963;
        Mon, 26 Oct 2026 20:08:08 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebafacd4sm5767362a91.2.2026.10.26.20.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:08:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: da9150: fix IRQ action memory leak on removal
Date: Tue, 27 Oct 2026 11:08:02 +0800
Message-ID: <20261027030803.118131-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

da9150_remove() currently removes the regmap IRQ chip before removing
the MFD child devices. regmap_del_irq_chip() disposes the child IRQ
mappings and removes their IRQ descriptors.

The GPADC child registers an interrupt handler using
devm_request_threaded_irq(). When the child device is subsequently
removed, its device-managed cleanup calls free_irq(), which can no
longer find the corresponding IRQ descriptor. As a result, the
allocated struct irqaction is not freed, causing a memory leak.
The associated IRQ thread also cannot be stopped normally.

Remove the MFD child devices first so their interrupt handlers are
released while the IRQ mappings are still valid. Then remove the
regmap IRQ chip and its IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/da9150-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3..1b6dbbed60e7 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -474,8 +474,8 @@ static void da9150_remove(struct i2c_client *client)
 {
 	struct da9150 *da9150 = i2c_get_clientdata(client);
 
-	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	mfd_remove_devices(da9150->dev);
+	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	i2c_unregister_device(da9150->core_qif);
 }
 
-- 
2.43.0

