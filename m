Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908625;
	b=pWMZ+tgM5anxYLuKigD5sOYIaGXBzkbUEcy8Fc+s+mCxNjLtvTStSq4isVd3yrHFyPh+
	 s1wc2etjLezhX7LXZUF1xDrRFmIDHk+bNhl7B0wO8JKhb8bCIHr6dtfDPkk296ws7nP3Y
	 yUOP/jgbG/1zrAnMIT2TOuXpu6hiQdT8FBODWT8/g+Rav9RvvcctM7RgIsMTaoN7TIotv
	 5cC4kxg1VoT1QasLW+4CPkjTB6UQAT06s/R+D8G8aRL3fMWQVNZF6z4760oqLcVxhuYJY
	 vNYewf/BohWHI+I9w4yySyCUAGqAJhX98EVmxlUvyRAjueSQdhpjS2jTcLIKB2WmIbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908625;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=;
	b=UrY+pSN9dLr1Oo6I+GUYMEeZIsyXxxvRtlz/sKzMb7cAzwJdlss6xtFymKUugCCx2yON
	 ODKXCpXDv/i5exBjAhNowoeENTrRPvh0WndmiO77I1wrM5PXPJiK1dyxM/61tEO5hRdrY
	 ZFeKieuxG8SivRPb38S9dze0fIWY28O0/y0YlBhxXCuCkNJtQ1Qd/eTtHT9gSpDihoEoM
	 kaqSFe7mGmAuQ5shFyGH6VO0TS8nIxIdA0go3+ctClgKO2uXlwpzGPlL6w8qEccIINNFo
	 fWiSlysvRu3RiRhXc8esFuTbc7HaQV+66qz6bhFeBPVDHg36eoCe98YKjJvR8eP0rfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=qaURjms7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B2606A33B;
	Tue, 17 Nov 2026 09:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525B2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=qaURjms7
ARC-Seal: i=1; a=rsa-sha256; t=1794908503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PUHOjCmPo0+QrOrqq/3Dg40oPMjKdg5h0i1DbojinkrHBgmlSmrEaj58+jBeM6SthKnBF/khjhweD6BwuK+rPB3VJHrd2ayo0s61ZnL5w96g8ILWtI4LWyaPbmuQoH0rmy9eWPmZQFGXZKRaDamXoRN50zdbkULxbKtHVLiGJxs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908503; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=; 
	b=mc/7+vxvtkYi6+iZkS0oRYooxM4IM90+RjguV9Cuslmyjvebs7LoFeO+WlddrofiD1InAK+MPgPDNG+t9qi2q30hrCRUyLEgFFQ4bqDynmhX69bvQmuIk8GcXClxuEwDENXv4ONLgp7NpJFc1c/7FXADmH8sbbUxC+O+uCI42ls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=qaURjms7y5jmUMwt2Qr8YOh72EZU5cel6fvuVeUUHjcEFXX45y+z+HMc+2CKM68cXQ72+1J4TbHWfowMjhwFYqXMiJAW4vPqnIPXYLwTjUvjQczeM+nu3pnJOXwjIw9FbAnmaDgUeHFKfJKizHi/Ne2s8MUZOxc+hLLj4jprJdGrV5PGczOzT84NSkPNq4LSPLE2l+J/6SG8CyUwUdHru/oziqZRwdx070M82lv35shLw9rmcT7QraZJ6rA6+L0oSDiAkbvndaBFUksyQ5f1mvNzUXEikrSvK98XYrU/0PxUS3o9HlX9jZJbHQni5TWPivw1HkO+d3BZvXYLOhGozw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=j1I/uFTngNJTXrmL5xzU00lhqMP0fskKMKHRdz29r0I=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908501230698.1099803698727;
	Tue, 17 Nov 2026 01:41:41 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 1/5] wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
Date: Tue, 17 Nov 2026 14:41:31 +0500
Message-ID: <20261117094135.1772-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
References: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

Injecting a raw frame on a passive monitor interface while a station or
AP interface is also up causes a kernel NULL pointer dereference,
because mac80211 has no virtual monitor vif in concurrent mode and
passes a NULL vif to the driver TX path.

Check the vif pointer with vif_to_rtwvif_safe() and drop frames without
a vif.

Fixes: a0e97ae3f332 ("wifi: rtw89: add ieee80211::remain_on_channel ops")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/mac80211.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index c85ea82..7a55fed 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -23,11 +23,16 @@ static void rtw89_ops_tx(struct ieee80211_hw *hw,
 	struct rtw89_dev *rtwdev = hw->priv;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
-	struct rtw89_vif *rtwvif = vif_to_rtwvif(vif);
+	struct rtw89_vif *rtwvif = vif_to_rtwvif_safe(vif);
 	struct ieee80211_sta *sta = control->sta;
 	u32 flags = IEEE80211_SKB_CB(skb)->flags;
 	int ret, qsel;
 
+	if (unlikely(!rtwvif)) {
+		ieee80211_free_txskb(hw, skb);
+		return;
+	}
+
 	if (rtwvif->offchan && !(flags & IEEE80211_TX_CTL_TX_OFFCHAN) && sta) {
 		struct rtw89_sta *rtwsta = sta_to_rtwsta(sta);
 
-- 
2.56.0.windows.4

