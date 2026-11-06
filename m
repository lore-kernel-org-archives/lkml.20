Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951980;
	b=bdw4acDWlVHC/5CW8PZnQ2JVujED6Cfxc3D0woZgLNVcWQLU2E4C1+zAZ3K712LMjvzr
	 eRkJOBuhA4QSRTwzaIufjhDlIgc6qB1Pmb1fij6HjV03+OxjVCumfRGQCyv5bdfM4Go3d
	 xpLacvXdlPWX7g/v/lFw6kXAk77bU54afkcMFekidTS56fXRGxOmKjXkv4IlDJD+hizSv
	 L6MYACEevn303NZke95yCdc2UV41E39Do08fgTmmSLeAykQYARF9B6zKSmFaZ8A6qp6Lc
	 E9zjSklkDDqB4si7bLYxmz54vRPA9ZAv5fapwZqQseK//QV4ckHsYFkD7u5U6GtThZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
	b=3jITm/I7Tecnsxf1CwL2js/KWPGCLtFQ2tAIc4iPixeaVc5ZIYWN9/mfXg5xLIolX9qt
	 uIOW0XVJjjpjZ4ZVaiAyZj51RCKg6l/pw3kvOSt/aNYvZjh6c48Fum30TwetuFadT99Dc
	 wMqI0Jz1qilH9BmGvoqz7m+ExKL3+FYNj1sqyz9Fzmkm3Yc2bajgZfmfCyqoF/Zugdy7h
	 TK7kfkQuOuvyCHl1zgLtO+VWF1U1yGALjwoKixTxWe7EqV5N4F1sy57BxjTHIEBViQTmC
	 /KYfVST4y0VSm7Me6FsKe9Hiim4Haf8XC28NNloDtvYYcEYOzFo1lOe6j1ey+XvIVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLvqAqiu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kh8sITx4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18512606D829
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18512606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLvqAqiu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kh8sITx4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RCVR045321
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=; b=FLvqAqiuNtzOEt5Y
	eDCdwoeoEL8ttjQdTMHqi7CJT1fyT6mO0IhmA/CXl42LL84yNSqkOy76rdAOM9hO
	e5ERbR60JY54CZQ/KinvGA6XuqSU1Z1W0J8QEXYQ4X2INuw2abcSE+ODrthdmZEI
	MMDj7Z/f/VBhDInWjIPWHbwp0ZiehshWXFWdLSO61LdanQJN9RgWuYXG91P3/7Fp
	OojdJ3GSlju8F0UyPL75tDr2OKa7anRw0/p0B7uOTUow5non/VRw5HJlSSq+X3sI
	jcgUamZ+GQ3r0xPliP48E4bzLGPfakVqzZ4or3ZkyX9LbTTYcQD/uwaDXFFy6jfc
	ApP0ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9srqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so722528a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951977; x=1794556777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
        b=kh8sITx4YLjoLZgeS1bXAqIY9dOs4yPA9W0dud8j8sIGCqu4kclfwKk4ou9QxYo9ry
         VNuh62Glz+EsiTRa+O13yAjuSqerzgIQRegB6cAzsGLcqtB2Vl/OfdxFHbhhwfUGSyDD
         PlFh61UUXvpcxg1wpEN2OnYRMZUvuRElu8Oo1qqgsyp9RErzMe3o1h0v3DmwdQtxBY2O
         tH/Noq5+YMHo/dwJdB89jPSNLGiO3FiXsPoNj6n/9SmNoLv1H2gyB3s0QsrYVjkAAOE7
         uJnRt9kiQ/OGueRzEenpYtl0AczcNBDsJKIKG8PSHWLGpEdyxUITuoxl/kNnWd5ytAXB
         QKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951977; x=1794556777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
        b=ykf4yjwEoO03EAUUUPZr/NdhltadBtNcVU3xh4TLuKdnet5pqj/SGqtrlk8j9/9l+f
         yXgRq0AJLZ2659drpAqTlCATIexxgdPjAWRZ5rYGYC421uh4FAgt6j6MSRoD1MmASAxJ
         L9tLv/JSVfOaFainJG5Lz2zaL6k1dD9e7vSJ9x8uuFIF2qBOmw/ER6DhHvM7MyB8ST4a
         C/nLwxWuC74rcFOOe01yW5bVTG14WVPAin8PE96Y2SIACRifx4qQgNyLmsljMBc5Ub8D
         c54cgOniiAt6vVCvkwckXUdFvWlyRS4cg25rzwzdjxZu4mUkVsnnfvNHk6MS+fBIXD9+
         IOWg==
