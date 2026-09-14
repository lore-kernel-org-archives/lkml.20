Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCF36826B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357403; cv=none; b=gvHrKv6wx8ANhMK+PYD0rMHh06q0UyWWsPjVWSkW8izGUUF22CcAaHn6/2I3jLDxxQ3OySxOLmAfq/0p0c44WzugVY54Clrex6ngljH51jW2gziEzh2c789TGd13jGmbpmTYN9YM1JLXJXcu194m5tbVKwkIp21iWUfrvo4XT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357403; c=relaxed/simple;
	bh=w579INk5HIY4CFkQ0m15JvuCIyvCxdEX8EntRbAN1lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5WsXK5/uFQ4CoiJP/IuaWoHduUD6z6hkojI7HY7VesvL6rS2hmqZJqFDketMeSk/jU1yy6eR8N/7q/xo8jLP8H6X4RHXWYZojPykrQhpvlwMT7Py1M6Vuc+iDl9aVu6rcwyA/MEK+btA16au+pSW+UQKMreBXIvvBnAV2/3STA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROULYNen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnOfsUeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROULYNen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnOfsUeW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eemZ2241380
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYkjE/aA061mfOcjRAR+umhJu7g5L7SSr1+2F6cUv+A=; b=ROULYNen02/KzOSj
	gKahloS2im7tNBizSnmtQ1yfHiEp11Zyt3xEyeT076w2NWr7nQILoba+Lj/d3uFp
	gEzC8kFH4ktgPL08LEeYEIzvmSY9MrtRTtTDDUPQnXqn9siqOcyUz3sOOSKM+Y60
	KcXds6J1SywgMw1aFNK+UWBbXoF+TclBfcj8EWk2J/GrsZah1c3SZeAXrj+FN4TY
	fLL36IcjAEbtw2dT0XkXA8t4amzzJPf33CRizGxDEfAFN6R1Y4KNJ7BMi5HhB9QC
	zwMcJBCrBVnC+4ivJaKFZ8zaGWJJLE7duRwf2HH8jny7RpP2uUJQKkQxIMBQTKPr
	udlckw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4rnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so872875a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789357401; x=1789962201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYkjE/aA061mfOcjRAR+umhJu7g5L7SSr1+2F6cUv+A=;
        b=ZnOfsUeWGkPuQbQykMykCG1BGXmI3wboHPPLAvW5AkSlEHI5OaNdVDeEp9VaNmbgPd
         qIv3rrqF0BZhyZSMeg6G6SVgVDZOM5LUYx4/ZbVoVcE5CqLxc/O43nhfjcn74fLZBuDe
         hzVkyqrD/TaB9eXr16HDgwQEgp+U2dHZTe8MSusWzuFtM2su3cvLMOFBhCtxyqxFvPJI
         QkHmQ5h+4gaFDfzHvlLUv3ujwJ5rvI+WTcwvUnMkfpjzI0EPYsdhJO0qpQWkodCyjB9L
         S6nw2I0mhydw9fe6RqnwerfGzgTuNyKeeDqUCGKb6tbfxFmONK6fse0Yo3YizWEcIfsF
         uvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357401; x=1789962201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYkjE/aA061mfOcjRAR+umhJu7g5L7SSr1+2F6cUv+A=;
        b=AViRo80Uf1AM8+mN2vbrTKNMbYNOQeZnQSkV72gh0ga4v3WA0rt2dvhWLOwmndTiVn
         Mr/IlYH9wcjKLNFG1KcisbAHTrCJNSn1PeVorfgbSel/ZsTPshs7QP/+INsPurwlHG+o
         DYOZ20uyiUAPQr4iwPHCDG5iu3xSTXLrjEbQ+xv9FTP7BVBL5lER8fcfuY8MM1TWOmdq
         cOr+edKkWqL0EV9gsVpPuJN76VJROCvz8VzBwYktpZkVhKINlHHhAcjE2sqMX4FDKO+K
         6kqUORglPXYyimtnFnTVCUG+gkmW213tgYNxv62k5pmMQdN4db1r4YRQ+1Enexin9G4k
         ES+A==
