Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01B471412
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390118; cv=none; b=CR5FUzkN5yJ1FEhyAc1pj0EjZSP4MYMhb1hVEN5JcO0W//IVzJysPdhplIpPqMZwgdFpQWfZeWNCBLZe7P6hStYBRi63ks6xKe4EvCkPweM+p5oIVIir5D2zohdKwxzohbexv3Db5o0ORsQfEx30y637yHlSogKB6H/kzvxRXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390118; c=relaxed/simple;
	bh=oVLkAB3MjbnPReveUACBy+EcuAlMjJ09N1VY1kzqTek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufOHBLJOSC9yXpE1vsu+msPCGl7iC/CZm8Li404c0IE/kar5yFNV7BrYKhH6VCVDQ/HklyLGFHE/rX8+pAjaLMJQMh16aJ5UYXycP7JXmPbeLbn9GDSY6JWLhs390k2ReeIeMgsBDB1T6ldSC7+PmZWt5RBtOvD2bexiXqGjlAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COnDBBCi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kh53dJvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COnDBBCi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kh53dJvv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMih4032519
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olY6/rfrdylae9XkLR8yP3dqoRimXTsbrxbfYYFZ89A=; b=COnDBBCiVrPvOl0u
	HUnV+udl56MbQwmjbvOcES/kF8wa3zKeLrVEDjkQwLbzozYYZ/8Z/sUUcDH5NKpE
	PqJq20Uc/5DkkoV6uKLRq382DFU1P6nSm+9d6xZWndxp71BjkDWMj1QfROR3LvS9
	VHDfMVXY2STarQ9Gv67G8AhHQueNvh6SKn84ZFX5lwC9E7k6leoylGZUSqHMw/bH
	IL7oCDeyLb0TYC7O7LbNWrab06V2S9f75RR5iF+zUUgIU9I8KwLQPu8w9FCEy+BW
	fOReCC67shsBiiGA5pBwSti4GCSovNX4pdnEqwXcCcdk1ePhwnKpAeEz2P4fkJZG
	7SGXwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so282175885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390115; x=1789994915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olY6/rfrdylae9XkLR8yP3dqoRimXTsbrxbfYYFZ89A=;
        b=kh53dJvvzLL/26zAk/cL9xr5nCUZOeHoWKETlFi8YVvZTeQliIIa+U7sf5qHJ0WXf0
         TzZBSMTtNuW1dLMU32nvMCU6bkb+OBfvBPcGi6W6sNt6TJJlsvnFE3ZLyDoH6N/IjArY
         x8ExcL11yxMu4qd7QEm9RK/k4r7dwtjUKrjUqxev1heS2zj0/fI1QlcHheA7LAeFm5yi
         lPTilxQYXi526lSoDwFOlylHpPXEehHEY8/sdX6Hh7w3LMx+IaC3rMncVOz5EUVQqGz8
         Mt3OOhRa1J7Q3s1SiJLGsU8M+8jG5a6dBfR138MDVcaoZLNpt6jsOyKy4JXamq8Ya5Q3
         NgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390115; x=1789994915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olY6/rfrdylae9XkLR8yP3dqoRimXTsbrxbfYYFZ89A=;
        b=MLlJ1T3q5mZo/50La3MrMGXXN73Tu2AjsaVm8ZtmJXNhZQtQkPsZBnIVncSAIk55wS
         WE1FzQ2uvIK1yhvxW2YBchWXnyfpHh3dSnQPsTfUT9Fbg1BjwtBuJPJbpa3ZLT+ek7I0
         W60pNaJfTfQ2MCUmAlh8f36TytrwTru75ZzSFLrkgHTxMkO0fqkZVjuGkhXxHlSFQwPc
         K0XGVJWiK0rcsABU5S+myixcHBOERrkbXy4cqum/EetQNcPfF1ecHHyGNCWemvEFxaiC
         kgf9XCnMr8kUZwPzX8CLS9tQrC4OXSE2gTsw+nmNVRnA/Lu8Z46dR09U3S76rP7kkP6A
         x0cA==
X-Forwarded-Encrypted: i=1; AKwUvBygXimtRe7Gchu109RiWmEkN+ECs8L32JRJvBp8PyCLv6hoq2XVqgEJoMnZY2SZSdPA62lv4+bVPolYpiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l47d5WIvuTuSDZSA61k8EPHsZMXgaDNjjSp7vNXhkZkWqUY8FP
	Pw27KXoesnojffv7x9p3DLwXXR2ildXAvBfZGe07Sab5s+vQw9Xv+7KZblO3iRlR7ghDeteJmdF
	xcVclVdQ5/NaqcoFVJMvUuY7Qru/90vAjO/PxPFbZJRxr/x1au3vnOWL2yGPN/gRI1HI=
