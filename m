Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1E5221FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813252; cv=none; b=IczIPJKFpre/C2YxQlTjat4UzmY73Xv5heM+UBIugOE28FP/5OjURfBaAhgFcgwtW3uhvnvv9aKVvmOOf+EHKeNC50SvN2Z6PxifrRZk6m/96G9xJ2PR2Ejad06kI+HoW5WYSvv66mIrD3I/HoTyUXaacEXWLVKdA65E8Ux1srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813252; c=relaxed/simple;
	bh=9GUJmm0JnYOjtca2tQcxf9Y4BE+SaF+P3iTowK/ZOVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=js+zOMDFcCnt+1OBzdzCj2PU9u3I4HaxfDo4gUxmGUThrt8EzPxMcFN5+ok0QMf2rvP/u5l7glFhFjhJtWLPLQpIuPtTA/ykhzXCzhGfFSGZLWURGfY485gOH6d5GnZLtQ8AbXFxxTAKmQk8k1JKWB0D0PoGCd34HfxFgS7Cj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ddoh97ek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blKIGHxX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ddoh97ek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blKIGHxX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HX8Lw552303
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVk15Adnij0xzN+GSJBRJZvYMNQ2RQbb8lQpb3qcGW8=; b=Ddoh97ekoxO8K/6B
	vxZfoZ/3CldzvgdjITcJEd7yV1dzBOkbiv0FXPVLFWE3Juf/EmjMEDqq/V2zUBzm
	lewTzP5LNtbrrPSlak1OFSP6d14TWRtNPovoT9+G5OyP+eC9gThwb83sf4foG3GP
	0G5YWZ5wBfTf84wFCnWKqapAiCUTjvuVd5dOaFbKCwSQIkNuRYIWZ6Iahba3cfJG
	4d8SNUROtNKvGN4I4KhrEfI/hsMALB87P48NXBd8xyD5beB2OCO2MejS9qI7qNEU
	JZc8OOrylZBNlWeKWWZ2E4zmgRtuZwzAXu7Ly/czj6ZyT/Fm1bq7CntSzfMzFWH3
	ICnzyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwgfjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:34:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso354614a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813248; x=1789418048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVk15Adnij0xzN+GSJBRJZvYMNQ2RQbb8lQpb3qcGW8=;
        b=blKIGHxX+cFuqBZWHX+DUAwjqgaNBQ3OCOgRJ/EJLGaLXo0yY5EO7epCxtCh9xyjb6
         UIW9HaJCdaLOr51bojcYUdz5r9V+h21uJi+lQM5BkqX1AkTYj/QT0maAAF2+AYGqkFXj
         nCALd+nvnQj/rrImSsGATJWxEyzsAQFAlvZpylFnO6+j0DIrbWFeaU9HiTGoWaWhhifm
         eFjhtBDS+5a7S8J8T+zT0ZPYPjGpbO0vnNKz1QozDUdKEOkde8dpxg44YMceSurBMxf+
         skWvqmtF5Gm2fXR82JiKBF6z8Krde9RhRgq7XrqUYGfg7BCk0tu0lDBfjPFfe77H23wW
         Z40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813248; x=1789418048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVk15Adnij0xzN+GSJBRJZvYMNQ2RQbb8lQpb3qcGW8=;
        b=rrvrL+lYMcxfYaCnKp8GzTSjlwrcgBpBCnheeaiMAHZ8pvQ9oWa/v73PWfKVVQUKxx
         /e1iPPN9CDN2IAKwk4tohBVAWSYYcDd00LTNMT/nvHtH9iGWBCMi3nSplOjxXkXoK96J
         7O5S+5FYBKk9jDb2hVHZ16coKpajdy3btlGbjnzAZ7lIn91amDJgZRBgv/iGKNa60E/c
         3X5zBagvq5POHLIKmOKrni0DFogfKY/9iUjJV2MGVFi2Xknojtt9Enxj23L3ShULmNWp
         IYI9LYfzaozD/lIgVJez8DFAt+CKsKjsTyjP0M7bLPINbA7GPmCIFnWD7no1YV8oUBJI
         2JKg==
