Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015EE4E66B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554583; cv=none; b=YvbE9icDl2Sj3+nI2IAHnMV7ef1Y8p2h6ne/BF8CTC0Qv6kvekxWxZxQRABN/ytiuVXzJvUoeS8MENR+BRYAg47IdGLkj/5bh9U9+K3McQKUXbxn27tdNh8nuFsDA6DUeRRHXKEE9gpIEbm7u64X50zNd1mPGV2NUzIGfr1AHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554583; c=relaxed/simple;
	bh=GnOuiy3DBg46aQA/28bQPDnc882/E7A730/MK6hlK3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aarj21y5kw+5e0jEl6X3HlkZ/eSvnkOcYWdghyCYE98WuCuDAEk2DedC5kvrXWRP6wJqi9EKrAmNCVBrT6uReKgz7wPjNK2SKQLYRtYG1iLRVYWxc/nD4HFwA0nWDRxk+ZElt+9sjDSNwAQsfJqXvLLJuoyK9dwz0651ZAvQ4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGPnTCsn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/l3acIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGPnTCsn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/l3acIx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934EW2226525
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=; b=NGPnTCsnacx8rA3u
	x+7nkfIbrnRAcHL05PWb8wcNlCX4N4EI9Yva4NRo74uU6LgQ/9ZwUEU2FETw8prI
	uibMTH3Su2zBmP6bK58WyX7Mt+3XxjiUnWvAovrQbI28wL7yPtK5YuYujw4HUKQF
	7WhWgfSC309w3BsCHHhB0DUS8MNBpLPlF9FGrMX8DL3RxGUr+Z50zaTqQP1/XyKr
	rrdCfOxK5OYWneyeczipVA8XHUg+Dm2xghnM7vc3tNrLobzwPIQto6G3NBqTVtqW
	sDRMXiasJ0EGHQQBo8ri7VTPDZea6b4JppxOmCJAo2KH6q7l1sLhjPNfZO9ac2ty
	+TXJUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9usxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0050a554so1095026285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554562; x=1790159362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=;
        b=c/l3acIxNDmdZHh5PXvty/LHB2o3NZ0k+Vz3Wh0U9yevpyQVjTQ1gD40SPtTHMneEa
         rBSK89Dpe1ZoFMDCjXtH6LPzxg717cRN6CIgrKOsoUentOQnhUYlIZpgxK0szind3gz1
         15Rfr14+cmbGorXEW9kc2v+2KxVSSnDhBSPkvTiZJW0uxrzccLLw31jhUsH/2R4kzbfr
         iNi6l+INoFVCRWrJ1727BHH+kNX5Cxqh4ewnRbCSSTPcPtIpvpOsem9+2mIaHUCVWocE
         0fWgkcIp/12KD6y5w+UI32gjcpMxYNvcuNh/KX92f9NwBGj5J7cYgr2AeLvWgpcu6tKz
         Txxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554562; x=1790159362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=;
        b=I/ht85cy+WJv6wcqzHDtsR+D2DawQpkBPpwA035N0II+iQtac9FBUOhJPr/n3CZkqs
         ezorSX5UsSt2JeSflWhk9PD3pRtEkg4UCIh5EArutlKw5ihIkUzLQd/DX5bd13VSI/+k
         MyFBMIZcYj7AbBuqsEVXsdL+hRVfLL9S54Fj/CxkHBvdNUIcfb1ERWjUJ7tGOIOrOwxq
         SMALjm08Qkk2NGZJ/FL/rmDUXYbI9HSkqzOktCvawGbei8QMdF/7JEa9SjdvmIG163gP
         laXsDP/iuT2gAMI6RcY6iZQoiQbP6yeN3KzU29KQ2eCGb2vTYIIONi424UzOyq46Tb0I
         5PIg==
X-Forwarded-Encrypted: i=1; AKwUvBxSBIjqaPAViIMfF91tStzcsmTcSc9JsCbSTTd7hLYCEwZ42akMMOPbXJz0afEpaCFN5VSXQ5SCD2Yszgc=@vger.kernel.org
X-Gm-Message-State: AFuF++lW0ReB3MXpT/opUx1Mdp5T3jPTtVPv24hF2tWtjAlRgYfMbmpg
	IaAhoS0j7yqQkI4PoCUUtEShPXFrfqY4bpuPdsXWm3tF3z6Pn82wHh4mm0He+H56eY0+1jORKtn
	Dmz6ke8F1OfB/HVMNu2zN6hc+1dfh2KeVciv4nbb6V7qENJbAakNTAANFbLgihlB16+g=
X-Gm-Gg: AYBFou0r66QUBX3ONLgyAYreH0dPwVFW0PGAXJ5Obcd/8Mj9ZdaE7dQ21jnn9+IPBjt
	H15RHf5id2JVBO4ZI/ReQudQiYknBo8ygcR6tXuCiD+tnElG0DkzuKuWiTN9w1uocl8w/JEC5Sb
	2LTlrrYKlRIJ1DbvrO7rUiIl1E3srePKeWPQOm5KoImB/nwcvfs5eTMgsvYMVX4iMIzrhoVO48V
	zoHNS3Vey/qDn5nMKP2+8p9FWr9+OX+FfH3WHlGcVCR6Yq+hHDRSqv+Lf7/8nVN7VZ/OuA8a5MC
	l3XqvBQ/gezKRFIuMZBkgwfJlvrO1rGNUsbVAowfRCvZ+fu71QfBZjho8bkmbodluQw05YArab3
	wHs5994M=
