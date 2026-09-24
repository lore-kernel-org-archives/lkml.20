Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F23DA5A6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217723; cv=none; b=p2jz1kr+taD/nmldK+f1O66eeFPedXXF7JLIQIAJlntUL6idUd80BrBMsvOwbVYHUNjTjJuzuxRBuhJaCB8OiQQZFl3jZOC9aUF5ZuSFWSgLJKb6/ny+fLcHLPRCNIYsh8uFKKxSgX6C+pDkZFpP2eQaD63oNcyyq0hHAD5YsYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217723; c=relaxed/simple;
	bh=zbyBR0/Jr9XStvE0BaDp0KlvS9RInzUSbblgN86wdg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INY/Ltvkumz3yTM4zfuP7lKF4x6KRRFtxW+C5xMajcKAWG1GqY6JfoRHqi/3WwwHzL61+OrT3DsXFOii/ODeBdubcCqyJfGwjBZEkx9pEU+cNwW/gIH0C7FEgyEUSHbcyKc1iuzia3dNAEQpb/HVB2gs7njb0TpGPJK2lUpaC9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Or8N0oBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbBUZsTN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Or8N0oBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbBUZsTN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2Jsgs142910
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3zlRvBjmBzkNQjO8objmY5TsdSrJG/Xb50VUn46oCk=; b=Or8N0oBYDHG1kKgk
	mHLprfW34FPs8cQgFV5jCUHBNt0E1jHuypiHmxr9JUa1j1iqRwuqBwKFwRtnLJ/4
	wHeNOmsy1+sRojxev8Sh23av4cGJfsxAOr+5CtDsvJFTcFRkL1ZzhcwdXZeDONsh
	/RjoGH+GIOy6reCgjx5Bnl36mBld6XmDNpWX84copJVhRAyUHCZ1kGxL3LFobYNJ
	mt+kNnIUCcUZ/0F/K3oT81Z20X0Fn3CcJo+t7kBaP5GLExm+gPnCXZHySfuP9Oi5
	ZGXf113c0iIxL2r04UA+d5xxAI54BnRwgcy/VRUM8Cyw0OAAsbvlh1sr/G0Vc4Id
	h7B5xg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7kvj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33310847fcaso2831076eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217720; x=1790822520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3zlRvBjmBzkNQjO8objmY5TsdSrJG/Xb50VUn46oCk=;
        b=bbBUZsTNfjecDTBVesGmfLvBvK/Qv8mN6z58NtMScgaqCn3rZkgtSdWUAROpkjJj1A
         uT4nZ2mok8IICz5hnq824hafSIQnFHmcsNgY/KiDqLmDkgiA8VauJcnCYPosZpLx+CW9
         BxMSnWvXvM5gxfy8+6FEUyRE97kSdDqVzyzdDr3QMMftO+EC/SZhwa7S+uZ9vS1an7LP
         6R0oVBJZlNeK8jYvBylEDcoMb1LvJz8nCSMCg7rOhzsrc+qTB8LTfBaiQTdOguOEQKJc
         tC7rbZASvvCPYPKdjt+lvfR8sekDmdF3j4VGCqLsAmeE3SsQrE2ki9dMiPGLTdIuqW5B
         18ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217720; x=1790822520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3zlRvBjmBzkNQjO8objmY5TsdSrJG/Xb50VUn46oCk=;
        b=BRa26+1O34fqTuGxpfDuuyFV+ApDhedDDGC48NonsSZ5aFNBDcwXWGSkc8K7GnyRyZ
         F5tyZI2SgtGhVzx7Tv+hsbvJA6e9hBGkvEGT5HGM0vdFpBch1L7/smsU0BTvEFzeLIG8
         v/71C0YvR8k/UC/V4Tpr7SULWE93yBR3lwFu/OryRZ5tNEq80iUFxh7k3kDSpFZaUXen
         YZyWa8AO+5vJJSyJUIbl9Zeq68jS3WFHTRUy8ticcAKxAfTvSv74V6g/2eOxMsMxNAYp
         qVN+SM0OkYM/fb6Toh0ovFK0ms2dZ/LL4p0Z6QuIPgLmZUATG30HMh8dt/7rjgZaTAjx
         pHAw==
