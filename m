Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907651;
	b=0akfFCXE0SOvxZY2dgfPdHvsuRwfURId+xApqjoEUBzKK3GxV9PxmcfvTTSizwrIBaaq
	 ZwlBi/EcohfEMo2XZmtc3R0J0CZEpnB2kHEjHsuKQmYyvUhz/QX8KLUnQdbfH5HKYYIJQ
	 FUQHX8VGGY4EwjC5+40mf6eiCxY5wqv66+mhBmoEI0JuXRTgApf+84ALcdChSZHOyN0wv
	 4RJlWT0evuOcbQumqUzU+z4b2ngm90TBG9xWq4OI9bOigmgYYnD0+ansUUFfnLJEvFQkD
	 yeVhqb4wTF+9FtvkvPatkdTg6oMJ6UVhAWwnNyImfsMF2FV2QtTQNxuq8yUazfV26wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
	b=RIY3P6AY0pJNhJXcEPvMQRDpX+DeITjqEyzspas65rrqrQz05gzCX+dgySEQA/8qzN6j
	 3QIIHqroQLCZW93hpHxNZrtUmCz9Pewh4i2TUg2iVlrDPspA0Pa1iT9GHk4tGWxGcm6Oz
	 m+oWqHDiuszMrMb0/N/i451u6lr8b0kPETEbNbwoKGlJMUJX1IP1GNbwx0SYd3vJACv20
	 n3ObOValQOqQBmxgUqemm7lTwoAC5geLdLn9Y9h3ewCsV+SSfeibd5lNjvyECbZ3VteuM
	 hQ1XKlLl++qi1ZUXdi/VUvZNrePeJdHHRXrNcKCpnx0poFNTeOsIti9SUgifNY8LY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmqPqncP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kh5rzIQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1373060806B0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1373060806B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmqPqncP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kh5rzIQa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeBUv2513447
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=; b=OmqPqncPJPte7Mhc
	Cs620x8jSl7htevaZ2K6KSR3vqQHr2OLqqFSzRGqgClwf5Ee9+BdJdVUiZZRMlYh
	ReO08MgJugfaqy2Hfb8gE6eRPqNXtXvKWbYaBviq9pML+DN/BeLf4RiSWaaDCBvo
	7EzOm4EKE19liercYw+uGqWzlYNigfgOwPuGDr6OQdAWeb3SMbDhzuvdbFRnCjOC
	SIAyHlwYl/UbtbI526iByZ7CXNYJXkIqmE2p07U6QsRUpXEJNGfOg56Zue9CmJ4G
	7/IFmMaxwoerlTMMYEE3P59kPyaPvSxI34PF0CCWmCxJfd5WbyZhEz0pQofj+xC+
	E52Xsw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatbxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso4236721eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907650; x=1794512450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
        b=kh5rzIQavoowRQy+yCuUrYvigV4iQ9gjUuHw/ElCLe89/rmAqWALYaYzX7ulknJ1u7
         tuGxr8IuC/aA7eLNKWAYivbnrdphIg4ufmFK3DyNyaeDxUwoY6c7nkCIKfIE/9PisW0P
         dwV7APcPY6lPspWwEcUw2feAerbRC0MVBZsP3YWAp7FoGVLg4AVRjZ6nHLZXqFdImvls
         vCIlNpnVIrf1SPj47l2m7s9iLq1TiOjoAzfgh7OKCUFaJJ5CKs2ojrsgmjVOZLDraXrf
         fqOXVpBac6zSGPUMDBtl6DFdlfIN4HXl4MJOT6WygePmXNpXNBpSIBbqgmcVQYAyRhXE
         B/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907650; x=1794512450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
        b=k0xjRT+41q8k5YHf+1mbeZ2kJg1DJMVHy6vEBlOLV0rHLy6ujBGDASBf6b3GztkHvs
         7psiQVcCnnC5LAabLG2tqf7A6zdj4N8JIhkrP+4n/B2Q8zthWovsG0NHaNK0zuRnGRSl
         +VdORPgUos15OudwvCYiXDOGaxepZf/0sM90F/djKrfY5kRln2CfPENUoWOXw+EG92DR
         D5R1pbQJ/Sp0QMxjbR2T40v879Yz8b1ROjanDYbOYJuC/S0nEqIZL+9/GkmFLL8RRhrG
         96/8dgHMMAGcyRIxpQX9WYouH2GWpIJ3M5LaHM01ESYAZh1yCNbzzV922JllxG6I0DxY
         XEKg==
