Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC133DBD53
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217736; cv=none; b=YwbCvZgDajKl8Mtu86Js3yPqH8l1u0Sb9JMyc0u/GPqMbNcE/deER+HUy97yh045sVK7OgUt51TeZXymQG2e2rYdVWCYtB5A03dfbLkpfiySf4L1vTMrjhiLdZldQd1YV19Ci3Dh3I3V5c4ide3C7Zb6/Hxgp3gx2Vr3h4sVQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217736; c=relaxed/simple;
	bh=rsyg9OrxC2RSurVrwLyot/phk4aj8tlnPMYH8VeVBtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGV/MjpyIbPmUYs652tn4C1I+K65MoyiCBp0QNKX66B84JNBmYvrfk4F5Gfnxi66wJhQIrh8dgyfIMEjrFtOUg3taB8xlh2bzrVbtYhO8BbW7BUILkV/f0a3YsScStEESC+hnoYFUvVDQB8oaClAnpBzN5Tv9DHIdAx20b2rmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCRtEAwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPo2gEeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCRtEAwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPo2gEeY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2KKVa344735
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBkciKky5zjvb0Hg8dGSMjmVQWKMKuOxs8eQ0lWL6P8=; b=fCRtEAwtnONDGJpG
	ap5sT9C5CZyg1eJL0claRn41YeD6/NQSaZaNzTiSqkvT7cfTFaDSAerE2MAXmSj/
	KYIkN95sEmGtUnt+G6Y9BXle6zo99Jl+VQvAtURxV/4vC9kl/VsTyyD/RsItka6y
	LDqIUPGg2Y8SbNeczilvkSom4sF+2oG5kyz/So7e5SYvoC+OPn1YsnZC+9Zu+2m0
	DENr7PYFBNMLSj0h5TdwP+N/Ak3bovYWvsL2bptI5WPiMexAkd7j1Ik9gTwE3c+Q
	3UDttF1j9CdhFMdEiLV0O9k0LJFMaai4vwIfsa3vdBtotJCzfQLtmbe8ZNP5qutR
	VTNy6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr908jtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2909424eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217733; x=1790822533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBkciKky5zjvb0Hg8dGSMjmVQWKMKuOxs8eQ0lWL6P8=;
        b=MPo2gEeYb4ndlgJZJh1t6s7wSfyurbjltbnHXtTo89NC0FUIoOF0FvGCUZoD6CZHXl
         Tr6bqAM7Myvh/+pVtiBBvwV4SgzeFCOq36yHE0bLoQMEisQrHu3pb7mfVvPn40Sq5BhL
         fZjgkOSnBOxJYA2+6yywyqQ8cP/HpoWtmCLlIwKEyAgoWtllkrHJRQbKUtLWWr2Zbtts
         XOC/frWvFT9RDpOR2SRfNThF+eqV3Ut8WtMv2lky04pZI4IrfewKkHjptsI56IZM3wTI
         DQ3RWTpCh48b0Im1J5v5iixJCj/uHvOI/9PAF2rSvLauljNVEQxf1FQ2Rx63rAhaBS0N
         jHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217733; x=1790822533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBkciKky5zjvb0Hg8dGSMjmVQWKMKuOxs8eQ0lWL6P8=;
        b=EOa4NISFc7Ni4xOtANNM05ZhD0eJFw2QTHg0tgiRI96p3xXxfw7RU9AR5JVp7sDBuC
         S6SunFSaqZN5jRtjF3SPv/P6s3ZGjNtAhYeyAEOuOl51E+Jkrd8jRqIVJHpPbl13DkGi
         P8gpdu3sgAgNqTVpOs1TeLwUAEnOjC6NzceC5SnmvWtPDERFGMD5obb4BkTlVo1ZHBI5
         KVPEi4zy5eo6wLfLoY2cpEEgzu6E2b0YM/hc4oZc0oChAy7Z1lqMcoAymXhdcPxt4JoV
         ysCaGdCNG8YRlGoEOjngePSVmaKyNC4ui7O+5H0C86/iaO/WzAUEVuO3efShy4QaXEbN
         Zplw==
