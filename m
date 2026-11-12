Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504781;
	b=bv/Zd9PiKuui4t8e1IB/L5BDLwsx6kX+0thU4z/1t58xX8mZwv1GzNW2LWeJletFrd3E
	 ozu4S17zqfa4KeUU23ZwuoqOS4EEU01HnBvEGl8XN+4AQ9QVFjEx05RQcXmAMZJfVDYPU
	 HoOITdSPTIAl1R/1EMUkhHShT737RDKUdEoHfzetJVzIBGLGLDOvxbCxyNcWsHWduUBqF
	 vMvPgCCOJvcTvT7XC/n87Zob1hLTs/tPcj9U4y+XFPKG/VCxl1U1opXNiJ5UwiUqz0P8C
	 ZcY6fv43Iw/CaAlC8uLXv/FUxf4YrFrbd5z6o2dOFq92aYNI0o8dXpYyJuV3+yVXrVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
	b=WSSfRxh2k5/rwmLwhqsjVRDw0tEUeNRBdIn6ZyjHPjcN/9am57inh04TsFH5IaTCdaaZ
	 x79BHhTEzB0GRraRaTTi+VlssqIjhERHoYw9cqb6zOKPniQZiuW9HGOCbpZt0b5mVOxrU
	 raNjfzV693FYs7NWLuwBjgjZa6eyo/jvqEfNILks7VdRzdCSNFXs8qI0hevoZICr+Wf5m
	 Elyj6OiEYTMPodaZ+Jip/keSyNCHvrpHybW/yD2LPN7oJbYSnSDMLu575lHK+ohFNn4tS
	 mUaBxAcPdmgm1J5MhQxXlLixxDX4FSyRgPWSORhU5RibFfm3HZL5T5OugcUKORxBXZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePrgk80h;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1C606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B1C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePrgk80h
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso47433a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504780; x=1795109580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
        b=ePrgk80hVWNtLXQgWA+8NxGWfct9k/FlAnCH9AMhF8FZRfKhl61gbk7uDkAaQw4tbD
         qY9eH3VBZohAC7ixruP0VYyYUZfSp6ueU/zrAb6cyhxYXv0i1bk/L0C5sesNTDbhhEEF
         4cfXJFhaxTpt5eSG6zXn/BmQkC+rapTkvGMehUzjlZpfaiKV4OOI9W26q80W4oyhthEQ
         xqn69HX1sp0JsTsPNb/zm/YlK6u+hNob05rhf6YbEuu6qyz11CiZ4kgrsgt8OwkoXeO4
         vp+m33H9Ut209Fa4ILJSiPwZNC8GSDmshBU8FLNzF/Mz1o2zT9rH/qPFdCa+kOV1ufnk
         NjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504780; x=1795109580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
        b=OdxDjd42jmQNF3S9dPLitzyGo3pp5NJLWXEdwl7yJdqZtASTlQVRUPVweoYMGev8z1
         E0mfiA/BTwnzooj9IYfgSr1buVXa/1sNjgTs28uh7h0Rw3d/d8h4icU8Bpa47nCABhFR
         NGTNjaJ+XfSbUFwE2JC7r81yVkxbKy/WTNEVKQvLwnQffDwAnKKV73iujSwv4bAYx8wD
         8wrETSAs84GNRPE6mUWwZj0vwZHQrkoYvg5/o2fz/+Suby9wXf40WxisuH/A8vdyFPVk
         aBhJKNsiFW/jFqpdi9w17/NvndZ7Up/mmjKOK4Lpg6rHapg1SJPu7I0LAV5hAUOC49R+
         FQrw==
X-Forwarded-Encrypted: i=1; AL+hErEMBqvIr2DMBt8khOClNVITg79uf7PokA5DCUQOv/qSobYMtOL5+az42NAr0dbsDgrl9UKYgRRSJyuN8Yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U3G1LGX2503xhOz73ErVhyP4E6zYNkGWHLdGaBi2BvR8CaWBU
	AzCAzHjZ+N6iGasqiApcri+neDfqyOgUm7/mu7MVJl/0uKNnMsayWZtP
X-Gm-Gg: AYBFou2obp1+vzqR7Tc++9ZV8T6vhqzQm3uVFtyOG68tJ7eExF9nkEo0mEa39atP+Vs
	BDMk8mMA7Lss+ZcFmR/asm906iFAPrgpj1/vVV/yD6b6Zprlswxo2PE45PNv9GFujqrXilqgU+/
	VvWeq468QSushQ0NSEE0Ur21Pihf7lr+Dsh583QfkDSTx1C6s+H0cje/kFXb4PIkktRdWBiodpN
	CTLgQYDowHoU04rw1ASQeiWrJKFI9clVbmZXKp1bR3qE9nNEU2TE7yY/yy2O8eNy7ipHdpcJ+Q1
	DSc9YF+1KWYWTx6UIoHkPx63UYoBEVQdNYJhrwJR5yBpJvotD1Emiy78GkD7LBKj11tcMtWFC3D
	8Cd6UMcpgYJt9Hs+mTGlGI0LoLe1oSuFs6xiUaEw0TGqpuCUSEwpjKAeeyCB98AzPA3o4J6jVFB
	Nl7KdIt1YH5DjUs7bbnh+lu52TVx0QX5D3ufiFsKeHQ9kuSN0afvU+XM7vh9P/KlVyZRju/pC99
	KWwun2RxjDPASROPwx9Sw8wW/Ejo/4bh7Klq+ZzxPdoybEDsRQNRx7aY8v/YupRkxrdjlGjXw4a
	UPTy8U6G65eXRo4SedjV5PCpqGcvRWPJvLie4tgR8OHOyWwZIwRDo3VUR1ZkPgmVZV8JI6zzCJ6
	CZNdSG/kWQBFrCmNIjDJGBQseYBPIdcjuaWbGpeWDyBK6
X-Received: by 2002:a17:90a:8c15:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b197bb72aemr1627728a91.0.1794504779875;
        Thu, 12 Nov 2026 09:32:59 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:59 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 1/5] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Fri, 13 Nov 2026 01:32:40 +0800
Message-ID: <20261112173246.3201729-2-hjf3108@gmail.com>
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

8812a and 8814a support STBC, enable it.

8822c will lose reporting TX STBC capability if efuse reports
only 1 path, but this is correct, since it in that case it doesn't
actually support STBC.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b..e243738809 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1583,7 +1583,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		ht_cap->cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	if (rtw_chip_has_tx_stbc(rtwdev))
+	if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
 		ht_cap->cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (efuse->hw_cap.bw & BIT(RTW_CHANNEL_WIDTH_40))
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 781b66ccde..55f1d3d324 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -1077,6 +1077,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.rfe_defs = rtw8812a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8812a_rfe_defs),
 	.rx_ldpc = false,
+	.tx_stbc = true,
 	.amsdu_in_ampdu = true,
 	.hw_feature_report = false,
 	.c2h_ra_report_size = 4,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index b6916d3dc6..e35c57c9d1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -2200,6 +2200,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.txgi_factor = 1,
 	.is_pwr_by_rate_dec = true,
 	.rx_ldpc = true,
+	.tx_stbc = true,
 	.max_power_index = 0x3f,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_2,
 	.amsdu_in_ampdu = false, /* RX speed is better without AMSDU */
-- 
2.53.0