X-Forwarded-Encrypted: i=1; AL+hErEfjiZdw/ejBR5+IL5r4FDCXx7JW/AbKVMW0eJLZvfBj+GCBzNnfgX2EsFBG6/jKySHDKA6NHHvXzNXo9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JP5vr4J/k9C7mrxsUoIiKkhbFY0yUHKkMUIV2vdF3tI0K3PEO
	tXPXcWjYO4A7aaheKo1BoqgLmMvCaGohJliGrX5q2ITLSk04MqjEqxGgPIJfHKS8Xs7U7xqCWF6
	0d+D0kdDVy7YRqzMCJMvsmx/aBrYGduegaMUxYFe7Ksg9DhChr+re8C5/69UmJQkw4A==
X-Gm-Gg: AYBFou1cTkuB9ZcDx7pwEYdaoQWm9QzUaBimNYLZjOX4DKEAI7OlmNlqc/DamcTICft
	JNfbHtXQrLgalTq5y7ZIujcztL/eNth7gRXXnvBLHkLYkgsIcNvYYiRNfREmjW5K0iCxz8MHS+1
	SE0inhS8wsKR6mjo6zI9zhdQ2EHs54McJ9m6K5BCn/D0WBxyGaP4c5RstH+gSBEvUhpnhkTVAZV
	U78s/smVS0ovqjm5t38pG8DBq+7FkBv+8YSpQhY3/l84IUzfSFIlGBxDzykNj+BW8qsm7sBd4Kl
	a1qWS5pHDv/zT0E+cGDe+QDp+17zcX4uTlFO1TnWfu6HTpx3l3yABJBJU5lrMlK5IsPtcvbQHFm
	Eu085fnG7zKfxIjbzD62IAFUaXBw2L+Y9f6T5dJLtdRUbmVFnPMVnLTPk0dYKbGpmcaF/jsgJsI
	P7//SYiBmSdXfEomobE5TCDl0zYVP9RNBmyGu0cYLGWZDy20F//3Kmtp4luF9hVI2myBo6eso=
X-Received: by 2002:a17:90b:48d2:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b0db705314mr1562213a91.50.1793951977314;
        Thu, 05 Nov 2026 23:59:37 -0800 (PST)
X-Received: by 2002:a17:90b:48d2:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b0db705314mr1562189a91.50.1793951976722;
        Thu, 05 Nov 2026 23:59:36 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:36 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:42 +0530
Subject: [PATCH wireless-next v4 05/21] wifi: nl80211: define interfaces
 for SMD BSS Transition context transfer
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
Message-Id: <20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX7gD3mBUuAdzp
 mpGYck5vRSUzsdtJxntivl+igKYKFT2oVkosr5EeUAC9ktXEj5sZn5WuMyZeKRQLGfam1B7Tnqu
 P6D7wAkp2ly41TMZagcffMFUrQR7L1w=