X-Forwarded-Encrypted: i=1; AKwUvBxmVjdXYU7gpLAFMRAPu9H4/sam836q4iiOXTpByW4Fv276L59ApkHDcTyqX3kAouL6Wrpm1sS/AUBHeeU=@vger.kernel.org
X-Gm-Message-State: AFuF++ns8qHyTGX0HL8SPWFrjTZOHgPWdshapsa1OOteZRHVzrc3339n
	LmehXQ/yZ9qmbxD5SLeQCtBCbSeYVguT5AtubiD9rpEaYxH5JyZg5wq09YDJILsNqbLkZYlLuTr
	y55gzbA+o+0SZdKApfM06Ia4aLzN8pkO6QJXL6QuGhrp9orjvEdKOv73xM5dTODPKvQ==
X-Gm-Gg: AYBFou0JWuBXtBYhNHQ+jIlH4Zx++2QtLNmn6Z9yCPb//GOdbHpr+G7EbLwmzukWQVY
	4ACQjBFionzTr7/4+NMtoL1b1EeivEUx8E017UCV40PUYYZ9SixkzRTiAjDDkmhyDfbk2fuNC+F
	VCGSP8/uxyjPZ4krZfxhBOCynSoUJHKUiXkOCZEsfsFiF5jbR6Cv9qyRGJlI9p5ID+3Ai/Ca1Nj
	WD15NMA7Agt51p1PaQ4eCvbORNMQZ9XKrUdd8kC9QUesUKaU2PpJQbfSN12yW7ClXC51zzh4Ggh
	Y4HMiUEOoH7iyNrQzX4eXKw+klfpm0PucXgRye9CHmko0X++FqRPPniLUrKZTfySD4c01/fYPQc
	vze2ydwXGleAsxE1bogq1TWB6WB7ckq6wdQGgZlt5oAvhLdl1o6NLR+vxg42HFRjHlV3zcLNjC4
	+P3+4VBU/V/rC/I2keQquEIQ==
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr795420eec.39.1790217732660;
        Wed, 23 Sep 2026 19:42:12 -0700 (PDT)
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr795395eec.39.1790217732013;
        Wed, 23 Sep 2026 19:42:12 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:42:11 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:50 +0530
Subject: [PATCH wireless-next v2 13/16] wifi: nl80211/cfg80211: Add support
 for SMD context programming
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-13-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX2kuxqsoXgit0
 FFbtUQtoHlyv4fBu/j+vgN58spHOmbSa0yed/KgCijZqUVu0ffDadgXeXdJKziTuiR0nYSpIBYD
 fsYRMbcfhUXRrMMGMDNEw6M1LfwD8M0=
X-Proofpoint-GUID: _DRHZ0VdWGmuM1C1cAdHNPslSq4q0BOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfXxu0UdQXNUlfK
 zMRvPxUTblfpEF8mfMZb5e6QchdK9UO59FUf4028ocknvJZmbxxAiqU5SabpJUmPyE7KG5VkRfq
 KhrX9Apw6OXGeWfb4JK1u49dgjcFd14oXLuV7qcPr15leUAunfIopIIIO5grkgqArgezXnTIcqJ
 kgw/biK7UzpovdRlmMrvkY0C6ynhiwiIvzMl00CDNnNoDrb4ElCxpfLCQKKmUY8gFV2qm2k5NmC
 FKsI+9oN+bbSlZSG+nwLqfWwqHZ4iJsPreuIiNGAEG1bkhCdEW+CNSFp//FOilLNb+83OKiVJIv
 pC7bUaxYSS68rx1gOGAfINapGNHPT+HCh4ASiXEXqDG4p/PxsLKhTHOWPj5Tw/R7z+UrM819EUu
 lpOgFo9q3PJSlcFH6tVOBlVBewMgcdYp83CMBDoafPEfDq7a5VY0Ak73CATgUUx6S5nCZLktKRy
 r8j4g+ClA0befx2bXnA==
X-Proofpoint-ORIG-GUID: _DRHZ0VdWGmuM1C1cAdHNPslSq4q0BOv
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab48e05 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4KCYKawKnagZyZotmBEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

On the target AP MLD to which the STA will be transitioning, the dynamic
context collected and sent by the current AP MLD needs to be programmed
on the TX and RX queues to enable seamless transition and reception.

Such data include Sequence Number (SN), Packet Number (PN), BlockAck
sessions, and any driver-specific data.

