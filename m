Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A236AB77
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357404; cv=none; b=GVocZNUvfvaDPiddM9EwSAvXWP/4ErWrV4X3nKdYP+rOCLjWmU4U4aC0Ajiht9VemPtuZmXPjVciho9ztBEGr7Vb7Piqi67WgL7QRtpwjr/OXlM4jo1BG1WDR5pekR2VQjVNACwH6vIEPT2rVyH3LlPUFhzlqxNLFkkvVn/Ml6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357404; c=relaxed/simple;
	bh=m3mEMCM2N86YPROdNx2HgOUYR7NEPesxcH769+cz/Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiibnHaVsNUe+RHjp3jC8muNbvsKDlYnS/+OY4YvAid01mLu+MHel6EgHoJLMLxKmabE6vkEFNt2l+tYB0W9Vi/Ut8t6bCDLAn4YUm7x8Pnr31w4ECrIOw1zMjHOkiMhY85hLuhNNCrHPU69A/CaBxqwyopjAcEMuQ/2rA2Rjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpctDhZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz3DqObs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpctDhZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz3DqObs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2ePHc151697
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7GArmKpLP9AjtAbGUkxNxbZRVuwStWITOastx/GsUg=; b=HpctDhZKjovM4eS9
	pk3lhnB5Z3HuG98U3Mv2+d4yVHyhcAGt8QvarE8+wVz9ER+JHukrXm2B2fq1mfm1
	iD/y6cx/PJUbzShCWmM6fKinyOIjjmv2BShfsqYz1qctpkNxI7ots16NeJSg0Xru
	sRwFp0gMiHJ4HnPkDPRDKDubnh7HbrFp+XbbxLdDImkMAFdWnivqRZIiD+NNMALL
	CvXw3nRlEUXYxnxELrfYdXZt93ZreOHTR0B87XXt3SWUqGl9SuzaHrkdz/JpEocS
	ht6AhsiMABhkJmcff4zqVb54aAL7yCiO3Tq5t5o2CNaSIcMOoBPHmmkpJYyDl3CN
	keZURQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08qxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399271df9d8so753775a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789357402; x=1789962202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7GArmKpLP9AjtAbGUkxNxbZRVuwStWITOastx/GsUg=;
        b=Hz3DqObsTbnmizpvEDMWCoCqJNKdcDS7ZAvqATmGgnCocfYFAYgsuSmq4aG0D7Tv4K
         qmwyldKSRb+JDVjrb96GdCftI2FoIQoaSE7UfmlUlXHuB925g3rdpFUkf0HDsXD3/yj1
         4N3sFkjboPfQe/YJvIjblDSAEIE1WWB3ANIfAkCRarknM/WidMk+xwlrMBLXbmxZuL+/
         dMFX7lWyglghHeMSa3gmVYL5zj3UgM+DB0uu3A3GpqXsK24/Ed7XZAd0nOI35PQdRmMJ
         XbE8bJLGp5TIToi1PuKcuAvuJebSnz0xJX/dvzIkrcoWGKoVckeBWvVCTkxBgyYkh5Bd
         WC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357402; x=1789962202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7GArmKpLP9AjtAbGUkxNxbZRVuwStWITOastx/GsUg=;
        b=Y7WYFcv8nFitP2Lr2PvsyhOayrCUkBkDX977IIl8E+cNbdCJebLwkcxN77NRDZbUPo
         L0saWOSc+xVZiezcf71XeoIWPQsD+BhN3RwYNqvH6d7K4vVS+B2uM0ims6cU6ewxkNf+
         AaV8xGCSaihLXJ5x0wgUrJYTGYl0iKWu0tw1qunWKuQUAfdLCEcyEZJIECUio8JqhVvy
         zlXKpsypKBhlcvbrw7gR8fliE9ZX3Kh2BEY2uQ/V6KIvAOjRwBwTI8Gso/58OeH6VO8Q
         v6p2eVAXKttMMrQNKMyV5XHGhKYU+QzR4B3ktiy9OVgGyHFUSCYbivdN5HfAiQXEkwJq
         c87w==
