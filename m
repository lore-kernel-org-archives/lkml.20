Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEA484230
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364697; cv=none; b=D1M8vdB2N6Yh/2kDYx7Z8g1lkg6bmVC/KWREOTZThjjwu1tDlxsFBGckVeqRomPMvZmnVbfo0cGh1id94lyy5bDBTZkilOay0IPkYe/VUoWEqcd5a95k+strG9GZvrJqjw8QsS0leSmviq6Rl/80ORTzser7Y8JIFlNFMsh/OJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364697; c=relaxed/simple;
	bh=vP6HTc3BgErud3vpYJ5dvc1vGO3/WzphWp/Aia7nZmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZPVvqm2+7Q1OGTA1urbuVoPvRKhJRHyhDDVpvZIW+0oSvVF9QxL/9ixbdh3I0infDkBoGCdh33rotrUsq1gMjbsQHW588ZpXOmsWLNIC6QILVmBrTY4iYw3+DHpXxAoAyOwy8j5ZfTDoRGWzG320oXwflISEqUOpisdCp46LqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4DE3wv4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4DE3wv4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ff680331aso39375365e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364389; x=1791969189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKIJVEsx+Oi+88fJ8TTlph+GBhT516Y05xMo/gmGzZk=;
        b=Z4DE3wv4myqBv/bbO5KPxjzubErxD0BEPDERpPa0rgCUoPGh/N0DvBI1hp8pphb9Hl
         J9NnaeAZTev/wnBQTVbl0vPq322a0U0yleVKK40PbV6tv4y6iZ6t7VbscMl6bKg5APwq
         dHoRm5YyXGWGdTHUV0gHUeTo1HsRj1tCJrpsAGJyyGG6Hlg+Um1+r9vsXrJYO6f/8RPM
         3SqEv8+CmD5YcvGx4A5FAxo65nvzFjbCBIzWhwLgf89vb1G2QDJe+uVPvnnhPMC/m9DV
         kfzUORWIrj2g88VFjlbjoqzVvBo7C2yKJTSpNvoVsmxrqM2ggLhGEZ5vr0NxYF3KGUog
         i05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364389; x=1791969189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKIJVEsx+Oi+88fJ8TTlph+GBhT516Y05xMo/gmGzZk=;
        b=fDnZlAMj5H3vW+QVdApppdWm6OhNa3kzoSkO7JIQo6sokVm/kblU52W+zEhAW7c6Ek
         AEkDhjhqcMx3dySN7N2Ir6DqT42KuiXSi89sR8/qCuqAF3tRB+GFffOZkcJB+4MFHxhd
         qCMXJ/hpYzRA7wReZM+r7iwkXkYnWdl3ZG162Yv4z3E+TFAzK18N7v8K21qNtd1+EhBf
         OoflnLEgXAHjdY3b9Mi+bNfT2pJ28Fsnj9SfnTc28LlIBnKZfFMDKibzRS88i2KF7kBH
         fQ1UjbljwKvnBoi8FzcgAF8oxKODGVPPKyMQtVanSjB1/bRvRDM2P+yF07ryYUT+vp1g
         Y8Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxWRxBhjQN1zF6ULx9CcQvsoCZyvxWdz3TsKw9Vg0UbV9fD6lcol9hdUfvJ4pBYovigvc+cZtZE6lcZzDI=@vger.kernel.org
X-Gm-Message-State: AFuF++miN7Qe74CpiQDazri/qKGgxUCBtNSSoQl8IeWMC9R6TKm01/Ib
	2hZYBh3kmdoxwfS3sTElxD1/FcbKh/yNVekzwg6PNrSmByYusJC8eubY
X-Gm-Gg: AYBFou1FMS9Oe5KfBXYwIguG5WEwl1QOujqYCY0w+5Lk8dIUU9ui+VNuvvzU3oJ2Obu
	nDHMY4SWMOBgJgN/RKA4XZoc4UjbTiIjm/AQISNTvoKxrOUSdMv/4qWwoWnZk/9wmOha+W61ipy
	S91YmH1DtTuJc1Vg8bL+NI1m1VewKcSZJflnhwhCv1RNdvauIxnaf1uKGmIQ55q1GotISBEFrHa
	r9l1zLpy8uLJ5pbJwNApKvHM80muOtDfPJAxj67mfrJTaThR+ZLBVoAZ7QC0E05iqEstd+igm8k
	Ym+jHPzzNSQ0+gg3nYIOZJfoltBrNZF9oazeOzKyMruovMsXUitq3QivOTskEd7mJuVsqN1OtRZ
	mNjMFJMeNqBBltdx+cnqCdQbMRZm9zBRgf8CmqPwcd+poOMMPxzjlZFKvHUlVsAOJ8Qn+ykY2Ed
	GBAZTfgW+VLwd8QAsWys9dzNf8eal7fuITdqNAku8Ca48fhYUaH+GNyGS+YfK4TN8fKYNgO7yH+
	q0=
