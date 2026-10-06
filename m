Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D73E49DE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286453; cv=none; b=uv1db3M7BpfUETf+DpySyZ0FpTB+zFH4yVzJqgUOXFIs4WhjvKw80YFYMGMX4bBEJTupjNRU6fLfAZcEBM119qaC15aI6GuWpZ7uVcqoB6lA9Uf0eFgIdvvLknkLvcLU7T8rv+0kO9wamB7rXmgCIpYlhDRLElagsTIPIiBkJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286453; c=relaxed/simple;
	bh=Rpbjn0YNacV1Aifz97E1Ai2mwQ/oNPnx/tZLiOWYIw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fflrWjHTmoSZpaXkWjmrOPdMNni84OWKmszKKLdwQFVC7YWcx0tFow5XXGsO8//K/+CArs6ufgzpuTkqScZtozilS5JozF3lPFAO6SX1HbsgMzOoppebOCR/tYVlZNb7ESaP/X763NLiokbHdMKqg4H2g/kT940GIpVIImqa3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqK/WKgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTa6uGRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqK/WKgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTa6uGRz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPMRZ3890606
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=; b=hqK/WKgwFi8KBCv6
	i/2IQxUsEpV0EFxkTsQYoaxtDJCTEZU4VvBibb5yzRF6nF1Ue4KckPYTmDsE0dTa
	+j2dENYUcE3d0e12Flazw10Z6xVCblwgyK1lryFTtfjkynbCH7MdJ0zO9BnmkVYX
	qNP84mVCcZZpvpT8UOjbOi/yRv8Uq1pWzeiWOSpkRKdQ4vSXzNwdU6uS09Hl/LlG
	1RCZx2lcaGw/7fhjvh3QahNJg06bGtDYuPzUZTqkzd1n1xpR9/q2MdnX1Y1yxF/O
	Lq4GYCSt96w6XHMEX6uKIDUc2yr4U0gxQKwCGnMos8m3l3uYYDoaucRmCSpUz/K3
	ewM0Zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukp0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:34:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2873725a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286450; x=1791891250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=;
        b=PTa6uGRzXIJ1X/uIfP2SaUPEG/4ZIuSE7B84Ucg2bUYB5Lw445rJW4SE9d4uKX1Ie0
         vLzUHYNqvT4Ruo3a2ByzDxyDsc0qkcJoXsKCnBxY9eWfFlenosTzJVH2SCUSMJlkqTHW
         lELCY00xqjrgiZyBE+qKWqk2onqQ480bFrbAyLpXsXIu3iwiYE23hYuEDMO/+KttItc9
         Gh4mqFBba9IddgNMKEfCMB8C7a4+OzrWUhCgS7+HrgEZBizwaEStzyNzaNgQQwmjakry
         WIUHG00+ZOr1i9amxj7dTEGgXKCS6Y3Wc+l+mhEp63NgJvREqSWAxJn3Rual+f+cG2Y9
         QGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286450; x=1791891250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=;
        b=jCDzw7DJBjFhnbZQ76twJ+wd2pCg96BNl02iLicqpEJqzwAnKTjRs/gGlkcCOwYgeJ
         rwLyEKq0Aw2dhaFH965nnjXMDaGVkG/1TsSsHBid9BEwQuWC9vCzqZMolTLpHYb0hkqA
         0CIKtxsKg+QlCNxOJF6QRG+3ZaXmcFs2cGYtxti0zHMWQO0Mw/HIxGQqNKXbwGLvrOdf
         QgJOkH4z7dcbY2hQHFkCFlm4ZbpfAIitQ5N7NwnfR/BjXAV8PlkB3yS9ayxM2plkOD9D
         o7sXwhU5uvYvzLTCCRYpSFxPZLCziTbgllt+/0yuE50q+VGtYMHp66bsyID2wTyV5cjj
         bE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwk32SKDo27j0fBwAyXwGRvx6LU7aEgJNj6Yb7LWODxvUYJTOn/dmSNiHSBIgo9z7LqgdAFQqBAWpcgyP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxiEi9iuUeUX0gv3aIe74NZkMUw2N9miDbhofZ0xuMcLp9T/XR
	HwssyWHcljYNG7cSUcO8gt4pd6folH1xjIWIDQNRNTRuu78VTqRBmzmszwoIArWn0NtI0tfhuXw
	3ooyy7rsipsK1Rb3OqYh4dmBvJVWvHCfSQihhey6jhlKfDeZlO81Fv82376OV1kGsLns=
