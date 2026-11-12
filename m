Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460347;
	b=nksHkXR4rrSbv5tmVi2QrEUXIxrmBqTi+JwbA6YiYZe7V/WXszwUzYTK75T5bUz/kyd/
	 BNL/Tw9K8WvFbmWeAVwNvCRlwTEHiwDwN5mhOe+2fArQRpnd0AHE8W8bJCHskjT/v4+pa
	 qB+XOQ4FekDImin8Xrr9lnxsFqAi5ztgM76CFgB8J2dULSAY/3WAyeJdjjgyzJbI8Iwkz
	 n8GjHTBYd7gjZwCGBc2MMajLTAXxSm9mMM/D5okHuTSYoLNlIUvOHFbwh7Jb5S1ds5T4Y
	 E07MyGmOW19PBLFlVfwOEHIfQsVWKuZX7Scgt2MVh+mjenlhyIK2Q89aE+4NWT9ck8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nJUKJ1ouR3aVsS9vcQQfLbrOlHvmZHAT2FjqztITEuo=;
	b=tOhb71IezaKyy5S2TuW5B2ZPXjgEekzUGUdWYFmhawJC4D38QQeFL8WF66Xw8HEYONm6
	 szAH5NGQf5LtI+h9L6HCj7JyPUjl6+I9hPulizGqPPVpv5WyCv5A7iELSVLXLYj2Ik6+N
	 v4lyJJw+uxeWnYJr6PbFxMFiMh0FniUOP/0Cf7j4CHcSn07AlXIH2kBPukOMdFBUnDE4Q
	 wPPP5Ie05IqcaWrfUKyCSDms26Fk9A02NUuGrRTSnM+c+K5wFham72UYNHZzpPiyhJGkP
	 wN+EuDtqUHv17CzXDRskjsrWRCKfJd+23m8odra1V20BVXdDSv+pN4w1z+o8eMdKj9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Msyny0gt;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFD60A3801
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FFD60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Msyny0gt
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8217567eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460346; x=1795065146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJUKJ1ouR3aVsS9vcQQfLbrOlHvmZHAT2FjqztITEuo=;
        b=Msyny0gtkb8Uk9jA3nfN+RFJBCZ6fBMTvfJVontg/EGKmVvPzRUmQNbCOLxNcUt5ew
         g1Gjca1/sgOEK52ZaMdhHrPQsmeVCmRwa+CKUZbxRem7cnMR0yYeNhAbNqFSjiP0gxGB
         jjYFR6jRxYOFUI6VHW4nml4GRnwyEwMeb5Uiy8XOC/IXvSaCTMlbeU+PsVDZu5Qwk8qb
         7VKLPetB1+Uh+pPGrOmXglZDw7rcGQUEntZcQ/d3e/vbWYq2XJYcRl+qF2BvLr7el+nu
         ESNOQM8p4LxETUcuVSrLJ+D07fJCslWaeWPu5i4wDcC9ipG7Qwh9skMG6972fTTsogVN
         G50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460346; x=1795065146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJUKJ1ouR3aVsS9vcQQfLbrOlHvmZHAT2FjqztITEuo=;
        b=l/7Mu95mFyA0RZER/7P8dqtBJyM01OersQetwp9u7eT7Qnkw3khTEvqSLgN8GhSDMR
         Bg0b88GjeXIvnwTJVjBt4ZlL6C7vYHXgQ3rlEGkPN/rMmwbRGG3eaJ9ytFvbFLnzriEX
         mLdM3d7lEQqTFuZ0mwpr5Ekj6Cw8tizwJjeAJH6Dd353qJFAgONHiw5IZ1QfXG0hRD0n
         h6PnPLhLDkpCPzHr0w48xARxDNIUtVRKSj6uzbWkshqPlKlkW6LeBSkCCSGQZ/P0l2SU
         DNziuFE0HlOLX0hcTDG0OPkVNThgJ5mqBLNncJX4XUt0h9DLu8ghs5x3qNjF2fgR3+Pw
         aSjQ==
X-Forwarded-Encrypted: i=1; AL+hErEyoenBGBcDWPIfCsVqWz7HOU4M2Pc3eK7hnwRw+HpSZsuEpuEKP0FTc0GW7vu8iBmX+4CgqX9rqdHeQ6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xKYefaoJWKKnZpTiW4Zn/4sARYRCX4n1+ThReUSzCwbQJdSKT
	eFFZzSv0DY9Nby6R1jeGDq5MfkJWKKq5/Npq9BHo7wafdOnK7/QpaW3fUPP1yCcV8AM=
