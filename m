Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239415;
	b=ezvhMULJtuDsxmPtC7Yqc4vDFJQVxTXENyQZh+V24t8Zu0X9fHeTJjEzV8MvqUXypj/n
	 pZ91AZx0DsbjNRswbIu5jPZKsR/6Lg2aLUrObBJH8847vKSJeE7PJ/Tzk0oQ2qHzeTjkD
	 6OwLN6rGsgMF7hMsrWBs9Ujg+oFAmKLJByL5J3992WWMcrS9ZIzNOd3g6em0nMpRkyRqJ
	 XeDM+8RGjizPDiHTfrBQikpsKInpX6x4eOtfKYJiHLU+ZLH9rUcjUIM51t4f+Onve+qvz
	 5NU7mhRBe8N5+Rq8/ieR/f8CRhuMTput0bO/1aKeY/l1M7VCyQ3SaFUI6qrq/kgbl1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
	b=egsFFHvwRj0J4Ktb8Y547ySiCLoMksX3+cN6ymnZt8pqmTZe0kNbc1MAmVIJLbre9Xom
	 xfW16Ox1BZG0ojXyqehtk25xj56d05hZJVUqfevEl9OQ9ge7GsBpS/DmwI3z2XkV5TnNw
	 OXzqcJrUpNbEBITLIUwjWpwDhj9JyTwA2V0h/MGqJdB5G9uvnQ2Yr4/8UohyiaIWdfvhM
	 2uiTZnS5pokTQOFV8ZsoYWQS3G6K6HO/J15L3GyKNhPRW3pN0HN1NH9ObN+Yoyg4KxeJz
	 /AF7OkmZKP3wGx4+8f+MI8JoP/Uoy0MV/qD0XXApynoqHIGHaJNVTZU+tzX3hwJfTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A76F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF0tl2927803
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4jQWTo3nRKkcSlk9T3WMIv
	pYTuhafOQ8QTSmy5ZtKmU=; b=fiBHYSRAUqHqzge0errBxZkH5J2FZRwrZA+kXZ
	7MEWH+uaprKtNat2yFPqQbZ7RmSkP8xQNE8jL2lMfpLZDBhP00ROyrYJzgr1ZkWs
	u2+LUzpPE3f/podj8GDwC/ax7enK0IjpstR7CmsGpN1Q6eQVTwH0cLsqF4z1LJ3B
	hPd7nWDBb0tqsIbxY6QJfaLeCtKKhGOyzFr2Gp4tuTVj+/9VLhYNMLnbwecDALzB
	+ovdGi1PMYEI5fM/7HhicYfbpz9BGTTGjj/AWwHDODFe96k7236CU4U4t9/Pjuv1
	tb1Wk8LFsfKKLYNHbKxXSN2aqu+Y24goq20vKSAHM9SHu2cA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8s882-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:50:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so3774411c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239413; x=1794844213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=L9RzUS7xHbdCYbVoBZY2OFsix/5+z6CXimKIQjms88jA5VaSPACVRC34nK/b38X5v/
         VBAzMV3TvHDs98ISzchd4MkabjoHbfOgMQKo74mWQwlBsZnwST/MnqIW2bwCBSI8vOKm
         PCZhoJEJukZzWuTSrRlF/vghz1TgjOZl01ogQ2uTqqXokJzEOTZg6xxEAMAsfhEWc+C6
         lF6mq39EFdgqTMJoPnHC16wuLU8UauBstKj8NlRytKmkZcKW0btYRAkBzHwz4X6PenYC
         vDxWd7x5ZGNrWBViEg8kIOBYohPJgZxMqszQQEkNFlQe3PPZ62RH85FlivArHfxY59rB
         jT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239413; x=1794844213;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=Fn7M6DeEWLmGZokenzSX6LcXZUjSDfQiGA0z/DQwel7oyBygGZ4v6M6jJdaptSiPCn
         aoMzXi/n111HVwGtNL6Iaretudjn00rVr7izhZyzqVTnxNlD+bCWKI9AlXY6petvGerW
         YNlm3EZgk5Cst2PDGqouHfXSFkfCmwGMLAuKqhy9cRf2nSVzCKhFwUKSu8zLQqUT/UoZ
         Bhtui02gR2g+SYjRy2xSuKNx8pEgXiMlPebp1lt0z1P6DUi0wZbd/4xZu3jfeHTFKSeN
         Y6GEP4UM8OjlcV3SyzmsS6tVwijs8SspbKuy4W4yWbTqxLs5zk0Tq95BDLeTLO7HBsi4
         vpBQ==
