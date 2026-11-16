Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803471;
	b=o8+wNeuC3viCRKhopg2PIOSLhS5M5t0VSMNUPxDp7nswHcbqLrt3AHF+nb+23gBLOFaq
	 nMxKjJcV5AWUFv7tYnmglCJgsCyjGSIpsqNiQw/02qnPuYETW1XxvQuU0hBEQlPgMYFZr
	 TyDQ9TUr1yYVrJFtyJko7lUJ0CBPeMxFUb4bmK7QAzEjM8WKp0IZR6ALNPwqiP5vFKAe6
	 sQwilm22kzPKqYwEHRFc0pl2XX8nZ7xU10w+dbWNlOHOF2diloOG2HT9LJRotj2krzSZT
	 udCThhdFDBe90ujDMLyHil84jMD2J9tEonZBgHnN1efWsJDXl6Ez5ARXp3A0uPqbKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/ctgGBFPGqnrXxh1oijw1oROgPOwPa6x8KFQNZidA+s=;
	b=ey7lK9Zvuv1526esIAPoShVg56WZUHZsIHHHi3bO3hYJRlam+l/YJ1EL9mltNTi23Q3k
	 O0lLClFqh2dkzlBiq12IZOHLMa6rlfoAHVojFKE3GQwRmPHZezMxqJzIO/XfmuvY+Vbxv
	 uQva5TMWs+gvPGScPuHnPVKD6UvaT2ricHIJbLQDP/Tp7YntlPd8Ig3Jxilri0PeBtnLp
	 RhosGpp9reqvbs8DJLoSZlMSn5METTUHOihs7Bsr5lbXVIfIaFlCOTJyiLDSr8WeHv5lK
	 3hZYaW1Za1xvl+SJvzjDVToJ3dTOYxRC/b5Jo+aHJ99eclJQAr4R95vDCUBUDTImSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpL74nbz;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpL74nbz
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1719014a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803470; x=1795408270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ctgGBFPGqnrXxh1oijw1oROgPOwPa6x8KFQNZidA+s=;
        b=QpL74nbzhphxgnxdMTolQl2oOk5JB/oqOxlmlQvddVlZ3y46zJRcGN4Mh1Gjmt8ifm
         P5tjdEVq7Om4JgJHMNDksdbNkhlMuPAeqS7UCidJ9NPa46CUZ1wanD2Weyp8Jpk7RdJN
         PGOvYA8jbR4I/PL0OjVCepEmk3GpUopbjYbLaoWyLZJzhS08Ct0Mzx7e09baw3OQ8DZQ
         8f9VnIyrSOTsann8/0e+iRKj3rZ6uikwVQK60kJsOyqQW+2mC2OElAmWRlk0ahvh/YwY
         x4z4HcaaafWAL7zOumbue3XZBT4yadqk8dwRIbjNGsEiLLwABil0pstBx/DUU9rHBVbO
         080Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803470; x=1795408270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ctgGBFPGqnrXxh1oijw1oROgPOwPa6x8KFQNZidA+s=;
        b=FQe3OsLLGpr/nBUwGHc4ezFk4wuuZaZEQ0ucW0Gr8ucU0HFDauvxrV+Mb3Fxm0Gglf
         wplbIy0LHlOGOw06P0qlwQVPXjG/Rb24KYKIP0F6VAiJMroDPywfpGV0qKs8NWjdPWKJ
         WuBTLOFB09RrNbQ6dGNC6wOLIS/8MJjLArdqQwVN4+C+lxfMPOvoCThg9bHI0+O38K1m
         zlJccv1zorl63jV+bHjQVP8VToDeDNCIglocAUq6oYVGubOZKkSmzWAQ8yClOkotbcVE
         FjMnzK86yEPvygnzcjDIfpwB5Zz01ND6ttAMemzkXGUI+zMax2iLw2IS+gSnU7F/yjae
         QtnA==
X-Forwarded-Encrypted: i=1; AL+hErGKFBIvcHRnJwJxvaaiI2YZQqiBH4EGzTWRNH0sFLKj/A+vlA2vRSAQ3tLI9+W8Olfko8TVY1s+rXIajwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/COxmln8wyuuSMjEqCJnLuiyHiqyyaZesAeot14lPRfImMDT6q
	hWD5AXoSkaCmVGSXS25OLbFEoqQzgQMXzhvTtDb8cgTnDMSRZ86SPGye