Add nl80211 support to handle NL80211_CMD_SET_SMD_CTX, parse the SMD
context attributes, and invoke the cfg80211 operation on the target AP
MLD.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h  |   7 +
 net/wireless/nl80211.c  | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h |  14 ++
 net/wireless/trace.h    |  47 +++++++
 4 files changed, 398 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 02fe733f0204..ab003692f00e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5331,6 +5331,10 @@ struct cfg80211_smd_transition_info {
  *
  * @start_pd: Start the PD interface.
  * @stop_pd: Stop the PD interface.
+ *
+ * @set_smd_ctx: Set UHR SMD context data for the non-AP MLD. @st_info->ctx is
+ *	freed immediately after this call returns; drivers must copy
+ *	@st_info->ctx if asynchronous processing is required.
  */
 struct cfg80211_ops {
 	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
@@ -5709,6 +5713,9 @@ struct cfg80211_ops {
 			    bool val);
 	int	(*start_pd)(struct wiphy *wiphy, struct wireless_dev *wdev);
 	void	(*stop_pd)(struct wiphy *wiphy, struct wireless_dev *wdev);
+	int	(*set_smd_ctx)(struct wiphy *wiphy, struct wireless_dev *wdev,
+			       const u8 *addr,
+			       struct cfg80211_smd_transition_info *st_info);
 };
 
 /*
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5dc9d654d6f6..550f65634480 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19842,6 +19842,293 @@ static int nl80211_put_smd_ctx(struct sk_buff *msg,
 	return -EINVAL;
 }
 
+static int
+nl80211_parse_smd_ctx_ba_params(struct nlattr *tb,
+				struct ieee80211_smd_ctx_ba *ba_tids,
+				unsigned long *valid_ctx_bmap)
+{
+	struct nlattr *ba_tb[NL80211_SMD_CTX_BA_ATTR_MAX + 1];
+	struct ieee80211_smd_ctx_ba *ba;
+	struct nlattr *ba_attr;
+	int n_tids = 0;
+	int rem, tid;
+
+	if (!tb)
+		return 0;
+
+	nla_for_each_nested(ba_attr, tb, rem) {
+		tid = nla_type(ba_attr) - 1;
+		if (tid < 0 || tid >= IEEE80211_SMD_CTX_NUM_TIDS)
+			return -EINVAL;
+
+		if (nla_parse_nested(ba_tb, NL80211_SMD_CTX_BA_ATTR_MAX,
+				     ba_attr, nl80211_smd_ctx_ba_policy,
+				     NULL))
+			return -EINVAL;
+
+		ba = &ba_tids[tid];
+
+		if (ba_tb[NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE])
+			ba->buffer_size =
+				nla_get_u16(ba_tb[NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE]);
+
+		if (ba_tb[NL80211_SMD_CTX_BA_ATTR_POLICY])
+			ba->ba_policy =
+				nla_get_u8(ba_tb[NL80211_SMD_CTX_BA_ATTR_POLICY]);
+
+		ba->amsdu_supported =
+			!!ba_tb[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT];
+
+		if (ba_tb[NL80211_SMD_CTX_BA_ATTR_TIMEOUT])
+			ba->timeout =
+				nla_get_u16(ba_tb[NL80211_SMD_CTX_BA_ATTR_TIMEOUT]);
+
+		ba->ext_no_frag = !!ba_tb[NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG];
+
+		if (ba_tb[NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL])
+			ba->extfrag_level =
+				nla_get_u8(ba_tb[NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL]);
+
+		if (ba_tb[NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE])
+			ba->ext_buffer_size =
+				nla_get_u16(ba_tb[NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE]);
+
+		n_tids++;
+	}
+
+	if (!n_tids)
+		return -EINVAL;
+
+	set_bit(IEEE80211_SMD_CTX_VALID_BA_PARAMS, valid_ctx_bmap);
+
+	return 0;
+}
+
+static int nl80211_parse_smd_ctx(struct genl_info *info,
+				 struct cfg80211_smd_transition_info *st_info)
+{
+	struct nlattr *dl_tb[NL80211_SMD_CTX_DL_ATTR_MAX + 1];
+	struct nlattr *ul_tb[NL80211_SMD_CTX_UL_ATTR_MAX + 1];
+	struct nlattr *tb[NL80211_SMD_CTX_ATTR_MAX + 1];
+	struct ieee80211_smd_ctx *ctx;
+	struct nlattr *bmap_attr;
+	size_t drv_ctx_size = 0;
+
+	st_info->type = nla_get_u8(info->attrs[NL80211_ATTR_SMD_CTX_TYPE]);
+
+	if (nla_parse_nested(tb, NL80211_SMD_CTX_ATTR_MAX,
+			     info->attrs[NL80211_ATTR_SMD_CTX],
+			     nl80211_smd_ctx_policy, NULL)) {
+		GENL_SET_ERR_MSG(info, "failed to parse SMD context");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_SMD_CTX_ATTR_DRV_DATA])
+		drv_ctx_size = nla_len(tb[NL80211_SMD_CTX_ATTR_DRV_DATA]);
+
+	ctx = kzalloc(sizeof(*ctx) + drv_ctx_size, GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	st_info->ctx = ctx;
+
+	/* DL Context */
+	if (tb[NL80211_SMD_CTX_ATTR_DL]) {
+		struct nlattr *ba_attr;
+
+		if (nla_parse_nested(dl_tb, NL80211_SMD_CTX_DL_ATTR_MAX,
+				     tb[NL80211_SMD_CTX_ATTR_DL],
+				     nl80211_smd_ctx_dl_policy, NULL)) {
+			GENL_SET_ERR_MSG(info, "failed to parse DL context");
+			goto err_free_ctx;
+		}
+
+		bmap_attr = dl_tb[NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP];
+		if (bmap_attr)
+			bitmap_write(ctx->dl.valid_tid_bmap,
+				     nla_get_u8(bmap_attr),
+				     0, IEEE80211_SMD_CTX_NUM_TIDS);
+
+		if (dl_tb[NL80211_SMD_CTX_DL_ATTR_SN]) {
+			struct nlattr *sn_attr;
+			int n_tids = 0;
+			int rem, tid;
+
+			nla_for_each_nested(sn_attr,
+					    dl_tb[NL80211_SMD_CTX_DL_ATTR_SN],
+					    rem) {
+				tid = nla_type(sn_attr) - 1;
+				if (tid < 0 ||
+				    tid >= IEEE80211_SMD_CTX_NUM_TIDS) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid DL SN tid");
+					goto err_free_ctx;
+				}
+
+				if (nla_len(sn_attr) != sizeof(u16)) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid DL SN len");
+					goto err_free_ctx;
+				}
+
+				ctx->dl.sn[tid] = nla_get_u16(sn_attr);
+				n_tids++;
+			}
+
+			if (!n_tids) {
+				GENL_SET_ERR_MSG(info, "empty DL SN nesting");
+				goto err_free_ctx;
+			}
+
+			set_bit(IEEE80211_SMD_CTX_VALID_DL_SN,
+				ctx->valid_ctx_bmap);
+		}
+
+		if (dl_tb[NL80211_SMD_CTX_DL_ATTR_PN]) {
+			const u8 *pn_data =
+				nla_data(dl_tb[NL80211_SMD_CTX_DL_ATTR_PN]);
+
+			ctx->pn_len =
+				nla_len(dl_tb[NL80211_SMD_CTX_DL_ATTR_PN]);
+
+			memcpy(ctx->dl.pn, pn_data, ctx->pn_len);
+			set_bit(IEEE80211_SMD_CTX_VALID_PN,
+				ctx->valid_ctx_bmap);
+		}
+
+		ba_attr = dl_tb[NL80211_SMD_CTX_DL_ATTR_BA_PARAMS];
+		if (ba_attr &&
+		    nl80211_parse_smd_ctx_ba_params(ba_attr, ctx->dl.ba,
+						    ctx->valid_ctx_bmap)) {
+			GENL_SET_ERR_MSG(info,
+					 "failed to parse DL BlockAck params");
+			goto err_free_ctx;
+		}
+	}
+
+	/* UL Context */
+	if (tb[NL80211_SMD_CTX_ATTR_UL]) {
+		struct nlattr *ba_attr;
+
+		if (nla_parse_nested(ul_tb, NL80211_SMD_CTX_UL_ATTR_MAX,
+				     tb[NL80211_SMD_CTX_ATTR_UL],
+				     nl80211_smd_ctx_ul_policy, NULL)) {
+			GENL_SET_ERR_MSG(info, "failed to parse UL context");
+			goto err_free_ctx;
+		}
+
+		bmap_attr = ul_tb[NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP];
+		if (bmap_attr)
+			bitmap_write(ctx->ul.valid_tid_bmap,
+				     nla_get_u8(bmap_attr),
+				     0, IEEE80211_SMD_CTX_NUM_TIDS);
+
+		if (ul_tb[NL80211_SMD_CTX_UL_ATTR_SN]) {
+			struct nlattr *sn_attr;
+			int n_tids = 0;
+			int rem, tid;
+
+			nla_for_each_nested(sn_attr,
+					    ul_tb[NL80211_SMD_CTX_UL_ATTR_SN],
+					    rem) {
+				tid = nla_type(sn_attr) - 1;
+				if (tid < 0 ||
+				    tid >= IEEE80211_SMD_CTX_NUM_TIDS) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid UL SN tid");
+					goto err_free_ctx;
+				}
+
+				if (nla_len(sn_attr) != sizeof(u16)) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid UL SN len");
+					goto err_free_ctx;
+				}
+
+				ctx->ul.sn[tid] = nla_get_u16(sn_attr);
+				n_tids++;
+			}
+
+			if (!n_tids) {
+				GENL_SET_ERR_MSG(info, "empty UL SN nesting");
+				goto err_free_ctx;
+			}
+
+			set_bit(IEEE80211_SMD_CTX_VALID_UL_SN,
+				ctx->valid_ctx_bmap);
+		}
+
+		if (ul_tb[NL80211_SMD_CTX_UL_ATTR_PN]) {
+			struct nlattr *pn_attr;
+			int n_tids = 0;
+			int rem, tid;
+
+			nla_for_each_nested(pn_attr,
+					    ul_tb[NL80211_SMD_CTX_UL_ATTR_PN],
+					    rem) {
+				u8 pn_len;
+
+				tid = nla_type(pn_attr) - 1;
+				if (tid < 0 ||
+				    tid >= IEEE80211_SMD_CTX_NUM_TIDS) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid UL PN tid");
+					goto err_free_ctx;
+				}
+
+				/*
+				 * PN length must be the same for all DL and
+				 * UL TIDs.
+				 */
+				pn_len = nla_len(pn_attr);
+				if (pn_len > IEEE80211_SMD_CTX_MAX_PN_LEN ||
+				    (ctx->pn_len && pn_len != ctx->pn_len)) {
+					GENL_SET_ERR_MSG(info,
+							 "invalid PN length");
+					goto err_free_ctx;
+				}
+				ctx->pn_len = pn_len;
+
+				memcpy(ctx->ul.pn[tid], nla_data(pn_attr),
+				       ctx->pn_len);
+				n_tids++;
+			}
+
+			if (!n_tids) {
+				GENL_SET_ERR_MSG(info, "empty UL PN nesting");
+				goto err_free_ctx;
+			}
+
+			set_bit(IEEE80211_SMD_CTX_VALID_PN,
+				ctx->valid_ctx_bmap);
+		}
+
+		ba_attr = ul_tb[NL80211_SMD_CTX_UL_ATTR_BA_PARAMS];
+		if (ba_attr &&
+		    nl80211_parse_smd_ctx_ba_params(ba_attr, ctx->ul.ba,
+						    ctx->valid_ctx_bmap)) {
+			GENL_SET_ERR_MSG(info,
+					 "failed to parse UL BlockAck params");
+			goto err_free_ctx;
+		}
+	}
+
+	/* Driver data */
+	if (tb[NL80211_SMD_CTX_ATTR_DRV_DATA]) {
+		ctx->drv_ctx_size = drv_ctx_size;
+		memcpy(ctx->drv_ctx,
+		       nla_data(tb[NL80211_SMD_CTX_ATTR_DRV_DATA]),
+		       drv_ctx_size);
+	}
+
+	return 0;
+
+err_free_ctx:
+	kfree(ctx);
+	st_info->ctx = NULL;
+	return -EINVAL;
+}
+
 #define NL80211_FLAG_NEED_WIPHY		0x01
 #define NL80211_FLAG_NEED_NETDEV	0x02
 #define NL80211_FLAG_NEED_RTNL		0x04