X-Gm-Gg: AYBFou3MDmEHMe9KaCLChaG3RXoii2lX3qbuBCpywV5dBcFu5jSUZTIE4sVSXpbg61e
	prCncKDJ33QgeaKXe+RIFB7ADOnGHbcNux6Vj/+sE5pqEtooXrwOLY0jNy3nEAEvyYmVG3qcp7x
	EqCh7Zhqfus8ozbylWOMDq02WbQ8Hrof7eEQRJ2LVqB/V2pwnql/5kmre0qCWt+yfgJKo61j54Z
	okGgKmILzS64WdUBBa90nQVN0odu+zXfkfugeAzDAk+NKgIB92iVigJCb5epyV+OGh6VSz/uuQX
	GA78c+rHcnYKOmA+iMOxO1GK5BZm6wEhwByTUui6hcY9ZWGHgKneQtQlQQJesJmaaUgKkb+TKAj
	ykueD42s5oN/6uotsTJQDImPC5jXIW0Ft67ATbZGnpVlAmnCuKA5JxdCkToHgJCvY3sJstOPgOP
	K9sq6CBuljtlNpKoZ4M4EhoCsubCgsiUKvu26ir6dXpJTNNhrfTVmAfPS7GBlMbA5PVNPk4wyNB
	rOaDnn9TGvisLs+gqqHGWTtVJUhBuPJsS16soAjSAag8SjCyTBaZAdwJZRpgNhGV5xkb+oIuncA
	OhP+aMWXbCqwteoIUSSks0RErJurtvZFSno4J0OGSGRZKz6khIRrExY=
X-Received: by 2002:a05:7301:4208:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-37686180350mr4945485eec.27.1794460345836;
        Wed, 11 Nov 2026 21:12:25 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:25 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] wifi: brcm80211: move the rate helpers of brcmsmac to brcmutil
Date: Thu, 12 Nov 2026 13:11:36 +0800
Message-ID: <20261112051142.2797529-10-ragulbaby@gmail.com>
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

Move rate.c to brcmutil in preparation for the new driver.

