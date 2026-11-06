Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951973;
	b=nsRQOSDAFbAvKKUCl1K08d8ujRENTAK3/Wx5DgTBfP6dTdi5LoIr2jitsFphpO0CLIC6
	 zAGw+65sOSt2VYlU0XHvrUWu05qXuDBHrG4jF9TgCjtt5e8Xss8AT+AUjxQ6ZrIo6ppce
	 sTm+oXPzJBlJb7V8AlwTDg45ovmbgJGhjiMvxXTXNbYR1il1zFKcXttKmQjlR9SZoJZH/
	 tDCYorb22cZvY+fDVAs6nbwASPcbB1WChlMfQ3sAdCfhRrmkhwTuwoMc+lNVxsASJKA4M
	 CLKXkNYGZ/LqoO6PSQmpSPaur3VNeKtbhJQywCwir7UCz1wccett1o4VqWbiGjn+kBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
	b=rvtGLziOmA+Dw/nGPl/6NISKAO0Af0zWq09/k37BGHG8rVlSg92T00s5vjRnksOKovBL
	 XW5xB2IPsARanGDjdB88u89mKN+knwnV5Q38bcL3cBG7Vz6H25Tuqsf6BSqYjCJiKL7FG
	 pzZK5S899MEtWKVcszZpOZrWbJfCDDNb9Qy8+Nc7WSDKBFb8l8BmnsamX6vKZO3TCr0lM
	 7lLXYFCScso8TImckEDeVfq7KLcICF6qk698+0AxzQB10tiItuAp4XSkvNOmAC3dbpVY5
	 Y1hvhYw5oM4em+SwZmy1I8QdZVroD8VdSlkczzVcrYR3mibRm++wE+bbH7jWAbOXJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQeu+2QC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuLp8sk7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A3606D817
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5A3606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQeu+2QC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuLp8sk7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkEv3883394
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=; b=NQeu+2QCx+Xxp89H
	oxEizQOObwut40jHWI7/JZw0sdfNzvCc7IhvfjfXImB0cSqzbbKS48Nw7jYPZgfJ
	8+OZ0apxnOdqRUZSWQyDC9Oyn+kkNyYvD+66vF8cZmmNm9CDmNfI6dOnbSY4LIzG
	Q1DX9589FrtON38nTtV4cH+iMmhvrDRTp1lY2OI+U4BrYyVlA5TaRWZZezUAhKV2
	wLd108Ygy4CfnHTLEm6tJd8ftZpfTmeYQ1RhzNxDzLEfDZI4k5KMnb9A2PMs97cR
	jzrXYKo0sEh4n2pQAr6KUK1gzXVQXClKQrGNr/Imw1MHsTOGRDxa7owy3wJAVr2Y
	IhC3WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1qvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so722424a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951971; x=1794556771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
        b=OuLp8sk7hD3B57B35hh3/dvE7/zBHx5nISOdtj/At/c+DuP+8iIDjq7Y2B8sNnWc2g
         1FunZ3FFT3yAr9Mi+LkPZPUKNToex6TvCdv1nNpRXWwrBUV1fjVH5PfpQR8OdzLl3sSO
         mPHCo05MAglN4kx6L16ho01R1PCqM46yR0Gg5WQbGUXvI4Hie2R/EsbNLYexYw+dvr+/
         eUUK02cr0eOnpTWx9Jaez5Lz1CZV2V7dLbJ2FHAlSvNv6vEtwo5c6rEloDCExeCM421k
         VKsSsxFkIyC5GPZB2zsOh4Wp5gcx/IpYs5gOkTGFxcuxU4jrTn8VC8y6K63NS3KZyFEX
         QJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951971; x=1794556771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL8DXAIT7yDv2BubEmDmdY3I/Rf9BQoPZisaiNGNqS8=;
        b=rjdUu9UTTaWn6G6x1J5QOvP82Anu0Mri5I53uGHMs0bZslIs+eXr6+mNK29xNiFOxf
         ZhRlG50tqBCT/4ZWxaOcqVPlDwEJc1v685WeTh9KgXNhoHbban3+a4X5AzheBE0jJMCm
         ts3gpSaVRPPgxdzqLTOVV2rZ40zdaovxP4VQHQb95vVLC6mWjZHSaxbw7bdaCcwo7EyO
         /exRepBfvY8Up/S1WfIEQdIENMX2gOlnrrIGCwidlaQzsZO7gW+qAsTTjdq5d27q5yVW
         RfEzN4V0WTVcrbPNBVd3RLsDEsHk4DDMMgpXFN0aq4+4DTLoGo/SmqlTs6R6NQ14+DM9
         7E+Q==
