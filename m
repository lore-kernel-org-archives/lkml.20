Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D107411FA4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317191; cv=none; b=TzT9CdH6cFtM1cX29jGlU0weW5fBmSa60XpltiM3++sKaQThmUVglEE6sG7dGQ1FxIYidjB3MbanYHRKFK40dDHtTUFnDyEfuODCNh+8cu6CsTfPQuyH6fNht5njo5f1Jh4pwVF2rJZBfmfQhPD4hPmHVOlO4hv/czXy7PHXHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317191; c=relaxed/simple;
	bh=TIw5lqIwI++o+BW9gqykLWSc9RqLvUR4fxEVOXOCSMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMzB8ko5nv9XLBmi12j88A9MaQodN61oCKRxmSum7qwgosxQFQbKt3IasCgZS/OmyUZUg48m9jbe+rpBaoMzJ7mXKTXPgTBRK5dmaM0+wtpo2hihfDRyj/s0Bjeoxmm3RUt0y9C9qs/feaaL7uWgTTXEWA5y0Vf2llCWSlJho7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1I/R2NA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1I/R2NA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c399641so11534915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317188; x=1791921988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUPT3jPI5p4I31iDMdvVFZ1BjY0fbePSrjebk4p17uE=;
        b=G1I/R2NAeTAoWXaL8OeOCoMITKBbCM4yjq9Ls/V1zEzq4NZJuYo81Z9gm2vtD00aNa
         AGqsWkLMFJpB0t2eN/8tQGEUor8dmSqh/EcZaIyhEHkQNyJomyDpsvKw0rMZiDQ84yFr
         lVcq5Zf822gGnVWVYFFdTlmLGZSBWTBLIRcJtlLqA8lXfZia/zApOm+vcebwG+rgxnxN
         YbnIeBGDcaCh/24nPPhAnQq5rKxsgILvh+lqZtNuNZoxbzMXFyM1qp4wJemS8Kodq9se
         XzGU+nbKcP9ZUEJM//lE3av5iWZdufF8RsZES07f5mJMq7CJ4Sa3kO1FQgiCEfRd1ave
         KQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317188; x=1791921988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUPT3jPI5p4I31iDMdvVFZ1BjY0fbePSrjebk4p17uE=;
        b=OctD6IfcwRmNIIF6OitgfJ4eMa3i+ythPuIXAp0so+drFwqz5uplG/Tg/5gUnIAxFM
         lvA0AGHc53MlyNvuR3msC+G6owT+ilQ4wgJSx3Dq6nF+oqJtEyfwf4ctKI8xZZ6R2kiB
         G42I9NZJLTZmQSAgg/kTc8QPEeVMsPeyWXgE3GGDJRDMIzDgQVdqjKhnyLp9kkEdDGYn
         Qt12GlsCeKW72toVlp7LS8oXL4p00AlAJr5t/meeyOOl4dJ4eHZoHt+ZQDz6cOtmfbrL
         cYOEbz49uYk0ipT+/QoI+zPHwTXe0wSIKvqK6nY5K4sc9EWmpGfHXtXjhtbwrFjx7fux
         QCZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1xfKLjfRkLDpXsnXicobTAKtUbzV/gi9l6NW/Sl13s64roZpqj7EpP+tAmBcIdHiNrOyx0xcOjTLhdr0=@vger.kernel.org
X-Gm-Message-State: AFuF++mWELpN+FIessLghsGRCMelftW5lvAI8eftJywfIULF8sscMuEm
	N2hTtMDH/5sfWJJcRfZXkX0YNSacVW2PqYo3pE0JTg+d3Q+kcfB1qPhP
X-Gm-Gg: AYBFou2XhnKCQNQeOnaauvn1SxsdGCMMgfQVKtYmHqgAgiUln0PX//GAXWdcwNoYDYW
	pbQ8+brOa/CvBMcDWrkSrQAp5+bD0iNAgtc0YHE1oQQERUPaKQAxAuhv9BdV+oz7ulpxRN4osdF
	f0DjerIwBoDDPSn6PMRJ4wGkD54y+ZAUJkNWOf2RzZ90IQ0lW1ZIu2AtmFw/esm3DDniY+dNEiJ
	pa5E1jQuNCizioOVI+EDSP/5Z8jdH5dO2CEiMLL3GrNg6Km0xgfejAuuS6fy7G4tt1iS42azIAz
	3CDjIJ9Wgs0mQY180ACdfvSkvx40SgJVjr0SvT1O/Vdeic8UuuCBSrgRurMz4tU32y8hoUFCflG
	yrNcAjraHDfGFyeNfn0uY4YQqe/oRxb4UDe3Wyc1wtdw3VscN/X/tja8wpbPqM5ZzKkr13I99Io
	Mf/yC2BVWDfixisqutN2A7VKNVs3VFrpyeY+Td9akJ6HTyrT2drpxqfgZclPDKA4gagfCDlZZN0
	MQDfo8F
X-Received: by 2002:a05:600c:4e11:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a17b554d8dmr37462435e9.31.1791317188309;
        Tue, 06 Oct 2026 13:06:28 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f446f4csm6772595e9.2.2026.10.06.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:06:27 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use u8 instead of unsigned char in NDIS typedefs
Date: Tue,  6 Oct 2026 23:36:22 +0330
Message-ID: <20261006200622.41856-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1..df541e956 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,8 +15,8 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
+typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
+typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
 	u32 ssid_length;
-- 
2.55.0

