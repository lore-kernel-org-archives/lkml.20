Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336256;
	b=ARdV9nV0M/bsntXe8YJ3lvShxAG5pLypnydH94XqNZWSMcosPc6JZ/9zw029JCi/lnxG
	 1cjqX8KLMo+r1gGFfYjYZ41n5eYUpM3FtjgoC5+BC+zIBGS3l3atnGyzk6/Ga+SnwXa4h
	 ofEj/mVCKQoyeBNHxVcHQraSy01xGJYindT0qW/KhVdmug9uMR9/OSy/ptETf3Qwy0ox+
	 hVDwZE+hkuLMbSSuCiKxIVKhE+2deVMRDliQWpzg5w1+MQmMrAUst/Ps1UxQLfd6ArBho
	 lKBJeWlSpL+5hMKfGX/adnyuSf9glRAfH1frIfLpnvbw/64+UpuhfM+uJvQg5dMrqWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=k2qjXhHYTbRY5ib4rbEZychaxcMtUcY53KQAmXfPyFw=;
	b=nUgxLAoCw20jRCK93ycTaFtUdmSOFGWKZtF7uwV7yK4MnMvFrTCtoSOu7uXRA+vvgpxl
	 JplIuTFKe0NVHniNakub4YS2FK7E5EiKO00OsxC2oowee4SLH2UTfXdCmtMoy5+7miKP/
	 Ao//+9lM6y5ldNobZwKVswtHQJY4VJ7ew0QGammJdSJP5UnqZdqfVmeGmoy3ZyvwMzvuk
	 3Oaktt+R19mmCvwKLMGh9E/c0FOUUROIyc2BookdNDMBUlMBdtLJmpjhCMVtRxsYj5Dd+
	 7TssgzXn1YeVwyZCbz2KiKlHFresVEtnoeMvpEIZvfwghqpC8YwDIbxIBKKSaapZLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxe7OFmI;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F92606B58B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F92606B58B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxe7OFmI
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716d052dc23so1051600eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336255; x=1794941055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2qjXhHYTbRY5ib4rbEZychaxcMtUcY53KQAmXfPyFw=;
        b=jxe7OFmIA/rfWVCdSEw2zUNQIz7lGVlXmGGiWrL3Sfg94UrSj8PGwHucv7KHB+V/0c
         MzOYDjQDC2QE/c2RdwGZZtsFnAWIX6zxJmlsBI/lF9kSD5kU5dZqScTKq6zvE2DxGVn5
         1V+J0DcqMkO66G7dQf5UbBYF+C9B0G9F/kiX75rE/XFgZJSUVPkvXmJYRtE29jPLFHOr
         QmLBHn+xn1yO0rDkPkUaTXMZh3Zus5YjMyWDgjdLGivFb2k3GTkuWPBCy7KnjSr/0A3I
         k07hmAgThUQnvoycOUMIkDOxHsK7JaMepuxSLSaTw3OjjWTyLOIDfzp5jGvY12dj0D7L
         /0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336255; x=1794941055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k2qjXhHYTbRY5ib4rbEZychaxcMtUcY53KQAmXfPyFw=;
        b=OuRWoorqDUE807i0hCnNNQaPH+crgphJ1nBxe9eI5x5zmP93pQk7FyIMMqobjOhHgy
         cBeLim2+x9mHQhwfDxIa/Izc4BHtJHfRwgwcY31GmlKrPf3AD57b0MGWFAD4i5HHMX9n
         cbuDvg44tCnnuGRtivcMc8mlIQYF8wp8jVPZdttwFXQlJ7MJefB7US195/yZecS8KPo8
         ps1yl3tkjgH1MAqwHXVARFtlMsZPH3n4c++nmyOW2BMYAkDULiANJwiS7PauNvVWWdzG
         +cfjE/4BTlNddcN7unpfHznng7aozp8B4hUB1wJtmgPrOmAq4s1xRnwVvEKH5TnCZgSt
         0Dyw==
X-Forwarded-Encrypted: i=1; AL+hErHmfZFBq5pDP9NLXTxQEatyE7VBwPnUswUsM9uXdH4fExQZvcGawnq4jcTUWIuuwOzyumUfC5Tsnvk4L/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LeHDndV2EodLb1t3Oif8pKb3qlw7OY5UfnCUY4k3KSQYIxJqx
	hbw7hd/0Lmhf310QOl/aRhS9u5U99982kqlhya9SGl1tekjw0iMe4QMJsU082lp/Vu8=
