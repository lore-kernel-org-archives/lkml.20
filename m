Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908767;
	b=OjL62Bi5OT/TxrJR0+Is6rDm7+xty/JE76s9MjYlR66M30dlk/Q3EF3iUnuI6Kl+o5ND
	 XxK1kRpZP7BF23wkMBE9g3uLXC1cUjl2w4RucmO13SbF07UZteTuO6TyyU5HHXgUdBSDa
	 NbmZubK2LsWPmAFV3NEO3pmn6vxA2hin3bIjcBhPJYgJo93anOOJfDfBuh1eStKI2qyHG
	 KJiWP8gVhCzsS1HqRnxb4mGNZgio5ZQgZDBumqNbo0TCVg6XlC5BXiNIjF85NbCIAcu0J
	 3Nln+y/6BmS+VYgFTX4qzUCEqf6B6/aCCdm9akK69682qcCV0kEHGy8iT9UEDq8It2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908767;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=;
	b=GDSKkUZW6Cs2rPwsUjPieWpK88O6UPzXex4jxpiO2qrHoaNHOLB1DX32ScQdeLan9TgV
	 VMuHreADM/ixK9upmwARQRx+6nc1TTI0FoecozwIrinTtLHyl3dgCSqgzwLHAWnBkox2I
	 d41PTpjUuj4GYbzS8ZEmfQkW7HwRaNjqpiSsjDeoXeVJhKUGwiGcyMmKlxnHZdsMWbUUK
	 XjV9emSVmWwFaup9Qwh1mEkUy8eY+XNXnrg8OL3L49LmIoVPTowV0mzPeHdX9m+MNwtDN
	 ir9dmj7kqWmusR3Tt+2D3Ub1wENogBIScM44zVhH7uecoyuwcgIAGbLiuKrQgDRSqpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=kSLbp4Vo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1147606A33D;
	Tue, 17 Nov 2026 09:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1147606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=kSLbp4Vo
ARC-Seal: i=1; a=rsa-sha256; t=1794908513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MWmQ1RESuCaQ0VaNQDo6TaHJcUn/DS+VTh6qRSLuDDDHm8Ga1JeDIz4kNSGpXN86U6BEnjNCtHww2J6ZbtHNmWI+mdRw+3bhXvVV2AaaQ25QTW+sHVJt2FkSrwSxy/JmswR9jn/lgNGWj6IFgZuWnDS8+E7OVGNUfSr5bgDev8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908513; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=; 
	b=k3J2FMyFQqkjTcqoCYBW69zG2246u2ml5bk3CwhtsYer+0FBZNyN0iDzHieTCW4t19awrV6vtLU0XYTEYDu3tORThD3/bzJ0C/OXZeDcd9ZjJ+RCuiAILXfXXxjkkJ1u2yHhg5Wa2bfVqIArXmkS5u4K4z+rT+WxAvbrr5Nt+kA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=kSLbp4VoE/e7kPuRIAYRsj3JDtedELLgREoO3CPcZJQKQ8qR+NpSJ6RmplAWLXoi50hMP3HAnmumaT+xkCHKI4qCVGUkQAkYif+u2D2dEgvvmzDWO2nAQ2XftAo7LwF6WDFLIOI7B3jq/VOFgrAy2x/BDU02i5DymtQ3dLaJHq0FaV3OBPrHjgRCKz+eVesu3aeSszzqk+mYa97McDjWkjo9PsT2cDcrQmbzpnTMpUdTmKuqt2fuh3FsNjHGlm6rd8EwaEHyE+vFQWYSf2/XuGS6b5oi1aei98pb3Vg6Xxh25i2bcFmZY93rzJyxUdKvMgkiMFLogudLgl+4Enu74g==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908511170146.3939649021372;
	Tue, 17 Nov 2026 01:41:51 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Tue, 17 Nov 2026 14:41:35 +0500
Message-ID: <20261117094135.1772-6-owner@ph4ntom-rev.uz>
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

Injected management frames currently overwrite caller-supplied sequence
numbers because hardware sequence numbering remains enabled when
IEEE80211_TX_CTL_ASSIGN_SEQ is unset, and injected frames ignore NO_ACK
and explicit radiotap retry limits.

Preserve the caller's sequence number when IEEE80211_TX_CTL_ASSIGN_SEQ
is not set, apply NO_ACK in TX descriptors and completion status, and
honor radiotap retry counts up to RTW89_TX_DATA_CNT_LMT_MAX (63).

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 19 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw89/core.h |  2 ++
 drivers/net/wireless/realtek/rtw89/mac.h  |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index e599058..712c10a 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1265,6 +1265,20 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	desc_info->use_rate = true;
 	desc_info->dis_data_fb = true;
 
+	if (!(info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)) {
+		desc_info->hw_ssn_sel = 0;
+		desc_info->hw_seq_mode = 0;
+	}
+
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		desc_info->no_ack = true;
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = 1;
+	} else if (info->control.rates[0].count) {
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = info->control.rates[0].count;
+	}
+
 	if (flags & IEEE80211_TX_RC_160_MHZ_WIDTH)
 		desc_info->data_bw = 3;
 	else if (flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
@@ -1800,7 +1814,9 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_info)
 {
-	u32 dword = FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
+	u32 dword = FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) |
+		    FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR,
+			       desc_info->upd_wlan_hdr);
 
 	return cpu_to_le32(dword);
 }
@@ -7540,6 +7556,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->max_rx_aggregation_subframes = chip->max_rx_agg_num;
 	hw->max_tx_aggregation_subframes = chip->max_tx_agg_num;
+	hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
 
 	hw->radiotap_mcs_details |= IEEE80211_RADIOTAP_MCS_HAVE_FEC |
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 780ec47..3065e11 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1278,6 +1278,7 @@ struct rtw89_tx_desc_info {
 	bool tx_cnt_lmt_en;
 	u8 sn: 4;
 	u8 tx_cnt_lmt: 6;
+#define RTW89_TX_DATA_CNT_LMT_MAX	0x3f
 	u8 addr_info_nr;
 	u8 sec_keyid;
 	u8 sec_type;
@@ -1300,6 +1301,7 @@ struct rtw89_tx_desc_info {
 	bool stbc;
 	bool ldpc;
 	bool upd_wlan_hdr;
+	bool no_ack;
 	bool mlo;
 	bool sw_mld;
 };
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index 2e76bb1..c94b34b 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1896,6 +1896,8 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 	if (tx_status == RTW89_TX_DONE)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 	else
-- 
2.56.0.windows.4