@@ -20183,6 +20470,42 @@ static int nl80211_set_sar_specs(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+static int nl80211_set_smd_ctx(struct sk_buff *skb, struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct cfg80211_smd_transition_info st_info = {};
+	struct net_device *dev = info->user_ptr[1];
+	struct wireless_dev *wdev = dev->ieee80211_ptr;
+	const u8 *addr;
+	int err;
+
+	if (!rdev->ops->set_smd_ctx)
+		return -EOPNOTSUPP;
+
+	if (wdev->iftype != NL80211_IFTYPE_AP &&
+	    wdev->iftype != NL80211_IFTYPE_AP_VLAN)
+		return -EINVAL;
+
+	if (!info->attrs[NL80211_ATTR_MLD_ADDR] ||
+	    !info->attrs[NL80211_ATTR_SMD_CTX] ||
+	    !info->attrs[NL80211_ATTR_SMD_CTX_TYPE]) {
+		GENL_SET_ERR_MSG(info, "required attributes are missing");
+		return -EINVAL;
+	}
+
+	addr = nla_data(info->attrs[NL80211_ATTR_MLD_ADDR]);
+
+	err = nl80211_parse_smd_ctx(info, &st_info);
+	if (err)
+		return err;
+
+	/* drivers must copy @ctx for any deferred processing */
+	err = rdev_set_smd_ctx(rdev, wdev, addr, &st_info);
+
+	kfree(st_info.ctx);
+	return err;
+}
+
 #define SELECTOR(__sel, name, value) \
 	((__sel) == (value)) ? NL80211_IFL_SEL_##name :
 int __missing_selector(void);
@@ -21084,6 +21407,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.flags = GENL_ADMIN_PERM,
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
 	},
