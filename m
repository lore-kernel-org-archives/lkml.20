Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D93EAC76
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656020; cv=none; b=aELe8JrkIHD46DtEIsSvWjzxqpUdTtIH9Rt3gr4ggoPuWdN7NgIG+KiIf6Vz0mqXZl//+hULijaYbh7Vv7XtRhutt7HB+3eHD3WKyvMeSyi3zYqS1rP9Ym+Kz3Yre7/soMZVcAbcOyqySbKQnp8G5mNuHCsm9zdmQBZR/cwYBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656020; c=relaxed/simple;
	bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVsZbaYMvRaFyC16KgZB7KP/FJnUzl3/FQk8tmNNWU6MJI8vh15OIF0rL+zrSCpwjDGu7bfyBvzy8Lda4h+BsHOl5rVX/YuvfYqiPHIM1cOgeQ/61W/Gq9vjYdTunL+Hbhq0Kg3U7hK31/t4FqEDJ6R4UkCv+X644uxEJxwOKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVtVMdol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6V2dOfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVtVMdol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6V2dOfp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47dtN3654849
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=; b=VVtVMdolEjAmMa/l
	wLhRtBeJqDVLv+gKUdf5tCJyIcjk0l4+SagEKfZfbDYtDDzAzovFSUy2Sa/INPiS
	tAeCTqs4va5+hIkLc0EE4IQYY3Qum0NxTCVHFkwOLAzIvbip2RbjD3uj9+7io/et
	8IqZJstUEIFVLhaYit8IZIUPGFr5T/RmwwMCPPkG9cyQX24M3BnJbXi194wUXOCR
	y6GzHzNIx9MCUKFJFzKRaO64hhyZx+M73isi85jr/xrXhNCaknGcoHWM0TYre5UX
	f4FZU7CbCModcRIghXSKSW+tGCv9yJHyXWPR0e7sd9P1U2MXyu6PsCkZDmGrCxOP
	aqaTCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0jtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530f49fc5ffso120724621cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656016; x=1791260816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=j6V2dOfpBvWr4/ooJSVgoQeqHiqY+sDtJ5arPlZUwmkCRBWqYTOnkGf8AbYlmvxTrM
         l0pnS2XdhlJ8WofoMai8UQuEUoc8WSu5wboluMPfXI/Xuk+nlOfbc7Y6aK9Y5z6nNDtm
         yhSvj190V4Zt29lkdZkFn85P08mBonsvfdi9Qpo0qGIkgbJtEy0ZViosiYYFB2b7KlF2
         CSLYq7Tsj3VxXqmXDxqAfTwiLAHSmUJA7++sknKbc3t0ELnQZ31cU1SkW3O+Q0XMaHoT
         eXN8HhS19jR2lsHNYXbubbRSs6rEgRRqE6LXZNZjqUdkkt3hGltvqBxaVnSlxvm8ced5
         MT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656016; x=1791260816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=JtN1OyWpcDmqpBPIT3P7EI9lpk1w3i5I9o4jODqORI7oI5zAqm35d879oESfpIOlMF
         TCn9lo4x8QWytggkGrgphQJBYdDlsVwIxSstplBXEQysmZ55FecDwXUD4p1N9q/PWW7U
         IPIul08Zv0y1xMvQ92aI+SILIr1E8DRbsZ9DjW1ysyEJoSdNk/rP1j18SclPaHDAyhfD
         8HUq5+y6rdml4uA0XCSo4Gkpdvt2ELwQwPQ6arSQmYeStbkd5rTaprnAYLS3sorwVTno
         7QfEwxpxjGC/ZuZwrqU8AHJJILNkK0g2WwY85Aaj3fTQ35x2TAHIPV+y4PrLufm0i8B9
         qFhw==
