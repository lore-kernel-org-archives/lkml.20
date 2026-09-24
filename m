Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2047A88F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246496; cv=none; b=fYcYzkYmVb5bNx0KIDRLsqN64ikpMCWijmaiQdSjCqsrVDT5MOwhNAsz2zXzk2V+s2JLw8x9+WPBiJnP5ecf1Rpqsk9dJtk74vvRv8BOjtU4n9JZu3qsU6MHXbXLt/hVPVeiW/r7GtBu3OeouBxhSRa4A5sc9xM8ZEnSsWDqvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246496; c=relaxed/simple;
	bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cv47iCAGjVVrADSDFb0BBvkwCEW6Kbpg8WYyQeHy9rKhvrOLfCamYuSNZ0DPqEfNhh8ybAGDO4WeWhLsI7E4o92L7onFVhC84JtseD96vIzmZMTuPV8qrwwXzH2HCFRkjbuJ60CZVOy4yntV+d8NzDwQcFSmERBTzSk5A6DzyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTNuRUs2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUQjBgBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTNuRUs2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUQjBgBa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PMQ22919243
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=; b=dTNuRUs2jLGRcSF+
	ycJ384KkCnITmER0A5lJ1lQw7iPp+G/5L1RjNA9Pb1AAVDhl8eVEknHMyqUQqNKu
	7DGKrkq1ZWZcyEBXYfOoaRQc7mVu2KrzJV53rPxvCZGKc3S/dhTmR7CyurEhJWA/
	wSpUJkh1RXokYDImxj3zVAmWrtC7wmfZcgP1VTIXR/BAriT0HELQaHn+y3TGY5WL
	doLFBDN9YnqJBtzbMXe8Kotce48QVm6FihydfrHbr/fL0vDIK8tvJ4nSYD7RioeZ
	FRSOqHbUPEyNGWUz9/mHIx50rqDCfQfG4iVrv0mpqyip038G/FPSK95NYWkutVKx
	lSfbug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91049eac948so29238396d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246493; x=1790851293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=SUQjBgBa6aLG0ZZ0Hk6dYhAKFlL1Ekkf+6nv/wtwSlYBp6+OgPq5eR6JI1l/I8vLAV
         koarXX5eFcqEHIbidDcOl6/R0kpl0RyeUPE4ghmS/Ebko0qvf/ZONuc03zoGeFte1M7T
         tHA8L39R4hAlhipNxQfoMIKi5JYWN1mMN6bqxGyjQuYm0nUTjFQd6YRms9HtrkHKF3jv
         johfG4HRmtWHgBOYY0saa4ycWw2KDKuXR0KvrJ750tK2vXrcTlNZih8shdtEMY5osmbd
         X/Ddg3mc1yIQvvkRRoKuPD5MBXKbQIz2BgvS9+IGsrTYc+Q0+Zg6zPqyYdQx71aKqPi2
         3/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246493; x=1790851293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=ym5AQbrQT3WS3Qy6KKjwNeWD8JMAU+0Uw7kvwdoEcdCxt9oGoSlk+jOwK7vvtvigK6
         lDYgwalSP/Isc4fTKKwQ4zUbMzSviYbEKTuswC+vFHxeyOv3jPI+1BY/smwvEXsY+J+O
         b9l6+z+w29B2uktqmo2gmxLUiFIB2Xv7SVOIFVew/oY9JNIfBbV/WrztSeMvWIOq4IkU
         Wt1rblydkSaDiKXPm8Of+Nr/88xWDzv1aixFfUFGyKFqd/tS1PD0fScG1EM4+HwnPSTv
         tGflHrchWBkVBi6oX226hij6nzgO/2n/lG24GF8ZCHKzBrsemsxvaSmgyaA1ruOmOW+5
         lGsA==
X-Forwarded-Encrypted: i=1; AKwUvBxZhwG93qIKANWAZZlIpppMYdtw4alaNPSB4K/gVwxg2gQ9GiMaaKc2jClLNU2ltRVeeI8KJmMWNIja1iE=@vger.kernel.org
X-Gm-Message-State: AFuF++kvZjaWO5zUJ+f2EXJdXzx9+wJ5PzE7WOdRmq/wNWAL64Eg3aMM
	mk8ykYTJrHz5EQUrmvDrxodQxRfBfTmLMcffNW2/XREvGbpWlhkTEBsxTcBRUNmnt5Ye5ql+OyY
	EKLSFa6p9z+aTweS8AVg++k9EOiIl3ue28bYbNBOAz3pLmMMZLhEwIXJhdlYxaBIt9hA=
