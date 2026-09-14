Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D7470135
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390096; cv=none; b=EYcCHNgyqurAesoQb4LrpW5ToWpZXjYxH/RlqZpl1ZMmguQB3++yLYvESq4aEV/CmUr0Lp08fJ32hxwDTgPWfC9caZ49OpZDVI78VM84xj0DA3/eMPyQ0QeU/6uuY+g/G85h+osg2yn3QaG4gWRuZX4MIGX3EoKn347fMWb38SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390096; c=relaxed/simple;
	bh=MSZEvhs2+7JEEL8lXzpVxsnFb2F+ZIoXpJbVLKN4TYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utCx0by45vSKsgAUrzBJ/vkPUO1KI4/fYHyyIdk0rEiwd662i+PXSa7CbC5NhAMdh40WlOD/rSTj2v5GB7G3b2GRR8aRwpnzc9w84tU0nbPqK+oBJA6hca7eHZzDQRV8Oquj6xfVcS2gNxKKEJN5JmdhoLVhJlUTezS5w2xFpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cthjKFbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6L6BfUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cthjKFbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6L6BfUC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRLjI407200
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww4BHx6wbVu26pENqzjbqg11ZT9bIfP93jH7QOud3pE=; b=cthjKFbbdJwxuSAX
	VOfTS3C2d0LUSNWlXfK6alMUJxb4IqZGrUNMGJ4CWFG9DDSc9nc+p/XXKM+57ssz
	vl2orPfqX2PTc1Wm5I8CiTKN7qWvKH9LxV3yb10+UYT5mvJXDjyDpvK9E8o8CVIl
	7VpW7kfYOL0tCVJejsC7Lkk/dboWI+RdMVhtWnB/dol4VOiNJBe3VyttcNk19xls
	HApIO5iGlbjdPO86WphuCW/QMRUkSo8L+Ii2DF01RTkyYtT4aPyP47OwKNEWxYZT
	GFQW7FkLq3wtr53enWG/euFKHygwd72LcPJcSL6LSGu/+HR6Z2ow5qMKy1wZ1JEz
	WSaPvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr86g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so160677285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390093; x=1789994893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww4BHx6wbVu26pENqzjbqg11ZT9bIfP93jH7QOud3pE=;
        b=h6L6BfUCU6oDh7S0sTqGUPhyxacIqlkTD3+K+qFSr0AWJO+hFyyfq+UTgpnYGiP1S2
         4uyR2ulTTaMU81QuZh/0dZuDy96p6EDC32+S/miCAD+USVv5bvcXX6hVK8UfbsRwazJu
         JZgt4f9caOTEU+qob3OVNmDHAO/lcI8bOZ3K5fAKgbfjSNiJZdSdo6JJ4J4QJhbvl5fV
         kXrk+sPe+eu5Xy9c2f8prJi2Z/qkK0kvwa9FVcU704LFia8x2TtESNmbtuJ0RaW2OIX0
         u0PlgfbF+nhLBn5dvIqTUCC++3AdHNQK+meXWuOgJcaa1/oN400IwpVew7OyQ9N+DhLU
         znQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390093; x=1789994893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww4BHx6wbVu26pENqzjbqg11ZT9bIfP93jH7QOud3pE=;
        b=Axan4puL7Up3e5ac5Vx32O5FYlBZ6DufK5v3fvSWLL3aLLAot5Jp90s4/O1Aj9JNmt
         dw/lLmxEYgH2DJNwuymoOw88YhmUgPL/C/jpeF34kEO6//vY4R/nybRS9PBpx3djhA5W
         gVzwxMIdcr5VpOivDwn/Xc2Ul+/pf6p9oP7UaOmdpqGLNYOUdwmgPd4QATMrknhDgxUJ
         lGQehifdvf3b7NEWdFzkyxh8OmMdJJ7ieBnk7WKWf7ZC8uVQ1F9Cj/H2cVOedoFkq+7U
         92ewHLkASEYlgami3pBZUz6BYEPxyQPMf/NMh84m44v2mRgL8E+KGtcEhCotQxVMVlhp
         4JcA==
X-Forwarded-Encrypted: i=1; AKwUvBzHcvMpQ7a96k5pR5rWzWLQRH4TwnnpfEWSRiL3UgxPEBfgFq21YPvfViJGxZ8K6SuciGslf+xi81BZ6Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgBPczhhwuTgu+HPdAnKGuL+DsLJQrEQLL+zhdUqFiNVNKt6W
	84X+1j9ZqrhA6NsEb38vAEYfYC/qpvTw1/oHJs14P/6R+/iFpE8WLUtPhWsGzSpd9nyIwnw0Kxp
	R3dg+rC4mab59hyOJsKz7BobgWHpCimw4c9y24LJaM0jZAQnQc3yYi7s015CYfL4qdIo=
