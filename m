Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210C49BD76
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047012; cv=none; b=Yn6oN01/wng1+OcJeY1tCzeHxlhevTeOqfV35UoJ0YDEPFQ9FsoLypPLETLYYsgBdcyL+KduW4OlKvAh3O6/rJaBdMJvvMwyLVsoXAXpewRrm5MXuORLtVtl1oEzYYlaxcVvmluq6wRD2hx56nIqztbQl5puQRXzWk6wSTWskEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047012; c=relaxed/simple;
	bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5L+6XcvInptz5g868cxnL/2oJYqJS2r9+l63BfnXmZhvFtf+lFyS7raCG2hUcLfvBvvBoMBzi6QKP60gqxLARuYfKn6EtsmogIGoJyQ84wHkYDLBcbjfno6UrS5OpYzqc2at1BTn3vArTM+FtQfR0iYuG3JdF+SOV7YOApG1+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEFA6WIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLjrRHMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEFA6WIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLjrRHMG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7pwW1087050
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=; b=GEFA6WIihc3Q+Rps
	YvKXNoz5ZsnhJGdHTxSojPYovXfxDe0miP4kRuK4B6vrfRL4zccOcNOQr0ZrxqR4
	E4meUI04bD025KCONq1RwbxL9eVjJUCgnVX937P1sptr011Mhu0SfPGaCAUzrRVd
	LC8NNbQUDyiIVoYmnA5Z9qMlpoj7n27qPOrKWkfC+fzXop1/a6PFz7uXPe0JxYzF
	c+46eyQnTohXPHuHixuMDYkazHpJlV+csO5mB1cc4kIAnwQXLG/ErzukcogEuj0T
	CoP+SqLX/dUNSsd68LrpzvAgoEonJqu8t0B2IVln2GI6KmFqZS5/iKM90j+Rn///
	bKIT3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg43eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so13075130a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047009; x=1789651809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=gLjrRHMGFKTVLyz71Qdr2HIy6ArHCymmy96ybLkJ2kyyGIQbeD1/r8VmB+cjE55G+R
         Gxy7hsmqTwyXXvNtzD5bScZ3+6Cy/sWZcKgkwmVW2u9p8Letk9Py6bwByml3eIEzX9FN
         eTc2/8rTBfxBkPwJwX7cVO4tMXzOkXzIJtaFoNFkXdMcwRwiaMTsXVrXZxc44BQa0ffN
         aH8h7yUlQmPh8rxfrI6bs1VvTgI9CkC9Yr5H/Stxs5QrTfq3uiWnSg3Mvp25vw3ZIBFa
         yugjl0Cz3/yjFL+11n9oNayDOH+ZP0Lpb6pSTZnu6S3w8XVrrCCsPab43IzSwLgINy1u
         F/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047009; x=1789651809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=T0rPLjP6QsbGCbaHQtdjcAGe4E9yqbKndAdbbQ2cw2QJnNQhcZ9K0zyqBqc3EJYHwi
         gy6pGtyp7vrzQbsFhwBdJyiY+jrmg1R+bGUKlD1di+CXeTsU5bMH2EFFnNms3uwNOrBg
         ks6uxzmjKnDdSEPT+rqgUhhcQo5INyktQaujREazPK38UCQ7IDz/aRyWfUTsqbAthBVH
         F6c9VmrX/ZbWPWG4ZVH0utGqC+MvmA4Yty6tL9oyLv7zCATPpJBvLEkH2SD1Dem4kDsZ
         6j69KAXrxcBGm0dxowt5BzIenIKwUjI/B+vNsSyJaJ1RYsJ0lWVCUqtm1IcdTHy215Tn
         lStA==
