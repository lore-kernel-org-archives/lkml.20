Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42C47F2CA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390128; cv=none; b=bcRzam17V5XnJ1w49yU+rTc83Yjkb9hk4vZg7Qnj7PgbBACyBIWBBoM0eRfQA3mT+UF1j/FQizQqCIWglbKTgoaA6QhNjzb8VKmYE61qtCUATJFkzljf9V36GVMh8ET9l8LjpjEmT4EGxNGwzP1/taffbbqGJXFuh76Eo7yGpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390128; c=relaxed/simple;
	bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJEpTOQIUYoXojI0oXutwHtZ+GUsxMYsja1+zS2HmWNg+2mc+j24zHVZF0jSfiyYQkT8vFXgZhUNATyypHj9xDHJ4woLa+aatjLH7XagCmW9xqdLJbOstyOFQvEpx/gWAyOhOa6ZOtkzX5vhzuB8cqa2QXqVVhczch8z1g3+Hj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH06U4iY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEL5pR1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH06U4iY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEL5pR1j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNZ8V432144
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=; b=pH06U4iYeIBa4JUn
	BtBToZND8BRqMTTgLeHWzQ5DY1fuEmJ417OhOiWX6JuB4PQq0a1hBMHZ9ykNutDJ
	H9hVrjLiXYwIybVRPwlc0N48fnmq+2UwVD+J2l8/IcaUE/rzRGA9bB/D51ist/By
	jyFptHR51gmEOl1g/AYuZvxYHaJT4vVzuvWOq4l226CPG08HLKTWTTSx9jFjJ5Td
	SEAecC+6O6oIfT8NTkckH2/PGmsMKYAuw/rOZAA53zPKkllCTEvYkKDx2CdWW9jm
	uoPtougbYvXB6iR+QdedHXeoNmXOD2dwBwF87L3z/rXLn5q6u2nW150Ze9irIiqN
	+gXPZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso452826485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390123; x=1789994923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=JEL5pR1jKSSupTN1S1/mBsMs7vGLHG7QTE6DoYUWG8KdaBi3sPpp7BzUpBzUJfonEg
         WnF1EKFmphG2KcsC+lZ/QJ5GeW5cZxzLMX21dkn6b14i6uGMPVKdaXSkHAq+eIUF38TD
         dRkwcZnzbhxLLy6hh04xpad63gw8K6B8OTclz0iax2syCjRd0AWQgNUmmPx8JuVPDBKf
         bMMSUHQV/gpK9NKBtitA/4vEouY/Xlbh/ambomjR7E1jWnCqpVcLiiXDUgTFdWe7LWNd
         bYuBQ2cBnkcW1L03rIPdJtRI4wUGRpx6TaQ+IORdujII7vouTtoNjQK+cyTg+jcxKcVg
         31qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390123; x=1789994923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=RPl4rufzKBcKdQLxEsb9UfL2FU7FNL4Sf4mipswj3PVQ4Yv2nK4fB98ue4ZJl+uzHx
         4+FFayV8D2tIXW6jzGTs5K9A7QSW2S8IOZk9N98lUltBI37jTx7ltjDKCdTa8LWEZMOc
         wrJfux6RGCMo6Bvgt28SzZmdIzLsgHebRyVa0tzbTnQOhojcpbfDV0Xu6PP+3GjBn9qK
         2YByYSoKPunpMnbbDifhO+CJ2F34Iwlbitry2uhKPtNvxGWOWxLQCmuI2bXCiTfOcJpA
         a7lM0lvC/8ZeIQMgd26ftU1NXYWJIJePKTdTe0+cOfKdpqGCMesicAsgaT8vcjTqdgh/
         QVwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAJ2e8YyBoj89MVTd9rrDRunOhoghIvyG7QwmchoRHzMGUVOJx/5yk0WEO+5ZwCrNEJfqcDLh6uVMzQKo=@vger.kernel.org
X-Gm-Message-State: AFuF++laxRhq4W0ntG8phxgsUwyjOqIrHFFxkrvqGcidESabC7aDlOgm
	ngKU0AIdaPfGTJ22m2/fnIycW2qOFia1UX66Tn4cHDJHHLGnXn7ViGkc8DA4XEY+ZokLhEsz9xC
	QbAz30D15ikm4EN1zfbrd3VaDCwIFi2ihsiCr4X4L7eeILW3h2f51lSy1uhUSMCM6J0Q=
