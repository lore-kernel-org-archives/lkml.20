Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907671;
	b=LKqw6i+wX28mr806S5jgY360nFIoOHuBQdXtGw8EHCcdOuaSrjxvD/2N0dkDLJhdVC8A
	 mZZnCC6VMP/TXhjCYb9aHwGATgsMsSnWLYmu5XV/dv59GSCuKymOjg7Bpdg4cpyiZ+Shj
	 rrnalbGalR3rWAHGx998023GdA6uvjet8TK1oXZ9A08xurpSa98ONKOdz+O/FZ4d0WDBa
	 3baJkHYYlRpNBLgYP+T1VL1CXJDD9p/wSIUtwr5Db7Aawmbma3e2roaDA5BzNokFgi1Xy
	 yqktaONnDzY6Olatxlq/j5H3IH3jiMzRRNLqbtqznDAxSuwvZ4PTZ2O80DbS1d1kKKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
	b=CN5k9Nr9lG+J9Az9i7Aw1btqfvIlkxI92+02BEnZbsahkNk/K11j5D2NsVs/Uan1waPm
	 a/RADpyl2K4vpQSk7kp6zR+sctIxuBJFY+kcM+0vz6Sk0G3pdsNwkua9+l/bIPyDWKokQ
	 yYKAwxaFvDZXwwhu/JGa0b51xBGQ6AUw5YDyn6hICNUiAeH7u4hh9ucuTeMKmLdyr87Uq
	 Po0z0CaJWuPGTkuNrTGTGLuvxISR/O1nCzI0ufnT/zfn4Q6XLn3gQJbzTapQvQ67QLj7G
	 W11Hphdh2WtKoupQsWGS3EKrHxDwfpEdGKDUqE2YoGILj4Cspf9NtaZkaOFD2SmV6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hM1BE/e3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pt83JV3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5896085238
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5896085238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hM1BE/e3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pt83JV3p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQ1v4075322
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=; b=hM1BE/e3nJb1yPVm
	gltpwBnCPer+CUKLxXhP/1o/+7CqKER9WtxwhJ7tOpdIJXhsmgOA8DTsrLFH3Jqw
	uvOak5QUr1xgMI+8u3YqjeFgoKOxcSPf9dqQMIwqr4xYj8YBDfK9nQpldLBP3mDY
	Bb+iv+OHqNArPPEpmiErzcld4R9hv00wFLTrw/XwRFFCz6dz1vjzfi9bMJpOKV8z
	R1j9Kt4EHNGZrH4g74HCjX/Xx/tcm4r8ckAxmtdVQje0OKsCzyIUJW+PSir3pKWx
	/q2ozo1g9R7hbGb66OZhIsnyWtuSPXd1I5H0VjSrmRUNU1+2hmxqYJTMxmGPHY1i
	WQjdhQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdt9cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:41:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso743011eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907670; x=1794512470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
        b=Pt83JV3pI6AdVVEfM5SLN5hEzQEJwEIUhxSnztn25scVC4ZNFpHtdFQVBQDmkaF/S9
         S4coHp7xWffzuk7F26amEt6A3uGQi9KvVVlO4R+ja1v+STLLY6+ElgQ6RxzxFZmB3m3r
         BGyG8V2vV385g0POU+WbJLPxT4BDc8eHeY0OKq2Ti58KfoUrPso5H2oEKhtgtwhP4+2L
         25YaaNrNzRVaW4cXxmijEdLeIUQR+QcC1jW9ymX3Q+SmQVJe/1oILM3oa3JWClfYw26N
         avIQLTn+5n+rCtfKJZGpxx2e0wK5C9xFXU/MJGRibgwAWk9Ig8hopgXoDKIGVqZoyjB8
         5w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907670; x=1794512470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
        b=To3SuVBH3Z4apuMjKBwxj33hBa4wv689O5Jz2w/O8n7AkQWhX1pgIVg+2AXv+XO2hM
         2pHvBIkbX9GgmjKc0G6BVuteLyc7eF/X8INOyHTMwti0+0z1ftIqbfiXncCh/U+bcIny
         87MwLTB9SclsqCLLwqQGc29zBVNYVO5m8o7Mn8JPxOaJn+KFZp4Gv2S9YnmpZI/i8F3x
         9Ons/22GyriwXB+Kflyhwk3LvjIi+dAvvc8pyxAjvwPLueCzrzkvBOeoi6VIzESsqMke
         0HD9UympYjQ8Tz85AO05rN3L6vceGgVQivA23FFzmfAJmHU/3x3fJzTxJItBCiHzPVc/
         wcVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcPPbIoM6eN/pXBmIqo4yDnF3DU1hj+SwX34qvgC6pX4EUHUGed5r4U5od0X2tPuQSN9BpxCZuSo/Wvzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CDIFsM+Puqu0nharq+yUgvx+o2Io75ii71hxznaqOby5ZV7Nq
	JDnzjkdO98SsaQoJ5WG2UtV4QWNwxzTETrptq2l68oF+n2HcYsOr/t5g/ynuj1xASKpWqza5GP/
	aVkoteCPvN6MBvo6Tv2EIxeZnvb8T1hwamhegYl5nthM8cmXDDfKXMTu86z+dPutBZg==
