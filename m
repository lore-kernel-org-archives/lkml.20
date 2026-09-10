Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52218493D48
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047050; cv=none; b=qJo0Un2rkMB5r5bhZK2I1RL2lU3GRbvtc49F9W1zafgzJGTsvnZ9TBlDwWU5d5cFU8fy8dILwe7Un4/tiklsHaAxwwkJZUKi2TfynYP2SA4APcxmgaFxXdHb6jN0ufJZZS4BT9IeLdwVJP10PsHE9zQ86bE5XmS/3xPUcV+aQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047050; c=relaxed/simple;
	bh=x7WfX3xIwjOsLMVT9IjU8J75Usl/xrq8+NHvfDwqsQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSo6URNYW3/KZ3Rac9+Oghcvnd6tS69Pm1fQYAc4Du+dboVXf9KLYt+fHmdhWtkNu1ReCNt88FSkAITVz9DzqkNpNCEPfI7w2eYAsY2bNpNaXEB31ocLn4A/rGSfj4X51vyC4OauyaVAs+nv+P0EtoXg0Ppc3dUWlOhxyKw3n7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyQQKiqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VscvhNFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyQQKiqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VscvhNFu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7kDm1242016
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=; b=GyQQKiqjB2JyZ6Ax
	Y90KVoDvh+DITni/2/PNOdyF/cAJ79b0/t5XXe8MtJptHowh4Q6GY0lKO1OnrmAw
	jtkS4DbYot/q346V0v3EQCrnUONRMdwTiVmOXNDAOqa5b66aARfvJEigCdU1nrKu
	oFUINYiMnQ/oUOh8WvZ+bifqS/OJ/DtLNJn074Lz3VGKSrhGCE5ywFYjD2XBDfFE
	dRFcbF3T/QeFAvqSVQij768Pyo2LjQC1NY5XQdnt8RDFX2Rb99THldCjbnnN1Vsc
	SERaAYO6u7RmyYME0fwB52/4g7vXtjfcScluXIVRr6/h2n4Cr7XfXrCHDPM9INaI
	qIjuJg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjsbhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:48 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so9491159eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047047; x=1789651847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=;
        b=VscvhNFuxiWFBNdb2oK2LRX59gGdbT3N1flJlDnpCBe7LniedVuCoucz4X/JDEX29D
         cZWXqiGiPlm2vLZgy2Cg/ZUwvwSSQdJwtteidcwTLeH/QkIRd2iaC7nX4hKRZy0I34/q
         9q2XbKgK9VaFTuDtMGdzU2ltrRq7cjtftP0hpR6cqtnG0GcmiIF+4ji/7Wuex0GKlw4T
         3sp9NozabnkJQuzK+aMER9GrDuVSsSMBKIaia4Ak6BULT1LNkRpssBN5U8FbC8CBxhrw
         jarjExFWZXVNG+ybgVqYD9kcFkbQ5LhigjC+Xat2hQXVHKqO6rkrSVtYQVZNaRkeAHuD
         sIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047047; x=1789651847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=;
        b=FeHFGLbCKZmp6JrWY7ZXCLVqTsTOjqYV9WNUDZPBsiOZi46OlxznjDS3W2ANFUicJM
         WxgZy5KBKumeCWZFQDMDM3o5r43p+fBGytPFLbMz4ZGSPRho847PTI9PsabqqDF1RMXl
         7pfqffE3SERCC/5wtG1xgm31ql/dMYzqeCHstXrmwPcz9MceQHNLAjQyTXiwu6M+JMWy
         OonLCRdU3RQ+QlzFH5oXqpdaUQQW0fPdloFzozB/JJzJJ74jN27dXsAHRQchDwASQKXt
         dxDKLI3VCwf39M7PLm3E3xs8DPBGb+iQrfAXzcu1s5pj+kuRk2sTGAyAlMVTqoO7ptYo
         YhcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6jHPle1i/BjZi1KfxNASBPSlLWq2exmAFCm5cHWZikmmM/Ibx20vIjeGVJQ6SpxrbDJPsEPsQzU0oi7k=@vger.kernel.org
