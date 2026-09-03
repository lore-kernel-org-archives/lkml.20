Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB44A013E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437284; cv=none; b=aSzzHf0IVQaOw8BIDJDIEF+LJj7IRLBRTOOq65kiFZsvHAgYe5E7AEXPe/1JSnKs4VaatxQYNtyMf/6iuL+kJizv/OIcjWxopJ/e2tNOfClow675HvHRX3Ssk38CHnLYDwcxH5IKCDBqW3Xp8FzXkYjX/O4sFQ08Qav0ZgsmZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437284; c=relaxed/simple;
	bh=n0zu95eDBU1kAfntcbqfFNxZZx2VdpTq6ednZfZd218=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU0SzKApL9VFWrpmqf0RU0i5UuK9xiZWycdVsUQ6l1oJtCo1voAN6TV1mbVuWvGAq9n+8SjMKWd6o5w/qrcp049lnU15R6mHoNYQbkS/7piIFhqqSkzVHxstSPK/Ax7tKJW95gXVZP+/aoW1fET0BVrnfrQPMlxoKpSCJ08pxyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pto5HDYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBvUDuKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pto5HDYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBvUDuKD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH2ae3720090
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrdKRy7N1E3YVxM1Z6RPSh55Dn7M6rY6ku+pqhnBfco=; b=pto5HDYVdPmzP5UI
	4fGUlbMC6Ah/iBcFiUYabKfn4DSmh0wOTXCkHVWrcSJkz/lroq3KGYSiwV//PxyD
	SMQPIdhnBFLcjogk7RleUfYfmnU9bfu0ps5jwCCzqAhqibgXH5VVxZ6IW1X+Yal3
	dypHwLXp0xkAC8sceEqXM/PXuARwrN6ce4D8fIvn5OaVeny4iyLGRiPj6r63nJjG
	NLJbkAyqmargGvCs9wdSCigQJWR151GiDRpyVZspZUn7tb5jVS5whhhhPOwPCb39
	gF1lQM5oKBOikBIy7UlrYbdOvYszGivQJZpO7I5fofJDe8KwCLXQE/hcGaZL2GuQ
	8e3Qdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjt0h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:08:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so418667685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437279; x=1789042079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrdKRy7N1E3YVxM1Z6RPSh55Dn7M6rY6ku+pqhnBfco=;
        b=CBvUDuKDO/v4kde60ODubmFyo79HrozqVqviixUSkaW6ycCe75O6zout8lt2AjuxOb
         oGqW1RvZx8QE7DmOzSfSFlylasymYxaXpNMbMT5VXXNSw8zEqFoFqhdHecSfsvGuD7JA
         J4zM439pvu6sTT8jCxiliiunhsVM3Sx3rj/htMONqwaNTOkBel2E272KuABU5f+Zk8wN
         KJRcZYgwb9bCsp6DeZq7xw5ooSfxQI0wecdLavTu6gDZdrM8Za8VSUdx4lgEEBRxqFBI
         fdgne1GaWFuhvdk1VjUb3/03cCqRFGn0kypMz9b9Ag5Hr5HiChG6imjbsOhGsvL+ruTg
         Pvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437279; x=1789042079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrdKRy7N1E3YVxM1Z6RPSh55Dn7M6rY6ku+pqhnBfco=;
        b=UU4Xu3yjpyXT30W+ajjNxNeCvzBszKic3SOEyakN1LXaMq9Vf3jfYYR7UhW8jKPiS9
         dcfl6HE7DBfATZEJmvFYg6a6kc1pKwYF0/c8wuxFOXEebw/Bq5aIjjjPMIoWTQVJThzS
         HbX7+TRGXinfll+eM5YdUsk4GItQJd4YCblaDoX1c3G14ZV4CsGeve9UwseatUw00R3Z
         mfmqroMJnroHzaibxNDma0hQx4w7bWNoKO0rJdue64DIPi7TWGIoZYiI82qZwZnDn4px
         8UCV+UUHPR6gwO5vQbGERuBF0P6NzFTG1Qk7JBIBQWY3cnTL3kygR+wNkq6uy6soFKxo
         rBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ztaNPobvbZC6WJDwn96KPrGc/dbcwO4S4VimKc3XmnEaqJSfEmGKva7LcSGBb4vN43JNOjfK9NmFGk0=@vger.kernel.org
