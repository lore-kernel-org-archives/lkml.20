Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935411;
	b=DibNp/5ogZoeaKyMVs7joKvJUZltiMi7JpaL2uX0Vd/5WobKoqwXGQl/xI4/hPU9VvwR
	 +Ir3FsIaQM+go6Eq7z1CDgtNnl8ydCXi3+5GgchU2nbGgOWaGOjzo1ZIyP+4BAP23smev
	 1O+HgbeAxdGRSVyqR4bDoLaK5/2gx+h7KNevH4JQORQyWa7jI24oscvWYMD10MNWqdLj7
	 FnbemNEn7elz64i5uZhGZmIz7qX2+U6IVqeHi4FCQGCBe1YAWOhrQXSf1KTULOvBwv4Y1
	 B1V5BIOUZk+8YGjpMO6tl+7dQME+IRwXkkn9Z8ATawDpVVH3jT4kNTQ+hb7ho+haCiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
	b=LvTXtSjqr3o7IIhnOkYKQAwOkKTVIAi7awz/pajkBDcaqP2LcAPyQJbsFFpfyit1ejvA
	 7r3LJfxsXsxAf0o/xYpER7wnqPsg/1OGkJmIwJAmkN8Ac1mY8HbQ5gYUSaAefi7bIWNW9
	 9xEWgMzxDIGkjosuoxTfe6liN34WxfVHxhf7nVpTeONRhifVDggehZ5+UnhYyApgGKMyi
	 nk1VOXGtDtM8xoP9l1LwHkDE9jcxXKag7lOA+iRpWA7cZ/w89WXrzp424uXboq2N+h27Q
	 1xE3PM5O3gdQ+oiy2ov4C2MpSn8L3TK3c9StA37le5SvVSCEU51eEQFWRHA7drzY9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPdubFYz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C2A60A2624
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C2A60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPdubFYz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so7949685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935410; x=1795540210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
        b=YPdubFYzA/tTmkH69DRZMfaSp+RDopWGeS4BcvXlHTMDuP/oq1F4siDZnbfQrrmzxz
         Fl2njo8c+R0rCS87N19HsRYgzPm6Mr3Jfn31cCF6+ckc+lvchbmTwuk6iwjFboJXFnq9
         xQrSeojBfU8GwqL9oarhqV4dWDHtpR7Px7O2LEeC3wH50sMZK/qrVm7SOLe9m+10wQhl
         +fKlTsY5cCyqmCqKKRYgxVDAM0ZCNJ5HGStreWagmHV5HXpIVnhgUgWFG+5410jU3HeG
         v24ojRW9Hc+UEz+Z6Vh4/dy4h4J3QQkSLZUfox2o8nunbunvJR3cWyaHPO4nSVxH+39g
         xofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935410; x=1795540210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
        b=fSxbtumfv7rBtCip/qWpAD02oxbGMJChgOaWVo6OqiG2aMar8/FhCc08ONCDs1SGca
         8a/9ewWB5ILSWikLuifVFc0C+igALhf6TP7d1hPWHd0cOSDj3qYEe4BwJkIfVVrocOvk
         x8+EViig06ET8zWo8LoKGbT1NoX6UQ/Q1cO2o3StPyBc2hq6Op3OIiuG1Uc05ey2/c5i
         q2pxFIJGmc8z4RYMzXtkBuGjYVqZDbvtYyDyzbJNiDHehVYAC0oIFwMO8lfX2NP/IZt8
         MqQWp/NHHa6/kfZi10kDn4OmGsNxS0Dtt9g/IjNMB0LlEfBbQ4gPJDD8zrBrVCF1bh8b
         x0wA==
X-Forwarded-Encrypted: i=1; AL+hErEqE155vfLdhRjajvxmO5ON46ufLVfr0UZpgb815KAfS4znfm4lMV340+1CI6FYwDbmbvBmQDWrDw3ODKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sxj4zGLCkHPtRe5BjutYGmg6pD7cn6iRcGcbJ4k/HcpTbzaQZ
	QtmqmZTKO89jiXmMVo427KnBYssSfhuC+ZqpfJuXV2E4Ew1cKKAqQU/A
X-Gm-Gg: AYBFou1wUP9nwuuzmUfM041fAIfrQLM+dghBdT1guqdv6wtKfnRUIaWLCg6/uUXf4hn
	CHwa7kwSW3ccwoCgwsLS4S9Iuoz1n5QzBFJ5NV7+mYHUa90pSmR3Ib2hVc1aMwk7xTrsUOeMiK9
	YnZQ8LMTagz7ZVy54ey0LXxmfYdOWibjpkvFJ8NZqsImy9hi2/OalKSq3rmLN8Ksq7b+fQsKBW3
	itTV4TqHkkC0pV37n2B6kSWzfmu6B27t8XnmIc8/1pWG/Q71eVn0Q7rzjxr8zbHkvj2sskqO+Tc
	S2iDjOfWrTu3BYWh2rieCiILi7pzhEwumGDG2wmuHxd4M8tkQS5fqeE1/e0bqrCSNo5Q45YdclX
	MZbRfDyeMea8CAYRI+5GQvcOP6a8+t+m/GRKxrmXiOuMIh9qjtVgxcn0BY9OLKM0T3c4Mg0btdt
	Plt6HU1WcCvLNoDattrb1ESaqlCziyrQ+tf0yVew5QV2kW3MxSduHNLFFUSLlIYP+Fm00XTEXSu
	F2QcjXt9wknRdfcAC13a2zYVQhiug4sGl1de551lYF6wJHcvU5O2iK+VXhmgPOhqYVLOEqQnCty
	a9+YUwZUxintqy5HKZId5Q3UtMPC5ZbV4dE45HShNrXVMkxCPnjIulHo
X-Received: by 2002:a05:600c:b99:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb7838bdaamr71396715e9.12.1794935409804;
        Tue, 17 Nov 2026 09:10:09 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:09 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when the device is stopped
Date: Tue, 17 Nov 2026 18:10:03 +0100
Message-ID: <20261117171003.1840491-6-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The firmware recovery sets RTW_FLAG_RESTARTING, and rtw_reconfig_complete()
clears it once mac80211 has restarted the hardware. If the last interface
goes down before the restart work runs, ieee80211_reconfig() finds no open
interface and does not call reconfig_complete(), so the flag is still set
when an interface comes up again. rtw_fw_recovery() then ignores every
later firmware crash, and writing the fw_crash debugfs file returns
-EINPROGRESS.

Clear the flag in rtw_ops_stop(). mac80211 does not stop the device while
it restarts it, so a stop leaves no restart to wait for.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/5285DA11-651F-4286-A0FD-52A6051B3A88@linux.dev/
Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v3: new (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..10f1ae08f383 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -68,6 +68,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_core_stop(rtwdev);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	mutex_unlock(&rtwdev->mutex);
 }
 
-- 
2.56.0