X-Forwarded-Encrypted: i=1; AKwUvBzsSDYdyZpy1i1o5JYX1/cFwxqDGQ38ZgY6WtQnz3i3e5hXKfWrHFDwSkhy5xwkHH32Jq8UB+o+f3KUt0w=@vger.kernel.org
X-Gm-Message-State: AFuF++n6GyPMYpqJWNRj1/c/qxQmJg8airMccOR2ayoJKSzbV5eAc/OS
	h2fZywY5lJL1IVInBHmzYic1sf6nYK68RJ0a1WzBGMntlw5eGSedfQiMJGN53S7+emnJ9rmtZ1E
	nvrQjJoFIKPafUsept855I+j6R+3DgNC/sWxe7BYv7zeQZT1riKo0L3riCBGaNcrgCg==
X-Gm-Gg: AYBFou29kO5BhhHdZc0aN3TQtG1cpOrO1HZ1pet6MkkizIndmhKEzt5IwUmDqXrlDqk
	7d1xzLuIz7RuzvGx4tOmnuPRltOyPI0RkzvMcqpF6qcQo5dyrp66dL5Q0lF8PVXyXZNm9Acnyg5
	Wkq2W8BUl205YzpMju0sQX/c4OoGSWwz+Z7gVv+K8PVbubMgimNLiUYyXk4Cveh3e5En803xErt
	Fu6hyze6vxP/FDJ4VIetJPpl8JcDmOr2mmWIob6wVxeV5m4GeOtqLURL6/Vbhc/h6jQ/IbhY7bo
	scvbuUJAy62wszMuu4sxvENzqcAg2jxm62UTa4uq+hmkBWrLhzi5KS0QrFf4rIOaOXe7c4TfOJd
	7ZjZORBpA8YYm9osejzLW++ezCC5VT47aDlkDawAVRzxk8Muj5FS2zJJBJWnxc2KceCVt5VixTb
	tVf3y1D0kPeT1nAR5pct1FUw==
X-Received: by 2002:a05:7301:4208:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-33ffe74cd9emr649862eec.6.1790217720242;
        Wed, 23 Sep 2026 19:42:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4208:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-33ffe74cd9emr649849eec.6.1790217719424;
        Wed, 23 Sep 2026 19:41:59 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:58 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:46 +0530
Subject: [PATCH wireless-next v2 09/16] wifi: mac80211: Define layouts for
 SMD BSS Transition context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-9-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: uX5Yi32rL0s574kUEe8I2PUJLD08mjR1
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab48df9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q3cHp_LDBd8SisU_aE8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX9B4IkV+l0COW
 bUBV/9rvziTGPuai9T+2HrObJjnj/Vy5iv/A9x23P4GichVx4Y/35vZ1FZnmCnEWL9k/BISFuKA
 drS6mPTYaC1AiX4nb+Vm4OiCkzTLhCSwfAzAnTIhTQxnOi8MAigGr+4zi9exNEEt9wZOSZ18N0M
 MHsh57EQcDd2TfpHNDvx2rjlI87jlLn5RZUq7L15O1PpmsGfBUU2wEt0DI9ir+iemonHguOjFIa
 QzQ6hEffhz1KslYAWPjUNE8aNdswr+K4V5sJGlOa+/Za7YeZt4g6auzQjFGZ+ZZDnPZceRHh4Zj
 OMvcpRgKoul2gx8VLhucXbgVEY2BDtCDBpNNhMpkRpdvGE9mdO8tSyj4FCWxyMTJH3mtejXvXxn
 b/ys3hhigMj25Q+ZPiVbkYn2xVCm3Xxw6dphFJ2fGCBrgLiI0DcBXB1g8ixQryppEHYTSuiheR3
 pIJIq1YKdh/LLnWMy/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfXyLA/QyFlqUPw
 GTUoQxX0h96v3WPEdIAKJ9s3fq3ui2Ig2J0KA5NJqUAGBxDqHXIX71PyGHznB8psl9boK89jQL/
 mdv4u9OaYTj68Jh6vxkqjteAdh+sUXI=
X-Proofpoint-GUID: uX5Yi32rL0s574kUEe8I2PUJLD08mjR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9, defines the context
data to be transported during SMD BSS Transition (ST) laid out in
subclause 37.16. The station's context data is attached to the ST
Preparation or Execution Request action frames so that userspace
receives the context along with the relevant frame.

Define the context data: per-TID sequence numbers (SN) in downlink (DL)
and uplink (UL) directions, packet number (PN) in DL, per-TID packet
numbers in UL, and per-TID BlockAck session parameters in DL and UL;
along with this, define an optional driver context. This data is used by
drivers to report the context along with the frame SKB.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h | 86 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index c3f87d4c8bec..e6aaef9ae9e6 100644
--- a/include/linux/ieee80211-uhr.h
+++ b/include/linux/ieee80211-uhr.h
@@ -649,6 +649,92 @@ struct ieee80211_uhr_mode_change_tuple {
 	u8 variable[];
 } __packed;
 
