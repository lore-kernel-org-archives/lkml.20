Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F223ACF14
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929287; cv=none; b=l5/sN/9zpgMl0u5qeH0FoymOPiJQfLBuO/6khzcd3wZBFXQOgSKLRPoKAJdq+0i8qCAbjKuMNnW7tWflXkMThZTjB+r0AUlFS9FCbs6ztq0/lw2mt1WadeqKwTwzaCsYEvZl4bTNtRVSq/Wg3kvduNZSnynY/UTjIOLCHDns8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929287; c=relaxed/simple;
	bh=U26QINrCkExUxCQbdeIIdHwLBM1WAeXYdHE6i6hzEnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDfL3kilXLP53kwJdlBzfXzAcNraixrTKLR59smjo5loODcGu1YYjOrSmQq5SbmFW2Z1oUSYqAIaYsfHCcvbEyE08KWVKkbI1Au6Lomc6X0jebuPfkGNYyMhAVyeuwh5EJDYxwYh7B2Y2+fAD3gd2xXzkUUuSPVUARe+K0LLKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryoGyYKJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryoGyYKJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso25235675e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791929284; x=1792534084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/VSJw9Dx4wYruxLq3Y8KAQxFqaWvsL9v4SX1aZ3ymYQ=;
        b=ryoGyYKJUsH2tcJ72EYj4d7y42niGRxZ5kVIxavp5PMruEqXykxhGUGGC80/+JBpBw
         saV6PrlmMciblTIgrZp29lRhAbo5lBZPS2nIA1tgM13iac8bQY2qJuCXwkw6AsZG7kXL
         MkbJtTwQhtzXlzNq5kcppEoUuijEqz+FKXcli6GbmPMuEYpM06PiberNdP+yiQS5G2/i
         i9wY0WhJFO+Ca3CmZuAZzcKcKUKi2nQIxKXNIKfYkgVua3FmQm+UwYdh+lYWceXtqz5B
         ON6v2Z/twS/ch0PdSegzDR0x9QhiZtOnu9y3cS4NtJp89UALUtIz6x+36QXwKgQJOY2z
         72sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929284; x=1792534084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VSJw9Dx4wYruxLq3Y8KAQxFqaWvsL9v4SX1aZ3ymYQ=;
        b=EeQzzGYbSOCC8y2/TUH5gU0ZfWxgiw8+t63zwiyrENftAwcG5dUkxxcXpKBmYmaita
         yq91wJc7364jcSWz5ZuwUgLxIfDZ+xUci3qMgJw1ac1A1p2eIUOuj+YKR7edDfJMo7hS
         Kpv7sLHgR1ItcKAd+9+XGsvY3V/qLW1RfRycKKafST8AjDDxbn1O3lONHZ2guD6hboLL
         V9dYNfB+5rF8H1SiXHzHjIrxIUL4z2ol2IC38AnH9XQNLyebg/iDEWydoBWuI18huBjy
         bUA4snWgMKr6TQML0J5JiB7QyEqlQh1K9D+MqcxlziSRuIV8Uh9KKNAwRnSV0hxU9UX9
         61/g==
X-Forwarded-Encrypted: i=1; AKwUvBwWSFPpy9vxs7faGdMbE4Eq1x4OfuoosV+fzhALCxX71y+uZY6v415Ct0c7EF21yt5+G2zLuBuXEO0CGzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzsUojHjBKNzA+uIarBwhEUiFGL4IEITI7T8DVh+cxZeDF0vP7
	Iwapkh94/CbO6TaJq5M+udT8y3W7iTZFX1/cduH+Fb6k385A53q0cve1
X-Gm-Gg: AYBFou0Go7ZeV6RvzFI53RU9lf4gT9zjn+AxVAV80mNE/szIxofCQhSnNoqCT8rC7ey
	aSeE/fP51xveAuGUv7Vzkr2LQtuF2cGYmtAfaISxfPFfa98jBHFjBKaOGlZ2jAK13ZYrynQr4iI
	N+zwdM9nkzVjlnSKQ306N57W4iXcOIYT01nJsMnelijne87lkBacgdY/4IrdNUM2qLuX1oeY5l+
	q1wdz07flnvtgpXq74TGUBJzcrIUFAsLGLnFBsHNpgUPEq5vast2rzFp7cFTkoP3jqWI9rJFzMp
	LlFXpQNK0zBFei81ecdry2yB4vxN9sgpGHF9jMQVg/cUJ+8GEsYFj5FsKwpl32k7hDu4A/71CKo
	637H6oJUti8wVtQwehOMapidyBvPqYEBLi5OHGHkkgrG4Jq1Ee1aaDl6R7Upv734CHPdDxWCGl/
	ehadkPiQH396K7Tp3K3KIDpQLFhE6Mq5tJCgnS6rzogoi2QzNvdQ978y+AJFaojFsowH6kJl1Mw
	hCvGTwgZfuGUQEG+mIHIcqki/LEM/x6u0dpVUvTfA3oxrBNNq87J4ZVMBbq2W6Pv60cctbjCeoQ
	cTOVMMWeRJLkqleXMDwvGnTbY61p6EkI
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr278743085e9.6.1791929284014;
        Tue, 13 Oct 2026 15:08:04 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:ce47:40ff:fef1:ce77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5257sm7939755f8f.42.2026.10.13.15.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:08:03 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: [PATCH rtw-next v3] wifi: rtw88: wake the TX queues after ieee80211_restart_hw()
Date: Wed, 14 Oct 2026 01:07:26 +0300
Message-ID: <20261013220726.38031-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A queue stopped by the ring-full path keeps
IEEE80211_QUEUE_STOP_REASON_DRIVER across a hardware restart.
ieee80211_reconfig() wakes only IEEE80211_QUEUE_STOP_REASON_SUSPEND, and
the driver's own wake waits for a descriptor completion that the restart
leaves nothing to deliver. TX stays dead although the restart itself
succeeded.

Wake the queues once mac80211 reports the restart complete.

Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
---
v3:
 - wake from rtw_reconfig_complete() rather than rtw_pci_reset_trx_ring(),
   so the queues are released once the restart is complete (Ping-Ke Shih)
 - name ieee80211_restart_hw() in the subject (Ping-Ke Shih)
 - cut the commit message to the restart case, and drop the measurement
   paragraph, which belongs to the still-open stall (Ping-Ke Shih)
 - drop the comment (Ping-Ke Shih)

v1: https://lore.kernel.org/linux-wireless/20261002231013.11792-1-abdurrahmankaradag19@gmail.com/

 drivers/net/wireless/realtek/rtw88/mac80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09f..b02017a 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -882,8 +882,10 @@ static void rtw_reconfig_complete(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
-	if (reconfig_type == IEEE80211_RECONFIG_TYPE_RESTART)
+	if (reconfig_type == IEEE80211_RECONFIG_TYPE_RESTART) {
 		clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
+		ieee80211_wake_queues(hw);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
-- 
2.55.0

base-commit: fbfa27d9b06f025c5f2cfa79d0e01e6400eeff2a
