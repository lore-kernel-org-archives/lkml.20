Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9446C4CF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778297; cv=none; b=EBNnRmrFLCT61+ybluJ8REVJbA02Lafew8Iu/EJYDnAyCUz0Qci01/4t28GapV+KoV6ubxcbcGRYIpGl/8sY6U43YCoDy710/oiadjaznr2wJSSXiTB9Ek8XJQKvxe/ocXPlzDN+eUuZHrY05smmtJSmryIXu39XuN43Ljcpnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778297; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEXuK6N36VFnXZL4vo/tR2sEuoFIm38zCjOEufH3Rg8IPrHHk/HsFdEON/66ssfxozbU1/LIX3iVmM68TFRkBs7YkqONhdL0Y4OToyeWXMWxxOFu9Q8d/PiGhC/6LOkTz4495Xd0lFMg+Oiwme8baCSKd8nUP2DBYp1RXSSRQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnv4DWm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4PhuG9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnv4DWm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4PhuG9z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDK6004214
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=mnv4DWm7lUIjYC0m
	1NpUGTYcRsRUhjgsEFdcrG60wh6k7akZ3QUT8+2Xvdb/VspS2uaPdXeWQ760SaAa
	KJW8QkR3JI7OnNu2LNaW49ydQHuNnm8h+g6rlkQjXlsyCeHre4gSIGeAPa+B5vVM
	SIbejZRUQjORITbNFGCE5Wcu2b3MLpYQ2V/Je9lFtOITNZdnlBXzLvnz0u+w22HI
	o6/rHA2xVPQ5Zk6sstDb8ZQ7JdclrduyJdnyr9gWAKgfHh5PHBr0JzBEMiAnIdRV
	EGv0XksXXUIN2I4Cu3ZBXPLmqWugV1zhORV3hc5qmZ0d8Uy6LbKfSaDsuQ1YuvNH
	7c3Vww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0mx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so654243685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778290; x=1789383090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=g4PhuG9zqQYUVKYsnYtY6qdL1nn457/SJwNd/qFjNJghDwQxBorywWasQvcUXz/Nod
         wDiCRokNb48H32hm4rVU7j0EzxHhfLdmjy1Y3jTdOzFd1aEBOwcH7HXiHEsxo3qbpEjZ
         ghA13ylhhISJXHDIfErNqldBdlSehvOp4DYaADqyqJkLaIyeJjG6xWdeySETmzsz7Jbx
         Gd2wikG5D8hB0hPWjitH+SU3ApeJPyXszsLxXrMT56NDA8PoUAIzJAg77tlPslR4EgNo
         xm4RTYAqh9GRLR3m0r/plFnwQCAuq8Pod0lzS5PaDyk28XSDJyvf7d24ZLr+MxhP7GY5
         UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778290; x=1789383090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=cJ8lHuMU/MvdBzgRtilNRiUWSuDz8yHnKh43bov5tgYHEtH3YHgwKEQfP7sdyWqGxK
         OZIWoIV2SdxXpmWId0SYdzvWJbkmy7fQ2qZXpDTsgaMwXBEt1cDLvSMjAeZ3Kr8id0pz
         9W/B6LHGBT3F/bb460iMarkfcxSAgL8EXPko0rE/qbzAHqoq2z8UtxgO+IJnqK5KA304
         YpN0+OxyXR8xzsCBuNOWHMjrZhZc3NQcyJpMhZSEtdpCLqC6jqHz+PK/Q6zYzaCdx7ql
         CiR838MoH7aPaHDy4uBY99tiq9Cw4I72JuRsy+knmMyIlSMBrUcIDTkOnXmoLfcfeR1J
         egMA==
X-Forwarded-Encrypted: i=1; AKwUvBy5WaVxJyIXZXiu+CrDBDeEP6dvFi5IRRiCSgtT/g2uLiyud1nJPaI4sxybLSCeinsPh6//F7iHjC0xJ7A=@vger.kernel.org
X-Gm-Message-State: AFuF++nHMZsSOhmFibRalqH/+rKi/9IbijFJNRP2Nuc/BhGnjmWOGZGj
	ue89x9QbeHAiWgAlWhttnS3YIVYjUX84Xuc0YLakWaWByO816Qh1mjlo1+S5lvaQD2TyBmCr6z5
	QG5YpYEPKrxXVgXXxTiOZHzOMGEsX6IQM6uflfX/IdP67tKlNpLGt0AVzd/0FB1LHr2o=
X-Gm-Gg: AYBFou0lF2qJZCJa1GiereupO/DdNDu4Nz+rYZ7qZTa2DqeH9Jo5LggoSKN19Yi7PXK
	Usj8DSPsapgxpieREsnf2LpKRWtvpVtzW5LldbGz7kXOiAcyH3z8PhP2rn2JxpAeLmp5YCKZtfN
	BMfE49NX3psx+6t2dKxqz4N8d7/auUjFHo6xCNsbL8o+7Qt/k9d2BstVPENUqDSJF7+qxgYEb6Q
	wmWqz5C+YVGKzyi0hTkPAATwJ1K4Z3Y9kDT2u2TuFbNVo4SkYETQCo2JXFR+AKNRyA+PwpQ9A0C
	diS2fSa+MC5J6BJzQzb6HVnHeIPgkHZ9a4e/iwNiVpBWtawgmWsc/I05uPRjuHsiWFmuaYt50by
	qfuFkj3VJbNTa4GtPI0aofSH9vFFkb2ODaj7uUM8meA69WbM6oGS7BO9JgtL1YkZrhyBR7npKHj
	FytE9K+IXkdJrH52UVtGAyJEiDW2YXTMO+jvFKq0oP45BDGlSLZwM=
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002576885a.32.1788778290113;
        Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002574085a.32.1788778289725;
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:18 +0200
Subject: [PATCH v6 8/8] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-8-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX+pZOWsHoKYWV
 15hcK1zc0t18ZBeXHi/llMhfQNotcL0q5lFdxCrwxJpa/0inyZGrFN7BoSBQSPGKe2DposJyKvz
 Z23hUn/2KkG93l8Q03VfQAEdpSYBNvAT3lLp9/RsBKT+y3p2p0kN5aF//eGboy4vNexax/36XXR
 ce81HIHODHbpfF0ol16R0/cKLL1zV3xtmkP7aWY/wC5rwM20lRtMEMnyiCo363H4suXeGE8pthV
 q7pTc7AEbo+GdFf5CuO5L5TfhIXjVHJPCWM1iQvEI8i1LzxTAO484Eij/rYt8aeVFtYeoNSCn4F
 LEhe5QZS9zqJjrs//E5Fc2HidCsbZ44jV+sQ5RveRuGRMzx7dG16K5Z+/uyQxA0mMleJEY+5FNn
 QSDUWxjrS4DLaCabQeXOKrYOamS2aaDYVzjV2ItHMaVg3QEFHcXJBkBdhdPchM8l/BngLAf9D6T
 XJ/1Uz+NDg1dQN/6uDg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e9732 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MbgYVb7jTjZmLRyP0ZV7Lx0LZGEd0A1s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX+QOM3TiLuFlK
 IhX4rl6obSTx3hxPMTfBFDxeDnbTXDrTRmX62TGkkuR4TSoyQHjdJP/zRizAVPS2oJ2oExf/noV
 ixoErmcuvyQ7mKsW2kE42WWSRhDAEio=
X-Proofpoint-GUID: MbgYVb7jTjZmLRyP0ZV7Lx0LZGEd0A1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