X-Proofpoint-GUID: _EAMbpmxgPDgZlaUzw7KsFgRFjpLPefQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX+isTOyArGpEL
 uHDJk2Ag6+N73JqdMD+HiYNIMKGQnAXILhNmsWFGhzHzsbYtLu6IKcSsIoos135/LVgFs2FgAD5
 wC4P55+hWW2DG77X/5I9c5ZaojEybfbYTob2M11L/F8VZJ0ORzU0S4i4ZR+C/DRcRGVqMsz7kiB
 CSrPMzmP8RObb+cUICRKNLLwHc26hguLb4chLIhmUgSEZFeXCEhq6bHmbE/JpccpHE2CJdd5cHh
 PW8VbBh4rVZi0WiI6r/EAbZwVvpoPubgYgZM9KBsdJTwFaF/eODdP7xM/JRR6hsz/vLsOY7Qm6G
 q3LWfN6Vlp8w9n9zBZAK4IeQmpci36CfVwUsbVafmoQxwvHeDbJq+waTFPViYPXNLQ2DyjC0N3E
 +2AWwDKBX4EjzuWxLoIeCKSa3/IYNlvAAP0B/GYEO6PUgctKQdIpADUd7rdM76PW1eeXS7Kh70o
 0yJRq96dAeapBouxpRw==
X-Proofpoint-ORIG-GUID: _EAMbpmxgPDgZlaUzw7KsFgRFjpLPefQ
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed88ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=A4pAW7IlmD6AYZ-BFbAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

Define nl80211 attributes and policies required to pack SMD BSS Transition
context along with NL80211_CMD_FRAME to be sent to userspace, and to set
and get the context during roaming via current AP MLD and roaming via
target AP MLD. Without these, userspace will not be able to transport the
context to the target AP MLD, program the context on the target AP MLD TX
and RX queues, nor fetch the context on behalf of the target AP MLD if
the ST Execution frame is sent directly to the target.

Suggested-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 190 +++++++++++++++++++++++++++++++++++++++++++
 net/wireless/nl80211.c       |  48 +++++++++++
 2 files changed, 238 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 81c16ea2fd34..fbc23aca006e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -375,6 +375,19 @@
  *	on the target AP MLD while creating the station entry.
  *	%NL80211_STA_FLAG_SMD_{EXEC_CURRENT,DL_DRAIN}, on the other hand, can be
  *	set using %NL80211_CMD_SET_STATION on the current AP MLD.
