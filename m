Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952017;
	b=agjCVerwomKKYdhect1x5Aof68HJmQAgSHYSB/n4TSv/nW4XresjlCTq7VZ14zqhm6a+
	 wvT5iavxvOk4Y4els2A+3upBslPkQEgeovEO2g4gFQfYzqrEb/EfZn3bbN4slugbNskjf
	 BWg4Zhglm+ejdnG9N9rshj2O/zoLPRPO9X/Arc6YTcQIEvEcUNGnvIdcDnG+8fkz2ahUt
	 zeTXmV2BtHBhZ5Q+Ch7OvC9TIJgdYi58Xx89m0uYfRjs3ZOloOOgMWQpJz1+ch/uByDYj
	 2E7ut4m7owg2cU+GtxDyoSj2cy0v7H/3QSGSXXCHTX6BTb+Yj9j+P5NGtdlHKBI41FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
	b=jfO3GeEsbqBLj4Jt7lnVSyFdESy9yPAzuPdwabCrrmfUjoLJW2mo4YHCkoDoMpPm8/Wo
	 vkX95h0mwbvM413mUmfpGF35SypcBUnXypeBKwET2+MthgAyFIjjktaoaHWCRrhxKFpd9
	 tPBeH6JHDVxqqrBSGqCEVyoyhNt87l18KRVYrt+3z+OmiFJqWQNjI23iC/9S9GgX7z6Xl
	 dEF+eHbXf7vTc0o7ZnQ8J+zdUJIBj1DF+Bkdh45AkehACiIIr5SpyVdBHtMRJGn6IDV/B
	 H9/pvVJgI4Py+6JzZEyChEtVnr45PanooAJE8gKXB31Tqn0UgCwXO8sw+A1f0zNteyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LR1qLN/t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6MXPMKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CAF60A5BDD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CAF60A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LR1qLN/t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6MXPMKR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJRs1679455
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=; b=LR1qLN/tU73F3Gkq
	k8v0MxFRZ76oZ9NtwBSuhDPrkexkNtHP4sV4RroZ70A1inE6zZZkBZyc5FJpGEFL
	gJewIsCBx44zb7t7hOLuc6YYum1+fGxmjPg+xRyP1GOAsrApAOkl4Jv5KVB4NBKH
	r9LZ62OuSyAomAaJl7eZnKKwQ+CfxMbEDRWyYCrLB1D0LFGaauaebGVP6IT8d2aa
	EkNgiUoU1LGzgOZbOtAi4Og0R6hTa1ZFry1RAueNA+DvjyVjf60pTxNa/Fkhyglj
	mIc6bTmHMAH07XiY82sCm9LUgRnjk/sGJLUVErPdxR+R5pRcuNpztF+doFciDSGZ
	Vg6Esw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9qja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a098dbc7so358234a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952016; x=1794556816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
        b=S6MXPMKRogvMDAAcuY8iw6udsD3b9dq+vaS0BXJTrYj1fX4T5cYJRFCbZOLYIDv0RR
         phfbHklklvsT+iEscjKxs4hNopksVtCb8u/jSZ1SEMg8z9dFEpKiscYQlqgwKuU9Kkjz
         RSaaTtHflppZj9jOPgllOtKsvWa5pNfMUZxQP9ZYIMxmimTD0yr2HGr9hXjrV6NI+oJm
         RcS6PENH69+2MqRZ9kjQGe/gz+VFh2UjkG3UdquUuxEsjEEG/jeHK3SoKOZtIo1Wc6Ki
         zCD21omiTtFHcKoGNPKpakkm/l1deaqYVdM91AxVPtS+4O8JZ6+H2yUVsQGc6l/WGrjA
         bSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952016; x=1794556816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht8qswRASt6Dpn6fB59EfVd1NELAZcR/5Got491fMHo=;
        b=ggpRA/7UEotAMb2j51ihW6/zQ2s4Ssq9olOiA3/EwSdraLQ7py80nM5sY6V+fJj3Li
         wNDQ+NoslAI84BME7Bdoeyb+XMI8n/Z06gtrN6IiNIMT5yS+Wb80A+GVSKmvn6p41DNE
         e5lV9of84pqqshzDHJOHbMbaDcqfKuSzs/VYa/NrKcA55CfkEZ8kx6KSy5VqdDX8pSDJ
         Au1GLYjWVDGXQRvMTD7iAe/D24FBpM7vIJdHuo4R80p58DSzt+9W5+K8THywo7+uTQyS
         fbqadHlU+E16iDle1tQ/eMQVlfGhFwFlgkHd669fi3MB/mxsuGGCjpjnPcKgPMcXbKd9
         Nzeg==
