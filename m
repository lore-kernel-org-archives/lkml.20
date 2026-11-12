Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523179;
	b=CvzYWT1QPJKuK6We3hw/ppUyj47MQ4bMuYiq5HHwvxiV94xhOyvBMwUTZ8W7F0M4+WHw
	 zrR//CL+MXWz5ak6zfGXN7uDFnk5Y6DPVpLZLXx99Q6ECZP6dzj7tee3d7vWjJ9NZb+c+
	 n7WHFXbxqYcvNh+PvzqpgjJHWJLjfzLc0DQZXf9EyAUCYTSfvBmT/u73Vira3ENMHYLYG
	 zgKGwytimkcuw2MmQImj+H9KyCWcrNuHRf/pJk5aXgR7EYBS0vcl0tm9uU5aqcN6lNTzr
	 HGCjyM4lKG19a7krtdsbaYOVGqk99EYErjR5kn7T31mh+WPKGwAjTsJVbyketG5PPMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
	b=ock0XWjFpROCDkiAEXWrTXkcxODymn48WD9hbjqhbi33YKz8TvMEZ58VobTNB3EMgHE4
	 sHoboVuHtgxms9dT7N45/2n9WdV5hdr428Fr5x9vJQPSOWlgMoWQUHiBPlFcnvRgQ1XUr
	 qrLjb9c6/ms0Jx1zzjW2cTq5t0dWauWiyMcwj2FTrbcEgXmgKH3DiDoQjPCnEY7ky3n3e
	 nReMYCgTnnyKlMTwnj3v2mlWxmIGbUILhbCckrbRA4nQ9XUNBvD/0tjSr7zUd8oT3ooSR
	 7n0LEsVb0VbULbxho5tdkeGK3hcN7IfpuWL+NvXwXvUN3V9oZQlspWp1tBQUIWvgrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PffptluP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJVhMhO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A11606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A11606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PffptluP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJVhMhO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZYkt2266601
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=; b=PffptluPAo9AWFlH
	b6SXJuXvj4CNYdzrEcMKlMqjIGmfFAw7foySfT9Ag/2KpLeCba1+0DawoDpHTet/
	73jnUhT5yV+GliUh3/VuOF5hAa4cus18hUMidkNVdBA8XY3KvosqC9SIzaJzcRKh
	yjbvZBJvfvbLJBA/n6rG/sDuFoUufFwb+te7wO2ngClA95Jk/OQgtKjnrn5H0/yg
	XTtxdmtxb6DFy0nPlmmCmPMbsw0em7LuZcdq82epzuuMJSWB3mXTWToMe3c0kCPk
	Bhwkm8+QdgpVkcNYwvvx1kqHLq/wwlAENMop6WV6iI2gPMBG4a/+DS+BZHOKTScv
	YfpPnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc3jn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso983568eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523178; x=1795127978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
        b=FeJVhMhO1ZG9zVHEigvHJWvYBBrEQHXGoocJNJSCtxDoD6UxFFMkxlupoBaqbA+M4V
         o8RmQQyw6QkQKGovol+mM7LYC5u0sDQTnVGFzKHx7n6eccYUIIvLAi9/7igSEqwhHXmh
         ZSFFyhTsuHet4QGuEsgffBo5vWNeR+5gCJC+d593K8b4jJyg263NniFo5585dgY8n/1y
         RaRZPCYNLEvC+uOeyK8fWOqOgiNclpLf0x93LpwKWsdbvMo7Vo+GGNOY4jZ/hJIbroZ8
         R67DBYj26P+C86ChVIXXAwVMPGFfYxzcbTuO8acVjwf0Y7uMvRIlvtCPO5UOHmaBkCxM
         8WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523178; x=1795127978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
        b=H7qYosusD9JYsTnAt3tgb82TbntxQjsQAUAkv+2EYD1YrqbdejwCAHpn7gXD0Nm0hB
         M+d1bH8dxNKyrg7astkQScWDT3HtW99IDqi2xylgzM2iVM2uRCcCachEFouaXt+TP0RK
         CD/psCKhYn644+nWgYPBZcG2cJ5dRAWKna+Xkv8nH7mTRcI6VNbq9NFGoFclaG/osufZ
         jGATteNr1ggdcfgvbNXm8q3nLKwtDyBHpgQzii0MD7Tsj5rUuKZmtxYwdtugeKCxXeev
         FxxosyM7skm2ca/XoGb6gHxW9pGYD3bp6QWynAn+xpnnI2XUdkJnuqDTOobGJjuvPTOp
         7dww==
