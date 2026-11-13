Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541653;
	b=aNgpZ2/euBZdkFRoHj3DVpqN0kYiV8Xi+m8if4XvlIYaNo9rWzuLbb/vmwR06BoJIb7C
	 C3hXuFNW6w5aXoFK4k8lUeXzXVPM7Gi81PsxdAoyWN6//4/BaaWCfG6tujKFHm+d+lHYO
	 5BSarK7ahHaxe4urHbIt87Grp5BHKX/6hclx0sBMP6SDsmXt2Xzbew84ej5iwyBfdXUt7
	 7KdTvODoWbMBlByk9TOUTLKEHJfBn+P1lZLVYNEFJERXmEZB7xQ0H7VwdL4hA03hgt94F
	 aLZA+tg8SAldtpKFZqAyoqIZskWGcPWFqPAWMD3iVRNoHoG7yYqedDczCwH1/8K3trA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
	b=dXCRYgDdxmql4Dp+fwtTL08e4qHpVXPT2vwklBr7EvPjuRPBv/Y/RHrKAvkq19YvhhTF
	 ntGAbjxnlFaPuSQi+ER+f4Wtd1hEpb3SpoOPGqhkD2ACrlxY9JDY7VxMoZIMY8mzNty/l
	 RLPbLXneRBU5ENrqtDSiL0zYF5uo+xz48OI3kCvyum82Okxr4veJXVP6hAs0szRxRtkYn
	 vK6JHVU1gqN3FUoYF7YUN/kzVU+Hlnk3pUBOc9faa0ToAFTC6YGgFUMu2b/kxl5OX31hp
	 JLbYSyX+BMT1vMXYpbFDtT9TY2y3juPvmNaPYbozJR9SB2knYZs4d+b19sucpOl9dGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqUbI+oD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AF4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqUbI+oD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37628596783so977938eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541652; x=1795146452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
        b=VqUbI+oDiI3JnOrqc33DlrRxtxm6kkrrCCNbctrscECoVoYuCXiTX/nr/klre+H7tp
         dy+/gTshNxxHC9B4FoaqyTH5xuMYTIeu8EByW+rPKPFNHAmEkjuXuo3ZLBv94SpOHiyr
         Q3zwM7HZcz6hYnSqpNqW2+jINz9/bmjg4Ot7dd3pOUxhimNRYYuMKHtxR/3v2TDr2rQF
         8lc2z/n3zBF7z3ZZjHcrH25M0jt6Zj0TFJ0DPOKYVnw6OqXAfr+1wXj8M9MjBIVRZpX0
         nrvjNOVgaoT3WGrTSlAEQDWWuBwXTIM5SQxBC+WFSAXICrUNTwGFYAe8b+cPFAXquJEv
         qW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541652; x=1795146452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
        b=FCadJ5JuFLXJESRR2YOvbebdPhO4+i8PftOqRc1X4WfFoJelZqVilbg8IKak/FWnl0
         wbIV1KRfkW0jRyy27qcfsdD1oWnSaw0341n62WvFdbGICFwe4UEfqc53AbLJhgbEK4Sq
         kUIPtreG9QHNfkHOgXQTTzim1ecXV6T+Zycp8QT32We1thsctHwD+ShCL3GpOr3nsQnC
         hhv8qJH5iyBDvzV4HS+j1oi8y+0S3h++FjrZ2DqdI4wd0Pt4RdKNXQtLzuDSWS9C+J2R
         NW0Wdp1tcx7M+zkpIZLZkbFyzD5h/32qWZSKbvMV7Xa83aGgKhb4eTgPwq10LPwc+STt
         lkQw==
X-Forwarded-Encrypted: i=1; AL+hErFbNB+Q49e8yPseCgBzn/ZLf1RXUVGEEXz9DCFIC46cJLs3TyAeIZQlLyZp/6NBzwUgz0ofIzScfZ1hleA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QUklRRSCLktBEG527A88Zzsxvi568UwM7+pPNDpjezlSihOqO
	OlOjukC+266yMXZL0EBOweKxXZOulqEpOV+xo7FX7cxyrnm1/q+HKKfQ
X-Gm-Gg: AYBFou2n3Rr0zwkqgiaowvGXon3DfG5rzyWlOCSq9o43Sy/izwmFAGZ8Kg/D6dPZ1/t
	zmjtFPZVpDw+nEHKwpVjYMQBg/qFPnSzougPdRGp3V11PQ5WdbZGkjO87Lqc2j5C/35hYH0MgVp
	SRjRwjKuTOBigxpUiVrT8VsWUdMbpy06i1CiqmbDJJNm7eqy83i1Sn3OaxMYo22D1GyZaHRPQcy
	vGW13oiS7lAVwmTVOZBQyyXskvHn3nCPcNHgcqUHZIg/OmDi+pENNY7vZHTdWlQyJUv11w9hgWh
	N4I5+lwsm21tTVVSZr6iAcTT22xixkLjYygVN3W907WVyRjTOB5eSieWIaU5I9QzmEq/kk1bcvB
	f9mj24gneayv089WbNsSKL1FTPiA5X+nT02BBQQAmjfD/l9H5Qk/H+/bT5uPHdc5bDGaKoWU7Iy
	cR8/Hr07gHX6mCeSguee6qgTJnfEx45jloxDjdk8Jh8toUL3PMeiAXVG1XKhgTwSfoFgiDbZpVo
	Qq5Ib5scGAdWe1uysJDxCR7Gbyd7E3+An1Cr/AaOZohkBkMAJimyOY6xv40nH1aiUEcRnoptYpo
	77D1p6WxQTyM7EAxYrrNWO8gP7VU7kR66ju4qVW0WA==
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr921272eec.6.1794541651747;
        Thu, 12 Nov 2026 19:47:31 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm2882111eec.12.2026.11.12.19.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:47:30 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v6 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Fri, 13 Nov 2026 09:17:02 +0530
Message-ID: <20261113034704.21283-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113034704.21283-1-skalpesh942@gmail.com>
References: <20261113034704.21283-1-skalpesh942@gmail.com>
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
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
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

