Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2A4A0910
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437287; cv=none; b=WH/JJndAXbyretoLRXl8EzsZQ7orrE+IkXH32ceOVqg/eADyiqvHQZWnhJQHWPe4CZ7ane4gE3GYcaa9iSq1G0BZVN2PD5hFxIUm3R9A/ybIkYT1fYE4+ch2uLPUSrmCFIFS1tphDojosf63mF92h0W1oY8IA8xErQ7mBRepLnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437287; c=relaxed/simple;
	bh=qhduGvxSd60XUwOZ0ZBtDftmYc7RtmVI7jpRodVUmA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvNp+wDanq7XIoOmj0UtQObJAuG++VL2zGKZGZPxMNvfsB6pAMlDZ0mKWb9PfvxfwZ7fIYPgcv2/D3fhFAxLz7Uy+MGu6HwDLq7iwP03KlFpyDOZd64EAg2Iq2KGzkhqzLSuV+nokEN4NszelY/hd1DdforION8AS/dLK4IWBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b311SuWF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEFxZPO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b311SuWF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEFxZPO1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AwRit749061
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=; b=b311SuWFvsuI5pL2
	D9G60txHDIqooV+rMRDQHAU2UiDwG1j1Ari+akr3sYEVTjp1NcHAA1rFhXFP79bT
	W4f7u1a69D44EyYvpp2/5FxO9m/j2/JHECbN9d9WRpt2TE1R1oyk2YjNLUUMKScj
	11TBo/ZZYDPn+zwf2LO4q5Jod+I6nkKGPtjgYXWBjfQEDFe1R7nCJVHZpMiHDNZ6
	RnTgeq1m4W4YVmn6HaJXRqtiMUHo+DVD2gf46+QcLLy9TNiso7tIhttUIaS4vhE8
	pXoQ53LMl1A/dQmfI6e+w1WFvBc4JxnX/MkHaZCaEE5EP4M29PRiivMu6B+PsYgO
	rdubbA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hnft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso845738241.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437281; x=1789042081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=;
        b=cEFxZPO1Mn34rvVSIdnSGiO2XKMho4seRfSmioy7QvbyjpVl7hwZLqjgdXDa0dN9og
         FVp+t0Jzn/bJv9d36u7Z7eQj7MhNM5d7uew/l6cO97cJed2tM8ZZp/9qc9dSdvbxIoMW
         i3TtX/KD1TGgfTRQrYOHHEdsmHrkEUpCY0W7hCIigiPMUb8W21SU9QlwNrefCvnvnBXD
         SWBwUKNziGINTJZgVUPNcsbhy7EdGgwt4c1nqWBgALE0NhN5TbzI1Q4ak5GKId9V0xgB
         zV1Z8nQXpiGCg7WDXXyqORfcpPfkMmKv2sa8q0aFw6X24J1cXpewwZ7tqCgnMX4Wa+Qd
         eVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437281; x=1789042081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=;
        b=jNFtoHkl8pCWqaZ33PdmNVT6EzG6o20Uxlu9mnoQFI1GlrLmHPfuCnI5v6AH8ywk78
         GA5SgcAzYHFrWMs0+W1uYymkDZJC4aXso+aaPhIngNpvllQcnWwEkB2eQMe79nGt4wAr
         5asMRv7KlkgRRbCWVGTEwnPY36GFQWLboSsJcNGW/588P2C5cVIdn+zaw4pxWKjLDowS
         ikm2SJKxMzCVSm0A0TVxjBLY8r48MS1mCfD8Tqq27cW7h4Eoy0uw8Age1aHXBYhBHMu/
         ZbCf4OcI+OITGX2p80mkDwMNXQizyHDS9XN91fiy9RYPQpa58jP8XA+KE/RnC/VOIfet
         aSyg==
X-Forwarded-Encrypted: i=1; AKwUvBzDM0+hNf4g2apYJ261anqQRFivATs9JFEGHa3bk9LSR4xpK15YP9pbJpJcg0JpjMK2JOpb0Vhg4L/qfUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lfWChtE6aNBUPUCMWvOnEBaXtD3NeY6jbqhzKwHYMcZGlfPQx0
	Gq0Bm8VaEkvoyihqNlTEY/DcNI7MWH3Rk3u5eCoPLiD46xWnuZg1hwkvyLj4ju4kURP2z//zvB/
	Z9GDA+PPqZK7hyHg7KJBeMPIiVMbiLfOYAYpqG18AAPkTEXEfzUt/5kFLDNxY+pcp8tU=
