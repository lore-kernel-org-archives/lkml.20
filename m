Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835091;
	b=P61LV8ViQlHyzPm+QowFV01xPLHXGVzqg0Lp0WMnFqjRD5NGIdueGsXDMAcSUuqhD8q3
	 b/y1SBbOUHmRI6TLtWAYyuXSDsZFyNkunEVAkyzdFkqwQ+2rK6u+GujlGNRArtAgwcepp
	 X5Ma1BBRyox/CEb0AGT39mAVz7rRjdMwbURnIn8x4rXIxhnuLO5llrQd2o5YHbGaxCKN7
	 /+UWVF74AJXmg7koKamimXeZqgYDlPY8g54AhM0g1UAMPAa9m5c8MpM+2OKSuS4cTXYt9
	 yJxWHG+cnKR12BYaXZYABPyqG0+1gfw+t4feV4BoXYDzGM1ZqOOnjw+WNGFrJYccVVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835091;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
	b=eyXvJ7byI5JlJKuWZVEQ0P/IHVScDWv6WJA1mMtwnPefck9KxamGD6ZH8IS+HNyXauHn
	 ogA5+64o3cXJlHQW6l0anl/cXY18hakDr7lscI70URDU85Ak8Bxwe6STbz7cpPng9W9/j
	 D+QcYlmHVjX9Z2kAha9srwqivL5j4W3F0TS2l+LejYXGB+o44TNJoO/0NgkwOSoDHwy8W
	 +5ja/GnZNe1WyAwgjXoWWdL208NTxuSOmhHU/wY0MXmTGCcunurnOJh6ZFuQSgHi3KYhm
	 Gbm8wjwUy446ja+D+yaG4JytFkPVxohpCdj7dCRTUCs4ybnM3MR+GNSgsAyUNHvNQaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zc7kL8HQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2XD5HdT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3795606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3795606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zc7kL8HQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2XD5HdT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1HVU3117266
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=; b=Zc7kL8HQ1JDu3LsG
	qhLcwxYLryxLs3hRcdFlehR+VbQl9CdHfnp7kAXQI8M6/BOF2h1hGQfrYEC3Qiby
	jpPgbBjyxs7EnWcuyBK6S6qrFOqIJBiIuQLjHArQisBn3EsjgDF99UZFcqtDfdHh
	5eiYdPGqq99JWMmo9DdUrRui4hgafPHQFT5+om0TDMobDxg7W1gMoz4g4XLHagdp
	myd0A2MCOeydg1vO5y71eLfdAqfRomtjk15LKznV/8UaiAeNjEkuhl6/pYEDzHZs
	xxIIek1Xn9oBCWHhRZw44OPVAtgKvQOMTqLSP/MpKHkWGXh/cUdtQi4ifxDnobgp
	3DnK9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8082p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso459616685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835089; x=1795439889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
        b=L2XD5HdTd75SKhGi+GwrIWG5P5ABq9CumOOAQ0znN+x0HmM2ZsK8ZrxNAG2uu5SHNO
         JAerf7vWqU5RfjTwAwKy1UwHXDV8fx367KjHTI9yXA9wR7Jrh0BHlgvOSR/uq8MWfPv/
         CFQGApX2HU1iLFukQ0j2UW7uP2OsyCrd3dbf5ldeDbvCOKp33VreXh0lDICL7ZZmkgAi
         uzWc9H6Yfb7C93nUHfuUdHgfjtsIxToKvZXLfcKhZKom6GfirAjRYPSXMnug9u9FpiRu
         VZDdvgqsj5JF4z4Hz3Fds6a7zZYjk5+vCbODhU1HtUAvUCtW4qnajqOvJ34teuU0/V+7
         Giqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835089; x=1795439889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
        b=Wg+tt1fT5tuvc+aWVYDDW2cuolCgv/nGbB5Y2Y/xTnJHoaWaTy1U6WcTA4dGK/NImQ
         d9WCLfxS/+b33UpSXjUIrskL7EgifYcr03hhawN00q1ml3nkhlN1d1n4/ay0XcxfCayP
         pVEjfoO4mpkJYZO6IoJcb58ZW8Ur1Ir/sKx1IK9Z0IZ8PXE2h/KFY+gFqeSj8LWoPc5d
         D2P/XBdmP8eFPU/10oxlgqSYhIbLxNTK+GI4h8ifIMgjv1Pyc+l9HQ2Je81VjI2arpnY
         FXGDd0MYItiXcQl15zmKPlrHxUQRcRplGeByOdcnig3nAgr6yJO9EEa0voi0y9oRk0tR
         FSEQ==
X-Forwarded-Encrypted: i=1; AL+hErEfV/99iXCzBr1baV3odVLIgq461ySfmL5q+T8WeZHTF62J544Ta4cQhhHmBKKgqgpM1r+0mI5x/e81tls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dUYkRCGwSvrSi0VmrpTeCvyL+QUuReB/gntCls+aiS0jlvmoL
	znqKySYJYL/OUPXxUXspqfwrCLFGPPV0r2rPsjqg4hC1WzH5GGd5u2/B9HRrUjr9DRjGlPPU4Ob
	/oba7CcTLvwJaiu/VQzReVcNxQe4vcZLnYURp3JMhxzUpOzDDMXCs17/Bp0MYKNvlAgk=
