Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749263BB113
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813204; cv=none; b=kZU+M4cg/Zs6iJ7ZREv//HG4Fpl0WZ7a4oD/gNWeax7m9VJ08foG7ExNrFP0cEv2Z6c58GTQEiMvFOloMiC4yWU/08phuVSRsIx71Z4qPdNbWaiL3RV1UOw0POxvZDyBy4DrqRkSiHGpF8PZd6deoGo87SSYIvJoeqFCVLlh5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813204; c=relaxed/simple;
	bh=NrgThq6Y8uHhb3wAckmPMV55GlSGJaL3Mt7emHZURDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiTnYZrdXxwPxAj3zLpJIuM9sPhmtLQL1wbdYIlcAOdW524CzXFGYhYPuiB+YAhzqP+3ZsBqR77qExd1YjOwF52f6mYA6+smW6uTMxIStuFsTsDF4WmX+wNz0Rg/cikrK4ADmsaKeqCfYcLE1xlCB3rn9y4dnxZkb5FaTu36SsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mETh+2A6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCtq1oI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mETh+2A6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCtq1oI8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HWMLK565403
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZdtDE9nITufoadjKmxDFYIwfAzWlsnkOtcwwliJ40E=; b=mETh+2A6Qi98H/cg
	JRlQd70yksouhVax3yQo4tKoAwbR1WgnoT1BAqTR2QGBq4/hdb5nIomQqD7IeAQI
	XDcrhGLS5Gu7X1H6/Yr9dewIfTsKabZ4t2jBfqGpabXYSiI4zDBgokDbQ9g2sPC5
	B8BFBqERcR3HUp2voKAxB1Eq79Zj8r3kpsVmaHtiko2B1tpKGXbr7cax8lSei9fW
	gv9MPruNUWrnR6v7LkgjIzFQn6xwBfefw+oJudvaS/tcTKpndavCt9yaaqcL8l3L
	y2LppiikVjbdz5Ni5DBDEfONJh8kUQhTojGIEkxaNQ/gDcC++21GV7PnsDPdDlMK
	pDIuYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrgfra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86476d54af1so2216147b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813196; x=1789417996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZdtDE9nITufoadjKmxDFYIwfAzWlsnkOtcwwliJ40E=;
        b=eCtq1oI8oUTrjnlqvS30f4sw7IMCU5jNQKndbClgFH4eTotkq/6uEuWvxu08CYyEeh
         huxoUMxrD+hsLru4as6Q/nDXpGw+Gfim4/DPEoO2XVPYKhlsfnRw87aaXHCUqXkWwDws
         vGUImRmDFCkqU/oXOza6iNqvzxXuphmyFc/Lp/G4GKNxhI2oPh9jdO9jQjlhJYHwEUI9
         YS3PiIeJPqoFVY/4jWshrrJQIXA40gipBqPrKyStEcNAdQUsd6rvPBH4majFJTbNbbG6
         tNXWLnt3wTUUbWOfCDaUzYCnkZBUAgOUMrKVQbSO1kQRO6kzg7gzLGitVsOv/iYMAow+
         ef5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813196; x=1789417996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZdtDE9nITufoadjKmxDFYIwfAzWlsnkOtcwwliJ40E=;
        b=Gv2Q16kNfDVCGWfrXhuBQhNsGlGI1RGtia2JGWuN1ppSONk6DdY98+exSqQIyNmVaM
         dCT4Ly8XbDbmgsUtGupvKzZCCnPquow/PuoJVr/ncqxRemckn1Ffieaeh1jMbTzyTVuN
         bYCsXERrKx+hD+eG/wVn23p4YV4lMZyrtS6icmifPxFEA39gC6WAqYJ1E0J/p1I7HZLI
         MiV3ulbBqJ2txtV1vQCrVXPhy74v9bbrbHcv9GCIcNWdgvPe6kz6bJHLe/bu1uEuDpOT
         nlR7Nn9JjtekKP0HKcvXMD9zIi6BXvBH3l06NjTSap99zJamaKEztSFuFRe07VC1QxQc
         serw==
