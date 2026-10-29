Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298848;
	b=lXbPW0bcnCpWDLYSgm7Dm8wbAtoSB7JcfKuhPJ+rORoHpHS9SanHZopnSkeyqIIv2vG0
	 BGkqr5c4hs4+LtnKkz8IU1QaGosO2eXDXv9e1YEO8U7ms2my8RlOOT2rg/kdshW3lzuUk
	 y2fHzh2ekCVuIgplp/LRxNh2UKgm7t3JKHo5z8Xwq7PdVDiVxHEjT58xpCwvRHrta0XU1
	 eXF+Iwg5ToZeShfoftS4aezWe1r2oJCIQUKWQrHQ4P5GskB347RXKdZy9jQy6yT7b9puN
	 8BBS8MXQs4PHAsV2seArC3swiWMfpIkNFhCMi6oahM7GStcoWgZe0s5g1HLdQSz2XLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
	b=JUE+j7iHpyHStni7uFlZYP6Wn9oACCiyXCTfpD4eF/JgAQaCow+zVdU/dE9VdZQYZ4KC
	 x3IY3V53Unj6Hrr4jFsNM9h5KDk7iFXhqKnhHcPmuEdNSrg+HaEiYjr3qKLhrpjEA7TXT
	 zVCnGvtvY5brIadPOIfYpvSflHQg6pk8zPxDbPQbSnahb37YXazjyYMBlyNfDto7qRNDs
	 sTMDoHE9pmzCwxF8wcLRxzlN5IxL0gW4TVIMxM9OZanD+Ppo6EToox8bGGZLNFNH7tK1m
	 O/CPPmwLRYyCN2+Tk6FO9lfDqeBVYsRO0o/gwyrKiBm/Kw8LxGiUDN+MP0PQrqPPlUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/1UWcCZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E52606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/1UWcCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxb51619547
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=; b=K/1UWcCZpNbhyzNN
	WbtJu/7bS5iTGmfyIl+XdgXFcxcZaSq77pY/Z9jqUqPtArOotHCHroW7SKalFhX9
	rDj4WrQXIlvnAwa3VXV18HpaaWcOfLr4ZAEw2sxnjjrMBtnrmbuBLZvSU5TkzBWY
	RV0f0JNssbuzy0qayYMo2cLG9WHONvjfjKmE4aOfizipis6e++C4WMCESwE1Do47
	v86gIckMySnK6gwOl8cEodnNkSLG5r2jJyTtBgh0Rq6ytQUmwGZIn7AJJKYqJWST
	4jQmhCLZhsEsNMsXVjfcxUmDjBgoH1OVCCdrUNWvk4WSqXbSOYOkdDP3mPasJBlM
	nZZliw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qa6ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7846354eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298846; x=1793903646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=OTYW69R75hy1zUMEtOG9ELYw47s2HvYNUiIXVsDAj8p6ruZt9WFdddUwnN8HNw+4YC
         3wg3uFmSzLFtWvwnjMEOvTV+/RH2zcCYlDThHeSU7iAIGN1LVA2lZlLGRfOhj41LvHdT
         IO4WgOiULzpmRfMp1bNazf3SxKdC/bper5VqTQHsMbL04gsT1Mzma+31cZEXiNoN3tTV
         XJrVxBb3mmnQ7BeIRK8bw3XLO/pZi2Vi4LzqXpdR5cBx9LjZBKjlSVaXsOgjry61y+kd
         Tb4hNhVpH/qFBY74KShCYfREfhHVDbwe0GGcG7vsJ2C6diIb0UynQkoirYmoz6YTfZt6
         0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298846; x=1793903646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=QO1zJ7hdxwfEQgfS8HQSjh7+vMRZV58lxoxbs6Dn6pMRamUMt0VNH2JJoBRqFZw7jF
         EFcxiwfx6/dvSHV/7wrVrdTGqn2otAW29WAr0hs9B6INaAgOSv/4YXBTJG6efi3YLfYZ
         rta1i8bBIDwzXf2AnU8QyUxF2N/WUdPW9gSgrlcqZxx7DCWOsCwn9Bx4cx+zydVQgYEQ
         NyGbK8LCRGm5bcjN2e6wTcVhCtqIWM6306b2VSJdGDSevT4wp1QH+n9OZY3ba4/4vg5c
         ngYwYxZ1xLHb2zY6V8LLctrnXvdgDOm8J/DOjVlwLagbCmIDK/qWq0tWAFgpK4uSZPOf
         pTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhb71hrz7iME8gglFqpA7Y8Xsf7qGxsV2e8ZXTwOV2PhCsaDdVy+SiGRb9/qg3EHDLOcrpbVFES6Y88M4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJwJw1ogRhcZzoVcmtCLRCCpVjYu5/H9Gj8ZqlI4yA3AOEme4I
	ie3+gcKmEZlgL/4+VVhQGNRYklqvV+OVq/4RfCChK7Tbnard2pge4AzhVzXjkB57EPvMyW+CL+1
	06ffiE2nBF3OUzA6DnsPrv1MuY3J4w+Bf2ivNvP170yoUGkNpB0JciQVnyUGILpRDJd7e/xcMFY
	g=
