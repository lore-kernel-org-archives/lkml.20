Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846136;
	b=yu3BjXddDruzRysR0D4Vf7f8+LdN/k+jsylTapc3az5imFZhVo1NMiuwlNB0j86mwDKU
	 VjHFAkn6NdZPidk+M9KiYCSiT9BCbg69V4Y5P41ByGXbX6fRIjVadEEN8ex9pnbUtzXEM
	 0eLX+UgSRmy3x2+zuCnk/yEwEtjl1tjf47GiTJiDGicLTK20q7XQmXZFuyJfTJfZ7Unyp
	 INjECYtaNDnR0/bZkJuSacvKmdTQtscmq2w/tP52Jkpo+NWx8d8xza1hSoBpdKssXvjSG
	 gFjgrtCsEcKVDenf3Wty10crCP7Hnwz9/SK9xlO2DyIEK1HuHnoQTu9elPtykRfkD/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
	b=wwuS4B2MSqB9Oh6WTOOR5RxANVBrmg0CNsOge1HC0NmyJKCOqFzdNHEi7fNSQIZm7lr/
	 d1XhhhLrnObukrfVSBE3Ff6QpMKB6nLCihZdUsGu3WtW8FBSP3WRpd4JXB4jkZimwCpFy
	 Ur1kdsIJYKbJu4ANyHfjlvVrEmPMHpiy88JwK6ASV/PEtDOeXDXpcHeSGLhIoI4Xdo9rm
	 ShGb0NKGMKMyxgSPy0eRAuuCS9Fc6/BksFVkGq4RhctIYc/Lkx4SSH5PxCLg2CISlbxT9
	 vfCaYCA6Oxshbuc8uJfMepKZJw9Dnu6Y9tkwW2WhXyF/XmbVCf32B4p1UzhxMCbHt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iaOQbQ/V";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95C606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E95C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaOQbQ/V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIJlF1788295
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k5XQA/BMzue
	iAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=; b=iaOQbQ/VnwK28Q7DB7onLCF1Vyv
	PQESzDoSFO1a/4RMUY/krilKAOkTsodyyfsg7daDC6nWKq9wBQINmJI4VospHbQu
	v4AvglZihlgUcqU0u8uidncVsg//B3evdhwddZuDa2qW8Sl/Ydbslys2C7JihE9b
	Ehd4oFDFdgQGVzgVIGxsKlcnIhBP9OljwUArJxBY53yks6K/IVXxiKaBrnsV5g0V
	+jBey2O14f2+UkW6oAtbZttFS9buS3FX5nOhyFT0AbtX0kepV8qrBdWEXTnO2m+b
	3o3dBNvbZgBtrcbRlwaXQan6GqLEDs/0yFEA3NOfdGK6LczaMljfKnoYqQw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy9ecv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1724573c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846134; x=1795450934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=idBLOiMAfkhXVjCCt2oOtWQV2K22SbQ94vCrOVFdEWNLgR/9Zn0MHMeKRBW5MAuUKr
         GFtqMH/OOsH0Q/vhhGt7X9KbQ+lhtXMqXKWeZkPVaqc871X0wNtzF0YILFycRxMP0RM1
         IypFac2P+tdGIa7auuHFK6N9eP/rv1DD/yu/EAPhL21jm85IGGEvWqnTx39qvhoBEKwm
         E1GBU6XUI++otMmK8omq55WCxq4jxFXnKGjuQe+omGw9uyyB2e6PhZaJzHcjfklb7XLx
         gSg2UjdJUro6IPcGi6mi+pmRThpGzObfzzyV8S774E8HiHRF7xWN0S1R8tKRYFoXqgNm
         N7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846134; x=1795450934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=IQWUVWBKG76MKxcDqx3rUC65aw9aok+feQCEmE6Hn/CtELru9Q1T7Uca9EWbifRYUf
         hF5x1ugZ1yVoX36Eq9tZShCI5F11kAVsad5J5naIK4EVX3a/dEEvaX3hVlkXYSJSzFIo
         dkTYjeodWmqWq0jjhVm6zJ9vR3GQ5O0FroCNYBzQKRX67LYcz+zo4SfDh0edSXa7Lj13
         Z9jH+sD7Ymnwjm/IVtJNLMqvdaRHRCYEQJHISiEDfbuny538ZIGi9YsYHVtFLVtLuKR1
         cBC6ErSjX/xO83cfT97XwwBJuQmIpV2nQz6w9IG363x/QNoD3dBQAAVquDMiW1FHFVzf
         N/Tg==
X-Forwarded-Encrypted: i=1; AL+hErHM+EvPgGyTuQeI6a7Z0iynAWAK4Bbte4V3/Gfh9gfIaRmMt7mRGU/OL+sCb01mY3qkcDYCCBGcJ46E1ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0g0KC0pq35eF1qxkOoBBPOd3aruzeGStp1iw02DrSMN7gAQlH
	282Yf/odfE8FYQdg26918T6YP0FPlnNm+4lKhrW3LBahGDkeP1jp00ps6Dtxhc8/C0cCk8dQLUt
	jnk1kMZl28yFxRa+1/LON3PMulQ7LBGb+0R+42Z0t+W5M0L8jTOfYWfDAqatYlApBIVs=