X-Gm-Gg: AYBFou0yZ7LZIyACFgt/aKigMS52ePii2OBG8pqamDGe+mEa0zYst9skqnHfcX1umXT
	RQoGjhrp+Yd7u67qbjntXKgj616RiCYBnBkv1RSe4DYSg+trMNelOTvWrgOqmK25pE/1UgZY89f
	oMiaUQ2+EFM2xAh8blBFLFNswKpfX/IBE3AdUd7ktIe2Cc+oPbqUQ7HIolcgPXMf4yh5ya2m4Ix
	xcU9x0Md35pYRUT5WcZgJlSC3ijN/12xEsUu/wprFq1Grm8yoCMsCPazltmTJq8fkDeKMgyE9X2
	MfxcAfUU/h+AmFlbJqKL4WiVyWe/rUNEQSP2v9CXmYyT2T4r6mT702NfC3Jj2tLPmhyEUOk4/Ij
	9pA2d7dEiHU25PPBuZijZaEo5DwLewKhnfUdlue8LhBAM5VEZlAMpTFSteA0DkBMKJXrdgx5Ro1
	lvVgJzuyNqHbzwegPQNk1Y8yR26DUr1fnBMSEV+tyJS31xJQkV2xxleDs4m+23JlFftaJ8RYQ+2
	ns2IFPlL4fY3In3xViUpfWANUPtoqzmLGluXKYU5FU23kTUlV+vNRMJ5MbgPUhy3idTq+G4FRwJ
	bcbIipcCtkTXRtiddN+6Tf6A4SUFT7ugmQ==
X-Received: by 2002:a05:6820:3393:10b0:716:bbec:d2db with SMTP id 006d021491bc7-718a5a58c5cmr1165398eaf.19.1794336254826;
        Tue, 10 Nov 2026 10:44:14 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:14 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 3/6] wifi: rtlwifi: call msecs_to_jiffies() directly
Date: Tue, 10 Nov 2026 12:44:06 -0600
Message-ID: <20261110184409.42205-4-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

MSECS() in wifi.h is a plain alias for msecs_to_jiffies(). Call
msecs_to_jiffies() at the 18 sites that used it and remove the macro.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/base.c         | 2 +-
 drivers/net/wireless/realtek/rtlwifi/core.c         | 2 +-
 drivers/net/wireless/realtek/rtlwifi/ps.c           | 6 +++---
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c | 6 +++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c | 6 +++---
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c | 6 +++---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c | 6 +++---
 drivers/net/wireless/realtek/rtlwifi/wifi.h         | 1 -
 9 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/base.c b/drivers/net/wireless/realtek/rtlwifi/base.c
index b6dcdd03535a..d0eda75f99d9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.c
+++ b/drivers/net/wireless/realtek/rtlwifi/base.c
@@ -2230,7 +2230,7 @@ void rtl_watch_dog_timer_callback(struct timer_list *t)
 			   &rtlpriv->works.watchdog_wq, 0);
 
 	mod_timer(&rtlpriv->works.watchdog_timer,
-		  jiffies + MSECS(RTL_WATCH_DOG_TIME));
+		  jiffies + msecs_to_jiffies(RTL_WATCH_DOG_TIME));
 }
 
 static void rtl_fwevt_wq_callback(struct work_struct *work)