X-Gm-Gg: AYBFou3GCtIo3wFdmMeCWPAzYnusnSdEZcuQrvsZeVngehSuyUs3Pj2MzEMvC4bu0/u
	kaMHrIm+k7rCwT5vnbpwVkP7x6Mt3q4r3CPSDuGG+5J7CUbEtE78z7VJ0U0Z9jFaivFC3WncNFM
	3KWXAgg0ohEaNHfLkMcSmhSSQpEzv3wCg0zvRK9bH3tfgOGbd0lwKWaNMXreGRLqiIqZyM4lvk8
	qiewnCHq5zbvR+9MXTTygphu/midDWtLhfGVqimYAEaNAJXr9z5Rm/hxVPl9AcQH+ROHlBlCAT8
	9xd3D++dOiXRxXtjvzGg7Oc4EW8ekCGt0pfsN7pVKrwo5YDGWAPNZFeCBNFthjBl37uW2Ssr0lT
	GP0cmoGCyTgarGymOKYW3pfUHgtJf6TNPHpaMnL1bKeSRFBAqwLRdlNpMZ0279zgRrnlGMSkTf0
	jgfvH1FZc3hALWJoHgXs+mWqsWLb/w8EhDggknyO6Qku+36qIjL4vV0Cf7aLla9gN6kwdhSQ==
X-Received: by 2002:a05:7300:ae81:b0:36c:a390:8907 with SMTP id 5a478bee46e88-36f7611e32cmr181305eec.21.1793907669599;
        Thu, 05 Nov 2026 11:41:09 -0800 (PST)
X-Received: by 2002:a05:7300:ae81:b0:36c:a390:8907 with SMTP id 5a478bee46e88-36f7611e32cmr181260eec.21.1793907669049;
        Thu, 05 Nov 2026 11:41:09 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:41:08 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:56 +0530
Subject: [PATCH wireless-next v3 21/21] wifi: mac80211: define API to
 invoke SMD Drain Completion event
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
Message-Id: <20261106-smd-v3-21-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecdbd6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nYjsN70XfsUJIUWl-YQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -Qi4WKb--JEiOLZdL2DNyHH00Woy5ehr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX0aHcep2+Gt+6
 mgWKVRyeevAV/oURbNi+qzUbTCZ4hYCJV1pseHTNFPrXQcu3IxYu3sGrPfGMlxEWlzIrXza0zZ2
 OlOYVFd6u5GPZ57CDFNBOzmONlHFL4U=
X-Proofpoint-GUID: -Qi4WKb--JEiOLZdL2DNyHH00Woy5ehr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8NZ+I18FUQgY
 WI16/e67KeA2mm7pwskzGqdb1Cd7Og9eSK5boVOQQnK8DuNDpcVXtSxm7grjqQyJvvC4TeotX0w
 wiHk9qMxUC/eoSwTEdVFezWZpQvuoeR15FJSdZhJu/sZBySyiwkarsOeqojxfXJWUZVu8QXX8dU
 I/1pKz5UdUa7Y7aXuLYIfz8jviDhkOcA3Ntg/iw66mQr7twnzmvihkyf2IuWcUgdbixf45r5itS
 7zuVtEK2h0sxKiADFJPt23zptCgadgSjfL4ADgDF9Pjg1UAO7JGzYUwbNmnhxj4D85N7x52KQ6S
 CJwVmmAK+yB3MfDVEec973ooq91kFbPkB/eBtbnYsl/Q6jARmWI2d5MfgSQemLtv3lZ2zu50BJE
 gHZ0FK+CjH/FRySM6FdtcVuvOSl3eVOoXqTQl+u5bcwEb2pYTDNX3oiBCAVtD5XAzWvaVc8ebv4
 CAxuiX4BCp0EHyZiDsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

To indicate userspace the early termination of the DL draining period,
define an API for drivers to invoke the SMD Drain Completion event. This
API makes sure that the non-AP MLD is already in the DL Drain sub-state
(4c) in the first place to being able to terminate it.

Suggested-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h | 16 ++++++++++++++++
 net/mac80211/cfg.c     | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d78b7e897230..7dc7d1a7a1f8 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -8331,4 +8331,20 @@ int ieee80211_encrypt_tx_skb(struct sk_buff *skb);
 void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
 				const u8 *sta_addr,
 				struct cfg80211_smd_transition_info *st_info);
+
+/**
+ * ieee80211_notify_smd_drain_completion - notify downlink drain completion for
+ *	an SMD station.
+ * @vif: virtual interface
+ * @station: non-AP MLD object
+ *
+ * The start of DL draining will have moved the station to SMD sub-state
+ * %IEEE80211_STA_SMD_DRAIN. Hence, drain completion is valid only if the
+ * station is already in this state. Should be called under wiphy_lock.
+ *
+ * Return: 0 if success, -EINVAL otherwise
+ */
+int ieee80211_notify_smd_drain_completion(struct ieee80211_vif *vif,
+					  struct ieee80211_sta *station);
+
 #endif /* MAC80211_H */
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 26ebbc27dac0..0aafc7ac771c 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6423,6 +6423,24 @@ void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL(ieee80211_get_smd_ctx_done);
 
+int ieee80211_notify_smd_drain_completion(struct ieee80211_vif *vif,
+					  struct ieee80211_sta *station)
+{
+	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+	struct sta_info *sta = container_of(station, struct sta_info, sta);
+
+	lockdep_assert_wiphy(sdata->local->hw.wiphy);
+
+	/* doesn't make sense to terminate if we are not draining already */
+	if (sta->smd_state != IEEE80211_STA_SMD_DRAIN)
+		return -EINVAL;
+
+	cfg80211_notify_smd_drain_completion(&sdata->wdev, sta->addr);
+
+	return 0;
+}
+EXPORT_SYMBOL(ieee80211_notify_smd_drain_completion);
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,

-- 
2.34.1

