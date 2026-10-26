Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995798;
	b=QXnkcW9e8AcTa6EXcAiHIl43JFzD15ljA5yif8cxVsYOo2c7Qu/zNgEJ+t0DMCYz0ZCo
	 8Djzrkp2lWDeSjR6Yia41d6AxmhmTPkkkho3Ko1g/6EhErjPLDq/HG3xOKJvOcRGnPSre
	 +ODS6HXYGcHjuWilnNkyw6vx6fZDBkp2xv9WgYl9O1VnOqA4SI1QRuvI+XMRCvngVPg/O
	 T95OLqexNv1EOgyPOWcy5uSiPgmp+VX7Hi2INuP8Cv4ljVM6lDEC4WYVT5z4ImYWaw80z
	 JlEnhYDY2/m6hpQmwNxYAdbpTpAEb2EQt9TGVDGZR6PxM+M2VrOCXZo49cMMqwN+oqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LjE2yHacmzRPMA3aNl9XYPGSqr/tdnZwqyUu1XlnONc=;
	b=gxezCx43YPdIj+kVDnEwZUSC/GUx1f7Iupm6xnK1h5WdJHjNz60egdYUNmZ0TmlRh77R
	 ORfuJ3WAS+KRq3QAGa99M851hXbm2NueD9TygSKyzjKPTHY1HWoIMjqhshALnL09UkFlU
	 SmwkNHR3YZ9QApNQKpaDdjPkJmqfEfR8WVXlxUezQnegphb+pGnlPmAAdfD7Mone8SG/y
	 Am+htqoPvVXvm7aFLKFx8UpQ3E6ptLPjpF0n3hWiIlJNss8pbCFWlRaMGaEWGg79tlnHj
	 e6kW6BwTmdCz3TV3Am+KbhVsgaVTIL4ZlSgtGyRxGVJLCBYNL97OJVe0BfLRJHP0udg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShMRqZlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGqNo8eL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FB606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShMRqZlB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGqNo8eL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4axW82727320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjE2yHacmzRPMA3aNl9XYPGSqr/tdnZwqyUu1XlnONc=; b=ShMRqZlBeylJ7nVk
	D6IDnN9JPeZv4PaeI7wEtIkxV6n0HxOWVXKK89r+tyk0WtW88aryqw+Yh1p1PKfv
	cYlU63agXzkFcP857p6hujaJI/g82yXVvhWIu3CTsKx5dZ3lvLmdOvHFovUVGiLv
	qOj7spoAMNk4xZAG5dp+s2mMVVq/BWH54PqooEoCwS83QeQPrGTx5/2tXmRhVzlb
	OaqBT1u5SXYhrvGWhEmqSZh3e08PiFgIyiDK+Krcj4wZBSfUgbKXMGt1QeZxgbkC
	q6oZX0Tomgv7yF25Ha4DuyvFHY2bhy3S6dMY3CaH8JpKM1f0A873o8G8JDnnZ1h3
	jtjcQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n60a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93e2f72bfso43337685ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995796; x=1793600596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjE2yHacmzRPMA3aNl9XYPGSqr/tdnZwqyUu1XlnONc=;
        b=WGqNo8eL3vAw/lFnmRfhKVEKw3nj4AExsDV0Mq2RJ513ofc5FxNbvqMD8Kvhhx64p2
         IziCxnR97x52r3t3wgCtVCRNdpE5QLBRnD4MgubPKJkZ5NW1EXLXxbbQdspY3Sfkrd5y
         6npZwPO3wgrC/bk/6D0JHzkNtC8myXeaG+Mo2oyItBAZzdWrkTaIIC890zM+xjG9I/uV
         OKagU0IA0VJON8MjwjRkNrFTicoALPyMewTqkD/6cKRtDwY//Tmhq8dKA+4YBSf+7f/n
         BYEkb3XETBTH0D1BndllZEKV1tUIGln7fuvpuD2a4WD+WhQ2OQsAMlx2o1NvB1lEv7U3
         fIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995796; x=1793600596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjE2yHacmzRPMA3aNl9XYPGSqr/tdnZwqyUu1XlnONc=;
        b=0nl5uDDELliedi6zxbQnup8+2+nJs3f2X8cLj5b2c+pVG1wFEcqdn4KVfQ9+Nd4y74
         nkmWJpQMCKusGeKr/LAcPsOIFbSfWE/JhMKFuavdt6dyayZnO34KdV8gjmMjJj7L5AZQ
         lw7AiHIpmvmhrmkB4Zj7fsMwTHhOJBwZ1ZwgmN9pF9j72abRJiGjPxnh0lf8NLO+Usu6
         Z4CxhF2DCwDH/sQxq3p7GoHKJZ0HRT0XnUqe3u0h2m5fsxf7UeNJuN49cnHMp4MHQ19+
         G75FktI0gmd0L8WnPdIRCqDunyWdWfXQry1w3G2gNtioq8Zl1Q4Ehc9XpZsw564SKOM4
         2Y3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+bq/8sPIQDsVRx72/okOapwtZPAtslIiBufRwQOierdhhakod7L3opt93UAoApBacvCIhVohsxGEkFRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEeG7l9nzYVFXIJyHNEK7Q/ItwBiCwAfDK92s0qIq8QAij7LAu
	KCivwnf6Ktr+S1EIgpDkrCaliK8AQnZaeUD1/cIB8Gyj2itVHNtLEgTLCxhC/OCZN+G4oejjttr
	2PpXpU36IMPLpXvEpeaxZYZ0T2G8nsm3kv8xDvYXvosbb1vBhIPE81jQmdFHum3rGruM=
