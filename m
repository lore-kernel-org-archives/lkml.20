Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9424AD7E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685795; cv=none; b=STomZG189TWzLoS6Ohc7WbZpqFZFWFmoSUNpXOqzmbdWg5BTUPkh3lyB++n2SQXvE+w14y21rzdQCTcS3gYl78M6MRltaLDCIP+PkWYT7ynpMWvb4Xri2RU2Qp1AeJT3ccmSdlaiEwuJBdxuFXh9GXHxEYlHZAszAjLrcLyCFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685795; c=relaxed/simple;
	bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4owDD36RtztuMX68rz8CC7v4T9YCumic2gR0/s/5zYNDvTK5CGn3LXjE2eKZONBlkXBeSOnJbq0e280vEZw4lP0y5hhR53G0gxXxVj8j23M/N2d+3jXa2GBl3SsNw1u1lcI+CxDUV36qTLc71bzTwNhmE+5G+grAP8V64CmSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZMepdNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYiUr0z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZMepdNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYiUr0z0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG5r92710935
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=; b=jZMepdNnQHPlWfp7
	/eD7VWcoFsNazO/PCdEXpvvI+fDrLQsGWRl8KShHMrFPSaQmQixaCEL26H2lzE5d
	66oOXyzAfD+j3tFBwbhzycez3avWc3wZftAQKhJNLc99fwzjK3nENz1QV4dpI397
	OmrYnN7AOJreJWtbP/aCvFlYgnuVf2w5M3TjAZbExgB7NR+cBXyP8ya5HQLEOI3x
	HO5nrnaCNe1SX3PhsVKaUkZc60DUcSCA4+k7Qa8o8owQVDqoxNMqMUBqTKUkvFjQ
	E3ryxk2NJnsjJu6X00vnpKHZ2kobakOk6OKQbqHisbjeGKchj3y/vCHGxYy4eqxh
	44awaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97sspu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso283870a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685792; x=1790290592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=aYiUr0z0LUlCOEWFJWkYXwNAAoheOIrP2dwSntECyrOFHhChCfcaQFXDTgmGddQwdz
         KJDQf5Wj1Y8frwuO06lmGev7Jp+AboN1Se7XVHKxC542nTFQAdcWQ6HFNgug0g//hHR/
         6nVXTOf+24mX1X5ZMmdG6AKvuEjpk8lao494yGXQvHPjVY6KQX30EAj7gPI1KwQXaS4Z
         fKh5cUks9bUwuVfEgqknYmBqZ+4VqkQAEW5iQ1AxkpOQrLaZV8dhVJhQ02NdCdinuLix
         7JETid0ZT3rapsQWJ4mOqmT49it9J2X9eZ4V0MQi+bNx2nMAFed5SpcRpD9tQ4EtojZe
         sZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685792; x=1790290592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=iPjHLRkstUTzUh+NiRR8BVHER4ms31V4peB82rKBgJgefwPLpzVBGrSQxh9mXcSpsM
         a7DFVNLU0wo9eZwe+BYSeSJrCTmhqWPMEe/0BE8dXaqkWYRqwWMwTQu8yvzzQQUkIeda
         GZ3gNetpkh7U50wHnKxU2WI8dWMiXu+HElsNdusEsGYXJNNpI4FXcKJWwX2ImcUZ64Oe
         hPT/WW67aBt8h436AmzAC6jeiXoLNRbr+8aZfEDwiXokNCv2/CLcPa6vfT/lPKouN/64
         0ZNpssdH+X2KXUyiLSljNOimLDGk6O36PpOl2XTzUrgaWzNfNWoVVhX0M4Y/EIMifv3j
         sDoA==