X-Forwarded-Encrypted: i=1; AKwUvBwY9dawieKjHE5Ry1rPYvKuf1FnB3dNVcAdPN+3AgHEZS9uMtFsKiSV1YYCGK8POXl5aj8MV5Sb44bdFbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dk+sNJMsi+E2xb4mvgyGdZU5KJP6sxZV+jJRlZGIrM0gs4LXQ
	vEZDu3uIz4ShG+H2IaKoZ1jhyJZL6Z53TGOlSIDSL8Rz4Qz2AI4LA4PHAZp4BHt4qPGhmyEUxSf
	ra3Q9qmKAZ7gX+t06C37xnkA2vf9kJrN27cChtcYxj3RycorGFkI6Zyv0G6eiOnA76/EJV1QYfw
	==
X-Gm-Gg: AYBFou260io/Uq4pHUhPyGhXDjHjcuHF3IzQSNykNO5yP4vDvokHFHLEoF28PU8UK7C
	jqrFfmkZVeGlCLU5lVbvz1jWxiwhwx9xcaKUy7zd1ptreMhYKpi/0CbjvHDwpiZsZKSyD8oA62e
	+JRMoEaDxsMV8t6SQLWPGK6VoSYDGwFKyH5S0YUepzGUYDHAfg7o7+VIJrS3I2TS+iQ2FVPhXuN
	g2aaEp/iCmrWGPbqwB0Ji67heqbZzHgo7X2sPx7vM9QqNB+mPjN8Dr/S/9tdL46UnKQrvNwhWb+
	6uNVbtBDVmTYOB4S3wNp9zluM1ZFqb90RiatzYK9VfpmQxWxiPpSlcj3Dl7IIzCJB/8xBaY+xGX
	Pg00w7OZb5CbriV1h+s+aTKt7joHEUwhfA5thq8rnDwWNAqhRVRzf6kp2cni6//JorBOItRhDhC
	jxe3GeW6KZgQZYlCwIUUYsdB0by30PKdx7iJjNvjunKEDHWM+DVhHXAS0VuDRjX7gzm53jeA==
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36f76023af6mr143628eec.9.1793907649639;
        Thu, 05 Nov 2026 11:40:49 -0800 (PST)
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36f76023af6mr143589eec.9.1793907648783;
        Thu, 05 Nov 2026 11:40:48 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:48 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:48 +0530
Subject: [PATCH wireless-next v3 13/21] wifi: mac80211: apply SMD BSS
 Transition STA sub-states
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
Message-Id: <20261106-smd-v3-13-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXx0PqtBrUWH62
 DDBZHF2brSSgvr3Fn1rN6JZBL1bQHA7tYe1lSl5SQZcntZ+OniZMTDS6EihfiMPbQUvFiLCNW8F
 Vt6sEOgh0m+Uvo6xK0nZt9640G2vSM8=
X-Proofpoint-ORIG-GUID: roJ_xrjiMhyKGcHuQIFFIoOFHZfdWXTl
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aecdbc2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S5cDeCcwn0inUhub9TMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX88fz0LzPjBTg
 oWhy4ge4b7VNVbWg+kwAY8fL+YyHVEi5dg5PB9iZZ2nWkweaKG/Hu8adnthW4VHCEJ2i4d89Dax
 YmVD5GONUAwUP8jW1yUq1e6G24s5lfaQTcDvajz2U0TNHrVYw6sZ/HvrXbHA08No45FcBB65phk
 kmkxqwFC1gTt/ct2Wb1neZ6VRnMzVnyNqUcx06AoBhvx96n4fp9vN2jXgfkxqDULrooMaO7q+ar
 kgRmWPVFcDFB44mXgO5zLuaiSCjr/Qx2g5SbnMY2FX8DMoi49mzxIoGFmWHqqZ5viXYYW3ipaY6
 0OXIhsL1GbLSzEF8gMGVKCb/Sj+/F58oUMwFylpsi5xFzzWiGkG9l4I7iR7kCApE+SRRoooRVdH
 QymWNsBsVcNv6yBU190Zjt1ZI0HbB2gyuhV+GQfkW02hwebQNnv0gipKLTQXmU+MK1yGHzyUQZl
 5pyw558avibFvJFaz5A==