X-Gm-Gg: AYBFou0qgEQKGs8gTQEUtzP18UDTXUT0zaUyXR2q7eZOBgFO+Xv600alY8doLoaOMvM
	bX4xO6hHEWFV5jT8Hm4M6l0dlrZqfpFHyjegKT9SUHKma2f9FsVhCoqcWCAqoSlGjz/QfVrgTX3
	U2H1DxWZ5INzy7gvQLhwE4zm0abS5cpWZ5jYbDTRnghjphB66R9y7SzPFFkXpoZ44RJf5UsU3KB
	YG3WIW0xXLygRY7/vGZRIFypMdQ2KmeghWzJFW6+ye0B/EoHYCDWJ+gzuewR1YlcIywyTEVsZN2
	Ui0HTg25R3+JzbEl2UJneldN4IYhTjlGt2f+B6w06KIa5R4xuM+mYV12YcdijbgkybU76DmJBGr
	JJzjNhrj2PvPyYFpGeWUFzGFZ4hzwN99P/A==
X-Received: by 2002:a17:902:ef49:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2ea9c806fb6mr53334685ad.43.1792995795396;
        Sun, 25 Oct 2026 23:23:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef49:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2ea9c806fb6mr53334425ad.43.1792995794845;
        Sun, 25 Oct 2026 23:23:14 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:23:14 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:19 +0530
Subject: [PATCH v2 09/23] drm/msm/dcp: Add generic HFI display commands
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-9-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=24031;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=zCBsx5NOJe3pvKpKhO0+QQqSo1Ch4Fux016xhuY7Rzs=;
 b=wYiX16YPpq5PhvZtnb+D+J0obeuVFQiNA7cBx0XIReGCzDpzHPGD8K8CC+yKY5Em/QtTTORvl
 cdeBlyLYFYhAxLIL6WWG8+CkovvL6vQ1ISYik4OqlvAMZX2zXzTmpTc
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 6JFo8eMtqc6GBm1QiGfoE2SHGFrmlioP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX5Rjc0uRzohAr
 XgeC27DfzgzvqyQRLmJWqAhm5xPTeEZDSYvo/D9jY9mtWXJf/5JUCJXT1TLqSd3dQ89XPghNGKw
 63U57PJn93At1S9rTZbN4OsiiK7mAYE=
