Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951970;
	b=aSv5rwI8uqTySP37/PGOckgHRK7lcRtQNVonFvoPQbH3NPgM5tOvM+ZAIYr5nhCX3SOT
	 oVSUuP17QWnxlxIA9puPSnHEjDAuLiopevWtPqyj74IWNHQ6tbmbhce1dfO29dWYaqJ7p
	 hWo+w/HNONyDc3wTE1nbt8B+zkoHAfxSB0xfaYyd7VJqhAeKxK+/bc5VRAaHxIDLxiVNa
	 6NiocqEDCnuyE4DTcn3IGDP36NqrP7CbM7vk4RABNazcPrkezhtI0ssHHbbEuWQXdXOhm
	 8UZjOJj5kKXNPgOBudqiKWfmxfcDaqiFnryCssw38qdKdq50OyywXn+qE2yK+H6r6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
	b=SZGxaR0nQdWiP0cfoaNki//d/uTXCGhv3ccpyNMkIBDwRgYW/7YOrjwn5YhYGNjWZ0Mu
	 w3xUHe8qjBcv2EyPZQbT6EVFYOE3ahnDCfdrRmVNFeYfNM1SkroOpgroUNAU0O6+ealNq
	 iyloTKUSGdL4M00WKqUV8hHN+H/+3QprqBAtstcdGSi1MoEqLBpk4B/G5faPPetHlgWRR
	 d/Ew+UiMqTjQvgs4AMRd5sedl/McvCeOD0JUzrWbgKDMAQWekOCKALaF3thtyyKKttAyb
	 dkpjji9DIJ6tO4pHbIq2WwEUUMTyTf9OLVCfX8uzoyF4ee8CsHkKM2NrJpIN7XD2Ygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGGVL6VJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BauU+aCt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53190606D830
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53190606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGGVL6VJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BauU+aCt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkBd3883417
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=; b=AGGVL6VJCWqbMFe3
	NU0FoWm0rGnLg6ePtDt5wgLrnOdOytuJduRT1pajE0k//bmR1M+D1Cyn93rAqdq4
	i4p6JOAEcFzSLsXFRRv3dMJ0JEuZodhh66KyEesfnzEV1v+IT/g9viD73AgN9gzR
	4BbNDhQVdxMiPAVqriLGJmiENwKWtkXDDhH01xrQWPXgfFfdqxOAgrmhvMawjkny
	SnaloR1WDbiar57CosTQ9nsa8ml1s6tvniZAzSrV8rY3PEB80ZhJGUgsnB7zsIlb
	P1SD37rpG2Ncqd975ucXhozVRgeSoQQ4p8MQ5U21X+BBcybQlCOJwy9czYDni2Pl
	S3HLAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1qvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so409006a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951968; x=1794556768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
        b=BauU+aCtCfBcdx8WUOnPok7FMtdVrvRrdj3pyWdKfjGLZMCLJ63Kl9RuONFz6URPNG
         BDc08RgSsgGZ7uN4CYxEZOvIoiG04b54vFrnSFp37rhDwy8Xe+RE4sPR9wkdpH9rqIrL
         kvYHOyduU10po+2xOud9YTKfmG1w0pn++t0SeVXobBg/IOmidyuyhrDjyRhhCFMPXZOJ
         NzOcVX1/dL2Rh8njlhnGX9/sgDa05y2SieWn3bZ8uoggi9SSuZOT1pAYEVbYbijaNKb3
         1KouGjHaOVzKkYJcCbof+g3pNFRbCalJ/lCcBYczUuWlniDXe0o3SbBlh6M1r6GxrkAw
         +17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951968; x=1794556768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8XHujJiBkcagFsfgBICSH9wnbIRlzmSj2ubDb+7t+w=;
        b=iOtEmAsPC+DL91U5dOuN5hDJHiYaENMXJ0MvthPNDCq3+6GCuEZ8yDHk6hmI4JTb+1
         eQLv+NbjOjUK92x2xPOFBcLzus8hGNTqtITPuBOGkz0UCLAckTxabFM9nttsvg2w2JRF
         sIyJzHQGDYIy8yVy+q65BjTh8Yj4lmO2wnKCVei4NGBgoWnHaAAtJCqRvmP8ETbCmcmn
         XEvtJahdjuoWHiZDM0MyuMHK6tgtsNu+CUgegkRx6OAHFJDhIsoyL996VofJB8RFtHdq
         VlrONeaO4Eq18ZYzAg/8XneZpuSIfUfaKf8Pci5H0eBg0A7/ybAVOlmfuwiPDP8X6HR1
         NTKQ==
