Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399336;
	b=tlG/VTF2IDwoVkfCiAIdQh9Zs6PKn1Pf8IblwRj5pMVU05HKUmgGGuMs0ONdR4AMT/P3
	 LOm1/bC5peI5dzmCjAXFzV8IsJ7opvV86VJuURDTbjoeB9dh+gjTbfRbRxlHOLDKLSt8d
	 Y4AUczDU8XBcd+FmcuWLYHvamkFXdW+DTDpmoptwTvNUy8jKJGbRWqOH3+AGt3HZxSquZ
	 qeww+IuvcXEW2KKKfjdSNTdBfF9qPzF2G3jEbSlcTvbIFa9bcklsf0NkgGgDP7zaRzW6W
	 9fDVGbVz84Nu1QIuCOdHuvm3a3f6ZUXZdCuBBY2zT8qeGbc+YWVV5YbgDiRv6N7ipfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
	b=NFzyMkFrBHwEa48spHm3cnPE9V51HQL6Mu/ihSV4alm45fr4vK8C8L2oTTD/cuR4DvmI
	 ILE47hgLDW/HmQ1n61u6mRzAlwgY+EvayMOKscqXF6AyQzkreiUnPFEHWthl3TSNa0K2e
	 Udm2n7AMLgP/eBNMM4VPGLK1JqeIglAb1mH9kz7unH5GxktF6mJgNkodtkbAZoXxC/KUc
	 JYZ6qBXgoNrfkHm32VseJaiicRGMpVhtW6O8vcOGLd5IM6Hv+KIQ0byPlIV+sJIghY1eL
	 HSwgjpYmZkDnBkP6/7tASn+e7jyb+K7m1uni0MxpMkqHC4JTb7xiWIDuDW9ejgbtVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDRACTxp;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5AA60A5BD4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5AA60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDRACTxp
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5430f70c827so31460791cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399335; x=1795004135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
        b=LDRACTxpcaBYPqqXesao5drPy1TGCWlgCCJwTSD6BC/4JxEA7rUJ76bdsiMeqDsVvI
         xR3GhV4ZrdGYs8u7LjBlGqQ7SyTWCLikTc9A5ieH7qgyfrlE3ZZTNrRjfof4DWRh9mdV
         RLdHRcrr1xyvonnAJ58laY/on9XAUZN4H5SXIWB4xOlgZpjZUwR0fAvonsSISAo7EON0
         W7EBPHQC3c2J4s+8uwlMKtfrYYaT2zdi1XTUpzHL0erWuvhfN2UVujGMjl458WbYnc8U
         JE2p0UWCW+dPOH/F8Lmy+YYsjTAG+t1+8MBeTjrfT1+DFiiwv2uZJrbSUHsM/ctpytl7
         LbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399335; x=1795004135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
        b=EZXS4o0UrVqowuTLZGXKzrtQoWeTU1wzzmjr2eKQePE2F9ZH4KpFwr+P8YHGnPEZ9x
         KB54cJjc589ruj/RH3ECIlSi5RpqF1TOO5ltVAGRHn2lK9pwt1ZecuT844eboNlyyWWS
         ttDssQbmwxGFDjEtyh8TpnIVFhpJrM/1ztwqL2KRSehBPcVR7sDteav3tvTc+nzSJakY
         I98OieJTBZ2G7zhyPUCBGskmgylm/iobXF0/fMbrbBU1jiJXQLA4NVzO+n5Qo+AZHdbc
         5pI7i/i/Rm6Y/lMwMmlP5fBnZrMYEnqjTSYdcbayUYTCyedhLAiBysnOq9cpIo0ZaaQs
         LDLg==
X-Forwarded-Encrypted: i=1; AL+hErHC/T+ozLsW95XNr3zneaYnRwsDeZSjEvAV8bIYulcWaz/r7VLgS7VrQF/Mgiwk70TnlK2cp9L0bsxQJac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X2RR6Gz1YXg+U2/k5m9KWfSmbQ2dIxS8N5A7fT81TcPWNOGEU
	mBD3GDdxW60tMFDdcX9YM26Eqmb0hqtftahEs8pMZfLFRVmi6RJGY8Ni
