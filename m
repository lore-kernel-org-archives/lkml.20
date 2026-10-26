Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993016;
	b=3ifG080n614U7oOMc0EX34vhedIeq0WVumVEcqjdFhXtSnzxuLtO0GRJSISlgBPLSm5L
	 U3SOX1QQ0dUNw//gudCciihz4KbBRhi0KmHnfio6ZaEAYzgKzYcBZu3DfT81M861mdJuP
	 MIwqPTm70uqqqsm0UphfNH0Qnl/6dYezllWAQNTyXYX6cqkF09n28p1flxlLOScdg/bFi
	 cyQJKvuMg6HlT7UURp6ECjRVGXgWbU+AR30UXFaAahN6HrwafORiNvmEiT9ov9xTc4n9m
	 nV6V4p/F1M1ZUgm5zZrVCcJMqynVev3lKVnZ22fabEECjoS3cABN2XexFatnnoZCQDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
	b=G2IwM/D82HgDOveJ/HD3BBe//zjqHpMBq967yin5oJdoipz20HgQpkK9Sdj9818bttBY
	 sw1JxiEOSETjEOiCIcwBkHFOtBFi3ogliahg4jIZpBrJU3fVXF5Wb0IrPlnWdA3RsKNxe
	 l9Lj9mtEWNX9xvQ08Oy/Ceg8kucvKfPaETKDibbL9fDoLfrkA2yNGKJpeIY7qVrQbpymb
	 5y2EEqJS/GERXxmNzYO9K8nkn9NAuMDpUxsWvgL0fgiwFUAKBEvCwh4WS2VrDLprpIbKd
	 lPkBmHmCyrxXfYPIoJmq2+bW7FJR0PXni6Ck7yNVWJjMrFP5qvSgi5iumcbNl8UHXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Td6RfQjf;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Td6RfQjf
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1736616b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993015; x=1793597815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
        b=Td6RfQjfblrtKW1KYFCuaRs6WIw1I1Q+zFXKqdcdzGgroEJa7bINtmzGdhOndwgzAM
         jfkpE45UztGGa1YxA+BqriZgXFU/R5ZaBrCkN6Fg+jbkB67cNjO/DEOemfXW2cSwQMTa
         zV/As+7zlZuGB0yXfhSlBS9vtEJMeE/PgjI01O1Ze3JW+fEma2v4zI0yy82/WthydRWp
         3rQ/QpjmIwcIi4yG+gdTxejzHMTOeKnTSOjvorKeqvUdL+VjG/AC1QTy78A2nAG77tcI
         k1sCBIwubjUEMOgZ8qveQ2bjx8jiMy8Fr3HjaD7H0iXaj0vKBiemxKmQbTSYjxZ8iYZw
         1bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993015; x=1793597815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
        b=f75uxAf7mJBG8JIOmqOsYsQKA7Chor3+j1wN8y6vei0ijFx3IS+DcXSmcsEB0IZECB
         y2e8Sx7sbkNqfBwfzU1VV6jL/MaVWF3TBdCzcC0rDHBtJZqHvm9Mu8Y+gXs9ZpNRcM02
         hGb+x6PbyjnIU49psbQRxcbaO44mK3X85rMHLMMcRNFr9MLivS46ILkad29Seqik4q8o
         4q2MbmCCbWJ4nsczqIge8yjDfBS4GM3BynXfYhYUz5r79ae7ysNNw5soNfDls+oIQUNN
         mEIf0bvXZ9jFuUdm4OozUiOtccywAu0P+CGELsB1C8XodSEtT3Gj/gnnzZ8blJNqvKwa
         2Teg==
X-Forwarded-Encrypted: i=1; AKwUvBw3qo1Dgs4lBVLa1A75+ETzHnRnXwN2y4/oKVFjatgJETzyZIhKIIMX+1jqS6+K6GNpfxaaHgnEhrfSqnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH03Wg9ZAhC20b8DAJNtVy7rqq2+3Op3ZwNYKXLifqLfpMihTJ
	8AcYlKucBrJZjdbUcBtduxNWJifpajxy6qA1KdKNSqdbGLAy+NGq06eV
X-Gm-Gg: AYBFou0e/DB/G6f9XsVUtyYewkipnK8GcriUCBxEma0g1hfsCy3aubcSN25KGrzz9cD
	uzH1TFgh6pI08mQanAeRrt3G7jUBYSWccFbzj/1UMieSImmZQXW4oBSiTpsMthbn37jQFuzu/8l
	PiPPN3f0D5f/4HKbV2EyJ7dQFE9md5qrQN+wiOVLG3RohDCvSzs2X/lznHOuyLh27WdZO7uRVI3
	cmNWSShmtrc+u8MIMPBSXI6bp1S4FuCId3IuxM+bhQ3+Wuosonf3RZQ86jxhT42zUCHIShQcwmJ
	1TpOufg9bdzfvB8T4to7xjKQYaT35JKz81rDE0q8dQ7iRUu8jmNvrzOtLXyf9tJlBoVi9tunoE5
	UHfSEoffwWQ8wuPZcru+E1eod/d/1WPgK2lpGIMW0Eeri51SeG+RnesZgiMwuJY+okU92w3Wirk
	BciCq/r/PDRAHlzeA5BjaRsRMmElOxTS1AkrrIwSHDKS6OnMl13gBycILn7eZFmkpeih2zuaOpQ
	obOey0Rg0hoxgZrt/7HmYo440QuFvO1l5HPDAhiOz2ooo/8kfvkzU36ArmdolJdQDCEHYlT4lOs
	lByY
X-Received: by 2002:a05:6a00:12cb:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a367a385edmr4665632b3a.16.1792993014913;
        Sun, 25 Oct 2026 22:36:54 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:36:54 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 02/17] wifi: brcm80211: move d11.h to the shared include directory
Date: Mon, 26 Oct 2026 13:36:08 +0800
Message-ID: <20261026053633.361454-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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

Move the header to brcm80211/include, where the other hardware
definitions shared between the brcm80211 drivers live, and include it
as <d11.h> in brcmsmac.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c          | 2 +-
 .../net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (100%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7..eeae85cae 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -28,7 +28,7 @@
 #include <net/mac80211.h>
 #include <defs.h>
 #include "phy/phy_int.h"
-#include "d11.h"
+#include <d11.h>
 #include "channel.h"
 #include "scb.h"
 #include "pub.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 9cb09c8a1..d81de701a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -21,7 +21,7 @@
 
 #include <brcmu_utils.h>
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "scb.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 0a0c0ad4f..6841bc005 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -17,7 +17,7 @@
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
 
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "rate.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 2b10fd542..e178b1a0e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -18,7 +18,7 @@
 #define _BRCM_RATE_H_
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "phy_hal.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4d..6e92dc4c9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -17,7 +17,7 @@
 #include <net/mac80211.h>
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "rate.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/include/d11.h
similarity index 100%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
rename to drivers/net/wireless/broadcom/brcm80211/include/d11.h
-- 
2.53.0

