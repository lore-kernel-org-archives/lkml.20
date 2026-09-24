Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DCC4779A4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246471; cv=none; b=Q7fyNo4aFG31XjDkW8My4oiWJzFVJ4rxBhCsGB7aLidfmoRUX72AQ3L3jVh+7ZKsRa+PAErCtGuU5xXrx54Qg43loo65Q3sHccWi5UoMl4LbYJ4JNHhxxqArOx5RIHoEodI0REqJhpAMtAMW1PaHPoX2nc8jNU0Z00Sqhq24Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246471; c=relaxed/simple;
	bh=wwX0TpJRP0gdOZFmcgM9DFTYIrqZzWE6Y8fytIY5XK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6oc55gHuwQNh9Une+RQV0pALSZGao1sLL1Jn0/LTvoEk9BWr+0qmwigg5OAO4/fMTCAJyRG3YKrmx2GNyw4E42koMktG2xYnvNGJCLlfW68IxnzHgW/i1qa7LTpUvMUVsoy8O9n7IIfvfOoVJTW23CFt8+NT4NhByKnUqkDRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7ERaqrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxPfaa8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7ERaqrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxPfaa8W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA669V2333022
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgeEa7OVzOKjuhhOChuw8lPejC+1TxjBF/Bfixct/oI=; b=n7ERaqrnVqlFo/Gt
	2BzRDeAbI5e1sThHOOfQZLZ8Uv4fp5zgogDQnHt/BabGY2cP76mNSgcLogY183jn
	+Saddd1/DLdbOPa9Oz+tkGz90pX0L+9DExR8jl35TH9DB6Nv3FkCfg7BC0tADl74
	2jAiXu0qNcU+tJwk2hr12wKeyhiqNH1uE7qjSQ87eRhgZsd+c8TFvfYFAoEsZLK5
	CQXE9DWneJWgupT5OCIBmt/QI8bW9tXE5vl4hpysspGJhc4Pz45yfqQztd84Pw9m
	snx4BWSF/bYidKVhYz+0PWZn5Fhj2hY8Czn47xZoF+zF0vRYQILBBZdMx3chOe9h
	Pe/7tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg3y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so293336285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246467; x=1790851267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgeEa7OVzOKjuhhOChuw8lPejC+1TxjBF/Bfixct/oI=;
        b=WxPfaa8W6twrA043qHlFJnwx56jnBqcXU7m+JrJy4xyoYYcl7H/YiUrvjgDFTOl5PP
         ZcXx99E3XXI+dItNrs25WBQv5n4W96F8Zw/wStZyrrOcPdWmIC0Bj2rEsu7xR804voNo
         IPiDJQvxqwUrenZZAco9frFlvPNFGr1sCWv2E+ZWzudOGxPs23cX4etcA6Cv3Xt3tSQV
         yX1sHCX2OlPFoVmIWQKgKdEZ61D2oOXI/0PtXfdmfuQS59zJKiYPdxTN2wC8JoyvLE6X
         kQpUr/h0benQC3sOQ4zcC1Z9k03QRNbnoWaD5QSvR1lb72j7pPcK6O82UaQ26wVJJGwZ
         74WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246467; x=1790851267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgeEa7OVzOKjuhhOChuw8lPejC+1TxjBF/Bfixct/oI=;
        b=zdPL0zJC4ZPveJdHZP86C5qP+jB5kF1o4HzSUFe2eAktnwnqRFqaLdlSzmWKL4fB+V
         db+rL2LaqzuR6sXoZkptQPI8/FR7y3CT49KprSuHOmN+lH+n3BG9W+rbmFzJoWOjnzCy
         XJogaQJAmu0r+YxitRyYQdip5Qauuk/MUYqD4/tVrt9EfFXxx+cesP/EHfAGOYLzvsxz
         +KMLwWTNbDXwZec48MKoaDT7ci7UwHVFy7koLis02mUJDxqOh4+ynymFnLFS+ZjneBoe
         onQo6qX2mgM2YoHqeB4AALax7+h8Q9+cl0E3H9xnlyvC0/5KfsYzEYJ7Tb6rEzrfmEU9
         dTeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy24nFdvKB5nGw8HRlmrGACsS9TthhEUVFa1Nnz32gE7FAhqbidk2zLbNHnyf+WugpcYAJnv7tON16w63k=@vger.kernel.org
X-Gm-Message-State: AFuF++lrlhJHMH9kcy0OygwyKVPEkdWmbJDqkfylBMOcbAJnwGPkJm+4
	gHww8yFq0unu4BK8OvSKM7QcFwUrqXSYT6teBaFOqd2crJghLjc3RIcqZXD8sBovcn5/w+sPtmy
	05sUt71FzQxq4TmUU+yixMay+GVnnTAuxtbrd5+GxmSyJ51iTCcstRB5h9TmO3LPtqG0=
