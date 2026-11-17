Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897298;
	b=fGhpNLM35qhDxHcOh+jmu2ewfz381uhf1kICDLqrB98qwuaJHRY1Ad7ccOU8b1GhY53Z
	 8G2IlNLDMCRl/sjXkPVXghKMNOyPy3Wc4JhSvKbSEABz9KMSPOfY8xzVmO6nq8Vw9FMh4
	 P67WYRqBvDztnArQru9s6NSZDRxoDWp9pCqTgIpRigbaUeLhxQOT3/DF5tk3+zuFJroGH
	 5LXZt53pHvxhUpBR3gyZ+qVFaW/Ivb4Ob+CfQ7xqPcppuEfjsL8re43URT7Z4ONnixIJ4
	 ehgmmFsvZ3yZMO2zpeDVe6j39GVujvLK1J/WFs5tX6syRxInNvZ3lCQ9OssV1kKU65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
	b=uoInqbGAuPMAxR1U7aja4vHTo4UXVurxKq1RrpgxZClCy1tSoSplLC2ApPbRmZrl5opQ
	 luVJCdwm9QcbDFj0vcJRcmUf4EI8Bj1QAUMrFywDyDtA4Jqt3JYe9D50QAejPESJmd1Gi
	 kj/iWFoCHTE42TGKllD1zusqLQ9L+Fe22TbiBxuaWh8yhBDoym9Z02Im8AcCxszuJmAn7
	 GHvqRV+AP9KM90n9o9EB44kOCIa8NfmbnjWrFwCpcHUqWG7g4XDcvFZR4cU7xuTLCanQz
	 /bUqc0URKzbZBRJvev2l+yzyhyT/W/LWBwfmRuTCewymf9OcZ42lMEgcAHy2VH8eMOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TwMRxwB/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01E606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C01E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwMRxwB/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Lg8V3980592
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=; b=LOMHBk7e7rwy1KAF
	n8bJKQDMb4OMECWuPzohIRS5TOcHbRk1079hmzVdRAK7aJFy8W7OddmXRqSfb8nK
	hTP2/+b1BMoDbcvoEM2xg5aHSthF5DrwEPJPQ3hnHK1d9UeGz+2Vr3oUF+J4z7hj
	aojLdGpWbxMVxaX2NFsFm61HQhkrBa6tB92gRsnoZQH8WgzX1+RfrJYcLl0R5lAe
	b20nv8X0e3iikIdVVdeZNE9fuAsF790thZtz4xgNUaRRqBbFhgCMq1qJ48TLSsT0
	lIDlP1zMyoBOm4wCCyD1yTgKWoYeCYoNypmHYYFyGfbVC6LDVA+Ti26hM/iRav7E
	/pQrtQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd01m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so4532448b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897296; x=1795502096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=TwMRxwB/3M+Ov94hHkrIEKO45J9jG26IN+HPHv2XK3YYaTuOuq7b43mv0nHVL6qQEC
         dFPR4HJeVPzqGAJqiOqwyqSbt0ZlmtuCZx6QsoI0Y4XmbQ+qGYYgWhXBU1tqxWlRRed1
         dEWklNRV1HQkqToXpFZy+PI21PGOotnOHTcdgqAUVhw0+V78hByfc6X6suJN28yoh4+p
         MYm5H+KLAkjC/drYE4Gs6vfJdHDzq/A9zDTTCbFB1WShavLrAKSx651TG7XjrBLKq0EQ
         xd2KqCOyAoWnpkgTvH+Lb3QwrmAO3JOARMFjLAvjABdrUqPAIh5ae1gjZnQFQap73dCf
         /VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897296; x=1795502096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=WuF2OxDrj9nZb06XXpfOyjT2D1F710XaFiK2XmJIi+TeBVDgHfSKnNWNxdmACa3kLh
         9xSr6dU5TnU+v1+IAFwkA6lMqj5/FzB5kym8kExR6sof7DdqM1FMDyNQ2TXkBiKMaBhv
         tmA/DFVOzfnTzkVMZSj67JHJ6GwRhTELYXapSgDQW70YJTrb6xR3nHrV/+PY9FdXX0mn
         yHkTNON8GAUOrWNWJyGKxsAki9xy4ATGlMwwhKTFUv3OllZvdt6RU4wCe93u+lhf2GYB
         mMNoj3XFFQwRGpnDtFAmZfCjBNxxjE6cM/YFs5/8Z0IOl+4rF7AxfFXk5CoIkDwzKTIL
         SSgA==
