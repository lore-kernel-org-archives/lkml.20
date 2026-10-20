Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478247;
	b=P+YMstnLIHQ6hu8urMXvZY1AHYCbM87nsrXTWgzIPh1ALpAywWJIkQvPlYGBfmU80KaO
	 TIuIT5N1wZ3iVwDphdAkHiRy4r7Y4PVQ6XAz/9Vng0JQZjXPWwo/tLNzQ5CkEXq4V+FHE
	 nJKtn7iHkS3y0sLIsvJQEC/hOa0eaf0u6PsSgxw+fyDd3mpMVNU9QZ5iFZ2TLwwdPiqHs
	 N+MEJ8qkmyhbj2V1iVNtExWiXXe2Zjq6f885elKXhPB39Rsig6AKJU5pl/NuZwwjn+GV4
	 WjQZa+1WZgAI2HM+1Aw1+9T+fH71GKq3YUARUAtTmBVI+UJy8nFc2m/d1PBzjgUB27w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=;
	b=H7Xh+G/bS2FCgcWShbPlGof+b/NVsH7qBfdatnucBwnYwxEZ91UuzWLmrJjotjnNlQgU
	 LTuaUndCD+xwgHtS7mwigChewxfkiLILZyrS7P/WDUmSy1vYxwc2b7Nu2UuXCNscMSuj/
	 uhB0J2JAcxZjTSu3MQgqOhlQyVACk4+VhyCpnK4oG8bdoOuNcMk5qoxnl8WG5r8ia7Oe7
	 ZapDjNii0ErN6wJ7JjKrR2YMmud0Tylh9saGOXxo0DninTnwdsIG0cOHBp9/BIwO0GsN7
	 K3HBHJJXe2rWILyqyiBz6I7BuyGKNI/rJiihfi+tGrTSkAu6Q3TiKbaSqpObPHzcqtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bzviSe7p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuCxdHgK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDE606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EDE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bzviSe7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuCxdHgK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K5mpr21333183
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PU
	t0MSaa74=; b=bzviSe7pmEptALkpPGd0lvM3NL1SvYkEoR9LZOf3CLzbO4GnM4T
	cmh9KgiK0L9bOYaef5BsVOM5uUC5Qo0ANL3sQwhySJhDJUO68KQ1KLQVsFu0hI1A
	9FosSglTEG0RMqaOrOyg/IFDqz6hVciXmyn1Fvksg/xku54cy7Lqb8KrbhxE/x7C
	7RVGHHyEA7nBPWyTD4UqkfkzBEXc8OtZaQ0o1HwwAYQhsgQEYGY2si0HmdtkAGeB
	RTr0tcm+znrcAgyeXh5whqRpXHfwGROuSHQB7aEp3KkWcv55WCPRNmZg6IQEQP+K
	0vCVjgoz/Jwqi/I3Ww15OIcATxLaT6N3ESQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ph8ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so1620236a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478244; x=1793083044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=;
        b=WuCxdHgK13K/a0tNY2q3S83sojgaWXNj87q1+Zr1lqz3FJ+5FqE9lv5ME309LzYQSt
         JXfycJjwbB4ci8NzgwarrQqvmdQq38A2veYmJI3/6X6ZepjXB1IAWtijIatOsttZx+8/
         +LqmryvxBa4uoY5uS4YRedFdKuPKjQamLu92egfzeg3H0CBRSXkyDzSnqBo/KkJVgU+X
         BT9fZQfGgyuH6PIe7cxeXdVdQwO/gG5fodo12mA/Sn9Dc5WuhqhKzlsIohxKQM2Fu5LE
         meqPs3ka2+0DtxvUPC5uZ7lfazcgx4wZs54H30HKsRMtIUa7h8vSSxJJFuMswqAdzUEG
         kCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478244; x=1793083044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jysg3UmDk9FTjMu2P0SUUwTrEQM4YhK98PUt0MSaa74=;
        b=G/lyPuPskZAcrR6CMvhtIMXtS7Dy1Xnk8Rie+D+yEZmY3G2bV7rMtFE4yLY2tKQ9bY
         qVCmeMO2EbBgnPIaU7DknuUVC5KtBR3LwRtlCRaUhmclD2Z1vHp8bmbjDL+BCieyLrMO
         2fLqaARv0SrecpnhAxu4O7aoZvJ4VTzyZGGiDbRf1diC2yOBy0UTGBpMi/HoFYL1Pl5u
         4TyVlWSweLCgStk6H6jwr8sMMiLz1fYEyqtXaIAwJoqYNzZ6Obj4CjVtPj2aN7o/yUj/
         JBELhvhzD4EfmnQ+NUpKI5OBiRu69LyZPDC5MwKQDxfgXbA7Jz2wsHYU9MClB7TMbYyJ
         c7Dw==
X-Forwarded-Encrypted: i=1; AKwUvBydiR21ZMGEXkOrVlDjVc3cfLBuw5XhE741c2dkdq1CHG79WgVKQJ0gFeHw+qE72ViteJiQYuyeWCyDKfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBHdHZxybRcHki8DC1F5bEM6yHNJwc5hi3mHgtFVaXE6iA0MNc
	u30484vYEPijSdhWq+aiTr9R3kmZo4ZVntnok7KPE7Xf9KVp/AUfqSteUUGwFNWZZZTZsTETvok
	h5ukWJS3zWqKCdzJtuDvXb8HjEMn/K1efIf7DbYPaEQ2dWBqzjIQcmnyZcUt4rB0g4AGDLo1i3u
	s=
