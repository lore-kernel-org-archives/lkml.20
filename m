Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877341;
	b=q0cbeQU3T05T1ywB36O7jCp19mADlreZtQHK9FoiL4EY1Vu6ey9m10KvVdgtBgmRPdFD
	 cmmWI8ClFDy2uh19XrFOCH6nWNAGQKRNeSQQFbYFzznSW5SwXzSTSUtTj+dEGepFIgVNZ
	 xcYBXJshTHJlKJaJCwS9IrEdMYil33hy2oWjQ6zpJV9AEXT+VeO/lEw6VGQd7dtGGq1ZH
	 xjw2mU7aSs+dmi0HhTq+0zUphofzFr8L9l7y2488vXuJimUgh7tJuu63Rg3CIfhFxqgw/
	 hGh42uBKUUbAJWPhIuyv/PSL3LlM0NeXA625t7GgWX2RllCd2CBCy160xgqhi5jZIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
	b=tgal+LS1TFe4iezwJ7Mm7Yn2l31XMf0tAZgMG9hE4u+mi+K9T3su25fPvFyCt17lf/E6
	 1fGxlvr/vORb/tU/PqRHMgAloU99Ph6tB0etH3Y8cRuCpP00+MjPSKyTX67BBHOSdMtyI
	 eEFnFTt+FeaT6DfoQTTw44PTGMa11XbolproWi+m+SHxhpo8ELep4ogFOxKfvT+yNxw7T
	 D4Rn2QwPtvRvGLbzkYr58/u0+kPKvonJ9mPYsEoehiu8w+8uqpOdUh9Hc3EF9KhnOiIlI
	 2JrBJNbQIWBMr3G9w4WJUsdY5tLa1iJzF9J6Gq/+H8CJJ5VYfTMppw27pfGZ/sS23pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUvGUcgS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDZKxJlE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37574606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37574606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUvGUcgS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDZKxJlE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1R6n1416479
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=; b=IUvGUcgSdaufGKx7
	OaoqgSMnSU19wHd1z/O815kwcvjQxnsVIjHTA34GpO64dFHHiVy3TyaMWnbaKJly
	Qkbb7ytKqC3GCxiJojF44MR2kEtTpN8oIhQjxvUcpToUo52/jJm3fRDQ46atjSIs
	27YS2eWQmFXsjmVd8t2ZcUm8iBisRmo4hWyoggqpZA8iTh93NSKkWBk29aNYNGzV
	nK+55bDXlOstDN8pzaRwjNnhBXWBpaz2irj/z9YbK5C1cLO1eXIvyUDuzrHtFQtx
	fkg9QoWGyeqajlZWyz9uVaryyAXOLB5PJiC655J1R734RTSQEajMe/EqjyFjU4av
	ORgKqw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:15:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3627716eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877340; x=1794482140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
        b=RDZKxJlEr/1QdzJh/5JV68b4/s6C4mH/VkN12QA4//JY8MHIUW/zVvCxHIAOcqKidH
         IE2wXcXnFYTq8YWaIBJ/jvr0Vgd2cBLnSitD3qYmS0v4fYrW9hiG4ZcLbX45QJzlZB18
         m0SkkdTgL3aNXDhwFTc5g2ga1hvIVTAdY+Dw7zWaRVyQCiiGr5CIyMhspog6c3nMNlUU
         JhFhpyWTrdIncZ5tRJPDsmU7KD5TlbVBIZmYz9TS8LiICuWPZeCTgLaA/T3OODsSO/O+
         E52yDjgNB96NANDMnhlrAfa2cFbm4+kDl4VGiX83fSoQVR08XtD9eKLmy2/GfV1FQ/Hg
         QpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877340; x=1794482140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqTCl2uH9Ug0oujw89YxgMGvAEAk9LlD6OF8wpx+dV8=;
        b=UfAVd0ftpKpam3eDfc2svTi06Gvn0fSQXMaMnsKea/+Wo2awaCBI4SaUWTRJkxUeoV
         oeqG1k14PQ+UYMmpPbPoAIlIZ+whPmzXxe7DXD5n6YMEG3QvVlPBmrpEgaA8v4jJv9bS
         aVTP4glNVRgVtpsRggY+LsoUT60+AfIT8mgQ5LyY2LHaCoaj3ifIWPA6B7jE97h9Xj6W
         3JRMLtubHaR7EVBqDWSd5lF0oLi6CYN0q5LFAmE8n8B4E5Z1Xj38kFl/BIOy+ts4mvy3
         gaT3GPL27/wOQHeQBcmxWfZyvsJPjI2fN5q3BnQ487b9+cn8V5XHcFEXrhhDZM81oTaD
         FlNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw2WT6Ns1hd7kWhdccp11SvucYOmpmnQXiHcJxbbSvJAyLYiE+4Bz6/kBXf2kqpfpEtlsJJ+DfK4CDEYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82SSiE5Vbaa3KP/gDEtqhPAV2U4dBf7prDjdi/g7dGxtEtHTDh
	T7zn6Fygi0ipQ80pp4qQWlbEJr9dXZzJk3Ux/zPpdXUVzQMsV7BRme+GcNrlBhwj2xXsG8jw8wx
	jfZxr5Ht/oFiaOZZg13FMJc1dwvw1p9tUk32WYBp1AV7ZQLAatDMSFVy3vkzh+1t9gno=
