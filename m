Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908696;
	b=yauPKLJ6yGdCWoKvLte+zr4WANnv8VG95rWKSnjUB1U8xNXSCjaXL3S9+yl5WO0ZX7/S
	 ynUQ0V/rxNncnrtum8fu3kHNbRxPCb11pBdwionffX64Xc2DB7YQbBCDsxeVDE18z+5/u
	 6nOBLxSLnmH2vudCXUiTUkveNjoXSyOtGjj9HGH0HS2M+HlyEFXhd6fped686oqB1UyGT
	 OP6L2OfEij3Rzv8iMKcFpaFRpb1dlRLytrpSYBoUQIGako4Albzopbwu4DN+lnrHUkSGq
	 biA4k1YA2GRjTuhPdWR60TUMECM2pAwOvHvCRKQLS+EM66EmUCC4lVrXR186uAnkS9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908696;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=oQtfyDIDL93qm9TFio3JL4iqEkhkLg7XlYuU4NXJQAg=;
	b=Crqkih3y/uHvg/zlf/GZ1nYRQ5+d+xtfU2+qArQNN3/oy5SgYArNGyUG54yi9JgP+b40
	 ReH0+Rjs0iPsqfZrDJwBJY82nFjLgUHnN4U34e37qYwXP0UWZzH12d69ugtncG/88QFuH
	 3libGbOedrtrrc8Nrdd7UVf287k6kuNpX2bOyNL28NtFHmDBfOJcUVElOc/eCOq0oTCeQ
	 d+KncHaDfixycMTpO9GAzm/TzC9sjlNN9Lcce/gLxcVKOUzLBlsNoLdosIUfRLNoqPIln
	 7BBH0FKwKhWNXuUvE8voojxwvm0KoUfd8J3NhAMkrdhsLbFmXtd8B+0EMO2hF27AhyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=PvQi4QUM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17771606A338;
	Tue, 17 Nov 2026 09:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17771606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=PvQi4QUM
ARC-Seal: i=1; a=rsa-sha256; t=1794908507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmIsEjJ6kkRJOM1i1e77crWsHlLuN1k8IaCJediAJJngYRVc9yrARNw+kjw/pBXaUkkqGulTe8B5QinspzpxSgnURurgkzHr9K8Efbx3/1tY1GM2I++dNGJctjhij0NYAXm+X9KPPWWBT2Hz+od3HelLepn2VoLYp96nRtgeL8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908507; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oQtfyDIDL93qm9TFio3JL4iqEkhkLg7XlYuU4NXJQAg=; 
	b=QJms9dfUnqHOPWd/12YiKGjIQuUVkFGixiapfjqIFwIJxSFJSkwnd9Ovc+PKLIbAexm5gbqmCd26qTBHgmcbnQftr8qCCnlFdw5yksNImj7Sonmf4DiGJ7+Y+svhnaEjymg4tptt+dCDe9ll94xv5Y2crsfr4woJwXSX3qDreEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=PvQi4QUM4558djSHJ1GBQQeLt/808nlPxQqVGbX+9fFL5vRuNbmjjKzZHnYB0ZcxA/pX+TikM1dedzbAdjCW5aIel0fkZSFVdv5G/sn3BR8rEEXrGIav6mw9+IgRaO26JkPzhqyA3GKjowKtQOESOv3U32c7jSRaUkXJumEUncit2gfRwHnuRHHBh7EuVAEehF1/ebJ4qK8zJ1ricW6JHAejolzvG0gKHLA/2baFOp5C+tEprnD8N9aJvRFrhhs6fyah2vajR3z2yto4SoxIOz7i6LR5YJBKDbKfgXG0/d9/uqFtV4a7DyzhuVT4tRakK9vUhkouRD6X4KyRcerpcg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=oQtfyDIDL93qm9TFio3JL4iqEkhkLg7XlYuU4NXJQAg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17949085059495.895946994803921;
	Tue, 17 Nov 2026 01:41:45 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 3/5] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Tue, 17 Nov 2026 14:41:33 +0500
Message-ID: <20261117094135.1772-4-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
References: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

Fix the operating channel not being restored after bringing a monitor
interface down and back up on devices that do not use native chanctx
callbacks (such as RTL8852AE when firmware lacks beacon filtering).

Stopping the interface powers down the PHY while mac80211 retains the
previous chandef and omits IEEE80211_CONF_CHANGE_CHANNEL on restart.
Record support_chanctx in rtwdev and set IEEE80211_CONF_CHANGE_CHANNEL
when re-entering monitor mode from idle on non-chanctx devices so the
channel is applied again.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c     | 1 +
 drivers/net/wireless/realtek/rtw89/core.h     | 1 +
 drivers/net/wireless/realtek/rtw89/mac80211.c | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 37ff745..8333b26 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -7761,6 +7761,7 @@ struct rtw89_dev *rtw89_alloc_ieee80211_hw(struct device *device,
 	rtwdev->board = info->board;
 	rtwdev->fw.req.firmware = firmware;
 	rtwdev->fw.fw_format = fw_format;
+	rtwdev->support_chanctx = !no_chanctx;
 	rtwdev->support_mlo = support_mlo;
 
 	bitmap_copy(rtwdev->quirks, &chip->default_quirks, NUM_OF_RTW89_QUIRKS);
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 8e93cf1..780ec47 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -7703,6 +7703,7 @@ struct rtw89_dev {
 	const struct rtw89_io_ops *io;
 
 	bool dbcc_en;
+	bool support_chanctx;
 	bool support_mlo;
 	enum rtw89_mlo_dbcc_mode mlo_dbcc_mode;
 	struct rtw89_hw_scan_info scan_info;
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 7a55fed..a385e57 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -89,6 +89,7 @@ static void rtw89_ops_stop(struct ieee80211_hw *hw, bool suspend)
 static int rtw89_ops_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 {
 	struct rtw89_dev *rtwdev = hw->priv;
+	bool no_chanctx = !rtwdev->support_chanctx;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
@@ -97,6 +98,14 @@ static int rtw89_ops_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 
 	rtw89_leave_ps_mode(rtwdev);
 
+	if (no_chanctx &&
+	    (changed & (IEEE80211_CONF_CHANGE_IDLE |
+			IEEE80211_CONF_CHANGE_MONITOR)) ==
+	    (IEEE80211_CONF_CHANGE_IDLE | IEEE80211_CONF_CHANGE_MONITOR)) {
+		if (!(hw->conf.flags & IEEE80211_CONF_IDLE))
+			changed |= IEEE80211_CONF_CHANGE_CHANNEL;
+	}
+
 	if ((changed & IEEE80211_CONF_CHANGE_IDLE) &&
 	    !(hw->conf.flags & IEEE80211_CONF_IDLE))
 		rtw89_leave_ips(rtwdev);
-- 
2.56.0.windows.4