X-Forwarded-Encrypted: i=1; AL+hErGne08g75onvhpU+N2P7j6ajGmTtRHK9DOf4eHHWrHZfyWDxeXUxYcasCVhg+R/XwSRbHafGY04WHBlHo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++/NJ5+/g4MAZZUl0reCUZ4ByO1VZXS76tAxtn0tjayuPx5kzW
	iwiBbkSYW14yQuoTGKtKOQ0qO6CXK5BQjE2mEf8W7GdjZjU8TncBDPy5nTxfXmOutLP1fPOY22T
	/iu1mIDAr+WZYEniNSCPw2BKI8sZap35KlKuUgE3qr7c8xLMXbb9YT4XVpWUTd5Qcsw==
X-Gm-Gg: AYBFou1X/EUpLUIZqlfRaBsW6b0qdzgmTz0DMXnME0nzC+Z6MdhLG0bUZ3v22bYjYbR
	T/k7k6I/p2/UQaN3MuRgXRbVDEL23mGB3qkkWYooFkHF7d39R8gDbJ8H3IlYRm1aAEc06/nMS2a
	F8oPY/3ZS5s5ul0ec8CEg5arDJMKG4kJHjh2c8IBc1lWgUfo/Rs/Amp09t1tyUTY72/eyY8+r9y
	mVp2z+wXwy+C08NizSZrig8EWWsx2eT+mD1oYVFsr1eNsVNTb7Rqw7OgoTFgz4gr1q+oGTbou6j
	JyKFkZnZi6LfgU47kabX0VME1Rgldd94JdBczImx6Fo3Wnb6MZJ4JQdHc7FKNfO8O+Qt3D5Npd7
	76oCjr0LgXNSf2rmOadSt/FV0TBgVrVFkuhGOeQuD+n6KMBdJcex+ArwRmd6bVaeVcjcsP2BDGK
	Lkltyz7GY2P4HDpiWOJ9kQwq4g7x6heHjo+I4rkUZ4ow9KYGhK48rMYsKS7apxrrr+X2NhX4Q=
X-Received: by 2002:a17:90b:3889:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b0db7232edmr1616098a91.62.1793951967840;
        Thu, 05 Nov 2026 23:59:27 -0800 (PST)
X-Received: by 2002:a17:90b:3889:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b0db7232edmr1616085a91.62.1793951967338;
        Thu, 05 Nov 2026 23:59:27 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:27 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:38 +0530
Subject: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
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
Message-Id: <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: dq7apoTZUsm3NGoVYxBD6FRZwI9hkDhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX11ZwuXQW6R56
 ivlM4OCKnmeGObA+Ml62s6EOMvqCuJ0SrxB9ozWTo4nKcaT3YkZ0qrAEPWYLqyBi3Aq350d4c4P
 5v4UyfU12xZdAsyhaZYcFhqftbw8ABo=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed88e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mv3qBhzh20y5QnxvG48A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dq7apoTZUsm3NGoVYxBD6FRZwI9hkDhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX2OUmuC57Swo1
 AVutaHKjtfmejPsmzWguzVGp7xltktHjhQeZmefKXgdwZrFH38u8FIhrUGkoy4ulNSRilPfYepT
 t754N+3h26OS0/S9ehpV14H2m8jzwCqltPy1nDoKW49ai3mB8yTp2vlEE0EegWv8+bm4/RRz9/U
 R3CCdhpfXJ9SJ/7ookwaNzq2kvFcVpu98vDbnp84vXXbA7B7F6ftTMp8Oe1Eyu3QRlRV3t7SX3X
 qe6hqGHOzN508QiGGKz2nuK2o89HVwRiAsLR4xfTlepgOD7btqLo3H3V+nlmW2A/sFgGOedvwaE
 M8RpSpEsUmux5Qzmsdilf4PZe5TeMOhxHtQhsq7bJSQQikaIwDBHhdVU3g3suo1E2RpFDcV2DSU
 7Xxr/F6mzi8sWJVvhCF7QszLEyAqk1pOgtt+m2BiIRNagRas1rXQAyFLffXrv/O1S3L+EVWOEh+
 rVjGT6qB7uYRVCjF6Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

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

