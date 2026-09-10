Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A848EC98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046974; cv=none; b=rQHFXdEHkqv6dCKWO9IQZADsu+KXY6PwnjMEQ9ECXL2LeU6PeHy1xUAZU+WBplRZxnXIrm2F68qGaEWb2lUZrLclo2jXUyRbCEkIrMLhTJ69pd+R0wSJcw7jeQWxcrgBVAsTruVPuf8wHd6nFI76+IljozJ9dKNXUNDtbxSo4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046974; c=relaxed/simple;
	bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELe6QO5+9WrdZsNiTVeRBFXM6ica0GfyombozP+SVUHkB4aHyBEsrZ4X+xrVE4/+H1HgXE0NuMwM4fvy0n+/wn48CJnHMlf4zcw5K+OD+/g7H38qd/tA21AOKeN+dN6KFq8J5K1kwMDGLhHzwqPnCZfsOJxxFQcJ5GuKg/j0ycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NA/TH8h+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfFPNzwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NA/TH8h+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfFPNzwP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7Y8h216009
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=; b=NA/TH8h+c/DLE8a4
	xGnSmCYUEd6z3PunvnqpgOHAg02N1ltooCTwuVLt1wIbiwbg5uW0e/BKUH1IQ23s
	mIAU6Pq4meOvKzILxnayNhZsi5ub2mcFERKgU1Q4X1HK2ii1kgzzHwd6G0FiR9FD
	QRETpj9jeDPk1by420NtcBuL0h9ptgxDpat7CpC8hNwLudEVfh0bIZr+ll7Z+SVt
	akDog+5+1NkckSYFb3hnwoaafAp/+fkrXU3GW4/+QXgJ5VtdmsMJbRftH6NRWLaU
	dzX7R7haLhZeEHN16LZwkMMKpHqWwxLNYfN42PjXnsMFnxTM1HnGzB4Yk2ffOO2N
	xI5Okg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:32 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bdbda8d453so3621618eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046972; x=1789651772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=kfFPNzwPsCp5ak295H+0nhhLSMqu/6B1+7CIJj86qwofMuzm8ZksjKkJbx0ORrT6fU
         4EMU0Idf6Xwh3BrzRICzW+Bq5AbPuDcixX/gHgMpQISod4yR2ezNVYBI47N4pvlUEk85
         Yj1ivubZea4sUA942+6SWAil2RUvnpTzbT9qHyfZTeeuUJOw8TOI+bdSsXWuKX5Fpp8I
         yRNNgMHLvRk2VKnn3dyV/QDhnj0m6W0WRC9yP7aQCOSN/FVYJwgAKai2YH145WzpJ+Fx
         QmAxsC+ulvsnK54/TvrMj+yyns9+xCyWCVjcpha4bWDrls65d3GZbD/FCu/xB0YYBIVj
         06RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046972; x=1789651772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=kT9uOoYlZEN1ypOSdtYQLIuUVNJDH15O4bJQVY4Idan6yFDyxByV52NF4MKSLAFgBC
         CuG1IXIUd2wF9hhI9rIuQs3Yye1wEwaSr1YYLAGXuC0+zfc3p0ushH6bfY74iX1JYGIV
         l3Cdrz6Ksg9+0HofWBGCsf6sppeZXu419oHrtKfC30dT2I+1T4jolCHnOtrc792E72Y0
         NNp3S+QNO462As9BxHrTJ5NmZ4i77MJeUwmEwSz3xw8YJ60EbJ173v7rYCY/x67c2jdv
         5frkLP+nnWZ9d/ZhKoJHrcwJFN2c6PwYw/ge7V8dBmY662Oq5hrJYHFPo8QUzwLUtW9x
         CIvg==
X-Forwarded-Encrypted: i=1; AKwUvBwTbrva60c/XVhZ9QP2e2/AF/zwm3VP2uorAJmfHxp3w5mUC7NlwlXF2yuv34f2dImV5kN+CY719r6b8HM=@vger.kernel.org
X-Gm-Message-State: AFuF++l/e5q1X0JOBnLEZQiCjtUfKYFx8u8SGiotCatyFSYzndAFSTst
	1YJ2+RlCjCSOkB51JuhOWdSKswQgU7gZOHIU9tolfrOXvveJi3wBTxgGOgnTtWVRCdGSPNw+bwA
	c6GhZpzbm02pkCJjkKS7qcsSdWfrMJmreZP/oG0vg8ClZycXFBcLOPoOmN+GHKbL4efg=
