Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489275;
	b=5Mqj0nSAofKlwIdD/BKmzMRUROY2w/C/iu7W98eFt2Ng1CmUDVnE0XfpXddUiwNLPfuy
	 blsTYm32VRv46GqrBNJzH9I7CrvtlskB0MRROYHyr4u1+rim+olCyYFz35THFqGmPn1xk
	 VPLREXhnmxsFNAyPLkWWShKWBk++yQ+aF2SJjCar1A2GUaW6Be0m+l5tqizQ7ok0my+J1
	 Jh0lBx6qlY2Y1mVvyeaPQ+Nvy5WcTh9bWSxVMMWargLiINc2Gexw7vBuW1ebo6vFKfYNl
	 4F9IGmq235uHfftvWvMA3+DnQQl8wVjddrZ3h+PpUY31P3yg1bENXNq908VVtQby4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
	b=Mia/cumxZaFncN5S7SUs8cErICCxNzKyE7CyL3B06Ng/aRVnNtcpuaSObXhFXCFU5PBy
	 h1qs+R3j2674wJvtGc9Jtd/AvEO198AH76H/mxm8tkekv98gO6+j3TekMRxoBei4gSkPn
	 Woz8iSzkiuf4XrkS2Gv2V2ZiPEuADeWKXVnjrcJsiL/7502IH9BiyT+su5ESSVw9P6tUK
	 tHAMrmPdvoDx1cnR253fCGCfYtAWsT8qynkqegIRvEJ4VDPq9y2ZkSTMs67iqLTWVGO+g
	 Mb6NvapUbj3SiDNutgJHy9tVWi07HUVGeVcPfcarUjpkKPgMk/jze1F2ZW1CoxrPsdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYBPTTOm;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B949606A887
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B949606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYBPTTOm
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18818daa3e7so397098c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489274; x=1795094074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=vYBPTTOm8GleGcw3qfhCn+TvP4oQRbhRiMedd7yb2IrVyeLBuOipFOMRuHNpo9eWGv
         6eaa7YX6ALpVeFl2m8JQ0XrlGMhF5Hew3fIsCPur/okc/Wf5WR7Z1oQVR6YONREOvwWc
         z7TtZc8HUFyEN4nFniimnXYo++Wn3Go9HVC/Z/msQcVeZVG32cYY29HWaeaZvLlrit6q
         8eVhqmMwmipFQpnulFnp5Gdotg0YRvQqnGZr2lOIb5WW613M+fXyzVEVC3VMpsaCAKYn
         Q/KuPfOECxbGGQnYD/cWUnR/RADetbdRSUR3KWvPrOkhDfI1upFpdSUHfVh5IxgOjO8h
         PyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489274; x=1795094074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=NC9IW9CvHoNrarHs/8WxZvOLR3vEYz7aaOi/cJ81mW+3Q9HeyLCThz0V2dEj836x7x
         QDgqBIQvDyDXotXmdYE2p7U2HNjfISiuG3B742wFB7coj9R+BEjMd0QlA8odUPaTAa7n
         7gofrpEDCVVRgoq9yABHavy0qjbFEDKCARWMiYjj10wSPz+ii7e3/JHnVaIbKf6NYuMO
         EzzmCtiXkGDJ/EjwahiNIuBTRdbgzqFyM9DKVvXXICk75R0v3oL60qRZeSYBZO4fQAUT
         gVcm0PFv0Suhru7QK6AGjhpGSQUc8InzswSIguLcr5czdY0L+3v2eDwrpCtpu5IcU5hx
         i8ww==
X-Forwarded-Encrypted: i=1; AL+hErGMAt5ksb7mT4XkadoLapxDNcziaTpD2JqVgfy5QkfbxQ3OIk6fmOq0GaAdgaAB9kxc8eb+/ooTcGKyByU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k1Emz/lqyV64Mc8bAFy10KViDTbx5l9RyUxMjrnTlqU+PYPEw
	itCILITdljmZWzthUCDFoQKEffIbnvBNx1wHbSi2j6HavQ5WXecozzzE
X-Gm-Gg: AYBFou2vDYVlwgURkhl5ITQXrJG9BrdboooJM2Lz5h/d+PEPsh2S5oYn7MEukeL8wg3
	dtVm5aVY3/KR9wp91j4GvNhpxios/Q8/F1TCSTNAe118o7QpIZIuhbHHaZpV7oUN9Axflyn2x5s
	DZV+YNdSHP8QiBZsuT2FFd0flagwA6X88WrruB+S/FXNkjN7B3Lhi8R8+KHzwap6+0aVOITSjut
	A0BSUswrSY8YACacYhl72SMsxG50+OP47WD0u+90DD34QjZs/4tK8inlmD8YUAGzJq8Ezg2heKi
	uFI5RlTYU2CA0a/eiIh/HGs1dUKdOWH4+QSDPeJFMUx8Y6/h+N68Eolr9SByiVR6s7Gn/JzTGep
	GhnGScrM3Mgkfe7uEugQGjNNRxu6lu3PWqi+T1sy/Zczaw1id02AXFo9YSmaYBwxphYzRqF5Unx
	qNslAL7HAZ4FP0b5DOtJQpdDZ+fKkhOll+xRnyxGGbyWZ9wbPRyJyfkPzJHADq95M+nb483ocmF
	XK92Lraf6P9AuYR40O/1SihcGZfVtHt1YogWXf5oAaZ6w5zxLVNfoeNGgXOke2gmJccHb10tJkq
	87QbU86eK1GmTUH3LG8gSg==
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr1835486c88.2.1794489274209;
        Thu, 12 Nov 2026 05:14:34 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:33 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Thu, 12 Nov 2026 18:43:59 +0530
Message-ID: <20261112131401.236433-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112131401.236433-1-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com>
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

When mac80211 stops or suspends the device without WoWLAN,
drv_reconfig_complete() is never invoked with
IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was in flight
during this transition, RTW_FLAG_RESTARTING remains set permanently,
blocking all subsequent firmware recoveries until the module is reloaded.

Similarly, if rtw_core_start() fails during drv_start() in a recovery
restart, local->started remains false. When mac80211 cleans up via
cfg80211_shutdown_all_interfaces(), drv_stop() returns early without
calling rtw_ops_stop(), leaving RTW_FLAG_RESTARTING set permanently on
hardware that failed to recover.

Clear RTW_FLAG_RESTARTING in rtw_ops_stop(), as well as in
rtw_ops_start() when rtw_core_start() returns an error, ensuring the
driver always exits the restarting state on error or teardown.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e..ffd86f08185 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -57,6 +57,8 @@ static int rtw_ops_start(struct ieee80211_hw *hw)
 
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_core_start(rtwdev);
+	if (ret)
+		clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
@@ -67,6 +69,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	rtw_core_stop(rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 }
-- 
2.53.0

