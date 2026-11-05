Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893096;
	b=Zr1Hyy0mqvLQzeuKYGBIH/fM/gqjxLVZR4WjPUD7m3pWqAjUH0j0qCJLeNZ26+9ytGpk
	 EdWBABTcqvkJWd03KXULrmjlpIIne5PGWeN9t2sjeE9cY5fcVkrrvHMLiFU8plbTWb1cR
	 Dnpd8rqs6R9HCQne2oBwhw6qW7u16FOgwyumYQF3NyUblTHkvzxBdy1jNVo/OtXI5NkZ/
	 ldZB12876lMSIbfPWdWZMHfP19/4GrQf76jS0FbObRHMwj8KYGD2pRVHEnNmHcQF3Km3J
	 RwJSyNnntUNv+uZGV62XfY2USehag8lJUsHPn4+k2sgobqa5ye0cNYXuNjLXWm/12QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F4fUx97bi7pwf9S3207BDQnL8pq2tpTO+X6+3lO1kvg=;
	b=VqwFYdNEKgR7liavHNQKOIRz0C9p9JCI3HGWttvDHK3wl3i+V9UcwcztUziXFWDhFPWu
	 Rv5mgPH2qY4eWzeznQdHLU+wU6aBUJtjCcY9l2y3pavdwxEkJJZ3dWoNuj14mtA1Fs9W9
	 nh7Jq4PogGntzzZV61uJoXr0kEOsUPskh6DTx5rsciEDucT8TvjMKNgdsb4dYPh8GXh6S
	 1wYfyXhHC/dLSyBY4SK+8We10K7FrcxBcyF2SVHJjz7sb9/iFKQcETAbBFy8EiorcV4Wg
	 AnMTGvjzyKH+XeMaYyCLPhqPyGjGXubzKwYdaGAGHdev6Xb+vh9+Um7UKsxeYlamy+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=LqeGpx0o;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DF606D81D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2DF606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=LqeGpx0o
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53656465d1dso1066060b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793893095; x=1794497895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4fUx97bi7pwf9S3207BDQnL8pq2tpTO+X6+3lO1kvg=;
        b=LqeGpx0onwzV4nNyO7gBwy8hvbgQTlF1kY2WTObUIJzlJA0199/1A21cmefHZCNJUp
         F36lt/w2/mBVr76879+aQx28ku60ASRAh00HEjWJ6kSUN7txwODiQWoCsDACTA7t5mAU
         te9uqemzhvEIqBrRkDaM+F8O0X9/tlmKrShAHkJyGUnFTCqHbAmk9WeV/pZ7DgCO/cqK
         oBUO0YrZRxytKcBuf0CF+umwg6WESLSLbMCUhPoHGnRU3ACelIjdDPXmMJX6MudTjKqM
         twBfOVYYyWQThXl4gnAWbMqxSK3nP8Oiz0GWtV2xqXpMjCuA/ULcXu/bqFiMGPlpVTDu
         EEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893095; x=1794497895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4fUx97bi7pwf9S3207BDQnL8pq2tpTO+X6+3lO1kvg=;
        b=sK1/vUkBzU83z/8CHuaoKYMs/hRe8AGhonNCbdVtaD1EfCbY68Y7zk+3LyP6YNFBdn
         z/vhiI1kUYGho4miJ9OkreNZvdjMMVxWrhKDENnirTTHbgXhKRtZiQzKcTzs9KrfwguG
         Q+zEW1OK1J8SL60QkSOwyt7kpD3xLiKO/yzEgLBrXePncaY7EscmmYgwIQYPCmkdIWo+
         upXheOxmLm8C2TOMxTOyOjelCrGveX2ilrYGpIXitHT7IKKtj6iTIjAOZdCgGZ8Z9pHS
         ct3kja+5NuN2Fvrb/s6itipXyhAwkbRsGbxL/0oTC2qHADhmoj5AapSjxH8gyPoT2oyZ
         jVpA==
X-Forwarded-Encrypted: i=1; AKwUvByrbok5Lo8qesIOPAcN9XGsqMXZDO8FoEooy+kbKICbMixuY1VqOgbPgK5G+HWkm7DI/g1jDH0faj0oPWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zUrmeewebiCvhplEVroWr8NLj7t5gUBQU3dfFrneMmuVdExDD
	GSiV8wpEnT12b8Es9Qr1UQ7V/v9BrdoDcw6QPWHvEgdjW0Mmb4Ti71oJRQqCy4o6v7JPWo8yycL
	ttw60XC4=
