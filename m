Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953544;
	b=xvOTxd6kmwunpNg7xHFfOIA0EOhQ4rfipBvxq5T2QM/Q1oJ86cGwX0nnb9FQToDg1t4L
	 3jgUndDLxPh40kQy8QqoWitVGWv9l5ENLxUKUyki8flOgpYXz7zgEWOyTyGCJ5qq5vqxv
	 w2m0YzVnhWwcij9RtVYwzqq6sE5SjK/Ka0wuwzQ+W9KYVICFzQe0FcNf5LHsKMQR5ZdL9
	 ob7Ppv5Rw9UmAfSAcszHUvxpPwAFIM2iXn6c+yap4v5C+LVfsQt2RDCkcM+XkPj8QXIg8
	 SeFDMXJdToFp/SEMVUXld+99BI13nJTT+YQm1mcqniMWzqqCITxOQVm3gJTsidfWpow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
	b=lDqT/KY3bvxbEmNQBW+QxjkS0PyezuxhDwAHLUTYz3rRu8ahmfyo1uvN1q7vWu4vmeAF
	 9U/yxGSHGWow7t6/PkQmIoFSv9fR7Y0W7VK3D9RDrA94mEVDsnTRxCPFfhnQFtFBFZ0zc
	 si45U3oUpYmj6jA04ycUCScajMP5CrowA2Bg2vjFfi7+hbow+0yK8RvkWqodQ5O04OT8t
	 ucGmvxGPM9WzQ3sycVGX23lqDKA1bn6fcfi+F21hwEeiLUs0ZFuVq9G2TepqX9yU1w7fI
	 4yZ/VYqDNTw1PMhWjtQTJSmzq2JlWIqqM9/aQIU5pbOaN788Tn3FZXT1vWFD7KMGvNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB8606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCB8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RXwj3284548
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDpQkXtjRd+
	YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=; b=cx8CPTlAqC+vM0l/uY805tndufC
	7Am+LQmUIpCOG26X8gi2y8O3Ui52v4ZluzLHh6SoDUZfHUyEZUfn4AIFWC6DxwF6
	gev/nq32AmRH/35JHx7cgsxj3PneJu4Dl8Vv5GFszBgWvJA3s74xKxQnCx6sOBBi
	k5ATO/6ZIs84EcT8vlb9bHsKkd8TQKWRqN40vhWVcBpQSwQCE87qN2sZSbggIXdH
	a9lha3tU+n2eElDYERBnLLSoypW5vD5qPLwSAxokkRTkpiH5qrpqRn3mw26qydEB
	py2B3yFdzEy1m2Rwtw3QWFz5d4CQbWjShe7CmKPjwCfHF/AH8xgAYq5zlUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1unq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so86504685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953538; x=1794558338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=gKChNoW3sP9Xwp8EpcV6u1LavTJkIC495j1wUelu/uqQ4e2eABkod1jc++VMExr44c
         /hZh2GORJY19KhH57DaFJHgQk24CiMIxhLAIKoSEEWkZJb/bjBRneeArce2kRlYWshy5
         /AmHgNWAtU7V6C1RgpuZMFQtpq9XSZoOLfG89dx5SWvXiQpE6GdsuLySmDBaYBlPWzrO
         ADGbh29oZduK0Yz8XQZajIi1vcgqWOL3W6F6qxZSx9dV78siAFRy77pR6SkQCzGFvPLg
         pVxRlmzfvhTvswlWQODh6yCILNVqH5SxS2gCDGkOL6olySOac3i4lWO4SSV3zI7wHfkv
         o7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953538; x=1794558338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=pADrQ39etKUK3EpU7mrINOCp0mcnfjAB2XQU8jceKSM7Oz7xmc6k7Ol9wb4tOY5RTg
         CCSc9/f6//GF4v386wWfsw582qvT5mJ65WcxYDUfozY2SltMtgO5X1pR5p9vfa+zxsWk
         Alf9qCr/O/NvgOMhlgfNBMEyUblq/9CDdf8sAQNA7g3shz5SdYe6qilMrXVTHphMblYk
         V8lYEKJizKDxtYG0Ink8z5DNRcTpwYxemOAds6rL0AC8DsObOjEH+ELFbJvmpclGfo3d
         +fUo4OqTzWzdPRF3fXvYQIjuTyz5u+UjWH7/4km88cawgRiiyzMPnnrjaSx08vdaImKV
         SgjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw91np8JF8WJWHlYDA8k2VEBlxj44LSIcQ+JhCndvyTxK7diwVDW3O9F+yTvTL6ScJb5XPJa6+8aX6EfXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4RI4hDqMKxG65kLtAqC5kldmpD6atDYn39Zo/PdhHhlBfewU3
	F5VXCukeV1UFViH/hcnYWZ+pgyY34q4ol9qmyx08QGEWDZKwt/NXhQfOB/kvvqVY/beEXfoNC9l
	ZXwkzecmsfsQguQzUo8JHC7y6c0aegT2+qJzzuBkG7FjCDukJH4x+mIOVdqXbjd9fYSE=
