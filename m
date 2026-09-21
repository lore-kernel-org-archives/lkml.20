Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3243CB567
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020616; cv=none; b=CCTcevleoT0NvPloAbQHMLYHalg9rzrAlAwKR9G/gB1sm5MP8LFvPdP9t8dhTNs1bAFspybJ07bLNRlQVhJ0OfUbK34+GA+snhu9UYo3+F83GlfWoIOkqbyViCqG9JzTYaBT8e1xFERAP0MkGGBxZlfMz5HA1Jvu2GUwoUtLmq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020616; c=relaxed/simple;
	bh=Z9bOkuLfy3RzqKggtHIZcjGGfv8Yvr7Gg6w1qAXnJi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twAu9Lm7oEJKCL+1FNNQhy2u816n0BT9NNk90TeAphpA62oiUzrsVBmp/B3wuYNEb/0/gkl1EScz8duDOfe0eccbNI7osa/rUI6r57GgXTitjQJnrD1PWnKDKGy8dzTLJ+QaBQuXFuVhnN94tcDaAiT+e36vjLe6H3WJzKgYnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/9m45Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nhlec/F9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/9m45Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nhlec/F9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHLAoa1822617
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7OX0veYD74
	KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=; b=e/9m45Zb7f7d/DiwXNoB6muZUS0
	K18toTQgjOGmyX2ustfF0OSEkrewA2/QSO8tCzDoVMSBzzRSc1KYzBMS6+VeaVoZ
	GTAZ70n1hQJhX0gvRuF8J5Op1SWgRR+YhlOF65/moF5JEaQ0rrKhgo8n3g2w2nGQ
	OHPVRKIjIUtlSpFw4elgpEvP30imAVGS8F0Ep3ah7tBFi6IluYFl6oTf391FzcJn
	chDs1yi0tUn7My33eLbjFYKn3wWyvAza/FB5ZQrMqNblIj+plqa5jlhsMVrlxv2V
	nHWi62X8TWrzXhjZAYkukDW6DP8qa+jiUMCoz84UZe/Rw9cwQcKaEQTcsmw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w78mgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2578729a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790020610; x=1790625410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7OX0veYD74KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=;
        b=Nhlec/F9O/MMSUl5lfAmCRQdlnLbWBOOg3JpBQdCTcdsVxfV4pRjXDthm4juJF49Wg
         bSZ4n9eUusxOrPl68kH5aitetWPAxBLJYAVnNKQC7BzUy5gvs5crRP+iMSjXwj/fEB4d
         HVfaWkXLNRkl0bwXBg2YZ3zsOVbRPw5Zcd6bpvjQqnizykrr+iTyclHjRkAyZe2pQ4cB
         x0578yVd/DJMWOcXOzgjI+wlpZ8ckFz7Ws+O16RtdyFPVCtM4IiStDeo7bgZUCSwDkxO
         86qXcR8pXHXmr3t8Nu6Dz+dRFD9hY1jBY9HzSFeZwkc/J7+/gvzXRcDru89BVpuIbU3V
         +Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020610; x=1790625410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7OX0veYD74KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=;
        b=u4TL66n0zJBsVX/pBrtDU1XHeLTAD44S3FmPB5dSrkFxEYGir7sk5VFvGGFnZxnhj9
         Qc+LIkl4svxRftq0L0zl7TQqIEPY0nnJAM0l6O17nlNz5goZ2VI4qjb/q5tAbr3OUtv3
         3WXuO02mcCf9Sns/uvCJUGSm9ccZQhuNR+MQaTCeHyNcq68nNwg9b1aKixOxT9r2VEtD
         Kdw6jEzpk64i/SiL5Xy1+5utokF2p5DAAE/jVgoYJ0/0MlLslYY6lYUzOJupwo0mzYuT
         r6nFvoTqdzh04HccJNYr4QaV4DvemRYSxdxoOzNgJp2Wrc/nNnX/GFLMBgZ6a/seu54K
         yqSg==
X-Forwarded-Encrypted: i=1; AKwUvBxleWk+LyOrmIMaw3yV012jFB1xcI+EyDt2oIssrBsVsSz9we8L+BNAPcuNt9NSP6fxsdLjouV66p0cVAc=@vger.kernel.org
X-Gm-Message-State: AFuF++kSemVeGMfqi7hukT4jPah8zv746HfLXjSGXdeVQ3/qie5WI6pX
	DHdMEVi99cp1DOrz/XbatvJ4qTPeL7AcZ6Q2Hukns1AxQ770ePBVImct4cbZ83IKaOSBM2b65LI
	B8lFWnfdIqeK27PbBH/TzelyH0CY/vmafmkeu2vdg06X9mBN4lP5kL9IIZbbKTTPsneQ=