X-Gm-Message-State: AFuF++nfprcwdq+Hc8+ZW9lbWD6DLujOzVBcpUfFPISpjkROsxxMm0EM
	seXayGjP4hREDxKYsdjzckr0ozTl5bXZGAJxerxPdChK47UpkLeGP/+tYEv3/Cu/RiyMzcTrodL
	NhuigwqXDh2RTl23vZSEJ1Joh6yh5k9FSgcrzdvx3Jc4TDprLV1eURRKEQQq4fqmlQN8=
X-Gm-Gg: AYBFou2WLXoFQvt+dApeDpRFUYSAfQCj4/yZbrPaUt3YLgdfakVmYfTsy9yAyLFSoSp
	zPubplwwkR+bxo+Y18ivRVquZa3/R37rJ7pErbyZFmq7k8MF9xFoDklfCyy1HNkK/LHJeXAekDX
	grV22Ej88Dkr2z5nhRqGYYCOvVmkog/9Ga5hyJYhNIMdloBM4MjbadRMF4B5EECYk0pedfUckhP
	hsi2tbmVCmSBmRo63dEKxJ2S0mRBq2Fj1uv/T2dzwKwjAsjd+tCXrcj2FHrTF8zqChUHPzTNVHY
	yrQSt9vxQP/pSoMqr28nrJMHd/zp7uxmlL2P7wIx9vJEKXknG+toRYOfXDvbZYSTRUJJcchMnS9
	yyUdE840/DUZK2EXwIuMDhLa29Zq4
X-Received: by 2002:a05:620a:3192:b0:936:ea3d:9313 with SMTP id af79cd13be357-9396ef7c45bmr569319285a.20.1788437279006;
        Thu, 03 Sep 2026 05:07:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3192:b0:936:ea3d:9313 with SMTP id af79cd13be357-9396ef7c45bmr569312485a.20.1788437278536;
        Thu, 03 Sep 2026 05:07:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:43 +0200
Subject: [PATCH v3 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-2-8237f3a654e1@oss.qualcomm.com>
References: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
In-Reply-To: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4614;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0zu95eDBU1kAfntcbqfFNxZZx2VdpTq6ednZfZd218=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMVTP/fpKpUip0gIFUXFjg+J7TosOhspxkLO
 cMqsAJTaJSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFQAKCRAFnS7L/zaE
 w6lVD/9GdMP1NbCyPQq6SqcVzwUC04Cj82i+NyPpztb940Yswpo5H1SpFqAP/z90Vbxd1H5EOAJ
 NDaQRsgsJXqwiA2t4FsIV4MevKCCjeuHug/sDuodfa2xO7ObsPdtxZZSPQgR4lo5Efp9BliaI2t
 RChfy4NvTwVwadyUdh39TlJ4zBsonfmN/66+CIP4x6RRxLw1fZpdgXhXkES4vsrWaxNa5DFY/9y
 t0QFNsklUkgnL28JDDtIM9XLqGyjrqZ3OpOYakeyjeHTqF4Pd3+QfzHoui9JtZzsklgRedZJ2is
 0VFSdsHjRA2v9dyVh8iKleJKTfRc0hyF5IL6aHbx0L1pCT93a+OiYAuZxJfo5stiXZI3RlmwXhS
 Nt+UsYKxDP9fQT3zAN2cUpdHP6Ga9RpqglzqvpAvImMcQOJazpdfnPWiqfRXAWHowFV6DaRBhtM
 5cbj/1JVoP0xCnbrpP8COQ95rx6TGT82c8cORPf643m/pSvMadeDjzEj+E2+UOu9J5wcQZ/PjxX
 Mka7pWxaSz1ar18JVUQKOhgxJ3IiIwd3Z+hcfe+oDVCjESBhMn98RROoL6kaMEuha71wcxhaGNH
 U+rCt6x5VBAVk2DIGhLtxABtkSS1d+CtzbCQHb5MnF5YQ45eDfH1mRwWc1N+UVgoqkvUkbDat7I
 7tiVT4t3xcJdE7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXzhaU624S8+KE
 nMBsCTv9kZYA7tGwGbXItFIE6MICU2nQ3J+c5oE7bubyNgyJJgy+CUGvCpsg+fIZXCyz3UqkD7V
 DhMa/QjQI3S3nusIQdRSQo9c6l1sRC+VxJGam+I9I+nQXxFgdZvNPG+aGHM41jSrkCm23JLPRwA
 VOZ2Ge9DWc5zwJ2F46tsJiYa1BBnTkh2Zc+/+z+7cwKMB9RpcjnyMUDUVt/q7ms+aTm/a4XtxcJ
 imk55/6RKmPgqSkbmfyjN+LDYGS+HHGSdIVmCd47EYCqpx3vAwu5lnTTef/EPrTl/D+Q2G9VOM7
 d0jNyld9y7zCWAol5PaNovM40DbvfHgikHX0RnC12ErXP4uxTf0U9EKW4KHRqsLRFROPd148VoX
 zi3bMmdp30j0dg8gg4escAjy0pB5Kv0fEEKam3Eko81nOwVERR5lXdsYhflUgROWbKWeCCCWs5O
 x2UpqAotoJVY1L3fjsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX+b3Qb7gJozzB
 dXrpA3dob7zQIxChXYqtAtUm5U33+ZWVg3HZuw2mwnhbR1TqJBhgvX7TWGtAb6aMz1H4ME+8iFu
 y0zbhHZTZ91cUspLArpwMoMCk91rZj4=
X-Proofpoint-GUID: Vm67P3hGevO0fYfpYQYcR-cV5GHEOdBn
X-Proofpoint-ORIG-GUID: Vm67P3hGevO0fYfpYQYcR-cV5GHEOdBn
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a996320 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lzBMFA2zsglRjAhb4b0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
whenever ownership is transferred) to replace open-coded
qcom_tzmem_free() calls and their associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 49 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 80a51ae644e2dd47fc4c4a1a9cf2a507abc981ee..7320d3cfbb9930ca1ed5de38294f871b472f6f93 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -614,10 +614,9 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 {
 	struct qcom_scm_res res;
 	phys_addr_t mdata_phys;
-	void *mdata_buf;
 	int ret;
 
-	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
 
@@ -626,11 +625,10 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
 	if (ret < 0)
-		qcom_tzmem_free(mdata_buf);
-	else
-		ctx->ptr = mdata_buf;
+		return ret;
 
-	return ret ? : res.result[0];
+	ctx->ptr = no_free_ptr(mdata_buf);
+	return res.result[0];
 }
 
 static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
