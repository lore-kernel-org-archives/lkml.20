Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583149;
	b=q65/pdSzsEZSwYkB206vvbz2Oz9q9DCgUrHfUMfWtByVw3wxC1EtbN7VQtiD6OlFjNdY
	 bz4rsR8jFlltKobapKdlrxXFw30FKTpbzREdTyPpSHS34iVjbMuJ79jQi/Fz9MIcEow2k
	 3UWKRSvLlXCpFfwPRZhiD8mHTKki5rKJU6Pk6bA2bH6m/CwERvpcxKHFpHI2mX8nPpcI3
	 8bFPcp5MF5XPBvvsb2av2EHVsnL/C3F+uN9TdUzBl1XvBdd+vU7/4LwzKaDNlwtAp0gaB
	 r1rPrcASpxvrSLgOG2qAIXMx8YJscbLT1uDU3rSTVo+EjTEAfURtfmxaxkCSFQ8PCkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R0eHgsfU7qXBDz2l3eke7gewwI73Cj16ENClQlx46sw=;
	b=QjlB8ut+6tPGxvwnFfKLf71BLGOw0zLwERt4mcLsaxP108FZAgJpbsggI3fI0kOAlFs6
	 1fc20LS3Ydnl6/suteVB0LQvbX2mb2wb1niVXRSnh3qA8cghVXNOrCIiTB9lQw+PRPA6l
	 n8pjzUYEOWb5Y2MIACEiReN5+VOXQoIaB+dMgoR3G2ywzBqKihyCMHKId21RC+/wD/zae
	 MkQLdyPb2s5YhUnVDtnzBPjyY9P7rBLlBQN8zfrWza7FFGhqgHr0LQIiT1VXXBrFxN8Ph
	 9YN70DK3njzzDy8OgOFwEYcuO/fxWROpjSKtUCHEeCQTmsTVcCHTBHYpzoT+0HbPzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QiYAgDsl;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F746606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F746606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QiYAgDsl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b060ec084so492232f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583147; x=1793187947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0eHgsfU7qXBDz2l3eke7gewwI73Cj16ENClQlx46sw=;
        b=QiYAgDslUA1DXE83yPJkQ7JwtRNiT4VxyKy7Lq7UgQsz5EFeNHcI+xHMWGtyDlm/qR
         hrHrjN79SqULLwRErlZQuAsy+SaebAplZd0rKt2wyeAfVE+HUhuH+Tx+KYRhpbfJ0ldz
         NBPs+OEWgNkCp8Gp7Rj+RGRF+VHsHpyn2lox8M8+uJVnCvHJOzJrCEHV0wyN6YfFQEmh
         ASy0egYm9VvIRDo/uT3+1OqsRLp3OryoD6IxFW5HipcuPcITfZfBmVk9LkS3TA9zYBxo
         qdUY40Gm1eDAQvtzMRPwSWVQE2uhAaR2YDkrKPlLieGvW/rtwfjJlQDYZbz4XxAA363G
         eqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583147; x=1793187947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0eHgsfU7qXBDz2l3eke7gewwI73Cj16ENClQlx46sw=;
        b=zUi69+fHUoIbZGY+jISr4ST8qxJ3HQzKU4hYLnGkMj2Ehah2oS0S64iMif/dzoxU3R
         UP6ogoqtzjA4vHz20N8FjTkWfdcHFNvKC+ZsRM3G7lumcc/4OtiU7SMdNMp3z0rRNIgn
         fKK9XgurSvW3jUN0M33JAypn7MXtgJn1Eo8bIXAS+mK5ITI7+h5bsgye4YQva+UAsjFR
         8naALMZJK5/SuryZZFPmd7KhnQ/JZtYRNO8G3NuvwmKNyS5U6vvI3fJGWV3I8pwFv5p7
         bHjLWtSxFKLZExw8dJpXSbEP1D3X18x02zRT1hlGEFQBzOCdGUEHfJ+VdheBKznTp4Lt
         Hb0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTEFaNHOnaTENeubWDVwnCqqHaT7t9wn1Liuuy8kHZhkYY/Zey2uHYZP6G0Ed+s8O2DSCnGofOcdhvJsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrDx5fNI0x7HUyzf1tNPGsGtNOk2BARP8uNW50N/gHyOIKoSe/
	VjJSqwwd9/da/Tgbs9k694+7hqSdD8Pr7l7SUC5pO8wVuiD2ivPfy6Ma
