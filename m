Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285754B1278
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443299; cv=none; b=XnPjY024gOu/GpNFysaNlePrdMtrwdVieNjnPJiEP/P+m5GKSvPWRQAa4GeJnSWiBQLD1D2ShKR7iC/bbjaadeBDXNxFxW6imMZgHqF9kfJ2wudi1O1V/Tlv3p5pw8K/MOYDNVKJKErUybo/tqR/u/UESRzLBDDXjyx3Oj2VOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443299; c=relaxed/simple;
	bh=Zh7owfrPe68zPuCdATtsN5m4NFkKRByH4fE6EhrQ/Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NC7ovt+Fj7PFeV1/IeIPkNHt51Q6BFIgS0JWk+3QQckhDqNuixwCD2aDm8wGK9b0lzOLoBKpkb8VAuaxOlEVq4f+DlVR4dCbXad5svjEffJJrz0NDgryh8DXJZLuSzmsGw/mMOk7/mz1i8DTi6lhiXq1XiHvRPtA7sR2NDCpQ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJm99joC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxzVOl1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJm99joC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxzVOl1f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAbde822630
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9zD9ljtTSDb+IPvv+yzOwg
	HFWU19hJCt/g4cTDgfKbE=; b=IJm99joCr7W8+UJpZgU76ApPjgIU57CGygx79y
	qY6wb3CHqJt+eKRaAf9WbtC5pJ84PIK64FFses+Q/synzujEU1KzUWn44gZ1pw7U
	AcRGLZhoFkuqPTbfsCnkhUQfhCQfnIAhxGI0c8RU8VqAgnKkWxkXCq+/qh5qrD05
	/bZF8qvG1aJnNyoYPWZQeu8Crt+8ONj5Xc8S9PgnXZ16+qdcommXKR1ikEBDSfA5
	iegaJcL71Qo019t1rKl9FFcb4Z2UesWNAIWJIxlZJWj/7O2D9LHBn1/Jtbv2dEFx
	fHtuhztRKyt1TCqK2CPjW/JjWd0dzh0wYOGlPEvDo+d+FpOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70x4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:48:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so188813285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788443284; x=1789048084; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9zD9ljtTSDb+IPvv+yzOwgHFWU19hJCt/g4cTDgfKbE=;
        b=KxzVOl1fGChBwctZUpuXpkCCIB2fWmRiiEaDayjEWUJNfTvDQp9FjrvM25VabWluV1
         U9xiEv8KqMulcOrEZdHW645S5UusmNME/EI31AeVST9R0rnojMuYQHSNs/KMTe1/Ha8p
         CzIVTASPVIRG6/zevBD5yycFMwZrB2Iec3isFg1Rw3OBJM5qwJT0nr1uNsbl2oiUHJd0
         kPdi59C+0Wc7EofpcOC6DzJUysjjkf7fUWtKp9xJhHmc6oUCMwmzRpGrydcgBmobw0T7
         XKZM7kH158bwn+HswFbiWSP2UNSL9DRNRneDmzg9qxjtKeL9NbSOfEs/RODFQCh5wsXt
         AREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443284; x=1789048084;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9zD9ljtTSDb+IPvv+yzOwgHFWU19hJCt/g4cTDgfKbE=;
        b=ljpUZRmk3YKhZ9PPNIgnfBd2ALCbao/PXKbFcN6ASMChLrwCxRWFsjzZsuvebWww/e
         4MTX2YDsv/9o4IqlTPdjLlz/tYUaBB9fmxB02GD9Gm4HMK6AFKg7GEaASrHxBKGOmuaA
         jMAw74uvp8AANNlGQOtlJf+bV/cnYt6ViEowDRcRxO9nRGvQerNKnitzmUllZWpJno6G
         ceCOQK+BLUQQV8msgYxODaHs/mAilk/kVgzGP3RYh5uUStU7wLRIeeuTlnNzHL2rVanw
         DBIPVMGAtWfJJ7hwS/Bmt5VYn9tT+NtsXLOW0C4cYuXf41MTTjLdEVg88ON0lBFUyf7G
         Ck9w==
X-Forwarded-Encrypted: i=1; AKwUvBwuvUzL8D0tJuQbqKNijiTgPDKEUfTryQXQrAKSRpHW00bI5TkUPmUntfArDI6P4U0u82trAd3EUviOQcU=@vger.kernel.org
X-Gm-Message-State: AFuF++nqGwN8cseGLi3lr9a+rjKfgiFGcSebGaB6lM4BMg/P7xk+KG/H
	g51eyWhMWcHcjPMu/02CmAW8P7Ip7CN2XywEsTaE6W8ji1wc4/f3COTLKLeKsIvduj6lTbhUcX3
	TCkgJhh3Clome7Mznj3f5nd7PPYNWYdUEvYw8noDLVDzNLJ7XV+7lVYN+98ikL0DghgkgDFd3TL
	M=
