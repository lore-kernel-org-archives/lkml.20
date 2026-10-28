Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197380;
	b=PiwzvDsYGmQ85jm9I6fTdXf9RUW9IuytrwF37C1c1dDkKzSwUWt38ROcQh2SakpfZcw3
	 RMp5nQEPyH3KSPtg+fx/eFo/d5vmeBy0AFC+CoLZRfbi/ALDsat0xwq9zKf8ocM4QQ2V+
	 3blW7EEMx3m3NNKyzcrDaAmGacR2bSjX23Ee5xOKh1vr/FMGEvxkI/Xg55Sr59N+7yCzK
	 CB98mARjgrOYKWv9Rexkeo33inZRlDxluDwYzyZvKLfHbKW2OdKdAt7CO46GS6o1NzomC
	 jhRXajfIQdW0CSnfUZyhUZb8ApuKBzhm3eXQ7kL5w9Ln2btiXbTWi6s3EVPZs4mcujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7V8TJ7hV12SQrdPDboL85gY+G3YL3+ZJkH+iYuGDZo8=;
	b=0w5nnqZEseDrgFim2NNZ/fpkD7oUR3s9iH5r06nx4yD/hxTsksoD4QKwre18P02Kd5xr
	 JJaiatvUK3vKlMhuDyuHBKf3/ZdMjWHFujnvXL+U08vyAq7cNJtpUxmOMeS7snA+c7RMF
	 Mn682j6F8ZrF/MqvIwKIMxEy/GDClfCHEWgIuUtgw8X+G/vUEpaGtaH1mGoVK+bhzO7FN
	 HECkmvTcobewB67VbeAAXJcdvbIccIA+/3TJuKA39Vz+InEKf7jgk2l5xPKw6M0aT0nS+
	 cnbcgHLbWDsJjiVwB8Fn6oQgyEphO+yxkZqsaAVw99Ts21prlOZKaBoPLOe5VLthqIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebjSrOn+;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BB606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74BB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebjSrOn+
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so547401b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197379; x=1793802179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7V8TJ7hV12SQrdPDboL85gY+G3YL3+ZJkH+iYuGDZo8=;
        b=ebjSrOn+E7LVjMvKaDuAmzTut4DQ/a9PuFwQjTjtotC5x51Cq3iv7YTPD2ibgTLG2Q
         zhMTozdHmHNHQ3lHAs5DJc8Pj0OcHJB+cVh/oVjvobFu0ZIFK0Pq9AyXUcf0ilW6RWu2
         omNLyzj5mEbxskBE7MF+AqkbHljddxsyAQq1WCGpR3RlbtcKGXYd8V80+cfangXeHisi
         Yq3hwSsJKmR/DwYTYRwh6ukkDtfEaUEDq+AysSwMCrIeGc5fwNS1//bP1tApiP6QUxcz
         v35xaryw3rSTvy318XMKUuOP9TLlHRJXrCQBrDYnBn3lXKo7UV8WUKu1rN3xImwGNo0v
         B50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197379; x=1793802179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7V8TJ7hV12SQrdPDboL85gY+G3YL3+ZJkH+iYuGDZo8=;
        b=0vZ7OdNbQFSAXJMhx7HzVSyURK1AGL6bvn6msODn6TDY59G7ee93v6bBy5j4yYcQNf
         oX+sOtGcUsACFhQ0GIaMgHDp17/AC/mgKX2uNVNg2ENPoRFpafmjBvABWMEIIjCoV5te
         e5YRMh8xW0Ctfn4EXbtKOM4yqGvumWWTgaQ8i64ULDr7bDPxz98S0zGY4nZboYa0ALZB
         J2cYuy0PNGZvRG8K/mvx8OIxF3sSd8eP1rODz2q/f9Jcx8iq4m8tfALkn+86rA8nh6vk
         yTFAYpNrSiic4EN4AJgqsSIq51M1Gw8Nd+PlT+QrWAqA1dx1JRj9OthJV2yc++UnINaO
         OqDg==
