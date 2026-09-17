Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05C4DE72D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647952; cv=none; b=qcXGIvF7zQ/wfX/O0RJ05e64XwD30OnbkLlSFN5KEi7rbDyFBuy7vZM9MDdc6GTpDjBiyv9xQrF4zFrnNkUQqdb8qUbwIhb1XB/hov59PR4LV1MRk3tqDaeIiHFluQjLw6DAGN/5Ydmcly8H84naIg+73e5YWr7gqdyeltBmmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647952; c=relaxed/simple;
	bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fME0w8Ao49STxV7IWrTPXc5Mfa7JMb074xiqVQiMsn0M3NwQm7N6w4easoUG4ZJe5AGwut+7MUvpiHOt4vvNRVIgi6bkGYbaK7u4hv1FJFXTFsUa6/tVwI1EmHRNb5kYC9sCMVBi9vixWUSE37nLPh9fTTqnRq2KAJ/6sW1SzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAciQeVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWiUxRhR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAciQeVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWiUxRhR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZcmS1257865
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=; b=KAciQeVu8j41vZIw
	QPVl+TNdgDPNJAH/v0hegAHZq+ntI1xhfqrQc72HCAoVDNWS6XRnuhQXyw2ia3Mj
	IF9SsJTbFk1tCeh4zHqoacyEwVJLyrra86Utz1O5wQT+yq8XkMq31PUq1sG1Bc/r
	v+nrb3U7h4mpZ5RS2idLjxEoGLgYx9/hqSlms925XLESi2qDxu0vQUUahRSNudDE
	hSuiU3/2ipdl948aZfwDRG7Ha+ScGYgR8zf2sgQ4dfKSxx3D0/dpmSZYGWhq1Bt9
	eNVt8cqZRAlAb2dwKDSTBILcbPbV/iTHoD6Ftc6hiE8ANcWnF/YXyAyeyg7U1Rgo
	A1rjMw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgq8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso1354742a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647938; x=1790252738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=RWiUxRhRe6maoO/jUJ+yA64QHeSkq+S8+JueaRQmf+pzHm4PX3oPoifnbphRiy8AxR
         Z9RTMv67o/oRyGNQRZ02gPeL0RZgAzR2f/dXEgJl6MpJzejpsxpnndenoTDuO2PZABAx
         Ehh64cHqUCaEBtjVWUcKUPipYuWA1/2IH17hIH/RGcq5MkY1wY7jNzPeSISeUsa7KqyK
         UkLGwfhGAQ2yIjspy1IJmOqZxTtmwbvruomlAWf0HqU0RbpEPHrKqj81r3Ir9vs0RsTv
         dXMxYHm71OMoJQIaecxgqa3U0pUQthHVh3UX92jXDmFOW3NCepx7m1+89l63wlq/zMQR
         wMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647938; x=1790252738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=MehHver3jgwCQquW8hZO1eKPQQEAAsQcHMNkpBslmekNtLJLRv9uC76FRuTfOsi9ew
         vXRPULoKZpYXUWpQFn6u2Ar7s8lHvtSwZAw7rZYIoKNxHv65lqIiZjGUNzSSoZYEJESB
         EraRC9DZ+iLD3Imum+fQLIuj3aqabqQKNb57sc1wOeYSQHr4QqVouoXcBkg/fbIbakDC
         /V4yYB8qyRp809GidjTCxHpo79tlR83+pUYEhmrCRKhK01AG4LlkarxJGxLbklC+SOQV
         3CTy2bB6M5Ds4n86caML6DBlpMN5rCCJ3hLe6KayoyvfFrhtbVYvQTheAb2VPXYlLDJZ
         CtIA==
