Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995936;
	b=nzNNpKyD1L948Yt4yXE4TxjPK0CmLTPuAbI64mJ0iRZ7wU2PGBX49mqI7H2DSDnTUOzO
	 /QMG1b6AJFwu+MXOPcGMkX7DPCL39Ld7WB+jTjolv4m8fHxOJDeXLrzeIY1qgRkCMTyc7
	 Hko2JZiq2xVp+VS8iqn+Wr6JTXUpwzHYHK5Nt49kUAGa9huU14XZT8Xu6tQTDoiH94OLn
	 +VA2DIWic3s3U8LIzDphQNrpSda3y2oSG3x9x84HK9evUZO+tAjTAzByPA9PIsXGZLKLW
	 1SHQ7UD0C9w/wKAvBU7RDTKdTopeDL4erN/d/Pzsq6WOGhc4nS0/Qk8G2hH+XK+udfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
	b=21qLHg78secGOA19FPTyvjZEWFBpB2M/tOhRxw6zufsMwARFHTKmt0z8Iou5Oek8kYM2
	 xcPaF+uyPlRj37KrcudweVeKqQVtEk4AEAwBouaACBd2FmFjzt/rAzLrsuU59Pn1dxdQp
	 UUCasDJVIxDJKAJX8qEOD3hZ9CRcjRTY/7D7R4chCnsdxvkMVbcn+N1TDhwdADdPFGgeM
	 kcIzkF6zuly8dlT01KCVZCwl4i5grtDSxO9xkCfuL+BptRcFx37XqtXEh2F5lUuUHSYmO
	 +5hITvVEFmnv4tytcOX3xXt53Y5a060Bv4uFjvBEm4qmB+7OIDKLkl0c7nh+X/yG1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595DA606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595DA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKui2255639
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=; b=d6jUNACEdMZOAneb
	efc/lmRa0ouqmtZPn6+Lmoacckw5QKLPorWHW4OB6TWz/6dvAfcL4m1WDtfznd0/
	ICcLtZNS6b6JuiLKehMPapqK0XJsrbbmgRHvTAIwtvwZtP2wE1s4xTZ9ajwUCjkN
	YFWqESrQ7CIZ3WoQURT/1XMXMTOx8cm2OdPGdBFYnrROzceKLxgy4PjYxvaR+PAq
	ap0JCgeSelkq9r9Kx/mX8M1U4XV0z8HOiA0SSt+mnjbiexaAT0DpabYJ+4KEPVda
	cBrcqlp4m1v3mtoL7YbfppntANJNpzQFWBN4xBUjoIJslJriDxA+zLbfod2FcQZ2
	gBpCBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3n1hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso4153210a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995935; x=1793600735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=bUiUGdPeNhK09b3IxUS25Ls1bP6Nmz9uWUicaBtrlIIOHHO+KiMOxh8XK4LLbYkXmg
         qBimgTn5Y0KTyb5d3tL0/VZVWwkpjKh5nfq54GELf2QvTfZaoJMd3bEhCeEb7AF2NPcW
         6Hy6VXCZPBovTtNKTV8HK/OxuhVD+1AGwtrfTW9Qjrk2gw4t09lU2VIG7vSSPmzzDT61
         BqN9NU25q2R9RsIbuh/8//CYU+3RQahJ3HOrklzXzC78UBnG8SSkwKjJ1BU8BMvS6c4D
         6MvxoT+2f9sOFmUoFXmX4Ba5QWXif6O/QTe89daWhU6NPdxqtZLLjueUacYLX3JDGsNT
         4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995935; x=1793600735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=ZXuOoYMeQOAt1KDTYx3MpSQAWYzWXGin2r4G25o++3dopLqr7aMavKWUCakcWquIwB
         7+Wd+ienPUgKwzAMcQ1pBosZPwJPuI++f6LhTzDLO6T38fbFhdON4X+FAsW2SJdgUERs
         V/9SeBn5kWcRMPzz011i8Tnw7pbJYZrlpQIC4BTVKVjSb3BR0nHinTEJ61fPll0nt05o
         nytyQqINb7bi1jwAkVXrM6aShRJ3aTYnAwtVXF3/kuG4eNlg5DgSfy2gPEqWObjFAnHY
         O6k1bhObhS5N7VkoqbZT8wUKceWWpjCrH0WcXluGsVBUXh4ZmYIZ6phAALZ6+lY4x1UZ
         mQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzppbsfSlMz9MuwIgb8ApVs2g4hkiFsDtHntZsB1Divw7/CXyYom3cV3HnDUkcPDzXkxQwpionA6gURnw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1gdOUh5d5hX73/i0Qq9W0JU49ZY9Rr3ButD62lmNACTmrt0o2
	iXSTK4AeVQWEXz4AGgaQ9kdQqm0nVKu0nUQSeXlGHivdazOZpaYJ3C7TrQXJhQ0wiOyY1vbxOGk
	kj4qnHbbY0jXIMkNruAxIFoQpe52IiSnWyiX38g0kIaBGY5VSrYGL0zUzD31nqs7n548=