X-Forwarded-Encrypted: i=1; AKwUvBw1W0JFQDN9+csKMbIVLzqIJnoD18S6wCe97kMPghsFQuAzmvvffvkHK3pCxHOh4JqosCOrxVy2tihEVQM=@vger.kernel.org
X-Gm-Message-State: AFuF++lC+b/WNo5xBPXidqL7cmFpMsAaqBZ+dRScNzgkf6PKDh6SFZuh
	URBP4DyW3A7psF8aolz0EalWNlsuIFBpGIGd82iDQmO8le4oVWd1pyYbDge2GMf+7G7eaIA0NqR
	gCb0VQdEEDaxIxwNOd0f+G2J1cDuzaqiO8fNJ22/oa6eO8mArL8QiDEf2xWCqmvV9vnI=
X-Gm-Gg: AYBFou15xsuH8rs59V3mABZWrpJNy42Xlm/Spt5n8P30dUHcT3Hkx9dipi+4ZFBKsWP
	fUnGZeCKT5g0SHwgt9taSWTDtv/DrUufX05BGFGcIZxNGsfSlGk7s4uP0Og4qg+kzl4GgEGuedC
	RK00e3NtErXcE/GjxnCwFRkoc/UGqO0iwc4pXROdJ5osJgTIFXEzmjG23SAStT/aqZSRbHWtv15
	v771v1DA48Z+OWi5/gjTQGTsE+fzyeLNWoZVTg7iDmnT3NZx0RvS4FQjYvETMfl1+cjjltyj+T7
	8xnw4DF0LdKYqGMRlOw/CUVgZm9xtEyp9JlDY5B5lRtraT+Jm+cAtIZNkJoU2c8fzO4e7cA6LWw
	EQtyu5VVfrJglyCfUv1VqU6b5LK2rSzcP7B47p6oK8p+vIWl4art8qu1gJBiMze4=
X-Received: by 2002:a05:620a:454d:b0:93c:779f:3e02 with SMTP id af79cd13be357-93c779f4691mr1143570985a.11.1790656016297;
        Mon, 28 Sep 2026 21:26:56 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:93c:779f:3e02 with SMTP id af79cd13be357-93c779f4691mr1143568985a.11.1790656015798;
        Mon, 28 Sep 2026 21:26:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:30 +0800
Subject: [PATCH v7 06/35] drm/msm/dp: add MST stream register definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=7708;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
 b=I/7nIHP1RW9aZmYgnWyL0LaA78c1Jsbnpx1hjSBTPHp9cgY2ReI1JipgsXq3wuprE6c46hOnD
 trpNSP+Q6BVDLf1Rf24xNIkOzt0dN9LylUswugJTH5rlyq+qcws3h5f
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8nJSauibvzC/
 8mawmG6MetVJYAKEgY5FrnmSRFO7QVFq8kvGxsToMMuf/NUFN7cMUaqhZunu6RgKP12tqe9WZTU
 Q24ZdIAJ8LtGSrOLtaxEqADTLxCEcB4=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3e11 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qrQA6X-0r1DpH4znwvkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX3za1L+qprLdw
 XZ4OPWrfgiVdqEg8/daKXANzEAU1+QSGoqgNUL6X1B8MvbcB+CrDKMFjKD4cZpXnV0u8ZE3k+z6
 RfQIw8swPh3s29E0sgKMMgCeEEj3CHayH2a1OHKlGtzOJK8dSgGFrpuk8/U3PswAz3CycoR7Ono
 Nn7nc7/Gt1rbYTnvRnign3x0I3M4QLE3VFcILQdN5QLfsLHtNTKXrND7aDCGublItBMPN552DFj
 k1gLdcvGdSDVfPURNgAMg1wEnIv1hF1tybgxHUtONjPl6lo0tn9jBW6siwedZG+cjlyJjxrwBOA
 NOxDVFX+6WxKigVcwlZVHoKH3oqNtUSIPY7n1pp793V2nt6EV45UyWMgMYyuV4GEsGwPddOnwZq
 djGH+NPItVF7X2JAVdXUKvogoX3drJgicE6d5wXSLI7xD0JNjbdwGctpQxVMVmVHhssIuHEf+9C
 k8sPrprE3/WWCtq3vgw==
