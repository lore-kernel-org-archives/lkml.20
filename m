Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951984;
	b=zy0UC32pm30fS1684rsKf0psUlya5PAyKplcJR5D7aCWBQmRP1qEkJCMz0Uuk9Q5rmhF
	 /DIPCJxVHWqDjbhguyuf0u3/aMmt11Ipljr45vtdmngvvk1b37q37YNXz0GTbZQ81JJUy
	 BgoQFD+92wysadZHndf7y2/rW1ZNp+zL5hzy9pubttXkFNfeVXoOm9jLMyWSjpEAoYhlx
	 xiFg16kOwza+ydailnJCrsuz5m6LGHMDMJgYaWczkWoPENM5QLYoZkFmlIy76ujotTfnJ
	 2g4iEne/UTZBwWDZuHLvW8bHJ6o4p2/qhRbIDK75G4MeOgLNW3XqU9n3V32sELwUDOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
	b=y7KcDEAI6rvwwG185JtZJ1b07ajOHnvpgNws9jNwlSan44C01XQHbzTUwxM+7Gs350el
	 Klf6donvLwMpZ7E7VAYOpzIiALSIj65UVi5CmL2Z4znTkmm+3RIlmNQsiYc775pgbE1vu
	 p2e/XTFy8jwaop4f+BRFt4SbrlYXCpYYgHLbZ0Nsp+OUxi0eXMi0SORT9ElwADlWF9YxJ
	 nfOnui0ijl2jvNkrHtAiv2NaPCLnh15pQfKBbfMtvjFKNUNPuBw2l70ufvdIfHNgf2DzN
	 2BWJfBoz3PK6VTMtvqseraZBWInBqSsUd3ooBIoaahSRDrX4GBNSrP71tp/6YAQgsGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8rwDRIK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKdoao2m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403A606D838
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3403A606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8rwDRIK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKdoao2m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RR2M2194420
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=; b=d8rwDRIKQtogKg+N
	6mTzDmu4vpuTXbcUxKwUmRp4/lGB0x6sLLk/tFvMdbvHH+JTJOlaxnnCPqgt3N9b
	EH7PyYyIherK+oUgKhiQSIknMu3iJju9E/y8h1ElhoqwDpSd6YD3OoTwMEfudt1g
	aUmCWes1yFLHIWhvWMdy2Xtt+DfLJdGFxdLdKjujqFeYRCaXV8WiueB7UtRAz6x9
	WbPa12ZEeWTy34oDqD8JKT1lzEqDjexvWMiMOuyicvLkCvKyWCX3Oy6z51+Pba47
	5aDzVfjq6pFXbfTwjeiE+DuEZFr5MDT/QaLOhC9ke87tF2oxnKL1Qz4vtZhEqp5b
	RP0AsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa9q6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so381846a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951982; x=1794556782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
        b=NKdoao2mF/ApdylFvDff16tVS3DNBPlUvYPVSGgj2LSpSoZrPWi2hk6l37t9jwFgNs
         d7XENG7z1/64CNcQGWoEDT8kBjyrzAorUeJ5D90iJ/JzUCyDu4T4atGcxHiRIVLfBJ3v
         euh7H0QmFJ594E6pvQOW0i87hzKZQnM35fXTLEdgMtoSKwEyFOlERzEFQoFAGrsyK5JD
         leFeETQ2Mq22SuQXxtZB4e2jQ4YFS5i0EYQmki0XxQzunyX0/XTzNBAIXvwHLDMDpm/A
         3k0eg/stw2XqHUdMOI7uBBSp4VqjmIRxaPEa7vq6zsHLA4gByKSQaHNAxMi4+YG9WIjL
         8OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951982; x=1794556782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CaoxN6zt5X6m83tcmfk7NC3MrRn/dsQA8uQ6GrxsYo=;
        b=qqSQ/eqbZbJ8g505Bq73aWizwa+EGFdEjKS5oKB1JDYtpNCgww50+jqdox3AuCsSHB
         AbRo+8Xk6LGYJwsw7joCnYGMJKMbXTztRAvZZ/XJQOYf5fIu3BQesYBR/okPkVVvXHw0
         Eq6bCfzhtJ9fOTPtUaD1tPprmvCDYjwVPr74674QIh82vXq0ZMF4sFYW+VzgiPqcvkNG
         gE8gwXVa84V+yGGgwEZB0tuZ/1za4+RqZuS9w1WfHndWnIBtkRPeg6rByNC7xQkDtM+Y
         VwRCbNcFWujnJgHbjV8ecM2Cu3tmdrPM8dWISrzBLCPz9i97Q1VPnXmsxJexasEPRl7j
         hI8Q==
