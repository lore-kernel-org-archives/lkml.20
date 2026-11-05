Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907639;
	b=g4njAWuEezFfYwLngVXJ/fbTuBd0TKQOems70o6EKecWeeafJhEZn5i0hav9WXo3UxaE
	 M6HJND/a5jYwC46tFkeMipebGJSapx8L96HSh0RTbks68WTpWKXI2BBeyI7r3XZaA92Md
	 zG+j5zhZylw1RlvdY7SGrh9a0j/oBmmnll7zTFScMNB8XZUyGq04ZMHd9/ugS8szCghsZ
	 ZXqQncd6gguniw/u4QhKK0z56SuzBnwytOeHuwNSrd9193Qldsyol0qeW1GWYWmnfUat0
	 qjnFaAxfNaVe0Z3dVLMhwunoDqZY2cKpUoS4TKvYnB1mQepcBvAIyz/8+ibLjw+YxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
	b=ZGTPQm+T9mR4DFOErAWX69jSgNyKcwxMivy7Wu/YE8wdrWTKLtZpa87SFIAE3Mp4GlHe
	 Aqy69OqBQOPF5HhqQ7D2nawzEktlBMSc19oGpW+pSv4k3XJcZhCjUg+jXEXcyJc3klXOt
	 wtjtallCU7om+d3m8EdM92HpoB9ieIISz75ED70U6FdmwLRXCSul+7XcoT9NNC5h3fXLA
	 jbNY3Hqskf0/+lqQNshszMZuu9CZPGspufy0sKknZIDBDbMCei7rT8KBq+93I9m5Zdbjv
	 FfcXiCxN8R9h2WAcg8SzPeAOhOCfazcr34QC1ez1vQYyAoEWCrRKuUEE1kcCz4N+eWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/Fr7YCp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTmgMYxr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E1607E457
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8E1607E457
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/Fr7YCp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTmgMYxr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeFnL1474738
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=; b=Q/Fr7YCpD7X0ijzM
	dUYfnI4QEbXAGvqs4K67SZHoZ7YrCRV98kcBl6Bd7iytE8PMmyyi/aPPaFv4SNzZ
	z7tPRlO8t37beNrD0H5U3o108epzHLve3dLPQDtX1NUY3AKWvy4SCztL8r2gd6bk
	xwhH1ej4TZIz7/hOHrlhiPP6onEAjsmZmzKfiTS/TQ6Nw9kD8hKnFU/c7l7XPckR
	utSWuc1xNhV2dqBdQxNzfe5AVcH5hqtxYRi5PqlxDSL3ptpuHxeONh89ls2Vke1x
	Jii3imy9EML3n/u68ja328gnZDCWZRMTgdb4kGnNY6E/YJzWurvZr4cabBn4Q13W
	c3JFCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbfj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2632319eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907634; x=1794512434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
        b=WTmgMYxrOidHKG34Q/gFrM6G3y10sVBcoedMq4YlAinhCdj9mu5jcCTxNWgepyNh9y
         jUuoDSiO1L1AaZBsD3iSM5FlP+2qg9XJGrapARZqdAMlViVP6XiWvSRQKoP8Bydk32aR
         VRaKrX1TvgSPAaksAO6uEgq+FCyP9figJQZPG7DXNuvLPsL3w8G2Qal5nCnFFs7B6ZsE
         6Irhz+RZ4Fv2LSGAQexLk0Ql7+K5cikfwKnoMIVYwJ1XshJRZnCXqq0wm3smwBrEeQqu
         aC0t2w1agSPK8vevpsFFgEHMtp5qszfxHSXikIh/mffWknuW4QIM53xZHyldtP8W2Ovv
         OD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907634; x=1794512434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
        b=MQYDmfHnuWF4GKAeMzlI3tVufykf3r03RXCPrnU56G0kv75w2r3ZGJIwY/8wmIV/zt
         9Hc6BkDr2NdZyNf5iP5zarjYMdhhyIcziTd0bLn2HmD4sr4BOYawlnZocdoHgnQmXJZK
         Ss5Gb1F7ihR43Kke/WqcdKHpWvqKSRVTl+Y3elp+cjLRMwyKqUPYAxNiW7jmNTIcTb7Q
         jyrDaAE0L7/8BkFpLosXbkUn5k4eP7B9EAx/vB95E1tdmrH1PTpWAWK7IU56VAgtGSXm
         vdGu6XaWE3RRBp1UnvoIICk+Wze68U7MzAkaSU+D81AzJxS+yuWqed1bRDLb8OeNHXK+
         5tIQ==
X-Forwarded-Encrypted: i=1; AKwUvByoMBrffIcpW3v3FJgl+GhoIisd40pUXUG35nDFATGLFwdpvTxpRTllwFDTqqSs0t2ewXDPKCEy7wE72ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sn9zm1/VgHHqDKxJXiGcJJww/IOvDiJ11W83eoAvJUzQlnF9s
	gWQWT61xRwFlsXJ6oWZiADaZQyQSc7bCakxRog3dPNrMsWHD8jJzbJL+2PxSZuHJuPEtfRSERsq
	mSAFtHTOtYBajJ4sTIG5fY7ZS3GOJ/IHPSt8tCBUavWCOmofa/sjPuNCOCW/8ik1htw==
