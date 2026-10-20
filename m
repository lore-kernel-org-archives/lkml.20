Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529241;
	b=tA4M1Q1GTl6YhUfu5jYJsgZNjYZyRK7k63a0IBWzrm+8+6ZvBlAKPPFtT4y2JWu4Q304
	 JNqjGb+0tT9dWzuQ6JIiR7FP6+igY2V7tfTrdBivIpl9UrV43mgYujKvrdHFTALvkAjko
	 1hiEPZdkU2dMXEAemYxzygOJvjXbXw1s2XmtSv2G1R8OUv6wBnFXeeR0/Pwpsqmx+7MtO
	 sqXY8culcpKM/WloK/ioN+kJRwhVn01yebOGcmSqaEz1wJylQqCZiWID1n9FaQQ+h/gmd
	 juYVQxa5TXcwaJFYDZv6mlc9xC7gDKnkwDgpsaxzZDN8xKxWGeOvOHQVYOQmARn9yXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oWwviS365/SZT8R8iYz/l+s4G9wz4nTTXfDlTu5N6sc=;
	b=ikzHNlyG6aLhfSLRFVu20abwnr8fRD3ZIYTh43t4fJqJfjYS16ehIQJeBy9RM8GfBgAQ
	 xT8d8TB7TZVO3+f5P+aM406OSckoO//INciIhP6WTPmqnR+up/tyXjxmqr7AFK6tTgzzf
	 pCfrdS2ZMoncKoQQg7RhW1wWKNwnFbzHXpYhg990NCb1z8UkzZ8sobPfwfFnofH2b8n1z
	 ooAwBGQnlmDWs2e88nnPayGoFvNfkcE2MvKg0lyXPYJ73kmm0+LqQJExd/BCX8sKCA5t9
	 UawgV1p1MR2eYvOI5y4KokV9dx1capREWcZ0u5RBVWglXqWlJgIepotA8bP5wFR+uzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FhevP0a2;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0B606A337
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F0B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FhevP0a2
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e6eb77f0bso4319585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529240; x=1793134040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWwviS365/SZT8R8iYz/l+s4G9wz4nTTXfDlTu5N6sc=;
        b=FhevP0a2EnYT7VkY5BrrEpazPlCmMZFUXvmI4mVAC67z/XSHorv5E+EAnW+5l/8YUp
         xmXbYdatTrKgM4NkcoSesc6RGWyhVdgSDznN0akmIUTfJTdT+yzwAfdlKxANDBqBkeQW
         4tf8k+FZjfTTIu/BfCcdngvIPlvj1dPMKInvg6cA5HQxqdMF7SUpVujxBJhsGQKEGMhd
         RGJYVn20bqfJkuSi+6kbRrrKXhb5pB3NKFr0D9EGLAkEk/3uSM1JCJKeQZK+vqpkc2Ch
         2L1gldVV5ozSqDN8Nmp6H4u94M6FeuxlRAtmPM3uLUl2t1edPMxG2xxe8GbT6gKML8wa
         VuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529240; x=1793134040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWwviS365/SZT8R8iYz/l+s4G9wz4nTTXfDlTu5N6sc=;
        b=WTMwFax9zAzH1PWClkU328rWEqsBmvAt7B4oe32i4Xs3OXmwScSNYpidbEfTjTpd+n
         ijigL313N+JLzoA+ed9/fPkzWiB0dJ2z6zL+DrqTyLyACcPy7D8pBr7KswnWaXUJePoE
         Rg75hSYT5f1MX9m8YJMx3nYdnp1aM3ioMPpJxtq+pspdj2cBOcjiqsYPeO6pyMXliafp
         wu46Oj0fJjwbYEeoBmiBURg/iY4IKC6iYPLc7wiH+pF57YlRAvrTt1uvwbj2OSetzCUF
         +Ew9tVZrbpoAh1vGmY+3h4hKG3NkaZ1mXNq82oqZ5VcFmSLG62EvqBoH8PcLXAZYF4X4
         ETcA==