X-Forwarded-Encrypted: i=1; AL+hErED2eiir71Z5u95RoYOitwWjM9S6lQel2QF8NoasnXcVSiUuo3DlPeoqVM7CrDmV4WzkHQ0x3SVTkEARzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9miKoMsc6OV6VWPRNQZP0gJKz82kA1B29c19HZxsSUUD8AYv1i
	dkXbUExjKg/8+rdCA4eIfJ81b7bnU5hYQPaXFVHx0Z87lp3WT1RG1P/01qF0g6He46tpPBRbJ0I
	lcxPqQRnw4yAj6ADmnqo9j9mBqyTENjB4V28SlxicVSk32WaH94FjFMMu0JI73i+R4w==
X-Gm-Gg: AYBFou0BV5dHz6Qt3PI22C00htLv6PBH9TopKyPHq5XGJYdd7+90sRQLsWXauuMUrEW
	1Lcogmm5QOCztbDlm/i6IdRhixu9jadXxYOS8CSlLHBhYmRP8G1TSiHQkiccNelcJ15hhDLQNmS
	67wpnMwfA2RDn/ljM3Uj69A8OGQobdebPFei7lXl/xsUYz02n5KXow8dAOVSjEasCq27WwU2ICE
	MS7bzN5KBMm/PF/yGt0azqGWNJKiJaSDHF0gGHvY8hTaDjpeiogu63x/T7RvWArL5YeL9A6m1kO
	Dt3hwQBIyEeWQQR0AgeXWxX/Laa7+Kb1wJSnamDljs20PBK6Ni8W7lwEsDSErCjht2INaPF9VsD
	vjDVnhDhpWMy3C8IKx0O/RZXKHUbMT0Kda83+DWLN3Pd6wyBeVkQKZ6OcomgutD5WrdIcmLGbd1
	FI2glXWI0zmDxKwl5xiRStYNemtgWYTjNB2SyjuMbfb8/0ANjoDCi3wJRA5pdAHY9eF4vkprM=
X-Received: by 2002:a17:90b:390d:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b0db6e4762mr1346190a91.24.1793951981975;
        Thu, 05 Nov 2026 23:59:41 -0800 (PST)
X-Received: by 2002:a17:90b:390d:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b0db6e4762mr1346181a91.24.1793951981396;
        Thu, 05 Nov 2026 23:59:41 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:41 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:44 +0530
Subject: [PATCH wireless-next v4 07/21] wifi: ieee80211: define API to
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
Message-Id: <20261106-smd-v4-7-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: AfroZHJnYd8uLvGRNltkfyUlQPn6hFTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXwyBBLca7RsnZ
 4CVb3Mpwpy2T9o+xhbdVqDbAF7NP+EDu2M/3vUc7iycfJ8D9X8hS4GvZIfovqAv7qIezkvTy7DY
 BdRLI1HyjJZPTyKJsXwoF4nr2WRxaVeBUmPan1qXkR1uWhRDM8r6efhM3fL/O5pNFxEaviqGUxv
 feRebm+LemZZAMpxYH0+zsYQSKxzKz1L/n6seTwXL2TRWkqnHGqH0h61JvkSlXtgUn8d+6EFdOy
 bfbhRvmrjIzDYNiRh3SVImg5QmM1Z9KIuNvZKEmF64uzS5PU8x9JqYNaz5+FMUw0crwZsXkWir4
 OrbtdJrLACfImqH4CLYPMZtON3792PMW/QxLm3sYUqj6JrWAUjzR7OOxY+WVttyjUmkV/Db96AS
 Z8zUPp6xdau2vX6g6gMaIeUDAJ8F67J3aWcPmbtAOXF3Lb9S1AH6WVlF8pKPH1/mK9d2QDOuZxM
 NN2XRQWMSG4q+RH8oJA==
X-Proofpoint-ORIG-GUID: AfroZHJnYd8uLvGRNltkfyUlQPn6hFTw
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed88ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=e1lpAkfDEvgZfVEreGkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0gVGBE04WjN1
 oVicD53WM74CMLOtRO0EWoBpEYQzTPZpGMFa3bMA1TyPPIsWAbohe7vKYh54ZgEgyQ3IKP6aPRn
 L++TNhyJloZrRYC/7vQH5BLTtNGaBUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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