X-Received: by 2002:a05:600d:2:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a1825a595bmr6969805e9.31.1791364388267;
        Wed, 07 Oct 2026 02:13:08 -0700 (PDT)
Received: from PC ([176.229.9.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1822af9d5sm17617555e9.15.2026.10.07.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:13:06 -0700 (PDT)
From: Jeremy Fareau <jeremy.fareau@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Jeremy Fareau <jeremy.fareau@gmail.com>
Subject: [PATCH wireless 2/2] wifi: rtw88: restore the control frame filter when the device is started
Date: Wed,  7 Oct 2026 12:12:25 +0300
Message-ID: <20261007091225.413-3-jeremy.fareau@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <20261007091225.413-1-jeremy.fareau@gmail.com>
References: <20261007091225.413-1-jeremy.fareau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ed51a86b787f ("wifi: rtw88: Enable receiving control frames in
monitor mode") writes REG_RXFLTMAP1 from configure_filter(), but that
register is reset to the chip default by the chip's mac_init() during
power_on().  mac80211 only calls ieee80211_ops::configure_filter() when
its own filter flags change, so after a stop/start cycle the flags are
unchanged and the control frame filter silently reverts: monitor mode
stops delivering control frames again.

Keep track of the value configure_filter() last asked for and restore
it in rtw_core_start(), next to the RCR restore, which exists for the
same reason.

Measured on an RTL8814AU and an RTL8812AU in monitor mode on channel 6,
40 s captures taken after a down/up cycle.  Control frames go from 0 to
23184 and from 0 to 483 respectively; without this change both are 0.

Fixes: ed51a86b787f ("wifi: rtw88: Enable receiving control frames in monitor mode")
Assisted-by: LLM
Signed-off-by: Jeremy Fareau <jeremy.fareau@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 5 +++--
 drivers/net/wireless/realtek/rtw88/main.c     | 8 ++++++++
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 827f38390969..84d869f1efe0 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -300,9 +300,10 @@ static void rtw_ops_configure_filter(struct ieee80211_hw *hw,
 
 	if (changed_flags & FIF_CONTROL) {
 		if (*new_flags & FIF_CONTROL)
-			rtw_write16(rtwdev, REG_RXFLTMAP1, 0xffff);
+			rtwdev->hal.rxfltmap1_cur = 0xffff;
 		else
-			rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);
+			rtwdev->hal.rxfltmap1_cur = rtwdev->hal.rxfltmap1;
+		rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1_cur);
 	}
 	if (changed_flags & FIF_ALLMULTI) {
 		if (*new_flags & FIF_ALLMULTI)
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index cd9254370fcc..ea61020a0622 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1528,6 +1528,14 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 	/* rcr reset after powered on */
 	rtw_write32(rtwdev, REG_RCR, rtwdev->hal.rcr);
 
+	/* REG_RXFLTMAP1 is reset by the chip's mac_init() during power_on(),
+	 * and mac80211 only calls ieee80211_ops::configure_filter() when its
+	 * own filter flags change.  After a stop/start cycle the flags are
+	 * unchanged, so restore the value configure_filter() last asked for.
+	 */
+	if (rtwdev->hal.rxfltmap1_cur)
+		rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1_cur);
+
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->watch_dog_work,
 				     RTW_WATCH_DOG_DELAY_TIME);
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index c6e981ba7986..5a9bcc4fdff9 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -1964,6 +1964,7 @@ struct rtw_sar {
 struct rtw_hal {
 	u32 rcr;
 	u16 rxfltmap1;
+	u16 rxfltmap1_cur;
 
 	u32 chip_version;
 	u8 cut_version;
-- 
2.43.0