X-Forwarded-Encrypted: i=1; AKwUvBzEgxEZsMnTPemiwRHRcCRYDqDk9hdxmeVPHWHgm+X6QyMslw0cEBSxWwaGbyxR63zn184Vttk7GwZN22Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7lKo7oJqCU+l5OGMLFwleSM/QFtGMzOSz+JIbajy4/xDADNUJ
	NRao8LhsruqFJUn4/siL6XahEM6wYOtk5fFoseNCp6NJfQW7zYWwXmbj
X-Gm-Gg: AYBFou1B+xYaO7TBG10l9YkgEpVV5iiOWmcoQg3TPs8sRKRjLmU54XAhwDYyRHADS7P
	pa/UhXwmDoCST2m3EbnrAdshTC7BMYX975wDIFn5/SrmaLibnnZpWovOKCNek9sGvgWEw50zWTo
	9LutIKeZB4K74byx5kZSaqIdDjKu6t1czO9R3mqLs2wUiSqeS4ZjmWA4E8u3+9v3htQ2S9sXzi3
	ZTofMl6CiP6Dl1LlBHP82SFA6k5FacAvw/thVaq8Rcb4KYbpd5DZtLFmiyLtsziYWomIhvnMhSG
	HxDV2zaXwPr3bsRl3wPbDdusfFDe04kVVUXoWzo5rDAaFD8teZm59YG7YfhWNw9UZS3KAH/Nf9D
	DmlTQtKRgJRgsVPuhKESsYbr/hyU437/XzbsFQZ81lELKx99UnezNpGoUR3UL+g7K/0BAOoJ4Wh
	Ei91Hn64WE3mCHqZHfs+DhgZErbkLYfLK8AwVkIhcYKE2jnj3TXY4g+ZHpnVZz62bH5Qr4foqLA
	OoIsh1mGla4/VYt2b7EKC6D+MOrMLIApr0guaZ+T0B/pTM6/XP915cyy3ddx42MvtaHJkMLlqVE
	uhxEf8UNORn4VI++4CswDDXUElb1kTJaU028qao96+ir0qZ4WvY3hs/HjJcRgZ0Baj6RBEaklWs
	aSdxco07TIQjP1Q==
X-Received: by 2002:a05:6a00:3989:b0:89e:9c7e:fd49 with SMTP id d2e1a72fcca58-8a6e7bc8597mr1970471b3a.20.1793197378617;
        Wed, 28 Oct 2026 07:22:58 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662ba00sm1245181b3a.23.2026.10.28.07.22.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:22:58 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211: recheck the IBSS station limit before insertion
Date: Wed, 28 Oct 2026 22:22:34 +0800
Message-ID: <20261028142235.15428-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028142235.15428-1-enderaoelyther@gmail.com>
References: <20261028142235.15428-1-enderaoelyther@gmail.com>
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

Frames from successive unknown IBSS peers can make the deferred worker
install more than 128 stations.

The receive path checks local->num_sta before allocating each station,
but pending stations are not included in that count. Several allocations
can therefore pass before the worker inserts any of them, and the worker
then drains the list without rechecking the limit.

Recheck the installed-station limit in the worker under the wiphy mutex
and free entries that no longer fit.

LLM assistance was used to find the bug and review.

Fixes: 8bf11d8d0811 ("mac80211: delay IBSS station insertion")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. The
insertion recheck was not exercised separately; the two-patch series was
run as described in patch 2. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/mac80211/ibss.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index d74b66426349..bd7dbaa942fa 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1626,8 +1626,12 @@ void ieee80211_ibss_work(struct ieee80211_sub_if_data *sdata)
 		list_del(&sta->list);
 		spin_unlock_bh(&ifibss->incomplete_lock);
 
-		ieee80211_ibss_finish_sta(sta);
-		rcu_read_unlock();
+		if (sdata->local->num_sta >= IEEE80211_IBSS_MAX_STA_ENTRIES) {
+			sta_info_free(sdata->local, sta);
+		} else {
+			ieee80211_ibss_finish_sta(sta);
+			rcu_read_unlock();
+		}
 		spin_lock_bh(&ifibss->incomplete_lock);
 	}
 	spin_unlock_bh(&ifibss->incomplete_lock);
-- 
2.56.0

