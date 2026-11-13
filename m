Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794613980;
	b=Hqbu4NniGx6Wz1Zi6onYzn3yWZltlwSD/ccpxcuRN9Ld6+FhvmQRlVXNe2psctOVC+gR
	 d851lNT68zGZdj/97Acau2pLIx4fe/KB47CPI3/shOtAzI8iEr/PscWgrD6tAts5adlVU
	 LKf0cex0XOst0Q7mPAT/cxNar4uUYaCn02tGMuuoQuaS5ALQkq0RAYJ6F1BLUG9qnkMCj
	 0sifIXuTEmGw/XobfSHF40Kz/uQCN74GrR2VRVFY7obHdpTu/whVX57H2H+IB4feCYSnu
	 7FzWdMEXptonJYUa45Flf9psi5K3fR8aqONsCa2DUO7aZgNbLU2MkIo02EFKqufS+yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613980;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=k1w3+O9veVvG69u+4DyKuDfq5j8qNZ69yw6d6sshB+g=;
	b=FsdzJkiVKU2NkHDRSwBR/fZ9tKbm3hLFYbJTxKoLWSko8Qme80Ph2iIM9zeH9Hei/Ow2
	 W9L7wsap0moonE72VfQiUe7oZ1e6g7/CES2QWbUg3dQpfWbjLEtK+aqVmFWr+tFVIQhcd
	 T3zCSpsTbjOUcvg2119W32SSquiVrV3c/o2zzNW+u3Yv+5wZ6BUDKVh3K3CM6qkAoZFS2
	 ORQtdnzE/u30+1lLBDWtTQl3LCpLNVplOjuuyAWPZAYJknn8JjHLJkxIFWUTZpCqOft5R
	 zU2z5w7s8InTW+lhrvB5nyq1tbfeO8BEMF1zd/AXq1tzTLNq1TYPMVfA97E2gIqpwiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=zuwbA+bn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A92606A336;
	Fri, 13 Nov 2026 23:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A92606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=zuwbA+bn
ARC-Seal: i=1; a=rsa-sha256; t=1794613938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=COtcxXcZ7394OhDFX5Ea+FiGcZP13EwXEMWKgiFHNL/XC+noNFf3kiggK62SzQu8AyjNwAK1B0z4fGcDKtQ1O614lFTOOUzZUZqvcNrulrgtnIcsQVHka1eUa/dh1rBxyLrePIgi5WV4DPklNg94iS+P/tLMgmRIEtZCKZh5Saw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613938; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k1w3+O9veVvG69u+4DyKuDfq5j8qNZ69yw6d6sshB+g=; 
	b=deiJzB3PIlXPCUE1J2QR5Wdreed+t5Syb3orLNf2IdtuNzTAD+X82I5Q4W6eHKtJChZ3UmX4bCCymzcdEfDDnBkM3xmd5veX6k0Wl5j/SnRnkwMpT5g3iLzF80I8VEWNaAgTDY5axWT5s9x0noi1AHsWip31HiFogrHw2+Uwguo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=zuwbA+bnWimizSaUUmpuhzOlaCa8lnr96WHtNICL7CdtR2KCB007ol0k4Y0dS3Ko4iFlZ3pEghct8djNNrShRotHBfeRppUiTvAwEiRLB7K19+9WHM0eaQPc8KRQUcuiyb1C1bssdYlo2w3nlpV+VCIKVTIzuWNhM5IPByZETxK4yDaMqGMKuvdgd1PlIjBVGV41/ytCS9ouuyuTC2UBOmZSaaa3qvlCgLgqOq/faHKTDxkwEYYAkvf5ivoxvmcXGo3CuttxtlR5e9IkR/9cUWgeT7Ei5gEwQlzvcTAerybQrsKPBItcbCITfdlQTo6LqTRiNHcOFRrC+DrShIXT6w==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=k1w3+O9veVvG69u+4DyKuDfq5j8qNZ69yw6d6sshB+g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613938098567.1809972158901;
	Fri, 13 Nov 2026 15:52:18 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 01/10] wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
Date: Sat, 14 Nov 2026 04:52:02 +0500
Message-ID: <20261113235211.1911-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
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

rtw89 sets IEEE80211_HW_WANT_MONITOR_VIF but not
IEEE80211_HW_QUEUE_CONTROL. For frames transmitted on a monitor
interface, ieee80211_tx_frags() therefore passes
info->control.vif == NULL to the driver whenever local->monitor_sdata
does not exist, e.g. when a raw frame is sent on a monitor interface
while a station interface is also up and the frame's addr2 does not
match any running interface.

rtw89_ops_tx() unconditionally converts the vif with vif_to_rtwvif()
and dereferences rtwvif->offchan, so such a frame makes the kernel
access memory at a small offset from NULL.

Drop frames without a vif, as there is no MAC ID or port they could
be transmitted on.

Fixes: a0e97ae3f332 ("wifi: rtw89: add ieee80211::remain_on_channel ops")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/mac80211.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 9134cdc..5a12639 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -23,11 +23,18 @@ static void rtw89_ops_tx(struct ieee80211_hw *hw,
 	struct rtw89_dev *rtwdev = hw->priv;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
-	struct rtw89_vif *rtwvif = vif_to_rtwvif(vif);
 	struct ieee80211_sta *sta = control->sta;
 	u32 flags = IEEE80211_SKB_CB(skb)->flags;
+	struct rtw89_vif *rtwvif;
 	int ret, qsel;
 
+	if (unlikely(!vif)) {
+		ieee80211_free_txskb(hw, skb);
+		return;
+	}
+
+	rtwvif = vif_to_rtwvif(vif);
+
 	if (rtwvif->offchan && !(flags & IEEE80211_TX_CTL_TX_OFFCHAN) && sta) {
 		struct rtw89_sta *rtwsta = sta_to_rtwsta(sta);
 
-- 
2.56.0.windows.4

