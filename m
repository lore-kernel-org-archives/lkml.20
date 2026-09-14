Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD548F034
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390205; cv=none; b=OfIXEYLzbokIjgbYmwjWnm/pQRF2We6OD9tMYx7+LiqTQGn1fkFeBR2DDkRGzA6H6LPYTngAQV7BUQvvWPD/tVPhX4pMmPzorBiOWc8oDnbn6Kk1V94ny6isjU8vx+Ra97L34xk+xej2uuMneFJfypihQoeeorHWR/kqlP61VjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390205; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAgh7EaEKW7X8wXJVrnR01SDhcymoHPhYIOa/5bY6FD5N/DKnGtlJWQo+51InNZ60cHBuz+AZLAU29Gy6NGdlqlFpdeKFgFFvFap/zbtd5tSCpUyUNCofXigZQyX5rdvwDUK5Oev6uOgI61nYM+CD4v6Dz+1Ud7AdoOZFAd+EXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0Ocopqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+qBJnq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Ocopqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+qBJnq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7k43793328
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=o0OcopqinWuPjMCu
	PSIDgVyD2b7/zp7XO3eRDHHtmAqGk7yZlJP+YgLwPBUVGCFXKk+aVYobqdYcOrHx
	Tqkq8mq9lDS/3JpUowWpxkBd9X5uWnKuLUuH7triqusXwd6q1J8saecHeoFT+c3r
	rGZk1l1vXp430mA5uoSUkt1oEEiIiwrICz3aWA+v8N1fcI3qogooz1cG6hCq7JHB
	nq8M25BG3ZoiLG4VRJuU0ZbTSHCwVwqUFRboFZVfx5Of+5Tpsvd9v7G45ch1wv+R
	DeSCugRq4Yee/2YD14ADXeELQ9E65iF0LISlDkoiKkKtrA2/vKaNkF0Wdc3lD/xe
	hdfFfw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg161d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso338093241.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390202; x=1789995002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=I1+qBJnqWDyROPv19OfVzunUjW8XCBLKPhzOcOFKNJTbUABf6pynIEf8OgiUNlKODD
         CtSobUXgNiTUC714fJPIyui0iKX1TZj9Ws5FpLi+r+CUNOKw9yzUUIW+gzmogcAg8LP7
         gUGvxYBOsnfgEpeIsCzJN618+A01hKy2BOSjJcoetlhjcBcdxoKdMcXbk3MLY6/6Paol
         B/voeSAyiInZBpHS2HrA14FuWgS4Z2w6ITU4fhz/k5q0ZD/79CDttWsDjM0GZ6blOpg4
         xghjoM+AAiCFHODbq/OGEIgfAemL6lOBKYr401I4JruUf1w6ktOtVZxtTRXgm3S+QWtY
         RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390202; x=1789995002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=DoY3Qp2+w/RCobhC4FU84VoSFFVtjHokPhZQbm7U+/Kqw4bwtcUjFoIBIvPqfJhSsj
         0bvpoh/Lzni+G+Jur2vIW7vlNT2CkEMUYH1eXrWm6IOyE/b+vq2DCC34krt5l1O6WZh9
         VAnl11exjVTicRi9PFoOgpxAR+aVK6MNXsiu/onX+BiCBGkd3Yt9fD3pjWELjFBx0azN
         2Ecdwg67Ee1BDxXYR/hKc+EySDRO/iMnBEoV63cD90aqzvZDzmPGaAUvsg8q3O4gz7We
         Geuw3pkgiwj/LnTGkFnd9zqknp6d9v5RIvc3UaKlOlalmI9pI75yz0OyuK/qde3Lwuwy
         EDvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu7/lWI4r23vgEtpQOiFp/OKBjvAmqtNgju0PN6whkwwTc77zCRhYFGfjxtU5cGnlOCGUYPR5q3+r8PYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nUxD0Is5G5UjdJdmE44JHBAYa0f34NC9LO+EbmOeGRthEOq6vl
	vhNl6AOlsEDMN0ca1x67fE5LfJyiD5cskCFZyM1bnNPVsUXwpryeK2ua3Un3uwzLTmbTuVl7SzP
	an+t4WOiF1uJ8dMKA49JejTGTrf9pee8M5o0ZfeiSstkHAwWXplB2cxsYv0oCPoEc0ss=