X-Gm-Gg: AYBFou19XtxqEAx5QlJgUZn2r2Kp5kRbarNzF6QKeqm2HltxSvkkNGZVXzvWTSlx1Zn
	7IQB+HU4HJqx+x8ajakdQ8f68k5OwP8rPaXec6WbI1uV2g4Kw1LY8TRswdEmEDnjixd0Ia3lf4D
	Ik6kbeyuu2CYw1U3jEmFx7SGnHrFjv0wP+0lPHBt1M5TF1LmqeagRLRCyorHpfuyhkmVEBGxGdm
	84y8PZQQMO3cVDZaMy4H9movSC39ETnVCkXOP4brZIFtTnOL2O2m0oloTQq8Rcnd1nex4/Z/q1h
	4KABzarp31Q18Hwj/CZnhCdUpMX1Iv3oVdzWqOCx9gZAv6CWJf9o3Y1GLc3GaUT2Xeu1J5oAHHY
	qSSbKTurQ
X-Received: by 2002:a05:620a:4555:b0:93a:2e8:5afa with SMTP id af79cd13be357-93a29939a68mr325376385a.30.1789390093095;
        Mon, 14 Sep 2026 05:48:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:93a:2e8:5afa with SMTP id af79cd13be357-93a29939a68mr325371485a.30.1789390092563;
        Mon, 14 Sep 2026 05:48:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:03 +0300
Subject: [PATCH v4 04/52] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-4-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MSZEvhs2+7JEEL8lXzpVxsnFb2F+ZIoXpJbVLKN4TYs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zP7Uqkl57N/w9gB15YhmsoWjiHt5Fg6HgLZ
 zQ4h9gW1PyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszwAKCRAbX0TJAJUV
 VmQVD/9bjhUsNuEOlTQJVlvV2BLds9P3EcykkQSxOF6Y0HVpVY5Y1eRvTS07zNPKj0pV/E4zwzW
 B4yQgHHVUlluTEHxeu93pZCrPNlPQd+vvEWter8AkL07MWeQyIe+bvnsXeZ2zcrAhSHfDeHAtAV
 xl+O6CY72wqReTHrh0W2QEqhtxr3W6se9g897q9HjghXke86e5K71a9MvuBDnX5D3yo9OExTxKf
 zKwGgGa3t+Wwk9cjSRU22kXIbAaT8ZwIgAHFLB3hVbHftXQq9tTDYb68DwJ+oyjlh2G7f5TfDZY
 MxyqrNKeeJNHC3XZ3YVgG6pUE3N10D4ejqyZAXMA6UO4SxE9sKAKKmZwE9ZB7+xB+EDcsQvkTef
 h8AjQcvKN+bt8JxmP1nFr9hf06eb3Cd9alunhmlyByCOqJbQiSFE0m9+/BAU2aGKhPZrcYRAsHy
 hSqJ/XcotWEMFZwDuHtBH62JCB5tAyv/hBiiApjbYSQbADOdNO8MnSw1ykZnk3i6F/5FkA7Jblr
 yCiPg9c4rqbhPLGKCqZ6BfvSMXE/8tgfWsRAHfM2GXK9NQ11bzboMKQ1AN/uMYp1PAFO+rljI2i
 ABWUeoP0JHsWJsWGMEV0D0Sb975LCwz3Lifzu1TBxuVJZsF5yoSVPaH3h9KlT4PW/GISv0NeY1D
 UtIJ/xMRrC+eknQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: QFCK4_dxlh6vc0ohUglHB0tm2cV-kDEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX0oB+EdAnkb8L
 qUcuoYnGhhxkRkBQVyJj1v5h45UYYUkjVvcuXVUyptiWWndeS1Cy7NQVisV6bsDrofQY4HyPMxC
 BX/s94x4fDw2owA2+nuHi5Y3jcElrKt/0lj5ZjubY5rSOF8+4UNF+g3/DUvb6aAl/iqLmokZQeM
 oo+3d7TW3jLfhiXI053xC8dwfZlNCvtjtaJbZXND2T/beTZUWqxKgkHXcWNJR+PdadSveDt9+Jg
 NzSVtYSrOE08msSMw0w0xPOiD9w6jg52cyDep0WymH3/eCqt7al+aTOxAVk4D/YY4a7jGHk4K4I
 WUeWXP5OcGr3Hv8DaIyi2/dhkXNOys1VlgImiCdYt3/cFQg9aafZSoK2wSgDIfIvO8uuQXFuW3c
 0Xq/S0Rt08PJo4BorzP0h1DhfDry7WdToGviudGTVu9iMm4bQMVfMpzSMdougYheV4AL6hhRLU4
 PofpnSD61PsxYco+4QA==
X-Proofpoint-GUID: QFCK4_dxlh6vc0ohUglHB0tm2cV-kDEu
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX+ZrTDOCh2LfC
 NMnHHcyxvGp+UTy0NhYalUyIWERhuCbjJHwP3NHYPjLQ+HRQo9DnAX/guc/g/99i8sRDQ2ojuOi
 HGmcfK52f/lckq90uGw+HZ1PKcxD330=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 97ffae3b5522..7f3947db5807 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -51,10 +51,15 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -65,12 +70,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