X-Gm-Gg: AYBFou2xR6SKsQpc5ALy1Xswg1TnXJyUOWB3PazQLmLL5gAYCwRXL0TRxPk7X7remFD
	SznWtZrQkqx49FKy/xAKdJqPlcOHifEl5bvmLfO6ljv9NRcy8CO7ksO+kVeSsD4ZGdtMF+Mhl8F
	/LPJNx5dHsuPgAxMurfs0apm6Byi9B3JxKLfArFdl01FvGDd/KvqyDuoICaFuAisO2DI6MAlu+w
	kCG8vgpUJ4ZNyvcEDL55w2lQBcrNdQLN/7cvqLm+uGpCC3iwdJvxTh9zHCwb2PY0yKGrLwK2uKk
	jVUCNshtPh5tDzNRBCT5FUkpaic8x0JS9n1xn8NGDLo4mx0t54hrSo65cGzYw6pNUe0QUyspTrP
	nA0S5HnXktjCfbAf1bBC+24Bpv/GaTIwGaCvgPpFNJdhK1FINvbmBKWf+lh5jmeJnN56RTU59+B
	AgOduuF4xdiklNd6zazh/eGkV9eY1o1GiB4Fn+zs9S4dhG452U3SDqdJZCyZ5/fRHKmSXB0wkN9
	Efh/0u2PPsLq01Aj33RsKlLKuIYGsZW9+jAboRLX/flieegEZXtcMcf2wlW4FDwO2NEx9ZQOCtc
	59171L8D5JfVHIvvg35GBFFByjfflE0EJg==
X-Received: by 2002:a05:6808:1527:b0:4c4:28a5:1885 with SMTP id 5614622812f47-5640d9278d9mr14332042b6e.9.1793893095035;
        Thu, 05 Nov 2026 07:38:15 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm4435329b6e.5.2026.11.05.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:38:12 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 1/4] PCI: of: avoid allocations in of_pci_prop_compatible()
Date: Thu,  5 Nov 2026 09:37:58 -0600
Message-ID: <20261105153801.435566-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105153801.435566-1-elder@riscstar.com>
References: <20261105153801.435566-1-elder@riscstar.com>
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

Three compatible strings are formatted in of_pci_prop_compatible().
Their sizes are known in advance, and the largest is 16 bytes.

Rather than dynamically allocating the space for those strings, just
set aside a buffer on the stack large enough to hold all three.

This avoids a problem that Sashiko pointed out, where an allocation
failure would cause subsequent crash because strlen() is called
unconditionally in of_changeset_add_prop_string_array().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v7: - Don't check for snprintf() buffer overflow (buffer is big enough)

 drivers/pci/of_property.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 1500740cc55d2..d351f500c2ce1 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -331,27 +331,32 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 	return ret;
 }
 
+/* The three compatible property strings have max sizes 12+1, 15+1, and 13+1 */
+#define PROP_SIZE	16	/* Enough for any of the three strings */
 static int of_pci_prop_compatible(struct pci_dev *pdev,
 				  struct of_changeset *ocs,
 				  struct device_node *np)
 {
 	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
-	int i, ret;
+	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { 0 };
+	char *bufp = buf;
+	int ret;
 
-	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
-		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
-		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
-		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
+	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
+	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] = bufp;
+	bufp += ret + 1;
 
-	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
-						 compat_strs, PROP_COMPAT_NUM);
-	for (i = 0; i < PROP_COMPAT_NUM; i++)
-		kfree(compat_strs[i]);
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%06x", pdev->class);
+	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] = bufp;
+	bufp += ret + 1;
 
-	return ret;
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%04x", pdev->class >> 8);
+	compat_strs[PROP_COMPAT_PCICLASS_CCSS] = bufp;
+
+	return of_changeset_add_prop_string_array(ocs, np, "compatible",
+						  compat_strs, PROP_COMPAT_NUM);
 }
+#undef PROP_SIZE
 
 int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
 			  struct device_node *np)
-- 
2.53.0