X-Gm-Gg: AYBFou0zERZ6JHhcnvKU2o4XCqf5toMAsW4hy4OS1zBZl25QCxRMBIi2+Pa8D8lbvHN
	2++QQ/dAmuzEAtwavpC0P+G1UuxtJAWaHfy4DM3ndK5X9LNT2FMTaOkZjhxu3J0YAA9k+VAGc7u
	BvkEyojYvTACWVZxzB86vTde6CTjSWzVRHg8tVekyWEuhyETZHnCm8e42pr8d6vjLzoQja5GAya
	VeAfL2KUVQs/ASpyn0XcVfDS1aZXSwdD6U5lrkDMg+KU7276XobLxSlaKkN+5E5i4airaQ00nkM
	BG6VW6kx2yTMUpw7wT3re2jTcZXqcVsm30Au4xnLlrV2lZ6w06TNNe+eGbTFt3t+t8B9463TJ2g
	jb6eK4fPvvHF1V4v6yVDjEYE7HyGlJdbItw==
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707555ad.1.1792995935053;
        Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707485ad.1.1792995934668;
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:32 +0530
Subject: [PATCH v2 22/23] drm/msm: Register the DCP backend
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1867;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DnOVMMMul1WJd1CWK5XVZuD8++FkNWwJHoR8dINot9c=;
 b=QG83X9aBE4jBa1DAS4wPcmTipRI+XMBqCLy0NmwgeS2ERiIBadYlckpX6pOlVddmoKAl5KzcE
 g7G+3CHykn2CWWGLoyNuBrJN0+MFb1zULSaZ+b7RPKVSseb+q1g9A9G
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: sOfGCoRSCG9SUuBHMfuRDYcSus6Y1kwN
X-Proofpoint-ORIG-GUID: sOfGCoRSCG9SUuBHMfuRDYcSus6Y1kwN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX5LF26KGEPt7o
 XM2sMwwDQcoRL+SOwzsiFuRr81WV2n3Mgpk8zKUGq20DX/+O7bLF4zojSkjdu7pVsJZYQYYjFVS
 05M6SUrA2c2nsCrjQdLR+ShkX/8B+bk=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adef25f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lVH-uUz8Z5eEn0x1YxIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX01loQvKEvJ/J
 qdO0y3j0V+AkZ8SxlnOfH+yShvdpkPVIDMztLidICd8HONLrc7B2JtasNhzQSC2qqFltPk4KGLh
 JxkLErop7nQX1vnjuKwqaj1m1dLx2Y9Kjjv7pxUVbTRChLnkNHbB5+8NYOfnQ0qNCXvP/fUKp23
 oK+5C10exMctZPvHWuJ952VCLeNT7v8Jkb9m5nsZ/24PQD84AnKsIWVrHon60fIlVtf3helJeC5
 WG9vG5sqFcuS9M+6vw0XHaBp7aMuPeu99VjV7einvYZ9PlA8jy0J3rb3XzD9o0p8A+GZj6vAgUe
 f4/AsDvUFvQhvChMqZ7pJ5b44NxeYSjpuJhfG4v2TI6GF5ME+acY4QvUj9jk10K7kEy7os2KAw7
 DCkCgPWcWQ1YkRVChoJDgzWKPwvWluPdMyVkaEmgzLdk78x2Y820kYB5dGNG+9+D4PwU1TAWBRk
 kZUmjQma45JnV3+7LuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The DCP platform driver provides an MSM KMS backend. Register it from the
MSM DRM driver init and exit paths so the VirtIO driver can use the backend
when the DCP function is discovered.

Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
disabled. This keeps backend registration consistent with the other MSM
display backends while allowing DCP support to remain optional.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5816c64d7ce7..d413c361c442 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index aa5dfd82ac6f..befaa9f2cb5c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
 static inline void msm_dpu_unregister(void) {}
 #endif
 
+#ifdef CONFIG_DRM_MSM_DCP
+void msm_dcp_register(void);
+void msm_dcp_unregister(void);
+#else
+static inline void msm_dcp_register(void) {}
+static inline void msm_dcp_unregister(void) {}
+#endif
+
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);

-- 
2.43.0