X-Gm-Message-State: AFuF++maDpw7mmJPNrW1666/ra2JHS/u/qtikNZqGYV0Va0ovjY0x9EJ
	x3Yqt0Z/Qk7UPYKXLEzcUJTGSpZD1JF2TT+8gCjYQdIyRH2pKR9cQoUf15lU1oDnIEnotUb7Y9m
	ialEsNPP9xnI/h4SmiVPDoi+aaYt6DZ7pzisP2kicjs9U78gE6KLze4/6Chl41mzP/A==
X-Gm-Gg: AYBFou3NNtD9fgslbWiX4OcQQM2UQ8mtNNLr72FJvkXcm3a194IZ1Vab6q46fEPrbaZ
	sawOrUrezCujLn6qhqEtOIfvGWw4uuXI7upQGePknO6ncyc4S/vhYNEu5mQoWRVuFMv/8YQjjs1
	ULwBHtYY0P0mHB4P3/zyZqSqH50yw6J2R1mIkZjX0x8suhXQzmo/t3NVeRm4A8sZHVK3sHIn31q
	Csa4I+NDVC4Ym6BPew9o0mHFzqktqVJr76TO2lPZnDiSQa0bVMFw2N7tYd38XQF8bPX7vmJTbUI
	Ibyg6wHoufjhD9O9VlJDgvBlApNwPlFST1106CfZqp/EcZKVOTarHYXZqC+XfUUo6tzZqSZRcU6
	pvwRssTBfq7EBLE0Oewqnl1TmZnKswY7vIkU5q6u4L7m+LgLQt5ntEUEwoiKL+Blx/6Nwii6HcD
	wS4Vb5sV4bSh6uSKQgAGuEhw==
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr41235093637.14.1788813247711;
        Mon, 07 Sep 2026 13:34:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr41235048637.14.1788813247274;
        Mon, 07 Sep 2026 13:34:07 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:06 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:23 +0530
Subject: [PATCH wireless-next 14/18] wifi: nl80211: Pack SMD dynamic
 context along with frame
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-14-65ad4ab30fbd@oss.qualcomm.com>
References: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
In-Reply-To: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9f1fc0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bhEJrp4yiY6RaB6cu_EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX4aH2dAki8BnD
 rtg1dhCF2RHj5JO10CSxKeWDyyj0MnFajSSemW9Ls0oMj5GvyCTfoSEkdcM1S7dUeA60q6mqE65
 ge672QuDQziAPvqinWgK3tOIL62blU4UFVd/fgp9qnWpcZ3vPtCS0WdiLGiS6XUhpw4namNV+Md
 GC83qxy1O2Xmsw05pH0lCjWuLmEqeN9zdOEWNXz+f6bgeD0TmMX74qkmJpTguVZkmj0k47vTbtK
 WhNdHxOVIrkRY/vmLQk1Ez9IkAAS745pdCoZvzotwZ54dR9a//BwPG3jaYqupoZj7GXcWe/DHtw
 r0c4qGoWfACtHA0fVcNOpRS7QMIqEojtfKdvKOt53W734DEza4gctf0CzSXzlMikzk16tfulmYp
 OsRHLNQiKT+3ZAPrwY9THAsujslunJaD9/dxu73Ajuq++TEaNVRwxJccIoz5Vo8uWxb/sveQSUo
 E4DyiEaDDVwNLq1B3OA==
X-Proofpoint-ORIG-GUID: QFAMcBJtH_t3Y9EH9krd-_-HgTFNzQGM
X-Proofpoint-GUID: QFAMcBJtH_t3Y9EH9krd-_-HgTFNzQGM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX0c/MeSCkWsur
 UkseT2Lp9uO9gzqK1w4POwyrcHZch4n56+qLuD+32G8K2LK/wyFLWmP+wmJW7/NTwliwTj3GRje
 0UyfDzxcPXbmfkH86/EWKI/r6dcd6Ts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070226

While packing the received management frame in nl80211_send_mgmt() to
send to userspace, nest the SMD dynamic context along with the frame
message. This shall be used by userspace to transport the context to the
target AP MLD for programming the dynamic state of the STA session for
seamless roaming as part of SMD BSS Transition.

