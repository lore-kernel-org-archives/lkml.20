Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907620;
	b=XSicoYtwqiZTU3sbC5wffub1d6rZfaGQcK9ddjPGPr0VVe8WPqqOAYbBLgQhoFAn/E2R
	 98wsy6Mmotqf4wMIHo/Kkj0MgQlXwI4hovgPDz6rTyn6XjxOc2xrcF79/nD0HkvM18dvS
	 ISfm8CcsroqN5DZOVEg9oISPSlzfmo2DGNhQfvmAwspfY5A3DoMXUlhNcIufcqqNosvGE
	 Kazp3UUXyBlEtIj5m2rqxbn6H3OOyuzBRU34+5Z+Zpr9pvQRf3+yOunOOMWidt5sDC36l
	 TW4E6stZBO3gnuGe/MddOAT1BIsCuPal0zPbe7ehBm1STUurzpuPFPpU2mH5SMzOmGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
	b=GHQdj1zOFW/B945BpR2lvMAk39CuiNU52f7IqM48+tg5KV/KYc6j8AWGP9+3BZjtyxg7
	 HfJ+ig3RN7QXo8R7KuJGr/+fL0frb7oxazsm7H5q4Qte6qU+sl+O1v49gqUScWRKZaJCm
	 8zxoc8PnYqV34Q85x+HUWZ5lFgzk585ITq+6iFPGxyatNZYCGaBEq+DOtVdS6f93X4p+P
	 Lt+JuvwjkyMLITGF6rINIVWBn1oP8bgcm+5ID+AjugPP7ExZN3hazPsDm4Xi7Aolo81P/
	 GydiL70Tonp1iiVbGuylRHaSgL0hiL6nrx8a1b98xLlSIydSjWBPcYU9L8MNb3aVqGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kf8HthJ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLYmwftD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F36071FA6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144F36071FA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kf8HthJ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLYmwftD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeKJ01485069
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=; b=kf8HthJ755bsNh8g
	VRlBb4h65hEIU3uhp6aGtB2U1sht2wcfKdy93BKZDzl+5SP+tEYj1qQ2SCxuv60Q
	F9R2Cmqenn5YgVqEqhgPWT+aGZkTf3O3iYOWOrY1osB1Pa7TwSuGv8TDywVa0r+0
	wVPlYe8nlc+6SOwUEqDdJgWPErlD1eV6yTo3Rv2gRCZZ5I/ETLXzSxSurFXyUeoN
	3vMZLz07j8SwkCCrYia+on3M7/jq0HwLNhvZ2x6jnvohz7NZ7ZjjKnQA6xF1kc6L
	3cG6WPOZirLwndRIdE8C1atQeONI2bL/lj6IGkTbEniw0HaUd7lRajDlyLWM5Kb+
	oInqWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaajycp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d2d353a5aso1062447eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907618; x=1794512418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
        b=bLYmwftDcPeyJV3296LUEWq83YmXOpDY5w6qR6Yu6chRu43PP6uh4eKS/CQg+1y5fd
         DOXTe0R/itIZGJ/GyIe/av90WuryIAVRmpmcIjQkwqL6rHgjQGro9NcK8pGzhN3m7C9K
         G5lA4DJlMsYuYs1mg/G6NRDtLQXyqOSPnbk/ofqHDM+uA/K7ZSqkBiu/iBHLR3pdx+1b
         3nLxcA8L8Pfa3wy50L2WMpXB9rHy7zGQGAVGnooENEFu+RqQjdweojA08JSXG/A4fVFV
         7ni9GZqLSGKVSqAb9QC/Nq7aBYhBi+o0dtEvLZkczGXKUAQzyPQC/W6tegU/+O9AKe41
         Wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907618; x=1794512418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
        b=Zw+tP/YGEW7+ZtRnGmH7Jgf8j9fad+EoOKbHdp+OmzML71SSCWq8LJmmWL7BFXSJ2N
         bAYKTWH3NMZh/kZ2RL3xDQ7U3aGmU05e87JR4btb0SeyKtQy6oSU0lvh15TNf0SWaXpp
         ko8ZiXmTRE0ANbFLzsFOzuLOEq4P6siwom/QH9PIazAW2CZbRdpQueEi+PAKeHC2C55p
         xMuoSE/ff2aaaO+EJWTKFfHdwTh2NL9wi+xfEwXZSugit1P+eiISovkmbwZT9+cn3IbN
         MAnGSqPweIp4cX+5pDvKSN/rcs3VA28O4OyK9WWp2sfwX1ZqIp0up8YOssWhilsTzeb+
         T7Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxSyhELZexbFQOPwQ7a9T9pP8MsS+3/pvugiE4Sr2Vn9iIFHYfzTOV03P4JgMfYCdq0J/B3sIsk0hJMSo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z93y65QzHvG4y9MQP64AsbmzmGQo8G3UwFyAbh1g9M7zGPTawW0
	lDVBQcfoiWm2eH9KFA51YMNPHPiSDNnZZ6UTHwMaR5sVNC4xc/T52JTICpNYtprSeBRppWuAYQ2
	WwSfHIWYQ6BUW4SP810orraxHL3pUx+bsnMTwmllbJLUrs9eYBkqtBIeTZqIOooxSQw==
