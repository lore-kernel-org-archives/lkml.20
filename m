Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008459;
	b=RYhFrK16OYw2jHwqKFqRuotwRWMZVY/mb/H9kLgSrsqDQHqjuBT2uU9+PgrHra5v143d
	 Cr6N41nsSnxrYRAZfav6RLWdm9m4k84BAofRwl4LrrAnnySYl7uiA3dkT8BYyRE0ewqLX
	 gkahXCEB4MNWV3/Z6CHfKN1HAg5CAKfEm/fi+dyDaPyItC3Y3mmUcxyOn+aW8xmlAWGlP
	 zKrXOJ5I8VMdb+4da4yxfaIurUlWq3uAfdo1Vnrt6JVtLW/libZwYdqIZYkAByv0bRgvV
	 G1z0HHyrK39TyosdlOg29ccQEJg5FNgS9n789/RNmXFpf9t7KlrH+/oqfx9wh7cGNPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D/VaSOMcUlwPUAdjntA1Q0HEeOmbUij0t3BgSN8ccDo=;
	b=fqU2iLO2VpLJ2dEZeENAxWVOriJ+QNYZr4kq5pa/HF8/1kNxJmULJ/WUtLFkdRT3o9Kc
	 m4tDiStWeWLYOdPDK65EzCjvCQfX6ZBTFfi81zCIXOfkBsXCJEWsMELt/PTvnDblpIyQe
	 YirEZrS83oDvuu3DhF9WWqhwGegJ2eZ7KkqNwEmIFbZ0k7E75TT7Rf9EM5OuUPnLzB5sk
	 poY8pZaE3h/kN3Gj7HqfEO4XIiQua+Mfm87BBy04LG5QpTkpwUQ3/jXyu5uKsQrR4Wqgk
	 1CRjFb/tqu8tDYbRRWo51C11AN/KLKa+g+XROXDNhuGBsojdHANcdueBl38eX8omSYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aaTnvn64;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA6606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CA6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aaTnvn64
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1718147f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008457; x=1793613257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/VaSOMcUlwPUAdjntA1Q0HEeOmbUij0t3BgSN8ccDo=;
        b=aaTnvn64/QBcpX/pHFhqq2YhMDxBaXebWmQjWa05pDNGjrYYJSz7ukx2+UyEWspfO/
         SWEwMIz46wRXbwn236vYnsnUm8QvS8vdWVGXSlKGz7giEK4fcfgGmBFxnxMQaEUTZkHm
         5nftAGEnW/xkjsWtPaDFtCOAfV3qTUybKuV/ERwvD9QIzBAAiWB2rd5OgA7aPBhlOIRL
         GuLCZ7S0ay24QIuil3U+mat2FrT08g7aQUlQoTf69SrYAF7lttN2x72dylaK/L3jJIEe
         nS1b3nTg45aDowTu42xQeLLkkK/kykgetHearnFCnYd2p932Pgz1SIlN15FLlzpxkM/+
         61ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008457; x=1793613257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/VaSOMcUlwPUAdjntA1Q0HEeOmbUij0t3BgSN8ccDo=;
        b=Ao+vOZSQbvri2pq68mTQy0fU8/cAhRcy4OT/EgYSeVwMEse/neE9CrltXHVhXqETVv
         iaDXPO8adEfvVlVGDlH3/KcQ1fzYYmNgAx88MMSvwbrvLlfeQvKzQTzJU0CVRxd77bZY
         KrKXjKz37qJ6oEakjpAR5/ZnmCcSVXq2x/rwIWmfPPVpJ6vvre8gyR288wcARjM5moWC
         IW2B5bnIJdCnpqGtYmxjyAY9BtkDYee+Ec3nJLOTN9iTC2HrWppp12buFpFgBfhcLpDd
         fcsug3UarS8hqo4S6wcfyjA8kATpQalb5wiVsgneisIUhu1uqNjhycm3TpLluzHhzVNy
         SzKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+0qwMXrEz973JQ3V4Neq5mhR443GXsQVSiQYFjcR7i3VuMfnCNP6r6K9muOvG3eK6bQpjxM085u2DhyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsjoPo6lgKbeoIUdk+L/MH1alOXeyL2YWpdiNdXM9rdOr7EzWF
	5Rn3G+ECddl5JjAZvIa3TTXTKLlboI7dS8JXxseFYA9B2aZ+vR+99X4dvDnokVvBnxjeZ6Ty