X-Gm-Gg: AYBFou1R5ZHhxfs2C/tb6li6TJeAT9przw2H71LKWFofGJ3OlnrueD5TQf1qXVpGypf
	3fzJ8QRTai3CfK8bI4zlU+sIX+sCyOFP10/vHaKCWUsF8oOBObPhLQ+0JSnSHjMjPFnsTYv+1lR
	FVyUJcjZ7JsPEg32/cboSOv4hBThHkBl2MXbztCmLdVXpBZW7llzyqGHDiHn+aTFJ3aj5YKJlgh
	wmrF4WLHNdWgJe/A2VsM5zMq2JNMWZxVLwJevhAsudVrTnFz8m1IHS8CCVdCxStB4spXF/WuyLc
	1TS/5AkLIb61UrQhTp5U6SwXyYtK8x9hTxdllRYWdfrTmqRBMqM10Z223D+4ylG3VzaeyJAEh/a
	qVNyEQbUYguieSNbi0Gyb9GpLpHZhotFmTr/IoqrqiD/PK1gyYJAw1xC5TsWn6ZhVxT4ar55tJw
	==
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242600785a.57.1793953537713;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242598085a.57.1793953537221;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:36 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:19 +0200
Message-Id: <20261106082522.1448390-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6cn-KbCzkC-YJj3K8YmWN2IV5wyrtjGF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXxocdwIXyMnfl
 mcMKvlTdZkh6whOJdBla+CYBQBvKe1gOEot1ej0npthTqnj7LZt9vK4YXrhSLXgrRwU7FOGkKMa
 UhLJ8pmQjRkUlNorqxjPbpbciqeDw6c=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed8f02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXxbmDwysPEXdn
 9PwjA8ODW01loV3it2Iz7nHrMpKWTA0onzDExfg3jodpnNON0w/wwc3ssSgw3H15boZrlUpYtZB
 aWGi3tvdzn0821XpT6wJ7ie29oSeFTy03azRkcekobMJz5IOGEodrA+svFJbK2fOUwi2V2A7ibv
 fWQGylQ3VD0ce2ia+TyU13JrLYDYkNNwjkbUC/gt8o4FUtlsYe4tGWvysqLElvLeF38P+g1PFVU
 4GsFbOnUdHDKPdRFVY0jrjPNxr9uWCpph3QXSfW7iyugLAmJGW5ieJdCvURyrJjgDzFOaQyvvss
 mCXx932vyazz1W74Wf3hsYaMqgQdZwdlsNmf5HpKmHRupoGd3TielGKK5OLh96BfAojMS2Jr7eP
 AJqlw9oaTgmD5ll0lP60T5TQhNqNPN1Eg5EbSFbn7BUOQIyMbsW8KSu36j5qBco06d1bf8SsKDT
 YKZIixr3ufaAXIpQj5g==
X-Proofpoint-ORIG-GUID: 6cn-KbCzkC-YJj3K8YmWN2IV5wyrtjGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..0ad0935d72b65 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,80 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

