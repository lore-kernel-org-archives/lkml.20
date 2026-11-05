Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907623;
	b=sO06UOQTwS72I5eji8M63Cj2tyiNYFm+nkLHvxojgznRBJznuU7H9ygvCdgj6MJWplLp
	 jlalZZlNIVGVN7co5O+o5CzBWPM+OCP6RjPCWTYzEZzN/gLjXO1A2w8J8EOiNT5yYa0Hn
	 2ojdvgGhnSyXNAoozgi8pp76Exi5kpOKx/RFS5NEN4NKPo1vCOLc40LOb95eCBMEyZ9rR
	 kcj2MOnDQ+Kpl0coUyQX63iIx3Og2WcI26I/BReybydL/CkpXB2DMXmhF76SUK8nT0ODO
	 hyol3s144k5YJa5aQRUx1g037ivvepZ4CstnYyiX/YrGHkCFOVvwxa8En95Po7LPJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
	b=hE/zVdCZhuFjJ95KliWcFss3uicVMiIv6z3m02lvjJ7b1ssCDdZg7yZou8Tk0O0YM++o
	 aSWiz3XjivZY++8G4Y+Q/G7gMDc++8PFnagH8pTJT3qMBMubuBcG3TZU5VD4NbXd2jsaB
	 QIEGAp1RYm8MmhGwj7t4nhwWpQxDGVIy3VhdLaR7KdM8b8Kdt7Ih12ygmCSLxZQw0dg8R
	 /nM4I8upRapgQakpTo4UeJZ1I4YwB/2D0ZOb5vUAZ3vEDiqTUBnRWkrvft+SQ+6RWHAFS
	 P7IisQ8C6hsouEC/jI8qgsRHYH4SMLsOmbK5ZHCfxt/rEF6JrvcanxHtI+1eZ7KOynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9DI6sMl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKs3bcs6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF826072C55
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF826072C55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9DI6sMl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKs3bcs6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeFQu1474637
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=; b=R9DI6sMl5CgucnFC
	U6LDr6F3GDrlTP4MQD/qWURLv4sQqMN5YDCoMJHNKc4J0WXEIm5jOqkGNoCHIPUI
	/2K/ziN2l2MsCCrz0dh5wGKrfLgvd7B6HASRfwJQmwu5g1bBjdmxFhplQJxRKbir
	jnzMk8WnzymbccyisGA5x7UUNr2rGsBnSfv4xJWKbrdm0P+vtOYedYOZqn04nKod
	Upe0lGGAbWXzl+ctKJNtY4TxOOmvZ+ckx/VJyA11qVaWa1atuvcDE9npHAw0L1Ce
	OS0FmbGfqGR73eCEMOS2ExWy0axyFcTebGeXQLI/O/KPMJeviGxtCOOBQLrHs5M3
	NlFmpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbfgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so3101717eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907621; x=1794512421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
        b=YKs3bcs6p1z07QOsJJBg8XCF1zp4GaWXvXwRUh3kafX9HXnK4GApUwmeTKOXEQ0PxO
         thqg6LANU9lqzoZtgtlSTE+kE6+BRblb6ejnWSoZvK63m/USVRsU/oWMDVXeZN/J3kIx
         d/JIGB4NbIFXragEO5WpKGPMEzrIprjFfTwrkO2pAD6l6sKE7LAVkopEZ+3/jVsYUCQY
         OErJxPY7y6K4PsJZgi5mlT9mNFk19xkK6yGexWsH2FLzKrPIgDTGE8lBCi86ws27Vzhc
         uCkgXGRyh74hTGjo24qx8KRc3sLluFoVSZA2J9EVE26vKgFDpWObMg6U2bV5fMvFqe/E
         A6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907621; x=1794512421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
        b=jGY608qZum+0V78QnDh0G/UnP6RoFNne4J9CxIJpCuxyJkDlC5r1F45XXJuB/ugPtX
         PzD7lHuNxdap6fS2YxXufp7VsG+DXwtXr9PRIwhEusHvWSZFKSxWG0vSpig/O6XSqycd
         ugpNlqbFIXY0jGuyvHIMikC2SBDbkjzLsXwIDuxHdX70hWWr+V+EUvKlwlXb6cKawgaW
         K8x8e/ArbLWIpobD72bjiOZM63hvZtQPh90jQo4p1hzTG0uV6Pu3UvKOYXYcKsSev1Lk
         xx9cwbj24lCqNOvLuYHeKr9gRBoxgn04E/kEJJ8EbRr5qQJSAjJPED7jnwzF3hFIPZsV
         kgAg==
