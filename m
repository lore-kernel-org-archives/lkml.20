Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562A44B8271
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956536; cv=none; b=UGoRRTz2SU/RweMY5ehLsszF+Z3rye1C1GsdbUdVoJqp0k1BWdLSqlvU2ZCFajMARHVZlsjyoEyFqupx3s91Ed/tW9YvP40rBfeufupmiZ7lwPfxAW1vqxNxGLex+GH8dMB9fR4fGI8QR22PdA8dn6NsM14XXhUMlFNYdQZ0R4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956536; c=relaxed/simple;
	bh=niryGSxJX4gME/6a0U2DNx8L2QBjbTB9EOlGt9+7IDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0BLv8N2ZmiJvCjsezB9jJE6gav01s5BS4Fg+iea07wqCd7GfpMAOkioR/Lb1MiZH3BCloWTHDRm/KIJx3RPv4dOOljUa86CXNPX1Xu2Rtq7t4O4XRlXrwNZ1P/jzfvmARe+lWf9mcawrAoKrEfXnrY64Sp4ZXlXaOv4J+WBYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VR0+ORMW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VR0+ORMW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so204415e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790956532; x=1791561332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ctxUkXm5BOo7/5u4JOJklLBmiQwzEkLfsaEZ1PEQrs=;
        b=VR0+ORMWoI+Momzj9k23qVVJV4/eZqQ7rgkncf0RoOAr81IXaVNQxV3tDDejRMbkYE
         0XBf1FtNObzyfDNTTqx67snPaTVnsi7UxeIF7HV0yx93Moy/zlIzcjFtzgsizqxkKMhI
         ZPij4iwyLmsPYkhVNJtSChODRnOSPNUnSQHyWkA6nSWfuDSoCpgqcN2c5epul9KbD4Px
         MdG36ern7TXCamP0G3GUBIvvVDl4YS9k+/o+odg/SNbkeeKc7SAF+80+WBGaCGMCyBog
         VECqa9t+srLF3CqXzyRJzWwf+Xsx39wqgJpQrBrC+AawizLNVbYfecIc3CfPAKVRVqXh
         287g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956532; x=1791561332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ctxUkXm5BOo7/5u4JOJklLBmiQwzEkLfsaEZ1PEQrs=;
        b=x8CrIo54ocrNkbTTlSuvf1Go/EmFiOaaSnA7FTd36mmTEgR7Kx25RkjZIlsUxN2qat
         ebuWg+8YKzBmY14EZwxl3G3SRg2QC8xr1GDD2lzpyskvL6O2XwgRZZpV0WevyjyU3bAc
         TWrVAIOwzd57okXXUWD8+ehXjjyf3+jd7xSDxL+b5DHanxT8/4zQrwKyWe3xZAloCrUK
         LPHq2KIl4kNiOyP1q83n/s3tzST+zmVUt0FEbzD5xymguVIANU5/qXb5p4/1TB15K+E+
         Pz7rzcCFXEKu0Hscvd6O5uFcqI0a2TAR/a9lDcB2w7tq2Ox6jPEJDtiKjc8/GAUND0/F
         pu1w==
X-Gm-Message-State: AFuF++mfDPnS+RHgtXNyD4d91olv96pN6kYq+h2cHxN6EbK34/D5gBso
	azkx4TYgElHdmUoc/9jDaen88NHyZz8pBGCtFdfOO1NNqYm5jHr2z31F
X-Gm-Gg: AYBFou1UTdJAcNe4v09NeRA6F2tunVi1/CNiBSd6BsjeovMSCTuds1IUSd9GPxSqfE0
	UMtcX9phvYKe/Z/eUV7wbkFmMOHM7J1rh8sYX7bCn95984vXywtXVT5rgv8/9q29/atVYMnAkfM
	l8OJBGeoKLqbOrASKvy1X7LxPK7Oj88fPsBJrqMCfI+iGW97T4cI3fXhCItPjCdaSMFaMyr4pD+
	O02b1ueaqHjZKTAzUoWqTSWyFyzexPElF9ZHOi/GoN1XgI2qUvFMQ0629PAO0QWn58+W1yZHez4
	gk9AkdBnv/UTO3hynxZkt/ep6KrhqRbBDXGOqMM56HJqkTjZDb4+bU0WJDL1GU7hCVMQ8HQLtsH
	moBP38UeOirQLw/Nuq1H+h4PeDg5ZPRSlIJl7cn+2gnXh6wlY9tvHRrse3K8wu9IZUZiM+zaOE0
	1Ap0lkhyvlqxOgwDuXjM3UOogdFVM1O5gcl9ix6Xda9J3vr/aW1BOMfIE1HdW9VVzHYDNLhcL80
	pBWTBn5GH+pZf8kaRU1QiZ14gSZMWdqF1EwU7jyAg==
X-Received: by 2002:a05:600c:1907:b0:4a0:3b9:f16b with SMTP id 5b1f17b1804b1-4a027459456mr60034955e9.0.1790956532121;
        Fri, 02 Oct 2026 08:55:32 -0700 (PDT)
Received: from localhost.localdomain ([182.189.185.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm81515965e9.3.2026.10.02.08.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:55:31 -0700 (PDT)
From: Saad Anjum <saadanjum239@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Saad Anjum <saadanjum239@gmail.com>
Subject: [PATCH v2] spi: bitbang: Drop duplicated word in file header comment
Date: Fri,  2 Oct 2026 20:55:27 +0500
Message-ID: <20261002155527.24845-1-saadanjum239@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8ee46db14169 ("spi: bitbang: Add missing MODULE_DESCRIPTION()")
updated the terminology in the file header from "SPI master controller"
to "SPI host controller", but only the word "master" was replaced, so the
header now says "controller" twice in a row.

Drop the duplicated "controller" so that the comment matches the wording
used by the Kconfig entry and the MODULE_DESCRIPTION() string.

No functional change.

Signed-off-by: Saad Anjum <saadanjum239@gmail.com>
---
v2: Resending with the correct From/Signed-off-by - v1 went out under the
wrong identity by mistake, sorry for the noise.

 drivers/spi/spi-bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bitbang.c b/drivers/spi/spi-bitbang.c
index fb288ed56..347265e80 100644
--- a/drivers/spi/spi-bitbang.c
+++ b/drivers/spi/spi-bitbang.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Polling/bitbanging SPI host controller controller driver utilities
+ * Polling/bitbanging SPI host controller driver utilities
  */
 
 #include <linux/spinlock.h>

base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
-- 
2.50.1 (Apple Git-155)

