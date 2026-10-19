Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39624A99D4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402778; cv=none; b=g5iR/wDUeG59ROIC/r+ep5nwPsxzqUPQfl7WFMMt2MDccAdIeFmGgjYKtLSU94zYvHYCvktkuorSdbkgY4hsbf0+6n5UhfK0ZjdaPDJM6xHdYZGrY/PE8EvC5U/cJrzv82kH+bMzvkFE00YQ6WChZfdyQ5+/obHUJ13T0U0vgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402778; c=relaxed/simple;
	bh=sAQjUxIjl8nvqblAqmHcPV7IsLhvqooON8HdUtzV9R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyUGzgUJAZUm4R93n2glyCSPA774trySQkInfyxgqYMec2lQW5a3gLWoJ1Azp8ON8bqTJ6YQ20HBDACLv65HuTbvLZ82Clqo3/f+J1VUJrp0lPOWfKz5r9hAjjXdgjozrhcnKgiOTzfTsPyAE6nLnwEZZ3eDBHGSA8RdfiAcELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6c/Jr05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvtW9Bbb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6c/Jr05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvtW9Bbb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrwF1665571
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I+/LBRpEdI3
	GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=; b=B6c/Jr05z8UMPcAvpBGqFdob+a0
	aXhDXNejbcyyjTZiFKkiUIIwhIeFPqdSRIn4obWoxd31TMj1z6M1MTg7HFpgDYTV
	XIfGUhPtezrNoOlDDdvVyPYvhxpj4ACK4GdOYF1NaA2xgxRUy7+SP6ptcDgw+nM7
	/e64XAclVdbCuXySUfcxsXNKR3WynMLX0VGgk0rGNN2OSlStYEclWFc27uZ9VfXJ
	rCfKDNwbpYI9pjnT9rFk47rvkShmb2LWsE+qmYVmXkJCzuxl1TJkFrbdpmj/DdMW
	jcr9kLigzGZfqPfF5xCOQm62VpOVpdk4088kx8jeO5iH7c0t9vbtFPY/Isg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0dxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e848cd27beso5759955ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402776; x=1793007576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=XvtW9Bbbldcr0xZeAAYzpQWVtb2K9S5CYCuuzAVVX9s+tM3ZqQM7zT8+9dAFyavyW3
         6dVv9IjEJSNtZn2XHQ8ZK/QhG9RXtm0S2eC0ehIBQoI7QOGuytHV3VwmesGlQDc6RR/y
         ZbT4+GmpVdT5/3fDerIiM+xYZ3bios/jF4FDEE4Bb8Z2j2XWVbKJXCf6EJzh4ufug2dx
         pVZpvsDx5uDR5Mv4MPDvLGXRkEDm0of9bI+YRmZNbDO6oFiAbhJFG9it4Hw0TGTntuBw
         UaK40gIIge1GK1YzTISSKiKNSJmdHWIUIxmUX04HOdNRoeQGUDc5bDA28dgEU8UgVNm5
         rXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402776; x=1793007576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=zzHEliDuQBRxj64FAZLxycYcny1OVXTEl9IEmpvyaxX6UC/gb4nWzHFIRkpHldGaeF
         nryoEogzvt83CRN/noqTSp9X5WPcEp+GfSHkgJfEgx5dJ6F5iw0W3vHxpDzP67wUMofr
         gIog5AiSGPKrQouKEX+xICZeRSbvj3Lh3sVXFL1nlDkvROV+XHo8UgodlzbxQFmwSqyj
         3xFMCHel1o1m9mfZvNij+fip7bIoWz5FTuUrtR3dSLDg/vBJSFdUaV6fhhPaMZnHAjKy
         rfG+ZsyCtW/zszz7BOVmhx+jX4AuwGe6HSzr6j4FUYMzcK4afWv3mPyZhQMAtHgv8mw+
         26mg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ3Q2rHdUvWP4dL31wYHDk0ySJEMtPB4/Zz9gCKHTFfmoGNpbxMdBnVFj7Xv/k4U9nkjpdiPzHH4TaEGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoDpVluZlnUnwpaRzyxa3tzJe2uzVqBj/Q+ljbCigpCJ+BKCdp
	Z38ImLF0eoxItyGKGixflY0GOIc0ceyBmro/x3kvXOcyP0csQdEA4eePEzI2hcLgJ2l1mSoPwiS
	bJ4qyCINj7Fm45QW7cLO+upaS4puCwzF7YFXGNag0Uuxpj9VplhJNfG33utf0nYZKVCU=
