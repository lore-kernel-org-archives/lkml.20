Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590182;
	b=f+6Of+h/YphQ2HB0+AKgETmVZEAeYwSeplK2xzhU10SpSGc/Pic2JPDmXfMJRLhJT0Ll
	 dZRQmydSbf5P/99+Ap89xU3FX96u62BqPYvWe0lAMWTpbdj2P/dwQjwc3zAmhf75qdx4p
	 MLLEQ0h3hUkbSjvVzDOLc0BBeKsKK6O4qx2+RRaLi0n281olD5bZeQqccI4EJvA8HklQB
	 NGQZEINLKuzaeZFzGv6oukwr0QMlc6QfClgA8kZvW1po8/IIjRJltrFQ8ecJubCfj61y8
	 RV0UsFfsvhFmF3lAJT2ACXYZw2gvRtqelRZ7y28uNJHlabvOVtxGJp1ak5qGKIyECGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
	b=QWXsOKUbGeL2rvNFoZijTOjXNeXlZtYtdmj5VM2Ha2z0QiObUX0PHS+yQiPTGiWu44sU
	 KHvQ76PypacAdbPpQod5g95K2MhSdxCGII5QBSOlftiPe3PtdCfile7lFepf+V9ZCeQ2f
	 60Dt/6b+NXHrZWFJF827ZIsTOms8j2prILRtb1M5JDPvQ45fTRwq0T5R+tKp/I+ZUzHCb
	 fH4M1Qlq4p9DxH/9HeJmtva3J5VYCkR5TYJUlBdgRSUT0GibAA0Nl7nsZMTrSAqFtjPoS
	 yX9PwszLbo/eiUebWkM9rO2VgVo3obXct1wX6KAYssV+AUrOhNtpjb59i35Dd+GQKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLF4V1yV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZiRO0r5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLF4V1yV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZiRO0r5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfwM93224737
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F
	0LpqXvtQ=; b=pLF4V1yV5SxgrLhU4KqgqrqQMMYHGCxNNptCrHC5dd+Xd4YH1zP
	oR+maJjpJ8yn7+UUPCoN36mMMwmUcoDOSDe66fr0EqxqGfNut5KG0CXaaD8ExdI7
	WzbKVxl9FrHLmxvv11Rf/kObj9/7cN1xs6OPdALcPiWQ96ml9/3YrxD7bnYi0jXd
	t++kBG0DS2u1jY8SGS7S9oSTEljcouD7ppF3ob8R/jieXQVjT3SwRHIEJ0wrUX4U
	lSJeO7siafAOCqkE2jRWA0sna0HC0h/zjHmD+wCGZOinlMgiRc0awmyFC00X0vt8
	/MUFJOJ8J9JMMNYXdgZN3B4n5hEIVQGfbFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79aus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso343957085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590180; x=1793194980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
        b=MZiRO0r57bCM/6EjhsuBQNwytOrZGXwPeNzizVlRpNhzh97cI6yvpw3+oGPOP2jIDd
         ULfGkvsXYUEtg6fMlo0sVOrdVN8uZR3Hzv1rnOPM+C5ffi3syHLxqTK/1kO9M3LgjsHK
         qoTNheC8FYvllvU8IDh+euiMfrZH/s+p6FF+evW3S9Is5HwLfheYE3d1G8o+3ybv7AdI
         V6IvVPATwo9jpKldM1uOfRkUGtmVYlmTaORmcnQqwjt6zHeE/5aizHXfPtxR6vOlO008
         84o24f4OhWynMIocBJ6FTntLbbs+B63WQgZs0L4UyAQZ1iIu0Z7sBXw91gYrU1+I3tpL
         eOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590180; x=1793194980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
        b=LIJK8SuAPOYs2uMhTseN0yXYYp6AOv7+m9HbSkUoJvTfS2FiuviQ49lD5cxdpYyGpo
         YbZFgeBgTGGcj0tf+1QzzA1M7BuRxpCF/ORKyHu0S1lVvqvT9pxejax0uc9PAuzn6Tqv
         lhOHc5k0MVRk88uTxl9ogx9EVhxCdIDbO3NWpw4cA3Hact1BRONrzBxVCJCe7UAax4fN
         ugKYWbJfoGNhH9OP77PVeGn+IAXv9wUddeE56tYp6+AdSuQ2nORw94mVSwfyotTqSek4
         22aFEsH9FoLpfXTVrszfdFGVnCWgnDQNPv8kVB9qNI1C8uDn/+8Gtxe4MYb6xOqHDqwc
         ZiXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFH5X1hgOyWYX020xzShgv+SrvlRTIChatKQoOpe6tu9aABk46CCY7yVaYpEMIGIFSVUstU0iLSpOjCz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJee5wo1+gh4PoTISi20GLdzwc7nWvihYhk2g8B3EVxKiHy1Y1n
	/NNVncmB3QC6KEd1GSWPGJ+o+fjWKH8j5CWhR8dA3U2uOFqDKMwoepMr9pGwasFFr00FHEsEwRO
	WOHlR/j3exq0lAXbh0hb8nP8R6CUjZo2jQVCJx5w9M1g/I2U1dPQvaSUYdR7PvS/nP2c=
