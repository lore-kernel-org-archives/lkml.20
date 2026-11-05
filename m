Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907626;
	b=WGmkgezi7uPii6USi91BS9UmBdZ/uMyN/Fmt4h8Sk1KifNdsuMNUuYZO2ycqQATYW2iZ
	 VDwEwr9o9dw/InC3O2bZIk0yKjQA/gijxOa9FwWpICYXawjFkeK7QlZUT0ZbLMLcIrarl
	 a8h8wFP1YXZ/aFFEaNl9I12pBSJuMtE15+ouHWxLbjyLGMPSNtsUHwmPI0WWgGrF3FtE0
	 UTIEXAt+906dA8ZI/Wyw17CTJYPwsS0+yY7fZZWiPHCjSjRw3ZWTg0Y9iqwI1rLpMADCJ
	 OZOr8cgfP5muF0+11iFCj2fgrXI/xx0shIn7s6WM/uphN9XJwDY+DVf3Ab4lbENhj7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
	b=GaUMkNkgQpgE15uxcT00xWCLBnwV/KcTGy7h+rpJIR4lb1d3Bp8Xj+bBabkGGY0OidB8
	 ZTffpYSi8CevK64s4d0JHjKM/v81pSWOt4O31t5OhC/+AjJF6dHT3jSynUD2lpQEn1An5
	 4XV8ZeA7KZ3vBsXm9DeC9W4iGxpQT+UQr4Cb3sp3/9yAlMJyIXRigeEl6nCos1z5Tre46
	 lgo76hpoZLQlO4HsFflocW0Fl0JjFEmixTvhWlRHyr4Uhb26HZwHsG+5u//26ublZf0jo
	 l+ao65XsSgoI45g0PjZx4WLUnK5x4K8de7R1Mrjui1dbcjMQ9HUpD4Ki2YRX4oc5LmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TNffLFtf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgTPdqG8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5921260741CB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5921260741CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TNffLFtf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgTPdqG8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeCG61474551
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=; b=TNffLFtfFqtm7+bD
	mvI5Zi1WarPw+MG6PoyZbWf5/r1X2K6nvq6idQofGySSaXEBA15+HoNiidr92TDM
	Xsll8jzUyOE4puSpq7nxqLuH9Dm7CtiW7HCLJgmEXG038jXfBUOXzbs0hZnztVJe
	Scib48+71MBOYGYgovYCPdfx2JdsUfOcCIUi6G9G3MPu8NZTtcQPxK3yQeZF821v
	TQjCGdR16N90lZtzc9pEN/pY14cycoMbtfRKWpehGR8FL0QGz8Y6yTV3RosAsWgR
	BHwwc38Sewb6zGRwEatYsyXPnRiDyjCJMLZtYMXguHGDlkQ+9punn78YrVuDzc+o
	nm4JxQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbfgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so585943eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907624; x=1794512424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
        b=KgTPdqG8TtxP5IZKoMvi8+jNKyMYanrALMccxABHxNl40VEKQhc+r+7NaLooRcCR24
         gVPclqhz8LxWQf8PG6zakedWBaQYT13gQ8Ac5XLDJwRa9QwFa47qywk3ZxsG/mTXRPbo
         //KfLP+kiXm1X6YeZmWjd6BPSivqkXS+dzP5Fz2rC4rdfDN87LbzVeVajLcpRrWElYyX
         AgkTC9VPRWR72u00o1BX46PHdeJs+uUhOaa0R4zoj+96ldQ+rfrlSzTDHB/jgy/o+t89
         aFMgLX2jA4LkUSXVIkmlrvdx1FNTnYW6H21CSaGLsRoQHHHj5WdylE+peYV/GVkMRCah
         94hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907624; x=1794512424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOOBmwb2awLC5YZHeWolkoldTxdZw54DrdIDJ8KDPFc=;
        b=FsIqczfXrOTEnVTQ3VmGjfsO/skuwUfZg0r6C1APs/YVE176K8eYhlS8URxZEMFv+j
         qH48pG7rpV0FN04gZ9gauRJWd+IktlvwxfYT4On62XM+rLGyxRqkjlVBi5AZYXtDTqIc
         P3p/tb5ZsezC1YBJY/vl47kRX8bDoJl8grDVzlR0vwRSFvXjiwyV0ZkbXuXs38gmiVFR
         E63Vi6fh7EaSYzZ1mZZ9WXL+L5jUIUuoJZcIC5ZVBIos9gKcTYY/pjWOyE11x84Xa36i
         vDfGLBJeYvH0+zaQndD+guPDZ0+LTSvx7sjjh97VuBACGMxGHVPAtR/bSTJIgOc8FjPB
         vrrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcf7gGDTDwdq+bq9L+8JD15TtIvtBgG9PHH1J9yih+9k93SRywwr5d0vSR7xGlMLTRpHsvkQFzNsAVu/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kaB3pVjJPp2T4yT2btwb2efqJKziVYqs1cd51dEtBpbblf8L4
	SJ9EeTg2N9mQykp8cDdcAPeVXoP4p6kbpOqD0QYeWg3XfBIuerSCU2bR+iqdRdEP4OxnhWBgzSd
	PV87qJZ5dpJlctSEvq0hwhFIknp0gZd2hz6MUfd8yvjvkpLOF6ywVv2w0g1B6YzeBb8B0W6c4iA
	==
