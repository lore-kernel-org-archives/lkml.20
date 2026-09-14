Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB0B47F2E0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390131; cv=none; b=G7pnp+BeNoaXxUVPvzriyiM5Y9Y9gSV/aNeyWe2c/F3H+vvkXioU09HMD8suqxyNb26ipdUQru5B3UFeazZ+YUlUl3DJE+w+OYmTEHpt8z+Vh5Q6BQuAlj/17h3ySsVbsY8D4vBylETQ/+/1V3VefglzBf9n01wshEyJGIR8+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390131; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G94Zwcb2OTmlPCviMb0o/AU7Pn4JI4AcB/iFlQiaUGY0kNLjlmNJLEU7zKiTOIDPYIrwL7h1YjtkheOXBZRh8LGFxEMXb+aHYpx6ZfIbImF6+eJ0l/BMcL3HM3NWcLQkdyOqKuYkjWHUCz8l8XXHJbF4qMELnZRUj3RaRqIuJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4Cn96sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M55bXo4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4Cn96sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M55bXo4+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2c2901935
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=k4Cn96sblhboQuy5
	cMxuQlHWpeKIrddXA5BYdoxP7EiNIy/MWbzNxaz38GpbkcmW83cNcwLFRn0fGfLE
	VMG4TJvlXqn7mWaB6naIPRXxP7s2OS3hlx8cR2uThE7pdKhzV5TpjCrzxgd+1zqP
	R+5UE1XNjiWWqGfZFN0LgTA8uh4o7EJvrtg7mgoV7SFJ8Sb/lt6qn+QJi5cGdWMr
	zPKypvz5/Rg2rHnVe0LjOwr9PWbqjDlOX5IKDUr92b2uwE1S/M7o5/4pq1z4cu+Q
	zLAOEoINSB7oCzZGgAKlNzEAwZamoIeYNvCDZNoaelTl706YkeGgs03igpFdoD/U
	uUjozw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so214312485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390125; x=1789994925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=M55bXo4+OPAw3QFHS73Pq0K6TQ36N1nfmZtiuNSz2IZNZWNJFRuSEmqADyf+knmIOZ
         rfJdvz2FbmZ3CIEPahTf1+aNuQAkC74qlEQz427IHDtynyNmOb0lEOzGAmCRfFLxMJbK
         mI3KiWBxCMpAeRSecvWXfTKClDqoFmVZDsVl3IgrlQuBBEJ51aMjui4aX8QxMSGsHUb7
         cgsY/tNGUm0RKSVteCyk2AyTtxnkEiFUPX9hJucb7YHoqD91nIJtLcHWR7+sq7leVACF
         mCvRfypF6Om7wWIJlkpsDfwGuSNe69FBYh5ooxoikkLpOV/pQifo0UulINO1UARzDNH4
         h41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390125; x=1789994925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=M6522u5tUxRp98/zUlpOeqDU2My7gS5yZJH3ph4fS3x7GueLkbIvsCDEYsQav/ZpYj
         BuyP9YDLzxHWceBrpqU8reWsHwsJOHB7ZW5FgrF5yRBvvfq1sdyQMffjASaz9SvgNfJb
         WmUCXdTB5sDLa7qv8Bm8uxhVSHMGGl9rwBcr+RHMjCW28RV0WV5IQ91ocsM5ht4CDpms
         WGqg/mmLJe1yOjTO2RPks/sT1w7ZlsVkHoOnF3Kqop8C/YkoO/E5kIsoIcTIywS3qaqI
         MXLaABKMXnSRiTHQvJgOoHnF5P+GqeH6ltsg3C03JKZvXGbgGAirz7Zq3dZyaeN+F48X
         dCsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQkq3X3sc5Qse2ukSI7q7P8HGiKqbL3ri4L0Fm0qtIICsTNbjJrTXJZ+NhEAFIht5uAXemFU9AqXlf1ZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ktxLDpIeTbTPH4VQQE3fRZNabO+vJKIWxySyq3V8kjVWZxNgel
	Xkc+Zq7tWkf+V79X+AA61KO7jzyFviBm2l6GPGy8s5xJWw/2acDzgqRvt3Ywdn0sX/Q1gb81ANr
	xhCX/wPi+if4AaoZMkrPcp+6gBoeaRInZfe5ry/t6w6K4EmEdZ+7LqbXWAhMwjP0gdsk=