X-Gm-Gg: AYBFou3/nOs8nsbCvlB1PtHwFM2AC52Twc5353fS1geTyavApPSf3rRzJ0AcJDZ8Rzv
	RdgIqly2RqTtwx5LRDDC9ZOYyc9Cz3WFLyktUJlzF16Yei3KkbpPKniVkjTtxaXmQcUsQL0+TDa
	BA00xnM9pw5DF03Jo0LiSaZ8TRCaH5UlTZDg5N1ybKcfQCryjvsjZvT6Z68DZ4iB49/DyaVyaDI
	a8XEbBOrEUr07Hssr+36vvj+tUj8S9RhhaEURRYNv/z2MfNoLdd475BIUKyNpzhQp7yE970Kbtf
	2e+X9OyEZOoUPx865xiemXBgCjqm4N0JJ7QVT7DikMgo7pyU5nm3fs80ERcg6bwPFp82fM8hm7L
	ow9o9nA==
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr308641885a.37.1788443283662;
        Thu, 03 Sep 2026 06:48:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr308633485a.37.1788443282899;
        Thu, 03 Sep 2026 06:48:02 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm112897815e9.3.2026.09.03.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:48:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 16:47:59 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza-evk: Add power and volume keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dts-qcom-eliza-evk-add-volume-up-v2-1-375fc9ecc3b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI56mWoC/5WO3Q6CIBiGb8Vx3OcADV1H3UfzgOArKRUFYZXz3
 kO7gk7e7dnev4V4dAY9OWULcRiNN3ZIwA8ZUa0c7ghGJyacckFrXoKePUzK9oCd+UjA+ASpNUT
 bhR4hjCCrQoljxagQFUk1o8Obee0Tl+bHPlwfqOatd3O0xs/WvfcPkW2+P+YiAwZUITJR10KXx
 dl6n09BdinV50lIs67rF2lBaizpAAAA
X-Change-ID: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zh7owfrPe68zPuCdATtsN5m4NFkKRByH4fE6EhrQ/Qg=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGqZepCi8pr0mtgZyv8jfhsMl2cZIrIR0YYeFOmbbWESaYVUw
 YkCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJqmXqQAAoJEBtfRMkAlRVWVG8P/1qr
 dBCJwU7MUnb0a+Istp85Kta02QcsxVugUpP9fXEfuMtxKFyPM4DptP71OHQ4T8yKnaXeKb3X6r6
 NzlIQMmx2qd7HEPKGskRpesHs9AUKjzQGghWEjGfPU+lJefBWc+Bsvz38ob5rlObgnl2Y/DZeYf
 FwaBg1qHs8da7tIKjqS3ErVJYNAKNeH3R86MwQy3t7zNI9FC2WjkgHwTFeBf3fYfxD1XiYXZmYl
 0b2r37T1bqElQJ0iZ14KYZJSOvVszMB9br2DjXG9+twUaG1hgFzN1dtsOJmTlevHXhitzojp8su
 MSqkYRDw77qOwgPZ/mp7n+I2zhCiPVCsUgpfwT6IgUxRJZEu18I1GIrz48wZjeq/206T1InlZmS
 Gp9bvTg1heE/fVSaBb7WTaMIDy35eniog6bGeNKEandwusY2WfNM6K5oNXuW5VduS+mdEH5tpT+
 zbx70TdznAemn38EXeyoEmL3N7yOL+vV/Gnlw43zPemzSD8rzAJjLWbiIMGABN86tQPkImyarLk
 axwjudSb1lNrr3EIjJfwSvQCkYY8o0PqdUAgHZtifWeojPW04yTQohhXUi3dIL4MDV75CeFrk2b
 tWcsMtiix6Yg+GcUXw7FguKB5+NIuX7KYstRzpCTJ2AVnz5C3diPOIgq/pa3lu8WZSOdwpAjHoS
 xaN25
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 4P_534w8mubC4djrc-3ZdtB4PLdassFi
X-Proofpoint-ORIG-GUID: 4P_534w8mubC4djrc-3ZdtB4PLdassFi
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a997a94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=WXmoD6rnIWV3ZxB4njQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMCBTYWx0ZWRfX9MjwGPzg7oq5
 hJ9HNlTzGv2ebobu2tfqwsASRSNBW9VBeqFfVTrppJcbIX9G26Jchn6MrunMEPUPqf6PxVLpEo9
 ZQOlrkHC9f12oSL61we4GPafaCDxEys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMCBTYWx0ZWRfX7fvXvWHDdmM2
 y+EK7MO2/ilQeKp2FYT4VLV3csDTpcbpggHbCqKEHvigi+h0jCs5ZaGrDIfOqxUzc0njit1YyJd
 P2WaoKgevYhdh+hEdlVrSKObzkJ5M6BpmvgakOoZ+gOg4x7jsuKve7s0YKxsGo45zavxPdapgzC
 L85Nh42VC0iuDuPj/dR8cywzat5K+dzpNdpiHYAWQ870rKwFr8z7OK2habDYukHjN50+D2C5bJ5
 2AcKgq0/DIL8zVzjUXEVAl4c93hMd2EuBS3s/bVvCkHOG3Vhf1IVyW42Pi4wWyLySDaXP2L7Myc
 YEy/v5Gb61G193tQXVu2x7G7fbOUeM//4voR97XvytNe409B6J/d3vdhX+MVS3lhP/AJF6vtlcm
 Ft8M9p8sQymruhakTTX3F+SrNwf/ZzAfW0fuy9Nqvi+Cl3c92CJ6Z583a/KT1PvuoUlw8EAJXs/
 NHKz1Q+kTsPxp3WwsbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030120

The Eliza EVK has three tactile switches: SYS_ON, Volume Down,
and Volume Up.

Enable the existing PMK8550 PON power and resin keys for SYS_ON and
Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.

Do this in the Eliza EVK dtsi so it can be reused by the Eliza CQM EVK
board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260902.
- Moved the nodes into eliza-evk.dtsi as they will be
  reused by Eliza CQM EVK board.
- Mention in the commit message that this is shared
  between CQS and CQM EVK boards.
- Link to v1: https://patch.msgid.link/20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 86f2be6e37c7..6c5cc47a183e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,19 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,eliza-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -157,6 +170,15 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

