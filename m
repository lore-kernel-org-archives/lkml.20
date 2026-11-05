Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907669;
	b=beSjX3sK8OiF8OJMKXD0VDW9BQHcS6bZ4VbNMoCcyuQirxUKN4PptO1KIRLrqSMeUGLQ
	 kLCknXC6zTk0c58NTor7sDKv6OKuwFaC12pMKf02gKWxa6ang0t/DH7IP3LcgPBvVZQV+
	 my99cCSKffLVyhanCLMUPQtRT/78VmF909pgTtAggJL5q5Tst4tMYH9lYGDAB3RQf3DTN
	 YD83brxKSqKghFjl5l3ePVhhMG58vDTRueZDcjAZOpxv74Bb511kiwDK6RkYnJ7ZQWTX/
	 GCeZZUMNFXWonRY7pyPq7dhEvw5FkhY2SPG2quYF2CpFPqXjqd19NXy3PDvNpm4N1TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
	b=hSkS01Wjj9MSyeWBAPmHhNGrUJP7qSPOjdm7EyI3X5ny7TOnTOBaXqnBAF/k2qVBygkM
	 sGYvQEBjgHeGaVuViVqMZ3R7ICjeWM+n7bOPZWE01Bm2jjck5AoRjkx5fs/E26cgEXhp0
	 /u4rUnt637sAvicfKuM/CpBkjmd9odEs8Fx0U335jj90nk1O5lHmwl1iTyaR30jzB0+Ef
	 g0iFISuBrasiYisAyiXG8oDv5wOcwsVHcsxaOCp/jU7t/oEmzI8pjxixnHfBQY+NnJhs0
	 wwzOQIrvHHkiY0yF5lqddIXOmJrtyVGCrEaTssU6hGAIqFiJhjq/mUR9SIdyjhOxc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7k7ti9W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6bA8hWw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3653608520F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3653608520F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7k7ti9W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6bA8hWw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeWEx924248
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=; b=I7k7ti9WYMTorFmH
	dqFiAuqlThzouwv9cehcjrynoD7cHIX9AIwiGG0vT3ousk1CQvYcwcmfITbSe7sB
	teqwjom/LGwEm4ajFBuElQsGmdxsec87a2tLBFyCVXg1c1ihoakfIhaQ4uBPtRoh
	lha8Zj0HRT0N8NTAa3takntb2FbHYXWDgmZR3nKuy3HccqyNGeZkeLFE0z0ILrjX
	zzdIpob560pFRr8Y5nbsaReXrD1QyyzQd+rl8OFhAoqqdEfGQdfMo0glphVO81Oz
	dmQayAX2FbjubIP4xJNteN5uxYeDcYk57MnozIFwX7Ha/fOOKlFHB+L3M5GZO/QE
	LKjblg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkthnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:41:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2750392eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907667; x=1794512467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
        b=F6bA8hWwX7QpLo7KPPBbN4ATMXj3hhSP71J0Y6YdIvpTJE5vZpU8u2s0W9auUTmDRh
         thO2MghVUsUICcG7RR/7oEAIFFOwlqNlI45gg6OFiSaNCrXQqsJKuMyekD5CCGe1LAbw
         pq6beMB0dK28yKlI1cLFKalFYc3ADehtNLe8LZZcmty0hRdJ658FWd53zl2uJd6G2RUd
         +RJ8E7HPGC6CaNbX3IhFazQ/XuFSsc77XlzETnpj4ltF/pkAZTUf30MKFKYsT6QFDxiF
         pUVnA23LVjyd2PHauHEh7Ua6/PCsB0sOpcUfcbFrIMdPxbDBJrDM3c/lPtePv2e95/Ff
         7kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907667; x=1794512467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
        b=OeEjroHdYgLkWwzbOmHGu6NEHoNWM9fhHbfa98suzT2ec9TnciMbc6MOGxODTSxiAM
         pPQvKtr29CPElflsIg7DxlLdcE9OhDfr3Rb+NnElFmO5EkNGhwmRYYyN6FoIYm1OupJr
         3/vVAHXVwztDNbDxdazEkXeVRA9niByq3rl0bq4lJfqsyD6tFLhwuAao9OZWTHCxQRAb
         u9jr8TnV4v+bkZ6qXTR6Ud/5CSj/WLJIH7xLky0+I+sotpA6dHK31V65zNCBHqcsfQjl
         BhQkYnyNqsJBdQ+oXdgo1jpgO8S8JkZww8ljcc0n8EuyDMq0BrgAnAnhw9nAXkug6Xdv
         AflQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6jTb6xsE5y+GqjwZbBHQm4eQ8lif1Co9PWMw9Spr6Hp3xN1Tzrs0xPmA6rJ+xZLuLBkGO50tkPij8WfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IIuM+0NtSii7SfnSoz4nDUbAwDm0yvsvzYYAEdxhrSglttKzf
	PyF3VvmD6NYwQ9WBMvYnI/rDDk4CJzqYIkQys0JbUEzq65FgCgERv36Vk3uZp0HoRXOy+EIblbt
	iqYfNsDVWzksqRxf1CEA7ovBbRp8/j4jkC+a+ajX/S/gufbPCWfdb1sqgAD/U8xdCh/vzlp79LA
	==