diff --git a/drivers/net/wireless/realtek/rtlwifi/core.c b/drivers/net/wireless/realtek/rtlwifi/core.c
index e971132fee14..cc715b491ff7 100644
--- a/drivers/net/wireless/realtek/rtlwifi/core.c
+++ b/drivers/net/wireless/realtek/rtlwifi/core.c
@@ -615,7 +615,7 @@ static int rtl_op_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 			if (!rtlpriv->psc.multi_buffered)
 				queue_delayed_work(rtlpriv->works.rtl_wq,
 						   &rtlpriv->works.ps_work,
-						   MSECS(5));
+						   msecs_to_jiffies(5));
 		} else {
 			rtl_swlps_rf_awake(hw);
 			rtlpriv->psc.sw_ps_enabled = false;
diff --git a/drivers/net/wireless/realtek/rtlwifi/ps.c b/drivers/net/wireless/realtek/rtlwifi/ps.c
index bcab12c3b4c1..ba100c2cb525 100644
--- a/drivers/net/wireless/realtek/rtlwifi/ps.c
+++ b/drivers/net/wireless/realtek/rtlwifi/ps.c
@@ -254,7 +254,7 @@ void rtl_ips_nic_off(struct ieee80211_hw *hw)
 	 * this will cause link failed, so we delay 100ms here
 	 */
 	queue_delayed_work(rtlpriv->works.rtl_wq,
-			   &rtlpriv->works.ips_nic_off_wq, MSECS(100));
+			   &rtlpriv->works.ips_nic_off_wq, msecs_to_jiffies(100));
 }
 
 /* NOTICE: any opmode should exc nic_on, or disable without
@@ -532,7 +532,7 @@ void rtl_swlps_beacon(struct ieee80211_hw *hw, void *data, unsigned int len)
 		/* back to low-power land. and delay is
 		 * prevent null power save frame tx fail */
 		queue_delayed_work(rtlpriv->works.rtl_wq,
-				   &rtlpriv->works.ps_work, MSECS(5));
+				   &rtlpriv->works.ps_work, msecs_to_jiffies(5));
 	} else {
 		rtl_dbg(rtlpriv, COMP_POWER, DBG_DMESG,
 			"u_bufferd: %x, m_buffered: %x\n", u_buffed, m_buffed);
@@ -636,7 +636,7 @@ void rtl_swlps_rf_sleep(struct ieee80211_hw *hw)
 
 	/* we tested that 40ms is enough for sw & hw sw delay */
 	queue_delayed_work(rtlpriv->works.rtl_wq, &rtlpriv->works.ps_rfon_wq,
-			MSECS(sleep_intv * mac->vif->bss_conf.beacon_int - 40));
+			msecs_to_jiffies(sleep_intv * mac->vif->bss_conf.beacon_int - 40));
 }
 
 void rtl_lps_change_work_callback(struct work_struct *work)
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
index d9132d90feb1..f1a3a0c29b98 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
@@ -1677,7 +1677,7 @@ static void rtl88e_dm_fast_ant_training(struct ieee80211_hw *hw)
 		rtl_set_bbreg(hw, DM_REG_IGI_A_11N, BIT(7), 1);
 
 		mod_timer(&rtlpriv->works.fast_antenna_training_timer,
-			  jiffies + MSECS(RTL_WATCH_DOG_TIME));
+			  jiffies + msecs_to_jiffies(RTL_WATCH_DOG_TIME));
 	}
 }
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
index 0dbe92188bb1..bc89d9f2370a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
@@ -154,7 +154,7 @@ static void _rtl88ee_set_fw_clock_on(struct ieee80211_hw *hw,
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (schedule_timer) {
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 
 	} else  {
@@ -195,7 +195,7 @@ static void _rtl88ee_set_fw_clock_off(struct ieee80211_hw *hw,
 
 	if (schedule_timer) {
 		mod_timer(&rtlpriv->works.fw_clockoff_timer,
-			  jiffies + MSECS(10));
+			  jiffies + msecs_to_jiffies(10));
 		return;
 	}
 
@@ -215,7 +215,7 @@ static void _rtl88ee_set_fw_clock_off(struct ieee80211_hw *hw,
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 	}
 }
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
index 00048912900c..a8f88d53e97b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
@@ -130,7 +130,7 @@ static void _rtl92ee_set_fw_clock_on(struct ieee80211_hw *hw,
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer) {
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 	} else  {
 		spin_lock_bh(&rtlpriv->locks.fw_ps_lock);
@@ -170,7 +170,7 @@ static void _rtl92ee_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 
 	if (b_schedule_timer) {
 		mod_timer(&rtlpriv->works.fw_clockoff_timer,
-			  jiffies + MSECS(10));
+			  jiffies + msecs_to_jiffies(10));
 		return;
 	}
 
@@ -189,7 +189,7 @@ static void _rtl92ee_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 	}
 }
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
index bf7b5a32adaa..f93970fefb3b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
@@ -160,7 +160,7 @@ static void _rtl8723be_set_fw_clock_on(struct ieee80211_hw *hw, u8 rpwm_val,
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer)
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 	} else  {
 		spin_lock_bh(&rtlpriv->locks.fw_ps_lock);
 		rtlhal->fw_clk_change_in_progress = false;
@@ -198,7 +198,7 @@ static void _rtl8723be_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 
 	if (b_schedule_timer) {
 		mod_timer(&rtlpriv->works.fw_clockoff_timer,
-			  jiffies + MSECS(10));
+			  jiffies + msecs_to_jiffies(10));
 		return;
 	}
 
@@ -217,7 +217,7 @@ static void _rtl8723be_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 	}
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
index fb893ed8b802..14f2d35c9b62 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
@@ -157,7 +157,7 @@ static void _rtl8821ae_set_fw_clock_on(struct ieee80211_hw *hw,
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer)
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 	} else  {
 		spin_lock_bh(&rtlpriv->locks.fw_ps_lock);
 		rtlhal->fw_clk_change_in_progress = false;
@@ -196,7 +196,7 @@ static void _rtl8821ae_set_fw_clock_off(struct ieee80211_hw *hw,
 
 	if (b_schedule_timer) {
 		mod_timer(&rtlpriv->works.fw_clockoff_timer,
-			  jiffies + MSECS(10));
+			  jiffies + msecs_to_jiffies(10));
 		return;
 	}
 
@@ -216,7 +216,7 @@ static void _rtl8821ae_set_fw_clock_off(struct ieee80211_hw *hw,
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 			mod_timer(&rtlpriv->works.fw_clockoff_timer,
-				  jiffies + MSECS(10));
+				  jiffies + msecs_to_jiffies(10));
 		}
 	}
 }
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 347255b798c9..21a294b80c5b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2823,7 +2823,6 @@ enum bt_radio_shared {
 
 #define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
 #define RTL_WATCH_DOG_TIME	2000
-#define MSECS(t)		msecs_to_jiffies(t)
 #define WLAN_FC_GET_VERS(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_VERS)
 #define WLAN_FC_GET_TYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE)
 #define WLAN_FC_GET_STYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_STYPE)
-- 
2.43.0

