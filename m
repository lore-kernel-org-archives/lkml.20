Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CF48875D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390187; cv=none; b=H+iES93HFgieJ/PDFi+JbG9IvbTIvIM7PKXrvexIxWyJszcIUO++Xn7Ug9Juhq+nst2GTlcb1YTx22sb8V06c/C4OPcxU8RBhkLfAKWo6NUGn2rt47b+oMcjOuCohwED67niI2tSLeC21wy/aqPcL6gx0MIvi3ro1dkv1lLsmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390187; c=relaxed/simple;
	bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvSfQLPqQ1w6SKDTNgRV60HJwWvBJDiqub8A0M+s1twhszyXCPu1VSzhapOcq/92UizxyDjHbAxepTe4f87vt0ovBP+q86Lnd2R0hRoSflUvhKzWCSnbsmMg3Jn7KoWzL1MiHVDAeg36MK5u3n9uceuAdbTpFMqpdVvGpTQT6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti0BKlv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgsR5DRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti0BKlv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgsR5DRK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwUM1460587
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=; b=Ti0BKlv9NCVYVQK6
	hxwbl32ktF55RDeR/ph2JhZGh2USjCyvAVFPiMJ+qVDy1PdTaNNh6GwhYL1x/47n
	HeM8yT+N4vdTl7KCkfK3Njal8OXw2w+ua+zd5DFSDVryGKVWjWvLl8iM5AoHwdDr
	8+DHPst2+T7veRn3r4Vdfe8nmca4CybnUxpDMZB+6AqFz15jCv+H2lyJGuUkMMUF
	9CdwVSY57LxFQUF6G4fHSuHKkk5xTpa+2sHrcHT0hu76LO0C9nJLyEmhsntT95De
	fB4awCSY8h/bVpkAkX1f43n5yoAnHZ13Cq5d7jzV1+O9beOZBXot2OAoLeBd82xF
	qSBrNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso770964285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390184; x=1789994984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=RgsR5DRKiS9lTsammeuTkhpN0Bbw8GYbpA2btZcePM9D13t3RsRwCa/7N2GhVEUy7l
         D70H8jh70OchNoSJ37GEdVBj8lZwZcn08hj3EO0DuUdrZcGaXux88oXt3dM92CObHzR/
         ULgLoJUsOK8t0bSgnd4OxqmQ0Khtw7t7329HxOx4khDtMsUQ3aEIVf8Ei5rKaMuLtD5k
         JwNAVq/EvvbtdBb6stT+kJ2hq8oBVb1yMzOaakh+Y3eXbux5UE/okaKs1GrcPMk3eMst
         qnwI8+HkqIWS4hv57pk71PbHY7SGkO15KBigiWHzl7EqIaXScBazLnheUylHsJAC1xrp
         Xrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390184; x=1789994984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=tL1JpRwllke980tlDhXB3Lr7JIHjTXnf6moJ1a+tuIz1KvniQ/iev3/k4kDSY4ogfZ
         faU1Qp9TFe+449QoR5emaYrPQ47xGFOWokhNGTTPzInuZFAeeFZ8WFifCGaXwTFHsBCR
         Annpmiiog0iIP+bWAo7v/b+pCU7ooUz+hsfVutA51lXAZVIVMlck9xWWQh18/nCXVIwJ
         OoTifJZ8gkdpHbRgH1iL5e9E750cZUo2U15iH6tUczQDNa62BL5TYIFCccSy4iBl6DFq
         lj+t44jUfqYshNE3hHatyEYGulKLfp30dO8xg3P2hT4fTA/CiS7Z1LlvuEcFxg624pAH
         gB6A==
X-Forwarded-Encrypted: i=1; AKwUvByU5m2R6e6LoXTmu67AlaZH2G51l5QJSq+L4X4fxq2ds6NIzEItBqW7g3HTY+xBfqPxp9128goRSMZpznY=@vger.kernel.org
X-Gm-Message-State: AFuF++muu1JExDzsn/u9+IVnwrCb0hMbQ59PLvPhgdq1D6ZlQ8LeXQ+U
	frM1i2qhOQEiCRZ6IPgwIlNtL+rpuk0J1eyQYCg3EasyhfQ1aRr9BQS0FvNACTBwQ60xsCLrSot
	jtp8aAWGX9KajQ6TucE4a47zBO3uPPjBR1xf/pnSdWPzIW07HEsf9PRVvEmh78GnfHno=