X-Gm-Gg: AYBFou1++UxSBsLCP61rrmxg/2+AWRKVV/938QKXTEYZb/D/0ZXYbdhn6P5ihER2DgN
	yTDgbdGDpEjOFXvpy4fF8jQi/gAgAHV1N7pxwfV9rGeldJuxSu6+OfPF3dhIVHUJGhkPxjSJsmE
	XO4eqYT4O7IXC7bdJjBR+RjyEIdRXGaLgpeqoVtFGSocw4y/WBYLqUlqmci3W2069X43dpX/TJk
	/gTXq8FwOiqIoNsgpId0B+OKU54ypG64m/bGKJ3Kp5mgWfpRtdglrZbmDrCRcEREZwD6ZX4z87h
	YiJZNgigdOkwvDTYcv4QHq8sALfOwsF5eiWEq4hS1+vuRQsrLHRuBgps/vApQuqSdrOAIx7h+kJ
	M09vxPyJHn96mlGsxGuJAo1QSemtU2PFJbHg4RtNQxRD8SHLUC6GHMIEwTD3AzdBc6+gamxg8bC
	NgoSD+fzrnkgRE5JHiMtEU1aJj3+NTPSUzG4wbt2oTCe2+EcGBH4qXRkscYKQpRxIDVfbItg==
X-Received: by 2002:a05:693c:2110:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-36f77100b75mr163275eec.19.1793907667058;
        Thu, 05 Nov 2026 11:41:07 -0800 (PST)
X-Received: by 2002:a05:693c:2110:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-36f77100b75mr163227eec.19.1793907666422;
        Thu, 05 Nov 2026 11:41:06 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:41:05 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:55 +0530
Subject: [PATCH wireless-next v3 20/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_GET_SMD_CTX
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
Message-Id: <20261106-smd-v3-20-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX9bBim1V/PT8S
 CxPZawUvVCPLi9HZuXbhDrpxN7LNwkLFKdZf1TitqYSzdK+ZmfcFwBg7iDlJUaAoaXPHMiuJYbD
 NCfgtpO29zlZlLRCcqllP5TtfWEJ1uqc+P4iemZmWURsp/zQr3oS+ZDZjAIJPHVh0T6qRkpMUeQ
 P0aDKbOttn/ioPWI82MGiyLhqLX1gKLAWjiv8N75k2sfh7za7VE3lkwr9ghHLBABORLAv7ukiDt
 Mx0QcfhjRJwq/ul5H0pgF1D5477I5VO4NjTICedKKV6NbHkHUdPVVnFpn4RMabDcpXG4N8EqPKX
 RYuPvinXUxqE0Y966NrnyIRGwkZ9ErmL/Wbv/dm36eBuIgievhlgZz7I+8+GZKzo2ZN4dJ+dfgK
 z7FLk3qViUi5zADUl9XqF9MllrwGl9y8x8yNYr0fAhabuZT6UnFbCkTE80LdLz2NpzNPtsafmFL
 cCBtk9n4FxqJ0IHMUMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8Efh3i8Cw5GA
 Uqwes9i4yzNNILER++JCAwZVsQTwmcSyTZjXYMUGN7mQ0yEFTGbxPdWFxqgWIWNOGIuMmaEBXZZ
 5ew6M05KD5hxkK3lY5ckxfc0WK2r5NI=
X-Proofpoint-ORIG-GUID: UpL_XjXpJwuwKi7KD15bpM9uT9kCoH6q
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecdbd3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=x9_SPualhOxJPIen774A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: UpL_XjXpJwuwKi7KD15bpM9uT9kCoH6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

cfg80211 supports NL80211_CMD_GET_SMD_CTX from userspace on the current
AP MLD to collect the station's context on the target AP MLD's behalf;
this context is used by the target AP MLD to program its TX and RX
queues to support seamless roaming of the non-AP MLD.

Add mac80211 support for the same to invoke the driver to collect the
requested station context. Since context collection is asynchronous,
the driver reports the collected context later via
ieee80211_get_smd_ctx_done(), which then packs the context into
NL80211_CMD_SMD_CTX_EVENT and delivers it to userspace as a multicast
event.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h    | 19 +++++++++++++++++++
 net/mac80211/cfg.c        | 36 ++++++++++++++++++++++++++++++++++++
 net/mac80211/driver-ops.h | 24 ++++++++++++++++++++++++
 net/mac80211/sta_info.c   |  6 ++++++
 net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
 5 files changed, 112 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 15d9a069ba73..d78b7e897230 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4817,6 +4817,11 @@ enum ieee80211_sta_smd_state {
  *	The callback can sleep.
  * @set_smd_ctx: Set the UHR SMD context for the non-AP MLD. This is used on
  *	the target AP MLD side to program dynamic context.
+ * @get_smd_ctx: Get the UHR SMD context for the non-AP MLD. This is used in
+ *	the current AP MLD side on behalf of the target AP MLD to collect
+ *	dynamic context, when the non-AP MLD sends ST Execute frame directly
+ *	to the target. Since the response is asynchronous, the drivers that
+ *	implement this should not store reference to @sta.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5238,6 +5243,9 @@ struct ieee80211_ops {
 	int (*set_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta,
 			   struct cfg80211_smd_transition_info *st_info);
+	int (*get_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   enum nl80211_smd_ctx_type type);
 };
 
 /**
@@ -8312,4 +8320,15 @@ bool ieee80211_vif_nan_started(struct ieee80211_vif *vif);
  * Return: 0 if success and non-zero on error
  */
 int ieee80211_encrypt_tx_skb(struct sk_buff *skb);
+
+/**
+ * ieee80211_get_smd_ctx_done - Deliver async get_smd_ctx result to nl80211
+ * @vif: virtual interface
+ * @sta_addr: non-AP MLD address the context was collected for
+ * @st_info: SMD BSS Transition Info (set @st_info->ctx to NULL to indicate
+ *	failure)
+ */
+void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
+				const u8 *sta_addr,
+				struct cfg80211_smd_transition_info *st_info);
 #endif /* MAC80211_H */
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 356c14eaa58c..26ebbc27dac0 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6388,6 +6388,41 @@ static int ieee80211_set_smd_ctx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	return drv_set_smd_ctx(local, sdata, &sta->sta, st_info);
 }
 