X-Gm-Gg: AYBFou0doWWPTzYTTH2PK69qhqHgIOwtPXj2xazn5PaJqKxzJNix6tJDppWPA5gH/CQ
	O4AsCnb9FJtcK2nFPIQgzZoZTdfvGwlgRcjCuk3kJwv+zqd9sLz2aSwsAGfjk2BI+3R+cf2vNxB
	ATd7hvzc/1qrfgcFG8d9CWeE3Zc7CdFt2vJz/hz1vv51P6FvkECxurwCsHh0G4iH0ZCKRjwDRui
	qFaRwzCDY09yS2eM7pKnmKzhiKf2FotTey44ENHJxjI2qCVmh0IqH9Tn45bh5ETyKSRx1PS6Cv2
	gBQqnHyyQklQkprYPAX9dPLEYRCowesDu2P+/oIkiluQQQv653HM/jdA5jRd5Rb0IulYAQ+VMYn
	Kgq2iUaU1CE7gbcBOrE1YPnu29B00Qip0eJt8CwIS/fNf8gL25KO+hq+BIMm7Vo6OFgsBwO30eA
	==
X-Received: by 2002:a05:693c:895b:20b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a42389038mr27598589eec.18.1793877339587;
        Thu, 05 Nov 2026 03:15:39 -0800 (PST)
X-Received: by 2002:a05:693c:895b:20b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a42389038mr27598543eec.18.1793877338996;
        Thu, 05 Nov 2026 03:15:38 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:38 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:50 +0530
Subject: [PATCH v6 2/7] tee: Add kernel client object invoke helper
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-2-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=2712;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=MG/KeRt6DZYq7khoQnrWW6xa7jbn7FpCPMYbKhjz/hY=;
 b=uzXMOdWZhtoGqZHfDr8sER8R6AuhYYRfExYO3XIXFPnLcCYx+puN5AFg+qYlRxzmzpwiRI/JV
 7gIMoiDC+9OCWBewbhT9DX4RDxbMTam+1/+u7gDunqktIuZByjcMQZs
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXx60bob7tY4DE
 N6Upuf+DiJotAAsLS261Xd1a6zlWsUvyN8hNnAtTPEBZ1gJ4fOrUe+rSaAcozVs3JULbUXEJpnx
 gmEPOlbICj6LOkyLCr6lchu+HRwoNwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX2sPgiMXaY5IJ
 zEcc5qxfTwORVUeiE5ArvPMhOnGKXHp8Pu010Z5dA4ijD7L20ZyTXp2yrWR7XGiUi5GDCXfTGWt
 w4RUlf8fbvPVubIjFQCwOU9+JghhUxAr8/1w/Yl6v5wW4DWLYBAfWL5SRPpUnrlVoyrgYjkE8n/
 YqcQCyDBd8i7CTJ2I34P1pxXEaeyTzJQR3Fsh+t7UbOPzT7IUGch4BAtAd5uhAgNtg48VOWePwR
 BbIIxljbrIqe0CDJ2pvYdWfWj7/lP5CzCeqsikCWIiWxuYq8GllIOV6TJf1sJa53bmuXsxIpqoU
 zrd02SW050W3/+E4JUs9xgWRD2eM3CaGxq12LGXywajueEK9vibw9b4f4TbBxl5e7akr9ezBOlA
 BplIMtBihXDa0BlXlaBybso0GELJ8Z6iJXbwGOY9Tp+wf8UXmVW8jSifxEh+fisLVJE/Z2EW0Yz
 93Bfic0b5zdPxCNWC2Q==
X-Proofpoint-ORIG-GUID: WfOyTsoaITdNZFkgPFrkyEGedmHG3snE
X-Proofpoint-GUID: WfOyTsoaITdNZFkgPFrkyEGedmHG3snE
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec655c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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