X-Gm-Gg: AYBFou3WQ8wTzmX5Sq9N6nvBv85f8InTiwqkJ+RE6TYABen185sQlrMT56J/lr+0eF/
	Guc9pS4Ets2F1HVRDhp1t0KpZN/J6/lSdWBs9Xi0Cn/Kd2OMArFV2GAa5GCzq+uJ/8tLD046JEl
	ph1GTBTiNb6eKJ0lgG9kLuFGgEVkNTq5tBsyI1uXhZk1jdkx3cSdJZan4D2Wot5R6TJ9545AWXw
	Nbk+x5PGOPxmxlwMcPMBZ9EyAFnk25z/tfbYwJYj/2ikzMzgIUwyh7R24SOJTBVYufQ7ZZLqBTF
	y7kpHm7RZuwj/y8VUu4nDbFY5YMAAZUVParm37WkTnLj69AZ+KU/wqAS4Lyh9rIBMWdL4jIGsh/
	kGOHjUHm4jZ92d7EG9vnfNcFdtBM48ihuEk6JJQl490pzFRibTCUI3IoWCpem6s444NqePTtbeL
	uDe06gX1h+mlimO3l4U6zHr4KYEAWm5aod2RsPl4CGI4xOIWW/fdN1YvNv1Tf4XkvfaH/2LBpHl
	z3VS1R2w/St62PCRG5mHnPGASGlRVK4IaZiosHstInRSlxToeXgi3ve5T8MeR+TcJqUfmaHmF8U
	g4reWp7Ol4mFhO3L79+u4df6QRI+AcuA5VBSVg==
X-Received: by 2002:a05:6000:2312:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48e3eb2cdbfmr11414765f8f.4.1793008456800;
        Mon, 26 Oct 2026 02:54:16 -0700 (PDT)
Received: from localhost ([217.150.74.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm14960572f8f.55.2026.10.26.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:54:16 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+c38f93f387ac25eabf68@syzkaller.appspotmail.com
Subject: [PATCH] wifi: mac80211: use owner vif for AP VLAN station TXQs
Date: Mon, 26 Oct 2026 19:54:14 +1000
Message-ID: <20261026095414.149334-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.56.0
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

AP VLAN interfaces are not added to the driver, so their station TXQs
must wake the queue through the owning AP interface.  Keep the AP VLAN
interface in skb control data for key selection, but associate its
station TXQ with the driver-facing AP vif.

This avoids calling drv_wake_tx_queue() with an AP VLAN vif that has no
IEEE80211_SDATA_IN_DRIVER flag.

Fixes: e937b8da5a59 ("mac80211: Add TXQ scheduling API")
Reported-by: syzbot+c38f93f387ac25eabf68@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=c38f93f387ac25eabf68
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 net/mac80211/tx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index e9b6a0415..7446c8d9d 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1571,6 +1571,13 @@ void ieee80211_txq_init(struct ieee80211_sub_if_data *sdata,
 	INIT_LIST_HEAD(&txqi->schedule_order);
 
 	txqi->txq.vif = &sdata->vif;
+	if (sta && sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
+		struct ieee80211_sub_if_data *ap;
+
+		ap = container_of(sdata->bss,
+				  struct ieee80211_sub_if_data, u.ap);
+		txqi->txq.vif = &ap->vif;
+	}
 
 	if (!sta) {
 		txqi->txq.tid = tid;
-- 
2.56.0