X-Gm-Gg: AYBFou2FmzMvMY2qL4HCz19TNrz+juaFCQwE8SQlxKuss4c65nPlMBrkDbaZ0rBNC+T
	ijz2kKfqwGFXP0P/HaoZA7aV3XjM6GtlhS5cxmfvj5c8OqaAYbamndraUwBKmDyXICH8/6jEPOI
	kJ6ibosaA7t4rdBt/Qwv7VnyPMEiikEP7zOX6vZG7WdpEVRjBf1jhLnq9XSPb/jrFvpdgtQ/pWK
	uerg28GpCbOrkHH4yaVIETOKpu3wBz/zvmOSWKy8OVqasj0uyyvwNHNhHMByxihR967On5a9+XR
	2koPSQuVknvXuT81VfgW4xC53wqvEJgwZGwium1c+OeUUVpko9wYhqk2I8hTrM27DOLWiREur/Q
	TUXBpbuQY7/Eusiv04Hb4uKvQGZw+fz6ZGg==
X-Received: by 2002:a05:620a:1a19:b0:93f:36d8:5334 with SMTP id af79cd13be357-93f4c66bce2mr859701385a.21.1792590179518;
        Wed, 21 Oct 2026 06:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:93f:36d8:5334 with SMTP id af79cd13be357-93f4c66bce2mr859695285a.21.1792590178874;
        Wed, 21 Oct 2026 06:42:58 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:297a:d3e4:3ba8:fbfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb845dc2sm73536425e9.8.2026.10.21.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:42:56 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@oss.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: Share THERMAL_NO_LIMIT between kernel and DT bindings
Date: Wed, 21 Oct 2026 15:42:43 +0200
Message-ID: <20261021134243.35103-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Gvmn1BPC9xa8jTPSqRwuohqJ-MG4Ls76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX1mlbdSKh2WmE
 Kuv23D1pQsdsVJEYXD2cW72Ds1scL93lX8zhuHQAov2zev++Xodl+uG5ODs77RCzc2PXV/7QK/o
 jM3QDnogKG9tSENXWMrfO0SYAEAu4idSLWLxOhH26J0BBC2uwnateftvw4O3GN5AnK0UQf8ssdi
 vqTwteZTv9reROZFITJtoD/zAnJubdYZLuyE8ILSpYsdDL8ruac6Czv/CDT9hdxFuiBz4qUem/T
 escZsreCaPeEsDGhkkKm7hVOvIAC/vQ7/uw+kGf3u+sHPBuxUrvXKnEahUz5avX5b1Mh/sJ66dj
 NK8Z9x96x4EQ7NLBLLK1vg6selBYu3HXUFvkW5bTxCNgr7Gjz2ulYZ5jk7cu8Vi1QY/S0IHXVLe
 v38+koaKEETMja8aWT8XF+8cmF5Iz0JIzRkviiddzJKQN68umQoOOHZhMOx5fsXgCNrRixzWDry
 c+uBQObDT11ikNh0NYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX/oibZdCEXay8
 q1nJGg9cNhFNbh7vwy47k0YQX1O/+v8YNkAyEGMnLQqC8cX930KgvncTnwcmDk4OEgWoNOTl9dG
 bXOw5m9Na/bSq/JhwxwY6yQYtZmGa1A=
X-Proofpoint-ORIG-GUID: Gvmn1BPC9xa8jTPSqRwuohqJ-MG4Ls76
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8c164 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=DIsPBAb7muRbsDREbf0A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210054

THERMAL_NO_LIMIT is defined separately in the thermal core and the DT
bindings, using different expressions for the same no-limit sentinel.

Define it as 0xffffffff in the DT bindings header and include that
header from linux/thermal.h. Remove the duplicate kernel definition so
both interfaces use the same unsigned 32-bit value while preserving
the existing DT encoding.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/dt-bindings/thermal/thermal.h | 2 +-
 include/linux/thermal.h               | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/thermal/thermal.h b/include/dt-bindings/thermal/thermal.h
index bc7babb1a67c..018f75febb9f 100644
--- a/include/dt-bindings/thermal/thermal.h
+++ b/include/dt-bindings/thermal/thermal.h
@@ -10,7 +10,7 @@
 #define _DT_BINDINGS_THERMAL_THERMAL_H
 
 /* On cooling devices upper and lower limits */
-#define THERMAL_NO_LIMIT		(~0)
+#define THERMAL_NO_LIMIT		0xffffffff /* ~0U */
 
 #endif
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 083b4f533933..a6f635f0e1f8 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -17,12 +17,11 @@
 #include <linux/workqueue.h>
 #include <uapi/linux/thermal.h>
 
+#include <dt-bindings/thermal/thermal.h>
+
 /* invalid cooling state */
 #define THERMAL_CSTATE_INVALID -1UL
 
-/* No upper/lower limit requirement */
-#define THERMAL_NO_LIMIT	((u32)~0)
-
 /* Default weight of a bound cooling device */
 #define THERMAL_WEIGHT_DEFAULT 0
 
-- 
2.53.0