X-Gm-Gg: AYBFou3QN2R3bW4EUml7TjjHVQ4I6hvAqKVf5aqm2HeWxak0MDTBMNstvIGHpD4xHpG
	abBEHet3SArBfLqzUmMyTyyHa0IU3Xt8tgWpRV1z5kFh/AmcGvHxLRaoRRRuZmUXET5KX0iusi4
	DPMqHkftLBU2TqMDPnXQYvsQKoPspa5ezjnO0XtAtws3O+g96jv64VdDVAoOTe3aRjLFzJtDP8m
	Jd5OeVfN9JEdjdIKXhVza8layBgDroztIP8Q/ZCR+GYp7Mky9MEkRYgs/d026yefp3dP9FgHLan
	KD4Y00QtPeOijSVh8t/jLYosc5cjmYQnLrs8Z0tyP9YHSh8oPjk1nup5Ciclp0PUWG7qHOI8IeF
	ZlqwkuLHe
X-Received: by 2002:a05:620a:8805:b0:93a:ea:b00e with SMTP id af79cd13be357-93a1873ea7bmr625602185a.30.1789390122661;
        Mon, 14 Sep 2026 05:48:42 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:93a:ea:b00e with SMTP id af79cd13be357-93a1873ea7bmr625596185a.30.1789390122112;
        Mon, 14 Sep 2026 05:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:14 +0300
Subject: [PATCH v4 15/52] clk: qcom: gcc-eliza: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-15-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zaufGkBkQRsJxo2/bQoif3cxlSWIc+XhYlI
 ZVdzUW/8diJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2gAKCRAbX0TJAJUV
 Vi5GEADFusoKNY4do5pOeuZqkyIlpRTEg9uZhnVCC4QjqPFA7RA3lSWiV5WVeix6rXLpmFvdvBS
 ggyDagIvL9W5u2EqZqqouZ7Udn5iXDhe+DHItJpB86z/eLc5+zF0eqmbB6vEimTZLq0YT47JEDT
 tbA9e1v9MYJRnmA7ZAZ+LHFPguxONS4qRocQ2KUGMIAgUHY7sz6KASUuV/SZraXGHhY6dl31kef
 IMBbZVo8Gp7fyBtal5afxSWiIHRunb5V2CpVUkek7QPVz9M3jpk1j5IcpwMyAGV/jwZ+H0Nkumb
 w30FqlyMlcxfpJpNTaf0mjWHfg0LM+ALK643l3iHRh405LMKnbveHMlg9GnWquGhqjI6f0QiddD
 FYTGpz4E2JkOYTw4PkYmgp656wfAVoeMCCYU71TVEarGeUiNEZn4qI1epCzY/9rdxkf9iAKRjK6
 wyHgCLrZO6E2odtiK0mXxkaTAiStjXRzua2jM2QZfO0d6aeMfFNAgMr5MOa2O6t7wBgrQbC7EaC
 uQNKr4U8jFjXSOlHNwX5UPhSdhyPjaedhiKN0oIyI6tOrqZeF6qm+S2sJ1zO8VXJBZdq8NcbRiE
 XDpWseUFovx+q7L8/Usn43Y+5f1XlMRs8zj3/w/S8sjVSG7bZKxyxHJWv+Nc3bWt7sYUgBfu5CF
 wqAQaO412DD6NRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lgFvq8bPxKKT3kYZ0-wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX2vyOgrygHx0o
 zntr82LmDaiNwSEshxOi6Ihs7RkodhmTZ7Gl/o+j1AyBsLe4ytEdEZzUj8bMf1dj3JNiX0uNv4j
 WGdmA3wm1wEKHGaj1gqKMUZq9ojAQjyz52DMiD99+7QG6vW+OVLMgvhcet448xpHvthZdiFBi4G
 mZSe+VrlUX2M2wXU9/q/+4f5GuvFuS9un34ZTLPK7Y/C7O5K4GikIiSji57WAaTt+psAIEvvwql
 maB/WqBfyEwEaQUrX+vX0VndBKRSmeEv548V+o2dpSj/J0J+ulkF0EwDjDV9YWGdGksbHF/o/vn
 hvvys0AdTzYNM55aJm619CdmBTf3PUBWBP8pjtOidVlzDWsvl+6XLGLRNIXcfZytnsC/heBVzlv
 96EJ4/v9445OxAuHE5KxNPisrhKzEHqL7RfEiUASM2zQxmzkp4NAmAUp4FF/1MmNicMoEd2xrv3
 qSxgj8Is5e7iJKm1Aiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX47aJekacoFYW
 bm8FMpKy30MrlGv//TrQKHbKO1zh2AqBCjRbBp1no9XO9LkFqLmQq5yq8odjMkhgi3Bunx94Jm0
 XTwlufXRNC7J3nQpJLA4esq9ogBsMj4=
X-Proofpoint-ORIG-GUID: BIL-aTtjCUbKAGfUmvBEFMzO-S0goOIE
X-Proofpoint-GUID: BIL-aTtjCUbKAGfUmvBEFMzO-S0goOIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: 6393a36fe184 ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index fe18942a59ac..e26e6e6e52f1 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
 	.gdscs = gcc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_eliza_driver_data,
 };
 

-- 
2.54.0