X-Gm-Gg: AYBFou3g6m3pY8wng8UdOffBZlMiiJuC7ziarlAP8xJ44vwE/86+a5QCu6Xg9z5UiOT
	Tju2umd6hKiGerIDdCzAdIh2NN8ZIK0AOqXpyBLwSCJg1/cxFPV3y9Hu2wSbx7wfYVcNiDUn8pm
	lOJOWxiLuFeQFBeZdMk7N0J34F+D/EeUblRvaJGTw9z69RXKPlRBHmlp3R5KsXtgh0hqYVOxCZI
	9ImM29qyMqWeRsIwahMCd2T+OT7L+1U1JGN/O9zaW9ZuncK1e9RztmJYkqxHxrfT7aUQdi+h3WO
	gomKu4pzlbVIxaeJWI5LAJfYtrGtwG2hkYm2Baj88h2TOk1zRPHIY+BK8F1x+hquieknmmCpf/5
	nm/Ys/3+Cw1So+/ITuiFtdJnT2SNI78/+YIsOcRELOrv/Ips6AbR9vn0nBpuDFuSO1fiwHshcsL
	vL1hIUKVxWM3D2csyLkGohCO+MbZH23vk/KLPn1tPyJs6iq2fKilT//77MfaeZSKZorTZrDg==
X-Received: by 2002:a05:693c:62d1:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-36f723e9d36mr196344eec.5.1793907624023;
        Thu, 05 Nov 2026 11:40:24 -0800 (PST)
X-Received: by 2002:a05:693c:62d1:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-36f723e9d36mr196299eec.5.1793907623387;
        Thu, 05 Nov 2026 11:40:23 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:21 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:38 +0530
Subject: [PATCH wireless-next v3 03/21] wifi: nl80211: add SMD BSS
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
Message-Id: <20261106-smd-v3-3-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecdba9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=b90yJLNE8BgtmlcRjg0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: H1f5UXorpjhYRDyqrFtVwxs3igRnb-fo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXz/WdtD4Q61HJ
 POAhXxtJnXDsmjMlnw8/7MMOUyJgXkML7KsiQ5foP6jzv9ErBVD/XkkEP/U4e70wqaLDzL6Ckkw
 28hmD3iCEWO2Kp1FZ/lio8hhYn/wXLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXz0s7h/g1cKLc
 aNErgPovsrSKHj5rmHNls/K8Y16ljLi160wneLjty989fwE5T1K23u3OtzTe3kQinONWT+f+9KV
 5YgP+To5QBRnGB+kKOLqJF23vbV0O7dUTDS//Z8uFNQXDwskTQgB3Zz9fXKCFv4dKZv/8xpEPbt
 TSjWA+eh5i9Xa0naiAq4VU3fx5EnVyf5U8WIo85s3IA53yo4Bq676wM0lzVe9NxGGSnhUFQYPwX
 DBQcVRwNiRSbnr7HNpz2zn8ssij/ARMIA8HOgkdD2Pi6C15U0DWkAEXE0L1Cwo5JCx2302toXRr
 u+p23bwN752Ta5TcLQ+emYYvuvUpZhLsch1iHGn/PgaeYTzPYikrVDnCBx2IN52qWNYkkMxxEB2
 GWjFdlgW663YzkagSUfjflEKfOqrvSOi5GWwAT5rst94jTq3ja9P9d8/JMK0ChCQjZ/cHwfJKTI
 P/ccRSFEKeAaMvS3/VA==
X-Proofpoint-ORIG-GUID: H1f5UXorpjhYRDyqrFtVwxs3igRnb-fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

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

