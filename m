Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD044E36F8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059270; cv=none; b=uIOhrn2mQnY1lInlVc8mGi6BV9D4aDRbixo9cGcGlJwcXxMjDrgoeqAiS4YAjozskEITowAQX6bGW06J8L0wT3KofWTPyIaXnMxK9P+M96RgdSTdL95eIaeKSpYO4bDWvftiLq8D/i163g5TjH0pJ6INpIWNPoEU0niB4NY4w48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059270; c=relaxed/simple;
	bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QycDKjH/cVp2jLnc4AQD3CSvaTmyZTmPwX79rMC1kRblg/L3ym07qXOUB/VX5zGZz/HKMQuphIxl+AhxPEbI97OIwtwzowzrSanu7nDITXuS2KuTd8PpkDjJgGj0FwxHz5Sn4G61bocwk0gQ65LxY332nFaL2GyiJnxhb+j7I3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnutPU0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzLaH20X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnutPU0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzLaH20X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0enBJ3044357
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bF1FC0baVWF2IIEF+LlbyK
	xiCAXSPEf/MQwu2ywUz0I=; b=FnutPU0dG7kgoOC0Rw/CZ1wKe2BviFJf9wmG2S
	ScnSjNrNcRc2E/A9QPH5ROPRPNN74kyxXZcDsetrgr/QiSJAerqOgiF7xXIAHOU0
	QVOZhHPaSruf7h4kE1/ZZSnWGxt/4qYkxH1Lv3nzP4U8YgWnj4zsweYXCAEPAFUX
	nvMQzxBedwzwwcJCbcBaMpIukcJUgS7bXcXC2hSNb+sFvhFi3JRVqkk34ZUeQ2Xg
	fe4POaJ2H/ADK9yj/X7VoEahNKsZsqYqbA1JU6Xvk40PYl+WU+lpQS+qZPIbIBL6
	akUupz3bTKWDM7fg6wScRckM+BfYWfWkValeCc1mq9WgQi9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbas5c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1573074a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790059266; x=1790664066; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=LzLaH20XNgfgHRKjhJeTmAqjeFCAiUXnHM/tgZOsfMEiCN67He7Qv48J7UjppspkgY
         RdOJbLJsZk+9wbtXzNlIeI9n77qeGis/S/tltlxEPdfp/1IevRP7R7NYhmC6VNyEZOaj
         qYst92QRzVWczRZMgHRtkg5aeqWzvaouiRaJd7Px5Cn/ObatodLHqcWgZhgCcro3aFmm
         fQnLtoCuPZzrq17wbbUXXn52ZC1sQTbaEblKRSUWgHDkwqhYXFeL2yYChYjHtMRJJF8W
         Muv2kUFIY7pYMLKHMQu4IJwnD+zRHdd/7vhbhT8SobkX0tDiaLhtaAYc1zM1FMCOs5FC
         Qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059266; x=1790664066;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=pGl+30x1PZ2OwPLJH3pI0bUo4o1IyDgFiixnuBbJ1qWASjsh2IcNNoPLCDjckYwPga
         AWKwYJhc8KNWXxyHSGzsS8ww4Tcj86PaZnXmqXcsuGlqsFvexE1K/XI0h9vpde0RNZx3
         3jGJAZmdK9trlWeBM6H++O7f5a7KKyjVKC/VPPa/5YQ5NVJpZmEzLoR+K4ZGYfAm4mnK
         6pw0ZImj7G3QWR9NFAhMK84rdPLjHpFeL1HhNEkqYlRPggFWgWYaRdTAhrD6fEj81PGg
         uBfKkTWntvZSNj9YCaBzFRUK/ZruyAFW2ZUnnIWU7BgtahL+rWt0Bwz7zJ+Qey/og7z8
         dpNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVH7dngFoT4tr+V5orbL0yK7I+jt7tnsRwMMEHR5eE/hmdDtkJ5VCg1mPJrwGD6jphOBRbTF1K6CA2Wr4=@vger.kernel.org
