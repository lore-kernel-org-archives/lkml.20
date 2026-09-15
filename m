Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD53ACA43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459875; cv=none; b=g+UCyNM3y1atFJd+w53u61sVi/58cWqpBoTy75KCWraCQ2eFmBJi769LmII3bmJT1YzsljRgKubeypT3976hGPU1psEU68nJcGBL1Rdt4Jr8/MSxHZ419ICTYzMO9LOsUYfsbpRrTbf6lKa57WWnjwuxx2LeABb4JF+Zx3HEk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459875; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDPAHOOkyTOKeCdrJXJ+F/b40ToNUc0+jqUwxMVl369pLiaTmUSgr2M70SUrR5ld788EjPt1i54hhkxWX+GTAqi20qvTQj47S/JKIsXDaWHraecwcxNV5rRT01LmDo/j7/s5q/28b0H1ZwA7NgoeW/0JKGpZ2lYUZMek/fK+VpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbLXFfn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM8PlGiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbLXFfn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM8PlGiy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z74l2249667
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=KbLXFfn9q7GCpyhp
	jOQ551fi83GZMF6dhGiRqj5X46Ep5WUQVO+ax+EQpo23DM1wjhbKRw7qcpxaNmje
	nsq5YGSd0CzTr3I5QiCFHzOmHaLQ99cwX3bqW3+OSRjAVP1E9tahWVDD6t0D9jGH
	0TNLPX7hJYHErggZ8XlMppXUp6TmmLGczEXsYfLnD7HW2n+j6YFCegNqwwKiOLOW
	+g2Alqs2/BTZ/fpmkuV7VDAlkKbfrU5gQjSr3M1MTl20O/CBW+Z1PLStdaYQtOe9
	D6htfSGX761UVIHKRnQeiYA1BZaumfSRtMEMaagu9Ojx8heuQAhW2mMZDCqgekFD
	/LO03Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70quy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104ba8bf51so121014376d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459871; x=1790064671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=OM8PlGiy1AVGX8O0RMevY+knPujl+BMtfyGJXzHY23riqne0WWikact90YmT8T9/pg
         zwyT9ac5NQ1YctqBFOGDmce7hF2h7TDWtaE0vDOUAizJB93a/j+yH+cSJv6eeiat2jor
         djYpouShSebbsz4QmVJScuzEUiXVxq9MXdN/UcrH5veezd8AjzeGc/3v+gIfscjKWXZS
         9gZ4xPBxUv85CBEYCNox6Se7tB3A0IN9QQidG/zG7IX9de/FdeJHv6hlogmLWOD1JICl
         RtCa+6izw/12LrQx6Uh6TrK4zc5HEx9eJFJrZ7mznJOK6xhp8u/xqKgrKHzIFPL20wMX
         EFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459871; x=1790064671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=hZdq5UCdBbjNpLeFJrf4IZhLYzMpOxst17XOHP2bAOhHrj4A+3tDb81eu1Y78GI9wJ
         LDg+vL271u31hiOjzLEHHzAHBinZy6Y42EcbJGX+1p+l30t4rszLTygCC2GNH6rv/7cM
         UXGJoZe81tH1JCy+JszB4BMTdeLskUXUiPhWz4mky9iPmtwyHWNteslP23UHDRRwZdUO
         7Ac5rL9vd/17SMQvxDn0swDaCWMoedSJcw0Uk6PhmQAUf4CaovKB+p9e9ixs+tz8qjr3
         ePhO3nR2rZ7y+2lFiWGEsbBqaQl3xvIRKw6+2112sau42z6kMHEIUYNEsmydKyaGtNH9
         RAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6wOdqY+njHgbZGfk0dAtxI22j9L2iyMBUGMGDqTUicLdJe2TaE9nXTE1kabp7YPoilDJGWGjIqOu7q14=@vger.kernel.org
X-Gm-Message-State: AFuF++lgn4eHFSPBs8xeSxIdR152TMrKHeojF8/5WhNZk38f8ZXzqzO6
	052FethlAxIxTXsr8Nx1Z7fcWewdG9fBuY0SG+Piw/IaYR3mUAvk989GbNP8ATF4HRd8IKWSFk9
	Ox7XwazW7RgqmEkDJN0nCvlFzmeuNni6rWKQc8eRbSTA9nWv63Pa3dawz9waF0V5Hi1ePhwXiCa
	rmIA==
X-Gm-Gg: AYBFou3Ntc/EHZU/DkDqdEXUwqLF8+erfmHnowGVbpcKVKhO9fbSaeU/ChS61f+0U7C
	HSPRn5b2AMH2Z1Ay0EZ7Bz9YS22jjHp1Jl1Y2Ta3DA5pQ3eqeOicudB048BJSq2eAx7BYdi0Frt
	uFMhvU42RvC9pxJLMQ+P/MeGQWQyrYhrJVmOR06j2ORjFFpiKNEpwJC+0PE+toCvZarMcNBj5VP
	GguliL0TxLsfu7OIXCcV7lcUvwPSEuBQbsW7pYWzpTbhAC1BqtRt4K28BVV7ojRLB79n/j4Gm11
	xXw88QsWxHsPvblf4H5nDbEhEilHetMDB8DpjD8IbT9eLRpPie3Gw/BTOgA6Z7p7fozf72SKlqS
	dU6xMCT2LEQT3YBcaQp2RZtygQ2Npj+JAzZ9ANTU5RGiGGW/H4lapPodAEGB9WHVzN7wV6XAiEp
	qxvBhCi7CkcrjQgvcCIFCPRitUE6GWoeXr72OapfYYBXiH7y8Aqj0=
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089408085a.40.1789459871375;
        Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089403385a.40.1789459870932;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:06 +0200
Subject: [PATCH v7 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-3-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzOcuNBNawFn5
 ++Fp4ImXDrk2GZxuMtDgGlSxDgXD+Cdx6CJ0EV7dyYtz4q7JSP1g/MGWGvZsynzPe9kAVfgzok3
 KUPe2Sl3A6cAolmta9ob3KmOC63pWemp9hy5iJFka3zZrV0wGr9gJFG0qzARU3rYBmZK7XRiiWV
 /lxYYKBRUrgoaKPhdNcV5kwhvtfJ9qHsFF45auc8prxxiUe2OqJf5ol1ce3l3b6B8EgpncMV1ZU
 3BmBdboLNShmmCj1W41wmMxBqUbhvFxnBXZtHTvbZaDOQ9wp6jV/ynuacuyWF7qbMwZljDyE33/
 faluQmSK4vNNRja7BZ3b96phpOfc4Yvvks6ebeyJ7x1Wuk5wX+tlsQ9eiiLAgueNlgE1310pA/+
 zb9QaHiTvrV9hLnwvr7WxqH5qfwGqzsSc9UtROcaeEbewzVzQzx5g/bvPW/gucCanYaH74blGnH
 W8VFNf94iDCGUzx1vxQ==
X-Proofpoint-GUID: VinoJ8C-KDwWNBHf502yp_tKItR26au6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX9X4e4Ypt8pag
 5ZZeUGafKBTyR09n2YK38iUBfr66pvavAtv7c6ANXAzlP9C++/dtVi/TDZgwmiWhHJnsY6YVCyp
 dUw8hv7Bxqamx91vwXXTdLEha+jK3aE=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8fd9f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: VinoJ8C-KDwWNBHf502yp_tKItR26au6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