X-Gm-Gg: AYBFou1F0r3lkbpt3SL8zVQVQ+UuZrEfnlKNpvJIBbzSP5S1SUEfh7CvYc3PjuORjbW
	CuSO8wuIlx1clx8hLl1WrwAP9xt/bLIDQfSB/uZ9uC44tiRF5EyYaWeR2Lw6Y+S+iKImlRbMBDP
	pqfK1RTCjkTZRGJEJCKdlIb1eWTBP5YPWujKsThtb5g+J4G1t74KGY4hSFaD5o03Np+cClty1BB
	hJrQAsBZF92qED40GTZQRFTJ0YXepVXoQAsKu5+rM4aBLEs1unVcY2XeMrN3GiuPy3/wikXxSsX
	EdawBr1uws9Bosd7OikBmbviC0sFd+vKl+5Fti0L6McJ8zw4B+qXIysSFSmbkypx8Co+PADCsjC
	VWxu3+83e
X-Received: by 2002:a05:620a:29c6:b0:93b:c61c:e765 with SMTP id af79cd13be357-93c3625e8b0mr221937485a.8.1790246492575;
        Thu, 24 Sep 2026 03:41:32 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:93b:c61c:e765 with SMTP id af79cd13be357-93c3625e8b0mr221930585a.8.1790246491942;
        Thu, 24 Sep 2026 03:41:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:45 +0300
Subject: [PATCH v5 29/42] arm64: dts: qcom: monaco: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-29-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP32Z4njOiWYqSK4tc477qIZbUaDaiUbfHBrF
 kxsdUprotOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99gAKCRAbX0TJAJUV
 Vju4D/41H/FNa+AGSSRMNGgOOqxwOgdqDNewlwUZIWDqj1lDh7MDnwKj05+vrmIDeOBgZUcRfU9
 dTuVSD6tR4O9s7tWawsbHz9oopSR30kCnZCm1sERoxy3a2CZnZh3jW/LFhyZ50hNVizIpl00DgO
 +FNmACYc1cLxc/0RlYFKnYes1K6xXin7+K+AM/vy7KK6fL/jXX0GuXG2p5e9tLsxZNYSqAAHZen
 Ttx3rE79JyrT6Cx6kT5WcG80Xmtk1TeXHKc1HI7rWRl9VoLPKnbNHOBBz76yeBXN9ikI6Fgmw67
 yxRAlZ2eRxR7qjbP/29MTwJieVz9QKXv2phxrRTH6HFdVFGhDQqZ4MoJ79ImVkyj/4XLtmJARYs
 +Kxx/wvR9nep/ptWjej6NPHXuq5PqIGtmkmZ7Cvghox24+y8N3lFdJDsJNUsOXn2etMWHGul96H
 2U0YoHXFywsNhbm8agP/8iIdZDG6X3Fpqzu2A8sBUrMwglksOIS2ufjfK2FwAcpIkclpKR1fN/a
 hbE769P9EjMk2H8xxXhrjWwPZIo9IdzEEdTi1TwsF09an1XT+7/JvYkqAW3yPx1sy7b0uv3LUio
 OEV99l9mHdaQ+tyWsNysoUF49pG6IcWNvnLzuXppW2TGEJ18myo4KTvlVWyj9l2IYZPP/BtKWTs
 RZRwMuvhFK0P2BQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9hfzB2xh6uS6
 ExBAKchw5KMxP9TjmXxgvJvHFAeeD+kVxWvsLF3VgRUmR9E2odek4NEiSc22QBK/uJDfCl1ZXli
 pswOHB8DF7U/YjJu3zK0vIeuaCw1UNM=
X-Proofpoint-ORIG-GUID: DH2S7aLCy45O2Lw06Nu06IsJNvT8amYv
X-Proofpoint-GUID: DH2S7aLCy45O2Lw06Nu06IsJNvT8amYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxzcpRSbgHJCZ
 v4VB3HauE/TkiT6kGrwS231DtGB9bouZ6XNDMTt6RfcrWZGah7jpaAfFhxkYXPaUjt5aeCbvOz2
 WDzjfl91i6+Pj7p42xJaz2weeLOqiW5I61WnbUfm3tLEUmyiMYyeHE4nSQSUwq6/guobuEQa7iA
 0RwhnrzsZZtSrVFhdmLaGBJIXSHMS9EkN2had9WvAPhBQnko73Y836fOv6qO5BljiWf7jJrBzH8
 vvJFiGkUXPrGk/U93Yvz/Zlg/rth3TdOqGRAWDyFOpryg4ZBHdw1RXZU0F7pp2hYKVQJHJ4uGvu
 61k62jvkQwNgslSbkK2znraKHZ7PoJZ8NAqfClXhfiyXZgHsp5ClQ6RtCOm9QT7mJtHf6AWQIE+
 +OEy8PPrwP3uvRVSMWztHaxT0SDYWzjaGuIzregVHmkWSCYKJaHOdOoPyvz7JXw9WR5FTS4wsc6
 FATSkhi8L9szytfHmmw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe5d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on QCS8300 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..8478e81c4ada 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -897,6 +897,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