X-Gm-Message-State: AFuF++ltMzGsidjM1z4IrBWkc0M5PIxt9mzc188DatvuvwbGGi9omJG1
	yzym0WZ05XTDJQFLhboPprLBNy9sC1oNdYnT7HexZaIlRRkQZx9v4pSgi3lxTxJR+Omii0W0yCr
	ZlN+5qZ1hENRjZ/rPrq47Wmg9sUx52zfksXvUGQkjznh9t+QMz0w9lV29k1EytkPe1g==
X-Gm-Gg: AYBFou08SiPayH26cPeD0uzCvwbR/djnSK3TrvbLUy6TLedNzknX6cgfzAFARUIeYdO
	cqkZJ0UDD3XprjCJdZWTFZbQ4RLDivKHqH9qsdO8V/OB/fycRbVzbdEE4NaYCJNZdfogDwu2y04
	fUgEfwZe82RkET5BD3KIC/uPRLWBP6amSDWKnLCgYlty2chODOaZHR7rXdGCkE7dICIX91G7IYy
	c6sP4Ae8SvaZC+tJ56XcywiJrV4zjI1PaVUZz+ZhqDF7ho5RrnNbSkbBi/6bvAzhtK5etbf0m5x
	HOUOySpounO8LKKEe6TpsR6+J6c4a2gdd9irzebDXmbriOfjqoAN53DBfXT59wzEk2S87LBmdPs
	B+n1IfUuKnmaqz49SEYmK+NuUJ4Bk4SoVC5kDXnvIlh8Jjz08n657GcsXRIzcBDyXl3T9NEqMvv
	JeWekD3hLkoE4xNAWWnDHhUQ==
X-Received: by 2002:a05:6300:6710:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3da3a15bfc3mr39225025637.23.1788813196036;
        Mon, 07 Sep 2026 13:33:16 -0700 (PDT)
X-Received: by 2002:a05:6300:6710:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3da3a15bfc3mr39224968637.23.1788813195589;
        Mon, 07 Sep 2026 13:33:15 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:15 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:10 +0530
Subject: [PATCH wireless-next 01/18] net: skbuff: Add SKB extension support
 to wireless drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-1-65ad4ab30fbd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX5vCPAgpyoKFz
 ti894UwNbl2YHgTMXY7dj7jiGnOGDAovMP2cZXFsMLgrsYnrmkQsZNZyiAGmrqEi1e7hGdgID8f
 YgtoVNr22cTOSEr+GF4rPpGhrvUWA3k=
X-Proofpoint-GUID: mVX7uh_7Yke-vtwFY1SdT44D8FjDjlk_
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9f1f91 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=axc-8nxta6ncDHcsNdkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX6K9SsVpgGhde
 4rL3baEYMOf7R3l3Tg1WUj1CyGyj4cb6xHVqF80JH8Mb27CFDiuryAZ+DKSjRrHK4BD42Sx9UbG
 1q20nO5VL4+e5TCeFSjLY27KPy+uWgf8rnUTe+df7onCjT/lWfJGdnGSADBJNROgz2FSKs0CeHA
 11unoBve/0qyyc9OJ/TNXp3JE4QLfzzi2I/VMZo9wbX8tPpsYYB4oFCrjjyUzfdO86Ubxnv+jbT
 l5w3oQa0YWGSM8HnyfzDv4ZwjG8CWW3MO7Cw9bTflSue7GS78IAYb2XuiMPwqipYPAJHBtrNmRO
 hsR+ZaNLX//zimLlZIWtoWz802K0e/MHWcRYqD5whaEByRLPqL/KO68oCEyJuIbzXUh4jxEGPtz
 uzmeRH9387EZ4SfchMuihki4MmRuxFUaFhzmfrk7jI0qsmdXXWFL44LTK+0ukJTTIRu3j33E+mW
 A9FeUhWSWGoWbAV8V8g==
X-Proofpoint-ORIG-GUID: mVX7uh_7Yke-vtwFY1SdT44D8FjDjlk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070226

IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16, defines Seamless
Mobility Domain (SMD) BSS Transition, in which a station roams between
two AP MLDs within an SMD across two phases: Preparation and Execution.
During these phases, the receiving AP driver processes a query frame and
must carry the station's roaming context - per-TID sequence numbers in
downlink (DL) and uplink (UL) directions, packet number in DL and
per-TID packet numbers in UL, and per-TID BlockAck session parameters in
DL and UL, plus a variable-length driver context - up through mac80211
and nl80211 to userspace, which uses it to complete the transition.

This context does not fit in skb->cb (48 bytes). Carrying it separately,
outside the SKB, breaks when the SKB is cloned through the RX path because
the context lifetime is no longer tied to the frame; the driver would need
independent state correlated with the SKB at nl80211 encode time, adding
error-prone lifecycle management. SKB extensions avoid these problems: they
are reference-counted, copy-on-write safe, and freed automatically with the
SKB.

Add a new skbuff_wireless.h with a typed union structured to accommodate
future wireless extension types, carrying the SMD roaming context as its
first payload.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/skbuff.h          |  3 +++
 include/linux/skbuff_wireless.h | 55 +++++++++++++++++++++++++++++++++++++++++
 net/core/skbuff.c               | 55 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 421f6fc45451..fb686024e97d 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -5061,6 +5061,9 @@ enum skb_ext_id {
 #endif
 #if IS_ENABLED(CONFIG_CAN)
 	SKB_EXT_CAN,
+#endif
+#if IS_ENABLED(CONFIG_WIRELESS)
+	SKB_EXT_WIRELESS,
 #endif
 	SKB_EXT_NUM, /* must be last */
 };
diff --git a/include/linux/skbuff_wireless.h b/include/linux/skbuff_wireless.h
new file mode 100644
index 000000000000..2cb04bff061c
--- /dev/null
+++ b/include/linux/skbuff_wireless.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * IEEE 802.11 WLAN skb_ext definitions
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef LINUX_SKB_WIRELESS_H
+#define LINUX_SKB_WIRELESS_H
+
+#include <linux/types.h>
+#include <linux/refcount.h>
+
+/**
+ * enum wireless_skb_ext_type - type of data in wireless_skb_ext
+ * @WIRELESS_SKB_EXT_INVALID: uninitialized state
+ * @WIRELESS_SKB_EXT_UHR_SMD: payload is @uhr_smd_ctx
+ */
+enum wireless_skb_ext_type {
+	WIRELESS_SKB_EXT_INVALID,
+	WIRELESS_SKB_EXT_UHR_SMD,
+};
+
+/**
+ * struct wireless_skb_ext_smd_ctx - UHR SMD roaming context container in
+ *	SKB extensions
+ * @refcnt: reference count; one count per distinct skb_ext block that holds
+ *	this pointer. Plain skb_clone() shares the same skb_ext block and
+ *	does not increment this counter. Only skb_ext_maybe_cow() increments
+ *	this counter, when a COW produces a second independent ext block copy.
+ * @smd_ctx: pointer to the IEEE P802.11bn UHR SMD roaming context;
+ *	must be a kmalloc-ed buffer, freed together with this container.
+ */
+struct wireless_skb_ext_smd_ctx {
+	refcount_t refcnt;
+	void *smd_ctx;
+};
+
+/**
+ * struct wireless_skb_ext - SKB extension data for wireless module use
+ *
+ * Carried as an skb extension (SKB_EXT_WIRELESS). The union is reserved
+ * for future wireless extension types; only one member is active per skb.
+ *
+ * @type: type of data
+ * @uhr_smd_ctx: pointer to the UHR SMD context container
+ */
+struct wireless_skb_ext {
+	enum wireless_skb_ext_type type;
+	union {
+		struct wireless_skb_ext_smd_ctx *uhr_smd_ctx;
+	};
+};
+
+#endif /* LINUX_SKB_WIRELESS_H */
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index ab195b99c853..f28ab7c3c888 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -93,6 +93,10 @@
 #include <linux/indirect_call_wrapper.h>
 #include <linux/textsearch.h>
 
+#if IS_ENABLED(CONFIG_WIRELESS)
+#include <linux/skbuff_wireless.h>
+#endif
+
 #include "dev.h"
 #include "devmem.h"
 #include "net-sysfs.h"
