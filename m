Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148074;
	b=c8VA5dYi8OSpdfFKIG6U1eiYuxtBoh9OLy6R58IFYUtTqJv6PyjjnMoOukNvUNHx9zTq
	 QA1Ma0hk7Hp8NSNFw9fH+gyWOErN1kt/PxMOBV/9vvuow7V1jLOhA8Mf/EErQKlIGsx/L
	 Vadha0r2T6/aGQwCx+mYLTXCYksDhrtssGXqj9Isoh6rYTrOKroT919gaSIL6dD0Oa11K
	 cnbL1gtsC42abDZkyjz3S+sZrn6h0147yHtDD3cwjBJI82FxUCj/4yoBWbpP3vWyY2EXg
	 iWUvQQYmvpdF1TMrJcwRcoCi1x5uDl1RdCuyR5jg6KctyY+zvJtgV9j6v4KiQHx0I4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
	b=J/3HG8+5cSEgT4n02Fo/TU8xtXnTwpoIW/zWnpRdnSj83VT2NrF8F4J4aC3W4hYu1z6G
	 edl6Y//BLfGoH4lnn+2D7i5l2CojlpV4gvbme5g91R9kS/Cwz0HQe4H92QP5GtWMNYRk7
	 X2ky8eKm/Jb97bnfBqa/zAkclbN4day+AF9WwNqKjn55zqnGRV83+5OQ0fwB74kKgdTCV
	 AYWrm4Hf0FC+FSzLccjlD+KBUTVXzxo6J/KUZ/2UKp//4qhbl5heEZMF7uUKuZezxwzig
	 2JUR2qZ9dl4mK922XDBh5Zse1QZ7/kbsrm59mQbyxjbkpYYtodqSe6yh4VFh1Bp+GMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0sirvTP;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E4606D81D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3E4606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0sirvTP
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so209623eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148073; x=1794752873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=f0sirvTPLxWEvAI6+/UILFtSwA3Hev7EAdoFejnIOKvv8M3lqVw2mHz9svP91wh7+F
         GyHdLBgPH76ma44FH2Ht6pYj2tziSn88lK9BVipO51nheRsxIWCvB19f4ccek/wPmfQa
         J2Jb+DulIjhTItBH5dh3+Ra3ZMopGB5+ptFXaO+G15u7e8YNWIBhKehgdVWG90K55rpd
         LRy4bn+DhYKSHkH5o9pRDE7UgdirMtGWdsO5wbSHiwKUHM4z2QUr/WWERs5SWSMniDQg
         33P485V8g9IGqnxkm9GtbRn9cPI7HL79BJyC7igBdCF51tKVGVLgukB62cio4D0o7TOj
         sbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148073; x=1794752873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=xON/HWvaRKGkdsBeXrFyWg2ojPPP+f/dzpRi7golbUhZ0iCHHu3Oxz65IABl5rLEo6
         fbjQ/e2SV1Ty4U/fASQuY0FkVrRRmrEYmdvH6AtE6yxkMKCEuxSAqm/88aX9Hf+WpJNR
         luvFw6chqjrfQT/q0eHX3HJy3mXX3Y1fDMV6M7gO0HYkMZrNZue3z0IiWsHLaZK83dvE
         1RgN++c+aIHSGDAx7c9N5fY3hgK7G2ZSyca/GSAo+vEmExl4T0JBHOgNPW6UfSs19wnr
         fF3jsYjLpMO8LSGT4bluJq5UXNwM/79lNkKTiAMe365rIDhgw03u/R7uOhBxfA/eMhHA
         BUFQ==
X-Forwarded-Encrypted: i=1; AL+hErHdyo4l0HMF2LpI5nOHyRKY4y2ew3DtNwE8n5TmqKapD5OrhBQogwcm4nLoomrBqKZu9jpjmsRQ5r8HP2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rnhA2fDKzyvzcm7V0VhOTNR+Z2TqPcYJVZrumypAVMDRFVrHg
	nn1Rk4wRnRfIxe9C8j4uE5ELGDIIaZ5vB19yq9IG+xIZ0DJm2Ra6r3jr
X-Gm-Gg: AYBFou3BxRtZmRepFs5RqgnUPTd+J20NbmzrvzQ4QkxD63Cvwug2SwcjX74jqdMmScF
	oFi0QDPE6HzNJvAa2U3vFe042JblRKnHZ/DDjC1cgLth3t9FeetVgq4JfXrF9F0SuixHqpoOF1S
	fwcFVIi5y8N4yuhHrmGVud9gEhB8+raEELpy4AAZ+BWAIWacevOVzfCrtG5UgBtSBoxrpBdMOri
	vSpVmZ9utccuvJHI8RKmX4GNjYoSbwrMxcmWbAgmFloG5i423NXXoj/tMB60eCH1ufqqsYf/kLF
	6q6SropLhXUCE2RZQ/L8IKRMXlRUUa7ltYjueRWkd5qxN+PU+6nzjvjY+DDtZ2XM6PlD/06mAoB
	JTClH94S/fkYTQKIdjQzxsurQLMQ7QUXDoWoB+qv+QoK8MEKi3rat01S6lFc/9FAEZOyfWn8oFW
	Dpfbzg3I9W3iYb6mUgefsME1LT/KN0Je245iBg0qO4ONxQZIhwx0uyrNeU2zKKHGxIY6n03ULZX
	+hPIh05IgTbNaDcLc9BN4wQlSympO/YB3Zfwa6hTTtUqTXxVTavhDH7RalVmgwj6xLWsGxygmHz
	SCJZceLdZXCKP7t3IF9M9fV/Fl3WeGjmopGr6zU=
X-Received: by 2002:a05:7022:b0c5:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b39fed4817mr2154779c88.23.1794148073261;
        Sun, 08 Nov 2026 06:27:53 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:52 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Sun,  8 Nov 2026 19:57:06 +0530
Message-ID: <20261108142708.489067-3-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108142708.489067-1-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
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

