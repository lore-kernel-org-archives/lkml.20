Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923B4A0933
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437290; cv=none; b=VrQPVcMybIxt19RcpsaQ8ja0Tde+lSgqnBhRbWlY6O5hYz+AF0M2+EKlY2v5CFnzITcfKioiybiyGpdzCJEzxcnYzgYmuxLRK2/BXFvWp+4OGMkf7Px+yHYOgIegV4NIdTnoFjppVegYTgOm1L4g9HAAbUlSCFxobCS7DSzAMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437290; c=relaxed/simple;
	bh=gR502NFg7Egn9IOsKEHPuh0JyLkSs1F8+1Bwq3pKdVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0uBITlK612+hhMSlmI2/xNRevTZAc/sLwSA0iLxNqgXnkubJndI0nT4YncR3+ajQ6VMMPah0uJRUvFZpvAq0J4C5mSfNyHXg5rPMYqxsQrewkE6W/4YPqsvZJp7t6okMTCx0wv4HT5r/KNC7P6/v6Tbq1KGR7PVblA+XpxhZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKu/wBs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD/kdvgM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKu/wBs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD/kdvgM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTJ5K210333
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8LQU5O1Q0Iv5afw3UZ3mioVuPVN+6pqIdL01EBICTU=; b=KKu/wBs1PVwFeXOh
	/jDqD4aNTXtWYjDNrjKgiKwkgq4QSjO6gcPkns9tY/ztntalqqeA+QReBYWwWyd+
	Py1CAd2MhxKPOJ+jB9vWIbui5o6fFf8qarYCUkvunnSo9IFRWtDYLPLIhYKs19fS
	6SboTg0bYWIvlvMPUYW5G4NdzRkWi6A6XUbo0tiRcTubH2lBiflnfiwRSpwVSpnp
	RQsuZBvigsMmgdO7XZHIUIeypDA8/1Ru37NOhCHEhWUXVskE450wntlDCONGtn3U
	jR3SBAOVwkboMYxFYfal/MgXszUA8vgOXVWSRlXvWGw4/6i1M/SPg654gp50/0KL
	Dy5FrA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k84s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:08:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74748e3a5b6so1027108137.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437283; x=1789042083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8LQU5O1Q0Iv5afw3UZ3mioVuPVN+6pqIdL01EBICTU=;
        b=XD/kdvgMGOz6vI8Jg0hU8WO85rN3Ex/b07rhzgoy6ftoH+vyI1hsBU16q7Iiz0aINK
         56mtq4BNvz3/XVziFMJ7hNUiWl6/p3kl0MikjE4O6a7tHRo7gbyiFUqhGtXZe0X82di+
         We5iFDsMxbtE50/hQF88UTc/Hlw2HZb14kThrK9yiOqYN3oZ9938RsfbQjOOKxVW2dgr
         NLvN/r2sRCYQcPYNO73562LdlzzObWXnuhHsUOnfXdon3So0jb3WKIgQN0kMoDkgLbnf
         GXobVmKmYTRSoPvEUIahz4eYvXFyUOUnjPeGVOCIg3OVtGkoMcru31Jr7p2maX+F8xrH
         ayUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437283; x=1789042083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8LQU5O1Q0Iv5afw3UZ3mioVuPVN+6pqIdL01EBICTU=;
        b=OKNilMCtaO1RLFeB5mqWub1d3uZx8aG3FHXIF1tZMFtHecNOWmGs03XJTgRmU8Fbhj
         x3orU82+BNg5XZQOUq2oXrELhVCSwQaHUi8+HTJOTmmbonk7EG0vDA0mU/BDMiulEdvV
         V54b658weNg/8fDmNWCZZlp5tzrQrp4PxTfiQbuTFXeCDuITRc3eSIalciGb6ze6vU/P
         SEB3lzAHB3nsUhW6yVnJarBLVzATkRNnXuzikc+1uS9hs8N8DytC854Ytg+ON8ZVcRx0
         iXiV/eRywnahvxGzgxgCSb3GeBBZg1XVfN2dhMHHf+r8ByE8i6vLu0MAFvsZa+h1Dagm
         Oauw==