X-Proofpoint-GUID: _awx4zmeF6fr026_PImJ0ay0aP7Np37h
X-Proofpoint-ORIG-GUID: _awx4zmeF6fr026_PImJ0ay0aP7Np37h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

Add the stream-1 (DP1) and MST-link register definitions together with
msm_dp_stream_reg(), a helper that translates stream-0 register offsets
into their stream-specific equivalents.

Keeping the register definitions and translation helper together ensures
that all supported mappings are defined in one place.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 65 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_reg.h   | 56 +++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7b5fc5bb16de..504d7542d30a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -29,6 +29,71 @@ struct msm_dp_panel_private {
 	bool panel_on;
 };
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
+{
+	bool is_s1 = (id == DP_STREAM_1);
+
+	if (id == DP_STREAM_0)
+		return reg;
+
+	switch (reg) {
+	case REG_DP_STATE_CTRL:
+		return is_s1 ? REG_DP_STATE_CTRL : REG_DP_MSTLINK_STATE_CTRL;
+	case REG_DP_CONFIGURATION_CTRL:
+		return is_s1 ? REG_DP1_CONFIGURATION_CTRL : REG_DP_MSTLINK_CONFIGURATION_CTRL;
+	case REG_DP_SOFTWARE_MVID:
+		return is_s1 ? REG_DP1_SOFTWARE_MVID : REG_DP_MSTLINK_SOFTWARE_MVID;
+	case REG_DP_SOFTWARE_NVID:
+		return is_s1 ? REG_DP1_SOFTWARE_NVID : REG_DP_MSTLINK_SOFTWARE_NVID;
+	case REG_DP_TOTAL_HOR_VER:
+		return is_s1 ? REG_DP1_TOTAL_HOR_VER : REG_DP_MSTLINK_TOTAL_HOR_VER;
+	case REG_DP_START_HOR_VER_FROM_SYNC:
+		return is_s1 ? REG_DP1_START_HOR_VER_FROM_SYNC
+			     : REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC;
+	case REG_DP_HSYNC_VSYNC_WIDTH_POLARITY:
+		return is_s1 ? REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY
+			     : REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY;
+	case REG_DP_ACTIVE_HOR_VER:
+		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
+	case REG_DP_MISC1_MISC0:
+		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
+	case REG_DP_DP0_TIMESLOT_1_32:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_1_32 : REG_DP_MSTLINK_TIMESLOT_1_32;
+	case REG_DP_DP0_TIMESLOT_33_63:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_33_63 : REG_DP_MSTLINK_TIMESLOT_33_63;
+	case REG_DP_DP0_RG:
+		return is_s1 ? REG_DP_DP1_RG : REG_DP_MSTLINK_DP_RG;
+	case MMSS_DP_SDP_CFG:
+		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
+	case MMSS_DP_SDP_CFG2:
+		return is_s1 ? MMSS_DP1_SDP_CFG2 : MMSS_DP_MSTLINK_SDP_CFG2;
+	case MMSS_DP_SDP_CFG3:
+		return is_s1 ? MMSS_DP1_SDP_CFG3 : MMSS_DP_MSTLINK_SDP_CFG3;
+	case MMSS_DP_GENERIC0_0:
+		return is_s1 ? MMSS_DP1_GENERIC0_0 : MMSS_DP_MSTLINK_GENERIC0_0;
+	case MMSS_DP_GENERIC0_1:
+		return is_s1 ? MMSS_DP1_GENERIC0_1 : MMSS_DP_MSTLINK_GENERIC0_1;
+	case MMSS_DP_GENERIC0_2:
+		return is_s1 ? MMSS_DP1_GENERIC0_2 : MMSS_DP_MSTLINK_GENERIC0_2;
+	case MMSS_DP_GENERIC0_3:
+		return is_s1 ? MMSS_DP1_GENERIC0_3 : MMSS_DP_MSTLINK_GENERIC0_3;
+	case MMSS_DP_GENERIC0_4:
+		return is_s1 ? MMSS_DP1_GENERIC0_4 : MMSS_DP_MSTLINK_GENERIC0_4;
+	case MMSS_DP_GENERIC0_5:
+		return is_s1 ? MMSS_DP1_GENERIC0_5 : MMSS_DP_MSTLINK_GENERIC0_5;
+	case MMSS_DP_GENERIC0_6:
+		return is_s1 ? MMSS_DP1_GENERIC0_6 : MMSS_DP_MSTLINK_GENERIC0_6;
+	case MMSS_DP_GENERIC0_7:
+		return is_s1 ? MMSS_DP1_GENERIC0_7 : MMSS_DP_MSTLINK_GENERIC0_7;
+	case MMSS_DP_GENERIC0_8:
+		return is_s1 ? MMSS_DP1_GENERIC0_8 : MMSS_DP_MSTLINK_GENERIC0_8;
+	case MMSS_DP_GENERIC0_9:
+		return is_s1 ? MMSS_DP1_GENERIC0_9 : MMSS_DP_MSTLINK_GENERIC0_9;
+	default:
+		return reg;
+	}
+}
+
 static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
 {
 	return readl_relaxed(panel->link_base + offset);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 218a09a2fa65..75b23c106a99 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -99,6 +99,8 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg);
