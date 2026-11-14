Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655858;
	b=xWK2tZ3jk8fJfmP/wIqCkqTEx/L3im8MKj5iewSr26A/rCR/6wIfoMMgmk6FVyutcAQc
	 W5sABBiquY9pNcBU2IN3NyLIDw9CUPvdYUA/HXUij4p8VEbp0LfahwDVl7PkwLK6FWQ3L
	 Yy/ssYzdnFcWCJgZ4WE0xJNOOwSrleX1SUbMiufEkmo0IwRJqnV48IkO2C1RwUArr80AK
	 doJXq6q9eO2Iszy2Nb63Aor5FHCtu33SsuNGNHUPPIkznTe0MLV+m5EDW/NYidqaSDEuS
	 0telfOynTdxzN/4iwxEOPyjGEVG1xj62VuS2JxS/6MRv/3CYml6hR119/4fPBLJAR3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
	b=G/McAATC4UdqDKrlMrGdAy0a1mRefpwuyDaXai2r3lGw+PAClIsYX6HsLB4CdG4plVXM
	 IFEDBcBJTAn55xhMtpxbob4AyrUuAmlQkB95iPsM5Ymu+asSmGLrKmitvnjwmPgGe1zDl
	 yy9ZKdyT2sET71KocJDXJ+qL8oryMT01IEyNRotU0Ew1X5BsdgT4vpOXntYqWB/NU35XY
	 07Yk+yXjCvztV5vOW9oZfBTURqi4yQpm8Du/kE80+hCie4pcuq5RGlFqJXULcTZP71AKh
	 SBe2qvCMuZwCGm8heaA1dtpqjPwGn7/8sNkW80eM9BujGi0tmD8UqyxHnJREj15SIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4E606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB4E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wHrK464937
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=; b=is+jw5w3FuItCwi6
	PB5nilGPbRX9RDS19eIHfUTmWjeWwtOiuzsjtMtiBzUhXYsXu0f6J9Gx5ufxZXca
	vRHBOCOydbv/BzFG1eo5U0cTLQsseAqR4CqZmJx7mkF39EYa60Yyq6bfKmWzNufl
	StTglC2ubE12WZDs3K7UGE7ahs6LhTygH7/ADGtZqe3rBfGXAzMCXP5VcWpO0Sev
	/z7b7aKFoTa/qysPoj5dyhOY7RKa+zBixU74Xfol2R4J0yZiEkbtlqUI3qjKnDpo
	fA1zU6JgKDwa59vbUE/slA0+7RslM6LNNQeV984stOJvpXWQ4zC0U4FFlRKRcdaZ
	+Ws2kA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrme7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f184f3334so38333416d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655856; x=1795260656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=Zo0tqJdWroERepjzwpX0jDTKyvivB88pDMMdsw8Z/sR230mLN3XUHdefHLUo1pgHkV
         DPPgPsGysGhdyeTwUnpJgQUBp6Na2Sf89D1ks8y7g398828EqrmOzeuOzxQR6Iu/nleO
         pVFU/UHq40/6UHMyhE5DeFifBfvKGF0wqQ47/OYqPb79vAm/VUM9pOSbu3NwL9yhZrmo
         I9uJv+MCgxU7FYGL+5/lKfQcVO15iMeoQIbtKGM1AaKU32fCQ/4VbmvNOYWYoJvcRjjW
         w86V23gFf5jcYB/f/1tePgJQTF9qXLpcqFCoyQmTcDIUGL7JpXhkqNwJuMx1A5AjJ+a9
         aKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655856; x=1795260656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=Qe0H06gykjYEPumTsgiEpU+9q1kvcY1tLUL//1NVvT+Y2tIPn5Ev27oHPUmobECYPf
         rlv0K9sVi25bCNN4Mr9d4vjxoh4+zdZE8k7Lr2ffJ4ZYFAHzxlaLJOkCYNyD0ICVv98n
         CqT7Nd4b6Zlv0J6+F8F4KJjXA9oVHgpPhS4Kv3sCyzrewYLlUjfXdNTYRc7pka1LHlQs
         2nl03qfKvDXxuNQoupSYuu3X6puYG7To6FPyBTXDuMr7rSTi9ejvIU2WuGCCIkWqF209
         x5nbq/AFiQ1lb3tVy+yNC8BZZPXJiGFJ8L7XSiLd+Xf9jMrSh4/uCRac7iXRnJkRb080
         v8hw==
