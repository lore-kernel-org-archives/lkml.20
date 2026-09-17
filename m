Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6374F30E7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646174; cv=none; b=R5vNngWtI1aaLML4FtUzVOKXmSW8oLaRsDiCMT9uvJ60cTG0IvywfioDVHXHWWzQ45c4zOka6x2coRvr6PUZErsANZXioCJnzj1z6GERYJ9MRp11xAN9YQ4LNpF+M0UiG6nPG7mkU/C9Y0E6s3QSTHO7in+oemuz9IpNr7HYJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646174; c=relaxed/simple;
	bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMDJKCnjZW0saw0ZZ8cQ0RsRmCVMPb2NWFkpeUW8/W53WptZ4dIqGJ0s7uo48Jikp7bfe0gCv1r68LA0cXb4ueZ/zamaVfNIEmnjICW6oOROSBp8TS7nQ2B0g/72BD5CvGl/owuRCH4bs+SLKYOQLsIOJedqkmOJQ1gqYnqXSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYHV+jMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CU7wIii3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYHV+jMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CU7wIii3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zn6x1258882
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=; b=iYHV+jMhm6hDksG/
	BzlsKGE4GOIiCfXvdbYSh4svYvQ5LV1nCRZPwdZ2G+tIwQu+IykwxCw9kB7xTfnz
	bfKuyPqIdTXphINydGn7nQWAoowWuA3nl8BZCiHa5C1pkEvFu/05L4hm6EEW4RCI
	O48su0JQY0MyvjQjszymj4eEQgQHLUopLb1RP0BtJpg8bv/j3uI99LqiDtSThh0S
	dN/cjY+QVNPkaIV9swStK8uB6HKz1W9Kxkt+9QzQX0xwDeuiJzcHBM777IuCBisR
	dI7eU8npMPTslI4GbzgsSroLGpI1tolQ50xvMoxnSOGpByHQYIVGXdBtDmiYTqQe
	tZgwpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgkrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so943749a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646152; x=1790250952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=CU7wIii3BPIYJIaON2ZCq7YmsvYLOpnk0yt39M2GTWYszg1QHLRRZoB78ArV2jTxiT
         3aKrKrMTnn2q8A4DKOIbXhh5maxWd9gN8ZjtFtPNxzyDuO2Q+yJU64lIzKje1sDDd1Rg
         KPfSMPV7kTxuGPwL5lt6bnUX3HcIl7jj8fPxVjZnA8WxR/p+3k6AlgpKlZXGuSTF/bGJ
         dDeeqTvSsN/DlW1vxMIgxnj6rXIJYZ6vAknBdqKvoEUZo10rFN6xRjjjPPWsLPWzlBSv
         +q3X1SrTVtTOEpodHKkM9JK4o0kIJRYmfIfyOZevvT4anG1h7HG5M+w7drJ9ihODNPne
         0GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646152; x=1790250952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=ydhF+QpvLwVVyjqwS51nLWRySsELznchlaeqlZgCAAD4ndLopaFuvzMBsFckVeSI2Z
         aAo/3ca8DpSAYmwZ+o6Dbta4s7oO2sSNqSGuiqigC80EhahCPzXZR0IvCm/UEmGBu+1D
         fYItu7NPtprXlhDM4RgEhru8mDsvrqwe6yPL2GafSnMAFEqPbls4etKr1BHYmoEhvjry
         D503Z9f1YT8fYN/IvH0aqyfJ0YKJBILnei8Mf6K0xxj4RpnaNm6/RrbnJzTjNwwCFuF2
         TUOEM6Cx6Sz/JAfJWgQ6x86Qmzy096LreoRl0LLxM3g4D2niAKUPpKxanalQKLO026UU
         0xDg==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZC84XFL/zkpHFsiNCV/jlP37rN4KRR1njgegU1kHXh9RxUkdDDpiJhUkqO2gN764Zbj489nuMpVXFpI=@vger.kernel.org
