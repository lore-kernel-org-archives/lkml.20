Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFF24DF4A9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646159; cv=none; b=TUhaXtJkzY2sKpEZGjyLihJr8fPTCcHa0zltnzEETO8jcdMmSJTOiFjKAWLZ2bjGrs4FG/BmFkK3cr+VXICwQxLC+BkfWSVZeCnglVnqAzpwRcCvPcfMDZho1RS7QZkE6CzBzhaNpwIIbECthi/4MJBXvc+CUFYJbSWATX0RXp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646159; c=relaxed/simple;
	bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXiEtoXDVnKBa6XQlhmfj+sOAbA1PyQntRu3ax0It34FacIzx9tooE3ujK+t//Qs6u+YlcPYJS8WQVY+NKrIS+l/fShvcY4X3LA+MZNc9Uq/qc4/xdcGJ6U6lW9nKCW3mgXxd3z60EK439uQ5aneolEGsNuEB0RZ7zUZRnY9oz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UT9sMWPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPJFcaLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UT9sMWPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPJFcaLE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZYsB576941
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=; b=UT9sMWPEhFijJnvP
	mQ9BjuxFnY/ssNUMRLk144zyiJ5nE03JIaGL7xoGpfTE6tqz/If77MCVsr+lqh1a
	ZPntMubHEAYfxCJE8+WNdKUW3mBEiBiO2VExOqs7cUGlfs0HyR9eyl+JlX5hbg+C
	PRleB4uX6Kuqf3NzTx+apFi3TWC5qqWLr7gUb7qS0Rx92JTNrUvTQ6kmJMOxZ1P8
	S6fGPmEa/N7i69iFFuyoBZQXASe3jDmuctPlS8cdW5ek6jGYlN+j+dMeXxPjMnCq
	F+YZGIfdRBCRMIF0WIMtMC9BwjuQBqRYdIrLT7YvbYXz2vnybcOG9+2y4U4A2MSV
	sbTWnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw1sf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1675915a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646140; x=1790250940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=iPJFcaLEdbF5ovvLVn7A6Q1dCkSIVabqvjZwkTtRKV2Jko/F4BFfWGHGPPOIODcxd2
         YPwR4KeIZvAQPcZFvAbrR5NZsIr7lbDrGScf1nZsIYQ8tgLldP72dODxC8IDX33N29Vd
         T0bq+Ro7hODfoqer0yk6joazeE1WfJUIbCv81aartn4FD/DIEZpE9phRLYkHrEKP5O1k
         RBbnB6R+fYmY1/+Uk6ph9g9Kui5Ofv8Jzad+k5Ext+fM1JPtLdVxRVh8UkER5gvkdhAI
         HtOGGqtYsr22lfAaXcXCh7XBJ+VFuStDiw2R9vE+oOimhGa1D1xDha7O1JhLlhi5psEE
         ZX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646140; x=1790250940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=ZywDpKK6Y0LwZfnHe4ABWeNSkQ4ouDv42R+Zcs25x3pTsbDMFxYwUGGx3moK32b2Ui
         Gk9x3byK5BcF81OxbVOHGZZ0z5ih2E0xBpkA2axsObgSUr0teBlixKrjch1EglAGoEFd
         gsT8K4zlivIp/W6QfFd7oENulwkYVQ42NV4Uk1GGtcfRqdnpU6Fq8Vq3e0xizISN/Ozo
         134Zu9oo/ye5sMKsRUwNxHWqmkiZvq+5+yWy+/hhciFX0WcExqe/ibqiuu35qy5ceA5h
         CvbCcte1VL2WdFORtOM6da/qXCsf2Tg66Rs4574mgTEsUWyIfxbrYGGnxzKVNtfdpAC6
         tgcA==
