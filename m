Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460324;
	b=l8NnT4KxJbul7bY7tojZUJAp7JZreob29lVSbiB8/Xr5rgFmZUXab4xif1AaWR7BPJAU
	 Ym7fjY2fbL5d7Lg/NCgEcBBwkjdbSiq2Rv7Pe3iL5U50WzYHKbRYqBF8N0RWrS45M/BFn
	 vPB59OmXmb60nwwQjjl40GBMIKdq0ShUDIvRMP2CetAuNJabopSJzYuAgbDVRcemkBHmN
	 qJXuAwQfwtpgZJ40Z8FqRf1bNsN6xgM1OsWp85deqpXduWt7Q/s+lwtxI/IH76a9ySBSi
	 J2ZvfXWD62M+oiSCq4VaYP2a65A6QLWA1XRI8Q0TBheXhxE3nCIAMcescgirKiJ1CRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=fABLNFTFQ8HBQw2IibFvWpn+4JxCGqnQLfFg1YUKRIZl2siueTnj8uFpdVAbmTCfKyoJ
	 SjQmZLPe11CgdDgTkGUVVZKeVKBOIek02rm+i9LOjmG7oKoVpfQ14uDkhk4UWFrbbmJzS
	 Op1/u2aFqe3aI/Mlm/Mn0mqZ7sY7Qx6qWzNDszyHQPzX1042BbgX4sIcYso+et1waEKej
	 2tLO0450dkt72epP8gJg/XQ3QjbbqNhNyr3HfIH134pfdJbbaDk/KJn84cdCjdDKKJazR
	 0HKq5v4fium3flr5k53cTmqJdFwQx7BVBwivURJedgbhw60UiyIgzPmVP6HwmI0HFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grSH4cuT;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C06606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C06606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grSH4cuT
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5873185eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460323; x=1795065123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=grSH4cuTeil7DmfeYByb529y3LjJgYepDb8OtKEsY7Qv8LhjhWFOn9wb8u8vo4WKG8
         HWO5SUKcEzHEsZ/j1SW0ZF3Z2x5rnkai7mqS8aWfYMXyWUDy5h2iBSRc23GBJ+s8T2mj
         BC89Y16sN+TXvZBbg9mTqu2+zWTsXAyJwPVEym/pWONvufndFLrfIEpE0UCrJssw5gTM
         R1l0IYMlJ6R4WaTDpn6KrIXw7HJrXGLvl5d+FjEikhTvDeKV1VipDZveSJK17kmEqZrJ
         8ckCnd5KlAt0z61Y+MQg2MPm9S97ZWT40qC74Zd3l2AIl2+rhgidIXYQpfnovpD7IgrD
         f84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460323; x=1795065123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=aKHJ6O78oIFVyZYx+vT9Ju95OmqiB1GDNozuambWvNZpvgQd/yNPHs+nsizATDOjzA
         Tu+Ac+EkVNhAQFKnfgkyUx4/Qd3R7AHyqM2PqJP9URHGaVJNeQrpP2clcW9/zfRH4eAp
         JoacqkaG33XRMwFhfd/Oh3SmByYZisr4iXYybOlKkxSI+e8j2qSs0+1JXWi1YJ7PPFlh
         2bw/WS2jSX/28Heonmxhnh0/sIWYwDMxmoGIbq0XYQWVq2im/vt4eoPtZO4OpEAH6+J5
         e6vBZB3iEk8jngqLApI7uxcUX9u+C60Hh07zqxpuwnka+XirSHP/iTm0TRHp5eyNDDRO
         4pPw==
X-Forwarded-Encrypted: i=1; AL+hErHhb/BXKI2A2IATVw87/sNTZRGmq50uwxdUbWdpWk6owGrxHGpyPuKO/zRZWtNP26zGjn//0NqUO3tnpMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vWbuKmGyXq0ZWzIq2sjPTpDrnzPjR+F1W3umWuUIkictJ6nAy
	4OMzvLqMlNeSqMVH9Wjby/5YfJ0yiqx40DzaDi8R1zcuLO0VI+fLd+g3
X-Gm-Gg: AYBFou0sGTrrSvZJzW05HtqyesjMidzMZnBJIjoK5hAiF7SsR7FwNOdq90TprbAtpRd
	SdGDv7ivgG+evWi+WsIyf5p7odBUSHQNd+rEk0C5qhnpIq3ifJqPvrI4IZK+ikSVNeCfcqszxaU
	dp05N0/NXfhXPHWLiLMkg8An2XP3bh7NhNAZoXgADfY3YgiQG++XyTqIEdOznJPKpP6A4Ks+kWa
	nErj6cAsXtmRJG5syKJiAGnr6fM8DvAvLiudvekhnHzRiB/gmaNADZR11aahFJZQNCeHsbL2tYP
	xxW0MKvNRqUjozbeKXP8TCP7K/8k4RVmfV7cQPnSYS9XZF8HHmHif3u90KUwjb2nOhB2i5+zkp5
	Ks5QaSGtywhGvpI6YDJOcPSQLA9jv39WT5WgfcwuUX5SMIyOshP9DevxXdF0vuo9JXmXTkspvwX
	4BZclQ95E+kfbb5d12/JjL/Q+psGyoHNoXbyU+hyeTGkVeU2C4Hce9/1juJsRjRHE1eHh65pvCj
	uiudWehMdsvCnee6ZeiipWCO2OKtPO1/uNrWC4+DFw2+2kGQLihbPOeO4efcsPHs3dDRTbkmDoG
	o+DEVwTXe8tAsFTB8LrMoZo8e9d9QANEoiCRPn6b1zyxgO0270fikKE=
X-Received: by 2002:a05:7300:e024:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37685b80494mr4971787eec.11.1794460323501;
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] wifi: brcm80211: move d11.h to the shared include directory
Date: Thu, 12 Nov 2026 13:11:29 +0800
Message-ID: <20261112051142.2797529-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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
index c1a2318d7e..eeae85cae0 100644
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
index 9cb09c8a13..d81de701a3 100644
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
index 0a0c0ad4f9..6841bc0052 100644
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
index 2b10fd5427..e178b1a0e2 100644
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
index 79d4a7a4da..6e92dc4c90 100644
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

