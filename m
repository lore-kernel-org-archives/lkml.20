Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB223395C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047013; cv=none; b=QkniDbV1AVAxYmkMiWpUw4Lgvrnb/guVAagmZ4ySRheFAHdVphe+sKV/42td58uMZsPhYKNHYrbJDWdVbvbyTIrDaPcMuzvimwz8kDkMb/dJb5LvZlrLGrMdDEVdB34DoiY96jTe1KTYUk/mWzzvWOXA3NYblZXJ2mecVguyjzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047013; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+9t6Cek0sSngK7gZ+8JDXvI4l8Gf7uS6Iz4CIBC4W/CiRL8msHp9Jil14yegJgwX1uDZqHHzoW7GahoUL9DRe1fLfFXNbiyyAWCmIRyvMXy3mD8icKPYFxWndXE5lgipfgUL/44ypX3HBqU9g6rIjCYHl/WVwR8NgjJ3Aj7VxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nULGqOmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgtpkRE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nULGqOmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgtpkRE5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hBU244656
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=nULGqOmWgKj8eo0I
	ZsShDXBraOlH7mhbsD8PNkV9OMxgBV0ERrJg5GSQPrMkc7vHAX6YPTstCyNo2dMd
	anal4fRbaaGNuG2pZh/bez91ZMZtJb1gDIzZvpHvKWk6q3sUWcDihrDHAb6yBshl
	hsZ0k4cusFaRVBfC111Ff9d1BCpXhg3Z+fBCAFWVi+rTdVLPZamYEcUZXfDZroCi
	JAmW02eOd2VyvEyFw4IPq5+ntF0bJIc3dfoJPEjQIkRbRt400b11q8NHVxEHO5M1
	32oGcoPXRUG4/HkTJKFl47DSpre6vG+lFuwVXjH7qAhrrdvHsdK1DIifL4fPmch9
	/xVdwA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfm3ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so6282699a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047005; x=1789651805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=IgtpkRE55X7/mSR3RYwGVNSWFEmGDCDjEmb96szVJUX8iJpjMKgbGwb5nhf2Fd6Ego
         H5GQWgRwe264tzwmJNMKuq3v4yeXUPKxmXnYFimOG8g1kK4+wGBRlYyffW4/SlBBH+2t
         OXhYILgqTUCop+5wfnQfdSRfJzInkdAYg8/YGJ06L3JU5cpwEVZPJiBX9N+dx8TXlexq
         yF/bV7/OyjRW+masOCF+bIQiNz7eZehofFwFPL4MxvR95Skh4Gl5TCD7UX4pFWa1qCf3
         JTNmwTI6pI5TOAowPMST1qr8vM9NlNOidP4+fhZtkCGH8TUxP4f/opjUOMCzNjFZ2WN5
         H6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047005; x=1789651805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=OCsKgMh3ThBuPCn7bRl46/OthSgMkdLHRnEUObpbOL3aK+i3/w5M23/mwzYOvrV/5/
         g+pANc0NM6XFV5Xu9gg6OQkkza28Q4rLiNIXhdkAl5gdPgIrMhEWfVHBvSylaS1AzfUj
         ionforvBN4gX3eYuM2SY1DeGwUlXYhD7LPpbVljnhaJQmDnBtBF3zYeCUJGMKxqLv0DC
         pqZIRi+RgV6Fb5YIycwe5eQmUFhS78VZNeOJCUGNom+TtcbBsHZu3avegDPu8bTidIHO
         uIzcRoUhRpZUzBZBK8+bKrUxYpQ7uQegxxKjdrgaxHB+nQXNfFeojhCrb+4TmCpYAO7j
         iZyg==
X-Forwarded-Encrypted: i=1; AKwUvByC/ZU3J13HsxfJiIS4GtSwuMPFskJ71UiUbuPXemZmmIIfiCipBEQaqrEaM4E7c6peX9boGCNl/iAXFCs=@vger.kernel.org
X-Gm-Message-State: AFuF++lSONDPAu2Dkuju0HgvXjeQfSWuL0EeZq37DUHWYzN0sqKgaXIq
	EXLaQC09825y8Z1ULcM3Rm0Nh0VBQDp1IUluS1FFo54jfdfYDOeWSfgkwEjwwln7xBp3soIsSYd
	DKMjfogemQNIAkmW4vyWZ8sctQuOmkSkFVidp40tD+dNcnXHNg86Qn9LguNuKD1Jcu5M=
X-Gm-Gg: AYBFou1ueaqBnCPFHdiGta84i16Yfnvaq6nBW2y3BGmqMeOGjJuQOpgby9jU7PvozwE
	K3SGONfYuEMldgKESRhbmPpm9YUCPbBOHibQZEqgoz9jDQV3J6ECV1KI6Uq6iqFjJUf0tCOAWWu
	dToJbSMkQbNl95jsXOD0LHMNCBbiDhEse7cgUHlnI2MR+R0E1RvHJ1ILbpPoj38Nyhr4Go3Mxlk
	l5EmwzGaJRtQNnHbMH6t1jSeOayWH1fhNBo9PzNcAKBJqI168dGmQYNY2xs2CQGVt9q/KykZYjJ
	0gMhn/ebgBmhLDwEqST5MvRbi4V925O5zNPvWEoWekNCFdMxD0OsOuteCRzBJL1nWhebLf/QUtO
	Y4VyLZ2TiTMOLbBFPUHerNAcBXzTrt7VNALA=
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893568637.22.1789047004448;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893497637.22.1789047004056;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:02 +0530
Subject: [PATCH 13/34] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-13-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=JdNq78YtfORTadJu5cVFQ/Me8bbut/dMQO2XVya+nkIAHsBjdzpuvgl3xrvqngnMVfe4g3EYD
 u2Pr36OqFOGBLmE0ZCiwpfLlOmcX/N2wRgMS2xvgzzwXwrZIkjFHUQ5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX8mZhki8G7WbX
 zpGcnLIZ4vwEdqG9Dkbujtmo+RTpbi5uVRE91Mz+JLq8LP45px/wWFWUiC+lQ2ueSD3oE2eVK+w
 C5CDpsxeXlXTBuTwiEtLmfl3yyy6dB0=
X-Proofpoint-ORIG-GUID: QHBAyi6Hgt5ReMdZuUBAJ6JaKfbi2KjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5MGdtu/zNb4u
 yAvLGIBYhHC/mwgvailWa8Z1W0u9xDGjYv0AL7hcKbdFdQWSBcBM1H9fVqOzLJ8uatvoWw7GDK8
 uVIk6wVPCcCAxwDIsjvMgsa85ZzWv7dK7nGA6WTjfhIMime5O8qZm5I0cmxcW4Ll3ItaXnZRSy2
 C/bn7Tzr0LNdOrVMWObIqV4oDUteNzUdOgQ+8s724DoxbBEyz0c7QvFCaEidm8+hlgRalGPZYzd
 EcmkQQB/mvAXFG/Cpupw0JCitwymQulenPbmhiyuHGp8+wDJkaDdhpLteRr5lkE/fZRafuo87Ov
 a3iS2kJbGXEFtseZVwbXV4HxTWDLu/yTsbSh6xhE+YS9mo9Yb4lX86bLWSJd7VSDecDm9hW0itT
 am89syDOkopninvtwVcrINlxDrN9YB1zNYs5so3LkpHGIdGDeqhc6df7LIRqOvAiF4/PGrjIUc0
 nS7ok++E4JTI+5fj3vQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2b0e2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: QHBAyi6Hgt5ReMdZuUBAJ6JaKfbi2KjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