X-Gm-Gg: AYBFou0ueFRcs4pTPcnmPjhRfuq3hIzm9YDfmY+YTnovGXAjY5kuh7QTOWYGcl/y+Lx
	u/Ayv9i+s9dSjNZAICxm7uREauWGdYqnB33riuevYS8goahkM3f156qMrj/iRfWA9wOdkXlN/MI
	AI4Vp5T2COKgSL/umfxsMf3EGc1OFegGIZO/dgmQxnEhEwUaA94T2tnF5Xt3EwKPpYY2Rk2jzpu
	nVhtwSw9D/fIi6a7EtEm3W2Lvqf5N8pZYddUNRApiCMAkECsjR9umImCh+bbz4tZZUx3jVMMBBk
	qyiaa+usnGYPdKfgYGt43/1gKy3q8OAyS5pirxPSnVTMPw+a2W4gA/u1H1Dzm6A4qbrtE5YQebr
	29BCx3zf3NenMrTz2EFvGFrhT29rdVVFc6Tognz1uJD2EHOTFklRcfoN/TcR1RAfKXov8q0K9sX
	wVwF3HmBS4BKE2avC6s33BvIuAjGgOO4i8Mrol9F3AQZGMyC5hUTeQcZv7VD+ptzRFBGUX1g==
X-Received: by 2002:a05:7301:4208:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-36de5f70a05mr4629967eec.5.1793907617835;
        Thu, 05 Nov 2026 11:40:17 -0800 (PST)
X-Received: by 2002:a05:7301:4208:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-36de5f70a05mr4629928eec.5.1793907617220;
        Thu, 05 Nov 2026 11:40:17 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:16 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:36 +0530
