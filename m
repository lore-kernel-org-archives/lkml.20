Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987882;
	b=MPFRtUj9NwUJK7C/qNsvyQtNbT4jsh8QH8DXQx63rjRYN+kgW3zizCEZgLvyq0CauUmi
	 SlI4asoxwxau5bbNTCLZZd4k+M3HrgJj2pES0M/WATSIFsUuBH7YR0p+yioAJW4PLb5gw
	 R5d78cONMu8d1/mFmO7CTdIJTfyjEv9DPw/IUtu3RzydlnsaBDu6DwUlzbxxjG67RvNp9
	 YW5VDCvuChm0nzV1u6kCASFqj6nyzN8D0BVatnbjY6BSUJsm0MGLrwK1dVhSaqRf7LU+s
	 SiQXm/Jw4NPpAA4wjLuRR2s/XH2du3FT1iCWmr7EUEkVOLstROrHJi47FeJ13EXiDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+OBJumt7aOGbXuujpyPpgenryKc9X6dlmxG6bj1Jk8=;
	b=tziB3l/WtEHXCgoYE1fLvR3X6OEQlOoIukLI7bwbI2LbIdzHfixb8SCBPOvc7mPJ2S8p
	 7F+aPR9JsL6ABSi3tTrrj11l/SX9UBhs+Mbe0TwXbYVmWP1OUkeUwL5fxWUfT5B9Di6Km
	 +oLAWIa//Or4BiQv0gLTAMvtTpmVFSAT7+MigoDvZGgtASEZBHAEhcg9iLAtV4M4+oA9S
	 pMDJvSUTqUw7PwRt7RKSHZe/MZdiI0QhxxR/Em9N6zMgncHgWNqS3YQw+81/X3cnIy/Nf
	 Yo6TjMex/HHCDaZoNyDEKrN83gDrHo4vOY66oJpMo8YuvqQJkZTKKF8nEeY3i5pgeoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HroEQCva;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35FC606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35FC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HroEQCva
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb760113d5so207882a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793987880; x=1794592680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+OBJumt7aOGbXuujpyPpgenryKc9X6dlmxG6bj1Jk8=;
        b=HroEQCvaFfGtceBq+rq4lkb/tPV2EhZm8Mfer88RZf04/32YclksoBPjF0hnW7/15A
         MFUYgGgHXcnIWlBEd6s6NcjVDxC+RTioZ/FlTpLTvoGSNRfTbLEo02tGoVMM2PggNQaZ
         ktit7Ri0ZSFC/SGhP7wuD9pDiP92UKxhbtySjEeh6vcFwzQtlTtmtBzuaUpb+SlCHbJ7
         5uFWIp2jPgGYAUzzrS0OoA6/ALOcnmpjjwlthuc1HVGQUdMUg/2jzoXeiTBsGosYH7dG
         bbsjTzLh01A8mKjkx9WyHTdXMIJITXoDPNvGk1+9z19pe8ZZtTOcUVtJM1tjwQuoOMVL
         nMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987880; x=1794592680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+OBJumt7aOGbXuujpyPpgenryKc9X6dlmxG6bj1Jk8=;
        b=Bxo9Bj6txWr1fPDnnewRD+YsnuhEoVfMVGCSYw1Y+Lig3UGA+YqqG9qvzJs11Po09/
         gmgKoyP73KlJot09/4mexa6viivuBfr01mCaOmCDDBR+kPcWDSh/+/NFppdAk9mx9I12
         3o8bQpjz04ihSx+ycElPLT4iwEakWluGUcnnCAMOSczHHfU2qK9hV4ObRH+I32mYwVxO
         97la7LUsJgNNVvP5rezbdr8qmQ8BwrS0EuCrhh3pPUAQFojs9kDaLRKXT07ox/hqaSVH
         0HcSnflZrA3s16+LlppZCfGZ2RXX4TPNAlwOJ85/BYGo6tgv00rgcoxbzBzSkGzztczD
         OTXA==
X-Forwarded-Encrypted: i=1; AL+hErHhdJ+khhWMvn/ZMENaEsbMSgNZYPT8J1fkMcQwNr4L4t8L72tt65MXt66qW7FM98z2MEp3nJlRWpYdSsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZiKwtKIhZcgu8smiCkLe6fCXrij+UrCtbGG8ZYBYc0aNszcsb
	DpkrOKvrEmZ4+CUHuXsHK1CxabdOHu23+j2mYJJPjifcnoMvMD+6niB07grG4yimI7AQda1DGNU
	/a915
X-Gm-Gg: AYBFou3ROr1JW71FI91TaFyxN+KuRRw9kSipQOWSLBFfc4TV/Q8aXEbYV659qrzpWnZ
	VFb7yYJBg+8Vbcyp1NobzvuNDTnT1NNBZXjW2Wrv0DAetG1zZWE8gjGgkxmGAIQDzlRr7CagY9Q
	0j4fGlQnQBte0acmpczaMoiTc/aLBg1QUHsiKUiOuTux5nz/hLdb8upMIp5KcqkVnr7TXSw2h5a
	+rR0gFjU+Utu+kgT6tcZX4OomGx2C143HA6CJZR5FLSnm3O+Wj1S3zE+IkjEuWOVVcVFb5zyg/2
	/hOJfdw55AbB2HaJWRva+KEQ1mjNwPo8pP7HFZIeuVzTrxzGOhK/8l7dptE1EQXgu2YVM9J0CnW
	8EBl+Cx1ytg2KrQH4thm1RAzh7fz943jGeCI5ysvOHMKKf5goJGVvHuKr4S7HJMAi5shTPTzVJ4
	JNW84D5CLHofWYUY5e0v6EeWuFzQFBzrOmKWul9j7iDNgsl/hjP9rTUCAgJTOPaDutE8eqcdqC/
	mInee8wYcwQtmvq2/wTtLdlOaodWHgd6E1xtc8JZaRc2SUZNIZM0g7DNkKJhDwVCfS6mNY9TUf7
	9D8N+EKcPanW+38pkslOW0pYI+vrq2K69W3pXLvvVA==
X-Received: by 2002:a17:90b:1643:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b0db7208c5mr3473355a91.64.1793987880151;
        Fri, 06 Nov 2026 09:58:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101ea0282sm125897a91.4.2026.11.06.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:57:59 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Joe Damato <joe@dama.to>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iommu/dma: Add helper for coherent devs without swiotlb
Date: Fri,  6 Nov 2026 09:57:42 -0800
Message-ID: <20261106175745.3362057-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106175745.3362057-1-joe@dama.to>
References: <20261106175745.3362057-1-joe@dama.to>
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

Factor out some repeated logic which checks if a device is coherent and
if there is a swiotlb.

Replace repeated instances of this logic with a call to the helper
instead.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/iommu/dma-iommu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 78742aeba932..a25ee287a5ac 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -628,6 +628,12 @@ static bool dev_use_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 	return false;
 }
 
+static bool dev_is_coherent_no_swiotlb(struct device *dev, size_t size,
+				       enum dma_data_direction dir)
+{
+	return dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir);
+}
+
 /**
  * iommu_dma_init_options - Initialize dma-iommu options
  * @options: The options to be initialized
@@ -1103,7 +1109,7 @@ void iommu_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 {
 	phys_addr_t phys;
 
-	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
+	if (dev_is_coherent_no_swiotlb(dev, size, dir))
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
@@ -1120,7 +1126,7 @@ void iommu_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
 {
 	phys_addr_t phys;
 
-	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
+	if (dev_is_coherent_no_swiotlb(dev, size, dir))
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-- 
2.53.0-Meta