X-Gm-Gg: AYBFou27uAZG8gaENFSIY6Om8Dpt7hA64ZmLW7LMv7jbwz/s+hvByAPucpoG0xpoPXu
	ONLRsJHFpceNg/ZtXEBaIKeM1Rr5N5UYBc+6SQv2yUPbri0pk5rfrm2nDBpkqP0G+VqJdz/qjwo
	sIcyeehAzS51pwN80HnDOQ7CFqXi95ZxgdxuBQT6WV+LTGLuPxzW2nucrMyOezk07m6vbkdh7yP
	0zet7ZpHn7UascE+hwFnqqKwJ+qBsVJshaI2NFQ9gCEIvUFMwhvmVBswRucaZgEoyjrgjvdqDDF
	lNHR6/OodiauCjfjhMbk4TjsXo2WYayjljxy31DCRs/lY8xQf16m7p+JrMNvzVTmmZQXp27NvoQ
	0zF5TawJt
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr222212085a.51.1790246466519;
        Thu, 24 Sep 2026 03:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr222205185a.51.1790246465776;
        Thu, 24 Sep 2026 03:41:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:36 +0300
Subject: [PATCH v5 20/42] clk: qcom: gcc-sdx75: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-20-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wwX0TpJRP0gdOZFmcgM9DFTYIrqZzWE6Y8fytIY5XK4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3tBPBmvYwHH02s5TbCF7xl+eyeUOuGBjijD
 UvWjZoGM4CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97QAKCRAbX0TJAJUV
 VhH8D/9CVrU/SDJ7yAULRP9IGigrryg5bzTXHCEq7/YE+b3vjo2D1lcZ25a59ZvVcohmoGnZVWt
 FooWff8EE32cuS3fEjCNRx8C6RpwJ/IEImacNp95S94y9YfnZwIRwhCF7CXJ26f/raOQv8QrnyD
 SNIr2GbLtA80v4biCcUoqlNW+o+VSE5MESjeg+T2Bp1RvrYxaYZKdAA/UbZaAjykNXWosuRNJ21
 v8jlbFNWeOyX3M84F2/zAhuif7DXVtakMqF+zr5umLaokYz9pqW83O293JfLq5ijuRvwYLHB4WE
 8rZ0FbYJHh9zZYFy2HcMU8unoBc059m4BM1S1OF/xgbky+5ofqHGXoz38Az9PMhtGl8+ChoXbCX
 Y6zBsguDzBD/ARBAwe8AEZe/rg8uu9oqWAcUfbjb+ObFUh2y60JeFyIvgVzAa36gCacBEL6Hwkw
 yClGyjGW/N/6XjbqrQez6dK0P8qwRZ+xqmKZ9e5xfmvmE+zub+MpBm2lTNstiu7nCb175EbiIJM
 cjLvq83HTcfwEV/AQMtD13la3JT+Q7GdpPh6+S3nsn1HCYIRsoiy/Gf/UPsCt5t+mb/tjysNs6M
 ogjSePXi0bZiEVTdXF8VGrJ+WG4kIu54dx7VVzH8eg+9OmmmaXUYIpUVUdIKuZdSIF2FRL0Vk9v
 8wCsI+d76MtudXA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: MxJWVKRvjBnmjzzkkX5-DGVaALrJTs_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9Y80NML7fATR
 DvPcwCEburaZukSaWtLiNlysmIW07z4gb4X6zrnmgsqiSU45CCr0JW0xNBgR8OmI098CLYrPpNY
 DbYNkK4wUiBTsgR8UAKeZ0Wurazmv4cvl5uj40f6Hfjcq6pZYadj3XJL0EhS0/ijH4ttwNIj9hp
 LUthpg5UwEc0ytbQ4Slhu1DM9oiDLzhvJ+lQzt2ltJiStwgNvkRD1ZRVRS0gFhHJWmwCGSpHH9L
 lczqkBYnPMT5BP/YLqeJjcdoPd423HU+LHhtn2KdNykaSmjTNu7uIfaihXu9fWx9YNAxGZDrqk+
 5gpAbBDvmI9kbU89KqYf3P9Y4zTAm/XBBV449mQv1VEYkMCTaRyTpUVyvlyOxcr+os4VwjAUHO3
 4uWVIeWrFh7vtp+o2mlVgV4UcuDQ24rq3Ib8gpCpe1cCyXllsyyJAeNTuLhpvo1aFL81jBjLJ5P
 a3SkIhSXe3ptKk32Vjw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fe43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MxJWVKRvjBnmjzzkkX5-DGVaALrJTs_A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX344x7ErX5iUd
 7/fjNoaRNxCvyAygXB/3g7fH92r6sKBofvzpY5wX6aki/NPEEQrTQNB07hm90PoslR3+goB1OSK
 CKGN35HYsuksSdU6ZX1Q6rUD8yLoUKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index ce9f19655d6d..97be0f47bd18 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2913,6 +2913,7 @@ static const struct qcom_cc_desc gcc_sdx75_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdx75_resets),
 	.gdscs = gcc_sdx75_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdx75_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdx75_match_table[] = {

-- 
2.54.0

