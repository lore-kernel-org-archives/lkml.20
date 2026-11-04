Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819829;
	b=HYo8KztDh5Sgr1P6Gd2OMQto5uFriQ4e84Vn86DDZCaiZsIGFmaiJ2OqA7v23JeRFDf/
	 2/AZMEOnffMbQcbqCxilTLqGvqazO/fysXhtyezZK1YVIt96/vZjlJkZziJryYheaR4R7
	 VXnvoPMXsgtZEcxUvqE9E5bi/b27aGzO1DDolUXsweIH44LOVNoVY8hPvHji+t9PmwQ58
	 W6Ap539HEpF8EEK/MtWayiL/isJ+shfOhYF1bXONTufz9DixCOBBgA4UBWu4eYKaLZnjA
	 7qfF+dzYQRB3z6c3QlODyqCCbKN+Q51n1CjhCoSOMKG5n01N7AJbolPCSzRmJXkg51A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
	b=Tok+edGNKGcl087dHYgLZuxwE6O7mUA8zqVdDdyk7cOAK/Pj/920itpaSlJssA/6pS0P
	 XsgfKuFUQGdHLmxEySNrWCfKU95i8weBb4vhPgWHfHF0SfPI+RQ0Tigf1mf1NH5Y8g+Ul
	 AHB9wNPycYvvB92h/XtiV7NcKC1Pu8qfDcR/9kp+Ig+PhZtHU3JlnqTN6XlEfAC6Tjs1H
	 JVo4fWNxGo/cJVBBS954Gi8LvCokodRaXCICqVg7cxupjzt9Wp4E3SPh8u2jJq0Ija9J4
	 8wcHR+G/wH6Kzvf2QyO+0EXRiHRSVAycpr0VxOyFCvPCgfsc1cNZS64x4YTguYqwi1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j2H2B3Vd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqKBOa1I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493B606EE81
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9493B606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j2H2B3Vd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqKBOa1I
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Icct22286041
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 19:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+Pz
	cJPwbQKU=; b=j2H2B3VdIVShuUdohZdNELCHvIJZD2w6HtvgwswRkyUJvZlaGaq
	KBWEBFJaFtsGqoKTR2Kziz3AzWJ2XXCNbHh5Q4+D90i3P69vi3O8gs0CPTU7gj2k
	DQwtEPyyWAwb/05xhAHk6dK84V5NLvqxK+J4Nb58gde4qZdjQkC8OXRfDMGaenZc
	g6PMnJ4cUVmsNSLMeidVl5OTUoI6I76QniK1Z1yxcpca0BmClW/2nRYvN8b+hm+k
	zMmzyzsQ329Jm6Ukom0PsuCNnnSArvf3j8O6jLwOYcrUH4kQnsdlSFyd+DMnr4jj
	RPxUFGfSPTvfoNLtdw69ngSjWtjjWVpY2GQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tg5nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:17:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc175cb172so859855137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793819826; x=1794424626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
        b=hqKBOa1IsRTRWzGsScTHCuHfXsOqaJ2bCp5JVLK64tf8NrM4+dVDrSkY9tbhip0Bj9
         yywFhfojiPwdw1aWImMgd3/65CXIy8L1pfHtGv/s80eU+AL+5Mi1FKBjOdN4Gzv7O/zp
         AfNry3kYn2e5czkyDyGa2TcBztelQx2Np/mgAK9QMjMQZTsMkyuDP95It5UTDmNXsRlH
         0PmIRBCZpSe1QnKI81rhzgVSsbSKZQO7JKMTYe0w2Z4idKUEzbMcYwECrJJfnPfzO1Zc
         XSQ+DF528gqtc6v1aj36VKct+3qvvTU3dAX9eq1aYIpiYRcLjXTRZ7IqmjFMR/v/vnub
         8gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819826; x=1794424626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mh0i61JUMejWj5g4lzHJHmLHyWlhp6f1+PzcJPwbQKU=;
        b=P1M6BJGjixphK2ns4JFRN5IIbPvok9rkuzGhKLn1+wzEhn8YeAVHbloxWqDa2v5TDo
         8EPvFB+Iz4iTFuBInkU8Edl/m66EYzVFKyWabmx+iGvBUoqBBJnozChlNcWsnb9M+4b+
         XbRweD+Yv0DEiafMsVN3DAk4o7ULPsS3pYlqbjnR2nXRBQuiE7woEIQED2XjRbsCLDsB
         o8BXDUjzxGUP1ne3eDc15Z1n8pqHSaeWAZ7qFu2yeT6fMaiudtVLNHFy1bj5H315HQrz
         Se508/6waxihuFW8fHOyA7WfCZwvQm9HNCC6W3Ur2RBPimWUQYVp9BMZoVXf1kFqKldd
         Ln5w==
X-Forwarded-Encrypted: i=1; AKwUvBya3BNMzrtnlcGuq966xJsS0juJholCTbO97Ax2w+saPWhRu0uZ0WbPvjYWZ11DIfIQk9F5wOHEKdWryGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AFJ4QuBOlsZ3SIjezGQdrJogM9gJddjPcxi2lS90H63YmCK4o
	CIuMYq0aNtivlE36qHyRvOuNTtO1eVShbWJFYY3mXP4aPMlJtgcqTDT59bTLy+tmn2kes64LCEc
	Lk5keV+EIM4DGVjme4XcUXeSkDfJgfjkqEEpeahSbo0ZSDrhrpKbKzsI9qUqdOtbplC8=
