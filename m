Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA6599A2D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887452; cv=none; b=IJkYtTgTWXygc6HekM0GbC5OLmDD8Y5hk6LQGXl5/xyWGTGpmQOpNmFJ4ZtKMyNY/jhlUJtIzVAzUQ/HIdgXFUyAsylddwefXY07hCyM4+jqSCxi3Hn4pEJu2xrf+GjJ7FBug3HRAoxCDE6ghFUWUX7F1JlUD63HZPzMB6T+zHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887452; c=relaxed/simple;
	bh=3BIpCqgDAnBGrfpL4IV/b7aNMrM2UPJt17dMZbUsoWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9a5sr4xeSLM2b0f9kVKY25ubyhNqmvlHGiavNU/fMMF93CFF/5psmipYZTk+wJhU14rVxJW8OpHBZHCGW07s7NaXBsflxl7/fPz3EDu0LjSlYGJ/p6+0WA+VkoGk5RGCPNAMyJuzcMLk6ZcnA7JjViqdSD0vvCE3tlNFUY8VMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZzDf2+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9VG5wlt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZzDf2+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9VG5wlt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdefL045837
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 17:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCsImhyIeDGFUN5AVZ441p15WIFo4hf5osqfn8vGVMw=; b=FZzDf2+Mkj4lexQU
	NGozUUASGz2jh064UfgZBVctEF+VTN0nUFP6GaBP8u/kHY9L/MxxZpedIEWEHppN
	ucv6pL4GOYE49DDEKMwUUBPzw5ohSFRftvRFRGWhW1kfoyhh8rK7PNdOGuxyxKTq
	sPdxn7VazJ4R6gdV5nofk+sNoTfnMmGaB01ioiaYTbHZ/1wNJ3BBBsGCgSuOcZqg
	91vIk3O3QKaUi7xdkooG4F00I7X4lNcUjTf2uAZ3W7eXYfLafABMqzTci7DQHsLW
	XEIVCdOvXSiBTjSVk496gbREZo9SPlFk1DlzZwKZ/sIjNp/7/3WZn9wSHW7/GdX2
	u9/4aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xsy83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:10:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7720294a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788887448; x=1789492248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pCsImhyIeDGFUN5AVZ441p15WIFo4hf5osqfn8vGVMw=;
        b=U9VG5wltD9wsBhMpX6Qlg4m+cKU29CD1ve9ZKQDAWgaYUbxSTze5DStXCPGy5KZASp
         BrY2opdZWvnfrBQ/fHGODNVVO2rNHv67BrNiGoJ17m4QOU8hjjit/t+kQEvYTbjZObtZ
         e0Dczgp9IVq1sO35/bc17ytSBSRBWjxkbJkWAQ/a080g6X7AlS7qbBuSpX9lIMHGqo1J
         h4V0KNjBFUpmQ15VXosJzEXW/MUZAMA/D7J2Ryxx26XpA3CY4FOPorCbp8wlS63tSn7U
         XwoaaH2u+cm/2wL0fFXBrTJk9RWjR5qY1GaxYYVsK4XrgASA2MIuc0TOqKHd0NOYum5C
         fmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887448; x=1789492248;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCsImhyIeDGFUN5AVZ441p15WIFo4hf5osqfn8vGVMw=;
        b=sc87QsVm12rNjHeuRHEqpcSlRbxOyaiKNERM3RZwkS5nDlEbiVeYTUZ4OkiSyRBY1v
         0lThv89olceChgcMEsN0iZos+fvdjcyhnl+xm8AmyFP++oX2IjvOWmvT7bzFoOssSFJA
         JecOlg3YXf7hA3GR8MgV0enGiIRnEiuW0pjuM9ZBf0h8QzWtBz+6M31Nf8fZlOJkC/I8
         yBhDnuttjC/PXlAC1ZJrtEwOyKL7pc3uzZHQ1kXwZs8vsq8jfJC00d0Lc872uyeYUTud
         W2n8J/UGX+iZqsito05PWmfkrcDSF6NkPSJhVKW6ZPvThWrghvY8WOLrnwpejAEJTwYs
         Wpww==
X-Gm-Message-State: AFuF++kFT6/uaPVR0h5yws21h6yrvDgGTuEnkIMNVMoE4BkwGCP0M46I
	+3pdjmVj4w1u9UF9UgYXl/bJUeUOVI3Mvb36kSY6sUt9yw/oMGhBW6lyRFFmsrlDudjMWlT7k/3
	XDfyHWStBwi6RQbVWcxHVAfr/TDHuDS/7Z+PpupizyFi78NKTFjlS3DoBEGd1TXk8vw==
X-Gm-Gg: AYBFou3J2tGipcZyyeRe1uasIa4iF5lHvYoSdpD7mw6Brca1yj3v9BS5S2RJvhxDc7D
	/gZqLlPFZ1B11Htj1++rn4e4HFAJ7HzoMUBip0T5ZjBPAOPCB0lcUaaBlqZ0s7GK/uglHKnFhf/
	ywo7x8KYCEi77gxP+eb2pZiKK2N4cBW6zhL6wZcEeFOAGn0s+ycQjxeVNC2WXbq+/k6jknAxYZv
	s55CCSiKOR1SjMY/zcf7+bMip3CE170/xpTdo9ZQsxddYzbh6y3wXSI2p0MXmTHdg/uxC9P+pa/
	OwMRvdvMSxzIYfdeXn8n4oNpd02W2WP8mWCYXxpLhSpcqkllVW/33+3YzK0tREksITc1aBH0atj
	TO2cGaJwZ/qkAz+eHxVHXQKoNdJui0iY9Aibhn9iTH6sL4gkSRfUIKhL8FYs4TV6GKMAaGofoOq
	kG/CFtUaFs9NPHW1g6zdphjg==
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr44616557a91.10.1788887447348;
        Tue, 08 Sep 2026 10:10:47 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr44616272a91.10.1788887445127;
        Tue, 08 Sep 2026 10:10:45 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31773675eec.4.2026.09.08.10.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:10:44 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: [PATCH RESEND wireless-next 10/18] wifi: mac80211: Define SMD BSS Transition context for transport