@@ -5169,6 +5173,9 @@ static const u8 skb_ext_type_len[] = {
 #if IS_ENABLED(CONFIG_CAN)
 	[SKB_EXT_CAN] = SKB_EXT_CHUNKSIZEOF(struct can_skb_ext),
 #endif
+#if IS_ENABLED(CONFIG_WIRELESS)
+	[SKB_EXT_WIRELESS] = SKB_EXT_CHUNKSIZEOF(struct wireless_skb_ext),
+#endif
 };
 
 static __always_inline __no_profile unsigned int skb_ext_total_length(void)
@@ -7152,6 +7159,16 @@ static struct skb_ext *skb_ext_maybe_cow(struct skb_ext *old,
 		if (flow->key)
 			refcount_inc(&flow->key->refs);
 	}
+#endif
+#if IS_ENABLED(CONFIG_WIRELESS)
+	if (old_active & (1 << SKB_EXT_WIRELESS)) {
+		struct wireless_skb_ext *wifi =
+			skb_ext_get_ptr(old, SKB_EXT_WIRELESS);
+
+		if (wifi->type == WIRELESS_SKB_EXT_UHR_SMD &&
+		    wifi->uhr_smd_ctx)
+			refcount_inc(&wifi->uhr_smd_ctx->refcnt);
+	}
 #endif
 	__skb_ext_put(old);
 	return new;
@@ -7256,6 +7273,36 @@ static void skb_ext_put_mctp(struct mctp_flow *flow)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_WIRELESS)
+static void skb_ext_put_wireless(struct wireless_skb_ext *wifi)
+{
+	switch (wifi->type) {
+	case WIRELESS_SKB_EXT_UHR_SMD:
+		if (!wifi->uhr_smd_ctx)
+			break;
+
+		if (refcount_dec_and_test(&wifi->uhr_smd_ctx->refcnt)) {
+			kfree(wifi->uhr_smd_ctx->smd_ctx);
+			kfree(wifi->uhr_smd_ctx);
+		}
+
+		/*
+		 * __skb_ext_del clears active_extensions but not ext->offset[],
+		 * so __skb_ext_put will call skb_ext_put_wireless again;
+		 * mark NULL regardless to avoid double free in __skb_ext_put.
+		 */
+		wifi->uhr_smd_ctx = NULL;
+		break;
+	case WIRELESS_SKB_EXT_INVALID:
+		/* data not yet set */
+		break;
+	default:
+		WARN_ONCE(1, "unknown wireless skb extension type=%u\n",
+			  wifi->type);
+	}
+}
+#endif
+
 void __skb_ext_del(struct sk_buff *skb, enum skb_ext_id id)
 {
 	struct skb_ext *ext = skb->extensions;
@@ -7278,6 +7325,10 @@ void __skb_ext_del(struct sk_buff *skb, enum skb_ext_id id)
 	if (id == SKB_EXT_MCTP)
 		skb_ext_put_mctp(skb_ext_get_ptr(ext, SKB_EXT_MCTP));
 #endif
+#if IS_ENABLED(CONFIG_WIRELESS)
+	if (id == SKB_EXT_WIRELESS)
+		skb_ext_put_wireless(skb_ext_get_ptr(ext, SKB_EXT_WIRELESS));
+#endif
 }
 EXPORT_SYMBOL(__skb_ext_del);
 
@@ -7300,6 +7351,10 @@ void __skb_ext_put(struct skb_ext *ext)
 	if (__skb_ext_exist(ext, SKB_EXT_MCTP))
 		skb_ext_put_mctp(skb_ext_get_ptr(ext, SKB_EXT_MCTP));
 #endif
+#if IS_ENABLED(CONFIG_WIRELESS)
+	if (__skb_ext_exist(ext, SKB_EXT_WIRELESS))
+		skb_ext_put_wireless(skb_ext_get_ptr(ext, SKB_EXT_WIRELESS));
+#endif
 
 	kmem_cache_free(skbuff_ext_cache, ext);
 }

-- 
2.34.1