X-Forwarded-Encrypted: i=1; AKwUvBxODaI23OqpKZJh5WnsWj0rda7p2ezSQ+vHLsB9aSW7sB9bqPJUuVOi2b2khdKWc/v7Kj4+/iodL0cnGH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZDIw9T8D2XTQIhH/7zx07TeTijRPAwMsMShj7P5Egggk7h3sM
	X4z2VXy4xqmR1/aXOfpkAJDmHwLoFddRbzzYvz8qZnDiier4AtF6gQiSADeBI++0JFGMICJ05Gh
	I1/ydAQcuCz1X1Fyq8plkgx8tUtYDiSJmO1sDILN3Z909Nb5jxoe4s0Y84vrCEUs5bRHvVBPd9Q
	==
X-Gm-Gg: AYBFou3yWQAH/Vxbd7H2ql04yp4o7La4S0Ju/tgAt6J3NqVXV883Pw1t1Q5O7uKcUju
	z//EFlY70CaDImfvuG7nJjYAV4TfUR6Zn+Hpa5ifE/SHEEArBTLi4QYruYAOunl3xl1Ai0G/h2o
	NAK+GHafJz5Sf8XL086JlsPv0sSfz/oU5Vt/1Jl9gf97m8sIGScWTxt+WOFVkgi4axjbKhUiVMV
	PG0qb0afs2TPoddiF4GtdW17Il+/g5icKqlbLnXn1lvAG/EykiLwYQeP3YNzFYJ+I1eim96vg7t
	gnYiFQ/OUFdFfvvdizqaSCgmBykYVzVQ/6Et9GzS1YnHFvwPzBgt594W52xgHhIfpfszvwtIMI2
	S8i9v4EKoI/o+OChRDi/2NBi5Q90s/LWN6OdQLh9lwMfr79z1mqK4thjmrHEeFv8AbpxvYpHKLD
	s59n2gK365QgyFIPvAK79TO0HzG57XCTZZHH7UWjNKdq+Ec2CYquKrmiTOR38sk+4DH8Bz7g==
X-Received: by 2002:a05:693c:68c6:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36f75441958mr164591eec.11.1793907620487;
        Thu, 05 Nov 2026 11:40:20 -0800 (PST)
X-Received: by 2002:a05:693c:68c6:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36f75441958mr164557eec.11.1793907619792;
        Thu, 05 Nov 2026 11:40:19 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:19 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:37 +0530
Subject: [PATCH wireless-next v3 02/21] wifi: nl80211/cfg80211: define
 interfaces for SMD setup and STA update
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
Message-Id: <20261106-smd-v3-2-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecdba5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VlmDqvKmGZdUKtkEw48A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: rqZlRJHPHyyfrh235JhqzazL-wK8NGvk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX9cEXTEJ2h0rH
 +cCqm2Xrwc6sguJ4aE22dKg7gbQoXbwFnmNTGhJ+NKg4g7c/tHeegfPbvhWcvbZbU9fSThH9SoV
 olNqEigWPuSPvZJdCdUH6vMsBVyq27o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX6P750EdeTvqT
 EdRHReiA+exa+mrwUBfc1i/9szF0WNyu7tNqmdGB81MGTkys3AREyoxBCzOlV4DN7icpQ9BmrgQ
 L4DKZuMlbnExoESROCkUStcAwX/+/EefqJw8+VTQF702vVH+o8Reqvch5H9u4aXchxlLZWTJ50s
 xQONzBB1PPNIevIqpMUJBGf9KgSBmvu0K06B8Vkc4AjlzBg2TQevu701CovKAcBdaewxItxcAW4
 6ltmdQeXdCJVUYEk7L5f0JlEpedhdPNhLOmSJeMi/ODysKwoVCU1OKob5w+rV5QZPZ7/8Af5u7Y
 HdfYvcLPtqpq3oPmj1h6mKVDlr9OihwNh++I2YSXLV9kzXJITwIjEfgFAahTPzRAiHTcq6YGXHf
 6TWmQ/fbQt5//R8GyR+0XHQTOy2oCNV5cIVomjA1/8W0IsRuf5lg8HVruwEI3i+z58rHXbGPhR6
 +ETIOfoes9mDmuA4hIQ==
X-Proofpoint-ORIG-GUID: rqZlRJHPHyyfrh235JhqzazL-wK8NGvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

From: Aditya Sathish <asathish@qti.qualcomm.com>

Define nl80211 and cfg80211 interfaces to support SMD setup for an AP
MLD and the non-AP STA MLD creation upon SMD negotiation.

Allow only APs affiliated to an AP MLD to enable SMD while starting.
STA creation can happen in two ways: typical 802.11 association with SMD
negotiated or via SMD BSS Transition Preparation on the target AP MLD;
the latter should be marked explicitly to inform drivers so that they
can handle ST Execution and datapath switch once the ST procedure is
completed.

