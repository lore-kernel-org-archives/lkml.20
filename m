Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746159;
	b=5kwACzjNJjhRetMmHReBRRSUwLJdmZMh2GP5YVYWMAnf45MZVWPBPtU8/AcG37skz2Cv
	 A9EZAeAZXqCChmiBPH02QZzkpywlnZgr3hZ8494eYlEj4lHvwgcwUW0CBGBhFR/xT873y
	 I58fTNho9FHA1NPQWJQBTTL12EMQX7FP+2KD/2l49ufZsb9Xjy2kbgBhs/JilHHLBAFl2
	 r6no4qj2LVqiLoWiakGLFNkVHf4P2Sh0cCHfXzVhzGIJ2aCrq2nMVFz7+RORv/Z8TqIgp
	 h1aLLk60iMFBg+7sAmi3kQ1Dmg4XWbEerKVp270wLBRJVfPqkxBV/nyY+W4TgkD6X5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=znTnKbGoxNvTEI60Uy+kYg7/LZYXZIDam4RT35k9s2g=;
	b=nwx/ppj5gjtD0FLstjC2g5Xqr5xyIhrdbguXNjOCsUwcgfFEPvreA/l7Ub5M2xUHHCyj
	 paR+ppu/cNw6iu1fhqcSSfbG41kJjp6dwnOxSGn232N90k3KwS343N2R1OVgji7gqrveJ
	 umOXgF00l6jXivKxTmfpIXETLkKK3ytPPDgvUPHDxjRgmyNCRcARj+g77VfDcPFR5S8DE
	 OM8ughu+JnyrFI1dvxnMLSOW6HbbqAC+l3jHnCwaTQT40eiVm8mgyTF5oGrwx94k4TI5P
	 oTjzaEQB2pstA8Ot2MO2nPNDBEYXZYSUvDWDl0lai8gY/N89G+eK+7p4srBmUCH9+TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z56y3q9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kS0gauyw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0461606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0461606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z56y3q9B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kS0gauyw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9Ir2112124
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znTnKbGoxNvTEI60Uy+kYg7/LZYXZIDam4RT35k9s2g=; b=Z56y3q9Bc3mvG9H6
	os0qC+81dj+cRzeFOxuL2Xfbmc8nS6E6P25LmmN0O+a/LAK2z8+K8yHywqasjW/z
	ATixq2L+588zSnXf6kgx7QDd87g5posNtA8zSGVb1NFWgVaDlAtovkesBUYA3eft
	/oQldLab5wk5YhgcUIJZCYnfx2gTcLDv9oVUxYtZhdhkjZOW3rhLtFXOrE9zWVT4
	y3v87SVVxKGizozsAtharq1dDl6q0ulVU6BM+dJF6daO8sy2/V7nLaVgjAT38qBY
	h24ZdYhpKtrkcWqDhOqr8XGQ+Y97PNaPxsmoPvQjsR4w+TxjnYDLhinpiMwM3uUW
	Vm5yYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaa1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so84602285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746157; x=1793350957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znTnKbGoxNvTEI60Uy+kYg7/LZYXZIDam4RT35k9s2g=;
        b=kS0gauywgFw04EntllkKIQfn6S8wdvStf8WMz/FMtzHdmVhb2/K9UcHZeRb46pWUZ9
         muzNTWzkkV10oxFMm4q4qs95RY1heLBww2aoXJb1AXsHjjp7yOIuxT+EmyKHCeDHJws1
         1IDS4O9BgQlcQiANO1zIRw6B0D05QwXxJVwPDfCfRiGRybF7PsWvONdzVh4qSjOSX303
         BENQdlXdxURvTqnyZrHb4xhQlBHTjnLpi+90xUaTxAoNqPKK8oxX2rIUU1+MzcYm5Zis
         gr8JDEjfgqSmyjduhBrejIn5Gx/WFzRZr+73YAYs3DgMeLt64bahQveiOS4zxERbKUq+
         mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746157; x=1793350957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znTnKbGoxNvTEI60Uy+kYg7/LZYXZIDam4RT35k9s2g=;
        b=gigoRKeYAtXPTMnCp6NksZ9yHv0pCIhMSgK82sjSp+uqawjpYN0+BhcgfBj/XH3t/E
         XrIpiTAwF247Vg2Dpz2MkM7+qwxu2J0/UHQ3+GWLCtAwJ0bDqYJ8TM0OJxPNpwftxmXN
         kGG9n5k82gnGv35R+BbDnomTR2WgYTAHA4S6vy46Due6/C05qZNgV3VnTioDYMH/tGev
         mzNgdq5Yv+dwtqxRZjtaQM6nvrcL1PHpV+aKwCnC571cnbMTcsmHf8l3IZCA5m4mYEyF
         o+OoR2MZXfEEqgoBlUUeaeBWPbRVxzB9hi1AX+nHit7ZnUEpOdE33tNZfpr3mLXmGxlK
         HLVw==