Suggested-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
Co-developed-by: Aditya Sathish <asathish@qti.qualcomm.com>
Signed-off-by: Aditya Sathish <asathish@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 269 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 268 insertions(+), 1 deletion(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d59f0eb40493..5065dc75b0bc 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19568,6 +19568,265 @@ nl80211_epcs_cfg(struct sk_buff *skb, struct genl_info *info)
 	return rdev_set_epcs(rdev, dev, val);
 }
 
+static size_t _nl80211_smd_ctx_nl_ba_param_size(void)
+{
+	size_t n = 0;
+
+	n += nla_total_size(0); /* ba_params nest header */
+	n += n_dl_tids * (nla_total_size(0) + /* tid nest header */
+			nla_total_size(sizeof(u16)) + /* buff_size */
+			nla_total_size(sizeof(u8)) + /* policy */
+			nla_total_size(0) + /* amsdu_support */
+			nla_total_size(sizeof(u16)) + /* timeout */
+			nla_total_size(0) + /* ext_no_frag */
+			nla_total_size(sizeof(u8)) + /* ext_frag_lvl */
+			nla_total_size(sizeof(u16))); /* ext_buff_size */
+
+	return n;
+}
+
+static size_t
+nl80211_smd_ctx_nl_size(struct cfg80211_smd_transition_info *st_info)
+{
+	const struct ieee80211_smd_ctx *ctx = st_info->ctx;
+	int n_dl_tids = 0, n_ul_tids = 0;
+	u8 pn_len = ctx->pn_len;
+	size_t n = 0;
+
+	/* count valid TIDs */
+	n_dl_tids = bitmap_weight(ctx->dl.valid_tid_bmap,
+				  IEEE80211_SMD_CTX_NUM_TIDS);
+	n_ul_tids = bitmap_weight(ctx->ul.valid_tid_bmap,
+				  IEEE80211_SMD_CTX_NUM_TIDS);
+
+	n += nla_total_size(sizeof(u8)); /* ST type */
+
+	/* outer NL80211_ATTR_SMD_CTX nest */
+	n += nla_total_size(0); /* nest header */
+
+	/* DL nest */
+	n += nla_total_size(0); /* DL nest header */
+
+	n += nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_DL_SN, ctx->valid_ctx_bmap)) {
+		n += nla_total_size(0); /* DL SN nest header */
+		n += n_dl_tids * nla_total_size(sizeof(u16)); /* DL SN */
+	}
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_PN, ctx->valid_ctx_bmap))
+		n += nla_total_size(pn_len); /* DL PN */
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_BA_PARAMS, ctx->valid_ctx_bmap))
+		n += _nl80211_smd_ctx_nl_ba_param_size(); /* DL BA params */
+
+	/* UL nest */
+	n += nla_total_size(0); /* UL nest header */
+
+	n += nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_UL_SN, ctx->valid_ctx_bmap)) {
+		n += nla_total_size(0); /* UL SN nest header */
+		n += n_ul_tids * nla_total_size(sizeof(u16)); /* UL SN */
+	}
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_PN, ctx->valid_ctx_bmap)) {
+		n += nla_total_size(0); /* UL PN nest header */
+		n += n_ul_tids * nla_total_size(pn_len); /* UL PN */
+	}
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_BA_PARAMS, ctx->valid_ctx_bmap))
+		n += _nl80211_smd_ctx_nl_ba_param_size(); /* UL BA params */
+
+	if (ctx->drv_ctx_size)
+		n += nla_total_size(ctx->drv_ctx_size); /* Driver data */
+
+	return n;
+}
+
+static int
+nl80211_put_smd_ctx_ba_params(struct sk_buff *msg,
+			      const unsigned long *tid_bmap,
+			      const struct ieee80211_smd_ctx_ba *ba_tids,
+			      bool dl)
+{
+	u32 ba_params_attr = NL80211_SMD_CTX_DL_ATTR_BA_PARAMS;
+	struct nlattr *dl_ul_ba = NULL, *tid_ba = NULL;
+	u8 tid;
+
+	if (!dl)
+		ba_params_attr = NL80211_SMD_CTX_UL_ATTR_BA_PARAMS;
+
+	dl_ul_ba = nla_nest_start(msg, ba_params_attr);
+	if (!dl_ul_ba)
+		return -ENOBUFS;
+
+	for_each_set_bit(tid, tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS) {
+		const struct ieee80211_smd_ctx_ba *ba = &ba_tids[tid];
+
+		tid_ba = nla_nest_start(msg, tid + 1);
+		if (!tid_ba)
+			goto nla_fail;
+
+		if (nla_put_u16(msg, NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE,
+				ba->buffer_size) ||
+		    nla_put_u8(msg, NL80211_SMD_CTX_BA_ATTR_POLICY,
+			       ba->ba_policy) ||
+		    (ba->amsdu_supported &&
+		     nla_put_flag(msg,
+				  NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT)) ||
+		    nla_put_u16(msg, NL80211_SMD_CTX_BA_ATTR_TIMEOUT,
+				ba->timeout) ||
+		    (ba->ext_no_frag &&
+		     nla_put_flag(msg, NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG)) ||
+		    nla_put_u8(msg, NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL,
+			       ba->extfrag_level) ||
+		    nla_put_u16(msg, NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE,
+				ba->ext_buffer_size)) {
+			nla_nest_cancel(msg, tid_ba);
+			goto nla_fail;
+		}
+
+		nla_nest_end(msg, tid_ba);
+	}
+
+	nla_nest_end(msg, dl_ul_ba);
+	return 0;
+
+nla_fail:
+	nla_nest_cancel(msg, dl_ul_ba);
+	return -ENOBUFS;
+}
+
+static int nl80211_put_smd_ctx(struct sk_buff *msg,
+			       struct cfg80211_smd_transition_info *st_info)
+{
+	struct nlattr *dl_sn = NULL, *ul_sn = NULL, *ul_pn = NULL;
+	struct nlattr *smd_ctx = NULL, *dl = NULL, *ul = NULL;
+	const struct ieee80211_smd_ctx *ctx;
+	u8 dl_tid_bmap = 0, ul_tid_bmap = 0;
+	u8 tid;
+
+	/* ST Type */
+	if (nla_put_u8(msg, NL80211_ATTR_SMD_CTX_TYPE, st_info->type))
+		return -ENOBUFS;
+
+	smd_ctx = nla_nest_start(msg, NL80211_ATTR_SMD_CTX);
+	if (!smd_ctx)
+		return -ENOBUFS;
+
+	ctx = st_info->ctx;
+
+	/* Build DL context */
+	dl_tid_bmap = bitmap_read(ctx->dl.valid_tid_bmap, 0,
+				  IEEE80211_SMD_CTX_NUM_TIDS);
+
+	dl = nla_nest_start(msg, NL80211_SMD_CTX_ATTR_DL);
+	if (!dl)
+		goto nla_fail;
+
+	if (nla_put_u8(msg, NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP,
+		       dl_tid_bmap))
+		goto nla_fail_dl;
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_DL_SN, ctx->valid_ctx_bmap)) {
+		dl_sn = nla_nest_start(msg, NL80211_SMD_CTX_DL_ATTR_SN);
+		if (!dl_sn)
+			goto nla_fail_dl;
+
+		for_each_set_bit(tid, ctx->dl.valid_tid_bmap,
+				 IEEE80211_SMD_CTX_NUM_TIDS) {
+			if (nla_put_u16(msg, tid + 1, ctx->dl.sn[tid])) {
+				nla_nest_cancel(msg, dl_sn);
+				goto nla_fail_dl;
+			}
+		}
+		nla_nest_end(msg, dl_sn);
+	}
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_PN, ctx->valid_ctx_bmap) &&
+	    nla_put(msg, NL80211_SMD_CTX_DL_ATTR_PN, ctx->pn_len, ctx->dl.pn))
+		goto nla_fail_dl;
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_BA_PARAMS, ctx->valid_ctx_bmap) &&
+	    nl80211_put_smd_ctx_ba_params(msg, ctx->dl.valid_tid_bmap,
+					  ctx->dl.ba, true))
+		goto nla_fail_dl;
+
+	nla_nest_end(msg, dl);
+
+	/* Build UL context */
+	ul_tid_bmap = bitmap_read(ctx->ul.valid_tid_bmap, 0,
+				  IEEE80211_SMD_CTX_NUM_TIDS);
+
+	ul = nla_nest_start(msg, NL80211_SMD_CTX_ATTR_UL);
+	if (!ul)
+		goto nla_fail;
+
+	if (nla_put_u8(msg, NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP,
+		       ul_tid_bmap))
+		goto nla_fail_ul;
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_UL_SN, ctx->valid_ctx_bmap)) {
+		ul_sn = nla_nest_start(msg, NL80211_SMD_CTX_UL_ATTR_SN);
+		if (!ul_sn)
+			goto nla_fail_ul;
+
+		for_each_set_bit(tid, ctx->ul.valid_tid_bmap,
+				 IEEE80211_SMD_CTX_NUM_TIDS) {
+			if (nla_put_u16(msg, tid + 1, ctx->ul.sn[tid])) {
+				nla_nest_cancel(msg, ul_sn);
+				goto nla_fail_ul;
+			}
+		}
+		nla_nest_end(msg, ul_sn);
+	}
+
+	if (ctx->pn_len &&
+	    test_bit(IEEE80211_SMD_CTX_VALID_PN, ctx->valid_ctx_bmap)) {
+		ul_pn = nla_nest_start(msg, NL80211_SMD_CTX_UL_ATTR_PN);
+		if (!ul_pn)
+			goto nla_fail_ul;
+
+		for_each_set_bit(tid, ctx->ul.valid_tid_bmap,
+				 IEEE80211_SMD_CTX_NUM_TIDS) {
+			if (nla_put(msg, tid + 1, ctx->pn_len,
+				    ctx->ul.pn[tid])) {
+				nla_nest_cancel(msg, ul_pn);
+				goto nla_fail_ul;
+			}
+		}
+		nla_nest_end(msg, ul_pn);
+	}
+
+	if (test_bit(IEEE80211_SMD_CTX_VALID_BA_PARAMS, ctx->valid_ctx_bmap) &&
+	    nl80211_put_smd_ctx_ba_params(msg, ctx->ul.valid_tid_bmap,
+					  ctx->ul.ba, false))
+		goto nla_fail_ul;
+
+	nla_nest_end(msg, ul);
+
+	/* Driver data blob */
+	if (ctx->drv_ctx_size &&
+	    nla_put(msg, NL80211_SMD_CTX_ATTR_DRV_DATA, ctx->drv_ctx_size,
+		    ctx->drv_ctx))
+		goto nla_fail;
+
+	nla_nest_end(msg, smd_ctx);
+
+	return 0;
+
+nla_fail_ul:
+	nla_nest_cancel(msg, ul);
+
+nla_fail_dl:
+	nla_nest_cancel(msg, dl);
+
+nla_fail:
+	nla_nest_cancel(msg, smd_ctx);
+	return -EINVAL;
+}
+
 #define NL80211_FLAG_NEED_WIPHY		0x01
 #define NL80211_FLAG_NEED_NETDEV	0x02
 #define NL80211_FLAG_NEED_RTNL		0x04
@@ -22193,10 +22452,14 @@ int nl80211_send_mgmt(struct cfg80211_registered_device *rdev,
 		      struct cfg80211_rx_info *info, gfp_t gfp)
 {
 	struct net_device *netdev = wdev->netdev;
+	int st_roaming_data_len = 0;
 	struct sk_buff *msg;
 	void *hdr;
 
-	msg = nlmsg_new(100 + info->len, gfp);
+	if (info->st_info.ctx)
+		st_roaming_data_len = nl80211_smd_ctx_nl_size(&info->st_info);
+
+	msg = nlmsg_new(100 + info->len + st_roaming_data_len, gfp);
 	if (!msg)
 		return -ENOMEM;
 
@@ -22230,6 +22493,10 @@ int nl80211_send_mgmt(struct cfg80211_registered_device *rdev,
 						   NL80211_ATTR_PAD)))
 		goto nla_put_failure;
 
+	if (st_roaming_data_len &&
+	    nl80211_put_smd_ctx(msg, &info->st_info))
+		goto nla_put_failure;
+
 	genlmsg_end(msg, hdr);
 
 	return genlmsg_unicast(wiphy_net(&rdev->wiphy), msg, nlportid);

-- 
2.34.1