X-Gm-Gg: AYBFou1vdsGDrImxdqhyuKOVKtPSg227PKpcCztP9CmY/NoODb9h7lPgo19LWShWifz
	B9ngUFFj8j9BBqLf/UnL4/bO6vHKcF9WSXyfjLrvraFEXQK3Zel9+IDT/xJL+OMW2Dc5pFx1r3U
	ZCEDmN4EduP4RblWA5+8ODC/D2RMwl9MHlIh4utT1bEyxYCdanEIWHYtEITDYHUKmifM0ijn4lt
	itB9nwK4vla9yzVYaNg72m7hghzUVnD6AP+29IJOdyflmdXj9ws/Rt+sbUIOI7dg/UKDnHo/iJb
	9fRU3e5k889qejtn4JiG5O1SFhnP4bloXMhpW/VDyvtAw90ofUOemg364/9KrqMaxJqsm0h5dNI
	DetdvC6qXUV4JKQ2r5Cs3cT92
X-Received: by 2002:a17:90b:3e82:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a872ade7ccmr899941a91.1.1791286449444;
        Tue, 06 Oct 2026 04:34:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3e82:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a872ade7ccmr899925a91.1.1791286448939;
        Tue, 06 Oct 2026 04:34:08 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:08 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:23 +0530
Subject: [PATCH v4 2/7] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-2-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=2638;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Quti/9VlUblrcTksx7XZhJmH9kVP/PDp+rrGqRHsdVw=;
 b=J9ElpovhGgPaipJFN0RwR9Shmw8hecBUpv/Wb0IGyeRE8PiDgfKGEMqTMkuxmhTrMSxW2xOXH
 5RfTpEUkC4tBmdXXaWItMlBxonu7im7mtgsRyLAyUtT+2ARzd2/76/v
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4dcb2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4lMagV6YyyR2urhSHIL9uWUecLHbWoqD
X-Proofpoint-ORIG-GUID: 4lMagV6YyyR2urhSHIL9uWUecLHbWoqD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXyuPRFitmSlSi
 DB3oRz+KgWJ8R0jp2Gnxwz3nrzLc/kX7PfOf+Xv71FZ8o8XAmEpxv6+AoDe8dSx5jkiK7zxl2yU
 D/dfvpkcXU3rKRhr7DT375FjxdGnhfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX+RvhdNdPo8UY
 fI4zGIvWcKmWN2zoIwKj5kLj2/H4mBTz8M18NpWdnJwmEn2Z9Rhv6yIEJHWgqYO8RMOtE0MWIuF
 CC2MIHBHrq8TEN/wiY4nwQKCaTYR+c0lNDu3Dz8IFw6orS6rqUZSgvZkwvbls3lULrrFSUAjcIA
 +uePoLdH+5bHlT4ZVrn6OYYXvNpHF7wW+3Miz+sruPF7ALuUZSpTRc/KwGMHyZBOALD8QKw6Ven
 Os9+Uqvcjsxwx1pMPxzKZHsRTcHHeCpNLZBJywjs16Vdl/VwoG0/1UrPiX90TfxXviB+zmiwFxc
 LZQMXLLHybr5u2X733PSzKSGJHzF+SFf0fRgEJca9lQwtFWDI1jioicf0f498i7+B1jzGQf/0m6
 H7jEUUlo/21VrKc8lkort4iGkJX+/oz7oJ2IQQYktzNBKebHawvSoQbL85EadG8OZRFIF2as76L
 9p4DUaZtS9gYhVOLvQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

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
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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