+	{
+		.cmd = NL80211_CMD_SET_SMD_CTX,
+		.doit = nl80211_set_smd_ctx,
+		.flags = GENL_UNS_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_NETDEV_UP |
+					 NL80211_FLAG_CLEAR_SKB),
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 46849fe8d0b3..d33a969606d7 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1636,4 +1636,18 @@ rdev_set_epcs(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int rdev_set_smd_ctx(struct cfg80211_registered_device *rdev,
+				   struct wireless_dev *wdev, const u8 *addr,
+				   struct cfg80211_smd_transition_info *st_info)
+{
+	int ret = -EOPNOTSUPP;
+
+	trace_rdev_set_smd_ctx(&rdev->wiphy, wdev, addr, st_info);
+	if (rdev->ops->set_smd_ctx)
+		ret = rdev->ops->set_smd_ctx(&rdev->wiphy, wdev, addr, st_info);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+
+	return ret;
+}
+
 #endif /* __CFG80211_RDEV_OPS */
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 8c2a91b85c39..6234ceb9ebb1 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4405,6 +4405,53 @@ TRACE_EVENT(cfg80211_nan_channel_evac,
 	TP_printk(WDEV_PR_FMT ", " WIPHY_PR_FMT ", " CHAN_DEF_PR_FMT,
 		  WDEV_PR_ARG, WIPHY_PR_ARG, CHAN_DEF_PR_ARG)
 );
+
+TRACE_EVENT(rdev_set_smd_ctx,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev, const u8 *addr,
+		 struct cfg80211_smd_transition_info *st_info),
+
+	TP_ARGS(wiphy, wdev, addr, st_info),
+
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		MAC_ENTRY(sta_addr)
+		__field(u8, st_type)
+		__field(unsigned int, num_tids)
+		__dynamic_array(unsigned long, tx_tid_bitmap,
+				BITS_TO_LONGS(IEEE80211_SMD_CTX_NUM_TIDS))
+		__dynamic_array(unsigned long, rx_tid_bitmap,
+				BITS_TO_LONGS(IEEE80211_SMD_CTX_NUM_TIDS))
+	),
+
+	TP_fast_assign(
+		struct ieee80211_smd_ctx *ctx = st_info->ctx;
+		unsigned long sz;
+
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		MAC_ASSIGN(sta_addr, addr);
+		__entry->st_type = st_info->type;
+
+		__entry->num_tids = IEEE80211_SMD_CTX_NUM_TIDS;
+		sz = BITS_TO_LONGS(__entry->num_tids) * sizeof(unsigned long);
+
+		memcpy(__get_dynamic_array(tx_tid_bitmap),
+		       ctx->dl.valid_tid_bmap, sz);
+		memcpy(__get_dynamic_array(rx_tid_bitmap),
+		       ctx->ul.valid_tid_bmap, sz);
+	),
+
+	TP_printk(WIPHY_PR_FMT  ", " WDEV_PR_FMT
+		  ", sta=%pM, ST type=%u DL TIDs: %*pb, UL TIDs: %*pb",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->sta_addr,
+		  __entry->st_type,
+		  __entry->num_tids,
+		  (unsigned long *)__get_dynamic_array(tx_tid_bitmap),
+		  __entry->num_tids,
+		  (unsigned long *)__get_dynamic_array(rx_tid_bitmap))
+);
+
 #endif /* !__RDEV_OPS_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