+static int ieee80211_get_smd_ctx(struct wiphy *wiphy, struct wireless_dev *wdev,
+				 const u8 *addr,
+				 enum nl80211_smd_ctx_type type)
+{
+	struct ieee80211_local *local = wiphy_priv(wiphy);
+	struct ieee80211_sub_if_data *sdata;
+	struct sta_info *sta;
+
+	lockdep_assert_wiphy(wiphy);
+
+	sdata = IEEE80211_WDEV_TO_SUB_IF(wdev);
+
+	if (sdata->vif.type != NL80211_IFTYPE_AP &&
+	    sdata->vif.type != NL80211_IFTYPE_AP_VLAN)
+		return -EOPNOTSUPP;
+
+	sta = sta_info_get_bss(sdata, addr);
+	if (!sta)
+		return -ENOENT;
+	if (!sta->sta.smd_params.smd_sta)
+		return -EINVAL;
+
+	return drv_get_smd_ctx(local, sdata, &sta->sta, type);
+}
+
+void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
+				const u8 *sta_addr,
+				struct cfg80211_smd_transition_info *st_info)
+{
+	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+
+	cfg80211_get_smd_ctx_done(&sdata->wdev, sta_addr, st_info);
+}
+EXPORT_SYMBOL(ieee80211_get_smd_ctx_done);
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -6512,4 +6547,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.nan_set_peer_sched = ieee80211_set_peer_nan_sched,
 	.nan_set_non_evac_channels = ieee80211_set_nan_non_evac_channels,
 	.set_smd_ctx = ieee80211_set_smd_ctx,
+	.get_smd_ctx = ieee80211_get_smd_ctx,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 530936ffa11a..7d23ac03a899 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1835,4 +1835,28 @@ static inline int drv_set_smd_ctx(struct ieee80211_local *local,
 	return ret;
 }
 
+static inline int drv_get_smd_ctx(struct ieee80211_local *local,
+				  struct ieee80211_sub_if_data *sdata,
+				  struct ieee80211_sta *sta,
+				  enum nl80211_smd_ctx_type type)
+{
+	int ret;
+
+	if (!sdata || !local->ops->get_smd_ctx)
+		return -EOPNOTSUPP;
+
+	sdata = get_bss_sdata(sdata);
+
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (!check_sdata_in_driver(sdata))
+		return -EIO;
+
+	trace_drv_get_smd_ctx(local, sdata, sta, type);
+	ret = local->ops->get_smd_ctx(&local->hw, &sdata->vif, sta, type);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index d4d1008887c9..a3e161d160f0 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1312,6 +1312,7 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 {
 	struct ieee80211_local *local;
 	struct ieee80211_sub_if_data *sdata;
+	struct wireless_dev *wdev;
 	int ret, i;
 
 	might_sleep();
@@ -1321,6 +1322,7 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 
 	local = sta->local;
 	sdata = sta->sdata;
+	wdev = &sdata->wdev;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
@@ -1390,6 +1392,10 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 	    rcu_access_pointer(sdata->u.vlan.sta) == sta)
 		RCU_INIT_POINTER(sdata->u.vlan.sta, NULL);
 
+	if (sdata->vif.type == NL80211_IFTYPE_AP ||
+	    sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		cfg80211_free_pending_smd_ctx_req(wdev, sta->addr);
+
 	return 0;
 }
 
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index c156e28fa07b..cdfacbc6e891 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3502,6 +3502,33 @@ TRACE_EVENT(drv_set_smd_ctx,
 	)
 );
 
+TRACE_EVENT(drv_get_smd_ctx,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta,
+		 enum nl80211_smd_ctx_type type),
+
+	TP_ARGS(local, sdata, sta, type),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u8, st_type)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->st_type = type;
+	),
+
+	TP_printk(LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT ", ST type=%u",
+		  LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG, __entry->st_type
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