X-Gm-Gg: AYBFou3QdESoGCnwmKM52UJ4obkK7uEuDMBgC6mAXsZkc30sM5Vh0ht2BxMK5q/iYiB
	tOxsBmgvlrRjQ/6yQOJREfazw4ZQK93jjlwx7B7rWkXv7AZ0CYiuCCWp+Homn1qMQyEK86KQZHe
	sYVsFMZl06F1LNPrc/hkRFZ706t6nB+AMhlmo2WFoBPXVr2BjuN1DNDJLYElmXEWjtRJQn5KkB8
	XUHQGU4XaANprNpuq44Zezn2jecerbHIe3pWgve/X52AT/BUxZJeeqe6qHLNhfOjqfwBjV1n8aj
	6HujqBCIMto6aM98qG9MSfqcE0nmfKpSVQeQ3/eunZ9RIPhmnmwW6BQXrMZ0jZFCQmIaInwSOrP
	Wz82J2K2H
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343040085a.35.1789390125375;
        Mon, 14 Sep 2026 05:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343032485a.35.1789390124706;
        Mon, 14 Sep 2026 05:48:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:15 +0300
Subject: [PATCH v4 16/52] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-16-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zbcD0xKA/Ju9pSsxhdtvsRJtdpsvCuXdsnp
 nC7uuOrWxuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2wAKCRAbX0TJAJUV
 Vpv/D/9X/wGaKFTwUH9gHBr7eIgfLBBvU/XMS0A0qyQRFGTYu1usAnL9hNgwgFGaZdwbH5MsOgz
 nD2vwenLgPfilxhv8UQL6ziJHLzbv1h/P9dnrzfZ6ZvQk59+mB7PJ8eFPLTf5Tuoqb5E7vzUkiI
 BlDRRwaEcRYA16eD8ZdBKMGg4hdPCL8nEqsv9f6Pr45LNOEyKvgY025lmXE4P9OePSIyVuJ1Y+L
 /cvcfbxXQZRWHCn5nsRVBF5EK+Y9chOxuajT+ilZ7vaArg7EQxFW3Ziy8DDDgg7WE52NWJNKxdN
 4va4oO4L5ZxU5MuHEvVOasJrqQgz9ZxjiiGdYCkaV6E4SdApIRSAfgCCqx2Ucx58M9vRfu+gp8J
 h+LDyhdAtPGlvQlKicjmoA+n+yFFGUMZno3K/SCS3Ed3eFn8ITbRr+JZtbLBYu3+YrddKVbDj8C
 R0WNwIIda/otgJyqIY6xz158DoMga7gZvijQtV6jj5tLSHRLqE7C/ky+O40nYATTH3qo0tnrQKz
 9UKk6/f3LeCkYQOUow807NzoqOr0q1eUVkt4ofv0qgRpgdt4vTJTOkJ3vhTeuyQjWMntyfUWFkH
 ONKLOG6eYfGh0zbib+sOFDQ6rN4vFnpiQRXXWQIixLsE+AXY2z+ruDI8HcycNJQ+RmBbxXYYeXp
 BDPNX7MqatqmoTg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WX6hdanLj6z0LtV2m6SCgGmfi0w4-UZs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX5Ij34X7K+rXS
 3sFU3bd2VD49ZJc8BoTqI0Sw9JNLkXtoyO1qqDJcjziyroY/BpJ+chTulqoZT4x9yWPNCO2ggZp
 +REFoVbcThuXOw1ygjDTpd57skXiqDw=
X-Proofpoint-GUID: WX6hdanLj6z0LtV2m6SCgGmfi0w4-UZs
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed2e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX1btoDoi2Qvu/
 er0dgkEFJVU3Q8ttlvZfcWTrtK8pSmUHJv6QVWrM+qhinh8xxWmb85NK9tgoBLSXrkb5LVqXHor
 iHTHiIoO7ji7wsIgSS1n9LqUyUzwh+e85Xfm5pmtJ6qtluLX7iQobW32Z9c5jTXh3mv2IzaXHHB
 ek6fOZQi70gtRiElfxjJrm6ck+oiOOoURDjbGGZMAqI8spDZUIbNLlLC2UkGy8buLpR5Zoqf8XF
 /yPOPBS4Xq4obbY3bsQ5vrW7IZoM+eH4RHd121zc6Yiqr5B6DmTfVIJA413wlqN+bH7pGJeeTGY
 nXKBLVXd48hmS/glRLki3V+gjJI1YYvciwJYApsUmc8p/27fATQK1asP35xi4iES/xUkQuDERT0
 Pi81cCvoPMrbGtKENrvHxw/Bgy4mk2gQSi622Uyr0oChymaZMD8QwgqEQiwcYR4cXjW3GWXCBEN
 GvXlk3e4p1OEI1ezyLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

