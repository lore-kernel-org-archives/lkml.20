Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813599;
	b=YCr9xzzzN6Rxzs6VI37eYoF6bev6RPPfwBH3owXwvy3wX5dc8x9y9ZugjCsqgU7n8gfa
	 z0MPjeI6FdS8SEcG9hQGfMq1LIo/zOFEbVFlXfr+FRImx7ZOwlIvAVxgNZS1aPPbTcu3D
	 bEzQxK2kx5E7absqPJIupvnHkz1kTNII+IYdUR3s1K+OUsi7vFHam0n2eok8lbHb0nMa9
	 bGvhYHJ+CkmcCNczIegNQK/eXavOrgUWByqsDZF/PcFKbLnff0AAYFnN6Sqxgh0oB9SNn
	 XeVbmWU7NlOLUAWwjBRgsBU/61xd6ygDkL9mVIRbDWxToVwuTdgs1Ha9wj1LrzvKrOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KRuHofiU2J7VyHMiLF4jfT+Li+922MQCBQJwyXbQIH0=;
	b=ivpoedp71JlR9fdO3p72UySIkk8A3GNGeT6Ulso4qr/hiff3KZTfUkJcpl80ilm9P+DK
	 G8JuVe81YbA79fiASk6O1bX6afj3j6W3D/yMZrgIfarUVoLXxbDv8KEbeapAI1JsN9t4+
	 UT88UhhrCJCCM/SCv3bA1N/Tiz1lNqYep1zpEDW3nAOLctWY3moHT4wUR1UsCIVbaEsrh
	 Q5mqWG552mROUjDDaURmwqxrldashuJgbR59Y6qMlY9P0lIQ+X7wPu16keEcnEhTFURBl
	 vcXEpt2F2ySQSxtNeejPtCQoyyhcygtL059et7DA0PjIFwdonXx4PsDrfHW4fkN9O0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUQ3BMxG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA9606A89C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FA9606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUQ3BMxG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49134c8509fso3078985f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813598; x=1795418398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRuHofiU2J7VyHMiLF4jfT+Li+922MQCBQJwyXbQIH0=;
        b=EUQ3BMxG5MKZr0iKEzXiZQvQuoNee/8rbhqcHVls2U9CC7qataPBTXa/kpHY/6rp9v
         Ak47Z4d3EUHIB7o+UT7hw5gEDaN7HkWcqqofV8+we+0UCa5NurNko5oVxp4ytR2FeLcY
         N9IBG9+8+AmuWMf76ZngSoMVdKFDD20HNYlupLzy6L6YqEU928VNOwnMpwTLdqrSB7hC
         qtlP7mt1bAwXUp0agpfxzJMBQQUmvaGnYvlcd23dhs/cbjWQBzcM9eEcg6ARgquNsCjO
         T8xwJwkMPc+hxvQ1SI2MFKMY3KPHfnfcK3+8e/Djq9pQ98cxU0j+J19VDE7H77cBMx3/
         4fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813598; x=1795418398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRuHofiU2J7VyHMiLF4jfT+Li+922MQCBQJwyXbQIH0=;
        b=rCvjBFmEOgIgQGs6AuPHgYEq9h8T1Srb/6mP1DFQ3nqKRdpSGPEfTV+PRQJGhqtBTh
         THYQCNkXOP2DH+5trsMJISg2GV7FkcuqZVIoLpVkW9e9h72vaxZem/1+HZ8nMQ1MMsd+
         ne8tfSqoLwwuiuxjEIjz04qHEWyT01eJbkGbBkZKeTGmZNLl0iyigo8F7lfNTy2CqOCK
         5cTZOzAQmPhhiI0TQlrz2M3arHcvgak0RF6r6gK6Vkd5bq9YQ6CNhgzSobWkYqjOSEpi
         hZlcXu2GnLKHbwtNxSxc3P8CHovdU3JylcNRVNhoD7FB7lfOCNdyREuU6E30dIdpWShx
         Ca9g==
X-Forwarded-Encrypted: i=1; AL+hErGTugZV1ihZNrPw4hTLkhGJURSO77dO0Xl8OdUjquGUnUkTxRuhz65NoOYIBXyQg0Bstw+XFErima8wk04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tXuoymTZ2z84r5OL8LInlSC1MASNCpNcCvZjpe15joDNN5tJt
	blhMyX/jnYIxKWvG8KUKRrkJ4gkmPAwhgzmax6dmiv41lrIaKDOlPonD