X-Gm-Gg: AYBFou2xqk/ZGSaMekoI3EbGS/HQ98MHVKmzjuNqGOb2Zth3rt8f4000bTcpjMwYBF7
	ewrq575tllL/w4YIzLUGeEddddaPHcdl3oqhjS4fRg+239cNmPaSHjr4LHn1gAGeejten2j853Y
	58MCCebGwRndhNOAOeISDQA4FlOVfJSJyB7PZDUQbAv9yp6d+pNAswP55v8wWDv41aMl9Waf7Gz
	F1/AULPsSw5t2X+UHcTh3UJ4nnkXrhRJCJtiZ/m5oNZd8Z1BYHex+26hcIk0Oh9jyyzWLA/AbqB
	oGq5XkfZk8PQLYkgLjA/FAY7cAfzGS3ky7/bInAOpk4H6/KI7hKKQUT9VSZzPu9NOQsF/xDGjI+
	FUGCtQoPp
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id af79cd13be357-93a299491dbmr310392185a.30.1789390183670;
        Mon, 14 Sep 2026 05:49:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id af79cd13be357-93a299491dbmr310386285a.30.1789390183094;
        Mon, 14 Sep 2026 05:49:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:37 +0300
Subject: [PATCH v4 38/52] arm64: dts: qcom: monaco: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-38-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zwjgZu96fKVplDBLzthSga/G5UmcoMat6rr
 cqEWQdDKOCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8AAKCRAbX0TJAJUV
 VnzhD/4/FAFDt/TkAX/I8GcLnRTlUmKQxe+xICXNqQJ9X2JEVz4wgMSBeksaZ6VDQmRAjvUJ2wz
 +lqMzhBhrwlq/5EdHejlVIi9Kyc3dJ7ZpmJ//KciC/LljxWryWE3nFJP9I+G3a8/bzC187f18NQ
 mAbtdsOEmfjwawBmPgVDTZHhG1cdfe9RwmgFwuVv7/o/qwOYZNBNUn/mkCDl5jNBtD7Xck4XgNG
 8yD2DtoNO+ZbUatdtv8e/8VmoBAzcVTGuTu6voFsemHVuRYz0N4/eW/Mn2nZY0GgwGFXWWCnoV6
 uDG7EfmdzcbEws+WI9wp2+9S5fRs4+hHd4HQLzonR0xpw48wJHUY230zfo8P/dgDS5krbhhTjXz
 hnyQ4PHpNn+XG0kx2WFUaxu5+k60w9a4TujQjCmNh01FZjH7G9h8BSHCcG7LOZX1QsEuDMFEktF
 FPqjE0huJQT2qEg7wbV0OzNSgWh6OnGop9rQs2sPVcWCIeljm5EkRkIyhmAFaQu/OWjnUl5XVAc
 Z97qkoEWG6e3YkKkjHM8wjNJlCS1sWIBR2aj8JDPD8OPAw63AUte2XtqXuIzKe6wE7rr0CO3tfL
 jEVTtetmILz7BAfxlcrYa95AUrViMmRMIe00MtzCQuvWCH/LdpxVW8g6tKJPijCi9qMlm7Wrtfq
 9a+RExpt+hnCIjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX5pEBufEc5I62
 8GsdY+GPKCXOdkspxr+fBHpswyfWCtLbquS60RAx82d2WLGDMfSUGnpNN6FE/rp8wX2VVnIlAPC
 2V45lF5U0wKTFWm0G27ey/DjO5jpgUQWC5hh69uIt+7VkGe8/opU3Ic4pYmLRM2GIq11XaV/i/5
 jxCGYsWOnoj65MI1VACb2RN8O9afhGDafi3pdV+dAgEdpOCO3uLs4Y4P50skn6a5++lWrZRFI36
 GFF4T8CZhWkq1zJeC+hePA3hsEf+CDspgHdNzsaXBEMe1igtu0Zsgzwr4BexJtPNqpnYL+zcw2L
 ZFuZUvFOLUJ2rGhK/KW5ee1PjdGzsphjVbKSotVPf7P7McLfEU+B+I/eBpQKl9eGpQTkjf35SqE
 rYjEwb9yubT3P/p3qvGtGYvkAnpKKFUUTDji+hgQwXaoD1Fju3XyUa/e5b+cO2K4Ux3T/s5c8jf
 +4pHxFwlS2wkdHaqHtw==
X-Proofpoint-GUID: FS126KSML0R1LZcZjwVvGNsCygr0OWn6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2ddKvaf4osda
 7lfHr4QkNQHUtMWyf1V0TMSP15zqfw4rB8l+/8CLxVA4Vr3h9udxlVjayrRGBSi9gu/UK+o0+Vr
 g8nU1DZzgnOPt4G2QE7qXby8aVzsb1Y=
X-Proofpoint-ORIG-GUID: FS126KSML0R1LZcZjwVvGNsCygr0OWn6
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed68 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on QCS8300 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..8478e81c4ada 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -897,6 +897,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

