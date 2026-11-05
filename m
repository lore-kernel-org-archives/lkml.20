Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907635;
	b=ThmEkh2eHKZzAex2hV3Imar1IsDlizRqq2OarW9xFwrmjNgE2K2n5wEnWbQWfzeRkpOY
	 PdjBhK3zlxhzPouT2EDNFsdSjgbZLWeRBL7g2x4AxRvZWwJgM6V0H8TRnH8Mg6x6wzhFn
	 3YDtO4Pp+ks2DmGm6IInNsSrcwX3lp8zakkTOTT+wtWddYXfZnXp5IsGbHyFn6fBw6hv+
	 Hv17N7uJ73Hpw9UR7FFlyodNVqwchO5+Efd7C52igp3iH+R0JXEJjwvydVcr+So65kApm
	 ff7G16Q5uM1Gu8SXCR08Y/54SlJ2Ty0htKCRHIb+FFQh7Ufys4YNAuvEDMC9EVLcF/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
	b=RbwMsHV1m4BF2Tlz6Coz4uo9Lwuhp7YUwiRxqcR2027engZ0CPu8hupi+WYSoSYg/HuP
	 NbzLUe1L3u3AxdiqJvuivsCKDujMpRsrQJTHBVhJN8Vp9eHJINKd35QezKhpwo2Nn8HRs
	 Ey+u34gHi9K+l4dMp4qyz2wV6FT7tBIYhMy+xfhcEBoRlE/Ndq6j8DX8CICSDpchKXR/P
	 61zvg3BZSVewYqJYlR6PEYxzs96XRF2hXtMqVYgMKoaS0xsWXOLK2RaDnFichJ7KflMZ4
	 /2Bd/RkDJW18AZzz3TlPdnXEaIcxpDNE1sGpH8b+VysoMe6WW7i8CfnUX9KjNNbjPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lICFUt19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0vbx2u7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4F6082BE2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB4F6082BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lICFUt19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0vbx2u7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQJT1122112
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=; b=lICFUt19cPudNs1p
	gt3LLcixl2VrlE1PW9a4d4TTh/JevYYsbggadMWY6xeFjyr5YnGM99z+4Zb+LOXF
	18sJovqA3nC9dIP4qszatqd6z139E+P8Kr4VZ0lshGsg4oUhnHGmv57ZOobi/la2
	2DpPExhHhpW5DJznqfjL28OTDd54HpLKrpPeOG/MCLy05DusG88cv6WikkVhNXDj
	5uElfxRh+0wdUmYSxUvrLJ174EgaNeVnG4RmTgDS5kZwV6Rct3GLTJ1ov/ymH91N
	u7anRA4H244gUkrmqYPOJqrBCcksjb3G+GTdDBcQdrdAvuaYPvs8VxhTgEUk6nB2
	CQ7j7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p2r37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so667796eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907632; x=1794512432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
        b=b0vbx2u7zaWjyNj5BT+VuGMj6i+4a5VBSEXKaOK5ukOKgnDHH11+mVkxEdjtIXSKZh
         xGuBX19uwN4kDQy5geku3gACJwAeY4O2EciQV14nS/+l5yMku+3LsffmgF/13t6veSxG
         39/4al/+i9tgtxrDET7qA1QIioEMWr3sapFxuEnKZNcbvVQzNZ+A14j5t+r5g6EDVHGt
         k1QC9VxQeRc0XTMdDejzVXdMosj5EY4O7Hbm2sPIR4AhcpC5RNF5pqm5jgz1+zdEGjlK
         Ifv43W0J3Ry0BL/+8nFpMCgGUp0uL6ig+5Pmom++vxcR6+r2OSDWS/Oh3dyRu2Hn+iym
         NQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907632; x=1794512432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
        b=waFPtLXTAXQIHTtOKY1BkPmo0rsPXlWPvlZYVFzoxttbM/2gQn42R8On+UGSvHn98j
         Gt4vQvR53s37naFYlS3GhKj1bVd1WcvcHQeoV1R9qxDk4J2XzwU4p1k1cpK2M/YEjvmX
         gvxUMLuJrHOE3mE4huLzn+s/gjkONmBbIIuZ8VBhxFazSYlAqK5Fhw+6JSFwkKWDSbUy
         A70KfSi3m0/8ceN1HgNL7kNxhY8+EA7tf5rNHibRdMjWG8mD3qsrWiAzFh8rwisNA02c
         sx2VJm7XPAdBei6tEg8IcLxnUzkB1DFSrl8oAm3oj/CcB3nELFm/5eRcEV1ZQYwWDYFL
         ODYg==