X-Gm-Gg: AYBFou3SNITFpz/27VSMyuxIeKORVV0hQRPsdxiV/sUGCi/sAQBPRHPe/FEZPZBrLuC
	BLMXtK4A2XTqVCUfPwvUYnOGJXh7mqStbe9uoYGG2mBA0DlEWhirnGSpPWV6FR199oZkYRTf/UO
	cJAjBEyqWXmt8LSk5GGzvlRw537/45JoSLXkGNMrAiYNXRhKa/y7NrujD1+w8nwUkk3bzJ7R0BA
	Q5NL4ZnDYjSrCBoNjVxXIb4naum/VW97yUJtBqdd1Nq/niVW0IEU2NLO/GxB7FUnpNmaBpXasme
	YKwhtsYvnG53mvZ+Xr+sO+4cRlLE//ZxqjWQhlILJtmg80XRcX3u/GIMF4zBoS/M5ItXyBnu/TQ
	MHK2vvoimM8Cg5+C7OA3Xp08fLf8FnBqT/0k=
X-Received: by 2002:a05:6820:f021:b0:6b7:83c5:fde6 with SMTP id 006d021491bc7-6b783c60324mr24813687eaf.39.1789046970718;
        Thu, 10 Sep 2026 06:29:30 -0700 (PDT)
X-Received: by 2002:a05:6820:f021:b0:6b7:83c5:fde6 with SMTP id 006d021491bc7-6b783c60324mr24813654eaf.39.1789046970293;
        Thu, 10 Sep 2026 06:29:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:54 +0530
Subject: [PATCH 05/34] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-5-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
 b=IkUgIuBOekfhfpKxy6eVpoCQCOSk9g0eSiscseX8FlZXXwn97G1B4zvfbHg0kJS1QHk0Gj9rb
 97Ved/E/arfAYJ7vm8T8Sp2yPXLIm3S3qfRvW8IesKZ+tLLJnAjwN5z
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5GE5TMoO5uB4
 KydlCQp7awjUiV0M3M7w+YVAz80ODiH2UCXqwdnzbVSLA1SYyWedKWX4Env5+qSzw3zXLA41umS
 rzmmB+YlDiv85IHyvcRofLmWquNjWUEl/Ef1OjeLC6CU2sCc1lt9UZWulgfCPzpOR9YH2lgqEC2
 e4ImcJcOxSEBk8u4r/LN9f4/oy5WOu/WicuJub+sfPcESc15E6wuf5ZkYfukoosO2xlE4QJHJfA
 moNloAE1f73UB8wTvGT3/iC4g4b4wfWXDtxGpbVXmM1YGlQ+du+eT4sWlPHOrBvn/JXMVDzccoU
 Ko5U/uFsVRE65nzfDmT7MTSId2rbAwWuWY+oBeJLwD6ejshEdyDgfNDL1rqmgJ5n26Albxtl9TJ
 K4U6ZuUJs012XkS+5Uzt4xmO/Dn5qKDfjeFJuAsTpumnvRu6tRBX/gRTPxRWJHdwrg5b2jRTzvf
 2JUKVAMbXDSPeXmZm3Q==
X-Proofpoint-GUID: AQXcAZGu2yZaH4ehvTn1gnygrp7zYxMo
X-Proofpoint-ORIG-GUID: AQXcAZGu2yZaH4ehvTn1gnygrp7zYxMo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3e3Vg9xco/Yw
 HrvRha+OEZikSacRVBdC9cPsXIs0beVz20yFHWv8uNeoZGfomOk2KaCAWA9peC6zi86RmVzQCn9
 Psjs/wm5epvCfDh6WqZiB6hEsqeZHAw=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b0bc cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..74df5cd86f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