X-Gm-Message-State: AFuF++keFiWu57UI3gPaMxR7lUszxiao8QDRTxjqGv0cs25kX1+swcEv
	jcmI3IJqWoc5S1/3a6EzZwgahfcXbHNdlsvzHA4W5vuXjdklwyzYCqU+QCJ+l1DB4DQEy5yZkL+
	OUKZ40hB78WsHvMgcyYYjlRkVoHBkzkp6RtfZu5yj7NyFxFTr9DAdQUcnBjrsyWPRD30=
X-Gm-Gg: AYBFou2lawjVUOHYrFSL/sX1HVW47J7PvWkQHA7ibvuklcjq13Ayz9WxRXgQKrDTTMr
	BdI12fUp57v1AEUTIux4zD3yz9jHESO2/GqjupWR6BmZTFjf/pOCNcYZDKUddLQObAvDeBfqvZ+
	E6WCpduFpvcSfXvQMqEjNyBtCjadgrBkGmMqmtHnau0BfuoIc7Sb3HnnYQNenA+5Y/bnXYU6vqR
	G480j4hiuT23leCA2r2+q9U2QKDxpKqd5N4YMP/RI3BPPi75vQ3lzpjexK40MI5IJJYvcv3L6Lm
	I85knjLF8t2sNToeleuXPiUYtul7de+O7HIgNvtkxwvU7SRlAIlJ4EtmYA975qpU014sPjsKzVA
	hdpdGJLzvrFh1rce5ppUYgdXMkVqOj+AYHQ==
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr15909453637.10.1789646147416;
        Thu, 17 Sep 2026 04:55:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr15908982637.10.1789646143537;
        Thu, 17 Sep 2026 04:55:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:25 +0530
Subject: [PATCH v2 17/18] arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE#
 GPIO polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-17-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1146;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
 b=000j0/D/aobzbABW/wojU5I6SxrjFzYAG43EeIJIZzoE9B58BrpmSN4gognf0nvqn+NreYSLg
 2ssbeNsLhjDCykymm4hKgwKBHXLG+NP0VBfUAClQvES/U7SaFR3lUtA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/dpbJ4cPlzA2
 6pCH3V3IQZT7K6FHSx4aljpRs6Ywrvowc9pMV3mNfVlQF0n/dEYFjJf0DSaMIBm/WOouJlcXUyi
 LTVcRgntTCPMNVfJWUHHxIS4urHE9lZJaEzAvZHSZyjRtZmGrX5HZRUFfk6BQbpw5cuujC/UqD1
 UpWDoJ+vx1ajAUJu3Ny61yGf5ne4VAHSD7ig9dAFAYW0nLKltt74b/Kkvkeiq3ba5Hv4xWFkXVU
 N64QzDDc8uqObhxSTUJOAyCIbSax0vX8CvAvD7igeynT9nVJvrcbFNoyidWF3IWbp3pHjPlz1sZ
 V9gvd/ee5iQ31W0Y+EcRSS/3rMjIYTbtLxPbRXns5uDlJ0gjE57fK2Wm2NANONBLD6YOFnq6cxa
 BQBE/mqpo4sREuEcrHjl3JTxR0C/X1y+bv41xZHtSLMHDR4NpPxPbV2NOFAtVh/cSyq3gjdxld2
 p5wISr2Difk5xs1pWlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX1528qc6/jOu1
 aa4duX9m5adS+BrAosv7Hz0ElJ0fIuai/UlmeTO+7ZgEHSx4D6wA+9vtU1zS5cw+rfJXB6YcaXY
 V4e4Ykw7oeC+CiAQ3JNk+FMnefMNJhs=
X-Proofpoint-GUID: -SWzgxGbaB52YWC174aVB63iKGdSyFKF
X-Proofpoint-ORIG-GUID: -SWzgxGbaB52YWC174aVB63iKGdSyFKF
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd549 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index c72faaa0ae7a..e85d78ecac2e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -374,7 +374,7 @@ &pcie2a {
 
 &pcie2a_port0 {
 	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 };
 
 &pcie2a_phy {
@@ -397,7 +397,7 @@ &pcie3a {
 
 &pcie3a_port0 {
 	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 };
 
 &pcie3a_phy {

-- 
2.34.1