X-Forwarded-Encrypted: i=1; AKwUvBz4J8lGPPDMH16FmtBvnofjkB/4V/wviC4u/j9PCy3FEd0SjqMy2qCtyc2RnRChw+/ghAS1xhEQNPKKFE0=@vger.kernel.org
X-Gm-Message-State: AFuF++mHv4qYF6joPyD+HHYm1VVcujHyarIjiKTZPicMH2nhZRMmnAWo
	8y7x1IP5x5FI2lmnJNsE+c0qu6EWr5lv4aSGPuSCH+1dacSF/v7Z0dchuzybkcve59v7e6Amokq
	AxkP5TntCfPA1eINjocVQS4dqmf/jHbOFdBe3EFA4m0sh6X1j/fFCPJVNo3vKrupFpnQ=
X-Gm-Gg: AYBFou09NR5zKII04MkGdxc1hKr27OLUaGtViH88b8RpECJi939Baglyv5Mdc8xQiZS
	amELDvYUqxKA6ghuKafkJ+iJzo2LNw6sJExMGgIWXVxaYPc+k/uMBIrtaOrd/WfbgQWmkE3NBn/
	6JJXT0HDsHIkL7yT95hW8bvf7mDnYK9ckJZCKNA8mLyQALUZm94EkN69vk2+EiI//te5r9w2qTU
	+hZ3Ve2ROJyklJjoNC5JTjdhDkfkJS2JhMu9x6Hpq8kgrfJmB6FB6Cvw7t56ljFX4qNcXPaxj8F
	sDAhsTp69e/bgDVtxQweFLuWnTK/QvJkaPjl5/ceKLVUMyOeVWaAoU1mv/rhizsr14ffRiv7MXw
	39H4k8gA5EgAD8slo4tVs3gtK8rl6m4bpuCc4Seua10srPgA=
X-Received: by 2002:a17:90b:4f:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39dec251bf8mr1119711a91.6.1789357401741;
        Sun, 13 Sep 2026 20:43:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4f:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39dec251bf8mr1119664a91.6.1789357401164;
        Sun, 13 Sep 2026 20:43:21 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm21250894eec.18.2026.09.13.20.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:43:20 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:42:59 -0700
Subject: [PATCH 4/4] Bluetooth: hci_event: Use 252 as max CC event payload
 length in hci_cc_table[]
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-misc_fix-v1-4-558c1e4028b9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfX0ZvMXV8n314s
 fn/+S4zjMRNZ6Td9RGDU2z3pnfjql3jFhQcsg912NODkMK7HpOV+35uDEuklobypO8VgQmbQVa2
 fdFS5ynLkCbiCE7Uar6LCRUU8hyRFvg=
X-Proofpoint-GUID: kD1rURCaMe_sMQz4CONoPaifVu64FelG
X-Proofpoint-ORIG-GUID: kD1rURCaMe_sMQz4CONoPaifVu64FelG
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa76d5a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=u9mAljIaFVsWc0BqypwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfXzLTeUMhodlae
 9WTcyF7kl/v1yBP8OCsYRxfpMnDND+tXSYM2j0CUAtZ73ofUBPeLRokHLsBJNu4O+5INNXvaqZp
 ctikQS13UYTS4P/41+yaeNTgR+vpIsqOK6WY50Xn39twzAjzUubRC1+4jpmCHUJAg3uUbOvnuwo
 jyElC5K5XggG6PPBs+890qF7MI3lCi8g1fz2cHjgICQk798BVjLQ6WoNyfbu2O8Jjsa2V5Z4b0a
 TIovnrmhUDa0AbsjxBp5U8OSRp6QtDhOF+XyuzEl8FPHeA191BvxVZCmYG5aVA/fLJjd+qOm2JW
 7kzRsbUtN3ela+mV5Ud4KwPqXzUlbIW10MxdCXWmr5L7Gsjzu04eTQ4+9vdgDQgRO5TMKTDYlY+
 IAvJFPskkMhfOGxQLvWyHxEzfoW8IZCQIsfyInc8Uglmlp1kn2fa/V4jC8pozvCjPzSY8uM9pXo
 cKoJ4QL4TpMKVGcsKDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140049

hci_cc_func() validates skb->len against cc->max_len from the entry in
hci_cc_table[], But By then, the HCI event and CC headers have already been
stripped by skb_pull(). So the max CC payload is 252, but hci_cc_table[]
still uses HCI_MAX_EVENT_SIZE (260) for it, which is imprecise.