X-Gm-Gg: AYBFou0FDiEMVXYDZamkPYCYfh/N5X4oo2YYDhmuuu0qTPdntrabwY7iP/ic0LVnWr6
	idGggOkdms61SqOKobcfAXvLa73TLUdrBBd5IYQx1zJjfsuyCl3XacLAy99JYnaxH/ALoxMZrJ9
	u4hMjVYxD7fw8XAthNwhgobmw8/jB7AeEQoWCM4/DZHXkn2Nrda0mJ3scZR5JPFFHVWQIZ/SEu0
	XR2QlRhPLqpoiZIa37Of8olJsVnxXpn0yvwagiJEV5MzAiz08FKorXrZ2o7cNqvWhV7BB3LCL05
	M0Oi5Q6XBM4ALzqdTNxAJgjW2Pxnp9JxYWzkJ0C/wYMcQT7Dp/a42+Ult8FTxIkzsvXE30An69j
	JNLJW2uH5R2o5zz/c/8eX+pskuD4G+JcHyJN0VS0GSRB6UQLt7403BZq0LpAt9P3FyKJrrkpJmc
	SbSurPzmtF8mAT4MRM7tU/gEtg8mNEf9irHCSsEfwXwA==
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293219eec.34.1793298845801;
        Thu, 29 Oct 2026 11:34:05 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293142eec.34.1793298844743;
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:40 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=708;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DZIC2FMxgoUo+lHizqzlRGkDHZh3jbRVq2fl93zvclc=;
 b=1Ja1rpsjyOWr7a4tpUPPzBUUP1eVslWIM2yGsnNIsK0ixqk8y9GKW4MDvJZMJixdgl0VJkKqk
 TGqPG6CJ7kaCE/8hR1WY6LAtiJbZj71ucUq49R6xJqyzcQOnOiTwsgu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXwOuhlgHqKmWE
 7UtVFrZbUWe7km25R76eHtmwyzK6VosKsJUy2WUXxajiWc37sz1DaeC0YWV7GQYUwo0Dwq49Cr8
 K87+coqnL5YlHRedR4dPACz/Bw4nH4g=
X-Proofpoint-ORIG-GUID: nVanEFa3LzM4GQ3vzOFm74UV9Ryepg-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX7yEbq7YQ8GcF
 +T0exS5Ll+nmTcu1lLBp543PWW//uXxfn0ipY0BDZ0bJbXy73aRG8yujMHtdT1MHyFiRG0RFSs/
 N0BufsicFtQEvt/pQwuuvAqIp+vWN59bGtMv8JfriZ4NyYPbQ3JD/pT4XFHheFWL5//oKi/QKUH
 fVneJZHsh20IAJl0NzNffKSxgG4tPtD9tIYaodMTdp9lFV7J7CqNH8qWRDmE8wHNn7CN8OH1k9S
 84MLPfuCb+vxJpboXub5ENVv1gu0Dy9HS3lxVzdiWjJb+ZYuufBTWscTgeaRvOvU+wvIjX2BSaG
 zY2YfTCyYyxcMi45XwSEJybKHxq4y9623ftq5sYhAMXXwv8xwU7ha1xZXU7rQbacvkwswAB04rn
 e+m8In1NX+blqJgnJgGjLlNMzrFQWEVD/26LjO7Kh5IVW1zw4Nhs0hJqiWQabSN4DeiZq/aIPLB
 Avfgk1AegOYano8v+oA==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae3919e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Srwhhb0qkpw3J9eHVkAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nVanEFa3LzM4GQ3vzOFm74UV9Ryepg-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SM8450 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 05417cb5c4e5..b611671e292f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5489,6 +5489,7 @@ usb_1: usb@a600000 {
 			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy", "usb3-phy";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