+
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index dda4b642c81b..265da58e064c 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -302,6 +302,35 @@
 #define MMSS_DP_VSCEXT_8			(0x000002F0)
 #define MMSS_DP_VSCEXT_9			(0x000002F4)
 
+/* Stream 1 (DP1) registers, relative to link_base. */
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041c)
+#define REG_DP1_START_HOR_VER_FROM_SYNC		(0x00000420)
+#define REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000424)
+#define REG_DP1_ACTIVE_HOR_VER			(0x00000428)
+#define REG_DP1_MISC1_MISC0			(0x0000042c)
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP1_GENERIC0_1			(0x00000494)
+#define MMSS_DP1_GENERIC0_2			(0x00000498)
+#define MMSS_DP1_GENERIC0_3			(0x0000049c)
+#define MMSS_DP1_GENERIC0_4			(0x000004a0)
+#define MMSS_DP1_GENERIC0_5			(0x000004a4)
+#define MMSS_DP1_GENERIC0_6			(0x000004a8)
+#define MMSS_DP1_GENERIC0_7			(0x000004ac)
+#define MMSS_DP1_GENERIC0_8			(0x000004b0)
+#define MMSS_DP1_GENERIC0_9			(0x000004b4)
+#define MMSS_DP1_SDP_CFG			(0x000004e0)
+#define MMSS_DP1_SDP_CFG2			(0x000004e4)
+#define MMSS_DP1_SDP_CFG3			(0x000004e8)
+#define REG_DP_DP0_RG				(0x000004f8)
+#define REG_DP_DP1_RG				(0x000004fc)
+
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)
 
@@ -334,6 +363,33 @@
 #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
+/* Streams 2/3 registers, relative to mst2link_base / mst3link_base. */
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
+#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003c)
+#define REG_DP_MSTLINK_SOFTWARE_MVID		(0x00000040)
+#define REG_DP_MSTLINK_SOFTWARE_NVID		(0x00000044)
+#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
+#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004c)
+#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
+#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
+#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
+#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000bc)
+#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000c0)
+#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000c4)
+#define MMSS_DP_MSTLINK_GENERIC0_3		(0x000000c8)
+#define MMSS_DP_MSTLINK_GENERIC0_4		(0x000000cc)
+#define MMSS_DP_MSTLINK_GENERIC0_5		(0x000000d0)
+#define MMSS_DP_MSTLINK_GENERIC0_6		(0x000000d4)
+#define MMSS_DP_MSTLINK_GENERIC0_7		(0x000000d8)
+#define MMSS_DP_MSTLINK_GENERIC0_8		(0x000000dc)
+#define MMSS_DP_MSTLINK_GENERIC0_9		(0x000000e0)
+#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
+#define MMSS_DP_MSTLINK_SDP_CFG2		(0x00000110)
+#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
+#define REG_DP_MSTLINK_DP_RG			(0x0000011C)
+
 #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
 
 #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)

-- 
2.43.0

