Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143953;
	b=GcIsnlcrf1ctY6sPVnvux0IpFgX4IdoMyc5u7Ygdhr32c2Zq/wW49NEl1lFypG1SKt6d
	 9Qp1muoXDM7noT29Sv4ME1KoIYbxtWbGvSAa9UJFVymKpf4zeUjdBuDCNQ6PaPMPJhJ0B
	 Ixew12x8vxsvq8w7qNeySOWZxFHn9j4E9sVgA7mfPLZ1WE8wXJ08tgHJPlhFPAp1/jkv6
	 fztqv/zxPkzgI9bbhd3lHcJm/v+svC+JSodflHgU1zGRDL2jXhtxh6180Tke33tRPhgTt
	 gmUlmafIOy1sk3TIHIhgqoU1zZdfDSoli1GK2Qn7Z8/JwyeRkMmOxnrzp+Pf3nxe96w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
	b=trqIcdOCt8Nu6xIRzhEv/2Y1DSef4CH7oQU/3Ic2wsmKs1joxzF5zeNyil4WFuk9TAxR
	 twXGDf00ZMIyUsqmyvdvu0cKhvDGFIiailWLo20c9u+oBPShWprsLW+/ojebHc1bTrzuU
	 HwJMJgM5pLUpF5PEx7QPMA5R1wvPSPym/vO0ZXe9kPOBfxKsb8j0lEwHQeXA3VlavZ0V+
	 qa0r3q4zaWjSPoE8urxTvyk5hyC6rArDq+sL/Jx/55c4MudP/6+sxPIwkwezjOo6vnZpl
	 wqSrCCWP2AftPV8WU7MMObh7thsGgkXPzD/8MSY+4ZFVTlU0/Su+0Jtl/SZrdPABsfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBAF606D808
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBAF606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgExb1249911
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=; b=DAu2P4N02RQhm6JY
	WykbkYkBjwjNzqQPYMTZJw1er8ZwU4u24Ng6aGkUNw6q3Etuhg8RwfJL8cGGvCJF
	TTjFoNjcfAUBBBWy7+a+QnHxCt+69EtElmmxEB4gc09hSwHgpgEJgjwiA184883G
	aoItqCQp6Zu4mUIlAEpi8w4Tz0Owyq867P7n7Kq9o5Nb2bhMjJ46YVJIZTEF2F6b
	2AK+g8w0nvpHy1d5v7lYHtH0LPeBNLNbIVLvn/KCg8FVL9QDw6qCHzWj0cLYgiuG
	ntUuAnCbH+af6AvG1ibUCVP/K0DiYLYQTFPNzWjD+BWB/l8YIp7jt9eleCuFb+sP
	03BchQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uax1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so144301eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143951; x=1794748751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=jiXxBruu9Y/CeGVYbaF5Il85TojS5XNv6xEKiIxOxQ/3f1ukZeK+l267oWvikNTPW3
         16XfM67mdbjdwXgqa7/J1uixDcaalo48Hs+Jt3V48RGHPwRs5DBzHZ4EaanS2So5xuaM
         HE0hmnbMkzbUFtJAknzDhY3FNw7dDR6mmVRwZC+bn3rDUdR9SCyUSgSHz+FO0KvRNR4K
         9qe26sjWk3iFKLgBkO9yTN75g2kZ6g4/CkuVKHX9qMjbp3vv3AriT+juR7UjqVOaL+57
         Rl8+wMFkuCaLPxCdMzcuS0U+5liuAfDB+6x3gpk3JRkz4Xpci9hzECahdV2VM23wKbJk
         ckEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143951; x=1794748751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=W25+I9dGrspYThkNYIk5QI+mtyZB5oXBVqRlAj5zTe8tZ7eMxZWeUxajFW0kJMEDlN
         U/6cmmZBA8Hp5AKREvkFgoxp9nvikXJ2D122DrfOuBMEFC7E4TP/pA63VSTjhe1HKHEQ
         O3sDk9ldkq+UuKSIWqvshAYqDCxHvVovBmc+FPJVfIFUKTzDmAZY3X0O+vVBItEsIu2L
         21mPA1fQtpdrkqi/Y4GRwdfLi7S5Eo+3czFgbW7ah/L5js6l8MP0BPbETGGt8xKy263p
         BY3aMnMYBia+vO0pfDFfxa5h9vdWmVkHb/Oe0Y4l+YTrKBsI8xELMyB6qhFEFbHhkI0a
         lODg==
