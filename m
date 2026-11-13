Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596002;
	b=xwyCa4OOuNO30yCZxh6/+cmqdFh+el1Jo7CyxEQpQ00TbvlofNUoK9EsPURIMJ0fckij
	 Pe0zEYnDrn+UGYvVLB7Zqna1gHQtsu/9P2+WZr6sIyuHhCK7Zkh9a4YpK9BcdrOwIv4da
	 BGztZr0zozbgj7e3r1SAE515cBwW59pDcLE/AnfumPrfKr+ZdeG6gAiarGE1Ut2pCEdoF
	 N6X53aBJskTSoRk4pbHIv6eV07v5ux3gSIuSnWOMbR5WDBwXfFKx5HQ6jlaeUhyzX/EWM
	 CbT4GIKS/f1lADAMPqFydNJS0qAtwgVnPBbsyDTsdTw1854VnAaotz3P4ClbCzyYyzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=;
	b=wYEqgpMrVN47gok7hcstKfqLbF+D3B9gyrwkEJEyJsxjSCO+nsPagD3IkdImSJNfHY81
	 4jIum/6INoqtdpvqkhMPzLF9vZ7XCiMZ64jtjUlTx95fqhP8v1PpN4HGAZaIe7fWT7qdO
	 I32UIaGMBgA39HNjjgoJ4rIRblIxv2BiL8f8oVbN1MzUcqoG3WqD3y4nRrUr5Fhk2nnzo
	 Nw+l6ysCmd2fcBvEHMUrtao06NNqnPGQQeUzg9erHTey15ZXbbaYwOXe5VsHruSRSrqW2
	 a7YbDfU3OYGJvuaqzcGJeTW5shm8Kppv5eQXkNpBbfoGakgF1AkDE/7g2vPYEn99LSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkPJt1Mn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M1Yotvrw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0833606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0833606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkPJt1Mn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M1Yotvrw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6X61011666
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz3mFGDHm3Y
	L3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=; b=HkPJt1Mnex7OSeyub8dctliLFSn
	urMff/xho4+9KuVSN2Bo+BeIoscTfRbdl9rpqLpsaeHb+gQ6IvqcFvUOAdD9mM3S
	dQSIXqAfcnTtLccXZz63HzodmTRDoMvuLDElNxh25ME5na/vFTfEm+PiSDmMFXFl
	doT07fDHnAEC+0dUKnq4D/AFKZ46uJQis49y35PuJyDKpgtbuH5BhTfMcGXNHd+v
	lyDVfQky/EpgemZtLok45+BYeqfExpyEeP+UzDB45iogzvx5G53QzM6d3tD32bU6
	/aSkyLD3Qg0ZSPFwCt9jUDxnWL/nkGkd1bcHx/bN8LOPK31STXQiBacWdng==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmhge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1304824eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596000; x=1795200800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=;
        b=M1YotvrwRcXXn5lG0hu2vE4y9GKAGb2unX+Q1MzgejgVfmF+2pjPXEEy6gb8QBpLcx
         YzrYd5Un1KZir8Nti1SodrFsG2i59julYXxvytoR2TpIQUqlVBzi2PFMr2T2nnIcofe2
         iU+VkmJJD4bxMpzCwrLh8rbehRIK5Ir0Fm4oixPjHK9Z9XA1LwSF96GlMJT9cm/EBrio
         TRArKjcf926wpmrwrwhfzs/n6w/h7Bx7BPx86fj71/kMTZ/fR5QbZpuisQbqx6clTM36
         yBuShsM5nelWernWuMkJLnf4pSmwVCklmQcEc7p7cl8I0IPiONLVqoxIczOSbRPxLIyD
         MG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596000; x=1795200800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=;
        b=Q81EjWHWicCHxlEQNDIxwRAfTPvUD4BmnZGP90a9UrJ4s+qSG1QonrbMyArgKhg5dS
         bIrlK1rkqueqzkj7flRfGMQnZifs7UVwDvP+mw+X8Y2pAfXK12uU0RsyvC15xJiadiBv
         LGRjR3YIDSoON2lsULKR+tg0M6VUhnEXU8jQ5uAY5dz25R+EdotohZnufvALoMYcoHjY
         ni/PEhOSSneWgclDcesAdKfYrAQ4d2nMrkbmbidvruwNMRPDnCjnNbtmKHy2ktR0OoC2
         NtVZ3Xnc2V4SowXFylEyzWScbpKWxnkrG1tqNU4m7a9NnActymL5arRBk3kNlh9xFYJa
         xoFA==