X-Gm-Gg: AYBFou1JAlHpMhU1qXeBbJHQHBDKUGVI271JvnT1Q8dGCDVjlARW2YEvVVBaqoxayrr
	5tnFAeFOdYGEdKFtcWj+CMxdAsAVeqrzWBtK7ljSmRpY2JxYLY4kf8cx2rHyNPoq2FUPsQbYIb/
	8sxVK1nrZQ9EO2RS1CQMzORshPbys8hBB+wsfZYWm1Ay9x4mwVBl2C36MWMON07b7lQj5Ia6KUA
	mrz+AlJzwY9k2RWDod1WSj4KbuT4Klw2AHtn3VUOrpqlW4DH+6a88BYapXhzDzQQxkDHMgOYXdH
	aM/G4uoHCp/7OO7dHdG0pdqB1bLRMgm76zQx7m2g2JgVZQALDJZ0WDXtsGYEeshIzyWAJlPp4x5
	/O89teOBO+Mv5nDHQYrOjofDU2scb
X-Received: by 2002:a17:90b:4c8d:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3acee2a1df9mr10692192a91.1.1792402775406;
        Mon, 19 Oct 2026 02:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3acee2a1df9mr10692173a91.1.1792402774928;
        Mon, 19 Oct 2026 02:39:34 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:34 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
Date: Mon, 19 Oct 2026 17:39:11 +0800
Message-ID: <20261019093911.3199891-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX9424XLP6ew9T
 BCi5JyeBVbppqr5TeVgi14Qk1XiC24B+rA3ekVcaTsc+LiD/S7dzmI4sFp5bB3fsdO0FUdY29rK
 jzJdntXl2uWOKgvGGc0ZILIZBIAUkpA=
X-Proofpoint-ORIG-GUID: XqfworY8crQtvBZin85BGCiJc47BAvjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX5CxvuJeYXnwQ
 fUFbJrYEuUGXsgJIFBUd6XuLivi4NGaFO5Em6mOgLHrmZwd/F5mt9qHBv+NtCMAJmcX4MolH3KR
 RXP8Fq64eZXXBAVHM3QWEioT530Mo8PR9/wf/e77Z7RVuGDbDzim6ZqTyhVR3pzbqHD1WtoA0A4
 70OzZ3+e2Cnk/3mKz+M5F1MFuY750NxDcU8SQHMsnKeoWYg4V6BCXNsfHCSdX1T40d6xRzOCme1
 +hnyDb1vBtZpmZuuzc5WbO9YvhoVSjLXivR/5MKu2ZaAIxGnAyb/j52+LjNWiavZBxP7U8YWR8A
 nUMDOVl1ODnbvmMQh1rv+UteqgBcH2sb3ttqRMqTu/rJPLGchbqo/IkAtIy9UfOMkBvdI7fCSIK
 LSwFCbW6NLAC+We1IfRPvd7M7jBM7RZEeuU3UoQKHP/3OPu7Fkqf3yezcuUPDkpCFSObXsO9+RL
 /xTKUcVwJszJyZA82MA==
X-Proofpoint-GUID: XqfworY8crQtvBZin85BGCiJc47BAvjF
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5e558 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index ebc3052d57a9..5edcabd9dae1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0