X-Forwarded-Encrypted: i=1; AL+hErHw9rVmlTQCklGMjmkokkgGMDmB3D/hJ0j1wPeIGijmIaesEkfolZByvBYw24dU0i1gYyZLxJC3xpIsQwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9DIdHgDh0woJMfKyWlpNhgc3vCYze2+Z44yHBllLtPeAz+fTq
	g9vYy1kLJbQ9DKt64ZK654CZwlyNaJPiAQjsa1eBNnSC6NJONdNaJCRv9I9/2++pX0bhSum+E17
	gdKFdmVXl+Vo7Rh8h/c2FaYhcjCby7z8tAox++bC++F1uukwDcXhpAYq0odCAVdbUaFE=
X-Gm-Gg: AYBFou2kw29sLpPeCk945xMx3HUMU5HMmwMtjq6+fX29v0AmuwwRtYyeJygTdEMgi6t
	LV1alkTicLQL5hSYvF3QOZHrmCbC0pLsS1bRfSnfYhG0iHX0F+ARFQfzQkZ4WLRUcM9K4KdsQzu
	G737cxJR6iCJxrxopf1E8BMhWTnAC04I6ph2Jtjhg3+e7y0uX71S90iAXP5yY8H4fUxSQc4DBPO
	hufwPNWvKA0Tc9p1SY0xUtDuJYIwF8kW4Pf/Fi5EjsV3eOL3JfmL3v4sVJ8yiKbQAnVyhZrfEyj
	UV85A23sFba3q/71VlpoTGUN17XW6hC+1AGATcFYB7sZeUspHlgNZpBGvUPLxUxmT9oIKvpAfeO
	UUieIep5mBCnbvZ7gPesnSC6PAF8pC3L6pycaQj+/OTpdYHATQ+4/7k8vanbq8uCDi1pEkJgoln
	jK9aK3BySCnkE3njYANB1hlNFDVNLOau4INVuvvWZJ
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645436d6.21.1794655856167;
        Sat, 14 Nov 2026 03:30:56 -0800 (PST)
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645216d6.21.1794655855778;
        Sat, 14 Nov 2026 03:30:55 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:53 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:25 +0800
Subject: [PATCH v7 08/23] media: qcom: camss: Add PM clock definitions for
 SM8750
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-8-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1035;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=aRxMrdDtYyY97/huckpcHrUdtu8c4K3ZC3GA/RWZCDs=;
 b=vWhSMHcARnVI0vXB2VQvgOzisoN8ZRFT+BwfFUA3Ajfs/RhNvQmm+8FhnwOhPEPYq3FPs84El
 /6E37tDjOSZAaqDqFh+2KI8ArW+N1uCOjbs6QglI38hhbVXTFl71AJs
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af84671 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MfOgH6a12QNS3LiSQs8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2GI6XayhYT2X
 mweEpD2ChyolwZb+TwSh5iuo6fCnqh+6/90O/FX4KVYv4RiU+3WLoskl+kdVsJed0Qyt3M7kuWS
 /ZnDlfgc+sALknhqioDvIRnXrFbftbc=
X-Proofpoint-ORIG-GUID: U6OX3a96c1it9hzVDs5lFGHHtGkYSCn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4fdsBfKHLxIY
 iLmu+aqF1M4MpTSKyto+5xPsT+CZkBVGEeEa6Zje/NvOyfAS9ntERBIXMDlkphE1Py9QLE2DCDz
 VkGKf0LvxWgYXKE7d7eUzemO++jVVFMaguBNubkK69r2K0zF4XaYZWdHd8Lb82dqUiDeVpQdnnK
 8Zz2tq5xPqZGMK6VwnIly0YK/1cYIerOwkc7cafMf6OswNEcJV+feuJpAv3x5Yd7m9v3qvxiOnH
 kf1Yvw7EzNoJSJVdggkzqRg81CxDCpSXDuO7lqSHB2N3PZ48zQ1NaoRgjeMqyy5LvmZRKnfCHFx
 q/K22sdMHADWOFwb0sCRR3YNvkHCvWVTQ/PE+1nzUekpNh9t7AlKihzJu19HkCAJ7ReKcRi2tpb
 j25WnE/+t81bD4u0vi0Uua0EwOPpdHj9P7R94eefg3vIQC3bVR1LYhLi32uuErNbtIU23KQuIcT
 3Y5kdxycRfBTRdjZbhg==
X-Proofpoint-GUID: U6OX3a96c1it9hzVDs5lFGHHtGkYSCn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add cpas_fast_ahb, cpas_ahb and gcc_axi_hf to the PM clock list for
SM8750. The CAMSS core enables them through the shared PM clock helper
when the device is probed.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3f9dd3a2ec088fa87a9ea90d25c906d14b9a1896..196eebc2d7d118040319bcf967b91c4ca98a4833 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6043,6 +6043,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_sm8750,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 	.csiphy_num = 6,

-- 
2.34.1