X-Gm-Gg: AYBFou0gILWBnQULp/VH83/FcVDekRx7FoCfRsO3OyAri2GYMQg50mWIahWbrZt7IYp
	urQpHxc6AZArM3jj/BlzPSe0nDHfnQq2bV47aiZDqUqdIUGtQjJuo+3D+wjLipLDW2xlLlNJVg6
	qt/jUcjwZG50eymfLDvWr+gtSc7jsw60x0tZF4NazOxnTypU/1M/9F9EUxc//Xsg+CUbQSW1u6b
	efaWe0e4aGj6wLA9q65iZFa96vr06XCWmM5M/8gq1kbLBOPwsKehrm2cF0ZGKUs3FJoB4pkVUlc
	Z/YXEf46YlCsZnU+8xATbRAmj3KXFJ6QXUG5SO8mwcuU/fOhRf89TKSoqCjm62n0BB4cpwV24mk
	hfBAEP976sr2zh4K653VC83teqA==
X-Received: by 2002:a17:90b:53cb:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-3a06ae46889mr47246a91.27.1790020609594;
        Mon, 21 Sep 2026 12:56:49 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-3a06ae46889mr47211a91.27.1790020608914;
        Mon, 21 Sep 2026 12:56:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec4e584sm241142eec.27.2026.09.21.12.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:56:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource table
Date: Tue, 22 Sep 2026 01:26:35 +0530
Message-ID: <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CMoNGhEI0ywRqAA_vw2XfPA5wkEwor2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX305oBC/N72aX
 w82OwCmyPG1Q77nzkKVKXXHtpCTY19UsCEIPK3+7+Nz69H3cmCSYAPq7OLXVbdFMr4FkNtQwNk2
 JQHKJ97yLZXu4x+Bb2/CgvNHBCQhQgxVJGSHLcxSohTiIN1YDovcf0yQpHaqAT79VYTodt0NQcI
 snlFJtK13ui1MhbuR0oOXYDGgUPhoC3W9tg4SprxsrU+IAP2C5YH4SqPqSj2tMBU+HCyvs4Rc5h
 8GOKdDefpyC/i1sXxQ33gi2Re42isAVydMULqePkDFs2CfzoCkzDUlvac7fgQSG594wsLHv9XYJ
 Abioh1Ohi+VCJpypq3tlYtrvGXQ1auOFNuehaDObt9rpanOBl5sop/EV8/LZutckd3oNOaJypr+
 TtSyqhz8HnLozrVdyGfnR/mMbEPMC6Vvj87gTExDbFxx62sxsBK9Xj+Rt83C7UXqhssjljOSnuo
 C9D+Xpm69kUtIbh+NRw==
X-Proofpoint-ORIG-GUID: CMoNGhEI0ywRqAA_vw2XfPA5wkEwor2h
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab18c02 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aAyslVjwNEohmH4VXmMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX5Sm9KtWE5J7A
 jIAPXQfZohcRzz0jk2BwVwc06pEq1AhlH82r8O/74wMX1PW8sItoaGWDcjmEJcCPQvOBFEkelpK
 e5A1B44QUuVZO0NRT1410ycnP0vWFBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210291

The PAS resource-table query may successfully return a zero-sized
table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
which is stored in rproc->table_ptr. The remoteproc core then
dereferences this invalid pointer while processing resources.

Treat a zero-sized result as an absent resource table and return
NULL after releasing the TrustZone memory buffer. This allows the
remoteproc core to skip resource-table processing.

Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - New change.

 drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd754..b5959f833dd7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		goto free_input_rt;
 	}
 
+	*output_rt_size = size;
+
+	/* A zero-sized table means that TrustZone has no resource table. */
+	if (!size) {
+		tbl_ptr = NULL;
+		goto free_output_rt;
+	}
+
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
 		qcom_tzmem_free(output_rt_tzm);
@@ -830,7 +838,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		goto free_input_rt;
 	}
 
-	*output_rt_size = size;
+free_output_rt:
 	qcom_tzmem_free(output_rt_tzm);
 
 free_input_rt:
-- 
2.55.0