X-Gm-Gg: AYBFou1qB8mKnOElEItbMJVUhtM17ghX5Wfla1meChlNYZtjHYSOTvJhGcToFnxk4yF
	/hVC1Anba56DWZuQMRtZhhe8PerGV0Vs6X14i5BmVdrri14pOAsbddGqWagyJYZS6/xkWC6qA+l
	gM5w2lZynjljXWBtReSU/yE/h9qtvF+uJI0RVlj0pPO/u2yph/zLjIrmfTeTk3nVp1AUF5X8ylf
	XZbIeapUXQZ1D9CIH75jHVlWyfzJxQja5fYIc54gSbuloIcB8TdatZh8qgTPwu2WQfZyy79LjYI
	+9EufbI+WUZGElja+OGc3GDeicL3an5QsNvhZ0jXh3B6oVRWjs04G906IY99rjPllUrDu2bEBrE
	mPTFjFc5shzoBJ1RnMY/3xoO2vBhUQ3vYR9NqwrVW9pbfJlPwqshif16aDK8uY65rHJtjAriJxi
	dR
X-Received: by 2002:a05:620a:2949:b0:949:7b7e:c101 with SMTP id af79cd13be357-9497b7ec67cmr478585585a.6.1794835088847;
        Mon, 16 Nov 2026 05:18:08 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:7b7e:c101 with SMTP id af79cd13be357-9497b7ec67cmr478577185a.6.1794835088123;
        Mon, 16 Nov 2026 05:18:08 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:07 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:45 +0530
Subject: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=3056;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=tNJZcT1SgyiVCTR5tI3Rgit0As7OaoMsLm8aGW6FkJY=;
 b=K2WAePHAK5sxP8sTbvcHlOZbYHt25AZY6NwjI0xtAg7tOCOGfYh4hTYpP5BPWCh0oqJ1n0I7K
 MMTczlWpUd6AYrAkk6G6wJxGt1o+x4PoOqwoy4cRnsnQMZaKfTKVwAC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfXz0WYiN6q0hXq
 6SOAy7V5DZTm8Fkv26IFshmloyvUzNmbMrg6q6WnfSIDdFCHKgUMss4pWAG62rCdthd8R8fy0Ae
 Xd4qGKJVrXzoYGXqlnq9xESHeyIkZ6l6cu557UjysBcH9z0CPOsQ6UzubyEDJfNpdnWrxs90/48
 Wv5NZTd5xt7839vWlxc1J4CIZR4/fRJ9bXFyd+P0uGbCcLzWiLhwg0Do3wctESC8+891nKciydf
 WLZeKvpEniTe/Dq/IHqV+jRV0R5HDWWYjRg2epLmxtem5qQGn8fERkm3rVDHXCuDcHnvCtcHDby
 nQ/6DKckhW2rxkGq+5ELgQopA5Vk1iM/8bA+fddU+qvpF76te/fAKshyLcDjqqZpCdY/KVIIAhG
 GH+3sX8lGDKP/ZmvC9+4+GDT+/mLPI2MvFU5iNhvBWP861kL6bQ7o/Bp2F3V7ICFkTSyyXnz8UQ
 E3j50VhR47CKEbuDSNA==
X-Proofpoint-GUID: q89ib9sk8O-pWtqVl3b8BnC0NCRq1SDD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX0au+a8oiylOn
 wL5y0HQ5/plXIyRj7DVnoxnAuYiD7Zc3KwZ4DRwJqw2d0Tpwi7lSp+zxwPLy4meR6x4Upg+O9if
 mWGim25c2+EjwN2qTRCrs/6sMXFBfsY=
X-Proofpoint-ORIG-GUID: q89ib9sk8O-pWtqVl3b8BnC0NCRq1SDD
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb0291 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QKV3EQzOLTW8gb8NrR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
on all MDP_INTFn_INTR entries being sequential — MDP_INTFn_INTR() macro
computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
Appending INTF_9 and INTF_10 after the tear entries would break this
assumption, causing DSI tear interrupts on existing platforms to map to
wrong interrupt registers.

Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
block intact. Add the corresponding register entries to
dpu_intr_set_7xxx and dpu_intr_set_13xx.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h       |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5b7cd5241f45..c9c297ca080c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -206,6 +206,16 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 		MDP_INTF_REV_7xxx_INTR_EN(8),
 		MDP_INTF_REV_7xxx_INTR_STATUS(8)
 	},
+	[MDP_INTF9_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_CLEAR(9),
+		MDP_INTF_REV_7xxx_INTR_EN(9),
+		MDP_INTF_REV_7xxx_INTR_STATUS(9)
+	},
+	[MDP_INTF10_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_CLEAR(10),
+		MDP_INTF_REV_7xxx_INTR_EN(10),
+		MDP_INTF_REV_7xxx_INTR_STATUS(10)
+	},
 };
 
 /*
@@ -282,6 +292,16 @@ static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
 		MDP_INTF_REV_13xx_INTR_EN(8),
 		MDP_INTF_REV_13xx_INTR_STATUS(8)
 	},
+	[MDP_INTF9_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(9),
+		MDP_INTF_REV_13xx_INTR_EN(9),
+		MDP_INTF_REV_13xx_INTR_STATUS(9)
+	},
+	[MDP_INTF10_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(10),
+		MDP_INTF_REV_13xx_INTR_EN(10),
+		MDP_INTF_REV_13xx_INTR_STATUS(10)
+	},
 };
 
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 142358a105c5..7b8a04f8d209 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -27,6 +27,8 @@ enum dpu_hw_intr_reg {
 	MDP_INTF6_INTR,
 	MDP_INTF7_INTR,
 	MDP_INTF8_INTR,
+	MDP_INTF9_INTR,
+	MDP_INTF10_INTR,
 	MDP_INTF1_TEAR_INTR,
 	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 0e65bf5ddc4a..7eccb4d2c65e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -226,6 +226,8 @@ enum dpu_intf {
 	INTF_6,
 	INTF_7,
 	INTF_8,
+	INTF_9,
+	INTF_10,
 	INTF_MAX
 };
 

-- 
2.34.1

