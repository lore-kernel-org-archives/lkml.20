Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329777;
	b=LpYwiPBv02AkAHPhMNy4KkhMNsGeq3u9U2eZ/ZWfIfXDCimd31U5ISnLLm52+2sevuns
	 66ZICPBWV3WuP8wM6+O/gqInIK6uPoY1ZDJdWv6RaOqEO3f1HdhUJXiq55G2yigtrs94l
	 ZviThYnAqYypbCPgaW25n0hOF8Um3WSBB7JvTDgyFEciGi0p26AcwfoXnxCSZHDHfha1i
	 jCSA7/2Md+i4p3U9kyuMDvADtRQZMi0mtWGxQsV0M/LHW7sOh4tGs1KkvpmBtHlm3uSa0
	 7kKH5jp90eeRcdM16GIyGZCgHfjxTa8J4lvE66ZgeL/Pz0+cEGHLVH01DI7lc5bHDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t9B8LOl9eRKECAY6vBT+V+Amr9c0AFgt2hSkAYoPyHs=;
	b=JKOpzELSFgufZtIk00snWATXbw4aFGfOQ9HV6MVey08OmcwLv3skWnTAcYbZVIF833qE
	 BQ4WsajlW4du6I2o/4rfYpR7vngbtn5ZiYRAucDK/DXwb1JZWYK3Ae35oj9kmCKfqH2Qz
	 adiqkcR9eVkz378hDkT/JkBvu8spQnBimMWmlvCy9LQojC3ExytmAdhQ4Rq2nO58/Bcqc
	 WLO6CVQvVM1MinWoLK79lg/xEbl2qT9jZc3WfS3sUKOfyeB2le8AK/G8Bwz8892HoJLrd
	 aCf274Uw5dBS2phGSf8D0Xz8fuBZel3M+eawb3WRjH9K2eyxVF/5cbOOocEWupD+QVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpUyHgJE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A069606A31A;
	Fri, 30 Oct 2026 03:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A069606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpUyHgJE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U2K8r2889225;
	Fri, 30 Oct 2026 03:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t9B8LOl9eRKECAY6vBT+V+Amr9c0AFgt2hS
	kAYoPyHs=; b=hpUyHgJE6yP6aQ9ptVpX2v1DZ1fhwhEspvqHGsvVmZ+LYDpJIUX
	vSutBtSdmxLCNda8/rFF5uTNSklwXlIt3yk6d5SqoX4IQeWGUPc8pKLDHSZq3pWy
	bQvPEMXcK47gCmXgb7z2GsXb/YhqQUx9afcp5Y26v99dHaq1przis101aX7pUL2T
	4F/iXtCcy8mNGJGEdbxW/dBsrfLcWfxeUDxnHr/71PG5SzZJWhjnzwIHCCWzPEjK
	PqMIwJMoIf9skml21X6dNUSghiQjJRrnA3z1kAD9eDivNQEwxX7N+yo/1k0RZ5sA
	8jY4zWNFe7gWsvfCrLejTye0TstzR2eEwTg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p0y7n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 03:09:33 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69U39V8w1943462;
	Fri, 30 Oct 2026 03:09:31 GMT
Received: from sdciot-sh01-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69U39Ve01943455
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 03:09:31 +0000 (GMT)
Received: by sdciot-sh01-lnx.qualcomm.com (Postfix, from userid 3972706)
	id 2AC5E211E5; Fri, 30 Oct 2026 11:09:30 +0800 (CST)
From: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com,
        Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO polarity
Date: Fri, 30 Oct 2026 11:09:06 +0800
Message-Id: <20261030030906.3856759-1-zhiyuan.sheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAxMiBTYWx0ZWRfX1WqUkRSi77Fm
 hujhh3UruTHmlnwKUwPsBtAWoZkZdpuNQpyqul14QPpF+Mn/JTRB8Ngarkt8wlxfybBCg2euz4k
 tXyY4J6m1JrXa7Lysi8a7xcGiQxCjjWUmU2oGD0TM6Cel1nDrQ4re7TuDLeHEml4kd/+j8JFILq
 wksQBbtPtr498mRyqUMejGz7rPWO9B84n2TzAgfwjhz33x0B05iVNkEkj07LbY2Letvw2cqjGV2
 NVvV/qqsyLYsCEBw8TyHdU863La0GmSRUm1gAMH3Ah7/FMTdy9ep6ObnqyVpq9zfguc+gxPEWSJ
 v5ISeCye5gnXxOVStQrgkdJnU4ypkIM3+AjE4XndsP3jn85ZGgdXOrNZk0WTeKe/IbMC2fHgzST
 lRmJdPsnsg9+WAPqL3OSyP7DWEYamUTadoJa9kkvRvDcCcoN0CeaqHbsNuiVpDTC3x7X3ck9utB
 Dqy0qEr2AWCOXMLq88A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAxMiBTYWx0ZWRfX10kCqBcmaurX
 IbjXfZiOlcwOEPsQOmP3iyO4o8XVL1mckNL7h8OR0JjFg4PsiOAZBVA+Hdo73MA4WMpb9ewIgG1
 snvQjuE/pK4498h4rw/lkkjzWhV4P10=
X-Proofpoint-ORIG-GUID: AgH3HYYayCbwUOSmjqGOgbnYCTeozoSK
X-Proofpoint-GUID: AgH3HYYayCbwUOSmjqGOgbnYCTeozoSK
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae40a6d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=c38QbCulxCfvbD_P-AEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300012

The W_DISABLE2# signal of the M.2 E key connector is active-low as
defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.

Fixes: 073c6a891eb3 ("arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
---
Changes in v2:
- Added Fixes tag.
- Picked up Reviewed-by tags from Konrad and Abel.

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..2e380ffee658 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -98,7 +98,7 @@ connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
 		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
+		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
 		pinctrl-names = "default";
-- 
2.34.1

