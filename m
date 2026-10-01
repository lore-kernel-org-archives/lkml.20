Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6BB3F3265
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852601; cv=none; b=rqaDeEyoMTr9aJro4IlzD9XPddFaOK0cvc1bJ9jSXD3xxBSkKwdhFhhQsmcvpqnQD4KuewFTVWY81YqLuQ1T+sXH40LmyQOmIz/HzcsUWAdoA8dR93MZ1K+U4Znlf0Yuv94CJG57fSp3otLEu7r9/YUCYT+N/rebipjZdCdBsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852601; c=relaxed/simple;
	bh=JHVm623HXtSRzOgayEFKW9DRNqWXKZ0z7370+BQe0u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKews/fQzpim1MEjd1L3nijjJjaIPCHRRXosoeV0lUyT6utD8tAv6zNUR/6lWm7v33SNWYefe5LD2SJesTQEx3QhL9EMyp7mdkBaG9sH2oBLFZ12e+gkE35nKBIoOzu0ue7WUh3ndAFnzUvjtlQhRDUUeAcwiJF6zuWanjbAaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfaECUiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpsgALw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfaECUiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpsgALw+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691AkAcJ3388115
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=; b=FfaECUiLmYJxBeZ+
	2dvWRusiauQsQAdthZ9XymEiPk1UBeJ7Or9v0fs7x57jjJ0Y76kh2NwoHwcaK9CD
	m+kyZPXQRX5lLCsMX+Vrk8JZScBtpHLGBP2+zSFPekTlKJRk3EhkSKbH2fXc4+d7
	I7TCiGy3Cd+j/iZYbHx7pSbyUfjqWR4X1VD1iDewtOxKiQRzfwRhK3m5kLQs29Bp
	WZLHmKgu7gGVSPyt/vPVBF9+q/HOcAbnxYHyeeamIwDmrnY9Bsrku0V27v0I1Eza
	vQ0mDLqv3W9za49ZRqAQ7PUUP2a1waHrRcO3vVmE6XehvdUCFpoAmPopeTDqyBD7
	wAfcAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b82sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:03:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4591899a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852591; x=1791457391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=;
        b=jpsgALw+AccUTiQ5sLwPN7hqI/Gg8kou/pSBvHdZH3noMUlZPPbLoF69CbDO0ZrsvF
         beA7ungKBuL/5DLL0eVvVVqqQmjkoCjlWJ0pI2ufiJI2Kn2LMF3eKPMwFSPgJzqpPTL/
         U84CxXrKNNE20+RIbalVCIvjn7cbBn/Fy1ylJIOCDWbfmGSWSHIUxKv/aUZY2l/qEKW7
         lSfy8H43sP/+Fw4MX2ULjOFT/LfAMwz7tQU4p8qi8O98QuLl/cS/VTtBHBrP5pR/zR11
         AHPHLu3i432upUqz6i8N+4dYtzT5eR7eYayqHad4tCN1Y20vXXmuPxnrfwPc8pLvR+hZ
         mJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852591; x=1791457391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=;
        b=dhJDBeO6zgnVRjE3fO4Nw+LLY8s9tTu7tDij436hbEpSdn8RtlSAf1yzRD11AYq0f4
         Gi+dfELpwqibMtTiQfB4aYpqvy0Y5YRvsoZLWTAuB73iEyyP5LDsB9rm0BbC4NcZyK0J
         Wf1ALn6mIfG3b2vRzkb8YaADvZr6wg6KdVITLcRpJ+yRLCFlE206d0wxoCuaBG+Y10bC
         cZ0/J9K6FlSLxlFr7kKfYlLvLXLCU8RIsQDJLR0W297CNENM8yP6AYiwzZXQT0vwrEqy
         1BUFBw4TnrhhLkIELEt9grnth3ngRqF35XHMQernVY2718CxKDk4ulMLaotbMoXq19UY
         X/uA==