X-Forwarded-Encrypted: i=1; AL+hErFp0/y5CTC/sWLgbFyvqLDRpgIm3Nuir9MdVLnkB1x4t8YQxqNR4irca9Wu/DYtGnTm0h1Hhu043oxRkfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sUpSoS/2LzFlouYDOdVpROWpXS/EapABe6qCnqRVYlpovWGuC
	cUlkw6eKV36v5pOlwHD+xreZzTErDkb7rwWlHZvgkXWyt4aaJJz9wwICSy73spJysqpZIAYx7KI
	xp8psH/naw2kcYSuQpr76GeGkoYFkWSbTmK9DEW0Ejwbv/ctBktZn9+7g7r9HWGp0x0g=
X-Gm-Gg: AYBFou1pHB95DjNGN92ZBse8MPwzsuwqXwGgnASjpJNEUSTZ/FMsO09ycTgp3hnn5aD
	B9spbLjumW0PtyGZPi2mRtz6pXICC0OrOSibJJbx/5LTWcozJ6EW4jKTrvF+Pu8QlQLIaSIfOQG
	WIPGHrv29otTLTOt826Od2RMaj0uhuDrpd85Lxuo7J7f12rNEER7ozr2FURO+HZzk78x8CEs201
	4PAigNML385mH4fJ64cdubSmMimOQVDN1BDw8bN/bpRuPoEsW7RQ2eNoH7aZ/73Q4P53CAtD05s
	dfTUT1O/E4DTuOR0z/6+hlaFjD1bqzVtcZPkCYkPzGrfzv3xUi8V8cTHhoyb9NMIYtS0jaSPaxu
	6vDPMxblOkdMXzMPqXhxxyXxxcMTtSy6FIJ5yYJyYhtBw4VIt7L8J+uxfBbjKoHgj45FgesvpKf
	q7KXEDKbqn9OvYxsAmLcrv+riZ4yQylAOu65e1OUU3fWivj99K
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059109637.7.1794897295508;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059094637.7.1794897295084;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:54 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:32 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=3615;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=H2WyrQUjBIxQE9PFzbM0iJiYdP9I4yz6a6tR6KJWNlw=;
 b=WEsL9cfN3XVN32V9jITGuv7FUn60HptwEolsSw61oAxsmqbs0wyx7rIEhrwpBC4p4S/h+KPwQ
 Opjps6kBc67DK9l3qQMa6mGg/ow5WOmVVEKjk5PdV+IDJmzE9mofPlt
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbf590 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8/+5o+arP2Bb
 YW04SPsz3tgQ1l6VoFt3O3l1oU4YcTjzagJa8WTUEs0QoSmjlvJuyVXT/ByImW3ts/+WFBEZSjr
 eYWNPh9tY73wmyYYesYxLLPxk9tJ36M=
X-Proofpoint-GUID: 8zz9Vofs8zBn3zJYlC3ejcK5F3F3Buuz
X-Proofpoint-ORIG-GUID: 8zz9Vofs8zBn3zJYlC3ejcK5F3F3Buuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7d33Fal+UDN5
 YEnJ4BGkMqCK4ZGB/4EAjmaBLphNRs7E0Yk0w2HzdAt7WnQOeimssd2TyLiCXmJZCT+CvgPycBN
 2jGSlPtopJcXn17RJSdQGdLI5v4t3sOvkPUo3TBqJ6LoS5R6kZ36onKCLwhBaLXgp9n2p5rpsRK
 /hevC9BifXQDiyMSl5nQxE2Xf+41LA1C6FiaRwj0V6gQpOFi8ooiGSDSGA88WnYjCnZMkVJrp6S
 04R59An9lMN4Qd3AKo0MigK0pvaqjw8n2fGT6TXcjED9jeNyJEmNwJbSGH6m8ECz8lU6IDHwUCQ
 fkOjrGG1GSCAWzRR6luAnlApd8EBXT0pxs3tTPutqyS9q4NUaYkj8NJRp9qzb+KCq0cX0jctjWx
 zj3aGTE5IafTvfyO8vnG8P29C6ZNVel7Jb9fE+emEjXyKhTALKB157LWqFhumkDQMwygYEPsVNx
 5dEkgzBC0LXL8l/YE7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..0c13d3f9b6c178687911947c890d4c4d5318e2ad 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3429,6 +3429,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

