Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814A39CCF7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164195; cv=none; b=dvywEHY9iBr5DgrGu3/iMdW5VzZTRDSedFEnPNXg5s0F6kUPVQYDMkNNIg19nlLx12GmeC0Kir9iUdFycH4dlmqDWzKo2Suhc6aLGxu9FL7m3C4Y8+cgc1Hxcb6dyXyZn4ZHulRcUMqi4ycTbIwrBQ7RPW10H8RT35X0vJbckps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164195; c=relaxed/simple;
	bh=bgXr923ghVlip3r6x6+z5U6Xal6p9E4suYNMGgbS1Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiOmYKhATJtPyJQXLgP98r46GNhH+9EcYZVb0aSyYWU0tnRsOYOHK4saWV4m0ckKjDmT6G61Bt4G97NkSNP8buqUgXGqZw9wbjAJYVlfbnl+h6OXyBpufFAktlK9yPKBHrK37rWgtDsOwzFPw9ILF7Qsf2Xfb6EM5+tRSkTNORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eL2s3rhp; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eL2s3rhp"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309ce58730so605951cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164193; x=1789768993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTvNlTXK/FgGXX/0xQqG6bODFlBi/r6tMJBj+Ky/4Vg=;
        b=eL2s3rhpXd6spDadpLnD2BEBtWtWqmLRsPuCyumKZeywr0NjlMKZg/CpxVEQorOcsZ
         x585IwITnVUGgMdRnUJUuh43brhIQMci6bLiY9bGpXLxzQqjZEemInvqXZeqX88tEzUw
         NguKhOxw0t/dUn7c6OrB6Dvh3onKdNsq7RlWaiRAR9Hdn9QoiENpR6vK8U4Wv2v/Rnvf
         sW1kZW76sjAJv2yzcaem6d1kv4cuvtqKBmKr8XK9kaLmmoDKD/8xifZToAU4GHlPrPkc
         M6OF8J/dOsjQx62v4HsSM7fvUgx3uk3mH8uBKNUrellIJwgmi8wDhs4ytMx8KMo/Hr2l
         9Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164193; x=1789768993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTvNlTXK/FgGXX/0xQqG6bODFlBi/r6tMJBj+Ky/4Vg=;
        b=TIYDoYo7IlGjPSftg1ZLp1S2qUgRunG6qbn3Dm+OrDO+u5491wRya/bJxBSSxfcL/J
         X7HuwkQ/+JuR9XcUQmZeUTKYTMSZ4o7QbK/Wj7R+brH9DIqyz3yTyjhmfaC2hCxlfzfv
         NDO3E4Qqpy6ZDUAOD+8Xf3MdWaqaVNRW69SsunD7SjWefKfXg8qhgfy1FcCMp/sHNq1S
         tCOLZAqu/FCF79MQoGCK7TBoamFJlHQtK7y13bd03Elj5f4W6+R+mlRZu8yG9hs9D5om
         JhgHk6hCwcK0qldoLVAPLzf7hsIMa5s4uOoQwQ3f7nNo0o/dBUNh2QhBXIITFWZkIq3Z
         RmPw==
X-Forwarded-Encrypted: i=1; AKwUvBzu9bcPQhJbLiSuY6XqKuFIuQl1PCXcgfr6wJv8CnnVA9/ONfNkEmPcTUKtjQ1s8McUp0wGebKz07RxW7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++linKPUUPs2lHwPn6dqyLoEtOJArKbbhC5FTLugwPRLAsSqqeM4
	5BFDXWhVygTifgiAC3IRqgSgxK9aI/8LQATMWbB3QegRTG2RLMukHOQXmsld8g==
X-Gm-Gg: AYBFou0yL3etGQHPmkTXaWKMmDPlDV4iSkG1gBLWYvifykgKNrb5Ig2dM3p3FrHB0RK
	iu2uhv/rFWKAGxacLB/LSX+a/n0iW+PflVEsnHknOYnRnKs6kGJDaOCQ4BnFhuuDLzG4rLGBN3H
	7FoAxeRdWFgMlmf0DMaa09b5z7IipMMshrGQ5STEWvSWd8MwM8bgFnmNsf5wZNeVlj54h1xqwPx
	eV2grgMRuTn1PAwZIY4eFUkwt1EJ6OVqjWEANh7xpA7bCGBARIqI3FtLb7X5c4fIh8GN9k11/tH
	wWT4eXj7J9KkLQnuQiIn+4MnvuGoBKUKOtMQyUuxD8GgLslbf0DmDeG708p0VkLhs67JciBXnYU
	zUU0eMZ4lCOIKW5QF9yU3f12X4LyGCovPOY5l0KPfYKqD0+fgZRAw/63xsAf1OII+KQ7UeT2Lzi
	CPtTkYeGimDBOV+YPFsce1+OQPjGmceTUXaII8EH1CegmW4QXAgXJTijiJaSmR4tgm/6FWrbVV+
	T5dM+5TeB652yCUf/F8X8U2Bh6/b9Y6eYP/AqqmvNYHzBlzwk1UoKSoRsC3Cez3FQnGbqUY//FA
	APnHdjDngTib3UutXyU/jQGpZhjLiJkJbZZvoPf7mm4ipT7x
X-Received: by 2002:ac8:570e:0:b0:530:b2e1:2f3d with SMTP id d75a77b69052e-530e81fc928mr1035211cf.52.1789164192682;
        Fri, 11 Sep 2026 15:03:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca498d52sm30368671cf.15.2026.09.11.15.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:03:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: change to %zu format specifiers for size_t arguments
Date: Fri, 11 Sep 2026 15:03:08 -0700
Message-ID: <20260911220308.176962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
format specifiers for size_t arguments (len, pool_size).  Fix them
to use %zu to avoid warnings on 64-bit builds.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix subject
 drivers/dma/ppc4xx/adma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 1bdc781efbb5..39498779e241 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
 	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
 		return slot_cnt;
 
-	printk(KERN_ERR "%s: len %d > max %d !!\n",
+	printk(KERN_ERR "%s: len %zu > max %d !!\n",
 		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 	BUG();
 	return slot_cnt;
@@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
 	spin_lock_bh(&ppc440spe_chan->lock);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s len: %u int_en %d\n",
+		"ppc440spe adma%d: %s len: %zu int_en %d\n",
 		ppc440spe_chan->device->id, __func__, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 	slot_cnt = slots_per_op = 1;
@@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
 	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
 	unsigned long op = 0;
 	unsigned char mult = 1;
 
-	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
+	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
 		 __func__, dst_cnt, src_cnt, len);
 	/*  select operations WXOR/RXOR depending on the
 	 * source addresses of operators and the number
@@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
 	BUG_ON(!dst_cnt);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -4071,7 +4071,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 					adev->pool_size, &adev->dma_desc_pool,
 					GFP_KERNEL);
 	if (adev->dma_desc_pool_virt == NULL) {
-		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
+		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
 			"memory for hardware descriptors\n",
 			adev->pool_size);
 		initcode = PPC_ADMA_INIT_COHERENT;
-- 
2.55.0

