Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FC3D75BE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687776; cv=none; b=ed837RljKVnF7cH53VJwQBbQs/tcW6UrN9llIz0NLQAZ+45FzBw3bfjZXpzcenukCEzPrZxurlREImOngWxjN8chz65jzqTHfDfAxgOjRtkHm1FuFslTPG31cJnCEBUEVW6JPznT99+VsXJ/AfcWHcT9djLSJ9dQnRpH34wrox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687776; c=relaxed/simple;
	bh=vfCvItZUJWIDnmANtREff/s++lH1r/4XwMRHbFSb2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/uYFat6g3qfUnH+IXLUZbDwTTJSk9N9gnfJzsv5ZPIeDuRS2AiDY5/v4fRptMhbaFDlapbBuxVY7ervoQMFpimrpMbfEHdINBgaM5PbK2mvyYJXOIjJPtcf7WaJxFL9h3m6F2IGjAWPErLAxwl0AL0QtJ8su6mqQHfnUCUnE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN+M4EGS; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN+M4EGS"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so55431a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789687773; x=1790292573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iL1Xh9ZZ7puvXidIO52nL8OUfG9aWJVfXlW3+EIGwE=;
        b=GN+M4EGSJNy+rkLks2Ie7SHo60SlA46PjhNZw1xKaMa2GqyGWfoU0IPrxnHyPm2rCs
         wxSNb/wltwBwXLdyh6CaQ3jITe7YinALWG1P+44K+mMuHqmOOiu0reNvNGrClzNtrAm1
         Sswv9vK8vSus2guNV6Ky4JI3kS7PpAjt7Sr7kGeFCCCBpJz/TEbhV0YQrRSzR6Ei3Kkj
         WdTLyJn4rPMPxTe7LZOVNtWNQyErVnEkUUWwUVHn0R3IvyQzGlUsSMlKL9BDGRgFfrwA
         1+ImM8j9lLFLqpEVQkLzrKGRp9qhnIGHlH+SubkCqMJc3HAayHvxQrrQzxmreVIhoBuK
         r+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687773; x=1790292573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iL1Xh9ZZ7puvXidIO52nL8OUfG9aWJVfXlW3+EIGwE=;
        b=UNSlSTnCZmMDD9DnEl1tWnU39UYde39qgzmiCiO3nuU6KXksMheMR9ATIOi1CsZCAV
         Y2mBlg4m1UQmfLPo4m1rBrkVnSYcj3to/cPKKtFdx3RX3bCDk8GWUCUT4tsQW/p2BWWq
         Jxj0/j7udsHfkBcb0yt6AwD+w+uJvRpWYrIFHx1RUJ2QzxaHAnaWc8z41w9+vApdDyu4
         0OE/ryO/WnlTN59FJ0MXzGAxRdhutY1MA0QkxynDk3GeDgdMEl6yuso43bS6+03NZ6qt
         e5pjJaCffnSGm1A1Dd3IhOyKyUVCXvhHqJ+Um8Trvgpb6ZVL31kin8L9rHGVDoo0hF/c
         B22w==
X-Forwarded-Encrypted: i=1; AKwUvBwPqH+1U3xNAWwAm8Eg+sOIZqf3rgC95C2flrmU58GGl4zBTtco3D8kXGfK8ZN6p9RAMf/pddvPUBY7upU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQJToIr9RisRcyDANtQOhI+XDpAR472l2aT24kdqiH2EvIGEie
	UcgVtjyXkNcYK5bOtwsITewHH3ygyZZQoOfrAzceS3MlhBc+GPZDIF6b
X-Gm-Gg: AYBFou1mV4EeTwKLNshMYeBXw7iYogmKBuHazRj/NzlCep1cLB3Hoj/REQebkHIGr8n
	nrMGJEgegJYJPQKRR0S0KVD0fhqw1ueypPav/pc4M2B86saDDVZ9CXkop+M5NgL+8CdNM+e6yGB
	7U2/5icxYzyZV6tyuRi4/QTOl+pXg5M85mXO8aTLOGNc01RMABxZHULOBFqNRXeEfKqMOtD6O1j
	2jtaeLgiUyDoMIiqpZzTNlsmQHQJLlDeGd/9SUBQSTnSnSIKMdZE1BIxZU+AcJphqX4Uk0YgVh2
	A4GoJ04XDRVebZanCW+2g5U+lixPV++0mnExa0s2WXCh6WnM0IN/o9keeEl06YqHLom8gcD3POx
	HkwVYr97FdqeJmRCJ1FSznMNkFwFgkrIC9cymXlJ1FI5D0QRtRkI9Jq01qjUjLhfzFPSjCXTJwc
	o2lWo1UOCGv7ud6vjoZFN4IJH6oRQ1dFvzbV58l7uB3Okt1i+k2Ld5Mi/Ll5EoF7i1d6nhKExo6
	u6v5h8BONuPTPF0pMDKnWCBs4NMFFUkSfDXhmIqgln+lZL04mvIc/j9dE/MJmO3c89Ayo7kIHtD
	mkrOMHk6Xjg81phHZ/jzkawdup14aYQDJQs3nhvNFwQD/xJP
X-Received: by 2002:a05:6a21:1b81:b0:3da:ec28:2cc9 with SMTP id adf61e73a8af0-3dd8c53b1f4mr853759637.23.1789687772800;
        Thu, 17 Sep 2026 16:29:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc52e4bd4c8sm113418a12.3.2026.09.17.16.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:29:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ste_dma40: allow COMPILE_TEST
Date: Thu, 17 Sep 2026 16:29:30 -0700
Message-ID: <20260917232930.128927-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses portable kernel APIs and AMBA bit-field macros from
<linux/amba/bus.h>. Allow building on other architectures via
COMPILE_TEST for wider compile coverage.

Also add missing HAS_IOMEM as COMPILE_TEST also enables configs that
don't necessarily have it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: add HAS_IOMEM
 drivers/dma/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..04a2410d94a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -448,7 +448,7 @@ config MOXART_DMA
 	select DMA_VIRTUAL_CHANNELS
 	help
 	  Enable support for the MOXA ART SoC DMA controller.
- 
+
 	  Say Y here if you enabled MMP ADMA, otherwise say N.
 
 config MPC512X_DMA
@@ -559,7 +559,8 @@ config SOPHGO_CV1800B_DMAMUX
 
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
-	depends on ARCH_U8500
+	depends on ARCH_U8500 || COMPILE_TEST
+	depends on HAS_IOMEM
 	select DMA_ENGINE
 	select SRAM
 	help
-- 
2.55.0

