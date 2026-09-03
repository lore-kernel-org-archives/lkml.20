Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193E37F30E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408060; cv=none; b=nsS1Nc7/KbI9/5xH3SHhCzZssbI8+DiOtDJUT+Fucijso1FbKuQPs5Etv+HQGcWpW6NV64+9p1xmlos4UgHtCoUK6GEbkbH20J/S+EM1d73TzAkpK3qrtiJkxyvm7+Bvz3ojlREHdBEFafn97x1whR4J1Zs8bTQuVZEHc5m8VJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408060; c=relaxed/simple;
	bh=TnImqjW8TcInoI3ORtw+3Y6VYINgKHJTYPIbwbTyVzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHkFvzM6JVUHJE4vFHw8OGM2tOhICMZjOPc1jgRO1QBqRednrBb1kxqxbW1vbzkSYgVBpmo7Fvlnk2Fi/4wNGe0nyTyhDbDFZUHAPsXeBfeSHKYgRBECB5qgAKOJFGxO5XrmBHVdgaThfpyNnGFjjyv58cyiBu3oIYtrFlaugNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrxKBmD1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrxKBmD1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso12245325ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788408059; x=1789012859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKQr7/qeF4NbbcRbpSyy8OQJWHUjQqXu07B0Cb4xDE8=;
        b=BrxKBmD1EDCsSuShG2xaFFRLsmKFqrBgxK3cUbc1uhO9OUAMW4AFKQ4YFNWLJfPxXr
         GcuKX/2xREr+LsUkTCZfrlAElL38dXvmm3yDLNsHveMFwj2Yxlxf3NgVsz2bFJDDbUNY
         lyQNKqEfI9M8fZ03CcKp6kzk+mHl9vjfrzjcaNMpb76lsKIzPxXcBREt5jGEVr/EIU0X
         H3WUTRzFpuuzj7dDjJMTQp35M7eTGelRM7zsLM0pqMu3ogVLweTVHlxfX54qxnbxbRLZ
         0S1OoAtVYR3SszKNPAUm0bSqP10BQkZ5jRxIjfxXRtUtcWEJwfSV2O6sVw9+QZXc2rhs
         NeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788408059; x=1789012859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKQr7/qeF4NbbcRbpSyy8OQJWHUjQqXu07B0Cb4xDE8=;
        b=TpeoRQGJGlToAhOMZZa2O+GX3nhVBqRKO8v1e2CbCjixaVhhz3p+OZTl4dpsaqQ9xv
         ulKV1+MXaBZ17n5SD8pTaCYlYY9GNdTY6v6sQreB5CbZWZDUY+UCdV5KLnfdg8a/3lhc
         /C9jWjIzD8fzIchvX2lLWHTTgAVOK8v9F2ezWur90rwZJGQuQOBtErl3n/SipJ6FlJ7l
         MdDXow7URCuJSReozlRiHCXCSm8EcPAtLHTkAVyyMML/KlI8GSgLG7FtojADEUCy1pp/
         HbtUvAKXOqhvuFTN1CYZTln6l7gZclh3R5RUPkf3PmUDHb3Fxlx+gKV/N0S8pE9vR+qZ
         TikA==
X-Forwarded-Encrypted: i=1; AKwUvBy3QbizmmMmGv1PzDRWGPRrqr95cV9/bh4hkqfwMHFkQGgYD5aZKA6WUg+F27IPxOP/ieuhqATJx0lynbc=@vger.kernel.org
X-Gm-Message-State: AFuF++n1GmlLYo4wsTkSzw21vIfNksgtFFFE4cnbhwp/pIWjty55GtBY
	OGWbNLrBi6hAYzLDPn4sMx8PeivasVK/vIilqVQwnOwLpY0KwMI5y9tL
X-Gm-Gg: AYBFou0bmHUb+1rU8yzU4BknpRSG4fXBKtaecPYdrQgLmAAHWLR8+/7NmX0iFnZoobQ
	0m78+iLJQ+fet8IVqntUBJ7iAZksEW4kXKQTpo/v920rOkHC23GMiaXPwc5CYrYhyjuGPsTHW09
	iBoZqexalFgzwqamLnOG2Use1it7RNAn4yIcZbdamEaRgrqJ3IyzN8IJjkD52aOO5VIkI2/mAuT
	2RTuwnAAK+e7DZEqgp7zU/Ii3P0nF8g8zjmrxsA0Hzg2dKk4zJArJ8V711EAzZWnw98Wtir5LVd
	MT2yB9QiohYqcRmCz48gY7GXJnHeiEcaeKVEG/cdIjwLcUqjPfbZHVdVhyFJkzcdZpc5Diud+0T
	uAW7yW70el20CBIGy/wmVHTOd8GdoPRJs3qDnxfe7xQtnV/qOdB6TczrweTReVAewGtUkLi16PI
	OlQNma0RTLX86WT1Oqw7G/BDCvHc5WiNWFpjh57Vg3A5tBe6favp1sQ/yOFvGi9ULWtB78eVjoz
	LewOSu3eaK6niyRuw==
X-Received: by 2002:a17:90a:d2c7:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39aee084513mr15049410a91.15.1788408058395;
        Wed, 02 Sep 2026 21:00:58 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534c324sm2597713eec.5.2026.09.02.21.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:00:57 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com,
	alex@shazbot.org
Cc: skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v2] PCI: quirks: Fix out-of-bounds MMIO read in nvme_disable_and_flr()
Date: Thu,  3 Sep 2026 09:30:49 +0530
Message-ID: <20260903040049.5460-1-raizudeen.kerneldev@gmail.com>
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
boundary. Reading past the mapped MMIO region is undefined behavior and
can return invalid data.

Fix this by increasing the mapping size to include NVME_REG_CSTS.

Fixes: ffb0863426eb9 ("PCI: Disable Samsung SM961/PM961 NVMe before FLR")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Changed the commit message to avoid overstating the risk as pointed
  out by Alex Williamson, to be more accurate about the actual behavior.

 drivers/pci/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b09f27f7846f..ed03892cc960 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4090,7 +4090,7 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
 	if (probe)
 		return 0;
 
-	bar = pci_iomap(dev, 0, NVME_REG_CC + sizeof(cfg));
+	bar = pci_iomap(dev, 0, NVME_REG_CSTS + sizeof(cfg));
 	if (!bar)
 		return -ENOTTY;
 
-- 
2.53.0