X-Gm-Gg: AYBFou28Fj1ScoNz0O+AFTbqHmrm5+30Ju28ORMVo+iTiEzI5mehgZ+HpCSRoON3BFx
	qZ298h7CGoN6gEeytO3JQYakTdLz6/j7sstEzZOPkKM1mVJvT5CkuvIGBl7oQMMqfziyuaY3MgZ
	nPXx7wFPSoHk1goLwsIEyVTtoYlUnfsRCs+8X9dOPbk8XiyhHPmgbtyTRrYnGuh+RGs4YZwK4Fn
	KP/Ci8cwtME/0gj9OJM2Cc3EvvtX37/FkgPzfOB7BxiW6Xu4niGucWiThGAZGEzF7YrMoAHlpRe
	vpsRVkqEobBWuaBG3XNWWtIGoJA83wq/RQXmlJh9yuUhdlsdz2OQZT7n9tDRaNlBpEW7ndV/iEA
	7BKyXQJWIolJc8wu5/Orj9TsFhCWVwRJn5oQcN0eTG2Gs9lRSbJksUAbdD3vqxvr2VSD7SoB0iu
	m2kQjvqtL33Jqn3r4IZO2hrc4gsDeeT3RS2gzNxy8O9O6SML+gMPoedkfW6sev2QJ2F59UPw==
X-Received: by 2002:a05:7300:dd05:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36f75b30488mr214196eec.27.1793907634210;
        Thu, 05 Nov 2026 11:40:34 -0800 (PST)
X-Received: by 2002:a05:7300:dd05:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36f75b30488mr214157eec.27.1793907633520;
        Thu, 05 Nov 2026 11:40:33 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:33 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:42 +0530
Subject: [PATCH wireless-next v3 07/21] wifi: ieee80211: define API to
 check if frame is class 3
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
Message-Id: <20261106-smd-v3-7-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecdbb5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=e1lpAkfDEvgZfVEreGkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: aZo0QZuxZMaXIAw-_lUBo_UyCu-k2v4G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX3x5IsQBYwtEB
 w6sNm+12RGV5BKzfkR6xYayeNlpME+WCRSOym+0NvmHaRhjU0tFE9DReB4MGiYQnx8A+1zbHVh1
 VgR4D4itGyCL0ebTrxbbjdVvLEcAMIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX3XbTHP2UVOZL
 APgMOyZ7zcTYBZ/6w4CJlfCEG+KdoFiL68I+OyRnWjHOI/Rcx7j6Kas24Prc0iey3rjR9lRd3yY
 h54ws+1EeRPf2p+sUPtphnTiGYOJ2FLv7UxEPDbBhSyTS8u0yZvpn/EMSe8vd8pVMh/4vDwyQrE
 pzppdpEdyGT4SIK6HEnXdhtwSFbGZ6O5ZPM73AKXa45Z5YwFJHEjBx6tejs8fFZZ0131CjsRwv0
 VQGdlTx8reUrWymvHs2J6JbtOxTbB6NHyJnbvE+vFGsd9CqPWkWjHtumemqHA9X29Q3M07HtGTT
 Dc3ir4LnZHWetLxyuFU/rFIjlOlLcoY77GEleMC9mZfWW0EBec3p1IdP95bFFG3wKDIQyLjt/A1
 4WqS5b1lCzvQBZa0V046m4KeM/6UxlKTbeLvjVo1k3+6G+1wmbMn3hKT9eYAbnLDBLsSwsnD4sD
 KQzs0rr7ELsTXVagEtw==
X-Proofpoint-ORIG-GUID: aZo0QZuxZMaXIAw-_lUBo_UyCu-k2v4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

IEEE Std 802.11-2024, subclause 11.3.3, classifies a list of frames as
class 3 and these frames are expected only if the STAs are at least
authenticated and associated. Define an API to check if a frame is class
3 according to these conditions. This can be used to filter frames in
both TX and RX. The API simply classifies the listed frames as class 3
and does not check if the STAs are in expected states.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index b2c90c4b262d..3754401f3435 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2940,4 +2940,47 @@ struct ieee80211_cip_cap {
 	u8 v;
 } __packed;
 
+/**
+ * ieee80211_is_class3 - check if this frame @skb is a class 3 frame
+ * @skb: frame to check
+ *
+ * This function checks the frame class simply based on the list defined in
+ * IEEE Std 802.11-2024, subclause 11.3.3. It does not verify whether the frame
+ * is unicast or related STA states.
+ *
+ * Return: %true if it is class3, %false otherwise
+ */
+static inline bool ieee80211_is_class3(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	__le16 fc = mgmt->frame_control;
+	u8 category;
+
+	/* Data frames */
+	if (ieee80211_is_data(fc))
+		return true;
+
+	/* Management frames */
+	if (ieee80211_is_action(fc)) {
+		if (ieee80211_has_protected(fc))
+			return true;
+
+		if (skb->len < IEEE80211_MIN_ACTION_SIZE(category))
+			return false;
+		category = mgmt->u.action.category;
+
+		if (category != WLAN_CATEGORY_PUBLIC &&
+		    category != WLAN_CATEGORY_SELF_PROTECTED &&
+		    category != WLAN_CATEGORY_UNPROT_DMG)
+			return true;
+	}
+
+	/* Control frames */
+	if (ieee80211_is_back(fc) || ieee80211_is_back_req(fc) ||
+	    ieee80211_is_pspoll(fc))
+		return true;
+
+	return false;
+}
+
 #endif /* LINUX_IEEE80211_H */

-- 
2.34.1

