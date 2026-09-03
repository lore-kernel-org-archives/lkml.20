Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327F371049
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419961; cv=none; b=nFFCKXjwq4f/+q9zJ/duql9ZaHYsVgSLg+A7SCDWw1Ry4JEqq1qHIOT1SQW3G3WVvu3N7Tpr8tTBAe6t+r8l690v6xhiRc5Ie0sv14etXYi2BnCa5CDwt3KGatTJZUzvAGlx2LdEwKjXioaoHuNQuysTLXB0UTjxW0WI28ORhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419961; c=relaxed/simple;
	bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lR2+MN9806UKFZ5X3IUn2tQPydB014erW9KV3qvzzgcp9Crf2pHYOCldDKaa4e7e+Czork7I3wUsTV1g9dqqzRapUdORFcOXtLgD+xYwBTVmAaRxbHt6IF1t5biOkxFwkYJwDynVCMhXXHCu96YstKqaYbKLJIrWAijAQrOWYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maJjRB+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOPaOghp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maJjRB+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOPaOghp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMtA324636
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=; b=maJjRB+PDnz/6jkK
	uya742wfoB3cReWtNvYbzNOilAnq5OYKJRIxw5JK4eapAsdAk6K501yy4EhYIY0A
	PJSzP5hFsiCFD5nPrAub/D3FmodmbV/5w1AMjypIxrlXJd8LBNoSj1sB+HqNiBhL
	CwGhJkLpWdRPuD0CPTKFJ7VjMkWRacl8jC8uY6mgPTbc9GJ2UYqmMZPN2mjLLyOE
	A9sMvtP+5hjTwxfWZgP4/vZ8yIs7ygvdkyEUvzUNlahC3XyK85n8mvMLtWPiHjoD
	pwiybGDrzimVvQ2Kb1d9j/4ICMxEc0CVT0lG7kCiWS72fT5T/QT8hO1XpU958zBC
	W6C5OQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb1ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:19:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3079856a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419958; x=1789024758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=iOPaOghpYs55oIaqKdnHnZZHeO2DyJAlROmZ3L6VkSCvVFKM1p/XDTHVPNs0La4I5q
         NDOLfftpULVs68v3y7P6Zcg+0LyBZBUJWG1we766SW+g2reLlZLhUWpLobxD5UoSNIGZ
         LtBDReS36PchavPEyXc4+SQJwLEiKAWWaknB7Xm6gDuAU++9/ERD/wqv5M4nzSYOAaKp
         /Z5Jtb8WZFIq5468480OjULh6+5/GhbwDQ594ZJlx09TJbtEpefIdMSJzYJozGBy9n7k
         1V5LzRT0ww4QhFg861akLsJV1CG/4nrAaJ6L+BBa6ve/mkQ5vBFFD10nEQ2MXX1pO2nR
         qUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419958; x=1789024758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wlDI0AGjdSJ191LxhP8RH9JdiqlpsDYcL9VKd3ae5A=;
        b=Ifqv9s43kmUcRxLIv6vcTTAuENP5yck7PYaMI/CaQT4j9oU8+9rJQyRlNJ1/cU7f47
         yLdyqi9SZsXOHLRmZL3aeg2GcYnKga394vyZtCL/QwS6bEem401OSGOzHwJs4AYYQnbY
         rH4e5t9N7k+WMBVetDMboA4s/6yqMNotI6SpnJ4lCiIC7yiujAhQK+oLqGHZpcrMRxyC
         6mSZOEpEBcLHF6/e62fjgjqpfF2nwxllE6QBkt2smD897haCg7vthh6Gv2EhfNenbguh
         9brLse48y8jguAOfHi88YAq5+1LlQZ2zOsUJATolPOW502JWJdCPms+cU2/4/VA9RGri
         cS2g==