X-Gm-Gg: AYBFou16TjVZAkLa14gkXvTi4/P8nnl3Wq+WSk9GGD2FdHa3US2aOyYIKImj2XTZVCX
	jJWsAmj25Vw3U7uWbLm2+/hZbcUsEzdrIIO/xP0yWycgyw8nFsJzm6hhascQ9HrgrmLAn5CJiIs
	leAghzA0HKTWab7uQao9UYbkru6MGtAWDKXfRiWrxSnCysKghg532aoz2WIGiQWrwxVNRmr2HiP
	B2xFr6it8h9roBAZTWhQiTqOCswaZRdzgsbBP78m/JDSHYjiKYGdWASooy2MScF2ctazBP8UsXj
	0wI8d4GBRNVAW5KWJ91LVbU5LzR5StbHrxgbVVl1W6x5WNVgJpd5cuLp4GVoM5EpIodWStGXvIq
	+dHyNwFWqkVOgt022Cubj5UtfF4a6MZK1Sl6VUJzAocnKr5bZN4Pe3sIa4kiTktNhxPejIQHQQk
	Oprbox/SXhey5yX+BOUNje8nr1Wua3C4WDo2vbXZ+ygugj5PgfHKPtK9tbl9VcF5Sv1jCB2YzHa
	to6jg7YeF6p2PRZ7J+h6l5zS/Pjpqi72Z5+8sFZmfzrM40glfMjaz8HvEMPHbD2iPi1Pu0QKsxU
	oBzVEBMHmX7cd2KCl9GhaAWrmU+nuw+4Jjs=
X-Received: by 2002:ac8:5749:0:b0:533:3e09:22bb with SMTP id d75a77b69052e-556c05ee974mr29897441cf.42.1794399334705;
        Wed, 11 Nov 2026 04:15:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 11 Nov 2026 13:15:25 +0100
Message-ID: <20261111121525.358041-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111121525.358041-1-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com>
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
the next at once. A TSF jump, an IBSS merge or a reset, restarts the
schedule from the next TBTT.

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

Notes:
    Changes in v10:
    - the first count is downloaded by the countdown work, 10 ms after the
      next TBTT, and no longer when mac80211 changes the beacon. v9 took a
      TBTT up to 10 ms before the start as the one that sent the first
      count, but a TBTT during the download sends no CSA beacon, and with
      a count of 2 none went out at all (Luka). No download runs close to
      a TBTT now, so there is nothing left to guess
    - rebased on rtw-next
    - Acked-by from Ping-Ke and Reviewed-by from Luka dropped for the
      changed code
    
    Changes in v9:
    - Acked-by from Ping-Ke (on v8) and Reviewed-by from Luka
    
    Changes in v8:
    - the TSF read retries once, if the high word changed, instead of
      looping (Ping-Ke)
    - rtw_fw_csa_queue() takes a start argument and reads the TSF once,
      also on start (Ping-Ke)
    - the port 0 comment is gone, the commit message says it (Ping-Ke)
    - empty lines where asked (Ping-Ke)
    
    Changes in v7:
    - new patch, from Ping-Ke's review of the countdown pacing in v6

 drivers/net/wireless/realtek/rtw88/fw.c       | 48 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  7 ++-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +-
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 2d81aaeed0d7..c30aa938f9a9 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1809,14 +1810,47 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
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
+	if (start) {
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+	} else {
+		rtwdev->csa_tbtt += interval;
+	}
+
+	delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	if (delay > interval + RTW_CSA_TBTT_MARGIN_US ||
+	    delay < -(s64)interval) {
+		/* the TSF jumped: restart from the next TBTT */
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+		delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	}
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
 				     usecs_to_jiffies(max(delay, 0)));
 }
@@ -1829,8 +1863,8 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 		return;
 
 	rtwdev->csa_vif = vif;
-	rtwdev->csa_due = ktime_get();
-	rtw_fw_csa_queue(rtwdev, vif);
+
+	rtw_fw_csa_queue(rtwdev, vif, true);
 }
 
 void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
@@ -1880,7 +1914,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
-		rtw_fw_csa_queue(rtwdev, vif);
+		rtw_fw_csa_queue(rtwdev, vif, false);
 	} else {
 		ieee80211_csa_finish(vif, 0);
 	}
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index e6c9866fd599..dbd148760b9b 100644
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
 		/* restart replay resumes it, a beacon without CSA ends it */
 		if (conf->csa_active)
 			rtw_fw_csa_start(rtwdev, vif);
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