X-Forwarded-Encrypted: i=1; AL+hErEHcYkx/5g0DOvz4YSun+Yh/678XDAO/MaMS91vySxmGZJ/opAhaeWh/7FvfZtHXHBmxtwuXkuyYmV6YVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r6cSl6d5xzpD4fe+h72wSIJSwNn2h8QWVRSApVA0aSZ173HOE
	3r/MvOkQtEpI6SwodjkjpYlfBeVpxtAF04SyhzJELcWClW7Jh7b6VG/o9YJ9VWIr7leQ69ABYuu
	2KQKswYxddcRTb0hPOjzFVQGFXSf+MSl2TfXjnEwb851pdpN/P6PBrLSa6/RpvH3uQhU=
X-Gm-Gg: AYBFou0rK4lX0Mx9xoI4+MCSm4NLq/nMeo6hWfgAG0SbN3zSkaedOpfe0FW0i2crmQG
	iLfuVd/xXTLHu05rvLCxj29RQo6qmIGIJHnn9UPZ0u45vTh9BrggDqUy5HTlHSHHmwysfRbtXtg
	7PrUlCJVraTu6guClwnO1TsrofFZU+HSWWMKPLBswb3xRCcJuWADOWhnHdOBMWhb9+mkU4lopFj
	sw3ImQyINZhErpef+wLFCGusLefePaa27EAF9NgveLLit7wuyouHuyPTnfV5p0jFEdXZpgIw/7O
	oHeBRYijZDll4IzfTMAD6xPWXyeGW0htOJ70C5L5fzfIeY5s/ZElz1IjlOdTYeaTzKqfUw9q4v0
	Yz7C68wtGgB8IIsKtQUGFkU6/LsMuZshr40UibdPQhiPi4yrLmSNwuwMe3H8V6uA21PZPD/ECh4
	5hLqmV5N25bg==
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr2727948c88.2.1794523177996;
        Thu, 12 Nov 2026 14:39:37 -0800 (PST)
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr2727934c88.2.1794523177498;
        Thu, 12 Nov 2026 14:39:37 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:37 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:30 +0530
Subject: [PATCH v13 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-4-258dc817bd63@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: q_jEJ_fmFcZeTTPH2I8IYvSIiIwEx-Zq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX8318z3+i7rc5
 osPX/IKD0o0S1lFPEXctmvj3U5bg1kfJw1WNDfhJQ9M9lKgd0EhtJNxxzZ3LO9v6eedOelj0nxA
 QhoP9LDQlSiNLOyU8Vtq+5VasG4ztfc=
X-Proofpoint-GUID: q_jEJ_fmFcZeTTPH2I8IYvSIiIwEx-Zq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX5H1KQr+uqDCB
 vLVL0Wt/6L4iTi5/NFqpWcDxFug9ymY3jrp+GMD72IwW/LNPdL9MMBVsB9I5oM1foZvE77m4s0L
 oh8Z/Xwr7TJ7Agd6JhGgi0fYCdJW2jsJaogJy6uno7ev2RZS+1KHttXU4DDkHcj0GOPPOvpaed1
 nkVVF7xL+/+9RvE4wQcQGQWOaqCRK7BiD2Tun0jEOWtLlI14gTBV7q+DNXB1mVbhLJlWfypOGG7
 tLMoijkd8h5NHoUAyYxX/0nPs87Gv2d1U49lr1tANN+evPc0RAeuOMLfrJhELay4giG9ABf9W1r
 oWLqtF6IfwhMM5m3pGxpkdYJ3/Ufg5atJy4fCX/u4+jQuw9uy94Rc4ePtO3/sohDCBF0hcUFDgk
 GBMXt0nkBlEkYIj+N6aABpDIzqIg1tClbsjXNkZCJ9s7Z55sLv6hwQYH/wtVW35a3sG9yu8XjLg
 KjwEDZeF7bh037Xt7yg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af6402a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Gfx0KCctoiflwLzBlNcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Kodiak
platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..397764d78dba579fe95654deb7b01ae3b1735f89 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1100,6 +1100,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2608,6 +2629,27 @@ ice: crypto@1d88000 {
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
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