X-Forwarded-Encrypted: i=1; AKwUvBywvK5ZViePfVMxpQzlGrbJwlRNDy0uzUfZIUOAOV34Ip5SsCcit7G2pvNdSd7KNHe6AgHPZ4OUOYVMUoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mR+F4vUzpGQlLsjYpvIeLTDYLCtTz0mYTqfgqndp1aCViri6aq
	AN45eiHtafJxqknEDYUnjFFZcc33HviScsrQ+VfOv8hKj/yssB3uC83VjkFjRcXk7Hh8GhXwyN7
	X21hbDJqMO30dRjNre1M1F4rTpf7MJ2WVbCJqasogCzrFGW3SSvp1IiTM5o0kartnW2U=
X-Gm-Gg: AYBFou1l9p7I+ira9aJ00+FaufnmJLAhXKGeliD3z8Ie8cyPrdStj5AY7bkiNeUYesr
	GvnheHDslNhDNqzCDSX8Pg/C/cfe91RRT12c5qaezqgiWlw1uFOIPrNW/xGVWNFt5Mg1nhxTM5o
	B0fGE2h0CaWRj4q+ujb6Tq5Vr9VvHiopxpuPCAB8gqOM7wGJXOB334qsNJKOVb6QkhiVE6DeZP+
	TeAj5D+4gt+oLz976ttfYKi0Kvz6v6AgsID9tef+rzMDT2QLwIrbOUJ4F1GDboyeji9QIATyLPh
	kKCtEd1NA6Qn3aM6rDElrBaZVNsH9wftvRwDDvxFEl3O/6a74DkaRNXLFDboLat+4lQGpIlYhya
	pRfrCb44L41ESzGCdmofLIRaf0BuQSGsvBw0=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925779637.2.1789647938370;
        Thu, 17 Sep 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925725637.2.1789647937838;
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:15 +0530
Subject: [PATCH v2 01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini:
 Move PCIe phy and GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1791;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
 b=mWl0rflsNEp/u6JHJhQ0ExsUp87moBhvCU0vcey5i/b6cCsBtOYoRbgy+aBX9WlnpTXkSmUm5
 bZn6ALSCuzoDPI+pNhv6VdKf7cGUF47y9V8klZITJRI3dwqRWSivCHK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3S7vqmbqNBjF
 JiruOJcTVBcfkmegLgzCyLGCdD6w1ztHY3+sZuK8wgOJRYVetyNv/booKXy4W+zLr/yA/kkj8vj
 5j0Ne25W6CB60B0zxVMs3LmmFKHV5pLPyRy74monaHTtePMLwAu2QvmW8A6xaHO8ohF6xThOPww
 IVjetTdSns5j9fl0YoE88OrQSrGmeSr2aUhisCQjO0SlNW1q0MFgrrOk8HrP28/LUy1kg1VIexv
 oGegWpjeT12tWIsXbasGo97w01LaV/NlRILIHcRmnFfJkQG7z2s4TibMfMyA6JX8cctSp+ATTFM
 0p+GHwASn1dbRv+PoSDgU5uYNXqZXrd9UCm5kUhGwOrDuZl1tn0hwER4Co0YfL4XhgWqPeY+ORz
 AaPvBeL5ChYJBSpqL96+p3yQJXbVlkrPS12BbyF1cCrt9/ewOc//JUzUM/uqPuk2qQmjNsXRdMh
 d1ipK6N+0LlkJqXiphQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXyI8QVnBE/9tv
 tDB6G4cfx5GRurucZdZO5yW3Jrnx70zrkF8oEuUsRi26L6NQ1lqUjfvfGl9Yo6nQhQLSjA2J/az
 XWOCdpMW8bH2ygqO30WU+SR2v3VHBKI=
X-Proofpoint-GUID: whe67okZGOBlZgd1ciirxhQIt426uwsg
X-Proofpoint-ORIG-GUID: whe67okZGOBlZgd1ciirxhQIt426uwsg
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc43 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 141d263e6566..496b7583e4a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -652,9 +652,6 @@ &ice {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
@@ -668,10 +665,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -685,6 +684,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.34.1

