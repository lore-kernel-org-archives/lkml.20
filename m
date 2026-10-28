Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197405;
	b=f3ASNWhakYZwB/9dAjlxGC8tMmfeNEB2Cvnu6qOtnTqDT0oJRHhVaGjvmAS8KmH4B8/7
	 T0BvLF4TVTt/QpAz69lr2SFmDopWj/xRm/Tgf3yLyd9uWLrdO5wtmr3riWK6oQyJNa7L1
	 C0hVqNZarvYx1/MPYA+YgYtDVppHXPxtlCzMrFkJ8NcBZVzm1lfvADH9NwoAmqTahkY+u
	 5X0SqGZrPxZjTEDB6ZKwR7pvK3t3JSMhKWQH6gWz1Qcus4/J0JDXAoPHKY5ZrNp1okVTV
	 GnCv2ny+kGTLHtYG3liP6vG4lSYlblln54kZkbs2t4rz25XYVl2BhzXgo3G3Hc5lzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=alnKCsFxzyORsFsXKCIpyKnL9PTgktadfxwbxtnPw7o=;
	b=blEvPr3adqgmQqly0ZL6P14vLlZP1+Mc3Ivmh/cfFHyRIklmbYinkEeNhsltOpuBwNcv
	 Ero/kPJ2szTRGT9viiJxWx5U10HsfTHNk5XE+1wsbOn8lrjJHwoDYXitduEDitGZeG9Cv
	 KzeLI1A0cvKqVpeKRE3/KEX6dBEzYEgcI3RlB9Km72Xdq6xWlZ9OD2M1NA6aUjV4hA5Dk
	 kj5VzS5MrCKYNw4O9wjchn2dVa0syyEe2kdBeV39NXqn8rbW1haI7E9jR3I6XazjGc5nH
	 X35b+3jLgdA/nn1KESWMX+6jogjTDGsud7o+qjDb7m2c+UwbKQ2U5dhLGPMPKgC4l1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7zH5IKK;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A630606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A630606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7zH5IKK
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso496415a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197404; x=1793802204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alnKCsFxzyORsFsXKCIpyKnL9PTgktadfxwbxtnPw7o=;
        b=i7zH5IKKJ7SBUu17/XuTpK2eb/CPIFpHe1xmP9UpdHx6hlxiLPprhyPN/lJkP7FchN
         dACeyJnnIeGZVXF+Q173Tnogstf6yXMV0lmJh3yvcYRkxju30JB2sde02qJKEbiTEes6
         p8UoC+4LTpFPzGuC8ZK0yroiFP063Xqlvp6Vx/OdRTlqEFRjx/AalRcmwWcqg02djYBm
         UxphkjnzyunrO4SaUUeQqxlpDrKUlchwnLh9+UnFraZjO0mnpQEAjKJMir4p5h902mz/
         KGvtIyxTfIyEOj9DbNtpwGROOY5P6/5EuIttqDvtuWqtUyLXJpkzGFXHVlmYbDcyA6v9
         BJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197404; x=1793802204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=alnKCsFxzyORsFsXKCIpyKnL9PTgktadfxwbxtnPw7o=;
        b=JSEJZOVDSVA3XLwLrhP5Ufod9wC1/wnXqAiFL+rzQH1uBoy1KmOyHqd2CW9Ird9ou2
         4LkkhlYmOVRQetGCpBChbyc4It41aKX1CHFyVVvo4pH5bciTI6ZSgidhDNrzuTf8oTNs
         xOwWqUWBq5PtjzHz6bKFJ6uu2Wytlo8m7dGxtYpWAw07d/a2wTT/DGm3OCsQipF4cQDj
         UsEV58dj0BnEAejX3c9YXcWLycQTeNh/FrXPtKlY2AgXnpBQfb1JAUFkp2hAAwuMrmPI
         Q0l/JJmo1TAEjWHL8dDAZIdOk6UcOTRSPtQC7jVip8yAHBsW5cNReiV2BGZekYnLk7RQ
         oLXA==