Subject: [PATCH wireless-next v3 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
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
Message-Id: <20261106-smd-v3-1-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8hJZ/1mMamoe
 6GXbTEAWpwesJ+gR+tzMAB5FDIlZcYS2mV/S/9rPLIeJZt+dgYKIgkj6akWZdK9xjLI4zkdKzwu
 JAPbNgJlcAEq6u8UIESJjvHGYxzmQxrbwESyU5q0XTQIcVqBz9K0dgEStJctvdhPN+Kj1zo0KuB
 FRgYgFfTag9/VFr0UIz3xR2M8Ka0mM+8JEzSVOY9P852vAxEOVsJXocAtrnigRXVIfLeYwYL4T1
 fO/bA8ajD1sfWtEqdvuKnVMBDywMUYmX/v/QN3pisTbXMgqcrQAfQH0mBGFpZB+nKqnbY0TVBDV
 afuEQBBihBEC4w/0Sjaybq6ZXPqe2T7NeqhZESoFlbyvuDRMEdEeynuTtVukWSNQ7mn0Pr43PyN
 oYarpliB6KyoviVRwjTxdcm3QAmwlGtKOo1X6Zx4TS99Z4Q74l+0wUDFirIl0JKrhEhTuu89ct8
 iIGu+wLom7glano4mdw==
X-Proofpoint-GUID: -yRYCQ71T2zAvma96bC-hBMNFS0Ebdbm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX4PIZzzRSR9eA
 irDjv/+WZSXLoBLJmVTb/FC5AyeXNNemakYW4xVfq5lBdZO/h1gCUWaB5NyL9QVtujQDbOaGJUI
 +I0yYH2I1NBgHAixbM12z1dcLgMB/JU=
X-Proofpoint-ORIG-GUID: -yRYCQ71T2zAvma96bC-hBMNFS0Ebdbm
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecdba2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mv3qBhzh20y5QnxvG48A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

Per IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16, an AP MLD can be
managed by a Seamless Mobility Domain Management Entity (SMD-ME) along
with partner AP MLDs to enable seamless transition of an associated
non-AP MLD from the current AP MLD to a target AP MLD. A non-AP MLD
advertising SMD supports association to an SMD-ME and SMD BSS
Transition between AP MLDs within an SMD.

Userspace needs a way to be aware of the driver's SMD capabilities so that
it can enable SMD configuration and operation only on capable devices.
Define nl80211 and wiphy flag interfaces to advertise SMD support to
userspace.

Co-developed-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  3 +++
 include/uapi/linux/nl80211.h | 25 +++++++++++++++++++++++++
 net/wireless/nl80211.c       |  7 +++++++
 3 files changed, 35 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 46ba0fb27b14..b4f384ade47a 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5796,6 +5796,8 @@ struct cfg80211_ops {
  *	STA) basis for station and P2P client interfaces.
  *	(Note that if userspace doesn't give the MAC address, the AP's address
  *	is substituted to allow for older userspace versions.)
+ * @WIPHY_FLAG_SUPPORTS_SMD: The device supports Seamless Mobility Domain (SMD)
+ *	setup and BSS Transition.
  */
 enum wiphy_flags {
 	WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK		= BIT(0),
@@ -5823,6 +5825,7 @@ enum wiphy_flags {
 	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
 	WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER	= BIT(24),
 	WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON     = BIT(25),
+	WIPHY_FLAG_SUPPORTS_SMD			= BIT(26),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b56a96f57bec..3e71564ce87c 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -343,6 +343,26 @@
  * processing of peer DH IE to generate PMK.
  */
 
+/**
+ * DOC: Seamless Mobility Domain (AP)
+ *
+ * Seamless Mobility Domain (SMD) is a mobility domain consisting of multiple
+ * non-colocated AP multi-link devices where a non-AP MLD can perform SMD BSS
+ * Transition (ST) between the AP MLDs without reassociation (hence, seamless).
+ * ST is done in two phases:
+ *	Preparation (where the target AP MLD sets up the links for the non-AP
+ *	MLD but keep in powersave) and
+ *	Execution (actual roaming where the non-AP MLD transitions to the
+ *	target AP MLD and continues traffic).
+ *
+ * To use this in nl80211, multiple commands carry the %NL80211_ATTR_SMD_SUPPORT
+ * attribute:
+ *	Drivers set %WIPHY_FLAG_SUPPORTS_SMD to indicate userspace about the
+ *	SMD capability in %NL80211_CMD_GET_WIPHY.
+ *	%NL80211_CMD_START_AP carries %NL80211_ATTR_SMD_SUPPORT to indicate that
+ *	the AP affiliated to an AP MLD is part of an SMD.
+ */
+
 /**
  * enum nl80211_commands - supported nl80211 commands
  *
@@ -3243,6 +3263,9 @@ enum nl80211_commands {
  * @NL80211_ATTR_ASSOC_PROTECTED_TWT: Enable protected TWT for the association,
  *	requires protected TWT support (flag attribute)
  *
+ * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
+ *	multiple commands to indicate appropriate SMD support (refer DOC).
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3850,6 +3873,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_ASSOC_PROTECTED_TWT,
 
+	NL80211_ATTR_SMD_SUPPORT,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2fc680382418..16d00ebed10a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1201,6 +1201,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_ASSOC_CIP] = { .type = NLA_FLAG },
 	[NL80211_ATTR_CIP_CAPABILITIES] = { .type = NLA_U8 },
 	[NL80211_ATTR_ASSOC_PROTECTED_TWT] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_SUPPORT] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -3824,6 +3825,12 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
 		if (nl80211_put_nan_capa(&rdev->wiphy, msg))
 			goto nla_put_failure;
 
+		state->split_start++;
+		break;
+	case 19:
+		if (rdev->wiphy.flags & WIPHY_FLAG_SUPPORTS_SMD)
+			nla_put_flag(msg, NL80211_ATTR_SMD_SUPPORT);
+
 		/* done */
 		state->split_start = 0;
 		break;

-- 
2.34.1