X-Forwarded-Encrypted: i=1; AL+hErGRjqY2GB4OiSF4ExDt3LeFk8VFY9pBEyVEdktbfbSxB0I8BBolC4WljYFe/8qTElDxm3qg8aebVDfniZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LfiRQNSwklQYcux9lSfpSt+SHpoI+jxnGX6v9TiXWZ5Ydt1fo
	rmRBTr5BFJBWLOsuoT91WCqidtU0brO6CxGqnTXXLTcLDB/NKyvuXj/00UiDTc/NZ2NvpSqN4dF
	dYUHEDk/9jlqWYDyDfap8wCS0kJz91lWiaVdy4RvBKIYxq+5Xt3MOzTh5jGJXd2VKdPo=
X-Gm-Gg: AYBFou1Wxl4vL2ZjnQL41eHLzuQ1Qv0VRJC4oLS1nj4/sGqtC4szlG6KrCP87OSP8To
	ewgZRXAiiR43HdVCd589xe1+IwaYDnId9bVXtqAtQPADAgpmqMw3gd4zIf9tClYJn0HI+/J20OL
	wfgrHu0VUpuQsneUMrsZrWsRN5JgIa2jZeZxipP61VicgN+d+gowscDJ+wBHCsI9Hr8UUWBWCOb
	ikjFT5BMr9BasZp3fh0EogTFsNI3Ig3PFuBGrfBqOReDatwXZp5LtEbaBSQKTwpp+Ln/mcurUrp
	7hG7l3f4VEW9VQwDni/dZQQzoiv6sy2hr9x9NSozZBzcrqyhI/j2UWpUOQemygFARwWZglAs6/W
	Za0asHN7FGPDbJ13QAlEc10e5KYn+PcEpB1D0hKAXkbBW/LvuATrIWG5ZpEDhJOK9G3XnX7itUZ
	M=
X-Received: by 2002:a05:701b:4504:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-1b50313d80bmr2955466c88.37.1794595999651;
        Fri, 13 Nov 2026 10:53:19 -0800 (PST)
X-Received: by 2002:a05:701b:4504:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-1b50313d80bmr2955427c88.37.1794595998965;
        Fri, 13 Nov 2026 10:53:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:18 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Sat, 14 Nov 2026 00:20:01 +0530
Message-ID: <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX15Td2JcBUA73
 9DcJqroynf7fl7Ttwvouciqzd5gJ3FdEbjCkbeBaScmKPCBKxMSgOTA/q6Rz5NylUUK/HfSa0E2
 FMZaP+mADGEle4BIXItybk4VIMGHyis=
X-Proofpoint-ORIG-GUID: FV7PPLoorubyUvbzAw1g5nbUL44Pq6zg
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af75ca1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=O747SXQATtv6IwqlEkcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyy5IO/3Ci1lB
 lShFKbnYJyk4Wmi1x3nPQYiSeYd0lFScWEuoKg1nAOy4/s465R+PkmlynelI56b9j89uQUZ1lZI
 pYpSq35X+1cwQX3GGUGGUKr/SGhBJ3l/WoViPC/8VhntpowNqby9qq18RdlinBDg8+et9UzLLrK
 1LTIEUD1dlL2xWroLa2HIuRDaKDRd7qFLpbPXmo3v9NB7H+pLZCEnB3IMP1o/RW9UnpPpu75Mpk
 4YMH4qaoxE51Kp+JKjGrweKKh1RPXVUhQutJNpYmDMRSRk6t0+h856RGBZq9gr4rtsmJT+Pb4cT
 cnOV5r4ERPl0D0KcClrlDRnofcz7XAprtJwKk+Zcj7hkH/fKzjSpYHidvbxHiJPkI+HCwM0zr3E
 ODqiaiNeW6/Yzn7FN/ezoECtpMm3+zYvmj62FsnBoipGqOF7sL9U6DvgpU6Kp/uBamLdl2K4XGu
 oMy929vKOUG6aULzbOg==
X-Proofpoint-GUID: FV7PPLoorubyUvbzAw1g5nbUL44Pq6zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

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