X-Gm-Gg: AYBFou2T7khKgfJgb/XdTKlVngwy4DJEIcZcqG8ZCFe8Q9LhX1c1GUsglKdCOmGyo4W
	2a6s1dZIVF5qVGd+LJZkKs+zeBNgthf5YHolbje1wmFr1SymKIe634L6LUeuwQE3p8A99AudR1Y
	pyYrxPOf8I4rjppMc9keGAJX1EsTsFKiq+3imIrX03cD8K4pXwcWdRuIqZuTR4ED+KlrEGNI013
	troXHhT0psqJYJWx1NtUnYZq9ZCGheRzg9p6iaakNPq4phBmN4qK29Of6PRE4Qlj+6NtiWaBVcG
	hTgoQhyP5rnX/u++0H62FQ/mmNtWVPdlyRxFEr+l68sCfTZRCUQxXizmrmwohqxwykPEKznUKOv
	J0gFYA8mN
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191189137.9.1789390202066;
        Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191142137.9.1789390201576;
        Mon, 14 Sep 2026 05:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:44 +0300
Subject: [PATCH v4 45/52] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z3elpHIph3aGwtkFU2GPTI5uNMv30x5e8kO
 tcNu6SoVHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9wAKCRAbX0TJAJUV
 VsekD/0RYUseKEoxSiROvcS17R6+RML8qwyeFu/EBlf+XFSbnb5a2MBYUoM0jcufqy8ISBnSZjf
 ObcwCz7F2BGq7NzmbJicvfNMI6dC0dCgncYoXuSe75ZOqxGv1H5hhKVNrveHet1IryTD3PsxuNa
 eBsGIX8WmZmxoXKIgvtzDAmUHPazCGN5j1qMyXINXzLH0/6SOAYp4DNQyM56Y+bKmBzLoFd8WC7
 26h6ilRJ994+GZ3Iw1q0HT2DHLZGp3c//9Mwwvc5OK5akMgIx0S+bTySTK7Hj9Fxkkit6/UXS5/
 IC4gY1LDqrGMhJ3i1jAue4TQjk2k0eByXsKo7Qk9X8oX5/AQyeq9Wv+bTPR/vdowrbkR8E0gH09
 M9V44gq1r8UwhiHNmvqzxjF7LfCeCJCcM9Uj3wtdwEze3VVr64ATmJO0fRzk3vs86gGsK6vAN93
 XmIJBPc2p+NFbJSDr9UxlJ1OfOfaPKWOXaYQ8LghyKbWCCLBQJ0DNv+D/PZfT2tDsla7wHFaJIu
 9REmeHQhHsFBROV1vNsqeQj475p0H4iY5lZkIlYLp4y032fIR8KNukhTdxe9dJ+p/2GaZJCtcOT
 f0vzXv3Z9v8qwyrbv1w7Ei/OdoABWY6sWQAfErNNDDgP2gw9AFq8ojV5+B7vSJllQMKg+8ALS9S
 CCz0BRW4imGoi5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed7b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: pyennX9vzm5XVqFCDC9xZM4FcxeMuk9f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX15J3qHF5NtE2
 w9RDJz1K0nfgARJocMUEUyLIkLaX+7XcAgHjacBhKr66x2lusY15D8Ovu/BDFHAALz5l3b9t/pD
 PdAyk6mrbQAJwOYIgektU+TrUWUPdCk=
X-Proofpoint-GUID: pyennX9vzm5XVqFCDC9xZM4FcxeMuk9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXysNDN5Ff2FzK
 EXIgSgIIThYOnEdjjsArv33xizs0y8UrdNOdWNvzzGNSufj+2qpuTH14YBKKVIWlD0U0bp2oyn+
 3M4UEbRdfU41N+naoYOykqXLtABvX9lGklBQOJ2Hbj3cLwEknAZO3SPOACSm5DzdYvUfPOwMdyO
 BjdK8Iti/qZ99nCz+iZeGMyiJRkDkNa4Yi3vZTw1rfPTWlHZ2Wj2QcX4fZYRpJcxEJ6X4QIRG8y
 db0eKEF6EUlcM7R+qAlCG8XdE6SChG5EJC/oBUI18oHQlG9nKFqoDB359soJiZL08/CYvy942Dc
 AwbCnQp8KM7VC1dydnD2bBsVldKuzoFM8JL0rd7fle0EcZKkVYNFQt8c+oXKv8vEerI4qjs/7dU
 wHPg6unre5l0ztQWgh8w1r5aWw4TZW5W+bPVT+lTNu89Y1TaOw6AJXze97DeWEvZwEgTmrdLseX
 hwI5L0ybqVvtuU+X4eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

