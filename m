Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541658;
	b=HkSJf5B7c+85/UjK4zhaXRIda7uiKiMfjparxCaNibCp9xDZ+aWpEVw2rrBJ30k3uBIg
	 +Rng2PIwixv4fpCBe8kM394+FWcVy+t9jgsUK1/vrYp59LRaqnXLdpe7Ih4oc2o+MqHyI
	 qHb2za7Y1hPjdM8PNSoafX8hWsJshKDrazgj9Jc817Bdfh5oEon8jvzDxb3sWY1pP28Ad
	 4iIFhna6QHWfZNxijXJJ4hHMXhTNFo1Gv98LXHlexJSJ5tDiuVOH7PeL6/7rnWeFxEyjO
	 ksBipVhZi0/Sb2qkVnz6tLlsSU17PKsLS2G8ysnhpg4M68uDYkk9qFaJiHv3qfycbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
	b=flue/Gavgnlfsw4Q5RwidSKv+4sUGlvOtzHMKmhohfb4DRbJ98leTFp+PytZGkWfl0oX
	 6vmd62NRYm9noVLts+tb/D9U24/6QCW1zFLEjxDOJ+1+WNfTEC5EFB5ARqIrZITTnqNZX
	 JMKquKkvXe8ydsEGsXUCdWCcUdAmxRuOMcC8lFMoUUK810kJTRZMmW3IeGBrhAdELtfY9
	 J9RmTBXvxHi1aWhjaucKdpJSU+5caApTC0TRgyHxxmJS3jSIsL6KrRq/ex6g+5YJz/+KW
	 xXe3Kn50SncHyt2aAeln6c45CsQs4QTfTNHgjbF7skOBNgBggrF6L9ctOPqzE0rBrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSC0mJO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55E606A8AB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF55E606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSC0mJO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so691446eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541657; x=1795146457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
        b=HBSC0mJOXL8FSFnSuZAaqLFy7pGovQkHDUeou+qbg5iQMpZ0ySKPLyoJj4R+f08bPT
         GzX+yUTfUhqHBSYFiN/E9U4bmqb7KFw+aZi3oGAY8OZ7dopI9t0k9X4ah0CL9vjlOdJ/
         c5C8KdDrXJSxOGZJoW+rjoTCglBLOjGo7Uyulxb0dD6E2nKr5iZ3OiDE3zC8azf3lfYP
         GxU63tAbRoSLuPxv3SleDfEWSVeWTBIcxovI1WnGuyf/IrBYWbByPWBjJKu2kwbpPGTf
         eV846oU0LuamoHiAjrrwwiNJ4IjdoFxid0bbur/pwnttY5mv3kUz3ie5u0K+9XXgoFpe
         AlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541657; x=1795146457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
        b=AE4ntNVlBGbkVDBs6IwjOtWr+3qERRo8Qol3eCxiPXTHpKJ5Xv3M4o59kJH0yjNyb2
         5sXTpAgG5wibQqQza7/QYVuP7mbGjQeqxZZLysHiuCi3axH5OCt7qYWhFmOJIkM2IfIP
         mg2EeecFTEUpiSI8zjd0KxUPxDA+F66Uj+0Lwgu1OAlr5kyxkLaVgHTpYeCDLT9zJj3j
         rx+r47GUxvzyJ8bCmVvJoEUPLNO7T/OFWM8H5h2XCSNoSZ/DoGvrVoFk14TTTPTWLhwL
         12yK2n1yQkkWqRig3jMObIy/qF2H+34GYANfqTS8ntZgkOgSIwMC6JKSGy2tVNDMBSHc
         0mjw==
X-Forwarded-Encrypted: i=1; AL+hErFK6R6n6I2ZZkaeT26XX9KMdeQbFOMVumOtRgIWnE59PEI96w8Fu5YXwRn2PaUce0FihJPwoK1/+XsrwNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z99gU9kRj8cElDfHCzfNLAfQiW/RVOQcz/IyfpFAlOx9BDaejaZ
	eNxTgrdUPaZgwxP96wNHhwNZFqfXTSP0thXF8S/Pf6QcRtX/zklgHh4Q
X-Gm-Gg: AYBFou0E/aR0Ng83ZWTc9RAZWKfBCnkuw6Pyshjreky+EgDVtm446kd5HdSQJZlGaf9
	GcxA3y4ApQqtZxK3XcR0cMCqVkikWujPSjrTGgiUFVEfKZOkaKuMMevCE8K0vA4dKBq89ObV9hs
	hCp5o5pZbhSso6N1/jMhrUsKruiCj37cny847iIKi4SCEVB45+2bTX++CcsVYfO9CcI4zNec4yI
	DdR9VgFkLv9pUv7DUfimAIiLOQc/GzsYmssgx0sR/GvpV/sY1mQqiPP7IlLDyZiDv/4Q1FvqOW2
	1UJBtloZ7inhVqcBhwQ6weUkLyx00Vaz9BVGCsd4oU2m2uN1vbl8EAg/uMH919aNJXFW0/gEvfx
	uqt3Na0QdhU3vfFBgbtjeBYfWo57VoczwuG535kOQgXqsTe3OLQ4PHc/iV2ySI/lHHfZX+QjIrN
	GLMGfn0peLlfq3ufbUtXo6dMBl9nHqWrTUucz8LjS41MFwWte/4VAJp0U0Uu02otkGeLNci/RRU
	MJHdh9RGbm+U4j6WvoU5rwTcSv1DR5mDZ5tdrfABbrAQ+T3srMOkoXuMhed4p58zXIJSJYwm/7Y
	SgqAsci0Bxsmr4OVvjJ+Kngd/04FqgRSjt5O7XovxA==
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr1252984eec.8.1794541656922;
        Thu, 12 Nov 2026 19:47:36 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm2882111eec.12.2026.11.12.19.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:47:36 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v6 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Fri, 13 Nov 2026 09:17:03 +0530
Message-ID: <20261113034704.21283-3-skalpesh942@gmail.com>
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

During firmware recovery, __fw_recovery_work() iterates over all
stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().

If recovery is triggered concurrently with station teardown (such as
during ieee80211_set_disassoc() where mac80211 leaves LPS before
removing the AP station), rtw_ops_sta_remove() is subsequently called
for the same station. This causes rtw_sta_remove() to execute twice,
leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.

Cancel pending rate control work first, as rtw_ops_sta_rc_update() can
still schedule rc_work after the station was reset. Then check si->vif
and return early if the station was already reset. Clear si->vif,
si->mask, and si->use_cfg_mask upon removal to ensure clean teardown
and avoid a NULL pointer dereference in rtw_rate_mask_cfg() if mac80211
re-adds the station across recovery restart.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..8e62d38a269 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -386,6 +386,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 
 	cancel_work_sync(&si->rc_work);
 
+	if (!vif)
+		return;
+
 	if (vif->type != NL80211_IFTYPE_STATION || sta->tdls)
 		rtw_release_macid(rtwdev, si->mac_id);
 	if (fw_exist)
@@ -395,8 +398,11 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 		rtw_txq_cleanup(rtwdev, sta->txq[i]);
 
 	kfree(si->mask);
+	si->mask = NULL;
+	si->use_cfg_mask = false;
 
 	rtwdev->sta_cnt--;
+	si->vif = NULL;
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "sta %pM with macid %d left\n",
 		sta->addr, si->mac_id);
 }
-- 
2.53.0