X-Forwarded-Encrypted: i=1; AKwUvBygq53lbmcpYBPTG827+SN+j6PctXqtsWDC/Ugtefq7Or3Wip2HXgmgq0u+bL1fTV+sBxi+Up5GdS8Guqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xUiBWoNwT29PM0iI+QV38XtWEpG12buVMZoC0hGE33/Ztf3gh
	W5wG4LjVsTgBIVyWpvJrPACVZboG1G5Pc4hHyGokn4JrsfyDYfaYNtrnyDA0VAyhsl5z6ZIIs2G
	aHBT43nHzlQ1Mqyd6HknZi5XMeau4/dNfLsPJbV4/1nP8eHN5ebHEkqVOd7dYUzoqdmbHMqrX5A
	==
X-Gm-Gg: AYBFou0TQR+hg9fPbiGTp+SX+FhOFAZMOHO9UsAsqakQTrqGNsE4hOmScDUgQkI2OyR
	N5Fb3D8SLDHV4qhFWxBbHHvSCS6nbVPIYjTFJPNdONtpMXkLs7k/8z1gl8aUhACGZ3dS0R4EINp
	x7lDRESSSpfd8N2/Q1kPJBBosG3YH5zP46h2RHmKKFa9YC7FVJ8fkx6FJ/AWXOmmezh7Tg+0Unl
	/M8zvcQgam1RMUgevvYtzcrPLIf5mwlixub8+Dp5qvfhECBvCwHovHVLRyqjmlAp3cIVKuMdl5R
	9+CcVwFTpuU6zvkna8Olz6s7JmPYRzFzlIsRAWsudkG6HTkgnl6GxhfyuAhuuU8vc63XcXWGyFC
	/JU9sVf6VrXHbmu5fRZoZtj5Cv8jQVn3wVM+0mMdCjONjQ8gd7+EDpz8iXQ1Pdvuxy1ahC2lMbl
	D3mz5Ds9UF2CYhM4OFrnPpBpxgXFACtmyaAyED1mCbvzDWJ/HoKBO97sW3VHVZ/NmCkYbdAQ==
X-Received: by 2002:a05:7301:f8e:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36f775f83f4mr152689eec.41.1793907631574;
        Thu, 05 Nov 2026 11:40:31 -0800 (PST)
X-Received: by 2002:a05:7301:f8e:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36f775f83f4mr152653eec.41.1793907630996;
        Thu, 05 Nov 2026 11:40:30 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:30 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:41 +0530
Subject: [PATCH wireless-next v3 06/21] wifi: ieee80211: define APIs for
 UHR Link Reconfiguration frame checks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-smd-v3-6-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aecdbb0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oDYSrMgdSjg_aXkkWaUA:9 a=bFRUnEHUPHmmGGYb:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8AgvHeieCKB9
 GesWwAdAHbaV8rKofElF4idNWA45nuTminhehVLqj0yXMouc2WQM+WysU6SpZJKW2s98dT5YU5Y
 6ZMQbs/wKjLUEM1lnTk2T5yFwm2mJJWxM1HWgcjwzdR0L1qVaMmc937d2NiFOaQEHm+faH7+h2z
 MK7QujAkKsuvsHiHVUV69cr7yxEzUZGKjwNn6y0k3EPVHgeqjUnUi8e/gDEMOZFtCzmI6fM8/Nj
 n2Kh2lGB6uu+BMaUfbREP0GY8idWgY6WjdV+z+NY8z/Luk+2e+HmrCrXBuCVzG5lU8w6+FfLmlJ
 q3wF4Bh3xDdDkQG05HJNvg9DnOTexAYDSCeL9jXbmMqgr8mb1dAbUnK4q+vgwbMUWfoFVWmmVSD
 J8Dpcv7OI6G+MsvBD7D0ZJe4PYg09jDylNDuE4AKQRqrAnDxsxDhuji3iVdw8vYNAsvnfFLew8w
 gKaJhvibayAeGhcdXhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX+Hi7H4Y2qy6j
 r0Wj/zWt4aqFuG9xHsgX7mAXQIPgDq0GXu7Zcaj7AIGNHPq5usriHcuukW38J85JVd0IzvrvG+4
 pyiKi2764NxiLXfRxluUZF+JzLAk4OY=
X-Proofpoint-ORIG-GUID: KsGELfUM5IvCZFO7G637y1cXtWq13N4z
X-Proofpoint-GUID: KsGELfUM5IvCZFO7G637y1cXtWq13N4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