X-Forwarded-Encrypted: i=1; AKwUvBxnZo9o4fANPZD/xbRR9jwnIkjimnO1+v9JE9ApH3ayfuSEIVhQjMFsbpoGx6BLQXI/mrF7Jps8zc7qdq8=@vger.kernel.org
X-Gm-Message-State: AFuF++kIIz+JZImNPe0DCWd/OCRjwXQyX3yTlOVmR4cttQqZWH8G62k3
	hWkZE8S0QC+SEm022IxCmvGFe6WXqTThF/8g6tRLbnk6r/2a0P8el53Plw5X5x+TbhpIAzRGYAS
	FGP+Eyu260lM4Ex9rAEMx/Ud9i0qBUZMMJhbPI6lzpr4g21sIpXKpZuy5Ue2GDtFHQM6wz6OVMJ
	k=
X-Gm-Gg: AYBFou1k9oiJwVJ/B65VBkMvpPIc1M051mN0qC5N4RGl3IYxV90Ta6I+KSy9lDCcyS8
	Du97U/bCJt16voytnVr/jZqFUlxZ1wNluNbVyjlKf+Qyte9LDCKRo1SKIrYOpl/1MnEVNonEc76
	FekRZ0Yw8sM6uMZelHK3T7sawEWbN9ksfvOkgKN6zSR31VIo4x8nun0TSnBJXgAsw96diwf+/7W
	IjM7825qeNHq7DYGgNEClDVikaRPTnQhkd2FaWE/rcmeT5LREEH4HDiqNr4zYYiAgxeu4lVPfnU
	wk/A0kc8aBGPPlwFIcUkgL6cCK75TnLeDhF+jPJgmoO8YTt9WkIO8UgDG1WjXdJaA9F3DC5M9zl
	v8txArXN3/lLKGVwIoBgByLuBkNApIzEaLg==
X-Received: by 2002:a17:902:d582:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2dd8e7aa6eemr148204215ad.22.1789646140098;
        Thu, 17 Sep 2026 04:55:40 -0700 (PDT)
X-Received: by 2002:a17:902:d582:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2dd8e7aa6eemr148203595ad.22.1789646139598;
        Thu, 17 Sep 2026 04:55:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:39 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:24 +0530
Subject: [PATCH v2 16/18] arm64: dts: qcom: talos: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-16-0d627d0856d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
 b=Bck0NUi1754IOA8kauqdnhxPjMN+DldZrjEyZlOKh84YMNiZn4M7QwXAZKcRA6M0t02Z55XdQ
 TMexZeLHMsSDmECoToCTCkFbbQHvnRcW6pbOaFn9dGxaVBbkI8pfyO6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 9qOeuEK-sPlGmdjh1J9uk4yNEC6m8tEP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX1/2Q0Yf+acO5
 Z4r+3Qq0hxE5b5StNizjFlT+ZPcpmlHOiD8X/Eo5M67ohahokitc0/51QVsY5Ag41E8uaZzUtD5
 gsBvQOUOkB6mGe9ei01pRdAgA2+XAIkxcdRn/ZoFglDYspESBPqdkXruw8PYkgZf30qzUMAdjN4
 YGDi8r1mXw16XIWco9wv8x8vutNIEAJVM5hAHrx4A4krJRCNvBc0TEA5CrDKak/8UVFBKUGxVEG
 Nc4gsI4IwkMFAAkaL2SqyLNsMy0oNhsmddfZaH848wVj53knsK9iVQwO7wZO+dvdEeEKCdhhjAo
 tx8beKkOmtbN7hKCH14SkmgsJkA8DiLRw8+g1/Q6Y8GVB800R0tGsUbL+fFpjNUE1+6j/Z7XSE4
 ZhM5s1zLLUCobH46I75+HAdVAicTEUTuA+Ufjkz/8aKmkiq7VJBr8wOQb+fchndUy6efTMivD3J
 KY0HS2s2z6GVyrr/Wfg==
X-Proofpoint-GUID: 9qOeuEK-sPlGmdjh1J9uk4yNEC6m8tEP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX0sJSjYwv3L8y
 Kf9D/WHbYH+9qoPQC7d33X2Le6F7wTkg3jtoq25i0xGc3vd5blD9OCbq3G4GDC3eHESSfoSso13
 0IC/e9y31l66oiPUUEoYrz4Wr+SoQaA=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabd53c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..43f110ba3a7c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index a31bed7fad07..198f656bddf1 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -367,7 +367,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

