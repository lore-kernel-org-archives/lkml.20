Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951981;
	b=1k1jY0i5q/ugHiICS9Dfg3uK2RAsq3O4K0jCHrG4EZcG7EquvJfg8JVbwwoIMHtSN63U
	 8xXzRJS/hp6MDEFhyUYjPz4YcieeKXzViGIh5TrywoFU5YbVqupQz26Q7MAewCI/cbGHD
	 wCmLbeN24pW9ZLc9NY52EiYvqDc0ZLqOB+N/1T6lfytQnPrul8FqtsMeZf2yTYPlPVvOq
	 B3HKqfvtadRqAl9WWSxJmNdVwcTekFv7FDnIfrF4dgzkhtfe0ibMepP2L6W8ra3sgfgvH
	 VJQqcwxFDxI5xzSOy2fcCkSV03lQc32SX92huLQjXEpbQL2sYgHLUbKBil/mrQMeYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
	b=hRgrGak7tP6OwBWtD5HW93i0YM6cMY1VbUfXpHkTpHN2fLdzjDF2ARcvI58L5CQh2EaO
	 nBRjFXTaxxpi4WsHy7czXysQgLhGbGtYMN0f/fP8LuRSxJvGdErieQQYFj6/8JtFRLaop
	 sWQcFR0sGe/OmxXHmTA6dZ648N/NDYpybd2Fzj6WT2hQiEzHiAnbabkd678lNAgd3lt5C
	 2D57iL3qr1qZq69Fou6q+UOk9gZglkxz/d8Hk3XKAxJ40Of9OUEZA/6GT6v03h0/jPi9m
	 YyPOtJu0J+ztAQDvCK9wviCStfwN2ccPJdZ9zMsBqIZcSXSem8mpycGQ8Isk4HoNEWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OEDmOBGu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYS6RtQT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3C606D82B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC3C606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OEDmOBGu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYS6RtQT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RCT8045324
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=; b=OEDmOBGuFc/Xshy9
	S/9qdLvWfpS8MDRvIEhvvEE0sNLHHBZ2aWq61QpnDFc3OHf1JvV22+KIdmZlf2i/
	kEhenzzO6vOxA5RMP8skkJqOck8u1UoEoo14MGr/jQTgcq9NzrpG6m13zCrFv3zd
	IpIeNzj3Vyn84HBnxGU5FmSDJ58rbBJlOjkH15HP74RoTY8U5/ImJ2twQMeODRSB
	jShimVQCxO0B7zrnYM3vr0gA8YiMwQWCYUox4WlXP1Jz5bITYdF1oJ00E8abGRuy
	kz1kOS0k4Ld2qzYGLix9shoit+FVs0WgeauqvKvQpPvaSOWH/BWh9sjASvGVSeaq
	3v+YZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9srqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so438554a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951979; x=1794556779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
        b=BYS6RtQT67E4f8nelv4CI5EuVMf25SmVMeM1oKaGOXskiq47i9+Urd6jOi2nNgxGcl
         wSqAn5R7qasaQSLJp1grE9F3AU7XfT79q4G7ZT+uJs26VLLsbfgBC7Xdl4RSgWytX0Jz
         e7DbWrXDN+5u8ci3ajU6GJcksN8YC/s9DX4lH+/tNt1idBWjLPr5KvTwTkWUgHTcts78
         NUsExb5dX+JNJ3Yspqi9h3obpP9NoodR9HBAMy9d+9o64cbFexWwNdubgGhcPMqVr9jO
         kdW24sKY/+25547RUnK+sdggYugnhWamwFpXY4H231cKWAcwAQ7alXqaPj68eOl0tULr
         5mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951979; x=1794556779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOy3jglmQsb7BW/pRy/lGAKuPlj6QMj+Cu4GsxBWH2o=;
        b=SfOz0ojjqGq0zJwhg9Cs4x2dVyJQG4JhTw7FPh5V+kr2HBnqTSFmJ7YMrKuc6A54q4
         jT5l5u0+y+UaumykY/FV43WW/QynuBzny+VN92tLC9GPosX+jLhPHpCVUS6wCX23lsMP
         NOwx0phGogdJ339+1xfEnVmlm3QKCPdXcXHoG2lJG9/3BxsL8iavOOe736YkcwH88Kjc
         +xi5zn8vw4X/nqdGMHDDYt5+BZCw4x6rih2ePG/+FqFGk9sVB/shiC5hzDsHli19vrky
         Ta/AnFXoxuFcPZ6br8q1TMXl3M+iP3gmREOk1igV9NYtH2jpxtD4wTcdS7VYNQoQ2MUN
         jtbg==
