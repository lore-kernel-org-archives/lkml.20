Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266C48383F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246475; cv=none; b=lO6QTwoFic1aruJu5zwpUDyKaVIqXeHD8nlzH6jga/i2TEz2MxwF9lN06owmjQ82N0XtmBKvagsaNNRA2EWyF6spvN84+RrJ1NFg8ebpTuSuBIYXhod7Xvl2noOTFV5VCf14+oTAE9gK99tu7xLabXwk14rIyMRTnMl0ByF6mIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246475; c=relaxed/simple;
	bh=ABnh6kyCokdb5pwuCMF+lEUTPDZamtdijG5Bl1hQ064=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAAdipGQKdBpxvs+YQH3cFYULV0dexXHF51tL4Zpr5teVGjQdAC+sGRBTHstBKmuOadZHKTc+0XwFmrBK7TsEtKd0vKyOjtek+pboDo7sA9faGti1L8vQb2aQ10YEl/C1+gr9P/eg5uF3sMi8NUaSjGHF/AB+f26+HjAp939Qsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcD7B+es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6nxm9db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcD7B+es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6nxm9db"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1OEB2857950
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=; b=RcD7B+esCEn6Ixeg
	B48sqSIjPbpefP4TYA1if8nMtxmzEV3wCL9N33mm9wD/oRnhNSK2nSd5qWY1kkj6
	iEbgupR2Wjhs3xQOFaDD2TWwHgg6Z2fcjljT8u4R6kVwHSQNji3jatp6dM7UWjb7
	NoQ6Fn7jQ4C/J0ioojDMlgXgZWI155pYslcWjq0LmCo6eVABOeHwxY/E11D9YK64
	IgLG5OrhWlNTTmkVdFxKuO1Yne12SUstTE0EEuUeRAFVVDo5NI2inIrMtZ+sfUZA
	1aXwEFZMflIeRDr9s6i3jWo3nehsCaoT1bzzw51I9pRLIAjgYcgOe2UWfqV/Hljc
	IBFz5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag593-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91051512080so26694406d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246472; x=1790851272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=;
        b=V6nxm9db4hFkPUGpL7iP8B4V4BEW9EgwVSU595P64VOpa+XjoWuMZOKwnwBteW4xDt
         JZ9ARQgh8L/6Wb5k2JlLAgS30cfeoRvva+pLbo9bh+wBBQl/5K9encG3uFqe4RQDvVgz
         D1G6B5IzK22r5Gk7hPidN/7VfdlGnxHnFefANAOuX75beNNRVUTSa1JySul7S/GS1hSU
         3LHXWxyeQaVVcrHw5MXNoOZSpR7/DZONZjBUdt9oENdU0fF2jz9V2VrD94fRoc7QMmos
         TczL2DBe4Kq7Kt2TtTY7yeYDnjQ5viEClLi2itvDKpsoFIfNmCTvNOE5Xeab62oyr0y+
         XbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246472; x=1790851272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=;
        b=KyrPwUkCHkuH7zi6l8CjIBaSIExWrX5jwerO4o45BfqeJqGhyvjdeE9qFWuBtg0Tjz
         0opFHnS8831W1ocV05NT/eYWjjG904gsb8oWGVTSApu+WbFoY+475yapil/u9C3aiQXe
         SfW8MGFF6jEGXNS464BRzFd9/FU4AqIvxZgFXap21K0bn0duswNKIer7sIxQX2Zg3u66
         MRG5HksTAgpeD4qSTZU7lARQ9Km3e3k8l7XyE8yN7+fITsNKkH7/wwbj0qKdgikgwAqY
         zsHxtBUsxP02a64jJiyUGp5Jq6FWDNw2hR2DmDoBEoTfKyN3TLukcYz3123QlINM8wA3
         Z8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwZHMOk1HKKGCwFIGY/gVDl//mAWCs2xLMbbY7uykyvRdcihownsV/hIqPgCzX68fHZ/JeAnIW6GFtrLu8=@vger.kernel.org
X-Gm-Message-State: AFuF++ku7xbmENq5ms8up/Gj5xmG6PdWtATwIBvm/M967uDraZ4xbQEs
	yqH3oQuSLeZjnnRIzLAKGPNsoRkXW5KNN5Z8jA4FBKPLkDjFpkctthQovZBZhyWaRZl6OB1Mo0d
	UAXtUYqXtpz8DWtxuUV9P3uH6NpWTrwl/tJlSIrNTJyIadD/lWtfTDMAVogQVDHFRpz0=