X-Forwarded-Encrypted: i=1; AL+hErHA6Sq0GAtGaCdoQbOR0qCj9WIv4RG9bLWytRPv9YOwdsBPXEi7L7w7kOFuEUWyNpGe6+WoMVLJ6iEEcgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BYZcPnQmLyiCZd1qPS2UOIKOh/ChTwLE3/NHjUoLcSmmZrvia
	FRtepe9uqDvf7Z0FRllpT2kkQ8cm/tta2jzXbJX4EeCaC7NifEbi4GmAJ4MeHQXp05KNUahp9IR
	DNm1PVBcXnhjHC/8TnVIvc9ljiIa9w+DqAdYXRYn1mf86T+EoSJtgcX6ZQvJi5511dlaXR6vwwp
	s=
X-Gm-Gg: AYBFou0a+4OcJxRTs+EPpMv2n04PGcQqSjeQxAqRuyo4FhrYJFNWzEVlsDxcPfwVDn8
	HlTg1iw1o35OMN/wszDDP/Ds/mNf5ZPXWJsJco9mfPS/Z56gSt4GDikgE4yz3G5lvnBciFqMUsq
	dwWk3cd6uuhFjGotSvwqh/x25/1MA7ZQM4XBsvvw9lSmAXaRYSSDImqDtyQnZcwfQ89kExcCcJq
	kxviLFxTPUYNIdy+12IkmtHfv9f4IRJZnGqs1pqAdhQjEflNUg+qBiDip9nTXq8mvohwJIgZtDF
	ZdJMgaxXd/NKQnszSzLr6n8XqIVAx4XwpaN8M7nkzPA6Y0Kxx3bGjlhJpeslPlJvLxnp5ZhNac6
	SKuTu/LYo4rC11QGg61rQlWGyf+ck72FhyqcI2OzyfW4IhIQILZtRwlnvtNohPpCcqQnCqqPFJh
	Y=
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515733c88.0.1794239412874;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515697c88.0.1794239412259;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm17671616c88.10.2026.11.09.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:50:11 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 21:20:00 +0530
Subject: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
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
Message-Id: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKfr8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzEjNJE3ZQC3ZQ0I1MTQwtjc0MjcyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQD8k6LhbAAAAA==
X-Change-ID: 20261104-mahua-dp-df2541837127
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794239408; l=1452;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6wTZWwjBv+FV3Yma8YzEqzHEMN6HBhvGW1YgkJm2hn8=;
 b=MDINQfvs9RKhx6vTAoAB2HsxZpqwNiEwO0IZFbr428ixPLDDQ0NgDBhL/+cv/jbHj0wSBSSpw
 qmU1PJSH0y7D1LExap/2BrYyqAIJKr2EYiGEiZwvE/QY/fU0tfKeoab
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX1yyU3gmdGEhX
 dTpH55gokL82Y8WGsGovKqQrl1Fs7FUHejncZP90zwQBA0ey5bwlouEIGeM//cT+pf5jjSwAFXM
 0wZtuHlnVBqN9yoc5+MUfpqRSYvj9UuiYCGT9OOtqZw52z9yY4IS2gaFh/G/hIMzsXGmpdrqkUv
 eMHkHVYRaIHB7uFKtOT0IdwSkywE1TQLai+EzW6N/mHhVznLfSGxH8N1oI066Lew8K9RrR3TbUi
 Xqk01fhJZiXrYWJ73edVFVfigQ/tnwEH9Di3OeHIbplzn/w/2T6BpQ3ZRZjWcMTbBCPznnf8vlA
 4P+pM8nXPPWISmuL8bjsgXbPTEm9EqdVFt0Psb4ZjBTbE/OfYVxcLeAbuxWVnt6FieAZDRnR+H/
 ZDTH5AxkIGCZS94Ozm9qaGCVnb9CTqINh15VOdXImNBIovN94z8JpSnjNC2TcbBxZ4cA/Y+YkYn
 Z8fQOuCte9Ft8DIYhoQ==
X-Proofpoint-GUID: GGnlH-qHM6x3HdENUhp_R4Spr0H6a_Xe
X-Proofpoint-ORIG-GUID: GGnlH-qHM6x3HdENUhp_R4Spr0H6a_Xe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfXylvFcrLhv8tO
 vefRLsAC1SvatEH+D/35Kxz0SngE1zk6pfEKvdMaPacMQlpdD8qbBq65jgDu9IQsisZhJH2D8bA
 UHEWlz3RUgIfggryAnyqobizvicziPk=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1ebb5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLMusFW7oPKACw3lbBYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090063

Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
Enable the two DisplayPort controllers associated with the
Type-C ports and define the supported link frequencies for
their outputs.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
This patch enables the DisplayPort support in Mahua CRD.

Functional operation depends on following PHY PLL series:
https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..2605c0e70c88 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,22 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-mahua-dp-df2541837127

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