X-Gm-Gg: AYBFou296eC+qegcRGIqpCg15asaQXDzUhldJn0V+D2HHY5jN73yA3fYzIoaFWtP0YR
	xs6J6ZV+b8iWNR6Z2gU2pLzXDWnr0xveqtJfX3BZ3JXMEpGd982UWwtFobZ+RLBYP3kGDRBFcGp
	tIFBcm/M7enzcqlsIG0I7tTLDUPF5vHPHoL3XepB2I4d7auANZj+1SISfrci1faplRsbw5PAouu
	kAlBx+i2X8vvhIfBt3gRl8xLeVo7j72WoLbFtMD+luFcd2a4+9s6SsECBTVnEwWZxCnxd7B7mKR
	HtK0UmY/VUa6pwZhmgj2a8KUSqn4k38FxyXz766+a4zfxS1lrEevLYvlYfbbbvgS2DhZhUHPrVX
	ejARwktgm4benT5qEXApbqr3FPK0UZy+XXLubFeh9w2AG8oXimnHfM2I+bgkfNAo=
X-Received: by 2002:a17:90b:4b92:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3acef52acdbmr8657021a91.49.1792478243767;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4b92:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3acef52acdbmr8656997a91.49.1792478243126;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549eea48sm4770140a12.19.2026.10.19.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:37:22 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: keep ML mgmt tx on active link
Date: Tue, 20 Oct 2026 14:37:19 +0800
Message-Id: <20261020063719.3486519-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad70c25 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bOrBbOSleF1CZgbF08wA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 8sHSV89Rg2tBG3xgZHf1eePHmCyrr6dX
X-Proofpoint-GUID: 8sHSV89Rg2tBG3xgZHf1eePHmCyrr6dX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX+oz3PoKQ08PV
 eOOyis5Z9bXrT0IMx/w0N9Fzoz8Ewi9g3voeKsyG/yabqsYQWAuGiBGbQCTeYyZltuHXUOyW7pG
 UzQjXyEwyVeYfmbS3u6rTaf28Y0/e+/Ltset97GheDu77AaRU+gxP7+aDLO0wxggnhDd0eUdJIN
 2UwcjajkaisQq7tZqy19745E8jvDAB3jGGyZajjPJUF+UX8ttHlpDHFOCP8H1xhsihOLEJvnslz
 jETsXL5DaIykViLNx2tmOLRJZBvXEHLUyRAOsEBXH17LORVuiU2+0ChSiKJjY8/TdEFt3vKnzWe
 JWchznC7NP8Hk9MaAqRvPum08I+S7USQTIubrBr11SRg/iKKfYE7IC1m65hza5Skj7bmKe8THKd
 rV3ybDUbt+piQPZDY6x67+hOp8l9Iqub4gtLcZRjklC+0UK97zAv2zrswMs1GZDCxKpC5/W2Wa6
 kutx3DJGa1g3Ki0N2kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX+5mdrZlyqRZY
 s1vSxIX3ObYbXgKtXiJTuB7NOV7wecDBSmEYffKqGPkx4BmMuL4jxrUxpkfUY1k0AGXrS+13bZv
 VcEysRpx31ItQvinpRUpJouWpVrC4mQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200026

Currently ath12k_mac_get_tx_link() may select an inactive link for ML
management frame transmission. This happens when mac80211 passes
IEEE80211_LINK_UNSPECIFIED and the resolved deflink is inactive.

As a result, ML management frames such as deauthentication are sent on
an inactive link and Tx fails (the frame gets dropped).

Fix this by reselecting the Tx link only when the requested link is
IEEE80211_LINK_UNSPECIFIED and the resolved deflink is inactive.
Start from vif->active_links as the candidate set and prefer
links that are both active on the vif and valid for the peer
(sta->valid_links). If that intersection is empty, fall back to
vif->active_links. Use __ffs() to pick deterministically from the
candidate set.

If mac80211 explicitly requests a link, keep that link and do not remap
management Tx to another link.

This change is limited to ML management frames. Data frames, HW-encap
frames, and non-MLO paths are unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..14cffba3e354 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9600,6 +9600,7 @@ u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	struct ieee80211_link_sta *link_sta;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_sta *ahsta;
+	bool req_unspecified_link = (link == IEEE80211_LINK_UNSPECIFIED);
 
 	/* Use the link id passed or the default vif link */
 	if (!sta) {
@@ -9645,6 +9646,33 @@ u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	if (!ieee80211_is_mgmt(hdr->frame_control))
 		return link;
 
+	/*
+	 * Keep ML management Tx on an active link only when mac80211 did
+	 * not request a specific link and the selected link is inactive.
+	 */
+	if (req_unspecified_link && !(vif->active_links & BIT(link))) {
+		unsigned long tx_links = vif->active_links;
+		unsigned long peer_tx_links;
+
+		if (!tx_links)
+			goto out_keep_link;
+
+		peer_tx_links = tx_links & sta->valid_links;
+
+		/*
+		 * Prefer links that are both active on the vif and valid for
+		 * this MLO peer. If no overlap exists, fall back to vif
+		 * active links.
+		 */
+		if (peer_tx_links)
+			tx_links = peer_tx_links;
+		else
+			WARN_ON_ONCE(1);
+
+		link = __ffs(tx_links);
+	}
+
+out_keep_link:
 	/* Perform address conversion for ML STA Tx */
 	bss_conf = rcu_dereference(vif->link_conf[link]);
 	link_sta = rcu_dereference(sta->link[link]);

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.25.1