X-Gm-Gg: AYBFou1Mgh2B9gvBKEoFUFH5ccewb6tykEGBXauGsxStFl2pMBX+UpZb8iJPdvnjA6h
	EBdrWhhCYZOQ40hgzB2cS3gRC3Tu1c1BieMlFIh0WsIdBQWgvF7mUphtMCv6TJVKkZHnNGSitWi
	d7jZUIJ/uKAes69UKpX+qVTAO2Sy/DoPrjozxq+gMCmvxcmp0sCMFFZGlaVdq3OPxRwkURtFn4j
	cmMbmezPKJmhb1ljrgJpYBUZYznysMp//cyoG2VTbLasBYB9i2NqOAzlfdZxEqKP0VYYVrcmS/D
	gvE/ogezfx5tSnnKOYwhkeYnWxjSmQic4qE9zykOM3jUfhaukgT5EDQFMaxJXQcnF0ppVNIBXUv
	2rxoIJdHsSDhMLfSCtYPmpi1eEgdJv4sY3mFSJ+6VI1oQgSV/u/IFOtj7JEiRBA==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr7579652137.27.1793819826317;
        Wed, 04 Nov 2026 11:17:06 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr7579640137.27.1793819825861;
        Wed, 04 Nov 2026 11:17:05 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm51276405e9.1.2026.11.04.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:17:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch interrupts
Date: Wed,  4 Nov 2026 20:17:01 +0100
Message-ID: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=A85EQK2rUPMA7hLoO5/FtN3bhTj/OFDlNXE8+ADzmpc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq64Ss+hPorLiFM+X6gXqF2aw7di7XVGZPHtluZ
 HH30LaSx1SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauuErAAKCRDBN2bmhouD
 19lIEACOFKHpb4d4Gd6DXD/mhgWdzmrfCFyU0rjL02uSn4Ym1UTtgoji4iqiD+388NCWCh+M+Hc
 Zt6mrEEbXOIqGmmRfyZkUs8ho42itrJkx5AMroy10LIGJrg2hclfcQ9s78l9ETMI66DmAsZmSVc
 2UgaqZFYM9r4jK/yMyGaZXASipbZmLcMrkqZmZIShaY95u2jHBPdnqghFlSPm4R+snpvC+z4eUk
 KOeQ1bY5wiAZ3SklfY/1xG4mC9adTqc1j716rCIor5oEetb3PtqGhEHG+RvU5zvyai8aP/XfTbw
 mfX6AZ1TRGiHZRNYqm0QI6mSsm9HOOfddg9euE/EttcJyuQknwBRMZYyYLLTbr94K2WL/mE5r5X
 kf/17MsxO6FuOEF/QprmVuN4+/haEsUt7MOVrx9afUzJb0xFKQHLgCgte0UQYg2d7RHJ6K8QMX+
 ArfAQinXMdJ2ARatJ5yps1NC9C/VStggBSJpZSEP8gXSwocRyXqjxs0TtmbnRLTS5lKk29CeHpD
 XHs2Pib9JqFeaTZpjulwHMAfzKvCMd/5XrLO2H9XIArA/IqrBuraTJcUbYd/MWLWsgiyOOUDXKi
 J7Sg/TXxMuabqiAOSZQ0Y3VanoGLqOsPP+tWoZaTplCr/eGEGrq+ZmKmFuvO9IuZEAkWrBPJpj0 HK1ancsV1sbM3iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX+KOM01mPg6hP
 bItNnCCoYTQf36pVwRrFbIwEvDgUw4WpvF+k2ygvGNeZ4GI6PUUbPglYgEEmgwklAOLiGoeU3Z0
 J4U+vxKbgHuUW9ZIJQyyAyYEVN4AFPs=
X-Proofpoint-ORIG-GUID: A_xgOFJXsxBeqV57hOg7KH_-PoWwSx2D
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aeb84b3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvnITNCCr6MzWQ2eYPcA:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: A_xgOFJXsxBeqV57hOg7KH_-PoWwSx2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX6C4C6T4I4vhL
 4kS9JZxAymtb5gW6dKQ/u4EknNtKcrJA+RzQhciMLCFVE1RAUGYDqP/5waGHqdZKRRA2soSfuTc
 OIiY6xsbDvU41r0AFs5FM4yo7Cm9UtWvV7t2PAwm4cVOnZp+B3FWB/QVnUqtIRiYvPtbe28mK1r
 tlEwEs/LIjx1e9XbmZ9IrGSviBNbt9f+nIeHg1G8Nwj6eTY7RbQOo+tU6H5Kf71VVBypcCeajk9
 3Iclh2/WQaU89T9bdc83cwaytUP1jgjNxz1QE22MJtslgg1boXEaulk+Vq8+QL9ThHRf3gWrWg4
 tZUCxueu8vzGeToCNzm8A653NIrpX1P/GVCNrkFECFWUJhCj7rjU6Hsy3dnCt6hWmAVA7VvioTK
 lmks7iWDvHaIxObVERGi0lUPyxzZ/GUALTyWNnmoG/BZKuqbkljHLY3RruuLxkJOlE7u1MEdQ64
 DZmV/sOjUuAt+Cmalew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040076

Interrupts property takes a number, not a phandle.  Passing the TLMM
phandle made most likely the interrupt as broken, which could affect
touch operation.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 7ace3540ef0a..63dd5a1a1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -385,7 +385,8 @@ sideinteraction: touch@2c {
 		pinctrl-0 = <&grip_default>;
 		pinctrl-1 = <&grip_sleep>;
 
-		interrupts = <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <96 IRQ_TYPE_EDGE_FALLING>;
 
 		vcc-supply = <&vreg_l18a_2p85>;
 	};
-- 
2.53.0