X-Gm-Gg: AYBFou3nhs0g4CGuRO/lIK1rkM1alAjRDG3aJwgNnogR5/fXpIiPZE5gYRIermFnXG+
	fI2LZtBJQco9oxhJAiwJOtH6kJhHwIR/TwEXFTVq4gNC6o0ugHh3xP5p53au+7q0PXKfWR9q2IA
	oH+VGX0LDeW6dpbvBwEKE9WkhesNOOOtib4Up/yBRml3A12Eb5CUWhoIoX9cyue9+nlB115lsAR
	Eo7oKO+p+gB3IZYSUOKsXXE4OWe8nyvrSwdhLK+IqrJkakHAtCwG0m3FudX2YEaI0+5KUcOHcQH
	1dgLM86YkSUSKQF84gIPKPsUQ09DRWHlQVFkjU2PJK3SZ6jmA9pt7CqVX0gNrhwvkkYA+zEcXpw
	kWYq6quEGMN7lOca6IxUmV7byz0V5vGOF2RNcCVgoW1Nn5zP+pq4oaVzc01QyOPpsRchHCQfHq3
	bPiVDP9Sn/oAppHhStxTZ8yxBM0HTWn08IJjZkrEDMbCwkgPa6VelStGeQD8BKpOPOaNsApcMEL
	QDfGX8q4hmQIezmWZ+fGvCjF5TawJJyfklWSenbMlJPTwrWKeQWMGAkNrxu6g==
X-Received: by 2002:a05:6000:71c:b0:48a:fb55:416c with SMTP id ffacd0b85a97d-48e2649d51cmr3316575f8f.21.1792583147275;
        Wed, 21 Oct 2026 04:45:47 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828ca3sm4944112f8f.25.2026.10.21.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:46 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v8 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 21 Oct 2026 13:45:43 +0200
Message-ID: <20261021114543.4132776-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021114543.4132776-1-mehmet.fide@gmail.com>
References: <20261021114543.4132776-1-mehmet.fide@gmail.com>
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

A TBTT just before the start may already have sent the first count; it
is taken as the one that did, so no count is sent twice.

The USB chips raise no TBTT interrupt, so the TSF register is read. The
beaconing interface is always on port 0: rtw_core_port_switch() moves
an AP there, an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v8:
    - the TSF read retries once, if the high word changed, instead of
      looping (Ping-Ke)
    - rtw_fw_csa_queue() takes a start argument and reads the TSF once,
      also on start (Ping-Ke)
    - the port 0 comment is gone, the commit message says it (Ping-Ke)
    - empty lines where asked (Ping-Ke)
    
    Changes in v7:
    - new patch, from Ping-Ke's review of the countdown pacing in v6

 drivers/net/wireless/realtek/rtw88/fw.c   | 51 +++++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/main.h |  2 +-
 drivers/net/wireless/realtek/rtw88/reg.h  |  1 +
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 2d81aaeed0d7..9ba4f1c244ec 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1809,14 +1810,50 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
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
+		/* a TBTT just passed may have sent the first count */
+		if (rem < RTW_CSA_TBTT_MARGIN_US)
+			rtwdev->csa_tbtt -= interval;
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
@@ -1829,8 +1866,8 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 		return;
 
 	rtwdev->csa_vif = vif;
-	rtwdev->csa_due = ktime_get();
-	rtw_fw_csa_queue(rtwdev, vif);
+
+	rtw_fw_csa_queue(rtwdev, vif, true);
 }
 
 void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
@@ -1880,7 +1917,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
-		rtw_fw_csa_queue(rtwdev, vif);
+		rtw_fw_csa_queue(rtwdev, vif, false);
 	} else {
 		ieee80211_csa_finish(vif, 0);
 	}
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index bc3ebfec11ae..3be0a96d1186 100644
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
2.55.0