X-Forwarded-Encrypted: i=1; AKwUvByQoJlitpmeoRr2Hc+eNYMGEFtyQRHSIzC2fxTpS2RB9vlEVynXaZ54z7gUYhszAh4tQOKTrjhfiLHlVss=@vger.kernel.org
X-Gm-Message-State: AFuF++mvL5ariVUfOWkjoem40V+qnMS/tJmr3x4GJHeN9LQ43BQGDgaU
	KrqkzEoWi6Dgq0OIfR2csA6lE0Gsm540y0QA+f/h/djYCMpmq6U65Mq8kLRSIK0I2WU0SvyLJnb
	+cnKclhbm8BztIWbunO6R4GHwiOjdFkCSJqAFUE/+xwqW2ZAE5t+mHsi/4ZWTS6C+YEg=
X-Gm-Gg: AYBFou3+rkc4pFIcuhlZQUVzi8Co+5TrqwATzGF1trlSxcvGwaOq2HFhxQ5RkYipVWQ
	tl68bbPCZiZMJJtssgdrKTSOQ67fThcbHrHbWAEQkLSWH7cta6Wd+MgYedu9hbY+yd2olB33WMJ
	tEhtZLQhTeKcCOXMk4ySAChudtbiNjwA62fzSBtS48wO98fgTPe2AHM9rOH3u9HJBEKt/sUCK97
	VKiXHVsqqpFN9I8Q1Ulhjv80H7IcSGqne/xtfSQBceRBO4ynRjAXcRnhCIf9/JIfJq01oQC28iA
	j2c2EIxLienUIfVXAnFDnsgMaoDnGKhStPqqOcyNJRhtWc4BYEwC11BLeaA/feQBralSni8XZRd
	PWo/52Rna8oXNynK0/H6tTpB+DGDS
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr1046489137.17.1788437283434;
        Thu, 03 Sep 2026 05:08:03 -0700 (PDT)
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr1046484137.17.1788437283020;
        Thu, 03 Sep 2026 05:08:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:08:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:45 +0200
Subject: [PATCH v3 4/4] firmware: qcom: scm: introduce qcom_scm_bw class
 for bandwidth management
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-4-8237f3a654e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gR502NFg7Egn9IOsKEHPuh0JyLkSs1F8+1Bwq3pKdVM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMXWwj2dQ9PDWHgoE11vE8w+clNmmmpdcAbx
 5ShwnOicP+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFwAKCRAFnS7L/zaE
 w/JjD/4oW7KwlXS5Lz9I+yU+aYflL013g9qHMhzp6Bpnywv2kE1dLVsRp6FjW+O0IKMjkbiBrc0
 b2JlUg7i/rM5OVHP4tH1F2g1OB0V1fvGFbR0J6wCK9TKHMEfkg1zRHgT3RuP8HXtQ12geqG0CIt
 bDDY7Jbwp0GpFVAPrWQTs8m+RXS60s+ZWohzYYBz0sOK477C2aOd+Pnpm4ZE7Wq90cugC5udTyx
 2Crej2+eM6WTLEsfp/lbVA0A+/PklTVXuJDevrF4FRW7bwBWvurb+HZfunYDYo685sCJ5PN/vIR
 PEsvRxbcEnoVtWkGQLPUkHNSTori5eg54ExPvVVFvYPKEO9rGGZydqPP6J1ZOzO1wT2XWo/+boZ
 EHBco5vxoZejA/Ghem6bhk8YmEXsTf9dt+MckeB8SAL8WscfCe9pr41UL2mTftdDcC7YcBfE3F+
 rGFw/CBs9nmrmzCR4zl9AttnX3yalc6XiLT50m4Rpt0fVwh8w/Q/BWb8Q1F9LHE1r4aZCYuYxIN
 Nt4RYKxuQmlNI1q0Hy7PTimpyDLx7D5u3yG/ig/sQ/otf93xHOtbFrW3VfKhItjEBxEYviaH0cx
 bc+R7o4Np4mpSzN8FPmamw5yiuDdSr9Q0BVtQcUIMsinh8vr4KdQZ87hW8gIekCcguySyuoJHdN
 p2BnzIpfV7Oxl2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Nkd8fwn7a43FTOS6qSuFfesDcwGT7NkF