X-Gm-Message-State: AFuF++mtk69MSO1wKPy4OyOe015/8DQCH1TEaY5J1zpn/zeTw0ilmAoR
	qIvX0p1BgkwZ2sV5WL+rsVIow0kvuUJUldaukgB68uu0JjgXt7vQ41wuDt7S9DP7PHhQNHwjsIi
	S0LICYbte5cBMSDqYMV//fT9aICNkZxnrUD/k5Skg++mDzAg96B8AHN9hxDY3oM8RqaA=
X-Gm-Gg: AYBFou0eknTbpzzGFcHiduHrL4Kum4NBY1p7SGIvb2b00nJLBO0cSWxARVBF9Dq6TM7
	6u2hc5+LLpw4ecP1dEaZvUWprskrCd6IFNLN8TeXXyL+3Oo/2KNIcms5IjPMOBc2p+cSkWVs/lV
	lnk4fD4hqdI1tjPdYCuhqoTS/FxqZLImOpPbl11Mbfj//NR4vpyMvS72HIEg3gtup5VK3PX9j5s
	lkP3hHTNXUjPj9m/edJgaS3ri3pys3Ic7jATo7bxo5lDTgltaT8xGHHWe5bV9Sh1Xy4L33nP4zr
	+MNTM8okzAHc8o0HqrEIdxj5irNQHp4mqIu4e2bcx6kvLbuF1qd+M0MJ7BeQAWa+1htS5z6zlzp
	BnFGBIzv7EB5n2qHYxhCB6NbFHmPPPl3j6us=
X-Received: by 2002:a05:6820:4cc6:b0:6a1:7790:258e with SMTP id 006d021491bc7-6bee5799814mr4375528eaf.18.1789047047022;
        Thu, 10 Sep 2026 06:30:47 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc6:b0:6a1:7790:258e with SMTP id 006d021491bc7-6bee5799814mr4375506eaf.18.1789047046631;
        Thu, 10 Sep 2026 06:30:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:12 +0530
Subject: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2549;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=x7WfX3xIwjOsLMVT9IjU8J75Usl/xrq8+NHvfDwqsQk=;
 b=9KDxRwTdOw430VGadpmYfMNoMQD+bMJJYQdmj3VaW1CUXBbkrMJ5uAdPpEkNl7vIt+MOJFTA2
 BoyGWClo9XEATkhaEgOujzVW6HfFJYwVSl1tFGMtt3AMFykMotsTILt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX318GW0uqNVtN
 4Y/Q065Oq2O7WuHjB80I2hSLDUDdEHLNarbRo56X2YHDjE1u5dakxonJ7ystls8Sr2wEX/10fpJ
 3wddr6UKtboe0rW6jmsN9a2g34ayXe8=
X-Proofpoint-GUID: ZcycLAg-Yhya6ySkcNw1L14-X36Ae3Mr
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2b108 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3DL+w1Tz5dNj
 hoy3aa3dajledd8b5yuHgzZuhbcOkUTXyPbi+L79tSrKFRWoe+4ELMxCsI2oy5tKXltaq+iOTZy
 U9iZbgDdg5SWN6Qoohjgjx+IPPLZf3G1s8WgUAEtgt4EkhT/Go6oxfioE2u08LWznJLtCt51qiF
 437xY3v4dnOGT3yhplJbmey6qKZt7y/jOFA8SWpe1vdq49GJpmbLVzv5Rk5n3PUeSqKIOhrnBRh
 fT91AkTpOPgeQXLGp3/bBg3l9FQ6cel1Ow/vq5vk+H6TocMza2qJFWArdkGWEBTBB5AvKjimkXG
 3YyAu4NwewG7PmZrVtIgoBk3iGipAt3LKLotIBR//w6rUzhGLPbNypTjXBPMrzOs5xyzpdskG3Z
 nKdLn/7gwy/vswgNjVaocXCgSkx7bSsFPhZAYoMS9HikO2/K76sqxrgc5K2rqagP5XTDxIBBIxw
 Gj/e38X53LbERAwTwzg==
X-Proofpoint-ORIG-GUID: ZcycLAg-Yhya6ySkcNw1L14-X36Ae3Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 7469134f42b7..cc04eefdfcff 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..678ecda1c99a 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1347,6 +1344,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1464,16 +1463,15 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