X-Forwarded-Encrypted: i=1; AL+hErHHxN32ud6Fi12l6nAXDU+HOSwcx/lMxOedv+/iWCKdUcOp8YQsIaaljc2/+RuG0rHsdKev1v77F/T5zRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rh4GYlsbGbjCrY/y8UrlxejXss/+IaHbEdhYv7vhP5ac1q22o
	9JQ4fTqW9goIGjmCxnyMJgLpH3irgD5Pw5anB0JpZiRsC6FL6K4Fy0yDiNOqvG/77Dof+mjFBkx
	U2oqcCTP3RWkqOXFFY1AuaXdDd+riycUNI1rmTKDuObEIrzt8kbRMi24hHGcpEEWqtQ==
X-Gm-Gg: AYBFou2CDUYuzE8nLiWMbDN6Ns6LgmrMGE/+oQN7olVoOwmIqGJ+hicvRge1Aq9seHp
	AnAw4thpbygzBFdhKsNKlZStshDJ4xBO/uSdpBVgP5PQyRUj2sqG/fRz8yI9Qwv8S+0WR3Qy0z4
	g/v0EUxkyAWBuL47OQhnbgl+BG9NuopKYm2GgGa1EoXolcWCHqNSiY0J364AXGSCXZD0Z/mU/64
	V+WASXMfdX7PigG1dkeYvh5EJ5rOLmKjYdlp6S/kbYNYTwFTkg3JQVNwDJjMaAHdEafeNtwKaz5
	XDdv7BiEODYkVuRHHeL9bzasdo2F2MARvMeq+3B6Xy5qDvfw6LYb2y8ECvj76tetmRy7Dt6X7US
	pJNhae4K3eHiNfMEH4ZPAg037WxCi1l9s+ANO6kRNlb4IE1VWvfwkI3HQQjVIvBFzBHS6yXAdDx
	5j42WfidvoDVdAeFRd1hEnAiFwZcmokhIdtYRYIlWcWNlcFfU6sLscDTFLhtjwB1VbmMi8RSI=
X-Received: by 2002:a17:90b:5587:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3b0db6d7b20mr1572061a91.12.1793951979523;
        Thu, 05 Nov 2026 23:59:39 -0800 (PST)
X-Received: by 2002:a17:90b:5587:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3b0db6d7b20mr1572047a91.12.1793951979074;
        Thu, 05 Nov 2026 23:59:39 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:38 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:43 +0530
Subject: [PATCH wireless-next v4 06/21] wifi: ieee80211: define APIs for
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
Message-Id: <20261106-smd-v4-6-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX5wG9TgX5A89p
 hrBl2HLpSwfH0JsY4bEyVdVJErB/GCEh+2WbSAAbrKX93EWdcRQ/tmMLBb/gOsOIpySRG775bTV
 eI5N1vpW0gE+Wn0EE1kbnc4Kk+K2m2c=
X-Proofpoint-GUID: drqh9dHylIaXyOhM3Bcu4sLRbmBFbH0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0A4NJbWkViqm
 Z4Tu7q0sLTRL2S+kvO9yzAT0w3hqzBaQibqvLVXuzEljKFarWCkkbg1l4kFRXzU03ZMQDZufWKj
 Kz7UfIlmM5EMtexKLu2D/eZ4lVHU5WfkeNOwjTErJKaTr6UeEyyzKFzsYDYcI2UJfyidTNZ55Yo
 CLEH9nZRMBDMXxQi/whdSzNubHrA3yKaYM3QJJwRYSHCLVmp3rBOQs8HPPQ0b/Z1pU4dswS530r
 F7QOFeKSjJ8Ncn5VEibS8VQRCKNNoegL2iQ8ftvArKzF13Y1ePjdKlNEE+CkcdGgCZWlLBP5xbA
 p5Ez1ne7DpXwLkK0ovS0UiDqSR5gTAzV21F9SB9SeJy83uuPCreNpyaVklERWgYQ156X9p+Qxij
 S9LpsR1iirGvjoZLdfZE5YIRuzitTgzKNl1VCwazV0/RxNznSlGTKBjEEKTtpQE4q1ni+O5q7UJ
 zMTIRsfkw8C48ZsswSw==
X-Proofpoint-ORIG-GUID: drqh9dHylIaXyOhM3Bcu4sLRbmBFbH0K
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed88ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oDYSrMgdSjg_aXkkWaUA:9 a=bFRUnEHUPHmmGGYb:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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

