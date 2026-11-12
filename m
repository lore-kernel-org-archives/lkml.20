Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523187;
	b=BtTE4B45V4LdfGBFyHbhcwhGWEwjk1JXxtPUFPng1HmitknQFtEToYlOsVadZ96h8Ndo
	 2aAH8mRjE9DS/EebKCJpIptAiXtxLRj26JHKOgqGPQjaVDJdyWxkIZbBnm0YdwNQ50t/O
	 EcY3wfgp34yH9piSu5UWmHp2b1Zo7rS/N7TbjSK5cg1OaKJyPg3ao9jxOcvfZ+XadiOdm
	 nQQ+Os9c07BLiU7pIuPEgk+AmhxCOA5iyqIYDPX8d2PM/GY0l1wxFE8Vj7Se98R6fv6fT
	 sM0gwh1OUegfOAKKfANsfFRg7kb66tL1uglNygBPxUZxjnlmvkj0oru72XKbSsVtcOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
	b=JgAv4qCd1FWjfwOG6HlJjftHzRkNcG7dNreCoWOE/MWUl5rL6SuR3zc4P5QIQrF/zn4B
	 KJlSJdAsEiSBZKkrNXDfYhxn49kWDmYOnGHEukbjln8/2HtCUDsSGGjJANgUlidLQ/yki
	 iUiKB1SWEgeSf59aVuhvTVM2Nl88JsyxqQpayZdRwek1xyNE9eWxDdg9ohZw4gX/rPpx8
	 L+B22Sn3ZtHSamrargUN0JmD/8shfD6oBPEW7SU1B4DZuSU4+OC+xUoooN8ZgUqtexiiJ
	 WAzmIXQCKN5KmciP11CojIywoKjQFtNapzn21+R0TrGB/WajOpl3XSJ9B8pVY+PhE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwzFUtuJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272160A3804
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B272160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwzFUtuJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZuJU2822673
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=; b=Q3xZNhkBWFe1lWE4
	AeuH8BITv502qgQA/TRAo211X9vwsHk+KQQlAR14tBWzdyvAQPKufqKCH90hoe/S
	b/wTZ01ZFma0DSVxlG7EFUhW2NCf6x2I+IL8c1N4leJhK9YWc6opA2O53L/+nDtD
	zX5XHeB1lhiF7COt3FtfX4JJZO1EudxCiIQDj0aBz/TcJUxmqXkPS/G3Aavvy5vO
	/u552aoPrquOBEAIYJ6a4rKMDpvq67mYgVxTPuJOOkj5mn5+VK23ULSU6njl/ZZH
	0GSuQj6pjXgjDBjMWdXnHo2rrkA56S2hkvCjhCANCACcX4l3Gl7mIpCLT2PofdFu
	C0m9tQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs02gda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso726896c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523185; x=1795127985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=dwzFUtuJ7ekdHlCB0W6m4FY+Tv/N3J/oXG1qgwuVTWz72d7htWNEnPF/UU0HqI/KNt
         enO0kjufy1EFhnVarx1pOl46rHvcJJkiMlLyAWF33O2oEWoHZddiXIcfIO0fizVBzPkZ
         HOAHB076y8it1Td+OsGscVrarLk4l8yyMMDPuLgR3SE3u+ov0qmvLElgrixDBjQMZjiU
         EE05vYEVeFFB89vEuRxcZo3Yh9Xo9QgC8eeLEb8NS+UPOW5fmosNOsWhEsNmuE/+/rJE
         G+jVJ2lvqkTq70CkpdJazFS6X7PpmViHMDj0wkSKV/kBr/tQNPDeS2C6SdlN8sW/Df+n
         uydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523185; x=1795127985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=IUvwRoY3x6WmBGNk6kMfD+M5nyQDib/cmC+90QZyF6WL84d/ARHFGy5GTTh1pozjKF
         GmderWvvjeMhlBh/R+0K6AJvAtP6FBwOuQ9oeGJzWvXc9Ps7xk/KMSxwZpSMn4o22iIH
         lajCPzzg5+AxeklTld9B08MshWykpzgb150k0ApWJe4E2HAJ8ErUwqrFJoLbnD6uPEMl
         oKcTa5xlxiqR70QJG1+GUOQ1QUzt68JHrAgQcVzLg4fW4a7AR99JAGGogfG9Bx/Y5e5M
         S+zzdutOFbzu/mgsrIj0t0zGVMUg4kzZ3Xrw476RDs3QSTtEuEchtDC54yo1KQbxTc8G
         vvyA==