X-Forwarded-Encrypted: i=1; AKwUvBykfP+i/PgfvrFgX1sd9Vw6nVj9agqucAFL2Z0TStpBRzVCfR5hX4NN6nX2pzdWmYp6nbJT/OJCth/Pd6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV+2P3IkQ6VetlyJARNfMMcQ49rpBnjfImxL5NzJOHCHrWOSLC
	BC6Ps2B/5epI/3cQFQUPhXW7mNLzeDYn4o5E+CPqyM3aihnSFATd1dT8
X-Gm-Gg: AYBFou00Xad/jj3OMbiuw30clRyW8YAFPF913+OkCtRcyWyg+BaKHd8HvfUvChcca6p
	kKucz7lye70uun6UqafktlGk9Pt9urw1HmHSnVqeqA5xOYgiLh8G+yMsDQwf5wrLCmbediaujCr
	t09CuMJi9H8cX9p2SmKtL5iir39qBakNzIvpVqzRT2F8ukEVVXd+qTfRezf3AFw9X/S6sxqoB98
	2YSYOuLEJUDAQnwR4zwmQ0LF0tZW18OjTM6PpshLc/i506fp7xHs5O1+yecQA10OHYVEaXz1PSS
	SfPlpbreAvaiSMbfBT/h5Tmi8oppsBZ5x2CCMfuNg+WWnpqC1K4jVnRXsa/6OJJGT+AH3p1mCeh
	ttplyLB5drJRXVI7RLy+lb8725vCpy7u6BouwjHKjDFZQjU+mVHhIaVpkyH6k+XC/WzLBbbjRMh
	chU3PEGqUM8isSqkDD3qJsyR8mYgGsiJUGYZWo4hknr43wk0mGcj2xWOx3b4lX6xGa/LuYTwVxa
	8HQ7y24AHNTqJc=
X-Received: by 2002:a05:620a:2712:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f57f903c4mr67736585a.73.1792529240488;
        Tue, 20 Oct 2026 13:47:20 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6f16dsm79336785a.4.2026.10.20.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:20 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v7 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Tue, 20 Oct 2026 22:47:12 +0200
Message-ID: <20261020204712.3252023-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020204712.3252023-1-mehmet.fide@gmail.com>
References: <20261020204712.3252023-1-mehmet.fide@gmail.com>
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
    Changes in v7:
    - new patch, from Ping-Ke's review of the countdown pacing in v6

 drivers/net/wireless/realtek/rtw88/fw.c   | 40 ++++++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/main.h |  2 +-
 drivers/net/wireless/realtek/rtw88/reg.h  |  1 +
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 2d81aaeed0d7..c5a106a59540 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1809,27 +1810,58 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
-/* paced from the first download: a late one does not delay the next */
+#define RTW_CSA_TBTT_MARGIN_US	10000
+
+/* the beaconing interface is always on port 0 */
+static u64 rtw_fw_read_tsf(struct rtw_dev *rtwdev)
+{
+	u32 hi, lo;
+
+	do {
+		hi = rtw_read32(rtwdev, REG_TSFTR + 4);
+		lo = rtw_read32(rtwdev, REG_TSFTR);
+	} while (hi != rtw_read32(rtwdev, REG_TSFTR + 4));
+
+	return ((u64)hi << 32) | lo;
+}
+
 static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	u64 tsf = rtw_fw_read_tsf(rtwdev);
 	s64 delay;
+	u32 rem;
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
+	rtwdev->csa_tbtt += interval;
+	delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	if (delay > interval + RTW_CSA_TBTT_MARGIN_US ||
+	    delay < -(s64)interval) {
+		/* the TSF jumped: restart from the next TBTT */
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+		delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	}
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
 				     usecs_to_jiffies(max(delay, 0)));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
+	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	u32 rem;
+
 	lockdep_assert_held(&rtwdev->mutex);
 
 	if (rtwdev->csa_vif == vif)
 		return;
 
 	rtwdev->csa_vif = vif;
-	rtwdev->csa_due = ktime_get();
+	rtwdev->csa_tbtt = rtw_fw_read_tsf(rtwdev);
+	div_u64_rem(rtwdev->csa_tbtt, interval, &rem);
+	rtwdev->csa_tbtt -= rem;
+	/* a TBTT that just passed may have sent the first count already */
+	if (rem < RTW_CSA_TBTT_MARGIN_US)
+		rtwdev->csa_tbtt -= interval;
 	rtw_fw_csa_queue(rtwdev, vif);
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