X-Gm-Gg: AYBFou19JHrekHOIhfQlXhbXjRI15ZvvPIyILIZ4kOrwlAWBv27Nokks07Tge27R+Zd
	LiQbOSdNiGycl+KwOAz4q511a1C+C6Folm8lAcrWEpi8XZXN/pznpV4gW/u2nSMpiz8yhBuMxNM
	ipaXL8+wvVS/d4ZPRCey7EukuQFD9oOctHqtM3d4His8gpBm0/pacLVHXXMYf84pvvLlwDFU0Yw
	n4mEKT+tLZ/+15jc4RKsxvlqIrA2dDqudr/25mIl+vl7YVz8gPiT8Rg5LNDe+/kapcKD6baeDGv
	DTYcIF8GTA1lKOgdJWjLHBxzR5pA5mhrKF7xBCn/rI49WSko1dEibavWwKhVFTsyqeYHfkztHwi
	nYNlGq4Bam6H1iL+evjf2te8QR1AWzCDhljOFvA7PxZ/sAWXMHVrdbi0RrPDI++5/aog5H1lqMa
	3v
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065923c88.19.1794846133602;
        Mon, 16 Nov 2026 08:22:13 -0800 (PST)
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065862c88.19.1794846132861;
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Mon, 16 Nov 2026 21:51:40 +0530
Message-ID: <20261116162148.2864501-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2vwM+L7jX81K
 RvWCpOqIhjLAhK+L7tM9JipolK86bekpjQuz1tkWV7BluF/xehsLSdZ/JqUBLTf26iItiMcekkA
 XAzJG15nibXO5UWnEr47RDA0G9D6TVE=
X-Proofpoint-GUID: TOphmLOdcVl1QszzVUzp4Sm-ocfMni0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwIyCAdIxzqWe
 uLPRpn+8q6OVXIoz4YOqmB/G/2xLYa1sMJgwW2ymzAf9TdnsiKEEpXb4d0X5vzJffChorh6tUI2
 ypoSG4Wag4Lu2Mmyw6Lcba8INmbGHofSTCmGGkAWndDaFEr4eWG7ieu3lU3vmMqmPDFpVpJ1FUd
 thf6FeKueBUSlaQEIdtOqxB6LcfYkM+2rfKwy7oIOF/wS5Y82K8ses6PSuVE9FHKKV9aHat7Qu8
 M2PJ0CPNLyBXmY087/yL8jKzmel132EmOhzOmUp4rwmeBscgZbYENpnY31tpwFIjxi53SmRHbtK
 qd2lmgiR9m+lKW7ltgnkHXdL6qMRCda9nxaKm4VTXdQ3UHisEgr6ER4GLUmiaCDBkzQlAtChWXo
 7kBhRMPzm4bJr5inqLZ+DCDd/sNw4rB1IA/KXDzMx0xmu8uPrVz3zTCBTgH47x4n7rQYEUeaAYf
 pb4LFa/TEugWSNhNt5Q==
X-Proofpoint-ORIG-GUID: TOphmLOdcVl1QszzVUzp4Sm-ocfMni0O
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afb2db6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=A8JJMgtFIkyHT4jqAlUA:9 a=vr4QvYf-bLy2KjpDp97w:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

devm_qcom_pas_context_alloc() allocates and initializes a struct
qcom_pas_context using devres.  Several callers, however, either live
entirely on the stack (short-lived helper functions) or embed the
context in a larger structure that is already managed by other means.
Forcing those callers through the devm allocation path is wasteful and,
in the case of functions called on every power cycle, causes a devres
entry to accumulate on every invocation.

Add qcom_pas_context_init() that initializes a caller-supplied struct
qcom_pas_context in place using memset + field assignment, with no
allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
to qcom_pas_context_init() after the kzalloc, so both helpers share
the same initialization logic.

Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
context may now be initialized by either qcom_pas_context_init() or
devm_qcom_pas_context_alloc().

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index d74dd7b4f332..fdf62003fbf1 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -14,6 +14,27 @@
 
 static struct qcom_pas_ops *ops_ptr;
 
+/**
+ * qcom_pas_context_init() - Initialize a peripheral authentication service
+ *			     context for a given peripheral
+ *
+ * @ctx:	  Caller-provided PAS context to initialize
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ */
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_context_init);
+
 /**
  * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
  *				   context for a given peripheral
@@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->dev = dev;
-	ctx->pas_id = pas_id;
-	ctx->mem_phys = mem_phys;
-	ctx->mem_size = mem_size;
+	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
 
 	return ctx;
 }
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0d55e9e0af3f..c6ec67e1da09 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using devm_qcom_pas_context_alloc()
- * prior to invoking this function.
+ * The PAS context must be initialized using qcom_pas_context_init() or
+ * devm_qcom_pas_context_alloc() prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..458075868bf5 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 }
 
 bool qcom_pas_is_available(void);
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
 						     phys_addr_t mem_phys,
-- 
2.55.0