X-Forwarded-Encrypted: i=1; AL+hErHdUCqnBQqIcOGfd8X9WPtemLiMbrIweRz+/bFdXyJ0T+CEucy2fy6TQP3nBqumroUeQQNFfyYD+COm8ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wqb3S6WZWhiAfA2+R27ssgf01x3uXKOs8iAr/1/+yTZliusXD
	GIrQ9hA/rub9W3eaLU5TyE5dxj42ZZjs5nfEnSPhti7bhkvxfFcGd01hdaLOstxVXhwwJBz7PXX
	Cakk06w7N2qakjts0GY7APBHQMtxMtit98RdmKmdKesG8ZP0Sy5uzZD+4w8/qhm3IGqo=
X-Gm-Gg: AYBFou3+G5oCUxGZ7E6LJB3vmiB9JAte93emJA7cWgMs+F/KlSKCQHls4pcX//lCp56
	z9dBGpezq1DcSLX6kgLW/CHcRUz2VwB+sV4dUipItHCt3bRrGtes/Cnr+8SMP15h9JDrXNqnWD4
	qA2GUNOm/UZ+fqlmaQ++HuODn/W1rUi0fYBcBE783hvZTqHyOjHCv4x7i+xcXoeSNivU8Vx+Pmg
	B+qqDXt1A4nVTucbcqiupp3ooSZPWy+k1FQ/SE9gL75WJ0mEE9+1IIPNJp1dP9AQFBSS3Fcc2eq
	mMJ87unAFaYoTkARSsHACNizEfucNRtaUe7Z7JAPe652Uoj7L/dSucRKpYl4EVGIcIjQ6NzRDx5
	MkDcq8FWwW0rsJuCHDqJvhfvwgx4MgbfbrTH2pgSTpM9JzLHLzRgsU++sY5z5lt4quTHGp632P/
	pndBsR6EE0aw==
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895756c88.0.1794523184480;
        Thu, 12 Nov 2026 14:39:44 -0800 (PST)
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895736c88.0.1794523183996;
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:31 +0530
Subject: [PATCH v13 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-5-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX4qE3sg4Th4Si
 0H1hzA1dAuhnEwidDx54CcI9N0StrmmknTsTftcHKWsiKj/L8gh4qvlh7kYUfzMvHGeLzI1rI3K
 uY6YWc2+1i43zmwTuUC6FFDjtFxHS5P6rz6ib3+JEbP0YVKAlJyMqdXUz+ui4DAJeqADvpjU/Ae
 UqU0UqMx5S1Ve1U/LyvlN/aEAYEgr0nJaeOjFqMKmSaEkDHFmUXUhjvhe1hvy2HtJx4FzDhH58L
 ah7vmWjXpCz2fgWDyIu4dSl70neshaVC7jRf1QyRNX4PxtipMW9zAK9hRwp0SEvPOyTaMwuCJOj
 YECl92cwkseJ8EfYHtaAZZQ3q8wXMwjVdUjCYBL+5rmSKcCuc8kGMPZkaP6Gss7EefPkBfVTkTM
 oLR+eblYQNKRb1/RgYHgI8wNHj+QHRIMeQDZWCenkWVOBTUFAu/EsyXOU6j+oQHRTam4uIqjBQp
 7HmNycC+ziEXqiUqVeg==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af64031 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX16P2glSBDLve
 tnYrIw27CTU0O7uqfEKXZplHQmJf4kboCb6dm/lx71HBreTGRPOSGzlv7JJzGbaa0s+vPqx8ZfL
 Q6brpOqL6yrjU/Z6gSLJPUbf77VMLs4=
X-Proofpoint-GUID: e-nmIRv_wBoutUX3LK_KV1tKXuN6I58I
X-Proofpoint-ORIG-GUID: e-nmIRv_wBoutUX3LK_KV1tKXuN6I58I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..d7e2038854b0bdcc91d65d5712290c690e772258 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,6 +2725,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4890,6 +4911,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