X-Proofpoint-GUID: 6JFo8eMtqc6GBm1QiGfoE2SHGFrmlioP
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adef1d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gghG5JkKV87FW5kKUC4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXyBl8Y3A2ocgO
 eokV06ve5a1ZcbekSRzSWn5C1uLWYCByRnWmBLHSDaRANdOv5l0ZpRiYpzQRpziaQsydz8cPEDn
 oAI7XpSj+Ws/YifPXjO8s1nH2ciHDZZ3Jl0XMYEwEJu9nxD2hW7vW+L4qKDVMDPaKKsfManydsL
 kiQMDnFSsFMHhXvDqn8YGLhh5gzZW1fMOAVKOTL9GNuvsmEk/rQZ/D+Wow4iNNlkYpfXJAJSGbB
 843+xcF7qXAQTc7mVAOzNGaeZTycB4sOCXbamxaN1fydBYGWkxh9ripuYpC4VEI1lRSRNx4EQcD
 OZePntNDO+kRq+UZWOqItrwLeTpNMUG4xIX28VMF4pChz6eiqo1NSbaXVavMC5ufOsB2CHRdVRa
 CCl6e1ot9RMEIl+M3WzWfNT2IhdVvNEFMsJvjQLJDbdgjsvUC2QPR6mFaQEpElSPQDxaMWF4T8B
 VqpSAFA2sC3+PrGquPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Translate DRM display state into HFI commands for the firmware-owned
DCP pipeline. Since Linux cannot program the display hardware directly,
KMS operations need command helpers for resources, CRTCs, planes,
bandwidth, and frame sequencing.

Implement generic display command helpers and encode capability,
resource, layer, mixer, bandwidth, frame-trigger, and scan-sequence
state into HFI properties.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile              |   4 +
 drivers/gpu/drm/msm/dcp/dcp_hfi.h         |  32 +++
 drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c    | 191 ++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c |  64 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c     | 366 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c   |  63 +++++
 6 files changed, 720 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 9c698c4f4949..bdc5e3b8efa7 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -73,6 +73,10 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 
 msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_core.o \
+	dcp/dcp_hfi_crtc.o \
+	dcp/dcp_hfi_encoder.o \
+	dcp/dcp_hfi_kms.o \
+	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi.h b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
index 055e9c584892..6d3eadb5e811 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
@@ -210,6 +210,38 @@ int dcp_hfi_send_no_wait_atomic_flags(struct dcp_hfi *hfi, u32 cmd,
 				      enum hfi_cmd_buff_type cmd_type, u32 object_id,
 				      enum hfi_packet_payload_type payload_type,
 				      void *payload, u32 payload_size, u32 tx_flags);