X-Gm-Gg: AYBFou0yK0WcnrYV7piFKYMY9fAKzEtOApFGSAzRYEhl6qFUvHu+LMlAy3uXeA5V/tI
	X/7eLQMpOyY0s7AcpCHdmaT7t5ogWWJz4ayXslXQD1qcSEKRhSURBa2ViULsE2LHczsruk6kMHh
	GdcNm41qkKf293GCroTitFpN+dP4YvcY+uDGCEW7m5JGC4GsrG+XVf61KI5pbYu319hB7Fo/VpT
	svHPHTbWnigr2PjR6I8LkcDuAxNGLeAes6p2glRYeWBEmdJ3oViq3FOlyRPeBGoRyPBkXNbLtZ8
	vfr/3rv/FnrwM4viY/igQ22+OmZ4Ynoa40xx4VE5S2ddi+322iik8D+5j5LJNHDEvPVytjx+Kl7
	MQxZDuyGq+WaUF7m7mDzIW+9opfYsDoHGDqTywCJFyqAnUHWfQU9GigQaPhhyILrpOgiAtVXxzm
	+tch25O4bKIBGGkuIm1zdz7aqqILRaVhx0Ii7ZRGkCs6w2/md45pH8fV9ZQPjwl7yOuK2pGkkYe
	GpQ8+J3UMj8Lv+sGdCoz0PExRHVrN78XgPfKZPRx+eBB93q36yHoJBa3HpZXGc6gvjOasP0unZM
	kcXa+AJTwZ9Kz/mN03nzqZNS2yspbSxVRUba1+BccbZ+PU8ypw==
X-Received: by 2002:a17:90b:1f87:b0:3b1:2d77:daf with SMTP id 98e67ed59e1d1-3b197d79772mr9183360a91.30.1794803470326;
        Sun, 15 Nov 2026 20:31:10 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm19293094a91.13.2026.11.15.20.31.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 20:31:10 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: allow automatic control-port link selection
Date: Mon, 16 Nov 2026 12:30:42 +0800
Message-ID: <20261116043042.14324-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

An MLD AP cannot transmit a control-port frame, such as EAPOL, to a
non-MLO peer when the request leaves the link unspecified. Header
construction selects the peer's link, then the link-ID check rejects
that selection. The Ethernet source also remains the MLD address, which
header construction copies into the 802.11 source address instead of
the selected link address.

On AP interfaces, take the source address from
ieee80211_ap_tx_addr_get(), which header construction also uses for the
transmitter address, before storing the ACK copy. A station on an
AP_VLAN is handled through its AP interface, since nl80211 rejects a
control-port request made on an AP_VLAN. Apply the link-ID check only
when the request names a link, so an explicit link other than the
non-MLO peer's link is still rejected.

Commit 9dd1953846c7 ("wifi: nl80211/mac80211: clarify link ID in control
port TX") added the check, which then rejected such a request only when
it asked for a TX status report (an ACK cookie). Commit a64a20fb270f
("wifi: mac80211: store the ack skb before building the header") moved
the check out of header construction; since then it rejects the request
with or without a cookie.

AI assistance was used.

Fixes: 9dd1953846c7 ("wifi: nl80211/mac80211: clarify link ID in control port TX")
Fixes: a64a20fb270f ("wifi: mac80211: store the ack skb before building the header")
Cc: stable@vger.kernel.org # needs adjustments for <= 7.3
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Tested with mac80211_hwsim in QEMU: an MLD AP with two active links
and a non-MLO peer on link 1. Omitting the link ID succeeds with or
without an ACK cookie, and captured frames use the peer's link address
for both source and transmitter. Explicit link 1 still works; another
configured link returns -EINVAL without transmitting, and an absent
link returns -ENOLINK. No kernel warnings or KASAN reports occurred.

Compile-tested with no new W=1 or sparse warnings.

 net/mac80211/tx.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index e9b6a0415d6a..459803d345b1 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -6720,12 +6720,18 @@ int ieee80211_tx_control_port(struct wiphy *wiphy, struct net_device *dev,
 
 	skb_set_queue_mapping(skb, ieee80211_select_queue(sdata, sta, skb));
 
-	/*
-	 * for MLO STA, the SA should be the AP MLD address, but
-	 * the link ID has been selected already
-	 */
-	if (sta && sta->sta.mlo)
+	/* The SA must match the TA that ieee80211_build_hdr() will use. */
+	if (sta && sdata->vif.type == NL80211_IFTYPE_AP) {
+		err = ieee80211_ap_tx_addr_get(sdata, sta, ehdr->h_source,
+					       NULL);
+		if (err) {
+			dev_kfree_skb(skb);
+			rcu_read_unlock();
+			return err;
+		}
+	} else if (sta && sta->sta.mlo) {
 		memcpy(ehdr->h_source, sdata->vif.addr, ETH_ALEN);
+	}
 
 	info = IEEE80211_SKB_CB(skb);
 	memset(info, 0, sizeof(*info));
@@ -6742,7 +6748,8 @@ int ieee80211_tx_control_port(struct wiphy *wiphy, struct net_device *dev,
 		return PTR_ERR(skb);
 	}
 
-	if (link_id != u32_get_bits(info->control.flags,
+	if (link_id != IEEE80211_LINK_UNSPECIFIED &&
+	    link_id != u32_get_bits(info->control.flags,
 				    IEEE80211_TX_CTRL_MLO_LINK)) {
 		ieee80211_free_txskb(&local->hw, skb);
 		rcu_read_unlock();

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.1

