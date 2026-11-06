Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951974;
	b=vM/Uboz4YQu6S9c4RGzWpDulEOEinHd3PBKeTBZAK2CxDwt/NO+q+ou58+jXqtdBajL2
	 gUNo8sMpATEjIit2iI+RCcmy1XJ5SVdTIPn+6K2UR6vZAse8Uy2byzkUf57ho2oOBuUmh
	 JLw9+yuihHMso48Y+7zbr+ZOIIjpzfWn4v9IwzgRSyB9P7maigIC7B0ws3F/kX9K8wyRz
	 fhsLyx2zKxOLp1lcJPUaP0YUg2tVQcQ2zlnqv3NdL0MX/XSxgqKcDhJHW/gJDGZhiG+iZ
	 iK4qVKUVrjVmf4Cr72y9eiLsFQALm31w9JFaMZ3z5worZva2O2JVhkxs/6etuxogNXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
	b=Tz/CxDxaD0zL+UMmf3g33URnGfo4y8StOG6BOUcK5r1mV3UHgWciecOve2//TrI0pjyg
	 /d8OcTqJXqUhk407AvQs2KCuMjnCftqgcBcI2EOPxqKeaRM1CnuHfzUsoadVH33CFIu17
	 JEczjfjXTy57Sjl7AFM9ttK4Fd9Ps4wBpO6aZ8cC8O8cvsg+znbEFVFZ6vZ723FawLxZC
	 G4XXzrv93JcO5DpuLlvK81L2W2uEnCgkFMt2Nw4S6gMuWYQpXjorncU5+GkCpF5p8YvYN
	 Lk+TfA1LX6XfGKBad9Yqy0c1pkjfgrC7kfWOBKaP/nBZlwwCEPLQs6v7HQxm6REJoEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYfRhtjh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7rpUogM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A60606EE8E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A60606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYfRhtjh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7rpUogM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R79u3243893
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=; b=ZYfRhtjhbs4t2V8r
	+hxuG7frC1LQ6NCNO9yIgFUpkJnYfd42kjsI9H3kj0MUZQ+Qs9jO2u192Wf02RAS
	oWc5BHmP+d7iuL1gQp/OKFPZ1djIfRyM1HHOSnAsmQvJNJu12f3zAODsYqu6n72T
	7vSJX9ZSOkNxIzYTpx5VwUCoY7LtfCjpC6l08v9K0jM2JOZ/fGu4/tH1pXebXfi7
	6HwoS0H5chdYkP5zeJTUp6yyka8GcOvpf5zokmy9MSAuUrh4TBVlYIqrjhwjMAVa
	dZP1VHImLu8Nb7akKb2XBxs7c3gFA0V1r9YG2v77lTelWR0v7tIIRUGcuOqONAmI
	Le1Wdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1phu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so722454a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951973; x=1794556773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
        b=W7rpUogMxcQpqc8XcH3056v+4ZsiVnO1ZcwF51+7UKOf4+apBL5mDKY/mOm7nNq9Bk
         +tQQ2G8/kJkRoz0xeh9OodVbRF9HdVXpUP19j7mMgsr6aIlOu90DldDEEKc/vvQCZM1K
         tT7C/7oWgo73mAkrRBfms5TKGKTBEp39NDEzhEU+k3e3xyyUI8vkMGRKZPncJdvJwpWU
         N/oS+TdNBFJibA560AS4yOqlOtw12HJtiKbZg2cB+wRKH7MaN5kljiPzFNHBl9V3jo6w
         TIxoG5SILMpKxq5fuIWJaKc/j9X1MZM4YhZNX40Otuv6a56TPWZkW4pO2BJGOte7K9Zv
         SOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951973; x=1794556773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
        b=yF4OxwUJsKo1CCtn3859wDLRDaDu4b2btShlqQHKK51U2Zn2xoTZKNrqSj4eJLplRo
         tor8ZBME1M1hiz1R/zseHFwPx7YE3YMuGGrTnWPcUQH+9wozmfqDxdtT1k02D4xu+AWQ
         7+aWFBsk8SO1AFI7iczZUbfnmk3TF63LcNJ+DhRvKsHt0+3jtpE+IoP8uxjJY1Nypwm7
         cYEMhxpZ7T+iSOK3dQj9uFymcDb78ReV7JWDIxDDuHXgmSoGQzUPDhsyZsn+RR6bNbiw
         NJor7t+o6QV8YRwXFPCo5Z1JMExmNZ1wcbdXDLQ4u1uR9Kb+UlePmaheFJ9S2YYq5/f+
         V2Gg==