X-Forwarded-Encrypted: i=1; AKwUvByPBX0Ep75Tqoma9p4+mXxIKTzSRbcADOWwFpSoVh/hJJCR3ZolkItjIGIlG1uQCs/aqina3lwvnifhI8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKroF5Z3dx9Tje3mShbQD32UsFoywpgPYwCw7ws5jbeBQ2FM1PD
	T2FOeEpkyNMiDP4vGh7VcW4mMBfZj6dtmzqwkPGSie6EnYFhRsPjejP/uzfWdnzGDIojdctZZpU
	bGOZj6eRA/LWf+ESFYHTQ2Z5BtnsRGfjy2rM/pZ6VoYM8Ya9LVcTLJDJA39Zh4yJoud0=
X-Gm-Gg: AYBFou3cCoOo9p3AHtQJ6Fs9c3W8KQGZyn3JT5sYZ/gBIDed4Wiop8bQsU6AVDtcpcm
	EU3ngksbarbQF3lxyTxOthx89jdHwBO4NeUE7fv4M3lktRiGPXm/G6tz2Z5nm8BLNlqMM26m4Yu
	k/XlNvuOOEXhUsA6EIhXmo8qTMGvniBVNMTc/ZpqjLEALEscdYPqBECPP7tkq85PJYai4L+rw2m
	YEpWYjIKz6ie18gl5UCQZqKhRBagR9zf+fdm0catDgNJuexPKBmVIVVWUpr57u253sy74rB3PGL
	W3IeWbf/ZDQldXhcNaF1qIwoapTAhGtLi1FeviV8Y8YL/6Yla/cxLDJ2yudEg+DiWNqA1fZAqSt
	o9YcWD6pxEqvWHUl0IlDzpi4vq2KC