X-Received: by 2002:a05:620a:708d:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93bb76e6cc3mr290702885a.7.1789554562297;
        Wed, 16 Sep 2026 03:29:22 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93bb76e6cc3mr290698585a.7.1789554561763;
        Wed, 16 Sep 2026 03:29:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:19 +0300
Subject: [PATCH 03/48] clk: qcom: camcc-sm7150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-3-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GnOuiy3DBg46aQA/28bQPDnc882/E7A730/MK6hlK3o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9NOMMChMCUL+DEcmWYx8QLJjA/Xw45MFbPe
 Vt5ixeZ/8yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTQAKCRAbX0TJAJUV
 ViieD/0VVLBypTiruuzx9m8YkiYfRBCUS20GSYFsmfTLNPyBgQXAYhlaXW9ep4s+VLki62pe0tb
 52FmCFo+j3/hZJ3o619hxWYp7TjFkjkqjZDkwncE9SZ4n4227ejH7XxmHg/EIJ1qKH2WZN9E+HC
 vnG7ioNemB9xfAv+bVjClRYhG0yDB2sg4/U+20nlLE6RRF5jwKm71Umi0GFyG4YqV69hqHlBOtK
 CE5UXzX5rbixnuC/TiPDy4zWRdynSlqoDKT5/vOB8y9X0XDvWcTmVhCLKmAlPlvztEfrfw/vxka
 F0UKkj1J1la/eGpjA3lE3C4BsfCZHVvWAxID/pI+lEFBpQeAFz6+ukSHvN9ZLvdSAgMiGXKKwKo
 BfwZ+fThfEW0g6DKURrnYgSCywXsF6u9MzL2xmOVIta09tltl19p6/TAZFm1J7dILVMtSpCdJlM
 ZljY1hPvtm818+rnNYS3+evoGLuZQVRkUMatZb6QydvFGi9MHcdShOhp+NnhLPBUz+u/AdrTeLH
 ndcCKJkkZgR27DkrtC2uXCnfNRAqCdI5WEobcbRr99lIyxm1QeF8tr8EGP7au23tun8OATtSu6o
 i8wJ9Kh1BPLKqLOXUOvaAiYtuG+K0OIqZ3PPIJ1zf/Z3S1H6yUhhye5pnaLRSUbsnQ9N7YsxYmm
 ePHAhpZvHIyFfZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bQTroZZgG8CJslzDRBIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: C1hA4O1QUkMgXc-zKjlgwwmhvd9ghafq
X-Proofpoint-GUID: C1hA4O1QUkMgXc-zKjlgwwmhvd9ghafq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/BG3tRX8N7N0
 UI5LafJSu+5WSWRWQwCLmX7O9k/6nh/nQxOW+9S9x+vBbD7NgsFLeOrPrEPHM4t2I7i9N1LPKVO
 TspLVUbgk4lYdMgmIRxb5UL5Ab2WMPt0ii0L1/5Ex7zHkBp1SJbq8aXYTXKuD4DqcAd8vV6Kmv6
 s1JlQ0Qw2sa32uiv8++/OHGwecggEomajZv8i5hBLxPkfhnGoDPk5q+zfi585t5zIaGcd0X+0MX
 1i9g1RudPLj9qjMboikdtVR5kYOamaU5zYccNPfWZ+yqNhzw/wUZpcEyALR5GhF00AEEgm0HgmL
 rmwTRqBdm0GRBWrZLmz5vJWj4dGdFoNr0FuhLh57QDkOYk3wuavizRi0l40CkuRhX8aMfv6ZSwb
 5TgoCq+zJWX7QaZ5nm9VAvQf5ebOmUyadVMYfFN/O9pIml2Pko2hzcgDnIbBJNah9KF2ZsN582a
 KH0m1IDZ0U9M4R6L5rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/0Ph9yJvHZjq
 H8sViVOkD6ky1w3+MnJR2muFj2hIGACuspkB+t/Mo9T/craa15a3MNMJaIdA9FarS5grjep62ss
 NZeCQrK+JqZHxV1UjZSOnAfWMek2puI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 6f75689e9847..d06258327ba7 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -2008,7 +2008,17 @@ static const struct regmap_config camcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 camcc_sm7150_critical_cbcrs[] = {
+	0xc1a0, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sm7150_driver_data = {
+	.clk_cbcrs = camcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sm7150_desc = {
+	.driver_data = &camcc_sm7150_driver_data,
 	.config = &camcc_sm7150_regmap_config,
 	.clk_hws = camcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(camcc_sm7150_hws),
@@ -2038,9 +2048,6 @@ static int camcc_sm7150_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 	clk_fabia_pll_configure(&camcc_pll4, regmap, &camcc_pll3_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1a0); /* CAMCC_GDSC_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &camcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