+ *
+ * Drivers can use %NL80211_ATTR_SMD_CTX to pack the dynamic context of the
+ * non-AP MLD along with the ST Preparation or ST Execution Request frames in
+ * the %NL80211_CMD_FRAME event.
+ *
+ * On the target AP MLD, this collected context, received in the
+ * userspace-managed backhaul between the AP MLDs, can be programmed using
+ * %NL80211_CMD_SET_SMD_CTX.
+ *
+ * In case the non-AP MLD executes directly with the target AP MLD, the current
+ * AP MLD can request the context from the driver on the target's behalf using
+ * %NL80211_CMD_GET_SMD_CTX and the response can be reported back using
+ * %NL80211_CMD_SMD_CTX_EVENT.
  */
 
 /**
@@ -1502,6 +1515,21 @@
  *	and multiple can be nested in %NL80211_ATTR_MLO_LINKS but then the
  *	update isn't atomic if any failures happen.
  *	Only supported with %NL80211_EXT_FEATURE_UPDATE_BEACON.
+ *
+ * @NL80211_CMD_SET_SMD_CTX: Set the SMD BSS Transition dynamic context for a
+ *	non-AP MLD sent from the current AP MLD on the target AP MLD managed by
+ *	an SMD-ME. This command carries %NL80211_ATTR_MLD_ADDR,
+ *	%NL80211_ATTR_SMD_CTX_TYPE and %NL80211_ATTR_SMD_CTX. The station must
+ *	be present on the target AP MLD in the "prepared" state with a default
+ *	key installed.
+ * @NL80211_CMD_GET_SMD_CTX: Get the SMD BSS Transition dynamic context for a
+ *	non-AP MLD associated to an AP MLD managed by an SMD-ME. This command
+ *	carries %NL80211_ATTR_MLD_ADDR and %NL80211_ATTR_SMD_CTX_TYPE.
+ * @NL80211_CMD_SMD_CTX_EVENT: Event reporting the collected SMD context
+ *	(requested via %NL80211_CMD_GET_SMD_CTX) to userspace. It carries
+ *	%NL80211_ATTR_MLD_ADDR, %NL80211_ATTR_SMD_CTX_TYPE, and
+ *	%NL80211_ATTR_SMD_CTX.
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1784,6 +1812,10 @@ enum nl80211_commands {
 
 	NL80211_CMD_UPDATE_BEACON,
 
+	NL80211_CMD_SET_SMD_CTX,
+	NL80211_CMD_GET_SMD_CTX,
+	NL80211_CMD_SMD_CTX_EVENT,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -3282,6 +3314,13 @@ enum nl80211_commands {
  * @NL80211_ATTR_SMD_ROAM_STA: Flag attribute to indicate that the station is
  *	created as part of SMD BSS Transition and not by typical association.
  *
+ * @NL80211_ATTR_SMD_CTX: Nested attribute associated with UHR SMD BSS
+ *	Transition data. Used with %NL80211_CMD_FRAME, %NL80211_CMD_SET_SMD_CTX,
+ *	and %NL80211_CMD_SMD_CTX_EVENT. See &enum nl80211_smd_ctx.
+ * @NL80211_ATTR_SMD_CTX_TYPE: u8 attribute specifying the type of SMD context.
+ *	Used along with %NL80211_CMD_FRAME, %NL80211_CMD_SET_SMD_CTX,
+ *	%NL80211_CMD_GET_SMD_CTX, and %NL80211_CMD_SMD_CTX_EVENT.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3892,6 +3931,9 @@ enum nl80211_attrs {
 	NL80211_ATTR_SMD_SUPPORT,
 	NL80211_ATTR_SMD_ROAM_STA,
 
+	NL80211_ATTR_SMD_CTX,
+	NL80211_ATTR_SMD_CTX_TYPE,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -9253,4 +9295,152 @@ enum nl80211_nan_peer_map_attrs {
 
 #define NL80211_NAN_SCHED_NOT_AVAIL_SLOT 0xff
 
+/**
+ * enum nl80211_smd_ctx_type - SMD Request Type values
+ *
+ * Used with %NL80211_ATTR_SMD_CTX_TYPE.
+ *
+ * @NL80211_SMD_CTX_TYPE_PREP: SMD BSS Transition (ST) Preparation.
+ * @NL80211_SMD_CTX_TYPE_EXEC: ST Execution.
+ * @NUM_SMD_CTX_TYPES: internal.
+ * @NL80211_SMD_CTX_TYPE_MAX: Max type of ST context.
+ */
+enum nl80211_smd_ctx_type {
+	NL80211_SMD_CTX_TYPE_PREP,
+	NL80211_SMD_CTX_TYPE_EXEC,
+
+	NUM_SMD_CTX_TYPES,
+	NL80211_SMD_CTX_TYPE_MAX = NUM_SMD_CTX_TYPES - 1,
+};
+
+/**
+ * enum nl80211_smd_ctx_ba_param - SMD Block Ack Context attributes
+ *
+ * @__NL80211_SMD_CTX_BA_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE: Required (u16) BA buffer size.
+ * @NL80211_SMD_CTX_BA_ATTR_POLICY: Required (u8) BA policy.
+ * @NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT: Flag attribute to indicate
+ *	AMSDU support.
+ * @NL80211_SMD_CTX_BA_ATTR_TIMEOUT: Required (u16) Block Ack timeout.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG: Flag attribute to indicate
+ *	fragmentation support.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL: Required (u8) HE fragmentation
+ *	level.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE: Required (u16) extended buffer size.
+ * @NL80211_SMD_CTX_BA_ATTR_WINSTARTO: Required (u16) Starting Sequence Number
+ *	of the BA window.
+ *	Applicable only with %NL80211_SMD_CTX_DL_ATTR_BA_PARAMS.
+ * @__NL80211_SMD_CTX_BA_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_BA_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_DL_ATTR_BA_PARAMS and
+ * %NL80211_SMD_CTX_UL_ATTR_BA_PARAMS.
+ */
+enum nl80211_smd_ctx_ba_param {
+	__NL80211_SMD_CTX_BA_ATTR_INVALID,
+	NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE,
+	NL80211_SMD_CTX_BA_ATTR_POLICY,
+	NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT,
+	NL80211_SMD_CTX_BA_ATTR_TIMEOUT,
+	NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG,
+	NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL,
+	NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE,
+	NL80211_SMD_CTX_BA_ATTR_WINSTARTO,
+
+	__NL80211_SMD_CTX_BA_ATTR_LAST,
+	NL80211_SMD_CTX_BA_ATTR_MAX = __NL80211_SMD_CTX_BA_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx_dl - SMD Dynamic Context - DL direction
+ *
+ * @__NL80211_SMD_CTX_DL_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
+ * @NL80211_SMD_CTX_DL_ATTR_SN: Optional (nested) next SN (u16) per TID to
+ *	be assigned to DL individually addressed frames.
+ * @NL80211_SMD_CTX_DL_ATTR_PN: Optional (binary) starting PN (max 16 bytes) for
+ *	DL individually addressed frames.
+ * @NL80211_SMD_CTX_DL_ATTR_BA_PARAMS: Optional (nested) Block Ack parameters,
+ *	nested array of TIDs (uses &enum nl80211_smd_ctx_ba_param).
+ * @NL80211_SMD_CTX_DL_ATTR_MGMT_SN: Optional (u16) next SN to be assigned for
+ *	DL individually addressed management frames.
+ * @NL80211_SMD_CTX_DL_ATTR_MGMT_PN: Optional (binary) starting PN
+ *	(max 16 bytes) for DL individually addressed management frames.
+ * @__NL80211_SMD_CTX_DL_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_DL_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_ATTR_DL.
+ */
+enum nl80211_smd_ctx_dl {
+	__NL80211_SMD_CTX_DL_ATTR_INVALID,
+	NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP,
+	NL80211_SMD_CTX_DL_ATTR_SN,
+	NL80211_SMD_CTX_DL_ATTR_PN,
+	NL80211_SMD_CTX_DL_ATTR_BA_PARAMS,
+	NL80211_SMD_CTX_DL_ATTR_MGMT_SN,
+	NL80211_SMD_CTX_DL_ATTR_MGMT_PN,
+
+	__NL80211_SMD_CTX_DL_ATTR_LAST,
+	NL80211_SMD_CTX_DL_ATTR_MAX = __NL80211_SMD_CTX_DL_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx_ul - SMD Dynamic Context - UL direction
+ *
+ * @__NL80211_SMD_CTX_UL_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
+ * @NL80211_SMD_CTX_UL_ATTR_SN: Optional (nested) last SN received per TID
+ *	for UL individually addressed frames.
+ * @NL80211_SMD_CTX_UL_ATTR_PN: Optional (nested) last PN received per TID
+ *	for UL individually addressed frames.
+ * @NL80211_SMD_CTX_UL_ATTR_BA_PARAMS: Optional (nested) Block Ack parameters
+ *	(uses &enum nl80211_smd_ctx_ba_param).
+ * @NL80211_SMD_CTX_UL_ATTR_MGMT_SN: Optional (u16) last SN received for
+ *	UL individually addressed management frames.
+ * @NL80211_SMD_CTX_UL_ATTR_MGMT_PN: Optional (binary, max 16 bytes) last PN
+ *	received for UL individually addressed management frames.
+ * @__NL80211_SMD_CTX_UL_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_UL_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_ATTR_UL.
+ */
+enum nl80211_smd_ctx_ul {
+	__NL80211_SMD_CTX_UL_ATTR_INVALID,
+	NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP,
+	NL80211_SMD_CTX_UL_ATTR_SN,
+	NL80211_SMD_CTX_UL_ATTR_PN,
+	NL80211_SMD_CTX_UL_ATTR_BA_PARAMS,
+	NL80211_SMD_CTX_UL_ATTR_MGMT_SN,
+	NL80211_SMD_CTX_UL_ATTR_MGMT_PN,
+
+	__NL80211_SMD_CTX_UL_ATTR_LAST,
+	NL80211_SMD_CTX_UL_ATTR_MAX = __NL80211_SMD_CTX_UL_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx - SMD Context information
+ *
+ * Top-level container for SMD BSS Transition dynamic context.  Carried in
+ * %NL80211_ATTR_SMD_CTX with %NL80211_CMD_SET_SMD_CTX (target AP MLD) or
+ * with %NL80211_CMD_FRAME (current AP MLD reporting context to userspace)
+ * and %NL80211_CMD_SMD_CTX_EVENT (current AP MLD reporting the requested
+ * context on behalf of the target AP MLD).
+ *
+ * @__NL80211_SMD_CTX_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_ATTR_DL: Optional (nested) DL parameters.
+ *	See &enum nl80211_smd_ctx_dl.
+ * @NL80211_SMD_CTX_ATTR_UL: Optional (nested) UL parameters.
+ *	See &enum nl80211_smd_ctx_ul.
+ * @__NL80211_SMD_CTX_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_ATTR_MAX: Max attribute.
+ */
+enum nl80211_smd_ctx {
+	__NL80211_SMD_CTX_ATTR_INVALID,
+	NL80211_SMD_CTX_ATTR_DL,
+	NL80211_SMD_CTX_ATTR_UL,
+
+	__NL80211_SMD_CTX_ATTR_LAST,
+	NL80211_SMD_CTX_ATTR_MAX = __NL80211_SMD_CTX_ATTR_LAST - 1
+};
+
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5df145ab4ab1..d2cd03d8b0c5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -789,6 +789,51 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
 };
 
+static const struct nla_policy
+nl80211_smd_ctx_ba_policy[NL80211_SMD_CTX_BA_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_POLICY] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT] = { .type = NLA_FLAG },
+	[NL80211_SMD_CTX_BA_ATTR_TIMEOUT] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG] = { .type = NLA_FLAG },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_WINSTARTO] = { .type = NLA_U16 },
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_dl_policy[NL80211_SMD_CTX_DL_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_DL_ATTR_SN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_DL_ATTR_PN] = { .type = NLA_BINARY,
+					 .len = IEEE80211_SMD_CTX_MAX_PN_LEN },
+	[NL80211_SMD_CTX_DL_ATTR_BA_PARAMS] =
+		NLA_POLICY_NESTED_ARRAY(nl80211_smd_ctx_ba_policy),
+	[NL80211_SMD_CTX_DL_ATTR_MGMT_SN] = { .type = NLA_U16 },
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_ul_policy[NL80211_SMD_CTX_UL_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_UL_ATTR_SN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_UL_ATTR_PN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_UL_ATTR_BA_PARAMS] =
+		NLA_POLICY_NESTED_ARRAY(nl80211_smd_ctx_ba_policy),
+	[NL80211_SMD_CTX_UL_ATTR_MGMT_SN] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_UL_ATTR_MGMT_PN] = {
+		.type = NLA_BINARY,
+		.len = IEEE80211_SMD_CTX_MAX_PN_LEN
+	},
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_policy[NL80211_SMD_CTX_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_ATTR_DL] =
+		NLA_POLICY_NESTED(nl80211_smd_ctx_dl_policy),
+	[NL80211_SMD_CTX_ATTR_UL] =
+		NLA_POLICY_NESTED(nl80211_smd_ctx_ul_policy),
+};
+
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
 	.min = 0,
 	.max = 0xffff,
@@ -1203,6 +1248,9 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_ASSOC_PROTECTED_TWT] = { .type = NLA_FLAG },
 	[NL80211_ATTR_SMD_SUPPORT] = { .type = NLA_FLAG },
 	[NL80211_ATTR_SMD_ROAM_STA] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_CTX] = NLA_POLICY_NESTED(nl80211_smd_ctx_policy),
+	[NL80211_ATTR_SMD_CTX_TYPE] =
+		NLA_POLICY_MAX(NLA_U8, NL80211_SMD_CTX_TYPE_MAX),
 };
 
 /* policy for the key attributes */

-- 
2.34.1