X-Forwarded-Encrypted: i=1; AL+hErHuUjk95OedQjnKjVPdYPwZQw2I7rNbn5YqgumyEvXHEfPVzi0DT7VdzRFSiQ0bp8eEwA4zROdFWKRl32w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cMBHR3Yn0H4Ukk5zY7PgBsKEec6me/2cpZ5x5qmZGiAifNYPM
	UlY7FQ8CwesBC2bPLHsFLq8DogvWFHNtcQ3egIRqh+y+1ZZsdg4hNnD5pp2VOmuYCOp6cjTWaUs
	JbBKcoaPXsfqHMPjYcPOZjgfS3mJAUP9nwBxmd1qBGQ6M4N8Sxkul/XPpu3Z33M+vqi2QPwmbNQ
	==
X-Gm-Gg: AYBFou3vKWInQk+XpT95hv/lUZw1jggadG3w2lxpWcaCFq93XqinpLlxojHaaXplupw
	+dmfq4ifbZa8uBRIAAfhx9+bXj0aSceOhUCOVveqUPhv6H8abHm6rIn/Zi8JdOtffiaHdCkUnn7
	eQvAeX9DAeU/yH+z5FMilx0ANXzGk9CXP51q3TQPQ1QksZK4z4uVsKesec8az8WOUeDUF2LWx7r
	SHh9160X46PZnTHfIirZou+9xJ/6OFhcuGmxLeL92i/jZO8nUEXY9O6kpX3jEwHBzcUXpwMrjv0
	o05TrwnQy2HxESB9ntbfZUfDbTTiUO5tiw6Jv0BNNnBbHXDCYDBM8sTT1mSZ0fe4Oi/w0LR25h2
	Tn4AbXHPf5P944y3+FQrQ+/6vwVbAdMSClcRHsXpybwMzI3RuV8/1L77v+4yjjyQX5cprF9BBrc
	YCq+GGktMOwjWFmnezHTQnriMOSN0UrmpW4AEwrtbQ+jVM/Y9SYPN4AAAbRG43xgF30c6JXc8=
X-Received: by 2002:a17:90b:380d:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b0db6d39d4mr1783500a91.24.1793951972557;
        Thu, 05 Nov 2026 23:59:32 -0800 (PST)
X-Received: by 2002:a17:90b:380d:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b0db6d39d4mr1783487a91.24.1793951972045;
        Thu, 05 Nov 2026 23:59:32 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:31 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:40 +0530
Subject: [PATCH wireless-next v4 03/21] wifi: nl80211: add SMD BSS
 Transition sub-state STA flags
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
Message-Id: <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed88e5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=b90yJLNE8BgtmlcRjg0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX23xFBi0xa+Tf
 rx0CYvbgeoc/uovhqadPn4i93FLgPZBQKa8jSZUJVaI/X/+dRb1pNGGIAldnke/GMn2Q164/WWx
 miQoyfRXLFwNwb/ZilAly0ftJr3foVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX/GdUuWym22hN
 kz7fKVnw4c4VbUOhAUVBJlj60/EMY71TDhe7lJEiAR1K5vTmIvz7SLOJh2wN+3/3ulbA0Eq1Dqc
 3uEK7JBFTV45CL3bA1JP5AAptSJEdfT82T8iqseXE+VTpxDTe5sPOA9jOMleQ7ZbEgDCHkLjyZe
 ONzi9erA27qbXr8rwIcqLLBBs6pG5jqDPkRMagsDPFKGoVduCUVAtgot+RVjf0MBbU3lWIvbdHh
 fmHZ4GWbQw5LQTloZCaqCNfqx8zLFo/zZAGj5Hey8HAoSE76VsnKYV0BsZrI9EUs3EisFFaO++r
 orKtVKh8B62V6W2QqFbwl82sOUcsBD7lxVnwR+ggWiXSkenkpArgprQCjn6joecj9RxwbIOxKrY
 DSyT0dp1Nm7PDJjQaf8h8zEqCtAoLN1G2eOdgDPsqtaSGLg6QVgv9QELIFrrmfbSoFJTNDVBabN
 FYWa4ggOCAQJ5W0XSZQ==
X-Proofpoint-GUID: iJyPHYD9WZD1HE2GY_5cEIYoqgh9-PP_
X-Proofpoint-ORIG-GUID: iJyPHYD9WZD1HE2GY_5cEIYoqgh9-PP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
associated SMD-ME are in state 4 and an SMD BSS Transition is
in progress.

