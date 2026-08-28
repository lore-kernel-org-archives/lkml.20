Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D13C4572
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895641; cv=none; b=YcykDaaLCjz0KaRQc9jhmEjtmxsire/4H1veVscxKvu0J0upL4+pwhMeURuF3/fUQ/M4hNBdhNF0/JFcDx9u15FQFci1jJN4oi8fTxGS/ZohQKfSezZ3JJp087THv9u/v532CkK3ywCaB5rdVBPYL/EP+PRKDfAMt0e4MBYNMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895641; c=relaxed/simple;
	bh=CrsK0MwXr7Oe9+IYQCl8a58FC1Uiv/HYB/SAmXC3HSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8vyRUITgLF9RORnvA//7rsBd1QKuZnboTz2k1dxmLarO/KNcaxIcJxVvFpAaG8Nquz7waEEHRssEcfaTWACjY6yYgmcZc0Z5v1TA1OAxN7OOz9LRTbz1KQAHUI7pWvkLtXqLjdRxihYwWY1LpjTxXc1Eo9+809O6Y8eJPxYHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6svmCd4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6svmCd4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so727258e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895633; x=1788500433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQKVsIuuwigFUQGx9DU71mFvKHQtdN6YB39hyzuIzIM=;
        b=g6svmCd4WirSEJ4WLK0kMUUn8yXLs6DwPia/9ewY6Edre3WC8yfUhbosLFmTq6ZBX+
         CxGN6sqbkS6W0J/+omTltH9lyzsyHFzZvedRkHJncEugL3ztbU+e82STLJVMe9W/AFWz
         dNGPiQrKOwJLeDJxZXp9ThmIbYBtJR7W+jcN6dwcr7NDGgK4np9fj88dxzLIb5P5sdo2
         HmCKioqaHhPqgYrEKc58XDFUR+NZRInSnPFcA0A8EmKl1bdU2xKSTSh9gFkKC7mZa86P
         cqFJSC6ZxiGxm2QcqlR5j90Tss9KwwJxNZOBilro9704D4GcpnO2CxpRGXM71O1reP/e
         mvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895633; x=1788500433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQKVsIuuwigFUQGx9DU71mFvKHQtdN6YB39hyzuIzIM=;
        b=ltf3VL7Lf0XLcbv0wX1c/bKg3oaDkBn4Wvm+/TZ5HA7hVGgVjUUsAViq6u/Sog5bh9
         MII3jZwM856OEJ/Ze+TCuQsz6x3HPxFxDpLDXYKDf1YP0TmOB1ssLO8ukqcIR5455LhT
         d/x92RuM1ci0q8oNBc0Wdn486blD/XUd8QgBNMMPED4f/iNP8bQznWcQ+peddTDutTSJ
         35tPFn9RVJ9wsLLFavxYYL2xqGd0WlgeH5SE+MBjoMNpUPE1oMfTcdEu/K1Zi7+P837D
         dXpKXj4O8O/W+9O/00SDgiPW9vojTsVvkPMD0sK+/RZukM0eWk/B84/aT83gLAdpJULa
         TJ1w==
X-Forwarded-Encrypted: i=1; AHgh+RopFOBTYdq0dKCfSGZaNQZ8Q2aT4QygG8gbWro5LRFHfSD8HjeCwy58kQPyytnpe7VLO+GWlW76art8LRw=@vger.kernel.org
X-Gm-Message-State: AFuF++n2rDQxzog+d2HzBDY6O5hTH8IOYXJci8z9PugYstNK2zeCGlpG
	ELfPAw5m9L5MQFqqqI/qjEcr5d3hpOJ//23D15u1SaSJ3ENEK17tAp2c