Fix by defining HCI_MAX_CC_PLEN (252) and using it instead.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_event.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 1eacdd93c5b5..25ddba2f603b 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4094,16 +4094,19 @@ static u8 hci_cc_le_set_per_adv_enable(struct hci_dev *hdev, void *data,
 }
 
 #define HCI_CC(_op, _func, _len) \
 	HCI_CC_VL(_op, _func, _len, _len)
 
 #define HCI_CC_STATUS(_op, _func) \
 	HCI_CC(_op, _func, sizeof(struct hci_ev_status))
 
+#define HCI_MAX_CC_PLEN \
+	(HCI_MAX_EVENT_PLEN - sizeof(struct hci_ev_cmd_complete))
+
 static const struct hci_cc {
 	u16  op;
 	u8 (*func)(struct hci_dev *hdev, void *data, struct sk_buff *skb);
 	u16  min_len;
 	u16  max_len;
 } hci_cc_table[] = {
 	HCI_CC_STATUS(HCI_OP_INQUIRY_CANCEL, hci_cc_inquiry_cancel),
 	HCI_CC_STATUS(HCI_OP_PERIODIC_INQ, hci_cc_periodic_inq),
@@ -4187,17 +4190,17 @@ static const struct hci_cc {
 	HCI_CC(HCI_OP_READ_LOCAL_OOB_EXT_DATA, hci_cc_read_local_oob_ext_data,
 	       sizeof(struct hci_rp_read_local_oob_ext_data)),
 	HCI_CC(HCI_OP_LE_READ_BUFFER_SIZE, hci_cc_le_read_buffer_size,
 	       sizeof(struct hci_rp_le_read_buffer_size)),
 	HCI_CC(HCI_OP_LE_READ_LOCAL_FEATURES, hci_cc_le_read_local_features,
 	       sizeof(struct hci_rp_le_read_local_features)),
 	HCI_CC_VL(HCI_OP_LE_READ_CONN_INTERVAL, hci_cc_le_read_conn_interval,
 		  sizeof(struct hci_rp_le_read_conn_interval),
-		  HCI_MAX_EVENT_SIZE),
+		  HCI_MAX_CC_PLEN),
 	HCI_CC(HCI_OP_LE_READ_ADV_TX_POWER, hci_cc_le_read_adv_tx_power,
 	       sizeof(struct hci_rp_le_read_adv_tx_power)),
 	HCI_CC(HCI_OP_USER_CONFIRM_REPLY, hci_cc_user_confirm_reply,
 	       sizeof(struct hci_rp_user_confirm_reply)),
 	HCI_CC(HCI_OP_USER_CONFIRM_NEG_REPLY, hci_cc_user_confirm_neg_reply,
 	       sizeof(struct hci_rp_user_confirm_reply)),
 	HCI_CC(HCI_OP_USER_PASSKEY_REPLY, hci_cc_user_passkey_reply,
 	       sizeof(struct hci_rp_user_confirm_reply)),
@@ -4259,17 +4262,17 @@ static const struct hci_cc {
 	HCI_CC_STATUS(HCI_OP_LE_SET_PER_ADV_ENABLE,
 		      hci_cc_le_set_per_adv_enable),
 	HCI_CC(HCI_OP_LE_READ_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
 	       sizeof(struct hci_rp_le_read_transmit_power)),
 	HCI_CC_STATUS(HCI_OP_LE_SET_PRIVACY_MODE, hci_cc_le_set_privacy_mode),
 	HCI_CC(HCI_OP_LE_READ_BUFFER_SIZE_V2, hci_cc_le_read_buffer_size_v2,
 	       sizeof(struct hci_rp_le_read_buffer_size_v2)),
 	HCI_CC_VL(HCI_OP_LE_SET_CIG_PARAMS, hci_cc_le_set_cig_params,
-		  sizeof(struct hci_rp_le_set_cig_params), HCI_MAX_EVENT_SIZE),
+		  sizeof(struct hci_rp_le_set_cig_params), HCI_MAX_CC_PLEN),
 	HCI_CC(HCI_OP_LE_SETUP_ISO_PATH, hci_cc_le_setup_iso_path,
 	       sizeof(struct hci_rp_le_setup_iso_path)),
 	HCI_CC(HCI_OP_LE_READ_ALL_LOCAL_FEATURES,
 	       hci_cc_le_read_all_local_features,
 	       sizeof(struct hci_rp_le_read_all_local_features)),
 };
 
 static u8 hci_cc_func(struct hci_dev *hdev, const struct hci_cc *cc,

-- 
2.34.1

