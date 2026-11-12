Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504799;
	b=o2hAE9Og5OzojoT5gIrPxjH3vZ3MHxP//4rKP5+DZJrVwHFZlayRs30nuwYi1IeZ0eTa
	 qtB0s3hhZXXBtK5HGXwhsf8k2KPRILJAIXSDtApgLbaL0+tsZ2mqYkn86GH//fiviYiYm
	 Ed0mKVfiFByFz447Sr7XFjxzEGwDH/JUHIQKmaPsn+R0wW99V+aeYnhVgsFRTc7QwOxO1
	 xfRy7shwqaHZf5f57zyvZY+9WETU9evzivLjXtyYVbBX7gqDe5ZaCRLmWTee4vPbm1wxv
	 qx71WPz464HsL6dXJcVZ+Q9O9M+3FDhOztL6cl9VIHi7in9AaFNTxW6u9wgvvE3xyKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
	b=mcS5voSSzqSGz6tOAsZqOc0ovXKMjJnhdhL6eFlcTO7mZTMYmyXiJ4saSR3jqnV8Is9d
	 eOUqj8qAK10/nyOx1Bvun4fD/HQxjKYy+PvJq29XGWtKxDqJF58UMIbahceBuqEltk+84
	 hTSCJvMqMp2XhR1wFdCJEDqUzBtfclZ5+tV5/+ra/+nSfgZs3L7G6t55zrK2RBhuhMb4/
	 A9aaj/n9HZrGnvWQ2njCk0CxgKY5vfPPcos2Mw9BsFnGodSpXteHEngccUaTynuJyrcqT
	 8zUUKA0sxS4htUQ4b3OHMuOTLaemLLrBxu6TmvyqlngVAprsVRoaPCG4CEW5vPR8BMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1vZoe5B;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBB360A383E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBB360A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1vZoe5B
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso819730a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504798; x=1795109598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
        b=x1vZoe5BGYRuFpBLOPhCdQU5gaILZzJUx+nRkt8AFoyK8kmvscUCWl31wyuMeezn03
         gkrX2XlXFOvTOeSnFPVbZhF7+hkEtQdEmh0tOH8rm5HkrHRZF2SMu4fE3lVutMhvezbP
         0fLgGJxfIG8WIAfnc321rvtIq5PEAkNfTXXDaUlHPj45hKM6x9sfhK4ql8OT8270ro8o
         eu9RjRmuMUncOMIw3ZIPlyMgGpYHvYzp+pmTrrYu/1/gjeignl8B8O+BqsVO4LwgBUXv
         BLEnDTC6+qoXFy/1jf8fYL+grywzlbn0hBrfbDNKzyWtOcR9PoZTxAoN5cs4Qst3SIk9
         3oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504798; x=1795109598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
        b=DTvZkBygRQg1C5FjMINmXbdJIX+2uw039gQTA9lsLDA719QJEpX2q4g7I0vqf0lK+U
         gcKL4bMMTGEk6DT4YSNyyqddHlx+xfDrBktJ18R/FGR0mqTCyTnsp0iV6T9mqNrbO9vQ
         yOrGemd1o1Bq58GnTiZYaSaR31kygnJQq8yXvm25oGI6kSH9RjB/+jZkhzy39tXbjCQb
         SJFveOZjVxUfe+N5vUf+qdBLfL3/sBzlco3FCnVoXt10ZCybe5uqQP1ha7M07Kby1lCU
         5n8H8RGequze9e5zxgNuZPlGzwpMPYC+ZeIGCjy/KsjcanwBfbXQw+MNvEG5G/AHPe2O
         ImzA==
X-Forwarded-Encrypted: i=1; AL+hErHzOioJgKDmnHUXFwchHh0YkdD/zt+EJT3mAVUX0w902Iru3aRQWlXMTW/97JZ6sok0t8QDqilr50kSOC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0QgucogxC3JBWFaATXmEI1Fwple4R15K1w45pMwAFnuibDAj+
	PSFQboiVgU3zIG4cDXHRvX3mGZcvnAIrxGTgEADTf7YI8lM/gFwsClow
X-Gm-Gg: AYBFou1sp+7mGXQ2TKexfw39R2vybreWHjMqPdgsZa0bQiKp0Q6EJsWfmGnJq/aeqCt
	Q08ZSsPJnP9WGD7u7kIOoTVHG2HiQw+T2XLVpPkrm5PkN2gztvlAXRI900Q6gEGQyQ9uJUeGxpo
	sX7MTGbb893nqPmXFU3OFaFcvf2O26ouQvj2hxFH3saMbHJpplmHWV9SzDPJHzCup47Pomi+oqm
	FIXamZYAQlEcmMvvVKck5RM8LtUXLQdRLexq/cBgX4UIFHA6R4ll3ff/Atx/nm3V0wUKRGH0pzj
	ZPNxuLMwthAHcgrccP6V2IMDBwGbSuHPGkK7yTxsnrxiOkthRXfp+rfR+AdwWH2O4mx7yXhpD7g
	geHsFYDMNlcwSxKQ+PiBcswCYESzu62OXBMlVNerzExhwobLsdzR5Di3p4TA39Vtw0CQjjXBWB7
	xh4CDPeNBQTp6OnZik/YdyRn8LCkryClh2YHxmAIvzOU0xZgQf3ESGSTmx0GB2Dorc1bXWuT0ZU
	dukjbXUjuZMM9P1gdQN/neY9ChxkrQbm9zY/YJUE1ylhItOapkZ+v5HhuTuK6LOt1QY72rGgxcL
	55JAS/AGpekHYhVVLIII9c91uJdnRa5vZuo1xhUoza0082Cm43Z8MTcVx4XL48x8O48Lg1ahQZb
	0a09jbVLDxshk9HSTOrqaNq1QDu2ZAjbyb1jfUv8zEH27
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr2243793a91.21.1794504797884;
        Thu, 12 Nov 2026 09:33:17 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:33:17 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 5/5] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Fri, 13 Nov 2026 01:32:44 +0800
Message-ID: <20261112173246.3201729-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173246.3201729-1-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com>
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

Honor the peer-advertised receive limit for transmitted A-MPDUs.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 10 +++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index c8008cf43d..c8f5cdf31c 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -78,6 +78,14 @@ static void rtw8812a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 static void rtw8812a_do_lck(struct rtw_dev *rtwdev)
 {
 	u32 cont_tx, lc_cal, i;
@@ -926,7 +934,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8812a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 17d3677ca4..796c100165 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -49,6 +49,14 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_64K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 #define CAL_NUM_8821A 3
 #define MACBB_REG_NUM_8821A 8
 #define AFE_REG_NUM_8821A 4
@@ -872,7 +880,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8821a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8821a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
-- 
2.53.0