X-Gm-Gg: AYBFou3F3c3o9CeBfmvpvWK7hR8gT/S0tkzKZTDjUPkG25CIw32UDSBu/yOoA+NyqAJ
	lj7JugC4HNfDSc6ioo932xcCWOOCZZ1vjiduLLBLNIytGwtSVsOZqW+otVyFz5pnRpZu6X80ro9
	U4IitIsJWG83EnAWfJenQW+xFtuoltwgHatKtPBa664wQf+7JEePpBvayCOggEZeOr7J3I/tzbD
	hbL9EeLqIG3JRtM8BPT+poeT5L5+4Dmjx7YAHRB+8xNyOaqhtUiqI/X4dF+GYdmZm3tFvBHm+x8
	3Q4hoTT8GtbIHNbus9wHEDFc8ZjsOi/Tt2txByZpWFnreuwQQunlBcaoVSmCrs2V9urG78EwJ0c
	NLquQkdndR1riE3IgwV28kj16DO+r
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a2efc74e0mr1126040137.15.1788437281093;
        Thu, 03 Sep 2026 05:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a2efc74e0mr1126026137.15.1788437280614;
        Thu, 03 Sep 2026 05:08:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:44 +0200
Subject: [PATCH v3 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-3-8237f3a654e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhduGvxSd60XUwOZ0ZBtDftmYc7RtmVI7jpRodVUmA8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMWKjsfLDVFquC4sq1MYX9dQWCAUXm2cocGi
 VyqSWA0wdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFgAKCRAFnS7L/zaE
 w+AoEACFXckJe4k4VckvyIBNh9F9o1BjCEbRyVe9HCqOrXkVqa9r0+aXdqqqo7yy4ZRk9mCzYJB
 Xfvx5e6UZrRyyEc6mqb6cWU8dCf1yHUSZvoquLLrbV7ZfE1LI0tddaoR/2xqEzx2ZpyaNMXZDQK
 GVFCEXhokA2sTtn48T47VSbZaPuaONVyCD47QMIWKPC6aONdU79COJUX9s5h7zXEvCCGB9YHH/I
 GVXsv1F9Fxn+dUP3rR7NvXkbf1Tp1hvy5K7CZg6Iiss+TStDp6RjPBBq+3neqsPja6IDDRF2lkH
 V2FdLlNHMmeBpHewrlbsPMHKon9vzt5bYXvaQF8NaX2Auq7vp5YTViXs+uw9IQh6kmmS1Vh9pHk
 MvS8Me+sLqaRychtUwNf2EpUswwpxRKBhoqb2e77YMKWzPg/veUHDU+sK3ajsztfMckAU+Pf8Ms
 uTy2swyys+NDh6JwS3AO28gPxe83BxpRYufT+gyLuozMFNVckyLwNSUgHwg6KL8mSaqemkVbQwN
 H9e9XmnVKspiCaKc+YIpbVwxmAXQ4zruKsQTz2qygiF5FlZdSYWHxx0q6D87qHM6FxpV7RXb9G9
 Z8JN2gGruXx7bDe1oxoHtci797y8eb2O8SrO2hajW0Ob3MJwUj9kVVOEIHK5s4KuIf3Kr5wyRNz
 11RHqhoImciI/3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a996321 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=t9k0K3iV4HLebYkdnPwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: trX5nquZ-_jxT2xcJWBQi2reWE5L_Ul7
X-Proofpoint-ORIG-GUID: trX5nquZ-_jxT2xcJWBQi2reWE5L_Ul7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX2WPvaAD8ss6O
 26u9QJIDlEcv+8hzJm1yyLftnEKL3ANWPcmVN6smyuZRMNWN6dlpkRchZrB0vn51UxJjFsIM7N+
 eivSzcnC8OoFQF9TKu+xCW3+gM4UMJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX1+TezViqGcUF
 nh4+P5SzOmvYl1YKWhXVSW/rJrh6u+zWLqFjHgRU0cbjz87Y2KXyyEwz3t/iWth+77FxNr7sxBd
 CvCNJVyD8Pmn3odDngn5WB5C5uWRzd9yRfVW/OVp3uucWORN6Ce5Uvo9paBnqpJts83x8UDkciH
 nE9lAagkUfzZVVddVeQWxe8Ne/M5oxjvctFuXRo5i4fUtRZlDQoT8F2R0r03o6LOgGYkvPklyex
 s+UmBOZau2Hu3sWuHZqZrQRk4ySYBeTst6lJ6Z2+WePSE/hoyUc+f+AkxYXDwlGKHpgnyohfMjD
 /NmdDATBURZlak2ltjHpn1aVauH9L85SfUVBYAq2y2Pjg3jB2mP8rCTKcUbsifEj+cxnI/09xo2
 olvRaXYhNquLa5LWnJQ+5EF9fzcL2EwIYpSDk4lpUbtvIoXef6NySV3Y4MGXWdvMKm8oHkNsdds
 7Qw0u76q2ns+b/c4Low==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7320d3cfbb9930ca1ed5de38294f871b472f6f93..f0578f0f55563c34a6875377e444dbb674fc61b7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk_guard, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -589,22 +590,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -699,20 +697,17 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -777,13 +772,13 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return ERR_PTR(clk_guard);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -830,9 +825,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
@@ -848,20 +840,17 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -924,20 +913,17 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -1695,18 +1681,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk_guard, clk_guard)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk_guard)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1744,15 +1725,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3