Signed-off-by: Aditya Sathish <asathish@qti.qualcomm.com>
Co-developed-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Co-developed-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 15 ++++++++++
 include/uapi/linux/nl80211.h | 10 +++++++
 net/wireless/nl80211.c       | 68 +++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 7 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index b4f384ade47a..54d549afd8e3 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1624,6 +1624,7 @@ struct cfg80211_s1g_short_beacon {
  * @mbssid_config: AP settings for multiple bssid
  * @s1g_long_beacon_period: S1G long beacon period
  * @s1g_short_beacon: S1G short beacon data
+ * @smd: Seamless Mobility Domain (SMD) enabled
  */
 struct cfg80211_ap_settings {
 	struct cfg80211_chan_def chandef;
@@ -1656,6 +1657,7 @@ struct cfg80211_ap_settings {
 	struct cfg80211_mbssid_config mbssid_config;
 	u8 s1g_long_beacon_period;
 	struct cfg80211_s1g_short_beacon s1g_short_beacon;
+	bool smd;
 };
 
 
@@ -1880,6 +1882,17 @@ struct cfg80211_ttlm_params {
 	u16 ulink[8];
 };
 
+/**
+ * struct cfg80211_sta_smd_params - SMD parameters for an added station
+ *
+ * @smd_sta: SMD-negotiated STA
+ * @roam_sta: station was created via SMD BSS Transition procedure
+ */
+struct cfg80211_sta_smd_params {
+	bool smd_sta;
+	bool roam_sta;
+};
+
 /**
  * struct station_parameters - station parameters
  *
@@ -1920,6 +1933,7 @@ struct cfg80211_ttlm_params {
  * @link_sta_params: link related params.
  * @epp_peer: EPP peer indication
  * @nmi_mac: MAC address of the NMI station of the NAN peer
+ * @smd_params: SMD params for this station
  */
 struct station_parameters {
 	struct net_device *vlan;
@@ -1948,6 +1962,7 @@ struct station_parameters {
 	struct link_station_parameters link_sta_params;
 	bool epp_peer;
 	const u8 *nmi_mac;
+	struct cfg80211_sta_smd_params smd_params;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 3e71564ce87c..cfc1bcad13f0 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -361,6 +361,11 @@
  *	SMD capability in %NL80211_CMD_GET_WIPHY.
  *	%NL80211_CMD_START_AP carries %NL80211_ATTR_SMD_SUPPORT to indicate that
  *	the AP affiliated to an AP MLD is part of an SMD.
+ *	%NL80211_CMD_NEW_STATION carries %NL80211_ATTR_SMD_SUPPORT to indicate
+ *	that the non-AP MLD getting added has successfully negotiated SMD with
+ *	the AP MLD. %NL80211_ATTR_SMD_ROAM_STA is also set on the target AP MLD
+ *	to indicate that it is part of ST Preparation; drivers must keep these
+ *	links in powersave at this point until successful ST Execution.
  */
 
 /**
@@ -3265,6 +3270,8 @@ enum nl80211_commands {
  *
  * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
  *	multiple commands to indicate appropriate SMD support (refer DOC).
+ * @NL80211_ATTR_SMD_ROAM_STA: Flag attribute to indicate that the station is
+ *	created as part of SMD BSS Transition and not by typical association.
  *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
@@ -3874,6 +3881,7 @@ enum nl80211_attrs {
 	NL80211_ATTR_ASSOC_PROTECTED_TWT,
 
 	NL80211_ATTR_SMD_SUPPORT,
+	NL80211_ATTR_SMD_ROAM_STA,
 
 	/* add attributes here, update the policy in nl80211.c */
 
@@ -4026,6 +4034,7 @@ enum nl80211_iftype {
  *	previously added station into associated state
  * @NL80211_STA_FLAG_SPP_AMSDU: station supports SPP A-MSDUs
  * @NL80211_STA_FLAG_CIP: station has Control Integrity Protocol (CIP) enabled
+ * @NL80211_STA_FLAG_SMD: station has negotiated SMD.
  * @NL80211_STA_FLAG_MAX: highest station flag number currently defined
  * @__NL80211_STA_FLAG_AFTER_LAST: internal use
  */
@@ -4040,6 +4049,7 @@ enum nl80211_sta_flags {
 	NL80211_STA_FLAG_ASSOCIATED,
 	NL80211_STA_FLAG_SPP_AMSDU,
 	NL80211_STA_FLAG_CIP,
+	NL80211_STA_FLAG_SMD,
 
 	/* keep last */
 	__NL80211_STA_FLAG_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 16d00ebed10a..b06772ec8ac5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1202,6 +1202,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_CIP_CAPABILITIES] = { .type = NLA_U8 },
 	[NL80211_ATTR_ASSOC_PROTECTED_TWT] = { .type = NLA_FLAG },
 	[NL80211_ATTR_SMD_SUPPORT] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_ROAM_STA] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -7379,6 +7380,28 @@ static int nl80211_check_npca(struct cfg80211_registered_device *rdev,
 	return -EINVAL;
 }
 
+static int nl80211_validate_smd(struct genl_info *info,
+				struct cfg80211_ap_settings *params)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct net_device *dev = info->user_ptr[1];
+	struct wireless_dev *wdev = dev->ieee80211_ptr;
+
+	if (!(rdev->wiphy.flags & WIPHY_FLAG_SUPPORTS_SMD)) {
+		GENL_SET_ERR_MSG(info, "SMD is not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (!wdev->valid_links) {
+		GENL_SET_ERR_MSG(info, "SMD is not allowed without MLO");
+		return -EINVAL;
+	}
+
+	params->smd = true;
+
+	return 0;
+}
+
 static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -7661,6 +7684,12 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 
 	/* FIXME: validate MLO/link-id against driver capabilities */
 
+	if (info->attrs[NL80211_ATTR_SMD_SUPPORT]) {
+		err = nl80211_validate_smd(info, params);
+		if (err)
+			goto out;
+	}
+
 	err = rdev_start_ap(rdev, dev, params);
 	if (!err) {
 		wdev->links[link_id].ap.beacon_interval = params->beacon_interval;
@@ -7995,6 +8024,7 @@ static const struct nla_policy sta_flags_policy[NL80211_STA_FLAG_MAX + 1] = {
 	[NL80211_STA_FLAG_MFP] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_AUTHENTICATED] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_TDLS_PEER] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD] = { .type = NLA_FLAG },
 };
 
 static int parse_station_flags(struct genl_info *info,
@@ -8061,11 +8091,13 @@ static int parse_station_flags(struct genl_info *info,
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_AP_VLAN:
+		params->sta_flags_mask = BIT(NL80211_STA_FLAG_SMD);
+		fallthrough;
 	case NL80211_IFTYPE_P2P_GO:
-		params->sta_flags_mask = BIT(NL80211_STA_FLAG_AUTHORIZED) |
-					 BIT(NL80211_STA_FLAG_SHORT_PREAMBLE) |
-					 BIT(NL80211_STA_FLAG_WME) |
-					 BIT(NL80211_STA_FLAG_MFP);
+		params->sta_flags_mask |= BIT(NL80211_STA_FLAG_AUTHORIZED) |
+					  BIT(NL80211_STA_FLAG_SHORT_PREAMBLE) |
+					  BIT(NL80211_STA_FLAG_WME) |
+					  BIT(NL80211_STA_FLAG_MFP);
 		break;
 	case NL80211_IFTYPE_P2P_CLIENT:
 	case NL80211_IFTYPE_STATION:
@@ -9276,7 +9308,7 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 10);
 
 	switch (statype) {
 	case CFG80211_STA_MESH_PEER_KERNEL:
@@ -9371,7 +9403,8 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 				  BIT(NL80211_STA_FLAG_WME) |
 				  BIT(NL80211_STA_FLAG_MFP) |
 				  BIT(NL80211_STA_FLAG_SPP_AMSDU) |
-				  BIT(NL80211_STA_FLAG_CIP)))
+				  BIT(NL80211_STA_FLAG_CIP) |
+				  BIT(NL80211_STA_FLAG_SMD)))
 			return -EINVAL;
 
 		/* but authenticated/associated only if driver handles it */
@@ -9633,6 +9666,23 @@ static int nl80211_parse_sta_txpower_setting(struct genl_info *info,
 	return 0;
 }
 
+static int nl80211_parse_sta_smd(struct genl_info *info,
+				 struct station_parameters *params)
+{
+	params->smd_params.smd_sta =
+		!!info->attrs[NL80211_ATTR_SMD_SUPPORT];
+
+	if (!params->smd_params.smd_sta)
+		return 0;
+
+	if (!info->attrs[NL80211_ATTR_MLD_ADDR])
+		return -EINVAL;
+
+	params->smd_params.roam_sta = !!info->attrs[NL80211_ATTR_SMD_ROAM_STA];
+
+	return 0;
+}
+
 static int nl80211_set_station(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -10041,6 +10091,10 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 	if (parse_station_flags(info, wdev->iftype, &params))
 		return -EINVAL;
 
+	err = nl80211_parse_sta_smd(info, &params);
+	if (err)
+		return err;
+
 	/* HT/VHT requires QoS, but if we don't have that just ignore HT/VHT
 	 * as userspace might just pass through the capabilities from the IEs
 	 * directly, rather than enforcing this restriction and returning an
@@ -10074,7 +10128,7 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 10);
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_AP:

-- 
2.34.1