X-Gm-Gg: AYBFou0WbpKmxgcSosr0bWVvQB8aJX35Pvn5dZxZkskMtRahGqsGf+FniFROQSPozT5
	nXBOtB3motjvkljBlNK0XPvBfx3tt7wV7di0svX1ygs5u2bHWMN0w5RzcyCoj8Ln/dhLZznYSpI
	p/uo1YEDtSL89U8Rw2F6dwzrohOwAhNkeYJOlNSzLcvNE094DOE8qtlmGp3SnSPDambP5AvmkND
	u5ZFjvAt2tBMQf/s5wSR1sUBI/7sDpRAyNiJ/LCkhhz97bFnjt81kwJGcdj6CahtOPk8Wwzz/5A
	mUCO5Ljj4HKyu3zBwVpr4z5xkW1Ptzphzl+ZRU/OapujEsak7Km7RFm7usf+o3uE2lMM6Y9ukiV
	QMt03RfJz0i9O/rbkjr6BwEQVOcMSqorixuZTVA1o91m/3dzj3qoGd6SzrNSTLEOmM9STkA7EIu
	auw1B84LpvYUJzJA0R50m6D9W0LTVv5Z000DgiL9dT575/1CQSvCYcM2wnAvJ7uhFu+PZ9KqYeH
	nbWVWru3ld2nsD2yFwaqcOfDcZzaAFwODSPmpriknI1bWfGoCdKMgNUlnQ5FB6tIgbtLRWKG5uE
	q2j7u3VfTsk2W+o7W9+BbZDY7ayVdT2vjQ4=
X-Received: by 2002:a05:6000:2513:b0:48e:47e6:fdfb with SMTP id ffacd0b85a97d-49c70ed7c9cmr18513919f8f.13.1794813597551;
        Sun, 15 Nov 2026 23:19:57 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm20756980f8f.10.2026.11.15.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:19:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v11 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Mon, 16 Nov 2026 08:19:52 +0100
Message-ID: <20261116071952.1142013-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116071952.1142013-1-mehmet.fide@gmail.com>
References: <20261116071952.1142013-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The countdown downloads are queued one beacon interval apart, with no
relation to the TBTT. A download that runs late past the next TBTT
leaves a count out of the air.

Queue each download 10 ms after the next TBTT, read from the TSF, so it
may run late by almost a beacon interval; a later one is followed by
the next at once. A download that ran more than a beacon interval late
restarts the schedule from the next TBTT.

The first count is downloaded the same way, not when mac80211 changes
the beacon: a download close to a TBTT keeps beacons off the air. On an
RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon or
the old one. On an RTL8822CE a TBTT up to about 100 us before the
download sent none and the next beacon stayed out too, and with a count
of 2 no CSA beacon went out. The switch completes up to one beacon
interval later. The replay after a hardware restart still downloads at
once.

The USB chips raise no TBTT interrupt, so the TSF register is read. The
beaconing interface is always on port 0: rtw_core_port_switch() moves
an AP there, an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 42 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/mac80211.c |  7 +++-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +-
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 6968b608c54f..2b5d6268e7f9 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1818,14 +1819,41 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
-/* paced from the first download: a late one does not delay the next */
-static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+#define RTW_CSA_TBTT_MARGIN_US	10000
+
+static u64 rtw_fw_read_tsf(struct rtw_dev *rtwdev)
+{
+	u32 hi, lo, tmp;
+
+	hi = rtw_read32(rtwdev, REG_TSFTR + 4);
+	lo = rtw_read32(rtwdev, REG_TSFTR);
+	tmp = rtw_read32(rtwdev, REG_TSFTR + 4);
+	if (tmp != hi) {
+		hi = tmp;
+		lo = rtw_read32(rtwdev, REG_TSFTR);
+	}
+
+	return ((u64)hi << 32) | lo;
+}
+
+static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+			     bool start)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	u64 tsf = rtw_fw_read_tsf(rtwdev);
 	s64 delay;
+	u32 rem;
+
+	rtwdev->csa_tbtt += interval;
+	delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	if (start || delay > interval + RTW_CSA_TBTT_MARGIN_US ||
+	    delay < -(s64)interval) {
+		/* at the start, or the download ran too late: the next TBTT */
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+		delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	}
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
 				     usecs_to_jiffies(max(delay, 0)));
 }
@@ -1839,8 +1867,8 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 		return;
 
 	rtwdev->csa_vif = vif;
-	rtwdev->csa_due = ktime_get();
-	rtw_fw_csa_queue(rtwdev, vif);
+
+	rtw_fw_csa_queue(rtwdev, vif, true);
 }
 
 bool rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
@@ -1893,7 +1921,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 		ieee80211_beacon_update_cntdwn(vif, 0);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
-		rtw_fw_csa_queue(rtwdev, vif);
+		rtw_fw_csa_queue(rtwdev, vif, false);
 	} else {
 		ieee80211_csa_finish(vif, 0);
 	}
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 4bf47116ac73..b88fc420058f 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -441,8 +441,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		/* the countdown downloads its beacons after a TBTT */
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		/*
 		 * A beacon with CSA starts the countdown, also when a restart
 		 * replays it. A beacon without CSA ends it.
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 5d18841a705f..466992b85c43 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2096,7 +2096,7 @@ struct rtw_dev {
 	struct work_struct update_beacon_work;
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
-	ktime_t csa_due;
+	u64 csa_tbtt;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a..3ff4ae0885ef 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -506,6 +506,7 @@
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
+#define REG_TSFTR		0x0560
 #define REG_MISC_CTRL		0x0577
 #define BIT_EN_FREE_CNT		BIT(3)
 #define BIT_DIS_SECOND_CCA	(BIT(0) | BIT(1))
-- 
2.56.0