@@ -732,10 +730,11 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
-	void *output_rt_tzm;
 	int ret;
 
-	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								   *output_rt_size,
+								   GFP_KERNEL);
 	if (!output_rt_tzm)
 		return ERR_PTR(-ENOMEM);
 
@@ -755,20 +754,17 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 	 * be of unresonable size.
 	 */
 	ret = qcom_scm_call(dev, &desc, &res);
-	if (!ret && res.result[2] > SZ_1G) {
-		ret = -E2BIG;
-		goto free_output_rt;
-	}
+	if (!ret && res.result[2] > SZ_1G)
+		return ERR_PTR(-E2BIG);
 
 	*output_rt_size = res.result[2];
 	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
-		ret = -EOVERFLOW;
+		return ERR_PTR(-EOVERFLOW);
 
-free_output_rt:
 	if (ret)
-		qcom_tzmem_free(output_rt_tzm);
+		return ERR_PTR(ret);
 
-	return ret ? ERR_PTR(ret) : output_rt_tzm;
+	return no_free_ptr(output_rt_tzm);
 }
 
 static void *qcom_scm_pas_get_rsc_table(struct device *dev,
@@ -778,8 +774,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 {
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
-	void *output_rt_tzm;
-	void *input_rt_tzm;
 	void *tbl_ptr;
 	int ret;
 
@@ -801,7 +795,9 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		input_rt_size = sizeof(empty_rsc);
 	}
 
-	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								  input_rt_size,
+								  GFP_KERNEL);
 	if (!input_rt_tzm) {
 		ret = -ENOMEM;
 		goto disable_scm_bw;
@@ -809,9 +805,9 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
-	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
-						     input_rt_tzm,
-						     input_rt_size, &size);
+	void *output_rt_tzm __free(qcom_tzmem) =
+		__qcom_scm_pas_get_rsc_table(dev, ctx->pas_id, input_rt_tzm,
+					     input_rt_size, &size);
 	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
 		/* Try again with the size requested by the TZ */
 		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
@@ -820,21 +816,16 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 							     &size);
 	if (IS_ERR(output_rt_tzm)) {
 		ret = PTR_ERR(output_rt_tzm);
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
-		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	*output_rt_size = size;
-	qcom_tzmem_free(output_rt_tzm);
-
-free_input_rt:
-	qcom_tzmem_free(input_rt_tzm);
 
 disable_scm_bw:
 	qcom_scm_bw_disable();

-- 
2.47.3

