Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB84AB1DF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047097; cv=none; b=f4Nt6wyBJNYYIG5kMEk8ymAHs2ib38S5AvxAUeAwmBcqk6362DA5/E2Bx/4XhVYbBNCE8RA/A9WJZHMxQ3r3nHoGSVM/k8U54MdKfQweCis3S1vrl5Xs9B8N1vE1YpHnF8mpLaNZVdETyvpVq5SgIGX229M+m1bLqq6uUzIXmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047097; c=relaxed/simple;
	bh=Oee7KAEVQw9fOSrVmE+qAYwGkd5xVTv4yM06G9G/9u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d55UaH9E7xzY8xMm0WZX1Ybk61Dvns4viuTkBeu3NuzNWM2U5qF2I3nxXTQ1t4QYsaP9dfQLB9WzUJs/d0wTUNgT8QIyo9W1gxSLVlUf/kY+fWSbyl71qidNnPgtt+RFaJ6hByZsx+vW68JuaMu+FhRjtencq794xJBQMNGPIP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnhvHoQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eu2UG+XH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnhvHoQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eu2UG+XH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hoN1732402
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq4hcmPLY2ApOhsWboBiK/G8urTch7Wa8u1GNugFeWI=; b=lnhvHoQi4+vu7xdV
	2ZRHq6bHUF1Am/+O42fwJa61v5FwZ/P2whGwzfgnOB7L4Z0hGXvBBk/DjzDUnFZQ
	4WlCXHhBUKJ1Wjn55O+kY+gjXmp+xrJtgPDon5SpyuZgP4LR3C5u6hjHg01HfLId
	UcEr+SWB6hmw9h5j5vweCaLvvxIoPU6Eig961OknHlHZSzT9ZI4dOhOf+htFkMS9
	XLPKOyrEr0lDfSBK0qaXAJvqzyND0AiDva5SednBwsZvtsSkdSEoj3u2m/Ll88oT
	Ui3BjUIBRdEpmiT/ek/WDPxQaecyAh+5DTyoTIa4w54udl+WcqKx8bozi+LYYKhw
	hVxdxg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm167-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:35 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b34ad165e3so4111041eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047094; x=1789651894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq4hcmPLY2ApOhsWboBiK/G8urTch7Wa8u1GNugFeWI=;
        b=eu2UG+XHRZsWlCQDFvNUOLttkgaP+dOZxnexYblfHXZTKp7p1EbQVWyRRHfoFKkWYa
         eEk3YPklS/ie43xvcfjab2NAk3FAmowz15bjHLo0hRb5pD7Ygq1HyjquqQzesneQEbM4
         q5lZPbmthIHd7Ada5TKKSI/kk+0vOc5cbxndlPRscsMMRTf8uD6JVDd3ZCqGVnQQQ0tU
         8M66Kn1ubGwugcq51FZRQjc6oMYmS1wUOvPEZuX/0pZ+brsqyz68BjW7n2Hy5VNmB49x
         wYLO03gDC4cgw2dD8xhHk8O55Lofzmyqr0YuSYSOY87SWlilG3AA7wdRlXylMDsYAlZK
         h68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047094; x=1789651894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq4hcmPLY2ApOhsWboBiK/G8urTch7Wa8u1GNugFeWI=;
        b=b9dYIgD4wtbjQKlR4hO6NIULH4EVpn+sP+gnuuUJGET0Dc2rqAWFn+F1Xi+vDsReWs
         UKDJkHthpsxhQVInf0sOIxhxobi/6tc/6Cmpm8VD8vfnppcFzNHDogJKrF/YWkp7yCJe
         ybnu3MtpG6m5WdAvVmG9zoqxzO4UrQlcITYvIRh6Ujh/5Pl2l5Am/+IGnwzCK8NeZNWk
         LDqkDOC2bOid5Y1oGGVRlE21WAtkTjYdElzNbemPKcDnndaDnJghLKcM/OpzsdY5049u
         75ejhdH2L9y89zvDHbTw5WdmEsAo3nOYs89n+3uaIgWmQBVEiZUXTdSm5H4dudJ4SZ8n
         vwhg==
X-Forwarded-Encrypted: i=1; AKwUvBxKs9+K4xWO9wkhwIw2EkXQxDcE1N0TXqg61f5St56wsjErqMmGHXJBXHLK/q00vozWRRQMtjAdLKK4rN0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKCWEqb9sAcN+bjYVU6VhveMuxwKCrupLp0qP8upj3GO0icQsI
	ZDOM+QhDZA2UTw6+zNItxCpnwf2WpTjWVhgzp0hJswarsWvekSFilWtPh0yeLzpFnAW3yD+nXLR
	Cx54cU9T5NOhXam/cIBVMMFO2zBQnx0Ft/N89a3wifznOEWpVI2Z50RRDblBqY2ZjO6A=
