Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3649159C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046965; cv=none; b=gO02TXtL7RQVpN4B32iEk2NxMhICXBAiCj7kFYF/y+z/gSQ18Vjn+g0Yd8qgrBfoUs1eJu4BC941FMYXLp8aSbf8VUTzDjs2XLLXIcS3WqwRLm/ZBqDLHgL7ujBD+X86zfqJQt2naxSdZwj5TcdroqTZ/ujfHHi9n/j5jwuJh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046965; c=relaxed/simple;
	bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbAYxkc21cWXL9QaIiXjrrfDpAhhQz6Xd65oMFLlgju5+o/WT6r98if36W+ECXCmTRy3qyV18a2lpOqjBWWJq3Fd58nsgKzh9UDcPHnGO0zPCEO3ts0XNmP7ZexwQZPNC1uXFBrfeniDt86F1wu8+jDgHjeY4uwwf9nscswSpkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DStAXwgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgsFmoxV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DStAXwgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgsFmoxV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7X0B215989
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=; b=DStAXwgBeB2VxVC3
	LelvCyMroNwG8Lacb9szTPdWpSiO6WkWOlNZnUAycN0UcGHNh47X9Nw1UdJTPWG6
	sowWwZXmy9poIJklFhw/j3KvIJvUYhmlJ3T0377BTnZNmFIxOl893/ZYc4ehNKII
	S3NqPuJ6+R4bWZf1MVe1c7+Qm5VdJv/NKXnSMC6YhxXDkjaXXMWUGdfM9Ud1iqAr
	DGlaviubHCi9cPCYYNe12C7XS31/oMwCPDV7cIGThb8ZnSkEcGL5VB68LBly9TFa
	yV1JC4C2JpBIiq6eAy+EWoZzoTt/7Jc/uEgTTmogidDY4FuybyqlKWYmwE1VqM6S
	wf7PBA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:23 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e8568ccdso756156a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046962; x=1789651762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=FgsFmoxV6keWKXg2tNrNXXDnNu3H2f3OCqi9ZR3QktNbIbb3DzlYmbAB0PfxXZ3YcC
         RAddF9TOt3J7qku98OKld/Obi6SJfAP3qD3Ec2kpqG9mi6lI6ZOqO+UaXPfdBNJDuZE3
         HpadQhvKqNP2sZ7zszsdXtM5kJNOKnLHgsQskFvBIs9Nf91RAeglEJo5BC/cxGVFmvXM
         Kyu+bLLE/c8v7lvAAcsZcdQODoQ94KZVvSVClcT3xDW8n6AdRbXgINjX3GT9/eMuyMQw
         LjCDzmVQLPMK6+faAtBFJTfuVzYMJYiCQCl61wkJKOgq7NnEOcVBqxFBwdbCb25xl0eU
         9SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046962; x=1789651762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=iyT49TlL/TxgVg30doB9gL7lA2XsIn4Lr9xeZECi775Z7i5zZ/Vb9EP1Hd9ADAbeeF
         ykjpCAl0Kh+zoYPaNLPj8BhlvlGXkmMnBahXRtkDpus4CDVu7dmQ4NK+7IpRTA9Ruzkc
         9WIFbeXh4xYvBt3mxBfHoLUcCNvy4kCzf/MWQjZu5vEn5NJ7SQdcKctY2bHFRw1H3Aul
         KbSuh/dZtUwd6BgOT99divuVuZITja7uSjplBQEAz8UB1apH+AV7948NQMJwj4pVr8dO
         VfeXsZwcKSUQ50UwMx5QixWCwKtC0wSXFDWM6dfpvZ6Wo0D0+A8Ui9s/6mCmuV1eIegN
         hNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg2UjVeY1vpOmmky9G1Tn7dd9S3tBEqaQveK4K8hvUDOfFG81UlEKNv+XTzT2DlyC4uCBWEcxXmSrggIU=@vger.kernel.org
