Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A726AC5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849732; cv=none; b=AFeiS8v7FKfh4AvscSnweZaJGsRbCU6sBQUSMltNH//HMxHyV++xiRgCRKUSLivNIY10K5gw5HO7T04wJp4Mmzo8YnAhlz/ksfa+7AQB2aW1WndaoN1/CzZeMLovUX1HGpvl939z1GhEc4W2Qdj1RdtQIjBKagBPcmSEZxKsnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849732; c=relaxed/simple;
	bh=3a+AMT0v6khTMsbtA0dy9SfSCDaJ+qcU//hG18aCDQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulb4NmMAobEgqxpq/bDhEYb8IsEzIspD/mTUgeTaBZIoHF0zGCUlaeH8cP6Ejo60gGdPeB93LJC/XsdcCCGJXZNKCRK3q7BVGZoaIx5BGgf49a9ncuylvKN8rzAxk0PAKYfwVplSgr0J8KLDb97XMeYZv70twT2vOtCqL5arsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5nbRKKD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5nbRKKD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so3491293a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849729; x=1792454529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXW/owfqKGVcmAOIQp0k47hmuuHXvmL9jkkhytfXhXc=;
        b=r5nbRKKDNq5v+ZWfYRrdBoBKY30R/fHAhWbb1u5IG4TErLVR8C/Osq4gGk4UkbKV0I
         e6hTr5lglrkv8Yw9J103C1bC5M6on71GHbJc65tqOC7Jew+4+ZMKfzr86x0HDGco9eS9
         45c7zBN9ot2wnl8OqHKwhdnBLUjHa0/C7S1MXPt36qt4k6l2PnOG4y/qakH2FJ0pcDBf
         5zizgmgfsMtIEoqxnhLBYrN0Zis2w7XWrG3YtUjg/TRItQVwtA3M16aTFDI6ojvAzYA7
         vQjyt4bGhc8xEY4tR4uCJlO+RnokYTkfiU8y6/2oEjC99GzVIb9GhoQJrtIYPWT+NvvY
         7IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849729; x=1792454529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXW/owfqKGVcmAOIQp0k47hmuuHXvmL9jkkhytfXhXc=;
        b=mmzuMftJ2YsQzQ8BcQfkZKOFqaRglToIxYM/Jrui2L701aJZ6fExxLdQmZ6KKR2ZnZ
         8sK93kgQze28CfrC8eXLGqAVC2bFy9lB8/SjhAHfKz8h1ibccHPd2RNsbmdFSCH5zky3
         q2KUfKFtUWTekoNV1xcBn+dPOjz8JVJfaKwgLjeMhd8gV1IC4k1uR0KVCokHwYTo1ukC
         vdCkjmR/jvpHRYCaVXHK6Ak7xb3pTW3+nGR9iopqzNpPxheZDXS2C48JjlsxxnM4MD57
         QHk+C3G9tjQ2Kpi+DPBNHNLnYctEtAOdsEs/masBCbYgbJKx45v+KLMYvIeIl6mwOtxx
         ioyw==
X-Forwarded-Encrypted: i=1; AKwUvBxyR5AcgzFKGAsYXZtzxSc00KFCzJPFq5yABC1+VC12DrIapdGCpp8+VFCnIFCtaDf0yTpQg89PvMb0ukQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI42uOT7NVF8eaPTxBYU4FzPS4Cm5sxpjFMvPu8zIW+Dv3uOyGM
	/0S+gb9C0Bi0u4phfgJYLMdyeUTP8F+rkrBsAB9ZQ8rkcUcpnCDghTBl
X-Gm-Gg: AYBFou05P9EweUzEF2//pM3j1Cgl6Ia8bYhi1oTs9eZYr1JrokHm6J+9hosl8JxoQVq
	rtP5Nu5+ywDwgrShSRXpdP8yFSTBRgammidBbP9uKHm6X4A+sFiDrLIah9ccxZdkdbnk6BZWaYb
	5toQgXrFooI2mSAaCopZSv4hcCRGdO3v9QAloN3zZagLkKDvMMJV6KdjSzlUxLNVDNpOFMAniP6
	lLBBYeXlCfKJvrivAiUe74c3xRu1YN7H3Cxb+Wlyi6pCwoEYI4MrzaKoxJbABSJg/uXc+JYjUaK
	mQFv4zdsdYCCxJ/+pPEFDxOG7ir+ULkOe1qDUXPPfLY6/SxQg04Skn9MnNKZBOX7sDoexhmL5CZ
	IsSrmroSn6o3TuNgDDycohin3dBVU/5atsi7jlTbeY5wBt4qI5wjO1nf/goELoMWh10R+woY7al
	TVWrMCJb/cLUPCeWS6FCnWZva6M2K7eZRA5QRUQgviFogsdVayq5o0avqrdV8G6RIROE68U9iwE
	8GrFxeFAbzi0syr9qs3JQbL2Lv1G1MRgiT7nUm17/wJr6O2epc/cN6kShn8pDTzp2g+nMd1ithK
	TfFocUqaeYbW+c2gtMdR3o7YbHVoaySmLX9we/YPEOhBeNF9flRqbLdtt0OEjLxGzBk9KH3Se+D
	UckTMpebWb4SSN2k=
X-Received: by 2002:a17:907:7243:b0:c26:19de:9138 with SMTP id a640c23a62f3a-c31aa0c3392mr1079230966b.43.1791849728967;
        Mon, 12 Oct 2026 17:02:08 -0700 (PDT)
Received: from zwetschge.tail45b538.ts.net ([2a02:810d:a1:6000:a55c:f7b9:d145:2469])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm527221166b.70.2026.10.12.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:02:06 -0700 (PDT)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: b43-dev@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	Andreas Wendleder <gonsolo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: b43: fix use-after-free in b43_bcma_remove()
Date: Tue, 13 Oct 2026 02:01:24 +0200
Message-ID: <20261013000124.48605-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b43_one_core_detach() frees the struct b43_wldev it is given the bus
device of. b43_bcma_remove() then reads wldev->dev again to free the bus
device, which is a read of freed memory.

b43_ssb_remove() does not have the problem: it takes a copy of wldev->dev
at the start. Do the same here.

Fixes: 96838d61102a ("b43: Fix memory leaks in b43_bus_dev_ssb_init and b43_bus_dev_bcma_init")
Cc: stable@vger.kernel.org
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 817448e..3825b6a 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -5677,6 +5677,7 @@ static void b43_bcma_remove(struct bcma_device *core)
 {
 	struct b43_wldev *wldev = bcma_get_drvdata(core);
 	struct b43_wl *wl = wldev->wl;
+	struct b43_bus_dev *dev = wldev->dev;
 
 	/* We must cancel any work here before unregistering from ieee80211,
 	 * as the ieee80211 unreg will destroy the workqueue. */
@@ -5691,14 +5692,14 @@ static void b43_bcma_remove(struct bcma_device *core)
 		ieee80211_unregister_hw(wl->hw);
 	}
 
-	b43_one_core_detach(wldev->dev);
+	b43_one_core_detach(dev);
 
 	/* Unregister HW RNG driver */
 	b43_rng_exit(wl);
 
 	b43_leds_unregister(wl);
 	ieee80211_free_hw(wl->hw);
-	kfree(wldev->dev);
+	kfree(dev);
 }
 
 static struct bcma_driver b43_bcma_driver = {
-- 
2.54.0