X-Forwarded-Encrypted: i=1; AL+hErHajzTEAb4uL22HGFka3pdwyeh2nKrmLMwCxpbKpv+PWiFPqYQAItLw+AiyD/g+T61MGnIJNsDcMjc8eKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Kx170aJRS9BwWNyBwr7A8TQAtU5a+rJpShItYzSwLVDF3p0c
	i1899eFWISF4pfPTtR+o4YBqX47UEKKaEtIrl3Cb7iUzGx1SqYLvkPmGx1a2noddC0rjLTM4pSM
	DkxaLwfx9uGjnKm1UZdvW8/QoiiSCWHTI186QZAGbATOVsEyxkWsxrWQHa3QYJ13WnP70K5WIwg
	==
X-Gm-Gg: AYBFou0RsSFx1Q09L9JgMRX7yQa6nVbfxopUz5wwuNeOZZwI3iBy7fqQjJj9yWvnlfu
	cFSsHFktEse+cGDoFTMycBJaqR8kZzXI4tLsml6kuX4ZOFLYRYCpT2fbtFEOdi5b5U4/tGcETGe
	koAadafydqLdWK1sT1HWtmn5z6dm4zkIhHLXHhY9uQWnR/svKBu8jXYvlEMTZIWVrdyEcaPpRqT
	dagMsvSPYyfzYSlV8DqC0rkBhjiDHiy4cTuOWC9QJQUoBcvDUK7M1u1xGnmVynLv4x4tkTw+WBA
	z2L9qBTmiNpIfzBVBF2qOaGUMBcl4MEq0XbraeGqr8yqbKJzszA0iSJm5lrlMEJ6qZRkvwf7eZB
	eZv5Jfhye7DODXJsYz7SOfb5PzzdoPG1pkYEaez9eCQiYFrjRQbEF9ttw25BxXfwPi/Bx9uH93q
	+sH3IFyrp83q4NIkkFQVUoI7BVTFZASg1OLmL/H1ulzlvsdKuNRJDEH675ZEjqCg8xOTROutc=
X-Received: by 2002:a17:90b:384f:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3b0db6ed91cmr1591300a91.24.1793952015318;
        Fri, 06 Nov 2026 00:00:15 -0800 (PST)
X-Received: by 2002:a17:90b:384f:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3b0db6ed91cmr1591257a91.24.1793952014658;
        Fri, 06 Nov 2026 00:00:14 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:14 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:58 +0530
Subject: [PATCH wireless-next v4 21/21] wifi: mac80211: define API to
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
Message-Id: <20261106-smd-v4-21-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: FIsbQfL1SYoUXGjkz4jOPR5i47IeOo47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX6N1v5mrDwB1Z
 sai9wNjscZ1cWslxL8n2wz/7VPHnOIE0FWYvyoEc2EGx76dFAL0uJ5vQWruAYYK9H4IBh+XwP1l
 pGlydNtrZrqMXB67yXaKoxfaP25ThU6eOKWcPbsNxNUiBfh2YED84NcAsdhv3dOHF4ykyJx0nru
 M6kGbWgZTTil0+GEAr7+t4vt9o4hFDO/H1c99C3jheeb6bM29imeHkY3SlNL39o2ykGiS/uKQRJ
 rCLeg/oRIC1zbUSvA5OTwi8yMPlwgeyiRLJvO/m8UFLFRsHqPqeW9shNPCnQZSeJLPwHN7WVSzX
 m0yNt6en8vpTgBrA1oUouu3Vv+ySYWivm4UppDh+2X5dX7DnXT4NklUBiYaQouiK3lDVMZw3EnB
 SwidU4OxqCx6AqhooqXRWYh5ck+wGgpBLFos1/rcDe3bSv7K2fAu1OROg7W9Q4B05AxIqSduNg6
 TLguybW9csDw06pX/Rw==
X-Proofpoint-GUID: FIsbQfL1SYoUXGjkz4jOPR5i47IeOo47
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8910 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nYjsN70XfsUJIUWl-YQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX9Y53B/ygh33S
 +BEHEshjFeFMt3ww0+FMWJ09L2NLG7ovrxxaE1ltNxQYSWRrz3GsS4aiZyBu8FSOjzMqOlqY2Zj
 furneQfP84kQGucq77NeZJBW8ILz8Zk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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