+int dcp_hfi_display_event_register(struct dcp_hfi *hfi, u32 session_id,
+				   u32 event_id);
+int dcp_hfi_display_event_deregister(struct dcp_hfi *hfi, u32 session_id,
+				     u32 event_id);
+int dcp_hfi_display_event_register_async(struct dcp_hfi *hfi, u32 session_id,
+					 u32 event_id);
+int dcp_hfi_display_event_deregister_async(struct dcp_hfi *hfi,
+					   u32 session_id, u32 event_id);
+int dcp_hfi_crtc_set_resource(struct dcp_hfi *hfi, u32 session_id,
+			      u32 lm_idx, u32 width, u32 height,
+			      u32 roi_x, u32 roi_y);
+int dcp_hfi_crtc_set_dest_roi(struct dcp_hfi *hfi, u32 session_id,
+			      u32 x, u32 y, u32 width, u32 height);
+int dcp_hfi_crtc_set_scan_sequence_id(struct dcp_hfi *hfi, u32 session_id,
+				      u32 seq_id);
+int dcp_hfi_crtc_set_power_mode(struct dcp_hfi *hfi, u32 session_id,
+				enum hfi_display_power_mode mode);
+int dcp_hfi_crtc_set_autorefresh(struct dcp_hfi *hfi, u32 session_id,
+				 bool enable, u32 frame_count);
+int dcp_hfi_crtc_set_bw(struct dcp_hfi *hfi, u32 session_id,
+			u64 dram_ib, u64 dram_ab, u64 llcc_ib,
+			u64 llcc_ab, u64 core_clk);
+int dcp_hfi_submit_prop_pkt(struct dcp_hfi *hfi, const void *pkt,
+			    size_t pkt_size);
+int dcp_hfi_plane_disable(struct dcp_hfi *hfi, u32 session_id, u32 pipe_idx);
+int dcp_hfi_display_commit(struct dcp_hfi *hfi, u32 session_id);
+int dcp_hfi_send_device_init(struct dcp_hfi *hfi);
+int dcp_hfi_get_capabilities(struct dcp_hfi *hfi, struct dcp_caps *caps);
+int dcp_hfi_send_resource_register(struct dcp_hfi *hfi);
+int dcp_hfi_set_display_property(struct dcp_hfi *hfi, u32 session_id,
+				 u32 prop_id, u32 value);
+
 #endif /* __DCP_HFI_H__ */
 void dcp_hfi_set_power_control_cb(struct dcp_hfi *hfi, void *priv,
 				  void (*cb)(void *priv, u32 display_id,
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c
new file mode 100644
index 000000000000..c31a0628f4c9
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for display events and CRTC properties.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi_priv.h"
+#include "dcp_hfi.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_display_events.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
+#include "hfi/hfi_properties_display.h"
+
+int dcp_hfi_display_event_register(struct dcp_hfi *hfi, u32 session_id,
+				   u32 event_cmd)
+{
+	int ret = dcp_hfi_send_sync(hfi,
+				      HFI_COMMAND_DISPLAY_EVENT_REGISTER,
+				      HFI_CMD_BUFF_DISPLAY, session_id,
+				      HFI_PAYLOAD_U32,
+				      &event_cmd, sizeof(event_cmd),
+				      HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				      HFI_TX_FLAGS_NON_DISCARDABLE,
+				      NULL, 0,
+				      DCP_HFI_TIMEOUT_DISPLAY_MS);
+	return ret;
+}
+
+int dcp_hfi_display_event_deregister(struct dcp_hfi *hfi, u32 session_id,
+				     u32 event_cmd)
+{
+	int ret = dcp_hfi_send_sync(hfi,
+				      HFI_COMMAND_DISPLAY_EVENT_DEREGISTER,
+				      HFI_CMD_BUFF_DISPLAY, session_id,
+				      HFI_PAYLOAD_U32,
+				      &event_cmd, sizeof(event_cmd),
+				      HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				      HFI_TX_FLAGS_NON_DISCARDABLE,
+				      NULL, 0,
+				      DCP_HFI_TIMEOUT_DISPLAY_MS);
+	return ret;
+}
+
+int dcp_hfi_display_event_register_async(struct dcp_hfi *hfi,
+					 u32 session_id, u32 event_cmd)
+{
+	return dcp_hfi_send_no_wait_atomic_flags(hfi,
+			HFI_COMMAND_DISPLAY_EVENT_REGISTER,
+			HFI_CMD_BUFF_DISPLAY, session_id, HFI_PAYLOAD_U32,
+			&event_cmd, sizeof(event_cmd), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_display_event_deregister_async(struct dcp_hfi *hfi,
+					   u32 session_id, u32 event_cmd)
+{
+	return dcp_hfi_send_no_wait_atomic_flags(hfi,
+			HFI_COMMAND_DISPLAY_EVENT_DEREGISTER,
+			HFI_CMD_BUFF_DISPLAY, session_id, HFI_PAYLOAD_U32,
+			&event_cmd, sizeof(event_cmd), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_resource(struct dcp_hfi *hfi, u32 session_id,
+			      u32 lm_idx, u32 width, u32 height,
+			      u32 roi_x, u32 roi_y)
+{
+	u32 payload[7];
+
+	payload[0] = 1;
+	HFI_PACK(&payload[1], HFI_PROPERTY_DISPLAY_SET_RESOURCE_DATA,
+		 HFI_RESOURCE_LM, lm_idx, width, height,
+		 (roi_x << 16) | (roi_y & 0xFFFF));
+
+	return dcp_hfi_send_no_wait_flags(hfi,
+				       HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				       HFI_CMD_BUFF_DISPLAY,
+				       session_id,
+				       HFI_PAYLOAD_U32_ARRAY,
+				       payload, sizeof(payload),
+				       HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_dest_roi(struct dcp_hfi *hfi, u32 session_id,
+			      u32 x, u32 y, u32 width, u32 height)
+{
+	u32 payload[9];
+
+	payload[0] = 1;
+	HFI_PACK(&payload[1], HFI_PROPERTY_DISPLAY_DEST_ROI,
+		 session_id, PANEL_ROI, 1, x, y, width, height);
+
+	return dcp_hfi_send_no_wait_flags(hfi,
+				       HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				       HFI_CMD_BUFF_DISPLAY, session_id,
+				       HFI_PAYLOAD_U32_ARRAY, payload,
+				       sizeof(payload), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_scan_sequence_id(struct dcp_hfi *hfi, u32 session_id,
+				      u32 seq_id)
+{
+	u32 payload[3];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_SCAN_SEQUENCE_ID, 0, 1);
+	payload[2] = seq_id;
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload, sizeof(payload));
+}
+
+int dcp_hfi_crtc_set_power_mode(struct dcp_hfi *hfi, u32 session_id,
+				enum hfi_display_power_mode mode)
+{
+	u32 payload[3];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_POWER_MODE, 0, 1);
+	payload[2] = (u32)mode;
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload, sizeof(payload));
+}
+
+int dcp_hfi_crtc_set_autorefresh(struct dcp_hfi *hfi, u32 session_id,
+				 bool enable, u32 frame_count)
+{
+	u32 payload[4];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_AUTOREFRESH_CFG, 0, 2);
+	payload[2] = enable ? 1 : 0;
+	payload[3] = frame_count;
+
+	return dcp_hfi_send_sync(hfi,
+				 HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				 HFI_CMD_BUFF_DISPLAY,
+				 session_id,
+				 HFI_PAYLOAD_U32_ARRAY,
+				 payload, sizeof(payload),
+				 HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE,
+				 NULL, 0,
+				 DCP_HFI_TIMEOUT_DISPLAY_MS);
+}
+
+int dcp_hfi_crtc_set_bw(struct dcp_hfi *hfi, u32 session_id,
+			u64 dram_ib, u64 dram_ab,
+			u64 llcc_ib, u64 llcc_ab,
+			u64 core_clk)
+{
+	u32 payload[16];
+	u32 *p = payload;
+
+	*p++ = 5;
+
+#define PACK_U64_PROP(prop_id, val) \
+	do { \
+		typeof(val) __val = (val); \
+		*p++ = HFI_PACK_KEY((prop_id), 0, 2); \
+		*p++ = lower_32_bits(__val); \
+		*p++ = upper_32_bits(__val); \
+	} while (0)
+
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_DRAM_IB,  dram_ib);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_DRAM_AB,  dram_ab);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_LLCC_IB,  llcc_ib);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_LLCC_AB,  llcc_ab);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_CORE_CLK, core_clk);
+
+#undef PACK_U64_PROP
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload,
+				      (u32)((p - payload) * sizeof(u32)));
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c
new file mode 100644
index 000000000000..45d4ab2e5a87
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * HFI commands for display commits and encoder properties.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi_priv.h"
+#include "dcp_hfi.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_properties_display.h"
+#include "hfi/hfi_packet.h"
+
+int dcp_hfi_display_commit(struct dcp_hfi *hfi, u32 session_id)
+{
+	u32 commit_flag = HFI_COMMIT;
+	int ret;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_FRAME_TRIGGER,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32,
+				&commit_flag, sizeof(commit_flag),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_COMMIT_MS);
+	if (ret)
+		dev_err(hfi->dev, "HFI FRAME_TRIGGER(COMMIT) failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+int dcp_hfi_set_display_property(struct dcp_hfi *hfi, u32 session_id,
+				 u32 prop_id, u32 value)
+{
+	u32 payload[3];
+	int ret;
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(prop_id, 0, 1);
+	payload[2] = value;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				payload, sizeof(payload),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_MS);
+	if (ret)
+		dev_err(hfi->dev,
+			"HFI SET_PROPERTY prop=0x%x failed: %d\n",
+			prop_id, ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c
new file mode 100644
index 000000000000..ac8000a8ee90
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for device initialization, capability parsing, and resource setup.
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+#include "hfi/hfi_commands_device.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_pack_unpack_common.h"
+#include "hfi/hfi_properties_device.h"
+#include "hfi/hfi_properties_display.h"
+#include "hfi/hfi_utils.h"
+
+static void dcp_hfi_caps_cache_init(struct dcp_hfi_caps_cache *cache)
+{
+	init_completion(&cache->device_done);
+	init_completion(&cache->display_done);
+}
+
+static void dcp_hfi_caps_cache_start(struct dcp_hfi *hfi)
+{
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+	dcp_hfi_caps_cache_init(&hfi->caps_cache);
+}
+
+static void dcp_hfi_caps_cache_stop(struct dcp_hfi *hfi)
+{
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+}
+
+int dcp_hfi_send_device_init(struct dcp_hfi *hfi)
+{
+	int ret;
+
+	mutex_lock(&hfi->caps_cache_lock);
+	dcp_hfi_caps_cache_start(hfi);
+
+	/* Payload and flags follow the HFI device-command definition. */
+	dev_dbg(hfi->dev,
+		"HFI DEVICE_INIT cmd=0x%x flags=0x%x timeout=%ums\n",
+		HFI_COMMAND_DEVICE_INIT,
+		HFI_TX_FLAGS_RESPONSE_REQUIRED | HFI_TX_FLAGS_NON_DISCARDABLE,
+		DCP_HFI_TIMEOUT_INIT_MS);
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DEVICE_INIT,
+				HFI_CMD_BUFF_DEVICE, 0,
+				HFI_PAYLOAD_NONE, NULL, 0,
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_INIT_MS);
+	if (ret) {
+		dev_err(hfi->dev, "HFI DEVICE_INIT failed: %d\n", ret);
+		dcp_hfi_caps_cache_stop(hfi);
+	} else {
+		dev_dbg(hfi->dev, "HFI DEVICE_INIT succeeded\n");
+	}
+
+	mutex_unlock(&hfi->caps_cache_lock);
+	return ret;
+}
+
+static void dcp_hfi_parse_init_caps_kv(struct dcp_caps *caps,
+				       u32 prop_key,
+				       const u32 *payload,
+				       u32 max_words)
+{
+	u32 prop_id = HFI_PROP_ID(prop_key);
+	u32 count, i;
+
+	if (!payload || !max_words)
+		return;
+
+	switch (prop_id) {
+	case HFI_PROPERTY_DEVICE_INIT_DCP_HW_VERSION:
+		caps->dcp_hw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MDSS_HW_VERSION:
+		caps->hw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DCP_FW_VERSION:
+		caps->fw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_VIG_INDICES:
+		if (max_words < 1)
+			break;
+		count = payload[0];
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->num_vig_pipes = 0;
+		caps->virt_vig_count = 0;
+		for (i = 0; i < count; i++) {
+			u32 idx = payload[1 + i];
+
+			if (DCP_REC_ID(idx) == 0) {
+				if (caps->num_vig_pipes < DCP_MAX_SSPP_COUNT)
+					caps->vig_pipe_ids[caps->num_vig_pipes++] = idx;
+			} else {
+				if (caps->virt_vig_count < DCP_MAX_SSPP_COUNT)
+					caps->vig_r1_indices[caps->virt_vig_count++] = idx;
+			}
+		}
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DMA_INDICES:
+		if (max_words < 1)
+			break;
+		count = payload[0];
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->num_dma_pipes = 0;
+		caps->virt_dma_count = 0;
+		for (i = 0; i < count; i++) {
+			u32 idx = payload[1 + i];
+
+			if (DCP_REC_ID(idx) == 0) {
+				if (caps->num_dma_pipes < DCP_MAX_SSPP_COUNT)
+					caps->dma_pipe_ids[caps->num_dma_pipes++] = idx;
+			} else {
+				if (caps->virt_dma_count < DCP_MAX_SSPP_COUNT)
+					caps->dma_r1_indices[caps->virt_dma_count++] = idx;
+			}
+		}
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MAX_DISPLAY_COUNT:
+		caps->num_displays = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DSI_INDICES:
+		if (max_words < 1)
+			break;
+		count = min_t(u32, payload[0], DCP_MAX_BLOCKS);
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->dsi_count = count;
+		for (i = 0; i < count; i++)
+			caps->dsi_indices[i] = payload[1 + i];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MAX_DSI_RESOLUTION:
+		{
+			u32 w = (payload[0] >> 16) & 0xFFFF;
+			u32 h = payload[0] & 0xFFFF;
+
+			if (w > caps->max_width)
+				caps->max_width  = w;
+			if (h > caps->max_height)
+				caps->max_height = h;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void dcp_hfi_log_pipe_ids(struct device *dev, const char *label,
+				 const u32 *ids, u32 count)
+{
+	char buf[128];
+	int pos = 0;
+	u32 i;
+
+	for (i = 0; i < count && pos < (int)sizeof(buf) - 8; i++)
+		pos += scnprintf(buf + pos, sizeof(buf) - pos,
+				  "%s0x%x", i ? "," : "", ids[i]);
+
+	dev_dbg(dev, "%s: count=%u ids=[%s]\n", label, count, buf);
+}
+
+static int dcp_hfi_parse_kv_buf(struct dcp_hfi *hfi, struct dcp_caps *caps,
+				const u8 *buf, u32 buf_len)
+{
+	struct hfi_util_kv_parser kv_parser;
+	u32 prop_key, *prop_payload, max_words, last_read;
+	int ret;
+
+	ret = hfi_util_kv_parser_init(&kv_parser, buf_len, (u32 *)buf);
+	if (ret) {
+		dev_err(hfi->dev, "KV parser init failed: %d\n", ret);
+		return ret;
+	}
+
+	last_read = 0;
+	ret = hfi_util_kv_parser_get_next(&kv_parser, last_read,
+					  &prop_key, &prop_payload, &max_words);
+	while (!ret && prop_key) {
+		dcp_hfi_parse_init_caps_kv(caps, prop_key,
+					   prop_payload, max_words);
+		last_read = HFI_PROP_SZ(prop_key) ?: max_words;
+		ret = hfi_util_kv_parser_get_next(&kv_parser, last_read,
+						  &prop_key, &prop_payload,
+						  &max_words);
+	}
+	return ret;
+}
+
+int dcp_hfi_get_capabilities(struct dcp_hfi *hfi, struct dcp_caps *caps)
+{
+	struct dcp_hfi_caps_cache *cache;
+	int ret = 0, opt_ret;
+
+	memset(caps, 0, sizeof(*caps));
+
+	mutex_lock(&hfi->caps_cache_lock);
+	cache = &hfi->caps_cache;
+
+	if (!wait_for_completion_timeout(&cache->device_done,
+					 msecs_to_jiffies(DCP_HFI_TIMEOUT_CAPS_MS))) {
+		dev_err(hfi->dev,
+			"DEVICE_INIT_DEVICE_CAPS timeout after %ums\n",
+			DCP_HFI_TIMEOUT_CAPS_MS);
+		ret = -ETIMEDOUT;
+		goto out_free_cache;
+	}
+
+	if (!cache->device_len) {
+		dev_err(hfi->dev, "DEVICE_INIT_DEVICE_CAPS: empty payload\n");
+		ret = -ENODATA;
+		goto out_free_cache;
+	}
+
+	ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->device_buf,
+				   cache->device_len);
+	if (ret)
+		goto out_free_cache;
+
+	if (!wait_for_completion_timeout(&cache->display_done,
+					 msecs_to_jiffies(DCP_HFI_TIMEOUT_CAPS_MS))) {
+		dev_warn(hfi->dev,
+			 "DEVICE_INIT_DISPLAY_CAPS not received\n");
+	} else if (cache->display_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->display_buf,
+					       cache->display_len);
+		if (opt_ret) {
+			dev_warn(hfi->dev,
+				 "DISPLAY_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		}
+	}
+	if (cache->vig_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->vig_buf,
+					       cache->vig_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "VIG_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "VIG_CAPS",
+					     caps->vig_pipe_ids,
+					     caps->num_vig_pipes);
+	}
+
+	if (cache->dma_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->dma_buf,
+					       cache->dma_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "DMA_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "DMA_CAPS",
+					     caps->dma_pipe_ids,
+					     caps->num_dma_pipes);
+	}
+
+	if (cache->vig_r1_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->vig_r1_buf,
+					       cache->vig_r1_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "VIG_R1_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "VIG_R1_CAPS",
+					     caps->vig_r1_indices,
+					     caps->virt_vig_count);
+	}
+
+	if (cache->dma_r1_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->dma_r1_buf,
+					       cache->dma_r1_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "DMA_R1_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "DMA_R1_CAPS",
+					     caps->dma_r1_indices,
+					     caps->virt_dma_count);
+	}
+	caps->max_planes = caps->num_vig_pipes + caps->num_dma_pipes;
+	if (!caps->num_displays) {
+		dev_err(hfi->dev, "invalid DCP caps: zero display count\n");
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	if (!caps->max_width || !caps->max_height) {
+		dev_err(hfi->dev, "invalid DCP caps: max resolution %ux%u\n",
+			caps->max_width, caps->max_height);
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	if (!caps->max_planes) {
+		dev_err(hfi->dev, "invalid DCP caps: no scanout pipes\n");
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	dev_dbg(hfi->dev,
+		"DCP caps: fw=0x%x hw=0x%x dcp=0x%x disp=%u max=%ux%u vig=%u dma=%u\n",
+		caps->fw_rev, caps->hw_rev, caps->dcp_hw_rev,
+		caps->num_displays, caps->max_width, caps->max_height,
+		caps->num_vig_pipes, caps->num_dma_pipes);
+
+out_free_cache:
+	dcp_hfi_caps_cache_stop(hfi);
+	mutex_unlock(&hfi->caps_cache_lock);
+	return ret;
+}
+
+int dcp_hfi_send_resource_register(struct dcp_hfi *hfi)
+{
+	static const u32 resource_ids[] = {
+		HFI_PROPERTY_DISPLAY_DRAM_IB,
+		HFI_PROPERTY_DISPLAY_DRAM_AB,
+		HFI_PROPERTY_DISPLAY_LLCC_IB,
+		HFI_PROPERTY_DISPLAY_LLCC_AB,
+		HFI_PROPERTY_DISPLAY_CORE_IB,
+		HFI_PROPERTY_DISPLAY_CORE_AB,
+		HFI_PROPERTY_DISPLAY_CORE_CLK,
+	};
+	u32 payload[1 + ARRAY_SIZE(resource_ids)];
+	u32 i;
+	int ret;
+
+	payload[0] = ARRAY_SIZE(resource_ids);
+	for (i = 0; i < ARRAY_SIZE(resource_ids); i++)
+		payload[1 + i] = resource_ids[i];
+
+	dev_dbg(hfi->dev, "sending HFI_COMMAND_DEVICE_RESOURCE_REGISTER (%zu resources)\n",
+		ARRAY_SIZE(resource_ids));
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DEVICE_RESOURCE_REGISTER,
+				HFI_CMD_BUFF_DEVICE, 0,
+				HFI_PAYLOAD_U32_ARRAY,
+				payload, sizeof(payload),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_RESOURCE_REGISTER_MS);
+	if (ret)
+		dev_err(hfi->dev,
+			"HFI RESOURCE_REGISTER failed: %d\n", ret);
+	else
+		dev_dbg(hfi->dev, "HFI RESOURCE_REGISTER succeeded\n");
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c
new file mode 100644
index 000000000000..960628ccd98e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for plane properties and layer detach.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+
+int dcp_hfi_submit_prop_pkt(struct dcp_hfi *hfi,
+			    const void *pkt, size_t pkt_size)
+{
+	struct dcp_hfi_buf *buf;
+
+	if (!hfi || !pkt || !pkt_size)
+		return -EINVAL;
+
+	buf = dcp_hfi_buf_alloc(hfi);
+	if (!buf) {
+		dev_err(hfi->dev, "HFI prop pkt: TX buffer pool exhausted\n");
+		return -ENOMEM;
+	}
+
+	if (pkt_size > DCP_HFI_BUF_SIZE) {
+		dev_err(hfi->dev, "HFI prop pkt too large: %zu > %d\n",
+			pkt_size, DCP_HFI_BUF_SIZE);
+		dcp_hfi_buf_free(hfi, buf);
+		return -EINVAL;
+	}
+
+	memcpy(buf->data, pkt, pkt_size);
+
+	return dcp_hfi_send_cmd_async(hfi, buf, pkt_size, NULL);
+}
+
+int dcp_hfi_plane_disable(struct dcp_hfi *hfi, u32 session_id, u32 pipe_idx)
+{
+	u32 payload[3];
+	int ret;
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_DETACH_LAYER, 0, 1);
+	payload[2] = pipe_idx;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				payload, sizeof(payload),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_MS);
+	if (ret)
+		dev_warn(hfi->dev,
+			 "HFI DETACH_LAYER pipe=%u failed: %d\n",
+			 pipe_idx, ret);
+	return ret;
+}

-- 
2.43.0