X-Gm-Gg: AYBFou1adrUch3lhBwJ4HGTGEOvjkphTPvhNk+8Qydel5Elu63jW3ZYbZDrsmYJFX+B
	JfegZt3UQL8QbmSpqpAhp33XKRR214JKnT5YJ0J6YWwajh0oIVpEKuquCdJ48lO9JBdBoH9961/
	pMqkW51hfaMPa/d644sATq1lOtpGqAfmRSLRWV4F5U9qc5T6mgk4dI3I44/nH47fC1nMeeYfx5k
	brh99uY1eoXvmO7EltmdZcbXUV1gCwgTHyV/MwZPro3cDaBDFdO0eb89SKeyxWoi61KWz9ANEaB
	iXIwXdXB1gOBiilBRnP9BEJPIeZpS3Syr4SfY8EdTnQZwS0xrM7hniUvN+RN0enym2CocHJ0oML
	tDkDHWPvQ
X-Received: by 2002:a05:620a:c41:b0:93a:2a59:2b08 with SMTP id af79cd13be357-93c3624cdcdmr239990985a.14.1790246471618;
        Thu, 24 Sep 2026 03:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:c41:b0:93a:2a59:2b08 with SMTP id af79cd13be357-93c3624cdcdmr239984885a.14.1790246470751;
        Thu, 24 Sep 2026 03:41:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:38 +0300
Subject: [PATCH v5 22/42] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-22-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ABnh6kyCokdb5pwuCMF+lEUTPDZamtdijG5Bl1hQ064=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3vG4nsfH194PZmlC76CBDL9dBzDMUuqNSvJ
 US2lMfoTjGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97wAKCRAbX0TJAJUV
 VgaZD/9dkNE6VRFabvaro4kNjYnh5ElEk0vLt408lOVaF6W+Z6sxrGH6rEdrJfGJM9jXvLXSRt9
 Mw9yU27AcFl2IP42+bxUsq6Ll3NrrUyuIDa16s7nblo1IViAAFAie8toR2K87vaMnF1PdY+2U2J
 YGkTCr4SQjaXgOookZIQgnrYebOotQEKDCtm7PbraML4z5tI5r1rVoeZ7VQolGRKKApN+zBYr0a
 tPlEqTJ/wZ5WWyGF8tjbCNstcjw19t0dbq6sToMomRl8i1ermsVsx967T/cI0oe+yOMviOI6+8G
 mX6EgtvIU1qZn+NFBmOgU8IK7zhiCgY3YOoIpv6bftpGWzuQao8KY9GaYiD0pV4vmWqMtzrdlbw
 X9QsLRG8V4BILb4x0j0AVRwZ3yVnfMkc+UYNqoy/wW/yMYlsCYoJHvAHut6KoT7y9A5hOI0q0dU
 EYvzO101LsAMVRoXIXYycdrhVjQOFn0UIu6exLYqgi+ezmPAGY/Hh33fTpIejQIXoQnFC/qMY0v
 wwYenpRBl49ZiySXuMDtaER9FSVLZossD/EmeagVkXpafPflYAN85kWiv5aWmgV9az7fOIk0Wpl
 2J+V1SsisIFSz0ZBSatrGofx9VPYpGAjlK04Mdn1qiCDMusgHZX0/529eB/Nu+/Q59n31odT8OO
 y7TVMEzPQGzYaxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxriF/Z6LdPUK
 iulL7aaKT6USqmjKbBKOQzK/zue0d52YP1cxxDatH6UNJhJ8v9nUfPZuTOxwIPEJX8uXxYOtsGo
 /omyDTng3fZOFbCsiEkqjyjHwQFi4sPlbW+dGXXflymafbe4FI8O9SqaUe/vxf4nF9Y9WygO4fO
 5HOLpRnyplD4YSPJHhltdVQjIMWkPv4tZO4aDVHM+wi+huHWjYA+QTmrvUBAkaj1SDFfq6gMQiy
 Hg9LrcbyaSmXsDC04gB8CMpoI+XezCt8l4wkdRX4Mo+8guzGlF3i0hwp7uA4OjoK1wxb9IN02G+
 5p1SQIft8odLAEMBsyK2kRrw/J1zRzkUHPnln20Z5ULneouFgSWrLvIn8ADIC1Sms3d17cFK3FL
 8Ixr5qOX2DUjGC4RdOmfCncH14Lu/VrUbQ3acLX0pfv0iX6d3nKQJHKcp303oXtoxb3k/UUFRSH
 4xfmuuDUOp9DMbzfHPw==
X-Proofpoint-ORIG-GUID: Kb49xeMLUqZtEs3KG-6pGG0Xu1lYxJBw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzLOr6WFG3EPE
 GhroqoCn6pIAd2rr3qE7YwOI9/agPVsm2djNstL4sNqMYM7EOkZ/hRjZExfNUKh7kRN4E4ugqAI
 Er2HDj39WGrRMgWxawE5OC46TzVC6lE=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe48 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Kb49xeMLUqZtEs3KG-6pGG0Xu1lYxJBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index cc6eb7ca9c03..ab4260f70b54 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3787,6 +3787,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8350_match_table[] = {

-- 
2.54.0