X-Forwarded-Encrypted: i=1; AKwUvBxU3D4m79WyF248XGZ3YdjOW9eVXWv66Ir7vP5P3aIx3dhSRDvgLYSPZG9CQ1vKxq4Z33buNsO94oe6iVw=@vger.kernel.org
X-Gm-Message-State: AFuF++kFFPFge4oYYwbkq9WeVUdntVD7uPzxNxet+KEiXqdUD4G+3dtO
	4F8V2zd78bB/mMXjUmMP5wQZGnL0DiE/eGk3cX+z+FzH/yAiauSsQbUY2A7pmwv65Dvo0/SnYFL
	ZYVvooGZZw/wzUOihFgnFdu65BRnj2pBP3X0EuRxjVkIctGZdaDRC3qasDWhA/qnS9N8=
X-Gm-Gg: AYBFou29CbxFXKFelcKUyyf2PaxkjQs36eklSWgpR1h4fTS6YmUBRa/5bnSzCfD1IJW
	qPb7oPl08B4sdC6Jcl6YQ4JxUp7QR2y4QJaeai+hH3z5YBydnfoJazTHAx7BnFz5UOH0D4oDE0q
	SGZuFLNwWwdEAk52YtFOxOPwIDSADmKImtzSX9PDkV1hs+i2lcatB+flhws2zI9VgqdMoDXR6a/
	SD8aUt86yKywUmndjKpf3hDpXEwLGWKjeO7+dfLlFXWyXUzDqbHo7xZdas17P3wtFg41TCh+YC5
	7C6gdD1ozxUYSeM+3qLma4FsIPxnjP46b+Q87CmPOzOCF9jXQpszeziBr5pyiv/mGYJdr7wfRAX
	wcPp1646j8BD4OZ51kV3fHlGlT+CALN4uITviu7z6VF3Beqk=
X-Received: by 2002:a17:90a:d88b:b0:398:bac0:238d with SMTP id 98e67ed59e1d1-39dec21ea0cmr1125539a91.5.1789357400596;
        Sun, 13 Sep 2026 20:43:20 -0700 (PDT)
X-Received: by 2002:a17:90a:d88b:b0:398:bac0:238d with SMTP id 98e67ed59e1d1-39dec21ea0cmr1125502a91.5.1789357400138;
        Sun, 13 Sep 2026 20:43:20 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm21250894eec.18.2026.09.13.20.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:43:19 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:42:58 -0700
Subject: [PATCH 3/4] Bluetooth: hci_event: Use 254 as max LE Meta subevent
 payload length in hci_le_ev_table[]
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-misc_fix-v1-3-558c1e4028b9@oss.qualcomm.com>
References: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com>
In-Reply-To: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Manish Mandlik <mmandlik@google.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: AyasJ5cWbD09cXaeLc_UtRoa8bwJyNH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfXzJHopOgL6Twh
 rhwREIjn7XGHz6y/6B6I5uw7nBk/HXVGFJga4BnH6XBthMP1n6s+Fsgt6Q0kA8RdpNdLhAIbZdl
 8oRJxdzCBKWqHH+HbVu/Lm2FO2bLl42nBuOehjewqwK1nDZQkRxlcPHwO24gbi0wF+p85HIxksv
 5TAqU7e+JDFnaBNX4fpxV44vCUBXN+wDhBsL1pNbO7L5weP1HxEop1vevq1zw7jvlPBfTaPY/Vc
 uEmS08AhOsW4R+xMJK8j4lt4b1Ky1iYLa7Q7mPnO+yba08hrlzDhd7pwCGBgEKxOkuF0EKrKcwt
 Dh39dXsddMIDOvdeqisLUVd67UTTlE9PyJvD0zVr55snJ11CfEJrVeUYzxlzL8dgy7OSwlmlg5k
 IkRYUG1rMPACEDCVmz/xZ6Sh3VSOwxHyCgNzLfZnM5uaZotGKVJMRyBNMUUVXGwtlHp2r022M68
 BGOIk8dBQRPMhnzQTTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfX0eIOP49DPHDS
 WFgcIqR98ls5Jf30BYU54LjL3lVie7aD+KAjyEfBN6j+v8HhBMx8whDnDjP7ybcfXbQ95McTGy1
 QY4M0C4rudXKpqUPyJkBifVJEJGp+cY=