X-Forwarded-Encrypted: i=1; AKwUvByUwfQmxf16A7O341+/kKvVtM/uJczkjzi4PM298HvvxPuQHR+DwAQGfeUIAYpARxh8eVrOKGmptbzooSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqTTo31n0a4yaYVbXJ7IYOIh39GSoPy8e4xw9aDJqsDNY5TvpU
	1w5t+laOiacLEZv/ctv1D3SmbRDmhG8EByduvViiAEe+tN+o+Rhk3CCu2yVYS4Ab73+S+LYTxg0
	vuJ5OZbmCD/wvpC4+MzNIGYnzc4mMR2UxiS9W6eYqm2LJM3CO/v9RFMrDSXEwg8Ig38M=
X-Gm-Gg: AYBFou3Fm2ZEhKxgH7l1Rt9UbAqC61O62Rbb6GF1BIedp+TWXLfLqoUH7YxH3A05QIk
	MyBfZ3k/PYkCGBhqyGrOb5ykngxfA47FWOqVBoX+Zrsq2khysCn2sLy01Zo/6A6pNvhHcWZ3qJC
	5fkEwRNjgEzcFeoPSPHZ+csyLmDOsuwKpk/Frkt3L/DvN3vY3BtiIk5KVdcx4z/n63jCvyGdWlH
	36NZixOn3QVQ3B6H94368sJryNt/cux6FNh/plH8CV3WD9YLORIeb25SIyg6tl3eDVC2S3NAcjK
	FsdaRwRaUA40zO7EZnz/eUX2+SJ9Ofs2A2S0SS0lTrqCiqxR+ULKBJJI/VQqi2hSdd5T0oN7ZL7
	6H/TojsCZ9oU8VxNc48ghSqkrdUCRf/Slmok=
X-Received: by 2002:a17:90b:2585:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39babeb3329mr20948438a91.0.1789047008832;
        Thu, 10 Sep 2026 06:30:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2585:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39babeb3329mr20948308a91.0.1789047008249;
        Thu, 10 Sep 2026 06:30:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:03 +0530
Subject: [PATCH 14/34] arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-14-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
 b=K4L/O8A/mOUWuQOr9axu/NRiUSryZDrcVpY1ImX9dN8X04El9D0/ORJj2OadIZS2XPSHJd50l
 2nsTxQYp0iXAXKmexhhUwCKWybg8K47mvwjm8+srsTLMkhlxZA6Qa0t
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2b0e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zMkUK3whaLD0-JetfoySWG9Bwyiq9HjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX8Oon4pagnSCe
 XA6D7I+iQuJPDQ2F14t+b2Lj8SHjmGslbjdU0aErT5SILqHSrfNP7vtpQ0MSQz2dBbl7zUjujZ8
 mgAF08OodzBkrQz+9CiL+RpSUmR7XQ6fCjC9eh8l+ojfvrrG5RQiQtr8RE5s+cozuKtI7vpiXvd
 kyh7ybqpKFdwZZqkjVyBKlczu2U7NIj+XHs3jgLoQPVTUs/gFX5cVcKczYWPiVgROtLAmLRaC4r
 Zdt7N1VI5hd3e9h5TDKbm4YfFlnaQFzgja7f9W6APy/krap3oEwZ+OHuWkRBd9+y/2KDVWsppCt
 O/Pa9f+ol2OtZ2Gq2tDv1WybEN2tdwpeKp+t1wq9ZbB78YEy0ysA1DdUVh7JNdO5PEh5sULihs+
 LGowTnZL4bXOT8v2zxjiTh9AtikYIQhiFPSRViqGj6bs5/6DkdDUMmRSjT+xgMgRNh6fWJLre3p
 6H0IhcSna/5EPDldVoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX9e2yUrOOJTD0
 VRR3Z1YB50YqyOXd1P85u48gXl8owlnL37GwcEyCDCS5j4/ApAWuGgK6f69xm9T/cUVQ5FAd3wW
 W+RLOKyUtWSVHrVQqWAELnsImq4WsLg=
X-Proofpoint-ORIG-GUID: zMkUK3whaLD0-JetfoySWG9Bwyiq9HjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100160

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 80428c0b3b4e..7469134f42b7 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