X-Forwarded-Encrypted: i=1; AKwUvBwRZCt+1HiBFKF3WMhjubJzUY0ajKiqzwvONjbGVDeRs/VQUo+Ea1WwYj2W7iulvWwhq2ju4lg587bFIq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdVHItAz0BrA3jrcFiTubk013CAaQUzlP95NJ3Y/9X+gfyjG9z
	3h9TCFP+1skxzKoUuW+xnyE2AYXQFsvHTPxRZy3B36rJsUUGaWe5UD9fIDIJIJ4YsXM9q6D/8w6
	/n3rWDMH8o42mS8fxFdIXFigOfZQhV1AHam0H+ciE8+rHWin+InyN4DV/Bzgx9nytNo4=
X-Gm-Gg: AYBFou1YWOiNyyx+CbdSuOIgd8CsaZNhhjZwuZ+rKqYAPrG8Dcrd6V3XND54Uqnm4y4
	ntvaChsI0L9i+CSrdyqATgQ7IwXVBfCd0HEgOgzzs7WpcXmhxsch8INDieeMCmAt4/5D3ZI9mPW
	Bc+JF2k9TH0FV3DSniNFNkz1HyYBNKOEa9syQHCO/U2YhCoDq8JRkG4C+5kaiu5zywROQpa1aPo
	KenqnwBqb5Z6BGCRv8ib2wuzBVOJNq61U3JjJUAa4SC74D9ftBXQqzSYuLaKY4DWCTQNa8m43Wf
	LbG6xdftoO/7l16bOJ2Fsfl6zp0PE7PcvhoNsWWi+AfnTDIx2t6o2tYEsteFGVxdPsCw7/aB1dz
	jYDd4xOPyfwntRQKrmTBsxfQz4Q==
X-Received: by 2002:a17:90b:5112:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-3a4d197a4e4mr3168756a91.16.1790852590811;
        Thu, 01 Oct 2026 04:03:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-3a4d197a4e4mr3168713a91.16.1790852590239;
        Thu, 01 Oct 2026 04:03:10 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:08 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:34 +0530
Subject: [PATCH v3 2/6] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-2-13df5c20c2e3@oss.qualcomm.com>
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=2583;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=WCJlW5OePMWJUaw3c5FA+6JIuIBWmd2hlhsoPKjjx2A=;
 b=29hTYULmYXIKZGnWBOmfStG6tcxeab8zHD7YP5bg9KyClELhOujE7U89txdks5qD7a1XRa+9O
 heiHfJjra82DtbGzkDjfNhMwCE36TCGvcjEOI5wHKClC7T55UuN8GL8
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: hyOB7A6QuzeKMtxmWzmJf2z-R-QmW3VG
X-Proofpoint-ORIG-GUID: hyOB7A6QuzeKMtxmWzmJf2z-R-QmW3VG
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe3df0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX/6ncc4/x9wio
 V39r/UEJ1t+Tes1lidowVjebil8QYoZr4nTlPQwUXOVrGoFsvEFKJ8rdZ0zwDJWyUJzzpExUr2J
 i9DPISzDE4Z2fKnK85ZGKqQzwIB5ZF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX3mfHFLiyhLAT
 5Ax59pJY8PvvhrjFGrcpz496qhagxD8kdDxZC3JinidhoWDkAGvNEmOnX/Nt0LmdRebtRD1UPd0
 g9L1KIVa9G8+LSLH9+2yqlmBs2Pa80gAYFpOxy90XKRuqKiwfGWLhnbMc+/SW+43BuFolorY28O
 FfSJWuc2b/PS8ycHN4auZznm9CaM3YgM+CEqSOBFLgNLhvPFmPWw7+YSQYLM/1X1nM7GVJOFFSF
 9I4azLECM6+j+/cRDt0oI4stTaKFdFYWl2EMKUwVrRKUFTdPcwRaX2biPjPTD9f3iQvbdWJRklE
 +BvMcGzgoEYasI4nE0KnHXpcgnai+c+7AH4ktKba+TLls6wScs+uIMXo9bCmXupeWvWLR5msnOP
 J/jqFUiscQD45ay3pXI/V9hu6EB3qCvnuJ4+UBBISW/prdsUFyGflIsLr1zODDSCJqOs5XlUr5z
 RYZYJ0xzWqZzamAdx5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 30901390149c..a03a3d645dd1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
+							  TEE_OBJECT_INVOKE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index f3c5e106d853..369c87ad0205 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1