X-Gm-Gg: AR+sD110kiynNvs6pC1WL4aGMqOssxllTSj5UG7HOS3iDz5V8E7EQJqLHW8radLey8q
	RxvY3khUARDjqBb7tsJn7iWgFAgFd/aiRBq+TSgqJzeUP+xcxxTCdZ6qyYK+VmXbSBHSla4vkBx
	DLqaO2cC3buZuqFOPaHBKH8mHhH5COGNwvM2/RMUqPxDrRr4Yb++ahDiifPNYJX8EUsT8b1FYCn
	ldvo8sZ4zq4i//tk4eSn/kexxPElK+NF6wlEWEeKPqxBtCbiEa7z38DCekN/J9xEMoyjW1l9avK
	PZfgb4kpZXDY89fXm2xYLe2+HRsZ+hn9xCPYltXaqkN9yT3impIvEAdJgEqgGM5NqRGOdiB3aQN
	wQLBOhQHp+QSKXoGzhwkowbT3oVe/6NwEQVf/CtOgSrUW74udAN8IVIZaEBd3jOB02/WrsoyS8u
	nnv5FdRzNYSr80xrVGbcmy/6irr4BBcq7jcY0YyAP+Y04Q+mvQvUzvhRhuwx4bRCYPw3j7dnkNQ
	eQ0YyAoqOX5CbACCaAMt6hC1mqJMCD6AYFTkcq17OY8w0rWHgF0IvT+yk5d+w==
X-Received: by 2002:a05:6512:6190:b0:5b4:5880:b50b with SMTP id 2adb3069b0e04-5b5e68af4camr1038303e87.4.1787895633169;
        Thu, 27 Aug 2026 22:40:33 -0700 (PDT)
Received: from archlinux ([94.180.48.0])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1a8edsm166172e87.79.2026.08.27.22.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:40:32 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arsenii Pashchenko <ulijg308@gmail.com>
Subject: [PATCH rtw-next v7 3/3] wifi: rtw88: rtw8822c: Replace custom DAC IQ sorting with kernel sort
Date: Fri, 28 Aug 2026 12:40:23 +0700
Message-ID: <7d0ab2352317b81df10dca7ddb3e855a303b8be7.1787895379.git.ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787895379.git.ulijg308@gmail.com>
References: <cover.1787895379.git.ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom, nested bubble-sort logic in the calibration loop
with direct calls to the kernel's optimized heapsort implementation
inside rtw8822c_dac_cal_iq_search().

Implement a safe, overflow-proof s32 comparator using the subtraction
of relationals pattern. Since the input values are already properly
sign-extended into signed arrays, the custom circular index sorting
rules and helper functions completely disappear, reducing lines of code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index b010e17c9..bec1bb376 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/sort.h>
 #include "main.h"
 #include "coex.h"
 #include "fw.h"
@@ -153,24 +154,14 @@ static void rtw8822c_dac_restore_reg(struct rtw_dev *rtwdev,
 	}
 }
 
-static void __rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, s32 *v1, s32 *v2)
+static int rtw8822c_dac_iq_cmp_s32(const void *a, const void *b)
 {
-	if (*v1 > *v2)
-		swap(*v1, *v2);
+	s32 val_a = *(const s32 *)a;
+	s32 val_b = *(const s32 *)b;
 
+	return (val_a > val_b) - (val_a < val_b);
 }
 
-static void rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, s32 *iv, s32 *qv)
-{
-	u32 i, j;
-
-	for (i = 0; i < DACK_SN_8822C - 1; i++) {
-		for (j = 0; j < (DACK_SN_8822C - 1 - i) ; j++) {
-			__rtw8822c_dac_iq_sort(rtwdev, &iv[j], &iv[j + 1]);
-			__rtw8822c_dac_iq_sort(rtwdev, &qv[j], &qv[j + 1]);
-		}
-	}
-}
 
 static u32 rtw8822c_dac_iq_offset(struct rtw_dev *rtwdev, s32 *vec)
 {
@@ -291,7 +282,8 @@ static void rtw8822c_dac_cal_iq_search(struct rtw_dev *rtwdev,
 			"[DACK] q: min=%d, max=%d, delta=%d",
 			q_min, q_max, q_delta);
 
-		rtw8822c_dac_iq_sort(rtwdev, iv, qv);
+		sort(iv, DACK_SN_8822C, sizeof(s32), rtw8822c_dac_iq_cmp_s32, NULL);
+		sort(qv, DACK_SN_8822C, sizeof(s32), rtw8822c_dac_iq_cmp_s32, NULL);
 
 		if (i_delta > 5 || q_delta > 5) {
 			temp = rtw_read32(rtwdev, 0x2dbc);
-- 
2.55.0

