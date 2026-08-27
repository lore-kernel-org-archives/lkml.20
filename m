Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682EB43F096
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826497; cv=none; b=nBo7uMJvZy+/WFA0g5Us34c0zk85uBysrOe9Abyp3lz8ukdtunwWGg/09axBk7+NvsxJpiSVOtbxAsg1wGfJWTRj5+uOYSspWH8K8C65WtxpDCBM9l9DY/Cy1rGZQZFBPz7VnA+Jx1aXPC68DXUhllkIceAVWBUkA78Skydks6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826497; c=relaxed/simple;
	bh=9rcIiHoXuCF9JwHBMxzaTJMEufQkYFV2jYyzTDRy+58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqf5bsJDv1nN48ThkFgsNtAAfjjt/UbWCxR+KVBZTZkIZnQJCXQ6KzIfSsMhhKoT9nGmRzw9XtryQzP+d5WcYQpgfCncg+eTa8Gd2AEWiALWHD2bV1TR9qN1dMBSo5kP8o7S2Nt2PcSqXSD0NeQPHBm3h6OiRZ5aUmI1Aitgcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRrq0xyd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRrq0xyd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso10836861fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787826482; x=1788431282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ualYSohemnoWJ/GOUjcQjUHW3U25L/3jHKxpRF7dY1E=;
        b=cRrq0xyd1HOvZstwFIE5psxSxr/kkVpM80idm1Q1pIYVFEnI2/RqeaMOhYhpC48Yfc
         ibFNcR5xBBQmqME7tbpKMzuGZjKjlDR6jrhSL4V/y+okARNR1PxfSe0//qdPExCfQqh3
         95Zea+h9UA5M58Zra/O2VZSzqPjdPEOLRwb7ipiyGcwcWnQPgA6PqQZLZSeOyS0wbf/x
         MXYYls5YbPMg0rBJWffRAjHAehIAc/blp5ROuWnX0q2NDRs9uqBQLcSGxYv+tagKj1ml
         AJzPoMlfwkRpxx1xVg38ayqp+Z0enROqpDthpVCcum4UUCUIwXIuvNCzwwpZRL1M7ypz
         AZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826482; x=1788431282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ualYSohemnoWJ/GOUjcQjUHW3U25L/3jHKxpRF7dY1E=;
        b=CSfrr4S+EBzzQiEMPJyx465s/4R0WdEwpPRkwJC1Nvn3IdAzti1Agl4q4ZAGNjX8Qj
         2NTdD3HqVTaMCaq2yMjkJG6/nc8VcCX4PCUl5T1HikBFSAs6LKGl0trbM76uIAoYttWt
         sU5QDbesM4m/F8FmotzJ/rT61Rq7UPf22xFFY8IGO1VDqDXRXhdej3GWEFsiyw8BzHZN
         KE2Ov1OeyMRkj/FTFQDRNBYxYC/vyolPP6gkFcul4uD6TA2QUBDtpL3ttT1Y2V06LzwV
         GytZT94FLAq8nnoKvlf7VZhIY3N64fHJtvf7+nywOPu4Euj/hVIWYW8zexj0IINCkTNu
         /XRg==
X-Forwarded-Encrypted: i=1; AHgh+RrIQlL3nctWo5diY+nd+VTgX8iTGZICC3YPRKeIfdeyxTo/TjrHF/lws5qKCyDLKwYxMOQpJ6Ryb1zJTEA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+En9hzPEF/JWh1FTsL5MdxcZuxGuVhiv9E/t7u/GFJJsXsPLF
	0n5ci5jXFbcDladTjFxLNOJEa/jHqC0/caURyrl9+KhpaxFQMQvIfurP
X-Gm-Gg: AR+sD10pXQsVohvpeKObBf+l6/nFLBS2DclbIrxtPtz0Kppmxi9lZudsZhbPPhg387o
	KltNEKAg07OdyBLPu98QproVK1lUZVE3rxG2tALirvEMST1tFLp/a6TRSfRJQ8WxYMuDLm6Uqfz
	WaSI45056GJKsp7L+D6c546jP2rUMkeoTWPrkTvN26K8QTXnbLaxCKx9Tlv+QgKh0WCIqq0BJNo
	Sr9Zd85ME6znfPUAO8UCux4vMwNRapH9DGPtqrhl80l3/EjrvhZijXSV97u7I91G1CWGiiUQHZz
	BRYR80lXUtRXEJUj2qg4EfKB8UZV35MYGJZoNkvMmceW5rnzhucpyHt+YGKlcxuz0QiU6TNwALA
	9fgmdKBVE24c5XJBtZGUs5c64ftUeE8mZNbhqBGaykgs5AzTpIXskI6sYKyLXPRMClz1+yDFqIC
	IcSMKFduJEvtX698r+ReboTVNT1ZHgkdZRKudvbWjmRsCqQv8tWZwGyv6HbdelRRTqMC1YRlvhG
	CeyeA==
X-Received: by 2002:a05:651c:41cc:b0:3a1:9562:732 with SMTP id 38308e7fff4ca-3a1fd4592b6mr34616911fa.1.1787826481631;
        Thu, 27 Aug 2026 03:28:01 -0700 (PDT)
Received: from localhost.localdomain ([94.240.188.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a26be2ad2asm3764971fa.24.2026.08.27.03.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:28:01 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: vme_user: Use str_enabled_disabled() helper
Date: Thu, 27 Aug 2026 13:27:07 +0300
Message-ID: <20260827102707.23965-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the hardcoded ternary operator with the str_enabled_disabled()
helper function to standardize string formatting.

Reported-by: coccicheck
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index c695ad9b4ca2..9447c00bc013 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -26,6 +26,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <linux/byteorder/generic.h>
+#include <linux/string_choices.h>
 
 #include "vme.h"
 #include "vme_bridge.h"
@@ -2458,7 +2459,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			 geoid);
 
 	dev_info(&pdev->dev, "VME Write and flush and error check is %s\n",
-		 err_chk ? "enabled" : "disabled");
+		 str_enabled_disabled(err_chk));
 
 	retval = tsi148_crcsr_init(tsi148_bridge, pdev);
 	if (retval) {
-- 
2.47.3