PHYTYPE_IS() depends on the PHY configuration of brcmsmac, so
brcmu_rateset_default() compares the PHY types directly, which is the
same for the N and LCN PHYs that brcmsmac attaches. brcmu_ofdm_rates
is only used in rate.c and becomes static.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/Makefile      |   1 -
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/main.c        |   2 +-
 .../broadcom/brcm80211/brcmsmac/pub.h         |  25 +--
 .../broadcom/brcm80211/brcmsmac/stf.c         |   2 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |   2 +-
 .../brcm80211/{brcmsmac => brcmutil}/rate.c   | 142 +++++++++++-------
 .../{brcmsmac/rate.h => include/brcmu_rate.h} |  38 +++--
 8 files changed, 118 insertions(+), 96 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => brcmutil}/rate.c (85%)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac/rate.h => include/brcmu_rate.h} (89%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
index ffdd17eabe..9cd7ef1bc1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
@@ -29,7 +29,6 @@ brcmsmac-y := \
 	main.o \
 	phy_shim.o \
 	pmu.o \
-	rate.o \
 	stf.o \
 	aiutils.o \
 	phy/phy_cmn.o \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index 19ffa72e2b..d707c6e01c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -15,7 +15,7 @@
  */
 #include <net/mac80211.h>
 
-#include "rate.h"
+#include <brcmu_rate.h>
 #include "scb.h"
 #include "phy/phy_hal.h"
 #include "antsel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 4be0bb085a..61a7d08356 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -24,7 +24,7 @@
 #include <brcm_hw_ids.h>
 #include <aiutils.h>
 #include <chipcommon.h>
-#include "rate.h"
+#include <brcmu_rate.h>
 #include "scb.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
index c366a75710..ed6c6888dc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
@@ -19,16 +19,10 @@
 
 #include <linux/bcma/bcma.h>
 #include <brcmu_wifi.h>
+#include <brcmu_rate.h>
 #include "types.h"
 #include "defs.h"
 
-#define	BRCMS_NUMRATES	16	/* max # of rates in a rateset */
-
-/* bw */
-#define BRCMS_10_MHZ	10	/* 10Mhz nphy channel bandwidth */
-#define BRCMS_20_MHZ	20	/* 20Mhz nphy channel bandwidth */
-#define BRCMS_40_MHZ	40	/* 40Mhz nphy channel bandwidth */
-
 #define	BRCMS_RSSI_MINVAL	-200	/* Low value, e.g. for forcing roam */
 #define	BRCMS_RSSI_NO_SIGNAL	-91	/* NDIS RSSI link quality cutoffs */
 #define	BRCMS_RSSI_VERY_LOW	-80	/* Very low quality cutoffs */
@@ -42,10 +36,6 @@
  */
 #define BRCMS_TXPWR_MAX		(127)	/* ~32 dBm = 1,500 mW */
 
-/* rate related definitions */
-#define	BRCMS_RATE_FLAG	0x80	/* Flag to indicate it is a basic rate */
-#define	BRCMS_RATE_MASK	0x7f	/* Rate value mask w/o basic rate flag */
-
 /* legacy rx Antenna diversity for SISO rates */
 #define	ANT_RX_DIV_FORCE_0	0	/* Use antenna 0 */
 #define	ANT_RX_DIV_FORCE_1	1	/* Use antenna 1 */
@@ -89,8 +79,6 @@
 
 #define RXBUFSZ		PKTBUFSZ
 
-#define MAX_STREAMS_SUPPORTED	4	/* max number of streams supported */
-
 struct brcm_rateset {
 	/* # rates in this set */
 	u32 count;
@@ -98,14 +86,6 @@ struct brcm_rateset {
 	u8 rates[WL_NUMRATES];
 };
 
-struct brcms_c_rateset {
-	uint count;		/* number of rates in rates[] */
-	 /* rates in 500kbps units w/hi bit set if basic */
-	u8 rates[BRCMS_NUMRATES];
-	u8 htphy_membership;	/* HT PHY Membership */
-	u8 mcs[MCSSET_LEN];	/* supported mcs index bit map */
-};
-
 /* All the HT-specific default advertised capabilities (including AMPDU)
  * should be grouped here at one place
  */
@@ -242,9 +222,6 @@ enum wlc_par_id {
 #define GMODE_LRS		5
 #define GMODE_MAX		6
 
-/* MCS values greater than this enable multiple streams */
-#define HIGHEST_SINGLE_STREAM_MCS	7
-
 #define	MAXBANDS		2	/* Maximum #of bands */
 
 /* max number of antenna configurations */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 6e92dc4c90..67571db2bc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -18,7 +18,7 @@
 
 #include "types.h"
 #include <d11.h>
-#include "rate.h"
+#include <brcmu_rate.h>
 #include "phy/phy_hal.h"
 #include "channel.h"
 #include "main.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
index f9b40cab76..5d8b7c26ad 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
@@ -7,4 +7,4 @@
 ccflags-y := -I $(src)/../include
 
 obj-$(CONFIG_BRCMUTIL)	+= brcmutil.o
-brcmutil-objs	= utils.o d11.o
+brcmutil-objs	= utils.o d11.o rate.o
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
similarity index 85%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
rename to drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
index fce98dd4d7..aa2c232648 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
@@ -16,17 +16,18 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <brcmu_wifi.h>
-#include <brcmu_utils.h>
+#include <linux/math.h>
+#include <linux/module.h>
 
-#include <d11.h>
-#include "pub.h"
-#include "rate.h"
+#include <brcmu_rate.h>
+#include <brcmu_utils.h>
 
 #define DOT11_ACK_LEN			10
 #define DOT11_BA_LEN			4
 #define DOT11_BA_BITMAP_LEN		128
 
+static void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset);
+
 /*
  * Rate info per rate: It tells whether a rate is ofdm or not and its phy_rate
  * value
@@ -45,108 +46,110 @@ const u8 brcmu_rate_info[BRCM_MAXRATE + 1] = {
 /*  90 */ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00,
 /* 100 */ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8c
 };
+EXPORT_SYMBOL(brcmu_rate_info);
 
 /* rates are in units of Kbps */
 const struct brcms_mcs_info brcmu_mcs_table[MCS_TABLE_SIZE] = {
 	/* MCS  0: SS 1, MOD: BPSK,  CR 1/2 */
-	{6500, 13500, CEIL(6500 * 10, 9), CEIL(13500 * 10, 9), 0x00,
+	{6500, 13500, DIV_ROUND_UP(6500 * 10, 9), DIV_ROUND_UP(13500 * 10, 9), 0x00,
 	 BRCM_RATE_6M},
 	/* MCS  1: SS 1, MOD: QPSK,  CR 1/2 */
-	{13000, 27000, CEIL(13000 * 10, 9), CEIL(27000 * 10, 9), 0x08,
+	{13000, 27000, DIV_ROUND_UP(13000 * 10, 9), DIV_ROUND_UP(27000 * 10, 9), 0x08,
 	 BRCM_RATE_12M},
 	/* MCS  2: SS 1, MOD: QPSK,  CR 3/4 */
-	{19500, 40500, CEIL(19500 * 10, 9), CEIL(40500 * 10, 9), 0x0A,
+	{19500, 40500, DIV_ROUND_UP(19500 * 10, 9), DIV_ROUND_UP(40500 * 10, 9), 0x0A,
 	 BRCM_RATE_18M},
 	/* MCS  3: SS 1, MOD: 16QAM, CR 1/2 */
-	{26000, 54000, CEIL(26000 * 10, 9), CEIL(54000 * 10, 9), 0x10,
+	{26000, 54000, DIV_ROUND_UP(26000 * 10, 9), DIV_ROUND_UP(54000 * 10, 9), 0x10,
 	 BRCM_RATE_24M},
 	/* MCS  4: SS 1, MOD: 16QAM, CR 3/4 */
-	{39000, 81000, CEIL(39000 * 10, 9), CEIL(81000 * 10, 9), 0x12,
+	{39000, 81000, DIV_ROUND_UP(39000 * 10, 9), DIV_ROUND_UP(81000 * 10, 9), 0x12,
 	 BRCM_RATE_36M},
 	/* MCS  5: SS 1, MOD: 64QAM, CR 2/3 */
-	{52000, 108000, CEIL(52000 * 10, 9), CEIL(108000 * 10, 9), 0x19,
+	{52000, 108000, DIV_ROUND_UP(52000 * 10, 9), DIV_ROUND_UP(108000 * 10, 9), 0x19,
 	 BRCM_RATE_48M},
 	/* MCS  6: SS 1, MOD: 64QAM, CR 3/4 */
-	{58500, 121500, CEIL(58500 * 10, 9), CEIL(121500 * 10, 9), 0x1A,
+	{58500, 121500, DIV_ROUND_UP(58500 * 10, 9), DIV_ROUND_UP(121500 * 10, 9), 0x1A,
 	 BRCM_RATE_54M},
 	/* MCS  7: SS 1, MOD: 64QAM, CR 5/6 */
-	{65000, 135000, CEIL(65000 * 10, 9), CEIL(135000 * 10, 9), 0x1C,
+	{65000, 135000, DIV_ROUND_UP(65000 * 10, 9), DIV_ROUND_UP(135000 * 10, 9), 0x1C,
 	 BRCM_RATE_54M},
 	/* MCS  8: SS 2, MOD: BPSK,  CR 1/2 */
-	{13000, 27000, CEIL(13000 * 10, 9), CEIL(27000 * 10, 9), 0x40,
+	{13000, 27000, DIV_ROUND_UP(13000 * 10, 9), DIV_ROUND_UP(27000 * 10, 9), 0x40,
 	 BRCM_RATE_6M},
 	/* MCS  9: SS 2, MOD: QPSK,  CR 1/2 */
-	{26000, 54000, CEIL(26000 * 10, 9), CEIL(54000 * 10, 9), 0x48,
+	{26000, 54000, DIV_ROUND_UP(26000 * 10, 9), DIV_ROUND_UP(54000 * 10, 9), 0x48,
 	 BRCM_RATE_12M},
 	/* MCS 10: SS 2, MOD: QPSK,  CR 3/4 */
-	{39000, 81000, CEIL(39000 * 10, 9), CEIL(81000 * 10, 9), 0x4A,
+	{39000, 81000, DIV_ROUND_UP(39000 * 10, 9), DIV_ROUND_UP(81000 * 10, 9), 0x4A,
 	 BRCM_RATE_18M},
 	/* MCS 11: SS 2, MOD: 16QAM, CR 1/2 */
-	{52000, 108000, CEIL(52000 * 10, 9), CEIL(108000 * 10, 9), 0x50,
+	{52000, 108000, DIV_ROUND_UP(52000 * 10, 9), DIV_ROUND_UP(108000 * 10, 9), 0x50,
 	 BRCM_RATE_24M},
 	/* MCS 12: SS 2, MOD: 16QAM, CR 3/4 */
-	{78000, 162000, CEIL(78000 * 10, 9), CEIL(162000 * 10, 9), 0x52,
+	{78000, 162000, DIV_ROUND_UP(78000 * 10, 9), DIV_ROUND_UP(162000 * 10, 9), 0x52,
 	 BRCM_RATE_36M},
 	/* MCS 13: SS 2, MOD: 64QAM, CR 2/3 */
-	{104000, 216000, CEIL(104000 * 10, 9), CEIL(216000 * 10, 9), 0x59,
+	{104000, 216000, DIV_ROUND_UP(104000 * 10, 9), DIV_ROUND_UP(216000 * 10, 9), 0x59,
 	 BRCM_RATE_48M},
 	/* MCS 14: SS 2, MOD: 64QAM, CR 3/4 */
-	{117000, 243000, CEIL(117000 * 10, 9), CEIL(243000 * 10, 9), 0x5A,
+	{117000, 243000, DIV_ROUND_UP(117000 * 10, 9), DIV_ROUND_UP(243000 * 10, 9), 0x5A,
 	 BRCM_RATE_54M},
 	/* MCS 15: SS 2, MOD: 64QAM, CR 5/6 */
-	{130000, 270000, CEIL(130000 * 10, 9), CEIL(270000 * 10, 9), 0x5C,
+	{130000, 270000, DIV_ROUND_UP(130000 * 10, 9), DIV_ROUND_UP(270000 * 10, 9), 0x5C,
 	 BRCM_RATE_54M},
 	/* MCS 16: SS 3, MOD: BPSK,  CR 1/2 */
-	{19500, 40500, CEIL(19500 * 10, 9), CEIL(40500 * 10, 9), 0x80,
+	{19500, 40500, DIV_ROUND_UP(19500 * 10, 9), DIV_ROUND_UP(40500 * 10, 9), 0x80,
 	 BRCM_RATE_6M},
 	/* MCS 17: SS 3, MOD: QPSK,  CR 1/2 */
-	{39000, 81000, CEIL(39000 * 10, 9), CEIL(81000 * 10, 9), 0x88,
+	{39000, 81000, DIV_ROUND_UP(39000 * 10, 9), DIV_ROUND_UP(81000 * 10, 9), 0x88,
 	 BRCM_RATE_12M},
 	/* MCS 18: SS 3, MOD: QPSK,  CR 3/4 */
-	{58500, 121500, CEIL(58500 * 10, 9), CEIL(121500 * 10, 9), 0x8A,
+	{58500, 121500, DIV_ROUND_UP(58500 * 10, 9), DIV_ROUND_UP(121500 * 10, 9), 0x8A,
 	 BRCM_RATE_18M},
 	/* MCS 19: SS 3, MOD: 16QAM, CR 1/2 */
-	{78000, 162000, CEIL(78000 * 10, 9), CEIL(162000 * 10, 9), 0x90,
+	{78000, 162000, DIV_ROUND_UP(78000 * 10, 9), DIV_ROUND_UP(162000 * 10, 9), 0x90,
 	 BRCM_RATE_24M},
 	/* MCS 20: SS 3, MOD: 16QAM, CR 3/4 */
-	{117000, 243000, CEIL(117000 * 10, 9), CEIL(243000 * 10, 9), 0x92,
+	{117000, 243000, DIV_ROUND_UP(117000 * 10, 9), DIV_ROUND_UP(243000 * 10, 9), 0x92,
 	 BRCM_RATE_36M},
 	/* MCS 21: SS 3, MOD: 64QAM, CR 2/3 */
-	{156000, 324000, CEIL(156000 * 10, 9), CEIL(324000 * 10, 9), 0x99,
+	{156000, 324000, DIV_ROUND_UP(156000 * 10, 9), DIV_ROUND_UP(324000 * 10, 9), 0x99,
 	 BRCM_RATE_48M},
 	/* MCS 22: SS 3, MOD: 64QAM, CR 3/4 */
-	{175500, 364500, CEIL(175500 * 10, 9), CEIL(364500 * 10, 9), 0x9A,
+	{175500, 364500, DIV_ROUND_UP(175500 * 10, 9), DIV_ROUND_UP(364500 * 10, 9), 0x9A,
 	 BRCM_RATE_54M},
 	/* MCS 23: SS 3, MOD: 64QAM, CR 5/6 */
-	{195000, 405000, CEIL(195000 * 10, 9), CEIL(405000 * 10, 9), 0x9B,
+	{195000, 405000, DIV_ROUND_UP(195000 * 10, 9), DIV_ROUND_UP(405000 * 10, 9), 0x9B,
 	 BRCM_RATE_54M},
 	/* MCS 24: SS 4, MOD: BPSK,  CR 1/2 */
-	{26000, 54000, CEIL(26000 * 10, 9), CEIL(54000 * 10, 9), 0xC0,
+	{26000, 54000, DIV_ROUND_UP(26000 * 10, 9), DIV_ROUND_UP(54000 * 10, 9), 0xC0,
 	 BRCM_RATE_6M},
 	/* MCS 25: SS 4, MOD: QPSK,  CR 1/2 */
-	{52000, 108000, CEIL(52000 * 10, 9), CEIL(108000 * 10, 9), 0xC8,
+	{52000, 108000, DIV_ROUND_UP(52000 * 10, 9), DIV_ROUND_UP(108000 * 10, 9), 0xC8,
 	 BRCM_RATE_12M},
 	/* MCS 26: SS 4, MOD: QPSK,  CR 3/4 */
-	{78000, 162000, CEIL(78000 * 10, 9), CEIL(162000 * 10, 9), 0xCA,
+	{78000, 162000, DIV_ROUND_UP(78000 * 10, 9), DIV_ROUND_UP(162000 * 10, 9), 0xCA,
 	 BRCM_RATE_18M},
 	/* MCS 27: SS 4, MOD: 16QAM, CR 1/2 */
-	{104000, 216000, CEIL(104000 * 10, 9), CEIL(216000 * 10, 9), 0xD0,
+	{104000, 216000, DIV_ROUND_UP(104000 * 10, 9), DIV_ROUND_UP(216000 * 10, 9), 0xD0,
 	 BRCM_RATE_24M},
 	/* MCS 28: SS 4, MOD: 16QAM, CR 3/4 */
-	{156000, 324000, CEIL(156000 * 10, 9), CEIL(324000 * 10, 9), 0xD2,
+	{156000, 324000, DIV_ROUND_UP(156000 * 10, 9), DIV_ROUND_UP(324000 * 10, 9), 0xD2,
 	 BRCM_RATE_36M},
 	/* MCS 29: SS 4, MOD: 64QAM, CR 2/3 */
-	{208000, 432000, CEIL(208000 * 10, 9), CEIL(432000 * 10, 9), 0xD9,
+	{208000, 432000, DIV_ROUND_UP(208000 * 10, 9), DIV_ROUND_UP(432000 * 10, 9), 0xD9,
 	 BRCM_RATE_48M},
 	/* MCS 30: SS 4, MOD: 64QAM, CR 3/4 */
-	{234000, 486000, CEIL(234000 * 10, 9), CEIL(486000 * 10, 9), 0xDA,
+	{234000, 486000, DIV_ROUND_UP(234000 * 10, 9), DIV_ROUND_UP(486000 * 10, 9), 0xDA,
 	 BRCM_RATE_54M},
 	/* MCS 31: SS 4, MOD: 64QAM, CR 5/6 */
-	{260000, 540000, CEIL(260000 * 10, 9), CEIL(540000 * 10, 9), 0xDB,
+	{260000, 540000, DIV_ROUND_UP(260000 * 10, 9), DIV_ROUND_UP(540000 * 10, 9), 0xDB,
 	 BRCM_RATE_54M},
 	/* MCS 32: SS 1, MOD: BPSK,  CR 1/2 */
-	{0, 6000, 0, CEIL(6000 * 10, 9), 0x00, BRCM_RATE_6M},
+	{0, 6000, 0, DIV_ROUND_UP(6000 * 10, 9), 0x00, BRCM_RATE_6M},
 };
+EXPORT_SYMBOL(brcmu_mcs_table);
 
 /*
  * phycfg for legacy OFDM frames: code rate, modulation scheme, spatial streams
@@ -203,6 +206,7 @@ const struct brcms_c_rateset brcmu_cck_ofdm_mimo_rates = {
 	{ 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
+EXPORT_SYMBOL(brcmu_cck_ofdm_mimo_rates);
 
 const struct brcms_c_rateset brcmu_ofdm_mimo_rates = {
 	8,
@@ -212,6 +216,7 @@ const struct brcms_c_rateset brcmu_ofdm_mimo_rates = {
 	{ 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
+EXPORT_SYMBOL(brcmu_ofdm_mimo_rates);
 
 /* Default ratesets that include MCS32 for 40BW channels */
 static const struct brcms_c_rateset cck_ofdm_40bw_mimo_rates = {
@@ -244,6 +249,7 @@ const struct brcms_c_rateset brcmu_cck_ofdm_rates = {
 	{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
+EXPORT_SYMBOL(brcmu_cck_ofdm_rates);
 
 const struct brcms_c_rateset brcmu_gphy_legacy_rates = {
 	4,
@@ -253,8 +259,9 @@ const struct brcms_c_rateset brcmu_gphy_legacy_rates = {
 	{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
+EXPORT_SYMBOL(brcmu_gphy_legacy_rates);
 
-const struct brcms_c_rateset brcmu_ofdm_rates = {
+static const struct brcms_c_rateset brcmu_ofdm_rates = {
 	8,
 	/*  6b,   9,    12b,  18,   24b,  36,   48,   54 Mbps */
 	{ 0x8c, 0x12, 0x98, 0x24, 0xb0, 0x48, 0x60, 0x6c},
@@ -271,6 +278,7 @@ const struct brcms_c_rateset brcmu_cck_rates = {
 	{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
+EXPORT_SYMBOL(brcmu_cck_rates);
 
 static const u8 ofdm_rate_lookup[] = {
 
@@ -318,6 +326,7 @@ void brcmu_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams)
 	for (i = txstreams; i < MAX_STREAMS_SUPPORTED; i++)
 		rs->mcs[i] = 0;
 }
+EXPORT_SYMBOL(brcmu_rateset_mcs_upd);
 
 /*
  * filter based on hardware rateset, and sort filtered rateset with basic
@@ -363,6 +372,7 @@ brcmu_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
 	else
 		return false;
 }
+EXPORT_SYMBOL(brcmu_rate_hwrs_filter_sort_validate);
 
 /* calculate the rate of a rx'd frame and return it as a ratespec */
 u32 brcmu_compute_rspec(struct d11rxhdr *rxh, u8 *plcp)
@@ -412,6 +422,7 @@ u32 brcmu_compute_rspec(struct d11rxhdr *rxh, u8 *plcp)
 
 	return rspec;
 }
+EXPORT_SYMBOL(brcmu_compute_rspec);
 
 /* copy rateset src to dst as-is (no masking or sorting) */
 void brcmu_rateset_copy(const struct brcms_c_rateset *src,
@@ -419,6 +430,7 @@ void brcmu_rateset_copy(const struct brcms_c_rateset *src,
 {
 	memcpy(dst, src, sizeof(struct brcms_c_rateset));
 }
+EXPORT_SYMBOL(brcmu_rateset_copy);
 
 /*
  * Copy and selectively filter one rateset to another.
@@ -458,6 +470,7 @@ brcmu_rateset_filter(struct brcms_c_rateset *src, struct brcms_c_rateset *dst,
 	else
 		brcmu_rateset_mcs_clear(dst);
 }
+EXPORT_SYMBOL(brcmu_rateset_filter);
 
 /* select rateset for a given phy_type and bandtype and filter it, sort it
  * and fill rs_tgt with result
@@ -470,10 +483,10 @@ brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
 {
 	const struct brcms_c_rateset *rs_dflt;
 	struct brcms_c_rateset rs_sel;
-	if ((PHYTYPE_IS(phy_type, PHY_TYPE_HT)) ||
-	    (PHYTYPE_IS(phy_type, PHY_TYPE_N)) ||
-	    (PHYTYPE_IS(phy_type, PHY_TYPE_LCN)) ||
-	    (PHYTYPE_IS(phy_type, PHY_TYPE_SSN))) {
+	if ((phy_type == PHY_TYPE_HT) ||
+	    (phy_type == PHY_TYPE_N) ||
+	    (phy_type == PHY_TYPE_LCN) ||
+	    (phy_type == PHY_TYPE_SSN)) {
 		if (bandtype == BRCM_BAND_5G)
 			rs_dflt = (bw == BRCMS_20_MHZ ?
 				   &brcmu_ofdm_mimo_rates : &ofdm_40bw_mimo_rates);
@@ -481,12 +494,12 @@ brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
 			rs_dflt = (bw == BRCMS_20_MHZ ?
 				   &brcmu_cck_ofdm_mimo_rates :
 				   &cck_ofdm_40bw_mimo_rates);
-	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_LP)) {
+	} else if (phy_type == PHY_TYPE_LP) {
 		rs_dflt = (bandtype == BRCM_BAND_5G) ?
 			  &brcmu_ofdm_rates : &brcmu_cck_ofdm_rates;
-	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_A)) {
+	} else if (phy_type == PHY_TYPE_A) {
 		rs_dflt = &brcmu_ofdm_rates;
-	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_G)) {
+	} else if (phy_type == PHY_TYPE_G) {
 		rs_dflt = &brcmu_cck_ofdm_rates;
 	} else {
 		/* should not happen, error condition */
@@ -505,6 +518,7 @@ brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
 	brcmu_rate_hwrs_filter_sort_validate(rs_tgt, rs_hw, false,
 					     mcsallow ? txstreams : 1);
 }
+EXPORT_SYMBOL(brcmu_rateset_default);
 
 static s16 brcmu_rate_legacy_phyctl(uint rate)
 {
@@ -516,7 +530,7 @@ static s16 brcmu_rate_legacy_phyctl(uint rate)
 	return -1;
 }
 
-void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset)
+static void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset)
 {
 	uint i;
 	for (i = 0; i < MCSSET_LEN; i++)
@@ -528,6 +542,7 @@ void brcmu_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams)
 	memcpy(&rateset->mcs[0], &brcmu_cck_ofdm_mimo_rates.mcs[0], MCSSET_LEN);
 	brcmu_rateset_mcs_upd(rateset, txstreams);
 }
+EXPORT_SYMBOL(brcmu_rateset_mcs_build);
 
 /* Based on bandwidth passed, allow/disallow MCS 32 in the rateset */
 void brcmu_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw)
@@ -537,6 +552,7 @@ void brcmu_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw)
 	else
 		clrbit(rateset->mcs, 32);
 }
+EXPORT_SYMBOL(brcmu_rateset_bw_mcs_filter);
 
 /* Find basic rate for a given rate */
 u8 brcmu_basic_rate(const u8 *basic_rate, u32 rspec)
@@ -546,6 +562,7 @@ u8 brcmu_basic_rate(const u8 *basic_rate, u32 rspec)
 		       .leg_ofdm];
 	return basic_rate[rspec & RSPEC_RATE_MASK];
 }
+EXPORT_SYMBOL(brcmu_basic_rate);
 
 /*
  * calculate frame duration of a given rate and length, return
@@ -575,14 +592,14 @@ uint brcmu_calc_frame_time(int bandtype, u32 ratespec,
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
-			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
-				  APHY_TAIL_NBITS) * 1000, kNdps);
+			    DIV_ROUND_UP((APHY_SERVICE_NBITS + 8 * mac_len +
+					  APHY_TAIL_NBITS) * 1000, kNdps);
 		else
 			/* STBC needs to have even number of symbols */
 			nsyms =
 			    2 *
-			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
-				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
+			    DIV_ROUND_UP((APHY_SERVICE_NBITS + 8 * mac_len +
+					  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
 		dur += APHY_SYMBOL_TIME * nsyms;
 		if (bandtype == BRCM_BAND_2G)
@@ -594,8 +611,8 @@ uint brcmu_calc_frame_time(int bandtype, u32 ratespec,
 		Ndps = rate * 2;
 		/* NSyms = CEILING((SERVICE + 8*NBytes + TAIL) / Ndbps) */
 		nsyms =
-		    CEIL((APHY_SERVICE_NBITS + 8 * mac_len + APHY_TAIL_NBITS),
-			 Ndps);
+		    DIV_ROUND_UP((APHY_SERVICE_NBITS + 8 * mac_len +
+				  APHY_TAIL_NBITS), Ndps);
 		dur += APHY_SYMBOL_TIME * nsyms;
 		if (bandtype == BRCM_BAND_2G)
 			dur += DOT11_OFDM_SIGNAL_EXTENSION;
@@ -614,6 +631,7 @@ uint brcmu_calc_frame_time(int bandtype, u32 ratespec,
 	}
 	return dur;
 }
+EXPORT_SYMBOL(brcmu_calc_frame_time);
 
 /* derive basic_rate[] table 'br' from 'rateset' */
 void brcmu_rate_lookup_init(u8 *br,
@@ -708,6 +726,7 @@ void brcmu_rate_lookup_init(u8 *br,
 		br[rate] = mandatory;
 	}
 }
+EXPORT_SYMBOL(brcmu_rate_lookup_init);
 
 uint
 brcmu_calc_ack_time(int bandtype, const u8 *basic_rate, u32 rspec,
@@ -727,6 +746,7 @@ brcmu_calc_ack_time(int bandtype, const u8 *basic_rate, u32 rspec,
 				  (DOT11_ACK_LEN + FCS_LEN));
 	return dur;
 }
+EXPORT_SYMBOL(brcmu_calc_ack_time);
 
 uint
 brcmu_calc_cts_time(int bandtype, const u8 *basic_rate, u32 rspec,
@@ -734,6 +754,7 @@ brcmu_calc_cts_time(int bandtype, const u8 *basic_rate, u32 rspec,
 {
 	return brcmu_calc_ack_time(bandtype, basic_rate, rspec, preamble_type);
 }
+EXPORT_SYMBOL(brcmu_calc_cts_time);
 
 static uint
 brcmu_calc_ba_time(int bandtype, const u8 *basic_rate, u32 rspec,
@@ -856,6 +877,7 @@ brcmu_compute_plcp(u32 rspec, uint length, u8 *plcp)
 	else
 		brcmu_compute_cck_plcp(rspec, length, plcp);
 }
+EXPORT_SYMBOL(brcmu_compute_plcp);
 
 /* brcmu_compute_rtscts_dur()
  *
@@ -902,6 +924,7 @@ brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 					     frame_preamble_type);
 	return dur;
 }
+EXPORT_SYMBOL(brcmu_compute_rtscts_dur);
 
 u32
 brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
@@ -951,6 +974,7 @@ brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
 	}
 	return rts_rspec;
 }
+EXPORT_SYMBOL(brcmu_rspec_to_rts_rspec);
 
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec)
 {
@@ -1000,6 +1024,7 @@ u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec)
 	}
 	return phyctl1;
 }
+EXPORT_SYMBOL(brcmu_phytxctl1_calc);
 
 /* calculate frame duration for Mixed-mode L-SIG spoofing, return
  * number of bytes goes in the length field
@@ -1026,18 +1051,18 @@ brcmu_calc_lsig_len(u32 ratespec, uint mac_len)
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
-			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
-				  APHY_TAIL_NBITS) * 1000, kNdps);
+			    DIV_ROUND_UP((APHY_SERVICE_NBITS + 8 * mac_len +
+					  APHY_TAIL_NBITS) * 1000, kNdps);
 		else
 			/* STBC needs to have even number of symbols */
 			nsyms =
 			    2 *
-			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
-				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
+			    DIV_ROUND_UP((APHY_SERVICE_NBITS + 8 * mac_len +
+					  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
 		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
 		if (rspec_issgi(ratespec))
-			nsyms = CEIL(nsyms * 9, 10);
+			nsyms = DIV_ROUND_UP(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
@@ -1049,3 +1074,4 @@ brcmu_calc_lsig_len(u32 ratespec, uint mac_len)
 
 	return (u16) len;
 }
+EXPORT_SYMBOL(brcmu_calc_lsig_len);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_rate.h
similarity index 89%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
rename to drivers/net/wireless/broadcom/brcm80211/include/brcmu_rate.h
index 9f517be0c7..f350135106 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_rate.h
@@ -14,13 +14,36 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
-#ifndef _BRCM_RATE_H_
-#define _BRCM_RATE_H_
+#ifndef _BRCMU_RATE_H_
+#define _BRCMU_RATE_H_
 
-#include "types.h"
+#include <linux/types.h>
+#include <brcmu_wifi.h>
 #include <d11.h>
-#include "pub.h"
-#include "phy_hal.h"
+
+#define	BRCMS_NUMRATES	16	/* max # of rates in a rateset */
+
+/* bw */
+#define BRCMS_10_MHZ	10	/* 10Mhz nphy channel bandwidth */
+#define BRCMS_20_MHZ	20	/* 20Mhz nphy channel bandwidth */
+#define BRCMS_40_MHZ	40	/* 40Mhz nphy channel bandwidth */
+
+/* rate related definitions */
+#define	BRCMS_RATE_FLAG	0x80	/* Flag to indicate it is a basic rate */
+#define	BRCMS_RATE_MASK	0x7f	/* Rate value mask w/o basic rate flag */
+
+#define MAX_STREAMS_SUPPORTED	4	/* max number of streams supported */
+
+struct brcms_c_rateset {
+	uint count;		/* number of rates in rates[] */
+	 /* rates in 500kbps units w/hi bit set if basic */
+	u8 rates[BRCMS_NUMRATES];
+	u8 htphy_membership;	/* HT PHY Membership */
+	u8 mcs[MCSSET_LEN];	/* supported mcs index bit map */
+};
+
+/* MCS values greater than this enable multiple streams */
+#define HIGHEST_SINGLE_STREAM_MCS	7
 
 /* value for short/long and mixmode/greenfield preamble */
 #define BRCMS_LONG_PREAMBLE	(0)
@@ -50,10 +73,8 @@ extern const u8 brcmu_rate_info[];
 extern const struct brcms_c_rateset brcmu_cck_ofdm_mimo_rates;
 extern const struct brcms_c_rateset brcmu_ofdm_mimo_rates;
 extern const struct brcms_c_rateset brcmu_cck_ofdm_rates;
-extern const struct brcms_c_rateset brcmu_ofdm_rates;
 extern const struct brcms_c_rateset brcmu_cck_rates;
 extern const struct brcms_c_rateset brcmu_gphy_legacy_rates;
-extern const struct brcms_c_rateset rate_limit_1_2;
 
 struct brcms_mcs_info {
 	/* phy rate in kbps [20Mhz] */
@@ -261,7 +282,6 @@ void brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
 			   bool mcsallow, u8 bw, u8 txstreams);
 
 void brcmu_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams);
-void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset);
 void brcmu_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams);
 void brcmu_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw);
 
@@ -292,4 +312,4 @@ u32 brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec);
 u16 brcmu_calc_lsig_len(u32 ratespec, uint mac_len);
 
-#endif				/* _BRCM_RATE_H_ */
+#endif				/* _BRCMU_RATE_H_ */
-- 
2.53.0

