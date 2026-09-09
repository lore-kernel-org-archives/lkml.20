Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEF37C115
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936139; cv=none; b=Qh4aVMuTIVWiosVU29QhTllekUDBVybEBiF2TVQCqtvf/RSPPVVXsAdpGmUV4Est4mQScZrRXiLTttuqOT3Dk4OoQFiuA8jUQWS12RV47E4CaarIbbp0x7G6THzH3uwgsBBVUENZMRg4dRzVgoCzSkcxuJJjCX1rvNc/m+W5PDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936139; c=relaxed/simple;
	bh=8XQPL+qXmwwMqJoxtmSJBCmN+e7LaBDtPH6jPm9wiZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ex/TsmJa1mkLXqrrYf3gm6d7si/HAVBAOu9kmZIvGj9RDx/ca3wNdeMJs19bvud5O9SPsXavzO+n2GH1SJptE0Wt2N3mXzBMkvsmZ+Dhx8GKvLWmAOx2eb+UuKAkfn6bdn7Ym1WMOqnJmzujNDnSPJUx9Za0CyT8cD+wQxFigQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aprkWaR+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aprkWaR+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so76571255e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936136; x=1789540936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6tvZNI4t5/tOb8RX49yOghwxoZpFGQ6EqhK2cKUEWg=;
        b=aprkWaR+EiND5MKP60MSXCSi4gumRp2zl2z+WWCVb6ehffrKGTr0gQfWM9Pl8QgNlz
         EucSYT7CaukC+ZWRaQv8UIrcJjL6HxDOksOddn23Sz1qFQomKKn492dbJKxOEXMOblCU
         pm/NF3YNY0zFRMabtcNM+1yw0YZeGm7NKhIr+9CpmfNJzcuCNZgSYquyhj2fV7Gd5lZT
         JV180cB4mnGPtdpc/wrakHr51SZWerOEhyjI2Eg1kz3YvTjUH0zrlhIJV3pBKpCLvMB7
         r5MyQAvSJ1a5IYL0inj3WRprWvF3l/hFTxUsJXXVDJSqkYmOvLwhUxxg6oXRqv1oCpad
         ufgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936136; x=1789540936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6tvZNI4t5/tOb8RX49yOghwxoZpFGQ6EqhK2cKUEWg=;
        b=nLyFgdx100e9t0ghgbLsX+xbWD13lol3GENYC7waRkDDfOCjcOTJ1TJzKqhXo7zsNU
         NcceePBiryPuIO7iQO053R35OPiogdNHpUInc5L3Wu6m60iru8FdfGroXtF3xyjPKnIE
         YiACHUn4mqW3OfHlYukuKSxzTLabZzauEsKRPIUoLuueK3sJQSrKAzNGIhkE7ZJdsFJC
         ZsR7JtVF9VsAoveK6awVwIgREbXtpVbpF/QgDOvw1gSXRfCXSBxSBG2kP8psvlQI9m0x
         dsaQWcmWtBndodk0AZkxQif7kqnh1C4cxoSKUb+DR4Uf21s5qCdotonCCPd5nAk4NYGC
         Cbog==
X-Forwarded-Encrypted: i=1; AKwUvBxF4hs0X61gsEFZi+NjMHv4gW5JRzpfkZGmwOackaK+2C/1vBMkzH+36NaWY5WdaoWNyjK5zTTqq7uIW14=@vger.kernel.org
X-Gm-Message-State: AFuF++nv8gIrfBDEe87sYiAKCSsogMbXMmU4hfvZGCDPvYubkX/gqQ+L
	GYt2rC30lvCWGRTi3Y0fAHKaimfQylkOmggmhmtGJ7R4IxiCGqvwpv56
X-Gm-Gg: AYBFou2QKM9oFFCoK9Qnl0/6ZpeFStv2B2bPLKzV6CIpb2elQ8PkKOUKQTNSmPdW7LA
	ffyi7cmqA+fDBZU/6R02/g6j55+OhDbsXmFyKHWoWSlI2IQ6+Q+ME2aZxxbwK8feFswm+gXFOaI
	auykMFVENXr4tva9dfIizH9RIhX7A/SKymTFL1SBSMmW9K5rvKthiX+WiCAxTIfMNsQAYXVYzGs
	kU+z3pKCptj49Y4wpj9zvgo3+d58knEfIOaTU6oihCYK62SzOTPk6xWwbYPrqepL1pJs68a+rVZ
	BYiGIDF+/3gBNC/DhMGgQGNWKAawb9uHqJZBVP2+d42WA72U0fc5txi7RRzlP35ukokph7sGJCY
	gO1VqFp9PJdGe5v96+aChdaai6bZb8UB9JKkEUmhjBWCA7hwVsjjzi8Q+OYCi3WcZxYCt3TWwD4
	mekG1xfX4WGeMVWzGo3SL1P5hokP8sm5q7qYqFxbbCc+ZoXbC4t9ZnaXu/vawXeouFbwhiUe4cZ
	uUdLqnJf7eb9xNCj4XTGTVCwPB0lPpWFoMpZeMg7Nywy63NSv4UofoJF9WaoiK7UgbHMSFjXo0B
	CKjgizckR80Y+g2YxMgUkPLhCOFVD4r1ikg7hGWfBSIzbGq5sBrnVVQ1D1uYyiPQ
X-Received: by 2002:a05:600c:358a:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cf82070famr332881865e9.2.1788936135696;
        Tue, 08 Sep 2026 23:42:15 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm600953625e9.5.2026.09.08.23.42.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:42:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Peter Pan <peterpandong@micron.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Fix spinand_manufacturer_ops kernel-doc
Date: Wed,  9 Sep 2026 08:40:55 +0200
Message-Id: <20260909064055.90235-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc heading for struct spinand_manufacturer_ops misspells
and truncates its name as manufacurer_ops. As a result, kernel-doc cannot
match the comment to the structure declaration.

Use the structure's actual name.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..0bd3f30ea57e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -399,7 +399,7 @@ struct spinand_devid {
 };
 
 /**
- * struct manufacurer_ops - SPI NAND manufacturer specific operations
+ * struct spinand_manufacturer_ops - SPI NAND manufacturer specific operations
  * @init: initialize a SPI NAND device
  * @cleanup: cleanup a SPI NAND device
  *

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0