Add the corresponding nl80211 STA flags to track the state changes:
 - NL80211_STA_FLAG_SMD_PREP_TARGET - State 4a: non-AP MLD is prepared
   with target AP MLD
 - NL80211_STA_FLAG_SMD_EXEC_CURRENT - State 4b: ST execution active on
   current AP MLD
 - NL80211_STA_FLAG_SMD_DL_DRAIN - State 4c: DL draining period

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 18 ++++++++++++++++++
 net/wireless/nl80211.c       | 18 ++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index cfc1bcad13f0..81c16ea2fd34 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -366,6 +366,15 @@
  *	the AP MLD. %NL80211_ATTR_SMD_ROAM_STA is also set on the target AP MLD
  *	to indicate that it is part of ST Preparation; drivers must keep these
  *	links in powersave at this point until successful ST Execution.
+ *
+ * When a non-AP MLD undergoes ST, userspace can indicate the current state of
+ * ST at the current AP MLD and target AP MLD using the STA flags
+ * %NL80211_STA_FLAG_SMD_PREP_TARGET, %NL80211_STA_FLAG_SMD_EXEC_CURRENT, and
+ * %NL80211_STA_FLAG_SMD_DL_DRAIN.
+ *	%NL80211_STA_FLAG_SMD_PREP_TARGET can be set in %NL80211_CMD_NEW_STATION
+ *	on the target AP MLD while creating the station entry.
+ *	%NL80211_STA_FLAG_SMD_{EXEC_CURRENT,DL_DRAIN}, on the other hand, can be
+ *	set using %NL80211_CMD_SET_STATION on the current AP MLD.
  */
 
 /**
@@ -4035,6 +4044,12 @@ enum nl80211_iftype {
  * @NL80211_STA_FLAG_SPP_AMSDU: station supports SPP A-MSDUs
  * @NL80211_STA_FLAG_CIP: station has Control Integrity Protocol (CIP) enabled
  * @NL80211_STA_FLAG_SMD: station has negotiated SMD.
+ * @NL80211_STA_FLAG_SMD_PREP_TARGET: station is prepared at SMD target AP MLD
+ *	(State 4a).
+ * @NL80211_STA_FLAG_SMD_EXEC_CURRENT: current AP MLD is executing SMD BSS
+ *	Transition (State 4b).
+ * @NL80211_STA_FLAG_SMD_DL_DRAIN: current AP MLD is in DL draining period
+ *	(State 4c).
  * @NL80211_STA_FLAG_MAX: highest station flag number currently defined
  * @__NL80211_STA_FLAG_AFTER_LAST: internal use
  */
@@ -4050,6 +4065,9 @@ enum nl80211_sta_flags {
 	NL80211_STA_FLAG_SPP_AMSDU,
 	NL80211_STA_FLAG_CIP,
 	NL80211_STA_FLAG_SMD,
+	NL80211_STA_FLAG_SMD_PREP_TARGET,
+	NL80211_STA_FLAG_SMD_EXEC_CURRENT,
+	NL80211_STA_FLAG_SMD_DL_DRAIN,
 
 	/* keep last */
 	__NL80211_STA_FLAG_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b06772ec8ac5..5df145ab4ab1 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -8025,6 +8025,9 @@ static const struct nla_policy sta_flags_policy[NL80211_STA_FLAG_MAX + 1] = {
 	[NL80211_STA_FLAG_AUTHENTICATED] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_TDLS_PEER] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_SMD] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_PREP_TARGET] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_EXEC_CURRENT] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_DL_DRAIN] = { .type = NLA_FLAG },
 };
 
 static int parse_station_flags(struct genl_info *info,
@@ -8091,7 +8094,11 @@ static int parse_station_flags(struct genl_info *info,
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_AP_VLAN:
-		params->sta_flags_mask = BIT(NL80211_STA_FLAG_SMD);
+		params->sta_flags_mask =
+			BIT(NL80211_STA_FLAG_SMD) |
+			BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+			BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+			BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
 		fallthrough;
 	case NL80211_IFTYPE_P2P_GO:
 		params->sta_flags_mask |= BIT(NL80211_STA_FLAG_AUTHORIZED) |
@@ -9308,7 +9315,7 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 10);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 13);
 
 	switch (statype) {
 	case CFG80211_STA_MESH_PEER_KERNEL:
@@ -9404,7 +9411,10 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 				  BIT(NL80211_STA_FLAG_MFP) |
 				  BIT(NL80211_STA_FLAG_SPP_AMSDU) |
 				  BIT(NL80211_STA_FLAG_CIP) |
-				  BIT(NL80211_STA_FLAG_SMD)))
+				  BIT(NL80211_STA_FLAG_SMD) |
+				  BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+				  BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+				  BIT(NL80211_STA_FLAG_SMD_DL_DRAIN)))
 			return -EINVAL;
 
 		/* but authenticated/associated only if driver handles it */
@@ -10128,7 +10138,7 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 10);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 13);
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_AP:

-- 
2.34.1