X-Forwarded-Encrypted: i=1; AL+hErG2eDzSOJ6n7RQjes48KWUHaYgZcYjJzQ2bKEJJ8pBmuDnQM9SlBHSOgv8btgPrxOadCuiSa1IpS8dDi/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j//SPhYyc2sjsYJkc9P1Sqqxw7rRbUmGebNGNbm/RD0HLHscR
	1kS0qjAzMn7s6o/k2bwU4JHZfIUF/uS4S+5nIevpuWSAbu/EONEMQ8dQBezPlSuJt/cjTYnp9iw
	mtdj1c+lvQaAkFDF1ltJHkKYUHIVpqSMrYxHjWAFypu94jMX++O+Qn1mgfwyDwnHhMg==
X-Gm-Gg: AYBFou0nBr99bSBrbnyHo4MZF0WYQECEXxKuA6uxoa1mgiPrSBBQDRgfPekzYN//mk1
	3wIlPIRkEkjkL0hsvZERQKsddfpaGFHJ9JBOHb3vbJHnNYfZJGDla3Jjxjejjw45Dh5jOsBF41u
	n2NhcEECHI7yodAkrvou9tJYk/HMG5+MlxHYrdGDTRyOrf3EOIE7Vb7dmVV87S5iswcAcHZQIQl
	rbr3ybs0o0DYMiIINf25XuUYn0NBcgN3hIvxz/YIT2saXDkcy5igl6qrZ1nsvI79h8pbe5GwKf3
	JhtYwXqbMGQjN9uUiTwQRYLNVBQEALW8UhL4bUAfoXMjted2TVcnZuhl+7Ih3tPWRQJKwRZMX6n
	XsuHjILnGC7l+Ppsoa5Q735tGf5IyPyg7MkThCZWYV7gyujnk1H0HeJQksDH+rUg+ULUKpinxFV
	aaGjtdQiyn4WQHZfy8qHTw4ahLeZjbbTd9+fmkaQvOMnDsKGkSF72wtooWhyWrusCmavcmBcI=
X-Received: by 2002:a17:90b:2d0e:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b0db6feba5mr1575015a91.47.1793951970473;
        Thu, 05 Nov 2026 23:59:30 -0800 (PST)
X-Received: by 2002:a17:90b:2d0e:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b0db6feba5mr1574995a91.47.1793951969723;
        Thu, 05 Nov 2026 23:59:29 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:29 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:39 +0530
Subject: [PATCH wireless-next v4 02/21] wifi: nl80211/cfg80211: define
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
Message-Id: <20261106-smd-v4-2-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _Ym_D72mEHYMv_iodWNA00Hn9nOQ7580
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0x3kYRHQ0SBy
 uWt49EqYuvxcF3KT0PH90cjPjSITCW39CXWHyo0LwDNZWByJLvwqx2NbwCdEC5jJXWofKxE88Dh
 BrrwkBF8d6L0+FvLS+3CqrHgqfKll+Y=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed88e3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VlmDqvKmGZdUKtkEw48A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _Ym_D72mEHYMv_iodWNA00Hn9nOQ7580
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX06l81uzaR0uA
 4VCnBLl74v71FBycYicnoT2P0C6DQwAw21Y1OTl/kbf2xYypbB+pBF/vVcm33Wnk/JOsxt9+6x9
 3wJESzcYDDHeyK9lL+P5ALffzt3o2k2HbZnhMpEYznoCk4sKl8x8VW1gzteAmAkahqeP6e4oPuw
 P7HeMEG3VBNl17t+SfvFf0bYHD/ZFmZW0L+Pvx15JOldnkeIshmAOBGIvY3nq0humk/SExtXglM
 ErsX+LZZerotv4wrPnY3uaROSgXT+0cA3m7i3AVSstCzk3xUn5CeaX9RsX1EwHI6JH+ejd65fe9
 Oz9qIDbLSymY1VnpNlinV2slcP6/v5oomr/w919FmpkHboupNhXgl4TtGzl7LvwZE6tCe23FZS2
 reBnqobjpIddyHwPXT65tNbjHP/P1I8S5XjK3dd+C6idlSnWN6FxofcjXIjVFX8GVG3VSBIVL9g
 ocg87iWqpWd2aXU9d6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

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