X-Proofpoint-ORIG-GUID: AyasJ5cWbD09cXaeLc_UtRoa8bwJyNH3
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa76d59 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A2jjY7DYbelx_RivTkEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140049

hci_le_meta_evt() validates skb->len against subev->max_len from the entry
in hci_le_ev_table[], By then, the HCI event header and LE Meta subevent
header have already been stripped by skb_pull(), So the max LE Meta
subevent payload is 254, but hci_le_ev_table[] still uses
HCI_MAX_EVENT_SIZE (260) for it, which is imprecise.

Fix by defining HCI_MAX_LE_SUBEVT_PLEN (254) and using it instead.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_event.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 03b805207ab0..1eacdd93c5b5 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -7469,33 +7469,36 @@ static void hci_le_conn_rate_change_evt(struct hci_dev *hdev, void *data,
 }
 
 #define HCI_LE_EV(_op, _func, _len) \
 	HCI_LE_EV_VL(_op, _func, _len, _len)
 
 #define HCI_LE_EV_STATUS(_op, _func) \
 	HCI_LE_EV(_op, _func, sizeof(struct hci_ev_status))
 
+#define HCI_MAX_LE_SUBEVT_PLEN \
+	(HCI_MAX_EVENT_PLEN - sizeof(struct hci_ev_le_meta))
+
 /* Entries in this table shall have their position according to the subevent
  * opcode they handle so the use of the macros above is recommend since it does
  * attempt to initialize at its proper index using Designated Initializers that
  * way events without a callback function can be omitted.
  */
 static const struct hci_le_ev {
 	void (*func)(struct hci_dev *hdev, void *data, struct sk_buff *skb);
 	u16  min_len;
 	u16  max_len;
 } hci_le_ev_table[U8_MAX + 1] = {
 	/* [0x01 = HCI_EV_LE_CONN_COMPLETE] */
 	HCI_LE_EV(HCI_EV_LE_CONN_COMPLETE, hci_le_conn_complete_evt,
 		  sizeof(struct hci_ev_le_conn_complete)),
 	/* [0x02 = HCI_EV_LE_ADVERTISING_REPORT] */
 	HCI_LE_EV_VL(HCI_EV_LE_ADVERTISING_REPORT, hci_le_adv_report_evt,
 		     sizeof(struct hci_ev_le_advertising_report),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x03 = HCI_EV_LE_CONN_UPDATE_COMPLETE] */
 	HCI_LE_EV(HCI_EV_LE_CONN_UPDATE_COMPLETE,
 		  hci_le_conn_update_complete_evt,
 		  sizeof(struct hci_ev_le_conn_update_complete)),
 	/* [0x04 = HCI_EV_LE_REMOTE_FEAT_COMPLETE] */
 	HCI_LE_EV(HCI_EV_LE_REMOTE_FEAT_COMPLETE,
 		  hci_le_remote_feat_complete_evt,
 		  sizeof(struct hci_ev_le_remote_feat_complete)),
@@ -7508,33 +7511,33 @@ static const struct hci_le_ev {
 		  sizeof(struct hci_ev_le_remote_conn_param_req)),
 	/* [0x0a = HCI_EV_LE_ENHANCED_CONN_COMPLETE] */
 	HCI_LE_EV(HCI_EV_LE_ENHANCED_CONN_COMPLETE,
 		  hci_le_enh_conn_complete_evt,
 		  sizeof(struct hci_ev_le_enh_conn_complete)),
 	/* [0x0b = HCI_EV_LE_DIRECT_ADV_REPORT] */
 	HCI_LE_EV_VL(HCI_EV_LE_DIRECT_ADV_REPORT, hci_le_direct_adv_report_evt,
 		     sizeof(struct hci_ev_le_direct_adv_report),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x0c = HCI_EV_LE_PHY_UPDATE_COMPLETE] */
 	HCI_LE_EV(HCI_EV_LE_PHY_UPDATE_COMPLETE, hci_le_phy_update_evt,
 		  sizeof(struct hci_ev_le_phy_update_complete)),
 	/* [0x0d = HCI_EV_LE_EXT_ADV_REPORT] */
 	HCI_LE_EV_VL(HCI_EV_LE_EXT_ADV_REPORT, hci_le_ext_adv_report_evt,
 		     sizeof(struct hci_ev_le_ext_adv_report),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x0e = HCI_EV_LE_PA_SYNC_ESTABLISHED] */
 	HCI_LE_EV(HCI_EV_LE_PA_SYNC_ESTABLISHED,
 		  hci_le_pa_sync_established_evt,
 		  sizeof(struct hci_ev_le_pa_sync_established)),
 	/* [0x0f = HCI_EV_LE_PER_ADV_REPORT] */
 	HCI_LE_EV_VL(HCI_EV_LE_PER_ADV_REPORT,
 				 hci_le_per_adv_report_evt,
 				 sizeof(struct hci_ev_le_per_adv_report),
-				 HCI_MAX_EVENT_SIZE),
+				 HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x10 = HCI_EV_LE_PA_SYNC_LOST] */
 	HCI_LE_EV(HCI_EV_LE_PA_SYNC_LOST, hci_le_pa_sync_lost_evt,
 		  sizeof(struct hci_ev_le_pa_sync_lost)),
 	/* [0x12 = HCI_EV_LE_EXT_ADV_SET_TERM] */
 	HCI_LE_EV(HCI_EV_LE_EXT_ADV_SET_TERM, hci_le_ext_adv_term_evt,
 		  sizeof(struct hci_evt_le_ext_adv_set_term)),
 	/* [0x18 = HCI_EVT_LE_PAST_RECEIVED] */
 	HCI_LE_EV(HCI_EV_LE_PAST_RECEIVED,
@@ -7545,38 +7548,38 @@ static const struct hci_le_ev {
 		  sizeof(struct hci_evt_le_cis_established)),
 	/* [0x1a = HCI_EVT_LE_CIS_REQ] */
 	HCI_LE_EV(HCI_EVT_LE_CIS_REQ, hci_le_cis_req_evt,
 		  sizeof(struct hci_evt_le_cis_req)),
 	/* [0x1b = HCI_EVT_LE_CREATE_BIG_COMPLETE] */
 	HCI_LE_EV_VL(HCI_EVT_LE_CREATE_BIG_COMPLETE,
 		     hci_le_create_big_complete_evt,
 		     sizeof(struct hci_evt_le_create_big_complete),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x1d = HCI_EV_LE_BIG_SYNC_ESTABLISHED] */
 	HCI_LE_EV_VL(HCI_EVT_LE_BIG_SYNC_ESTABLISHED,
 		     hci_le_big_sync_established_evt,
 		     sizeof(struct hci_evt_le_big_sync_established),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x1e = HCI_EVT_LE_BIG_SYNC_LOST] */
 	HCI_LE_EV_VL(HCI_EVT_LE_BIG_SYNC_LOST,
 		     hci_le_big_sync_lost_evt,
 		     sizeof(struct hci_evt_le_big_sync_lost),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x22 = HCI_EVT_LE_BIG_INFO_ADV_REPORT] */
 	HCI_LE_EV_VL(HCI_EVT_LE_BIG_INFO_ADV_REPORT,
 		     hci_le_big_info_adv_report_evt,
 		     sizeof(struct hci_evt_le_big_info_adv_report),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x2b = HCI_EVT_LE_ALL_REMOTE_FEATURES_COMPLETE] */
 	HCI_LE_EV_VL(HCI_EVT_LE_ALL_REMOTE_FEATURES_COMPLETE,
 		     hci_le_read_all_remote_features_evt,
 		     sizeof(struct
 			    hci_evt_le_read_all_remote_features_complete),
-		     HCI_MAX_EVENT_SIZE),
+		     HCI_MAX_LE_SUBEVT_PLEN),
 	/* [0x37 = HCI_EVT_LE_CONN_RATE_CHANGE] */
 	HCI_LE_EV(HCI_EVT_LE_CONN_RATE_CHANGE, hci_le_conn_rate_change_evt,
 		  sizeof(struct hci_evt_le_conn_rate_change)),
 };
 
 static void hci_le_meta_evt(struct hci_dev *hdev, void *data,
 			    struct sk_buff *skb, u16 *opcode, u8 *status,
 			    hci_req_complete_t *req_complete,

-- 
2.34.1

