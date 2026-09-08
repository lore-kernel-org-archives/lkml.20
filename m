Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194EC5921F4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887412; cv=none; b=aYFC+Y8rwa730u3H18cWUnTmiMsHn0fmZ7gyZs3ApCJNbLfyDyGm3hNxYHjnk8A3lTIx+NTmlDpio6w8LH6wJCyNynzK1ltRtsAeHQGKQSHVzjpyNe+MqzWhZiT2vrzOdSgmjxwWJKfOKBrhWGaYTfuSe7Gr2F3yvVeTS2ikQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887412; c=relaxed/simple;
	bh=ODuW2nybW3REfD8SbUhi8QOhAYOU2HQqcQkaxRn64Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/kW5ExAYC5aOkulcQBSR7TwFXFnnKJ+cg1Uqgq+FzQMZEhOmiKFIwWY2fbs6RMBG+VLI3j7XqqCVA5EhKesvcMKJTdj9r9Ss4Ww4zjL+X1kuutGqh9dxkHMO1dbpRZNdEbA4lD7vL3I4yid7S9fSPuhyXAnZ8FKpKKq+QH/wls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmeleVvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+XVyUwX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmeleVvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+XVyUwX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdXZa2899194
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 17:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4tTeUVXrP8PDX4fDGv3MD0jVy8bbBgnnC6+ayxYRRA=; b=fmeleVvcLmVg/F+L
	67ClZFMqSQOuWGLlkj0g/0Y2g6VTbZltqahkldxXSwRv7UPzf3qAsrroIYSmUONx
	sOYg5wntLKNSdlv0q3Kuf/f28AtfIY0m7OVMQ3QtsLJmSA2VovpoapJYcwFVHnFz
	EKiIWJeJLd/GDO5HJztDlN8YQQWNPssd8dPqIsz4YD0CJsU/6BK1+PdFWz28TePE
	meubVXNpG6YR7KKTgUjLrKXt37UPuUyryudKKk4HbLK1sCaM2o57AreZDtckJSe9
	Qw6TnzRoAAY4AjlpUa2jYo5KJS4EAFeft3NxvEjGcI0jamiW2DMYR0auwVPlk99m
	TdeJ3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvujvc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:10:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so6600055a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788887408; x=1789492208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4tTeUVXrP8PDX4fDGv3MD0jVy8bbBgnnC6+ayxYRRA=;
        b=Y+XVyUwXcuvKybd7cYGFw4Z+UbtnLFDr0L2W/XjlcNmUoDA3WNZ2kkN1dDTIYXirsq
         q3pJvBdAYr5vrBFyESshbskAs1/GTDNJW58rPCDu7IPnwpRkY21mlTJoyRFNqmZIF6/V
         jjiVw5LbPPwt6UBXODmU3z4c0jJY9ZOzd0TcfbDeVHNb/Y9ddt08bl8/l+WWtK7oqxz6
         1g7K1gGBsbVrgRk0XubdUYyqTLJjqtTkDNqAVSAV4/CSlmZNCRYogRkuQXha34lcMYaL
         iJAptBIyLaUqh8YsiE+88xkCy44JFRbkxuBOXI1pfiU+ncOweRi9hfXe+bgyUatGiEiB
         K+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887408; x=1789492208;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4tTeUVXrP8PDX4fDGv3MD0jVy8bbBgnnC6+ayxYRRA=;
        b=Y95lcUO33+r/S0u7LLwmPnNlDVcldE34QobMM0c2KaySGz+wBsBIHUtpuR2h1/xppU
         p5O3zV0DinVj4NgjdcrVwk5B6L4v8T2+3qLY2DdJfBh1miU5hCr7+VnfITnPh6Zh+BmH
         lqzvJylzkdpubOjtUKTS581bW/h2xcRAAk5NzmVWQINY17wvnH86/YpzfoEZQWgahOyU
         5BDeCMKu9WQ80DJlCTjYe/445b1hFlh7Hkm/5aY4an+F1RVoK6VdSaLbJkxmhUU5qyYX
         o94nh25MAai4EojeiHKifCk4N/8tyuestTyOjMChrU50kCAKzqwo0hw7zGx2fXAarJZf
         jjMg==
X-Gm-Message-State: AFuF++kNLPyrXjDpTn/MEzS23KVaOt6YbWGn4zLsQgFJEnr355IVDOMy
	PYTthOV8+oUQySWxrgxNEmgtwqJftblN5aSmkj/2IIP5ltFpvP3qQdr2MRxerEmWe1fcRhvrOKv
	HqvSCCMmXOJz2ueXqwgEiGStvlUIkiYsrsDatWJBfwvd5D891mk94G2RfiOjLXP70Pg==