Add APIs necessary to check whether the frame is a UHR Link
Reconfiguration Request/Response/Notify frame and subtypes to invoke
necessary SMD BSS Transition handling on the AP MLD.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h | 125 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index c6c89e4562f4..9274fa146f01 100644
--- a/include/linux/ieee80211-uhr.h
+++ b/include/linux/ieee80211-uhr.h
@@ -699,6 +699,131 @@ ieee80211_uhr_mode_change_tuple_next(const struct ieee80211_uhr_mode_change_tupl
 	return (const void *)((const u8 *)tuple + needed);
 }
 
+/**
+ * ieee80211_is_uhr_link_reconf_req - check if frame is UHR Link Reconf Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is a UHR Link Reconf Request frame
+ */
+static inline bool ieee80211_is_uhr_link_reconf_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 category, action;
+
+	if (!ieee80211_is_action(mgmt->frame_control))
+		return false;
+
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE(uhr_link_reconf_req))
+		return false;
+
+	category = mgmt->u.action.category;
+	action = mgmt->u.action.action_code;
+
+	return category == WLAN_CATEGORY_PROTECTED_UHR &&
+	       action == IEEE80211_PROTECTED_UHR_ACTION_LINK_RECONFIG_REQUEST;
+}
+
+/**
+ * ieee80211_is_uhr_link_reconf_resp - check if frame is UHR Link Reconf
+ *	Response
+ * @skb: the SKB to check
+ * Return: whether or not the frame is a UHR Link Reconf Response frame
+ */
+static inline bool ieee80211_is_uhr_link_reconf_resp(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 category, action;
+
+	if (!ieee80211_is_action(mgmt->frame_control))
+		return false;
+
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE(uhr_link_reconf_resp))
+		return false;
+
+	category = mgmt->u.action.category;
+	action = mgmt->u.action.action_code;
+
+	return category == WLAN_CATEGORY_PROTECTED_UHR &&
+	       action == IEEE80211_PROTECTED_UHR_ACTION_LINK_RECONFIG_RESPONSE;
+}
+
+/**
+ * ieee80211_is_st_prep_req - check if frame is ST Preparation Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is an ST Prep request frame
+ */
+static inline bool ieee80211_is_st_prep_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 type;
+
+	if (!ieee80211_is_uhr_link_reconf_req(skb))
+		return false;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	return type == IEEE80211_UHR_LINK_RECONFIG_REQUEST_ST_PREP;
+}
+
+/**
+ * ieee80211_is_st_exec_req - check if frame is ST Execution Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is an ST Exec request frame
+ */
+static inline bool ieee80211_is_st_exec_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 type;
+
+	if (!ieee80211_is_uhr_link_reconf_req(skb))
+		return false;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	return type == IEEE80211_UHR_LINK_RECONFIG_REQUEST_ST_EXEC;
+}
+
+/**
+ * ieee80211_is_st_exec_resp - check if frame is ST Execution Response
+ * @skb: the SKB to check
+ * Return: whether or not the frame is an ST Exec response frame
+ */
+static inline bool ieee80211_is_st_exec_resp(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 type;
+
+	if (!ieee80211_is_uhr_link_reconf_resp(skb))
+		return false;
+
+	type = mgmt->u.action.uhr_link_reconf_resp.type;
+
+	return type == IEEE80211_UHR_LINK_RECONFIG_REQUEST_ST_EXEC;
+}
+
+/**
+ * ieee80211_is_uhr_link_reconf_notify - check if frame is UHR Link Reconf
+ *	Notify
+ * @skb: the SKB to check
+ * Return: whether or not the frame is a UHR Link Reconf Notify frame
+ */
+static inline bool ieee80211_is_uhr_link_reconf_notify(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 category, action;
+
+	if (!ieee80211_is_action(mgmt->frame_control))
+		return false;
+
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE(uhr_link_reconf_notif))
+		return false;
+
+	category = mgmt->u.action.category;
+	action = mgmt->u.action.action_code;
+
+	return category == WLAN_CATEGORY_PROTECTED_UHR &&
+	       action == IEEE80211_PROTECTED_UHR_ACTION_LINK_RECONFIG_NOTIFY;
+}
+
 #define for_each_uhr_mode_change_tuple(data, len, tuple)		\
 	for (tuple = (const void *)(data);				\
 	     ieee80211_uhr_mode_change_tuple_next(			\

-- 
2.34.1