X-Forwarded-Encrypted: i=1; AL+hErFPBt0cQFEtlujxgxsd+eg3Cz1+IjUOMaLSCIrc1JOYVCYXSR01CaOyOT7UeTgdy8vGbtxxl6XUKr0HgKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IC6U48z0gSUprrI5qXk2oPTagfXHck+Jg4dX7vh3NhgX8PTvW
	yZHihuXGVdegqGDvpujprgH7pwzAq0EhTDiH7BJyNmicR1oLtmsZWgGNCscGX2LTq5XBI36zkyG
	3ukiBEdeizuuBnK70wNYuXvIy+pVBhNpBYZ/LSY6b+/gqD4OfZpDtztL3Blft/u9UH8E=
X-Gm-Gg: AYBFou3+TISJQUaiMFpRPIS3KDZG+ew7NLGadCYhdOk6W/XYh5FbBgG5+S9eJwLpq7Y
	PH6M0nX/iRKf9OvRnVThLtfALvhigM82b89lC8kD5ctOgOMEY3MvjuOW8exKGI/iStVVbYabpWD
	yHzIpBE3ed44RomT8R1NlbLHLtm84YtoD3mZXeBXn2PRKKvkNCTbX87tm0txahVTpuvblKmI80W
	08agzES83gtZZPD4ZVP/jbNusxTXUZ7wkVhsA9tMvg9u+ZaAHEzrY15kMfzy+jSXXvXVpSZm+a2
	+YRz+1/OwjcrLGzIPGHZLujU+g2jpjtxgn9G26Zw+SMUVnIWM1Xh5dQFGnPpAzDA7x12qhgqbAR
	Lfzv8CJUs0R3uvY/PBk5bwurNvKRng9O1YjwCOyvIkQb7GDRaXFmGi9P7LRyRwtcu5NKKlYPCdA
	krSAo=
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288483c88.14.1794143950843;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288427c88.14.1794143950085;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:09 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:27 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: drdT9xiYdFl0Ji7G-7BPDyqzD4kalNQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2/o3I1YIZfQO
 NIWcIYE7fXP2fA+rtM50grjlQWd9JZLNa8OWO2O/UlDTxlUL/60FfBhltAW4e9h5+Is6HhaG06s
 Ui24Mxzh8z98vlSV26KVy4caY+Naumk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX64xble4OCeWS
 vL9qq3iel34CdecH2GLuDQsgnXzFs2of1TEGABiHnY0M08Obruw12678lS0DehOzbPZlZu1+5XS
 4Xus1BVDCguQDx4UX6nFa8ftTcfHh7eUbBlOrjztlTqvnbXhrUQsStQDbn88td0imutu3LiZsE2
 7bFEjhWT4SZwdKxV/Lp+ohilvHbdFscxp0S1gU4wYRqalB5zKmJIjYrbvaDY6u6NTiCE16rGbc1
 nnAqlr3A/mujjakDUk5hqF19cekQuASimCpchrJCm6W1NeDJTwA3Rnh9EccQhuF3JAdegcPZ2g3
 7SGlRb5cNDrdDm5GfCJjSG2McFfAcJddrsfQeBuEZJaSxoWjYJ913sRASq0iW7FLLShpvoQGD3j
 PXs+zpULIVp4GBg0ZEnB39arAEvWq+XrIWSSj1831JMCvcMgU5F4hWPWJvr+nHZs872OJsIuDIq
 UY565eJe/3uM/qgfBvQ==
X-Proofpoint-GUID: drdT9xiYdFl0Ji7G-7BPDyqzD4kalNQJ
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af076d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cV2z5tzyjUHL2YBgtoMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..4c76c820cacb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