+/*
+ * Context information carried in SMD BSS Transition (refer IEEE P802.11bn/D2.0,
+ * Aug 2026, subclause 37.16.9.
+ */
+#define IEEE80211_SMD_CTX_NUM_VALID_CTX    8
+
+#define IEEE80211_SMD_CTX_VALID_DL_SN      0
+#define IEEE80211_SMD_CTX_VALID_UL_SN      1
+#define IEEE80211_SMD_CTX_VALID_PN         2
+#define IEEE80211_SMD_CTX_VALID_BA_PARAMS  3
+/* Positions 4 to 7 are reserved */
+
+/*
+ * Data TIDs transported in the context, IEEE P802.11bn/D2.0, Aug 2026,
+ * subclause 9.4.2.364.
+ */
+#define IEEE80211_SMD_CTX_NUM_TIDS 8
+
+#define IEEE80211_SMD_CTX_MAX_PN_LEN 16
+
+/**
+ * struct ieee80211_smd_ctx_ba - BlockAck parameters for DL and UL
+ *
+ * @amsdu_supported: Peer's capability to support A-MSDU within A-MPDU.
+ * @ba_policy: BlockAck policy (0 = delayed BlockAck, 1 = immediate BlockAck)
+ * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max 1023)
+ * @timeout: BlockAck session timeout
+ * @ext_no_frag: ADDBA Extension fragmentation support
+ * @extfrag_level: ADDBA Extension HE fragmentation level
+ * @ext_buffer_size: ADDBA Extension buffer size; combined with @buffer_size as
+ *	(@ext_buffer_size << 10 | @buffer_size) to get the full reorder
+ *	buffer size
+ */
+struct ieee80211_smd_ctx_ba {
+	bool amsdu_supported;
+	u8 ba_policy;
+	u16 buffer_size;
+	u16 timeout;
+	bool ext_no_frag;
+	u8 extfrag_level;
+	u16 ext_buffer_size;
+};
+
+/**
+ * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
+ *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
+ *
+ * @valid_ctx_bmap: Bitmap indicating which context fields are valid;
+ *	bit positions defined by IEEE80211_SMD_CTX_VALID_* constants
+ * @pn_len: Length of PN in bytes; varies by cipher type
+ *	(e.g. CCMP (6), GCMP-256 (16))
+ * @dl: Down-link context data
+ * @dl.valid_tid_bmap: valid DL TIDs for which context is present
+ * @dl.sn: DL SN per-TID to be assigned next
+ * @dl.pn: DL PN to be assigned next
+ * @dl.ba: DL BlockAck parameters per-TID for the BlockAck session
+ * @ul: Up-link context data
+ * @ul.valid_tid_bmap: valid UL TIDs for which context is present
+ * @ul.sn: UL SN per-TID to be checked next
+ * @ul.pn: UL PN per-TID to be checked next
+ * @ul.ba: UL BlockAck parameters per-TID for the BlockAck session
+ * @drv_ctx_size: Number of valid bytes in @drv_ctx.
+ * @drv_ctx: Variable-sized array of driver-specific context, counted by
+ *	@drv_ctx_size. Opaque to the wireless core; interpreted by drivers.
+ */
+struct ieee80211_smd_ctx {
+	DECLARE_BITMAP(valid_ctx_bmap, IEEE80211_SMD_CTX_NUM_VALID_CTX);
+	u8 pn_len;
+
+	struct {
+		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
+		u16 sn[IEEE80211_SMD_CTX_NUM_TIDS];
+		u8 pn[IEEE80211_SMD_CTX_MAX_PN_LEN];
+		struct ieee80211_smd_ctx_ba ba[IEEE80211_SMD_CTX_NUM_TIDS];
+	} dl;
+	struct {
+		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
+		u16 sn[IEEE80211_SMD_CTX_NUM_TIDS];
+		u8 pn[IEEE80211_SMD_CTX_NUM_TIDS][IEEE80211_SMD_CTX_MAX_PN_LEN];
+		struct ieee80211_smd_ctx_ba ba[IEEE80211_SMD_CTX_NUM_TIDS];
+	} ul;
+
+	size_t drv_ctx_size;
+	u8 drv_ctx[] ____cacheline_aligned __counted_by(drv_ctx_size);
+};
+
 static inline int
 ieee80211_uhr_mode_change_tuple_size(const struct ieee80211_uhr_mode_change_tuple *tuple)
 {

-- 
2.34.1