X-Forwarded-Encrypted: i=1; AKwUvByP9hCk1HqHMVL1ocsB/rYeLAmOsOAbSI2OBof7/sgyAc5THhdz59dBNjxUDTJMmZe3s20L38k4urwFQ6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtGROuG8vRUsPO5cOZoZs6Wnn+zy3dxbulriQ0mJYTrM8xHNSg
	QW0hTdcd7zJ+GUxD1XAfJhtWXdnF0KM926WIY66FWKeKB8QqnPecYSnH
X-Gm-Gg: AYBFou1dGD2VBGTjsIY0J16Xf/ROePlk+fdWLORdhB8gUf+w3vqHVsJAaHhtnZZ9k2W
	Imk8FgpjQnFVEEDo7sO2c4yN/czEYGvnlt6ZZshiE3U+u8InRmae6nXJI1tcmSQO7ZMFUJe6nMs
	R58rZmnDczOu0wxOQciQrS91LFOO0Km0y5FEh0sW2joXEP5rfGVh6UiwpG0jxLV0kwC9VI/TnbV
	dZporRFEyDjiYuRIveAw0RI1VpMUbke1B1J9FvTazb5LNMvL1kPJcZhURs/p4dGAYDWkHmvJpXk
	EwOsoo87oLJpJ5qLYZP7jbsLHkEPN15lrI5Ygzb1kDROsK1j5S/ORimvWUVupIuwa+24jkH5BFw
	KE5z8GduVMHPevHO88ez/Bf04IdWqjUIuD16ENzE+RdEF2tfx/bVpRQ+1G45ttyoCnaI9/5Ii3T
	YP6zsbCfHd0FpYr5cqrCLvYwgh9m+ekU+ia9Zg87Sta0w1eK7qxohfTgFjY4+4+748k+RRMHT2x
	CG7SuhMKYBvm+bUnoYNsLyNMOqI59g0XLAx5vSPr0QSFBUgVXx8Ml3ADmHf8HYfok/eysf7yBdW
	MwDkZnrc947VrBIe3lJ3jcfgdoJX2lvTpwg6MvqghyCyAVAJ1Z9IwtWIrtwci+uPPO3R
X-Received: by 2002:a17:90b:2f4f:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3ae58181a3emr1804006a91.46.1793197404548;
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3773918a91.8.2026.10.28.07.23.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Rostislav Lisovy <lisovy@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211: recheck the OCB station limit before insertion
Date: Wed, 28 Oct 2026 22:23:01 +0800
Message-ID: <20261028142302.16634-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028142302.16634-1-enderaoelyther@gmail.com>
References: <20261028142302.16634-1-enderaoelyther@gmail.com>
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

Frames from successive unknown OCB peers can make the deferred worker
install more than 128 stations.

The receive path checks local->num_sta before allocating each station,
but pending stations are not included in that count. Several allocations
can therefore pass before the worker inserts any of them, and the worker
then drains the list without rechecking the limit.

Recheck the installed-station limit in the worker under the wiphy mutex
and free entries that no longer fit.

LLM assistance was used to find the bug and review.

Fixes: 239281f803e2 ("mac80211: 802.11p OCB mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. The
insertion recheck was not exercised separately; the two-patch series was
run as described in patch 2. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/mac80211/ocb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/ocb.c b/net/mac80211/ocb.c
index e9bf4ba3e60b..a8dd4f4dbf70 100644
--- a/net/mac80211/ocb.c
+++ b/net/mac80211/ocb.c
@@ -139,8 +139,12 @@ void ieee80211_ocb_work(struct ieee80211_sub_if_data *sdata)
 		list_del(&sta->list);
 		spin_unlock_bh(&ifocb->incomplete_lock);
 
-		ieee80211_ocb_finish_sta(sta);
-		rcu_read_unlock();
+		if (sdata->local->num_sta >= IEEE80211_OCB_MAX_STA_ENTRIES) {
+			sta_info_free(sdata->local, sta);
+		} else {
+			ieee80211_ocb_finish_sta(sta);
+			rcu_read_unlock();
+		}
 		spin_lock_bh(&ifocb->incomplete_lock);
 	}
 	spin_unlock_bh(&ifocb->incomplete_lock);
-- 
2.56.0

