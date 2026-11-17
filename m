Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908731;
	b=4MeaWUUlwDKnxeqfKQJJcZ+QAypAi3MPJIUjNo/iEmQ/QQbLCFzFRTdTBjht5PqiziK5
	 50csxMJlkshh1Mq9B+AJftGhoofeBo9v0K7v+dPuEIkMZT7JVvHaKKQCRsaLCWj3rOzAp
	 w8Ey8O45XPCp14NEuTHS5kGNTdwodWuV75zWCrPohxbjq9fGs4dq7Rt4PtZ4w49ksIfYR
	 HuYV6V8dPAG3/5IgVDmKS8ZxTROHOUY++fJoVltLYAqNf6Ht5ZSdoawq3Ivd4BJq/bOac
	 5kvQZEPijDRClpebC7V4eEkuNYHr15HBezqCV8ugtbJOHGpRmgcL2W/7wrglWhSMZiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908731;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=;
	b=bsfKc9+imtoLvOhe0WBpYP1Rez+pfZejhcWUNMgYCyudxneOyCKNNDei2yNfKLJQN5yi
	 cw7dv1kVVbfbdcqmtW49geGMk7PT/5UxT12YMsV3VzSGzDT43s1QHLoSsFKj7bt2XN1eY
	 lImsHXgt+gQZxPoudUASs+ct3oX40wZwMuTiX+EhKKIUQ1myeG9kcR4gtgQ5jzXtv1zDv
	 FE2a2gqMTfiVNUueYl3puOausqjK7tmUbmn6uLD6AU5gsNzty76hfvzC0QzA0K2cXYQKC
	 9Shnc1x6ygT5KZQg6KG0hV9/G9btWhiyFTOhQiTlVNk5lNKIBu0i7Z475JKx8Pi4Bmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=jgtEvcqf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A4606A31C;
	Tue, 17 Nov 2026 09:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=jgtEvcqf
ARC-Seal: i=1; a=rsa-sha256; t=1794908509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kezeJCwF59EXaWQXKe5aPijpxD1+ZFTqIXBH/bjzUu15/BXBOB9HGUvFc0Z2DXRRxO9MGrlOqRoBzU8mqys/X/DkXfrTuNAFNhX7t5/HwfA2DPQgMmcjyjkzDhK+j4KXkUmXB86QucAHS0NUdE9PRUGULJYQpSy/yrNS3BrRuo0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908509; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=; 
	b=S/HLLyglmXCY9uuLoE27ptqdOnv/yux2FPYWXhwgSXbv3qawAfmtMRPT3yzdxV+JsyBJeqBfrMVDs24WZJaxcSgxdcCerFO41uvbg9GC1kYOALQkZUHSzZki26pqWz++lW55SyNZ8r7P2QEiLR8mJS6QoVKnGceYhzkmbd2JwqE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=jgtEvcqfC5oUTHCFbgg8Z1n+KFa6/jvO+Eulp9mK9OqNYDwIUns6IOEVwcvAxUTFM6eoVexOQ3Z3EhYsjofZnnk/cJnRvIALiLIObNk3zFRcCTwzrUbErcL1DYe+1G0n1UwmCENAjdL/0Cl82l01Ac9Pj9UhoOT4phkxjrVNvTGKb8IhSbHhX+hnMZAM+tOoJul0fgMCJhhfWujWEWIZkSMdSzyD2c6XFYGCyPKrKBd7gSET+63CaTu6pMs8npEFK1i+4K0d8laOVKSI554DQaX6l+Irl3gZeBUxikzd5CSEodrHjP5MS5RGMa7Xs8ezOHMV/wLTyzxEI3f+lIjHJA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=VOWIci4KCIgNCmc0R/UijKYV6Hb5q84/DaZ7ApZD5DE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908508269721.8560784525415;
	Tue, 17 Nov 2026 01:41:48 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 4/5] wifi: rtw89: avoid reading seq_ctrl on control frames
Date: Tue, 17 Nov 2026 14:41:34 +0500
Message-ID: <20261117094135.1772-5-owner@ph4ntom-rev.uz>
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

Injected 802.11 control frames such as 10-byte ACK/CTS or 16-byte RTS
do not carry a sequence control field and are shorter than a 24-byte
3-address header.

Set seq to 0 for control frames instead of reading hdr->seq_ctrl.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 8333b26..e599058 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1317,7 +1317,10 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 	else if (tx_req->vif)
 		desc_info->mlo = ieee80211_vif_is_mld(tx_req->vif);
 
-	seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+	if (ieee80211_is_ctl(hdr->frame_control))
+		seq = 0;
+	else
+		seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
 	addr_cam = rtw89_get_addr_cam_of(tx_req->rtwvif_link,
 					 tx_req->rtwsta_link);
 	if (addr_cam->valid && desc_info->mlo)
-- 
2.56.0.windows.4