X-Gm-Gg: AYBFou1Kk1N/fGEd5V8vY8xOhR1X4pkmaxdITijOIUUiOwUcRq/ClCwSOYD/mSbqScx
	8x3pH0up9vk3+YwJv3xGyE2Ntc7pvCQMTgHl4gI/9dfVxNf4BP5991vBzrNn+pKW9gVV1d8hPbu
	mC+MOH8bwX0eTYJ4Yxk0NeQssm7ZZIE+bGwaMigXeiZoq3SfXEDWg8YokXrH0BjnZvaD9n2dhsZ
	pfSGRmHOSW3ajDT3YdGy2Xt1QLi/q1fR72BiuVnQF2/Qbnp6RnBctGpXmKh6CDpI9C8HmXAOGen
	jZRosP/4Ixmyno4d/prDbg1rF3oMwfdVf29tKyglJia4baNUycS8AGC6QIyEi6/+YepZ5dD6eqV
	9wvXCQrnt
X-Received: by 2002:a05:620a:4492:b0:93a:463:1296 with SMTP id af79cd13be357-93a297cb486mr329607285a.18.1789390114432;
        Mon, 14 Sep 2026 05:48:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:93a:463:1296 with SMTP id af79cd13be357-93a297cb486mr329598985a.18.1789390113840;
        Mon, 14 Sep 2026 05:48:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:11 +0300
Subject: [PATCH v4 12/52] dt-bindings: clock: qcom: qcs8300-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-12-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oVLkAB3MjbnPReveUACBy+EcuAlMjJ09N1VY1kzqTek=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zXu+CJwoAkYeSTYLxrYG2vk+5XuQvHkZreK
 l0aP56XRLiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1wAKCRAbX0TJAJUV
 VhwQEADDyEUMDFt1NmliEuavnSVzP1ErZecN99lc+v8CyVXmMa/46mb8fqWAVVFNFBnYCY9ej5K
 d/gvz5tWmmMSjT5F0Ch00WsbKfCsjPAkog9LzAwRfQpsUoUXTN1alk7a6QEFDgge7fAuwXZtAuU
 uGYAQU49mK7DsE0AElx3OnDBAwaHEOCJN4zODHGfQXHZNK1SeKl+bGVzwmU0tZCfzMJUpZ/SdGz
 xNpvrGd8SdT0NC1hIyuhsRZwFbNp1DMsGEd+r9V2SoCaDuD0wfIb3cNYZpIh+E/bRRqEoKDgb1h
 7XEMcxGa60Z8rHvq9pWIoA9X6KC6APmaHt6Hmk2wt99epUoQIRlwHSo8Z8CxUqb9ycejOJZlMlQ
 i69xMu3YSLBeppYrAX9jt2a8j+En9WhmZ8K1CtiXLhJdySZSTymn6c5j0pbXG+AeFyZPKFi/nrG
 xVv7lLhPy8mZZVhVbuka2qijWngP7YJc+R86qrt/H8VE4L37x5IGxhrZKEtf+RUeQv/Kwf0kEW7
 F+PjJBFRHXi0Nt8W9KZnYZao6bWPtyttQBzxhTrGLfS1KNEhk/LGtiVaCm2CQWQwNF5VnX/Mw+t
 S5cYKvJ6MoPrAoMqiLFkFUUAruAema2g36a+5NeTv3D5ikv6LV8+dZd+1WBd6DJnNiDKZ+82qWz
 kCx/8oUkSWOA47Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/4BjnkNiLIJH
 EyIclBy/sNBOaFh0PLxLiwAvveNT57V8QQ6QcLgQ/2PTDa3KFCVtlT/iS1KGneVH1HXatn9FCPC
 4tep8d5POQZ41FDI+xl9FltI2vH++c60L9p6kZ4B7yjm7uEW3GEXoMZkxjZYWRvdt37paLRyQ6n
 KKS5qIwqX6UnZwUkMgMbGnPk/HS/F+KF4gWIo2VmrqX8Ok/EGqqCr2SEGGZ7u5ISGqxTFKjwPPr
 WSPWRnxwsTw9A+ziF6yWHBO3XTMFL+NiOG582K9aQlva1VzHSIEjzAKLkIwtCNMvU53+/k73r4W
 4hxcrJxjZ0iaZ1dLyoB4aF++hJ71WhlkDZM2A6n8nERnwkTNuzDJ1xpCuX/D7JvXwyuyMTDwYb+
 pPUlM6Ro9bxvl/GDhCnRJ7Dstw5RtTwqQ6XEu0tbIdPCiWgzBMMWxu244qKiX70+wPhpuZj4cdh
 4+D4pD53rjfYkBFh7+g==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1gDCOnCPaMnFSmTHD9uOKEF538RDFGYt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7OeqqYtSmy+i
 hjuRE6QfsXqOkQNZ+ruw28d5kvfZU5D9dT9wKGzk0MYrWFZ/n5fcOCES0op6ndcu/slQvpblTAP
 8XAtD4en+q98UB94j7V9WbdzxEeqUuk=
X-Proofpoint-GUID: 1gDCOnCPaMnFSmTHD9uOKEF538RDFGYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the QCS8300 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
index 081bc452081f..a2f6e97f1848 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
@@ -33,9 +33,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs8300-gcc";
       reg = <0x00100000 0xc7018>;
@@ -59,6 +65,7 @@ examples:
                <&ufs_phy_rx_symbol_1_clk>,
                <&ufs_phy_tx_symbol_0_clk>,
                <&usb3_phy_wrapper_gcc_usb30_prim_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