X-Gm-Message-State: AFuF++meLe6TLucuR/2j64oDlvCwumZKo/up5zHBUcP/hRdDzTDKlW6F
	xjEghGnUS/TZh/kWbh7i3jpzDuzi2gzAWM8Nha11N5dyZyTWVxZFY0lJSibTf4sPwJQ+SXCh0sM
	7sYrvlGxTcqiropdNhgJyNRHb99Kv+rK48kIIgihAlsizYLufAkXMmkaYQuaWziGLx3Q=
X-Gm-Gg: AYBFou0XOXo3/XE1D0XLK1UGCCVUphD5X4gBQ9vD7WuwWPsEgcDY9r+w+VlKh2L+4Rj
	9g8ey1qB8U/UlR2YXfSswUH4hE7u8Lh1Jl8brRtMruAwdyGQdvQAGkvxCGf2DhKvhRlgxU51Az7
	Z356Y8WyRx/VRk01rpklKGkQDzif0qwREFy9yhwPd00jl8n/pXt005EoZAvySsP3Ls7H822Hj25
	tIZOwy9UYT46z7BiV4icOUEFfUPcsqmlatOdosgBLgWjmlGdOE6zV3IxR8SLP5P8qfKjTRpBa9+
	Ut16N9JNZZLMpaU6T/nOY4KrUOQ05YWai02vS/RzyIRhodL6kNnB7/tmSz8cAyFlBi7BAGeLWEU
	utxEe6XFuJ12cV7qONYMC8giIgds1xaY=
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230951637.41.1790059266459;
        Mon, 21 Sep 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230931637.41.1790059265981;
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6131eb19sm2655870eec.27.2026.09.21.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:58 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPkismoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3fScytzSIt2UkrTMCl0zY0MTUyOzJJMkAyMloJaColSgMNi46Nj
 aWgC5+nnIXgAAAA==
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790059260; l=2058;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
 b=xz27AUKgWmsq4cpueoiNJUMwVqgqR7+PFLGu/Kha7alD9Gla1nUUTqijulaH493mGZ2COslfR
 Ll7xy0d7Zv9DZE4K2oY6n2ocbiuKWU0nfOOG5JECOs5/w3gi9opuvGy
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfX4wp6ONvWRccy
 VBmWbmM0R3UUgsW3Wm2kI+Htltc+wo7lami5lPalVsrmlSpEaZG0rGpXjs27IdkqaTFEKs02W8R
 LG0jK+rgfNs+nUul90YcuErznr980GJv6PV+w346SqDM1VxVzhVUbT+vJ/lnf+1YnJwr5gHwDRu
 NCij0MQ6hAMuUP7SyuOYGlR433/pJhlDE2ZMusehG0Wj+zy70Fc8vsgGmu2mPvukvO/gmZ2onnQ
 aqYHk7ziio9mlO25AuPW9ErPht5b7ZK1qYyaSsT4zQVSwzvtTPcxoeZ2zuzrLNsjnGJxOMBwx3r
 aZwsC9jsQV6CB/UjvkqeeWsLvw9+YtaXUD8mSDB/0Ef3trGgnuUYdOARgVWqJzYTWGDEnQjOqWF
 gaNGHnKqTeW2oql7tBYzx9KfcwAEkSZPIF7oD90lQaAlA+mBnQWNr43Un7b4Ax9YMoBY/q11hYt
 4Tc4cN53skQcMnxNPtg==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab22303 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lQw7s4k734Nnm4ZOuq4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfXx15pbSMc0eLo
 SGl8XGvcNHa6FNmUaizrTjK4rhFe0EDCWwug7U2r6JQQ43VjHtH7S6yuW8BjSugydNZmpmMvscy
 CDNROPLBASezfDBaksCNDRwA78Z/SOk=
X-Proofpoint-ORIG-GUID: FWiP0O5lPwRBAR3HDZLdzOhOmc87Vpr0
X-Proofpoint-GUID: FWiP0O5lPwRBAR3HDZLdzOhOmc87Vpr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220094

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..51fea666efac 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

