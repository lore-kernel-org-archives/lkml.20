Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614190;
	b=JVVyhW4dnVO7dfm4jxxO+W0aEDhhyPak2PGi0ekA/rDrPUKxbd14Lr6wxkd7b9+ULDHd
	 aaoVpe3G2JOueDCI5h6WUKRJyEgAKNsWio7QwAwV+xRMJ+q+otLFxh6pTPCLsPiua4dcQ
	 iuropwxDf6sGeRYXZzR0lMBlRyXBPd0PX9I8UBAqCugK4wSWd///0ESqcT8wmDfI9FnUl
	 bOOxyGXAQ87gnnuvmtMSvutsu/Lpt7B6sjKXBK9MqXawPJ9TZTS3JauE2vVWel7768Q0g
	 DsjAa0l4ZP+Y2fAbB0cqS9v2AEdfRUmPFLkvgQ6fbQH0IhhmIpWDn3IJePY9WBAuxHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614190;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=LWeBxwpNn+nqNRzgySAHNuZr2IUhu6lfowChLNgzEGs=;
	b=mx+3jrA6+waLP+PfuKu8Z9xqvUOYel7eizPiDr3TLvhtkDxPb6beWnXth/pY0RvguXf7
	 hsx6+qcF+oIBiGhqTOkJbO1+iyNcRnfZEc6X5HhH58nENLVhWfLjle+WuuPSEBHTOAN3R
	 lwzkqwyNoUC46fWgJxyOb3+yHxag6NhcaQxlZWRN16lD5b7ML4lctmlKRtOp4yaY7D1w5
	 chSquyKRmZpKvnpD8IpZYPsoEbuuFq7cnSD3GUq+/Gp5V0ilyeDXgF3NNmkaFqMjqrRsk
	 ULGYQGx4q4N/JORv1ZJ/mj6cfcOMRPzE9GaeumreyRHq6kMtY0mupj1477JznQwvA5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=5ubMlELX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CB606A339;
	Fri, 13 Nov 2026 23:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25CB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=5ubMlELX
ARC-Seal: i=1; a=rsa-sha256; t=1794613952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dgxnWFeCKsuzgM6mAbx3m5miF4te4ND1Ivo6rCSpODoWzd1fELcSpqvc7BeAV1Si5AvrfPqWUePkYTAQwwdVaHevvLNGOLqKTPn0Q5yunpSfaSvRLlU3g+jeFxmVZc7kNIGqWKOagoHFHcIv8v2UDAr0WhazbQKueBiqN6g16dE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613952; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LWeBxwpNn+nqNRzgySAHNuZr2IUhu6lfowChLNgzEGs=; 
	b=d46swyIicuKUgEXO8fMgCO3QGC35QTcFKFmyXM1eZMzLjKexAGxe3zHZ/UKWvertIZSsA0nNaggdUU52f1opVky3nxPYcMJODS0OILW60vLYCAWdVYgWDDIyqw7RoAaE4hVSAPOVqXDQN+puCvu+5ova7qxhf7i0bIuLIxgjbiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=5ubMlELXOtk68tt8tSS5JbNUVkUS2ZGIFs2626MVHxMLvgXSm78eoXFKHGn4L0/1NQYtoodmP9XjAEz0uYC8e4goR9X5mRgngWiKK9ho2bfy3uDDoCrB2U5MiTlYTLf4Ptw6bevQgr+EsPGgHrSiA8nGDwJpUz8TjUbKgc++7M7iIQbKyPhS1Z4GiwkfiCbEut5KmtyLbSXffHTEykgI7enEl+5RwPKNDZC8+PD9H/qsLhOBf+PwVlLm+FngT7hnWIQb9A/UOQWqXB+VhKrSQ1FC2PYxcvlkSALpECVyGyK0o+QKWOKXDz7icmePgq2LPf3LM5ORvQG5YfwzQmzJyg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=LWeBxwpNn+nqNRzgySAHNuZr2IUhu6lfowChLNgzEGs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613950511887.4036946461866;
	Fri, 13 Nov 2026 15:52:30 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 07/10] wifi: rtw89: send injected control frames through the management path
Date: Sat, 14 Nov 2026 04:52:08 +0500
Message-ID: <20261113235211.1911-8-owner@ph4ntom-rev.uz>
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

rtw89_core_get_tx_type() classifies every frame that is neither a
management nor a null-data frame as data. Injected control frames
such as a 10-byte ACK or 16-byte RTS therefore go through
rtw89_core_tx_update_data_info(), which derives a TID and data queue
from skb->priority and enables AMPDU/QoS related descriptor fields
that make no sense for them.

Classify injected non-data frames as management frames. Frames
generated by mac80211 itself, such as BlockAckReq, are not affected.

In addition, rtw89_core_tx_update_desc_info() reads hdr->seq_ctrl at
offset 22 for every frame. Control frames have no sequence control
field and are shorter than 24 bytes, so only read hdr->seq_ctrl from
non-control frames whose linear header is long enough to carry it.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 54605f7..7003c24 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -637,12 +637,21 @@ static enum rtw89_core_tx_type
 rtw89_core_get_tx_type(struct rtw89_dev *rtwdev,
 		       struct sk_buff *skb)
 {
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	__le16 fc = hdr->frame_control;
 
 	if (ieee80211_is_mgmt(fc) || ieee80211_is_any_nullfunc(fc))
 		return RTW89_CORE_TX_TYPE_MGMT;
 
+	/* Injected control frames have no QoS/TID and no data payload, so
+	 * send them through the management path. Control frames built by
+	 * mac80211 itself (e.g. BlockAckReq) keep using the data path.
+	 */
+	if (unlikely(info->flags & IEEE80211_TX_CTL_INJECTED) &&
+	    !ieee80211_is_data(fc))
+		return RTW89_CORE_TX_TYPE_MGMT;
+
 	return RTW89_CORE_TX_TYPE_DATA;
 }
 
@@ -1299,7 +1308,7 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 	enum btc_pkt_type pkt_type;
 	bool upd_wlan_hdr = false;
 	bool is_bmc;
-	u16 seq;
+	u16 seq = 0;
 
 	desc_info->pkt_size = skb->len;
 
@@ -1315,7 +1324,10 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 	else if (tx_req->vif)
 		desc_info->mlo = ieee80211_vif_is_mld(tx_req->vif);
 
-	seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+	/* control frames (e.g. 10-byte ACK/CTS) have no sequence control */
+	if (!ieee80211_is_ctl(hdr->frame_control) &&
+	    skb_headlen(skb) >= sizeof(struct ieee80211_hdr_3addr))
+		seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
 	addr_cam = rtw89_get_addr_cam_of(tx_req->rtwvif_link,
 					 tx_req->rtwsta_link);
 	if (addr_cam->valid && desc_info->mlo)
-- 
2.56.0.windows.4