X-Received: by 2002:a05:620a:2614:b0:93f:2ff0:87ef with SMTP id af79cd13be357-93f6f907ccdmr305294185a.15.1792746156906;
        Fri, 23 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93f:2ff0:87ef with SMTP id af79cd13be357-93f6f907ccdmr305290285a.15.1792746156276;
        Fri, 23 Oct 2026 02:02:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:02:23 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
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
Message-Id: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v/z8UPGfwZQDOXBUKeeQaSmucNsKbE50ggXggI4zSpU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKmQplFKpamswBSF/cPi31pfbnnLznTzoPhV
 pbLxmUt7feJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsipgAKCRAFnS7L/zaE
 w89ED/9p6vlC6GR5iuJdH18UeXOi/+DMIC2pKbVCAd6P7HNLXATA+ZLvXppPEPFvhRm7ebeeGDI
 uolX4MN5bA4MoeYFRLypZ7U5yUBb+M/ELx9HlAaby04EDpKXJN3gA9VNR4vQV/wy5ptokr6pfoN
 IylqGQCTeMzZ5MkzIkYZ0PmG0ajWeMvAH4CnuKDzNB+7ROhdW9bSz9aS5g1Ykwgy3gryJ/iemnf
 zR/anQMAAxcQP24JD/EX52ixjwZXtfB3e1Tzz/Rk/Lna5vTF9lcOSeNc27aUwUeuxbbhxFm0t2R
 vw5JhRGfEAow2cMm7QJm1v1yFDkn31DYe/AZNbwj7GTqu16P8pzaDK0v6nKGUdk2nq6vsw0TkyG
 Sue5yujnsvRhn5SigsKDQPxLfyQeNJihCI6RMCkISKP4tOjjFaLuA2G9tEpuE8+qql3iRNmIB5C
 Kk/B0edjN3PkaedM+sEngm/kj2B2Y3S0zyoc8hC0nm8/CGg+ASW+/mp9doJDn7uMAVVUIM9yE6Y
 f+BMyH/fAEZqk/lNaeZpDTyQU/T2TZODeq5KLu/KxjLoIzviovdHLKnCspPu0pQB9CDgsZxpOd5
 bboT8niHnqo4uYBn0XZKi4WdamSn4lRZoMCAqWJM7y3HD+vBhBcqBibHah6vmLUppnh/L0Xq15V
 BMrBZ+IRYqaf3dw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX/zrInDGWweFd
 x8Ucjrwk6CptldXfihIjDj4F+V5NAfLXN/8slaWvfKFPHY4dTm/jZgbCCXhD4BPd0ClAjsksDcm
 KpYokGN+8xsYrdTarsHhvwNNOtx8pi8KLbGg3eeRjJoEW1nvFeRFE5K/0W0ygBT76uDzBskGCal
 HtXKdFR9FcMr8Jfe50bDh6xSw5Q7eBQ+zyl+22/PqW68M837KGIYLZ4xK2m/iVx+MCB4xp35K7D
 sK9Va8sdgc8FoQKRyl5QQ6mZ0w9C1trLdSpb9UWSo2K6lCpRUmyM0VOs5yT+WQOZu5blS4VhfE2
 Q7zDCPWRYyffczcd5OibCg1jm/8fTaphwnt1YYktBh4ivCw/Yzi5ZfI0iA0iTdHVKGUeobVoUDg
 UWsRdu/rEOlCWo7w4dL0ACo8tiguzKQP76VW1soQ3KwXRVFpD/ZNyxqEqkn4ooLHFYSrE2W1hHe
 5IwQleYgR9wy4r1sp4w==
X-Proofpoint-ORIG-GUID: Tbz7oC7AQzrpjMYc-Xa-s1nik0yXMQbz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX9vkacGRolE+x
 kxUgQyr58drSWZV+kN5wjj4m07FrSAXkakUtZK2lJrD0bM7zCFeg1iutLs4oJO7SdpXxgvaYtHF
 MJK5e2+nm3UDjJPIRyIDIjsUb/NNjGw=
X-Proofpoint-GUID: Tbz7oC7AQzrpjMYc-Xa-s1nik0yXMQbz
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb22ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4HppcabNkfReTd2MclQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

The embedded and gearvm variants of the ethernet MAC use different
compatibles so move the one for sa8775p into lemans-embedded.dtsi and
make place for the gearvm variant to be placed in lemans-gearvm.dtsi.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 3733c0b7bace10cad656144b31d02bd8b4dbf3ed..630c40d21ecdab40ec59135cc667e4eccfd23554 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -458,6 +458,7 @@ &cpufreq_hw {
 };
 
 &ethernet1 {
+	compatible = "qcom,sa8775p-ethqos";
 	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
 		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
 		 <&gcc GCC_EMAC1_PTP_CLK>,
@@ -481,6 +482,7 @@ &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
 };
 
 &ethernet0 {
+	compatible = "qcom,sa8775p-ethqos";
 	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
 		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
 		 <&gcc GCC_EMAC0_PTP_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index da740a0876d4adcff0bb9458564c868a6f406b0d..77e4f57778fd54e414c86a32f5b068239bee6d24 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4386,7 +4386,6 @@ port@1 {
 		};
 
 		ethernet1: ethernet@23000000 {
-			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
 			      <0x0 0x23016000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";
@@ -4407,7 +4406,6 @@ ethernet1: ethernet@23000000 {
 		};
 
 		ethernet0: ethernet@23040000 {
-			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23040000 0x0 0x10000>,
 			      <0x0 0x23056000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";

-- 
2.47.3

