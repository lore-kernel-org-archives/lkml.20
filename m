Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2E36605E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703267; cv=none; b=srrPJw0m11lnwgwniPt3PzYce4NYLqf8a9p5rrM72SPjBg88eG11JJYXztyi1VRlnGORXs7OLLrCYEleRNOvRer0IKexOR37qCohSCTh/YO2psfaTLZl75Pajpe+pfEZI4hmCd8xJiN/xwayqGf2ZbSDtyrppcXD879h+F0LnrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703267; c=relaxed/simple;
	bh=OZFz7FV+Ns8YSEl8n3PTLzmOdx9IwQQiCOjBnJtXyTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+RZ0CCla1D5T2b5Iq3NmCEDEczDn9CrhaqKADPkZqAiS5zMG+3V7XNMe4M3xKFBq0cH7mMILw3Bc/xBUq47icEfBbxUvivnRkDki+NwDpo9tECWK1rZ/GbcukaTwg07NDQfPWTLdIEOGxFy/HGKbnn2ErPiTz9lL7TKCxQlQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVQ6RmSo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVQ6RmSo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so2506025ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789703259; x=1790308059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qr1pHP/iCGIz1D7JJO5YGZs0OF8AJhVgDqynMNvIAUU=;
        b=nVQ6RmSov9B86grXopmjVPYQjdshjUaviDqQFeaopFJ4UnMAqJAch+7jsnEjBlItLo
         8YSpkxtsrSmoUE7NaobzlMSlAM7sn+1PhN24JFOLBtMpYj8Sbo5LyOdVLMmnna3ItTDi
         kyPr0z/yKyc5LdqyspvyQ08Rqe0zzxC999K1gue0VPrVqKWPkcBoHESfFI5nM7Tr0vLP
         dvoCJwjrpS37IQMlmE7KBDZ6PVP3p9TMzTOJ3K9+O0e6socPG7qv/KPXUvDJMxvnMHhU
         lcfIM4EaqqNBRQfMN7HT6pNxorGi9Ci9tNXA7x7RsBbaFzGzswEjMs3MDJTxYVmMO9pv
         kIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789703259; x=1790308059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qr1pHP/iCGIz1D7JJO5YGZs0OF8AJhVgDqynMNvIAUU=;
        b=cB8/moLfhkf1w2ANl2hA6vU1Rumzv3716EhlKSwAMHXwFRYnCPpv9CqaktkuU2wxTQ
         Lbf/YmE64urTSW0Qc0BAgUbkSVjEsOQRYyWpuMaO5ZbENUI7zj7y6/0z3knwuWDWxdi/
         WIl5b2TdtsHg6BUotuOkzUtrKTJ521ud1/lNzn9BZABYe/tayjhbzcA4ml0E276oHs9X
         k5ojXnuWYG51owR46vlPxwSJLUheOVQzysDMf8F/9+/glizqFH5CJisNDXQhvkzSARJa
         AHYBFx1/yrG9F8xM4WTowIfX6kJATefk9AliYwTeWdhVpEj/rFY+AApRRRDfRFe1hMqO
         s4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBylhxXZ9I8R3CC2caIR1OYdYceRmsB5/bOL/uGOQ8gDSfEh+75yypWGAhQU0X6ZV28xQM91UwgLQuIaUEw=@vger.kernel.org
X-Gm-Message-State: AFuF++lrFRSPzZxneA1Fhk82tZrqQBNYlpwBLuAnZb9W9aqJHgEEpH3k
	xvNhPwV0T2TTmn9v9BiGsZqQt1GnksubGCqomyOZExZwTGBRDPZgGSm0
X-Gm-Gg: AYBFou00xsg5+xItKNEGh3mAJJk2Bn2A8xajrlQJmoANRUvUgOGGs0T25DFrDvIboIH
	xlhxvDnRcFleiyLywzUkwxw1pyLDpvscDIgPUmXBRd3r/kSrIBduJmjq+q3OFSp7J3jbh5JOmM6
	qzohw3lhow41LPQ94SF17+COmu1Ws+MThp8N4YJYJ9NPkdG2YY/4Qvj+k1ErBxTAzKJh4fteU1B
	MtcEgv5mPO58VjZkpFy/HvUyf1aPa7B+GGrb26ONgSX6JIn9yRFCuMeSABRtZC8GQxogduaMWvB
	g4RqdfHOhGd6AKUo8Qy8Yacg/E8PZSctNJ64L9e2gsUezArpZXrVvevq8DAnRyzcYhR5WnpS2ep
	8mNH7KC/1HDmCyY+oHjH1xtUmSHmM1z/RosfKgsJT09QH/IeJ78pLyeSk9TOjitBwck5f4q0BlP
	RieMVZEKCEHgtIfGQ8js2nPJ7gAHOQayPclR1+AHYazysGeR0EK/aE9bE3L1eYzhs=
X-Received: by 2002:a17:90b:3909:b0:39e:1f16:6167 with SMTP id 98e67ed59e1d1-39e54aa348bmr2812569a91.3.1789703259451;
        Thu, 17 Sep 2026 20:47:39 -0700 (PDT)
Received: from adi.. ([122.171.17.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c284a8c65sm752205eec.4.2026.09.17.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:47:39 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org,
	Adi Prasan <itsadi2409@gmail.com>,
	syzbot+847847e76c6983a5b3dd@syzkaller.appspotmail.com
Subject: [PATCH] wifi: mac80211_hwsim: handle invalid tx rate index
Date: Fri, 18 Sep 2026 03:47:17 +0000
Message-ID: <20260918034717.22104-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mac80211_hwsim_get_tx_rate() calls ieee80211_get_tx_rate()
without checking whether the rate index is valid.

A monitor frame with an invalid or missing legacy rate can leave
rates[0].idx set to -1. This triggers the WARN_ON_ONCE() in
ieee80211_get_tx_rate().

Treat a negative rate index like the existing MCS/VHT case and
return NULL. The caller already handles a missing tx rate.

Reported-by: syzbot+847847e76c6983a5b3dd@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=847847e76c6983a5b3dd
Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 02b6d81cccd1..e7bf91e06e40 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -1332,6 +1332,9 @@ mac80211_hwsim_get_tx_rate(struct ieee80211_hw *hw,
 	    (IEEE80211_TX_RC_MCS | IEEE80211_TX_RC_VHT_MCS))
 		return NULL;
 
+	if (info->control.rates[0].idx < 0)
+		return NULL;
+
 	return ieee80211_get_tx_rate(hw, info);
 }
 
-- 
2.43.0

