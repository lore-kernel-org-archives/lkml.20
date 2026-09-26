Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8737F748
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439950; cv=none; b=bYX6s3d6Q1KjeXuzTX/MCoyRl7AjND2ZRXD3VBqOp5FIxm9JwvBcIj/QeOxdxkGALQ6xoqMv3rruAOPEr0VrO+EZWAd8WSYHkeBTMtT9ouX97XnT/osMK0K/otgBdAFSi44RyV4qEBTHF4C/V9Bqrxv5BOT6akdR1fvbRnbYSqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439950; c=relaxed/simple;
	bh=T7F3dDvikqn4CAXmXQRDaPb9qUyC4LYQrttvZDvAdEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqN6ot9+nomRj/m8+7ikPDXqcZMplZxEZtCl2X0TqtZ/2JJr5D0QPgT/MP4aV2uveAuqGI53zqOyezbiebwmpYvtvKKuw1FY3CvYmvkvI+gQxhfjpYUwOsU8IX/e4sufZBOtRQeFXERBZp3pO1dQy9q9AQ0Yq9vxND1tO4/j0Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsUea9j9; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsUea9j9"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-533245fd18dso4589491cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439942; x=1791044742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwZsRWJlx8nUAInFaW9/7sGkNwUQw33SuDu+YxFV2cw=;
        b=dsUea9j9IJJPuYcald7sTZymd4nZhu4XuD2NR2mLAECd7hrhdzOf2psTsw5LKvkoIq
         hknBgp/IOOxBamfat5aJ7p0Blq2HmK9Oh6Dhr7aYDxzTib21bQALvaxjF1WYqyzY7n2W
         SBSez5BFV5hce7ujbd49ixHo0Ci/K1jB7aWP0tmHeLc+UTA9YY5zLcfnEPQtMsrv4nqm
         p7ShZ1xoYxXIbFfLWxi8ICds+CPo4QGZCPY2sp9nJ6Rw90DeGzVKYOHxty+CMwa+pLIm
         VJcuDuDzPJXfflBxI+S3gDk+QNCsFKTmb+YRGzL2R8wgUpqSsVuv2Ht+kdA4Mz7ZveGC
         zLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439942; x=1791044742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwZsRWJlx8nUAInFaW9/7sGkNwUQw33SuDu+YxFV2cw=;
        b=s2vO+Qe3oXrv8uaxHiKqhka12F/6LD2Kazre9u0fm1K0NlVrmRqjprfnKOnYcnUVaH
         Di6BfXslFXGmGOd3MADuZVZ5p+zqGPsMWuiu9pHbacJnSX0fwC7VwkObWwxCZzi6gF6n
         X7830CB/B43xwA0A32OXwM3NmkNl5m2LN8HWtp6WnguK66WWHwqd8doz7EOLzL8bkRhe
         D9Is2XYhGbHHoJ+T31D0P9VNHcdYZ56G3/avKHoRdqsLsYk9Pe7Ffp+BlSVfWErJmsXj
         ZOs2BbekaGHrD+b1JBNM1JgHgq9s+fCV48pr59UAwz8JrKA1a4fzQRqHuscAPg/+wPQw
         ZkQw==
X-Forwarded-Encrypted: i=1; AKwUvBzBKLcJA2AFyuixlKIG4rIJTWZmqKGqhtgneiE2jhhhpSgW2rgrDW8hNeEFIt4zIW/w+8qLkBbtYE4P75E=@vger.kernel.org
X-Gm-Message-State: AFuF++lnqo6YV4hU8+JBZq7jfQ3fRxUgAi5x0KpZjbWhuhwFQH8sMZ1M
	TfsmydS4VeNXJVpDx0hDVaPjxlEEFZ3nXTR8maRLSrgnzMaOU7UP9L4GEdYl2q7s