X-Gm-Gg: AYBFou3kbX6CXt+SzQ/bpewfZ3WDABzNmRJCGRNvCV5NRlHEHDa5pqz+UOf3Zn1AHpc
	2wwTZhFJ2FKttWiW3bvcrVsuWp12Vufo64CI+gPGJmdRJ4gktVupXKtKyCIThcqy3dMDDV7oJQu
	OJlz56W3f2/JeOZccv8u4cZ7pxRwCy4qOoOUn96v1UQDJEKNj9BrXPvG6RUbQ0LugQ4VZ7AoK/M
	WPS5tFJuhLZhE6ZqC5nZ1uCNfT9XpQtZPMGPTi332MOVG1AsAp06id6necN9vLf6FrihxMGL7rV
	BRCez1+WYL539n58B1F9ETPWrRmUZnFYo6wTVF4ht5dQOAwt+9yTzrwCv6Fd6lu64n2+Ia9JgBQ
	hwvWKD+8NpW1/DJxzhuoqUDZCVOmz44sD+Qs=
X-Received: by 2002:a05:6820:1c92:b0:6b6:55b7:38f8 with SMTP id 006d021491bc7-6b6fd2ce61fmr22319925eaf.18.1789047093967;
        Thu, 10 Sep 2026 06:31:33 -0700 (PDT)
X-Received: by 2002:a05:6820:1c92:b0:6b6:55b7:38f8 with SMTP id 006d021491bc7-6b6fd2ce61fmr22319887eaf.18.1789047093395;
        Thu, 10 Sep 2026 06:31:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:23 +0530
Subject: [PATCH 34/34] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=7816;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Oee7KAEVQw9fOSrVmE+qAYwGkd5xVTv4yM06G9G/9u0=;
 b=Ka+DGWFRcOdVRh6tSxtGEoJsmwAiAhYp+xZJeAq16s6MFrNvdFZ1AlHKZ2LdKOfY0rYSo5LdY
 fSm1LjXAxdGCWjxX21aPLp79MYIn4ZeHqEOjUjQ34i0Ayu0hAl71fUR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfXxcnwAOY1uewR
 EC5MHcivLG2E3YdGYiH3V5LMyhiO2K+9tFz2sBRdrnQpl+iFX6sZBg/5eQEeu84vyvdxavyGHMS
 pL7EAKretILuyITtd8PHF569pO5afs0=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b137 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j0m9MIvjZv25iVnU89AA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: Ss0KwKZXjSvDUw03rN4la-wANiIVUzTY
X-Proofpoint-ORIG-GUID: Ss0KwKZXjSvDUw03rN4la-wANiIVUzTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX+yqdQ7caw6AX
 dlH8zRl6KsN3Pm4ZuINbDBesDtLTLA04qMlXsS7VnUDOm2tIj788rj0nMCcYQ5kIYXYderv/jWo
 9w9UCmj81W2lsaNtTw5LESjwhM+TDc89OImm+2MBN5Ds5LsjHDjh4HdiPmvabjwL8qmXFD74qnL
 d6I5soy9Sqwpi4a0yIep0guCIxXm98CiJtV0MVd0pPihaiA0+XrLu2lkdJCer7pIgkYKVkRpWcV
 JzV2hiBrlquU4TOuF4Jg1FIOnfOGN8Ayax99FpxxuNnGiRyLWF04SsiY2jHxUwkBi9gNkR2olEx
 bN1LBelL9XTAakGUz2/1BtGJUHR4nqFtNklBCdobO6sWhcAgY14KXxxi333EYFePjAmigj/6C4P
 KwnIBxHa1pq2QMtitBaY7fhyY006qNoyKmshsV/glFwVb3jO7tcWUexN5kOq4mNJwx2iggWmVl6
 xHLc4Rmq5b54NWVUuEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100162

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
 .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 10 ++++------
 7 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index aaf5eb57ce23..b271c2056e83 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -335,26 +335,30 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 4777c908c4d7..c76ad7d17466 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1087,9 +1087,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1097,6 +1094,9 @@ &pcie0 {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1121,15 +1121,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index eb1de33e5ba5..63d7e4da66d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,15 +739,17 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
@@ -756,15 +758,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p91>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 13cdb5b0ce40..18c258f3cafc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -987,9 +987,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -997,6 +994,9 @@ &pcie0 {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index cf4e4e9d9e26..8c4182719067 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,13 +510,16 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 9f347bea6c74..9d08993b8bc8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,15 +584,17 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&pm8550vs_2_l1>;
 	vdda-pll-supply = <&pm8550vs_2_l3>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..9bbc31346f90 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2397,9 +2397,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie0_opp_table>;
 
 			status = "disabled";
@@ -2461,6 +2458,8 @@ pcie0_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2583,9 +2582,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie1_opp_table>;
 
 			status = "disabled";
@@ -2663,6 +2659,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

