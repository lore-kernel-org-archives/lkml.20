Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489282;
	b=Avrhj+yp8vEcQbI4IBkMOvd3KPMATiYG6kfh5cluldGUYaR4skICAihkmjkkxiSMBkdf
	 nqMqlwmlJTm73iBQH8/dAqQzGH0X4fGhChfbhMF/+Uz+Tba2r6ntfpPlORO5DHTlEjuq6
	 AXkFcHXlo+5B9LL3DQv1D8bJPC1x1FDtEEOp8owqlh926Ki289lYqz79OkVx2591OQgb9
	 jxss9dqqJT/maP8/AiEhv394vNmnQBXh+h1HNePplM/GghcfHVF/kRJBOQlqpRdLAbMjq
	 LN+FV89Mso0ASQdqPJH6vzHa+CV3U4o5lOOQJZnfRQD0GKG5Kcqoygu+d3kWufr7hDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
	b=GgO/txEBoDdY3O7xfKbUsf7TkOkxoc8v5aNRiCsDeM6TvK/1mtAswMl/4ikDpQgVd19U
	 6XEwlXhMr70oerr1gRWsnTL6ABgbCgvWc9Z9/RCgJk5JKMv+Yf5FJCHBJB6Vg2U3rHknL
	 7bU/WHAH5j6JvjCKHpXpy0zlq+qTVbgw/v+BvBSNZ18ReHHm39DUbtAhu6Fzc+JE1Jw3a
	 QltX93eNpwgNHB4a5h2KhVkNJHVRyZ2Q79oRwtEbJMx472ZjlIHWdFtkfjG+U5Ymb5HvU
	 f1tTBf/QGpGdn+wL0Kx8S3YNeSvmjF1RWxLlnC7mrxlpsmVnc7xUREM/AqUQKzVV6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqxmhICb;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A45606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A45606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqxmhICb
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso673290c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489280; x=1795094080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=NqxmhICbTIYcfGuXIJz1P6XnftDanJtNo1IcpGIrdtTtROTY7LSHAsKlxtR1mLJjkV
         DeJCGFOk/0UaAA5YZUQqhxbdhU4eVd+oxCqDdarxd/Z9xrtnYzTjwP8fhWX0L2WJOfxB
         wrT8sFQ0X4/vfD5buGCD5n1yGmvmWxm+KYAOSJ2G3ik+NEhRWQmGZoaw/AGJz1aR2xeu
         w18NVhyrBFhXIypj7bT5NYU4WolJoZ9oIofbV/tDVHMWzUU//90qy22fS1HeJ31MtAAL
         otzvebmGP6K9gHj+Ym8q51sw1yDljXNX9ltgpi1KZeHNhpOTK5IpyiQJaY4E0pW6eQZL
         0mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489280; x=1795094080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=RQIqptOVgfcXU6oLccn9J5ezvBs5jm/M0RvDge7pfaSV4EJ47vHL31L8F3+T+4tnQF
         3Dda4/YVagg34kFT6/u2jRaTbL1OJztlO3J8szkt3FzXo3UeXE9pyESpyHy6nmG3Jm8B
         EJ4qeovKGzakjt5RyYWUJiqdZsV+3TjAyjI8ccfYLECRMRt3UiKH+Pk57+IR+l8V74HP
         78FclreMtOJKjQjMcO2FwDdTHAZ5nmqy4mFEa8CgyJBJ4+vkLLVtusWNGwnwvmJLzsDQ
         WyB4izfNsir+xXFSPd8SR1KgmpVsq3yJxcjn4o0URHQv6wSbcTzDtfVeHW3IwzuPdulM
         rx2A==
X-Forwarded-Encrypted: i=1; AL+hErHGL3fxCaqS4LYgc9UDfXc5BUOCTPxyzaMO1exXQZGtbvUBerio66LUqhu1/YgtblU6o3cQk/9wjTOWlvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ADgpWJoZ9rFv0yMFFERfZjY5EdZlnP+yG3+Aghb5tTNxGBeL2
	ZcTuSOxRc/F5YTMklU02JzyJlNPf20x4HmydglqqDT38ZphHA1WV0HCC
X-Gm-Gg: AYBFou3ray46UlaYUY2DutVHIUi84dtJiv374dx7e4Tkr5MEKgsB6BrfZhXtZaKD3oI
	dK7z9fKa8f+hXZe/Ggx6K7NusvtpVNLSZ/DrS2zztV4tLww4nrthOCNa3x9Op3tqcrZ/0Nkz/cU
	QON93CNfrJlD7sUUTkej+pBN2qMRvDUqiz/b3g5211qKHPiTqUxPBcGmWvkhtq0mhVcZLpL7Lta
	jVkT4eewMQSfiLejXhcqWvYeORanyxwsYNgVauFIoRsXbPsI6Xljog2ZbOQc9ChpTIUJTGFBwW8
	YudaM0oDXnu84vdN0MCLYizcDVunlss9LSgp6/XpQQDiiBRlMzBPsLtnzHNIl2HqOsoNOppqJqq
	u4fwV7ZLWz/LpOZ6gyevt/ojifxDQPb38AEdcn/UZVDSeknlFZAd0uVbl/l5/QwSUv70S6Y0GOA
	PI4Siyz9U7lFAao/B9290O2Bh03yS9eB9/C63AAW4X35zXPCvCg2yYdkP18jywTSlHU+d6Ni3dR
	PkUIdTY4vgQKsh9EEOeJ9P6+01/+OkruGeB4rSZV7kdvsYDqGUknUt9o7hvEwYwS43aTcEYi02v
	IHGGhSFeF4hUFig5Bi3Assk=
X-Received: by 2002:a05:7022:b0c4:b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b4f5f37813mr2187785c88.14.1794489280241;
        Thu, 12 Nov 2026 05:14:40 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:39 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Thu, 12 Nov 2026 18:44:00 +0530
Message-ID: <20261112131401.236433-3-skalpesh942@gmail.com>
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

During firmware recovery, __fw_recovery_work() iterates over all
stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().

If recovery is triggered concurrently with station teardown (such as
during ieee80211_set_disassoc() where mac80211 leaves LPS before
removing the AP station), rtw_ops_sta_remove() is subsequently called
for the same station. This causes rtw_sta_remove() to execute twice,
leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.

Check si->vif in rtw_sta_remove() and return early if the station was
already reset, setting si->vif and si->mask to NULL upon removal.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..a74f199a93a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -384,6 +384,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 	struct ieee80211_vif *vif = si->vif;
 	int i;
 
+	if (!vif)
+		return;
+
 	cancel_work_sync(&si->rc_work);
 
 	if (vif->type != NL80211_IFTYPE_STATION || sta->tdls)
@@ -395,8 +398,10 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 		rtw_txq_cleanup(rtwdev, sta->txq[i]);
 
 	kfree(si->mask);
+	si->mask = NULL;
 
 	rtwdev->sta_cnt--;
+	si->vif = NULL;
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "sta %pM with macid %d left\n",
 		sta->addr, si->mac_id);
 }
-- 
2.53.0