X-Gm-Gg: AYBFou3jn9gUNctTERfK3fB5MSGJEQqSrV7JleUouKbW/DEfQ0eRQT/2PzIArBIo7vs
	418WCSsQRI7EIwtaV1jy5nnLgy5HvvQmeEOyup6VuAh0eiwhSWZk59fynW+pfzz82/vRCPNSWKy
	pLwOAwT3irnRx3wIlcmASUuXlcx0plvICw8qkYhJLS6CJ/hMSWRjig8jgHdFw0PlguQ+9h0bnDO
	KRQuMEd+EYJl5m/kor1ABJ3FGuV8zuvUihI24lSFwS6PK1xrLQCOwUHna1gCWpl3FTwDqTVOQ/N
	MCsE4yWJSH1wOQjIfu1Tez2J3HprsqEGPXgKqMWR+nF3v+YatDiFQVidlYYZVKyTuQ7rhY0R4Zq
	ZbZ3nlyj0CTnAQ6fV2kp/K3OWKVLERCF75j9+FHfAk38dmXTAnIdbQVOGe35BHl7FmC9eck4g8y
	TkhZA0IuwkF4uFEXLcCcbDng==
X-Received: by 2002:a05:6a21:2983:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3da3a03ccf1mr51867745637.17.1788887408415;
        Tue, 08 Sep 2026 10:10:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3da3a03ccf1mr51867662637.17.1788887407858;
        Tue, 08 Sep 2026 10:10:07 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31773675eec.4.2026.09.08.10.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:10:07 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: [PATCH RESEND wireless-next 02/18] wifi: nl80211: Define Seamless Mobility Domain (SMD) device capability
Date: Tue,  8 Sep 2026 22:39:30 +0530
Message-Id: <20260908-smd-v1-2-9fd2d876a1fb@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
References: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa04171 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-9rhnhb8Ej--qkh-m00A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: IFDsnimxhnf0XwgZ6YFiHS1Wzy5WUmv4
X-Proofpoint-ORIG-GUID: IFDsnimxhnf0XwgZ6YFiHS1Wzy5WUmv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX51JcveAzUHdk
 dMErk406Qnxu6bQhwbwWzNWhzFQZw1Y7fasAZAyaOESChiZg56O+cxLpxs+9f+KeTv8/6Jmeyn1
 5H8e6tI7u4UJi6mFZHHBIF9xi3PwdJ0wKpXSVD8rxNFQfS43cTjQlbTgh+1aAwhWCcuCml4aPKZ
 cMw+LEsavkxEd6qTEtEJblY7ytiA4T1ptA5EhqYOUummSXN6dLMDIrwx0BsmvBrEPwcknZR+AfC
 OPtR80RoOP1DHOQA1FSW/Pvi1JQdYU/qoilEE/z2Jpay96qnWyRPOpu1naRbLITHGgcnnuOcywq
 CDHG1dRBbLf9aaVFueJAOwDkgeucBRmzYhSMjt1JUs5OAYCnMt0C7rxcPzvFQEYLY6HEjRA9m6x
 cs3E1sPwbNWpaC/K/vRRMXIKwmGQ+lCQwPnD89WvoxTEWpQYB9IRey+3t3sLHtsgi8tUclgqU50
 fKCs6eExPncDVl6ObzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX+9FRUc14djE6
 P8oXjBitjq7wIOnKurNBsQuARCYYavxPo/4C0tgcBY2LJl0WzSxMwNLgOWjXNm5RdD+2v/qQPRj
 KxTkDZJw43nFpBabXnbj3mk0xmyMFjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080185

From: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>

Per IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16, an AP MLD can be
managed by a Seamless Mobility Domain Management Entity (SMD-ME) along
with partner AP MLDs to enable seamless transition of an associated
non-AP MLD from the current AP MLD to a target AP MLD. A non-AP MLD
advertising SMD supports association to an SMD-ME and SMD BSS
Transition between AP MLDs within an SMD.

Subclause 37.16.11 defines an optional capability for the current AP
MLD to forward buffered downlink (DL) data frames for the non-AP MLD to
the target AP MLD.

Userspace needs a way to be aware of the driver's SMD capabilities so that
it can enable SMD configuration and operation only on capable devices.

Define two extended feature flags
 - NL80211_EXT_FEATURE_SMD for SMD management and BSS Transition
   capability
 - NL80211_EXT_FEATURE_SMD_DL_PKT_FORWARDING for DL data forwarding
   capability

so that userspace can gate SMD setup and data forwarding configuration
on driver support.

Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index d8fefefc11a9..d9ce185b0ef1 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7114,6 +7114,15 @@ enum nl80211_feature_flags {
  * @NL80211_EXT_FEATURE_PROBE_AP: Driver supports probing the associated AP
  *	in STA mode using @NL80211_CMD_PROBE_PEER.
  *
+ * @NL80211_EXT_FEATURE_SMD: Driver supports Seamless Mobility Domain (SMD)
+ *	and is managed by an SMD-ME to support SMD BSS Transition in AP mode
+ *	and supports association to an SMD-ME and SMD BSS transition in
+ *	non-AP STA mode.
+ *
+ * @NL80211_EXT_FEATURE_SMD_DL_PKT_FORWARDING: Driver supports forwarding of
+ *	buffered downlink (DL) data packets in AP mode to the non-AP STA during
+ *	SMD BSS Transition.
+ *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
  */
@@ -7196,6 +7205,8 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_ROC_ADDR_FILTER,
 	NL80211_EXT_FEATURE_SET_KEY_LTF_SEED,
 	NL80211_EXT_FEATURE_PROBE_AP,
+	NL80211_EXT_FEATURE_SMD,
+	NL80211_EXT_FEATURE_SMD_DL_PKT_FORWARDING,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,

-- 
2.34.1

