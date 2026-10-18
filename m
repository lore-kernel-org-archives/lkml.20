Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D03414439
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345755; cv=none; b=S/m5HAefnFQ0f1mhxRrRezFpdYfYgYWcYsivyQJsd9UbmqffaFhJKsWosWfQDBVYVsVsjAo7MwyeztCmcL9ixsV2A8+jJWERGbMFdJ+wHz51v9xgtGgU3wsDcnvsc+TGGVyxnA0TnS70w9rBiDtDIhpD+dQGAduDAImZUGXnbdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345755; c=relaxed/simple;
	bh=reAtcGD12mTxfAacTQ8TlV/MYmLBX0r4W3wjqX+D4ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp1dcAqKZofXuldM8EqdoD8PflMR8rwe2FhEpDkjSHkF7d8VoWaq3OG/LaUY+tOmVhRTEiGSqZPko/v4aZo198Fpb+F5dIqwy+dDjjCmORTcEs3hzf2SUCAZa8s7iiNjpCu0TZtJKr2DahZqOGtlWWQFQUeoMjiS3q6OHVqU/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=NhYdFJZz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="NhYdFJZz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso219941166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345752; x=1792950552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCxxJcbhpSt1i5F/1qHiqoph9gxQorPREPwC1lnzTjw=;
        b=NhYdFJZzIv4+wfCtzVlEuTd6hbIg1cg54aDnGDREnb5eKw/5fO8FQ681+gdh0qAShW
         4RBVbCnTxfpM/XFkj8AFoCvpX5XJGZaOpELi/vs37eOiFHx8YsUWWnbaXDISxhpLt+bW
         vt+d4FyTbGmXjAEo1WoIOlCFuE2LFNpGHDN5Lo9lod8CNHzMyYjE2PCEJQSoeb+A8fiu
         tAi8R1q3FMsezXEvBng3vq5btVOSORN+bixRd2LI4FOOsV4Cc9wiZEKHSqc/WuQFGxe8
         SK1pwONkhTD5eM4yU1kPE7Zaq9Nw3NNkQsSZq6p+kH6Pa0eZsxr1XUkW8oNrGfcczJnl
         Wo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345752; x=1792950552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCxxJcbhpSt1i5F/1qHiqoph9gxQorPREPwC1lnzTjw=;
        b=C1BqSzVrmFY+og+OxDSamv3L3CTwoY99DsliVzpmI9r2RZOnjBGD/avUobtwiy6ew+
         M1hBX0L14/Vchqtdgu7eQ5DhSRUpM9qAQZ+BvfEqfmHfubfki/MYQM0aZ7rvfM6tevx4
         j2Um/dFH8/vMuFoAHQ3WMYEt9KKJyrQ69lGtbW6Tq72taNP8dXCly5GrcEjodLROXPhB
         t0Mn+YTiAH6cNZ/Zpvd3zqtdpSm4RDhpZ+09snTSup5U/GUMlH7RJZO1A/2HAKcaGb5/
         P4btYm/aiSNvzaesVtftxYGf5JwxgmWpAYQ5an07si6RvRMqPlgd1TUPxURTLM7dD4qg
         SZpw==
X-Forwarded-Encrypted: i=1; AKwUvBxDtpBFbAXCGTK9t54e0eG/1Eutr2KColyoN4FV5fcHnmiXQLad4Vrf81aay2mg0yVkfS5fS4Q2viTplnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyxdhLGp7+D0lYXPzJDU+IcN+zP3yY0ZIaSX9YQxJZ7/vc9wrL
	WOs2Rf5D45gW6ocNA1VD2TJ2seCcnDaDlutOE56BKnQg+ud09ynf6U2zmO9uvVvwxA==
X-Gm-Gg: AYBFou1/nqFg1rvR8cPU077IQV45AcC0Y+eA8UFMSTLkZxyJndu61qUiH8k+SP2rGbJ
	UKpdto3se4OaYUwWRbhwysNU4qXUDpUxFfykG9tpFRozof1fqzhHQj9Puf3StnW1RaKPOFZs35d
	Cak1pGKZ6rRRy1G1yZ18ojak8A45wSL3rvNulAUAD55IgsTQltadx5MfmAmfGh/eoj7LCggfbFX
	qhBl1jPBsHxf4bn4/FD7/OgDvEo3VnXv2DkyAOLfKHyvrwcda/iTrHcmBn6kYkpvD+Mz9kTmMca
	jGBMfzPvRWi/2yO1NFNmW2uj2eBUMXlRHcOtDOt+/eWgL0jpSAiSoEivljkhN8D4BQLG7wJqvtK
	wDcyxPgGkFZPmUytOKawlAm+lIKz3WXjnhfxTTU3oYLsiwdeY4iCgoCT7EwH6RBwTtihqlwzbQI
	Jg4OAj8wMCFRCFgzE8DZuS1cHKev0JfRji2AnzTBXcWVz5ey94LGY7Ne9CHwdtV44Xt+QzVeBEJ
	pJFfv5gznlyThUYcdwRUizTokyKcjDqLSDJmjQuFof8UON9/mqOWd8Wcch4oP5hTD4B3CdBYQaw
	ckpWYzkwt7DuNeua5k5bC+loruUYpc3lFUZ6nyZBQQSIav78nsyJbHR0I8nFxaT3ayed8e6H/Gj
	rEo8O9aCY1SAY+vHpX45+/1C7R2eT29f34C0paEPMKdm37A5r5D6WoVabhGvQmLlHsEOJXhuG1c
	ko0FnM0FNg
X-Received: by 2002:a17:907:9707:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c419e93247bmr367634766b.27.1792345752006;
        Sun, 18 Oct 2026 10:49:12 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:10 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 2/9] wifi: ath11k: enable airtime queue limits
Date: Sun, 18 Oct 2026 19:48:57 +0200
Message-ID: <20261018174904.1757161-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without NL80211_EXT_FEATURE_AQL, mac80211 applies no airtime queue limit,
and a saturated download moves every queued frame into the hardware TX
rings. Set the bit. The estimate uses the rate ath11k reports through
ieee80211_tx_status_ext(), and the 4 us floor until the first PPDU stats
arrive.

With the series and the AP pinned to VHT MCS 0, a TCP download to one
1x1 VHT80 station keeps 22 Mbit/s while the sender's mean RTT falls from
526-587 ms to 42-44 ms (three interleaved runs per arm, default limits).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90a0404a101a1..6f4462b7d3f15 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10652,6 +10652,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0