X-Gm-Gg: AYBFou2Ku/DvlTY4I8WQDeXVbg25lIJFg2FZcRVjouwaecC5+Xy6IEkZDtFNZ/V7kzZ
	mYlD4M5IEH3zZBjZ8rZOmeY/bgsXB1juzxjVRJKb7IGjf9pH8+JUdKma3ppmkTRbAUZP5AMyaLd
	3HCyPBup5/1MXtsDmvvpSTbwAmgZDuu5BFR3xYxrGqTrMMAvRHIBbDLmWD3SFXeoLsYfu4P/ukI
	G9gTfaEXMUPJFZ3Cz/V2vWqjItoim0U4j3zqpY8ex308adPeOUYEzS/cAz5PHz6j6Q7XVxXk6Sc
	WhhkD3x6zgjJw9fwBsJCTUSNfC/WBPOngnfacxjPzhtTHuPq5o1mQQ6eh4siT3cru3MuOMKjcjF
	PisCoGLYYUjJKXb/plDqbWryUKDd9yarQOP2+s+b1G18KNcZb3S1REIofQ82payXUqBRoDWl971
	eI0gE3r6ssfjQ6fYAC7PDZl0KHCq2GJujKC287tus7wmbeqOd6g891OoUQJKpFiFLLFQ6nlOWSk
	9Oxju19RwYspKsIPE9aAk7tUGGQU4Pdv8FNbbQIKq+vSia4Tw==
X-Received: by 2002:a05:622a:e199:10b0:533:2ad7:42c8 with SMTP id d75a77b69052e-5332ad7487dmr19534821cf.2.1790439942170;
        Sat, 26 Sep 2026 09:25:42 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332201fa44sm21330871cf.4.2026.09.26.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:41 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Wensheng Wang <wenswang@yeah.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/mp2985) fix typos in comments
Date: Sat, 26 Sep 2026 12:25:39 -0400
Message-ID: <20260926162539.25432-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/hwmon/pmbus/mp2985.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2985.c b/drivers/hwmon/pmbus/mp2985.c
index b0a4796ca8ce..89b437cc54c0 100644
--- a/drivers/hwmon/pmbus/mp2985.c
+++ b/drivers/hwmon/pmbus/mp2985.c
@@ -12,7 +12,7 @@
 #include "pmbus.h"
 
 /*
- * Vender specific register READ_PIN_EST(0x93), READ_IIN_EST(0x8E),
+ * Vendor specific register READ_PIN_EST(0x93), READ_IIN_EST(0x8E),
  * MFR_VR_MULTI_CONFIG_R1(0x0D) and MFR_VR_MULTI_CONFIG_R2(0x1D).
  * The READ_PIN_EST is used to read pin telemetry, the READ_IIN_EST
  * is used to read iin telemetry and the MFR_VR_MULTI_CONFIG_R1,
@@ -62,9 +62,9 @@ static u16 mp2985_linear_exp_transfer(u16 word, u16 expect_exponent)
 	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
 
 	/*
-	 * The MP2985 does not support negtive limit value, if a negtive
+	 * The MP2985 does not support negative limit value, if a negative
 	 * limit value is written, the limit value will become to 0. And
-	 * the maximum positive limit value is limitted to 0x3FF.
+	 * the maximum positive limit value is limited to 0x3FF.
 	 */
 	if (mantissa < 0) {
 		mantissa = 0;
@@ -133,7 +133,7 @@ static int mp2985_read_word_data(struct i2c_client *client, int page, int phase,
 		/*
 		 * The MP2985 has standard PMBUS_READ_IIN register(0x89), but this is
 		 * not used to read the input current of per rail. The input current
-		 * is read through the vender redefined register READ_IIN_EST(0x8E).
+		 * is read through the vendor redefined register READ_IIN_EST(0x8E).
 		 */
 		ret = pmbus_read_word_data(client, page, phase, READ_IIN_EST);
 		break;
@@ -141,7 +141,7 @@ static int mp2985_read_word_data(struct i2c_client *client, int page, int phase,
 		/*
 		 * The MP2985 has standard PMBUS_READ_PIN register(0x97), but this
 		 * is not used to read the input power of per rail. The input power
-		 * of per rail is read through the vender redefined register
+		 * of per rail is read through the vendor redefined register
 		 * READ_PIN_EST(0x93).
 		 */
 		ret = pmbus_read_word_data(client, page, phase, READ_PIN_EST);
-- 
2.53.0