X-Proofpoint-ORIG-GUID: Nkd8fwn7a43FTOS6qSuFfesDcwGT7NkF
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a996324 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jpxe35GwxECRtIIZr6QA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX9Xo1WKmMun/G
 vbKBpgE2GUwWy38nav3SoGlYJjL9XKPEcXsTaUIKZNWoI6J7Cfx9YZC+RPU7rpQIIAqOxvULUPi
 fu5OhFD4BUZkcVw3ZnYXi2/x2KCEV/y6HyhHoL/XoCCnntGlA04x38+7oMjNLaqJmOSqjh7waat
 mzsIHHUH4okfkoIS9ud7XO7gec0cyz139ew7x6YfM+nrLiZJUi7ZqKW/I4uqTwK/3/FQcNduWNK
 L44nSrzzmtSFKqCR0JgyiBMxnbpFxc5xHLqY3Cl+PpjhSJDzTA0XIFFv9SQ7auluV/ySGx+j83p
 HCss9D4Lm5e9/KAj8u19NCLdt2XfnNMAckhHSuk172nZ4/qNVY/2yJEhnpAJJDVwHQh4rLVNQUm
 +wT4lJuk2YM0zHF6v6MA6cOxFGyDsdrjOSzmdMBQKTh2TG8n2hC9JtzCUjvOPqh1aHU1xBZSMlu
 VJLS1s/elB2R/6IouGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX93rdrXfksG8s
 q7qATbezegjyBdi2lzrJxh3GTLLznBfkDUYyB2RVDuXrII4l0g3dwttrxXOhcnQDiMgkNLLDxT2
 1ob4jui8XRdYqXPlfCny4SoI6/OOb1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030105

Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
construction and automatically calls qcom_scm_bw_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels in cleanup path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 61 ++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f0578f0f55563c34a6875377e444dbb674fc61b7..ce6f1ed3739ce08d5890dc6423612b841747539d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -244,6 +244,9 @@ static void qcom_scm_bw_disable(void)
 	mutex_unlock(&__scm->scm_bw_lock);
 }
 
+DEFINE_CLASS(qcom_scm_bw_guard, int, if (!_T) qcom_scm_bw_disable(),
+	     qcom_scm_bw_enable(), void)
+
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
@@ -594,14 +597,13 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
-	qcom_scm_bw_disable();
 
 	return ret;
 }
@@ -701,12 +703,11 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -770,15 +771,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
 	void *tbl_ptr;
-	int ret;
 
 	CLASS(qcom_scm_clk_guard, clk_guard)();
 	if (clk_guard)
 		return ERR_PTR(clk_guard);
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return ERR_PTR(bw_guard);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -793,10 +793,8 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 								  input_rt_size,
 								  GFP_KERNEL);
-	if (!input_rt_tzm) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!input_rt_tzm)
+		return ERR_PTR(-ENOMEM);
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
@@ -809,23 +807,16 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 							     input_rt_tzm,
 							     input_rt_size,
 							     &size);
-	if (IS_ERR(output_rt_tzm)) {
-		ret = PTR_ERR(output_rt_tzm);
-		goto disable_scm_bw;
-	}
+	if (IS_ERR(output_rt_tzm))
+		return output_rt_tzm;
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
-	if (!tbl_ptr) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!tbl_ptr)
+		return ERR_PTR(-ENOMEM);
 
 	*output_rt_size = size;
 
-disable_scm_bw:
-	qcom_scm_bw_disable();
-
-	return ret ? ERR_PTR(ret) : tbl_ptr;
+	return tbl_ptr;
 }
 
 static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
@@ -844,12 +835,11 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -917,12 +907,11 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }

-- 
2.47.3