X-Proofpoint-GUID: roJ_xrjiMhyKGcHuQIFFIoOFHZfdWXTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

During SMD BSS Transition, the non-AP STA MLD roaming from the current
AP MLD to the target AP MLD switches its new SMD sub-states. Capture
these state transitions to track the station roaming.

These are transient sub-states of WLAN_STA_AUTHORIZED with the SMD-ME.
The station remains authenticated, associated, and RSNA-established
throughout. At most one of the three may be set at a time; mutual
exclusion is enforced in sta_apply_smd_state_flags().

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/mac80211/cfg.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/debugfs_sta.c |  3 +++
 net/mac80211/sta_info.h    |  8 +++++++
 3 files changed, 71 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 37329d8748ae..1e0ef74a7420 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2704,6 +2704,55 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	return 0;
 }
 
+static int sta_apply_smd_state_flags(struct sta_info *sta,
+				     u32 mask, u32 set)
+{
+	bool smd_prep_target, smd_exec_current, smd_dl_drain;
+	u32 expected_mask = BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
+	u32 smd_flags;
+
+	if (!(mask & expected_mask))
+		return 0;
+
+	smd_flags = mask & expected_mask & set;
+	if (WARN_ON(hweight32(smd_flags) > 1))
+		return -EINVAL;
+
+	smd_prep_target =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_PREP_TARGET));
+	smd_exec_current =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT));
+	smd_dl_drain =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_DL_DRAIN));
+
+	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED) &&
+	    (smd_exec_current || smd_dl_drain))
+		return -EINVAL;
+
+	if (smd_prep_target) {
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+		set_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+	} else if (smd_exec_current) {
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+		set_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+	} else if (smd_dl_drain) {
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		set_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+	} else {
+		/* all flags revert back to none being set */
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+	}
+
+	return 0;
+}
+
 static int sta_apply_parameters(struct ieee80211_local *local,
 				struct sta_info *sta,
 				struct station_parameters *params)
@@ -2790,6 +2839,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	if (params->smd_params.smd_sta)
 		sta->sta.smd_params = params->smd_params;
 
+	/*
+	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
+	 * subclause 11.3.1).
+	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
+	 */
+	if (test_sta_flag(sta, WLAN_STA_SMD)) {
+		ret = sta_apply_smd_state_flags(sta, mask, set);
+		if (ret)
+			return ret;
+	}
+
 	/* mark TDLS channel switch support, if the AP allows it */
 	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
 	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index c2268f79601b..8071ca4c5f06 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -79,6 +79,9 @@ static const char * const sta_flag_names[] = {
 	FLAG(USES_ENCRYPTION),
 	FLAG(DECAP_OFFLOAD),
 	FLAG(SMD),
+	FLAG(SMD_PREP_TARGET),
+	FLAG(SMD_EXEC_CURRENT),
+	FLAG(SMD_DL_DRAIN),
 #undef FLAG
 };
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 54c4c613a2da..2e9bb2ab567f 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -73,6 +73,11 @@
  *	so drop all packets without a key later.
  * @WLAN_STA_DECAP_OFFLOAD: This station uses rx decap offload
  * @WLAN_STA_SMD: this station is associated to an SMD-ME.
+ * @WLAN_STA_SMD_PREP_TARGET: this SMD station is prepared at the target AP MLD.
+ * @WLAN_STA_SMD_EXEC_CURRENT: this SMD station has started execution at
+ *	the current AP MLD.
+ * @WLAN_STA_SMD_DL_DRAIN: this SMD station has started draining at
+ *	the current AP MLD.
  *
  * @NUM_WLAN_STA_FLAGS: number of defined flags
  */
@@ -106,6 +111,9 @@ enum ieee80211_sta_info_flags {
 	WLAN_STA_USES_ENCRYPTION,
 	WLAN_STA_DECAP_OFFLOAD,
 	WLAN_STA_SMD,
+	WLAN_STA_SMD_PREP_TARGET,
+	WLAN_STA_SMD_EXEC_CURRENT,
+	WLAN_STA_SMD_DL_DRAIN,
 
 	NUM_WLAN_STA_FLAGS,
 };

-- 
2.34.1

