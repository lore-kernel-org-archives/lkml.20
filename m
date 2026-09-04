Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE54A4408
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529590; cv=none; b=Wu683W8vUV/VA47gXWodAzHwkp+uI1o/+rb2T4V6cpWKdEkZLO7fvL7q2GMesAsCYn74b88gzo5TaFIw+BdZt+0snIK3xdy3jd8yRCrZg+Yx2WOlFJIoHfSlp4e+q7AMbPayEe9KdowdwBzmhe+MQJzzLydxFyx8cWtC65BBOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529590; c=relaxed/simple;
	bh=l7HBFW2oz1K7wlz0Cw/q76k0lqFcEvUDwHaz93CkcFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ec/tx4JzrXfPvMvoPXJFrFY/0TyOBF5m+apZPGGPS7+NclvThXPp7Fd9AZxsH3R76SVCUH2b2VIboUhh2Hdz60fKP9qQjgMrJkC6p2X8hkNcbssZBCSp7GBZ/Rhm4HB3Fu2xJt9rSSg4XDH/TyhEMM4RLfKIMvCcjkYJb8zBWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z+px9OyB; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z+px9OyB"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e50a650a0so98663185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529587; x=1789134387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+Bw04n0AyQYjskAQ/JcmMjfV9T3RjIpfJoearHWcfU=;
        b=Z+px9OyB3Q3YxOWoirmFuGtw0afVJ5jCKhh9O/Vpn7Jo9GJ1E5p6TRkyfY6vA2/uAD
         ZbJL1XoZ5Jnmmq0KzQx1LUdt7+/a6QG3kduT5vjQ8uT6IQJXs5/pb+3D79zMrQzTY235
         EUIzd26bg64xfstUm4yaWr5zg+/Q1GxfT8VLrfYUSB057r1Rmv5kBcA1ttHllTXZUBOx
         tcH/9mLIzyW72ZOIQavXwnqJXjKkXMenuW2i8vBSLVlhWkCmyt0YX6LE6QQxK5DQvueO
         a271Fxrf/YntIY60FXWCc+8O45KRQr6HGDXa/tWrivlCDKQQMWVgeO3Vk51/Bz4h21K+
         zp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529587; x=1789134387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+Bw04n0AyQYjskAQ/JcmMjfV9T3RjIpfJoearHWcfU=;
        b=Sb/q1GFoeyNPEzAFXXiHMn6ShaJaQ1NUIbqPCfqeDewGfIKb+K9llIkB/W+HV/cE7S
         YJGqEpmZzAI3y0AWVlcuY4Hi2RNRErwIIHeXUVjJvjpfXd3OD99SQIwswYEn+/f28txy
         PknMuddsoyBXDyThZaS7qUPyyRRpSc+rAAooqn29aTVnC/qwd8lbU74iZBsLHXdPr4v0
         kbVpjZ93qwbihXzNgbJZ6AT+O6/+dGYTQm+EqBvpWLr/y6J7SDSRLaU0LzpqFGThTKMz
         S7oJ13SxWTZTUDqbXiNQZYODXoDcMunBMqJOiEXQueTqNARoaQgz5uEfTDXCvdatLFvD
         V2Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwHopsiZafcAon9eF0yCD/TJI7uOCeZXxqIktEHbPxDJywxA97PrnSqdfpSqKDSpN+P25fMZXF7G2A1ky4=@vger.kernel.org
X-Gm-Message-State: AFuF++mDaR4mlnRtooIoM1gvmHUfAHdRSM/6Y9ocRgQTVEktwLQs+2ua
	y55licfT1XqQ2D1v53ox78mUtg9Y21tWqeaEP/oAm6JBG9xz5mX9mr6DRVnug90qeYI=
X-Gm-Gg: AYBFou0rznDQLvNAOx9PaYfHdnYdb+SmWW9fjzqnVX2v6LL/mFo0rF5+DH/ryqO5pCg
	+D2aC0kiEuTUugujy5ixoymjrNf16aplh061ddskwygLMsZIOuwtg7BlmM12kCx0UaYH/T0UD4Q
	g5ndAbENTYWN0h0UOWrjL3PQW9B3hmkpm1ARmFlkXwJepZDWH12NvpJBuw5ksFfx1yT5RNZzCRe
	a1ZVRaR7hXnqcNybmsf555kUXRiiquk+FSU7EAg570KvY7cXGzylmLuBLXfQETVM69kuhgTP29b
	np9E+Gkt+lXK2f4uGf1c+Q5wjosS628/dMy5YsRH/xc1SgDhr/AoSYNo4eV3eEVrqK9UlmRM2Oa
	AqzFsc94mnC0fQV+6kLl0tddFffZMQ7OfO+DQvmIfMlz2JLxb4V+88Lk+ipBHqCCZIeIuBcK00q
	lmXlGOwWEx6psUTqa/jvmxW1qU2HsLixZ+hhvLxNImWzekY/wwxic5rrbx5yclJtfQ
X-Received: by 2002:a05:620a:a0c5:10b0:936:dbf1:f495 with SMTP id af79cd13be357-939802f6e18mr474878385a.1.1788529572210;
        Fri, 04 Sep 2026 06:46:12 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/4] PCI: of: avoid allocations in of_pci_prop_compatible()
Date: Fri,  4 Sep 2026 08:46:03 -0500
Message-ID: <20260904134607.1856121-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904134607.1856121-1-elder@riscstar.com>
References: <20260904134607.1856121-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
v4: - Added this fix to the beginning of the series

 drivers/pci/of_property.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 75a358f73e694..a0632f932b5c6 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -324,27 +324,36 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 	return ret;
 }
 
+/* The three compatible property strings have max sizes 12+1, 15+1, and 13+1 */
+#define PROP_SIZE	16	/* Max size of each compatible string */
 static int of_pci_prop_compatible(struct pci_dev *pdev,
 				  struct of_changeset *ocs,
 				  struct device_node *np)
 {
 	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
+	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { };
+	char bufp = buf;
 	int i, ret;
 
-	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
-		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
-		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
-		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
+	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
+	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] = bufp;
+	bufp += ret + 1;
 
-	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
-						 compat_strs, PROP_COMPAT_NUM);
-	for (i = 0; i < PROP_COMPAT_NUM; i++)
-		kfree(compat_strs[i]);
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%06x", pdev->class);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
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