Date: Tue,  8 Sep 2026 22:39:38 +0530
Message-Id: <20260908-smd-v1-10-9fd2d876a1fb@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa04199 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J9-iD1ZZfo0dXw_rko0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: uc_oJ8sgtYZbbpAxkJo44QK66i8dO3S4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX+j4dbTiHpci/
 sV+yLqrkbwWvl8HAw52pBQgmPtQJVtkQDfmFMYtf0in8d5ZZD85Ut6PJhGX0oQMfqZC2s6P4MNR
 /acBEXtWhhhGiizHqC+DiP/vFbKhVSHKTipz9RLr7cIR58pP8wI+nVksqhMd3BdLfWpwklkHTbT
 axQ/KTrsbMNVXmJzTbsxCbgZwmI2kmFmYQRxKBSuBVSRMeeJQINBeHiTOiacPovRUq3K8uRxLPq
 XAefn3+Uo5tDJ5ALccL4VtB0tDvjG+xdWxGDpOAZ/tLy6Rdo1/8OBGs8Pgaa11P/Wgu0QvPiAIP
 0cxhZDDAK1C8PIxhUll/UItUBW6h9NtfUYjEy+gooTM4lufdlBxRkLkoKmVn6gz/cnP3g2Et0jj
 2PlrncioKYxho3D4QpiQ99fYWjTx8M3iitOgNNSgxaapxmVI1KySL9eNUX18W2SG9qlPtvcx3Oa
 Ts/LeZN6gnvXLxupYsw==
X-Proofpoint-GUID: uc_oJ8sgtYZbbpAxkJo44QK66i8dO3S4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX3ZfZlvWRK8Io
 G6X5h99qSoUdC2nzd1O23G+6nV1jbKoPqBi1aiANVSrk+AsBAq62qu/rfHDpMj0JYTFfw2KvfH1
 Qtw/VIrS7ifAfaNG44AM27gspAy8snk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080185

IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9, defines the context
data to be transported during SMD BSS Transition (ST) laid out in
subclause 37.16. The station's context data is attached to the ST
Preparation or Execution management frame using SKB extensions so that
userspace receives the context along with the relevant frame.

Define the context data - per-TID sequence numbers in downlink (DL) and
uplink (UL) directions, packet number in DL, per-TID packet numbers in
UL, and per-TID BlockAck session parameters in DL and UL, plus a
variable-length driver context - to be used by the driver to attach the
context to the frame SKB. Additionally, define a helper that attaches
the SMD context to the SKB extension so that the initialization
operations (container allocation, reference tracking, and context
linking) are properly handled.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h | 86 +++++++++++++++++++++++++++++++++++++++++++
 include/net/mac80211.h        | 50 +++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index c3f87d4c8bec..f904b1e65f10 100644
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
+ *	@drv_ctx_size. Opaque to the wireless core; interpreted by the drivers.
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
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 32b9b7cd1685..b4b1d3db9b19 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/if_ether.h>
 #include <linux/skbuff.h>
+#include <linux/skbuff_wireless.h>
 #include <linux/ieee80211.h>
 #include <linux/lockdep.h>
 #include <net/cfg80211.h>
@@ -8246,4 +8247,53 @@ bool ieee80211_vif_nan_started(struct ieee80211_vif *vif);
  * Return: 0 if success and non-zero on error
  */
 int ieee80211_encrypt_tx_skb(struct sk_buff *skb);
+
+/**
+ * ieee80211_skb_ext_add_uhr - attach or replace a UHR SMD context on
+ *	SKB_EXT_WIRELESS
+ * @skb: the SKB to attach the extension to
+ * @ctx: the SMD context; must be a kmalloc-ed buffer by the caller
+ *
+ * Allocates a &struct wireless_skb_ext_smd_ctx container, sets @ctx to it with
+ * @refcnt initialized to 1, and attaches it to @skb on SKB_EXT_WIRELESS.
+ * If SKB_EXT_WIRELESS is already active, the existing @container is released
+ * before the new one is attached.
+ *
+ * Ownership of @ctx transfers to @container on success - the core will
+ * kfree() both when the last reference is released.
+ * Upon error, @ctx ownership is not transferred from the caller; old @container
+ * may get freed.
+ *
+ * Drivers must use this helper to attach SKB_EXT_WIRELESS extension to
+ * properly handle clone and COW copies.
+ *
+ * Returns 0 on success; -ENOMEM on allocation failure.
+ */
+static inline int ieee80211_skb_ext_add_uhr(struct sk_buff *skb,
+					    struct ieee80211_smd_ctx *ctx)
+{
+	struct wireless_skb_ext_smd_ctx *container;
+	struct wireless_skb_ext *ext;
+
+	container = kzalloc_obj(*container, GFP_ATOMIC);
+	if (!container)
+		return -ENOMEM;
+
+	refcount_set(&container->refcnt, 1);
+	container->smd_ctx = ctx;
+
+	skb_ext_del(skb, SKB_EXT_WIRELESS);
+
+	ext = skb_ext_add(skb, SKB_EXT_WIRELESS);
+	if (!ext) {
+		kfree(container);
+		return -ENOMEM;
+	}
+
+	ext->uhr_smd_ctx = container;
+	ext->type = WIRELESS_SKB_EXT_UHR_SMD;
+
+	return 0;
+}
+
 #endif /* MAC80211_H */

-- 
2.34.1

