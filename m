Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E359E335
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892498; cv=none; b=qPkz4Vc4H+N79VobUiI02Pd/WCs8CFAHN1d1QCq9tLKqWFMyPsqSDMgI4FTGUw67UvVuLqiu6ASQSUmPvWlVVwAPC51ukXaUtGGMTzXxHXanUKIapJvykZr2wbAlKqFxh9bSeag6BBBcmSBvzfE/9ajzR5T9GNHSD3grsd/ypMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892498; c=relaxed/simple;
	bh=p73uIhn90vkjA4n++9xzUcN7kt4Mz0jQtzZuhnvlpqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAWD8QbhDSAbpBbfF7AhUR1jiEGF1e8GjF95W2ufC7HS2JPdgv6A+avuhyK1mPK2u4LE6wLekGEwLT2k2JncIpwXvjIUoqCtcTWR+/j57Xl1pmgE0jq5PALz0fZRBdjWTUSnmkHYfcBxjaQ9rfCWIEvaMnbQ9rPCu43L8wq3uiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crInCLMf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crInCLMf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso49233145e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892490; x=1789497290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYkOJfL2Luh0LmRnAEnNC7cqyiQXe+QAe+A4B9EKt44=;
        b=crInCLMfchbwJmiWxlKyvc6ZjeRNPlyK2evTYsiWmjbgPzey/GvRN6/ZCBvdc1aqKd
         SMA1MBfRqbxd0WNupFYxiRK35gBzTq06OMpe0sCSeZXw4ZwedU15PjgAsZ7Y7i9K8qpe
         O0Xlk95vY173/AwVXh+iiEfzdd1nxRpu7Kbnmr0nHtHhHX0KbzwONagYlWiKWaeWTXqJ
         yivI9Wf9gUyQNbBCYqqqDdvQr5rQWfgY1JuYhqAnVDvTVaqu7ZT2pszLYLBo0/q5ZYyz
         waH4kpaWP+j6yjqc7aqThscDKdVlTLaFJ3TU8A2Bht3ZnSJOneQsUl0NHqpC7IVLIOIZ
         e76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892490; x=1789497290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYkOJfL2Luh0LmRnAEnNC7cqyiQXe+QAe+A4B9EKt44=;
        b=Mnj4HecNnG2RO9LzwIwRjSo/Z5EWcEH8wa0FTosGzjTYp/fKUldWbecYDhWa0hUrfP
         h/uM1c73oY3beZrDQyApiYYrcveZdM/biOHsuv/VdXD5io/p8E/UGvWy/96OrfUleULN
         Abj/wAeeKJ/eHG87tmtArt8xIjph8KFXouVh/EQX1zWyZLnc1RCo7+abCAdTDFStEZz2
         hKC19YdTqWhiE1P0JzVLtwk73fXMoTCqlGmcWwFcrWKaqqs0WdfneNdgWTjxI4iyINSQ
         e3ziQAWvVThZFxL8tHWlGwDbazd2cBD5SlbD1x/t5ggwFX9PSjnR6zntUsjs+It16zI7
         fFZQ==
X-Gm-Message-State: AFuF++l5kX24agfn2c2hGBVehmooZNfGh9p9FKjyXvQ5h47ehrEmdkrE
	k9jx5PvqGFg30Ic8S0/JLVPSTrqwWeZ2mLib7BJDVx6AJW5ebYvSYKFu
X-Gm-Gg: AYBFou0qZpNO4Z963mvCw11Xs/mFoBEfn7ic7ESYh4qwvTbskEfhVzz2VacHMEC+/Az
	LXPSeuJeDExbyF9fWaDuelFIe5J/qgZiAmTliYAeqqcdWJ3Dp6I4tZedbcmGoJAxTZxrPUCWIga
	7X+oq+IfBfBe5IuvEq2oJLumOvd+5AXMCKemG0qKJJMkRo8swlXZkLAK2QVIv6zkzHB675xI7dK
	0IMTHodbzlbNfha3Ia7mxSVfWxoUmSJ7UlPUH24vVL3swx7bx/z50RekxolMoqA2To4b3d7VoTD
	z90M9VnnpLKciTjxIGUt1AIFsLY0dGqzvcJNbvdPFclJLEwkme2PvI6uJq2QFEytmk18Am/orRG
	LJesozoQtt/RLMvYmbJikkGXC5CyrXOjl5ix2aHERIe7cztX8KqQdixyw2FtDa9TFXdxOkFOY5p
	oPap2ilauib/njbn9H2uvZqCSuI3Llvq1Vsznmorheot8X6dnEidfvasmSjO6yNc0hGS8=
X-Received: by 2002:a05:600c:83ce:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49cfa20cd37mr273835735e9.22.1788892490458;
        Tue, 08 Sep 2026 11:34:50 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:49 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: hal: clean up header files style
Date: Tue,  8 Sep 2026 21:34:30 +0300
Message-ID: <20260908183430.3256-4-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h              | 2 --
 drivers/staging/rtl8723bs/include/hal_data.h     | 6 ------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 8 ++++----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a20b48660..c511d70a0 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -529,8 +529,6 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 	u8 DeltaSwingTableIdx_2GA_N[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_P[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GB_N[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_P_8188E[DELTA_SWINGIDX_SIZE];
-	u8 DeltaSwingTableIdx_2GA_N_8188E[DELTA_SWINGIDX_SIZE];
 
 	/*  */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f67ca4969..a8aa38eb6 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -14,12 +14,6 @@
 
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
 	RT_AMPDU_BURST_8723B	= 7,
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 179fae4d8..322d7153e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -428,7 +428,7 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
+void get_rate_set(struct adapter *padapter, u8 *pbssrate, int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
@@ -446,8 +446,8 @@ void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
-void r8723bs_select_channel(struct adapter *padapter, unsigned char channel);
+void set_channel_bwmode(struct adapter *padapter, u8 channel, u8 channel_offset, u16 bwmode);
+void r8723bs_select_channel(struct adapter *padapter, u8 channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
@@ -508,7 +508,7 @@ void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
 
-unsigned char get_highest_rate_idx(u32 mask);
+u8 get_highest_rate_idx(u32 mask);
 int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps, u8 bwmode);
 unsigned int is_ap_in_tkip(struct adapter *padapter);
 
-- 
2.55.0