X-Gm-Message-State: AFuF++k00Qn54KyxJ9X2kyAlOF4E0O0stihK/DEi5kxho8b08xZvZ3RM
	nNgAQwiDE/vXhp2+3nPEHXnGRxCzlG+bHlNl31bdGGtA5B0meA+63+oOagjFqB243idAJYtXfSD
	683RMLugLDiCEtfZg42SMLGiUltcI4gsXl6S3cBOTUPFzA1gDAll2fU8wAiwsp1Lq8q4=
X-Gm-Gg: AYBFou31IiQG+ZKYI+wU/0H0+8lfrpH+iuUKVIYOphfwEP2O6hc7RfH+IP9XkiCX7/X
	jYMpXx77O904yZPpBvbHAkIWXUSBJl/KOIPSSOadFapRU/lV6LWsm42oFcWSfChs3+bhk1c7lsZ
	MPQp+BMyFCMNrDO62N/j5XU3G96qzwL3t80Q8uVnuOxpsy0V9But8z59XVQyQG3Xhqe2oaxDucG
	y7vLp1iVOEflRBB3jT6DdhLwrMWA/oNdwp4Sk60v9bwVKW77UJZoxwLAx5gaYn3//1bveoemcjM
	QH8ke+cC/4qbUnE8RMnw4Ipo8tyofxIQ9fx2kbZ0xe4tprJn2sVKLBQOcdH8M7tD8Usnt/o9nsD
	fBe1FbUqwXXESUBVedkPf6OnWCve7Fk5Prow=
X-Received: by 2002:a05:6820:1ca3:b0:6be:2c0f:e415 with SMTP id 006d021491bc7-6be2c0feba0mr6274608eaf.27.1789046962252;
        Thu, 10 Sep 2026 06:29:22 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca3:b0:6be:2c0f:e415 with SMTP id 006d021491bc7-6be2c0feba0mr6274566eaf.27.1789046961774;
        Thu, 10 Sep 2026 06:29:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:52 +0530
Subject: [PATCH 03/34] arm64: dts: qcom: sdm845: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-3-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
 b=J7oGzi0SI5PvP4/VKCythssz+5e2lHHT5Psn2w1JBMaX0dWXfzfFRosgvnlsu2qCyQLNVGJDo
 DLab+SMNWlmAHNhLrdigBzLzwmLi1koDSfX5NIsJyrhQfs9IkoVemqr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5W6R4UPUPZDn
 NW9ZJIZTkTPVqV/4fwRlVwb1YZpM/nNtmo9485ZB87k2IKGyp68jC1bvrxhmKqpwkXzgHujIEU/
 MhX0+IBLOTes58iMD6kSrruUZBf8h/sodujs4h3lP4yAs1hKaZQ7UbelngnRdBpMs+Kj+tgBSyG
 D7NBsG9ltqx+KD6h2My5NKJXkvqeDVV2ryP/axAe8k8mdWooYSONqGzfBrKdqZbNSLu69lEwOdE
 4wgphgQkQHmG4Jg+q6DSoRhjm5PIODYsxvkELUflf73J4AUzyRcLj7YOKTJ273xy5PiUSG9hgnj
 5yZluTQSv3U4IZtjfC8HP/Yjp+Apt7P9ihSQHMish9dzLBnJPORHUhennnZt7fFDj0EACZj7Cfy
 SED8Bl4VnL2qfKfX2gy+xIiuqxmSrDDN82w1dk7KauBgbJQ9dsUt+v5/HcLkok3nZloziHMi7Sn
 UQqYpO7FwhnhgXSCg3Q==
X-Proofpoint-GUID: 5HZm_4XNT0vbK9Ya8Bfwifx0K-3h3qG8
X-Proofpoint-ORIG-GUID: 5HZm_4XNT0vbK9Ya8Bfwifx0K-3h3qG8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxfbVitc6E7W3
 ncN1ZRt+teqZg1hL0srL/bKqdRbkrc36P51M1havRSu1X+SO9yKNiljBdSA4UC+G0YcpEfxZCgJ
 z0s7cZw+ZNYUcjffagsgFCIapz/qcH4=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b0b3 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 846138149b2c..3e636926231d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