X-Forwarded-Encrypted: i=1; AKwUvByGgpj4BkXLUBgvgmOH/yKeP5HUMlUkzRuPwO23yvTbR/axzabyRywMOnEfwnYhyt2EWOauQTNn3oWWoMU=@vger.kernel.org
X-Gm-Message-State: AFuF++kMBIIlosU2JI+tFBJJDQ5MZNQ8WadlrA5fdJKiSfHi1+OuJQvk
	6cruUngbpCHRZZfwW0gmRAUVW1zmqTToaIf7XZygi5W65YS9Oudp1phZ7hFM1R9VXQdgP8Gg6s/
	pI5SYMZilwnDdMMLSjyQz0vtgPumGAkghVITWabxWmCglYO98RZqA1xTkjRnx1kaVpNs=
X-Gm-Gg: AYBFou2RAG4b6oGaZhxyBhTltXMUC7HRZrBJ/50yYCid6GITArOpqgPAabWRJ+zS8nB
	lK2SV2qit5F4uZbj4uC+8pM/wKORjPpw/BBwZ2N9WFAgTWyMFLxMNd/Ao0p0UQfm/7wSduKvSQh
	oSIRVpDxnmVbkfrDQ/IgLH1mJcte0gJV1yZk5t5B3P3Ezm3R+81yV10ycN1As4FcOqsHpU4fAKY
	c28yq8d4hja6Q1vqbpmhvXezit2WUhA+MrSY/lRP9rqAeyNag3J+h08zzi8yY58F8fDWclScygZ
	IQPlq1KroqPmTeljDAyfpO5DXrs48bdkCrxp1UpEWdJXeCUsEqYLKFx9i4lk+2bShWbmLNeD9HW
	hiSJSim7SFLw7pwHvRy8c96IRhtrVP1t5
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722312637.24.1788419958306;
        Thu, 03 Sep 2026 00:19:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:d89:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3d9af5f9bedmr16722268637.24.1788419957886;
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:17 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:53 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=1538;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=uy/MlAsOdDVHNsYX2VAuailb4BNg3bdERgcHE0uw7wA=;
 b=YdSaaZP0aB2SKEG9yFJ1nkG7/Cuxtc0l6V5QUHcIogWt41GQ+EojV8U28QKDtESqt2/xYsy+1
 +CxRreAqujyD6T3XiU6h0ztdLRiNghtgwddnzVJ4SsAuO6BEIrKHklH
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a991f76 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ikZB-fCjBoBaDskMKxkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXziyCD9ziBzB6
 Zt1fSl4z4j8pD1Qw9+5Z+oiYB3GiNYWPf8PQQDyv0/l/EGR+h3i6WE1NgdbvmyQvTNGMYSBqTLd
 sugEbMUfwQvo4yIKMavyXrVuhA4ILdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXyTQkfQllUxKq
 lImrBZz3wgFjOzuLy+EMeQKicLoHaQFdr6PQJ+Eucc4q/DYDedwkU/HxCqrHGMl3qxp4+VKoKKk
 1MWlUTWytoiZupQQZCEKTCd24bui4TkkWsURsgrRRvgxWyVUq52FzGjK3EpzF87xBvHe8KdJHt+
 rHYXbPPPyU57TgCVQh/HmZ6FIXwY4feR9pwdfgvKH5tlF05dZZkiBQVx1qEVi2X5ORHgntNzx5a
 /BE5FLf0X+NQONKXGEWwEU2W9rBL1mwW564hGoBvPWmwWU44LW02N/XfVm8mWaAy/P8C8jr25Z0
 Ut5L5Hv1K9Y6jClL9djlZ/LL1NfVHXTMKJtjytkGyIO4Bwbp2yRCH5jQUzwXi9gSElVbZ2lz1St
 nlaSoyEmdOh+5oYfvS40/7P5Wq6v35L5ZdVThNPPyvDqoWfihKgIFl2GshMv9nWx0cYF/87OyuO
 b/ZyjkMLBrXWa7MEp0A==
X-Proofpoint-GUID: vSZh-mvFZX0ExCbUMv8f-mS18zs4UXq3
X-Proofpoint-ORIG-GUID: vSZh-mvFZX0ExCbUMv8f-mS18zs4UXq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Removing them from the reserved
list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
for dTPM usecase.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */

-- 
2.34.1