X-Forwarded-Encrypted: i=1; AKwUvBzAZlt6aUWinBoatsbpA+DBebQmmuSzjBzolL0sjBVsnLLKpcrvKUgvOkrU59n7i9E0oyUcNlbVu0oygAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kqhG2d0sNJ3rJYoOji3CYnbKFof8UFBgtX2CxqPNgwn371GPM6
	sbtbdBmZfM8eSo+WHkSuR05xtefiyoEFw4Lc1vrQSuodRMYFcOidw/QLRnTkWx6PoPDtBf+sHws
	f4XZrz3zKQVvyx0TNok08R1454K0cep67fCV41vPsqfR1VIhgC6bQaEQFGWy8uQOcvDA=
X-Gm-Gg: AYBFou1fOcGFmax/vNrBk2/BAvzltdW4PXIMQi1OMad3dqP+UZopQiQTTUYV+5iDPD5
	RqV+tvQLUc+UJX2KPjfrozYPd5/M5yYhOvcORHXkzrvvsSp+D4RmEb+UMeAolJ+Dt+t/ldHj2gq
	mCI94pttSq12v9iBc6SdBsDCxq2+pOwR09BYC3avRy+eDbqx+3DHXmoCLrkidFxOH6D1ooH21JW
	faS1e1ufJgj+Ag2qQQadeJLTeq+KOdunQeuxEtJMKcYAInSWWO9PX3nnzO3ZIW8peYCeZAGEOdT
	fLUdkMVlGdfoX2PU6dli9FEJ/QFkqCRD3CVesx+dg9hDCh2SoQJxeK+E0amRHiM0x3t1VQqUGoT
	aiBMEKQ6p6Gr/y4B3xfhFjVyLplRfxP1HFYZNxO154W3zd0jWkQ==
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267901a91.15.1789685791791;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267874a91.15.1789685791376;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:57 -0700
Subject: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=746;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
 b=qt7oMd5cieO9tBGCHfxsL5Y3SMPcyQewnlHKqaYhCp59AL7QHCz4Kd5e0fL1RsGXRpuU6UHP0
 ksK1xR5Hw9qAFoqa9WBQpYsb+g3biaoLgAEB7r62smDxGFoG6dVpub4
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac7021 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eVtWBnz9pTluID88zzUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX2aud2PGLE0pU
 wRt7M6e9rXek871Sipcx75pSc21aozI1SmSZ9vV1rcrdybQqgiGOgLZOoBOixUyUEWSW34m+Bbw
 ncJ53TUmV9Z83b89cEOoK75jekqUX9TfUMv5mH8UBX7bgP8ozwqN3yOU/8tJU9RsJWBpbKONJQo
 tKM+xqKYywQM8vgp7AUNlo2y2Arn4iYDiI9R0jG7xRogy3uggQTnwM0KjLgV0G2uZxMyOUait86
 0Y9ZYoN7or0PMtgw7AEL9fpfxrkwWv+yd3YSERUVcnPWTlzc8L7hFw/pJzTBSt5GjWDcMQVnoCq
 oLN+9pOS94J1fYQO9+EHZABdFZb3G8jG/uy6eOjx7u9LUEkdpcB86Hsiw01qVtTxTHVKfKtZzQD
 tCHPyJ4V1nVn8MgJjTKofwS5Lyl7kKo9fWt9MYSK+gGpDbxcDooveKYbyKhxa+vOAXwnzAOrmJC
 hCTBWKLkWja5bIDH+tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfXxbQTzpyz51i9
 khWS93dZdiAQ96BNs17hf16cdZ088v1YE4f9WO9kILJPcBat5HKZGRwbiZ6pnrA0VaX14YH9yUr
 lxkY0pfDikERTT3oUwepfoMMki82mLM=
X-Proofpoint-ORIG-GUID: jTaOCZSbzFODMJInLB1NxGOAbMPxMSLH
X-Proofpoint-GUID: jTaOCZSbzFODMJInLB1NxGOAbMPxMSLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170330

Select the corresponding pinctrl and pinmux generic Kconfig symbols
when PINCTRL_SCMI is enabled.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b..c93f0bfcd7e9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -532,6 +532,8 @@ config PINCTRL_SCMI
 	tristate "Pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
 	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
 	  This driver provides support for pinctrl which is controlled

-- 
2.43.0

