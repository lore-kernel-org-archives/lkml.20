Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560546;
	b=WGf4PYR+XopHRxhtmWTCalku/xNriKoq46wmcoVj4o3rI0dPTxFLoBcO2tnRxOX3UybL
	 db9LXHGMT0wPFmnvvoDVGvt7L4Io9nS6MRsI/5DvqLJk9nGuGLOTRV8uytsOKiwBG26pN
	 T+BzuNPzU3+ELikLR5qwpTMHLHTS0S2d4X/p4ShTSfPGTatEBOcrLXx+8AHe7XZA75MD8
	 cI+mlFLxm6wnnWvZ2M3sdpfS6wItrzryFdFRcTPTPlrCoTFc+Fmc58GQz4/ytmoQMTyqa
	 Ga9eh/EFzeir9e7ZIkUdZ6qffGCnchSVVXIoZhY3gG+F0ee6uBFMHy7TGtYOc37Ax/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
	b=Gd1rF19c/9ze+hBEIn07+ZdelfpH/aPkoCZk2KILmSoOil/29ETYtxRfZdQSHQ82z4XI
	 lMjgDCj9BgNQdukoq2WNo1ZmPjzQ3/kMScX49URY8RqjZUX277JZ2+5rTRrdr3LEh2TI9
	 f7qjUvispJI6RqlUD6WskXX6S+G9FaZoS9Md1tg8Zq1UUgWx76edEuy0PSf0y/pKmf81F
	 f1kGXiSX4fUdMfwnEMuZOGig6YyVJWnzWBL9ofpHvc7L74vAWZYOl+PXDefdXaH10lDkf
	 9/YbbBipIRB4KhyBDbZpbzeOLDSXk2bojhn+jc6pEPHyIzIc38QUR81c8Qh4s2ffYtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rp0BUCef;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E52606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rp0BUCef
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VE9Z4163574
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spi0eC7tVCfNiex3d0zT8U
	XoDtEilCerp0eznL2nero=; b=ScWsajd8ps5+svUZeAiGK7dVHuHgAwv5SV8vaJ
	3MidTiyhVw/joQhRi1bF9ST8RdXaTVBjiYRC+BqhKbyfLwFkEu/MJH/++9w5bC7Z
	rvjEVyBY0HgvzvmiwDcX97dhOOCG/8NntDHnLNACMFN8lhpvDZOFkhZSe3qrIyMY
	hr5EzTIH8SL69SKGsFuTSFpVNAYc+25+coL6+o+yiBGFRxSKIgplTdlQPsjut7UN
	jbY4FAV52sjA4hUrZH85ZfuFV3jufqWdszbQ0XUV1EDKnXQyQ0vTWGcg9d8c9gNu
	oD5Z5lpFytwnbbPwav0N08XOYBrdSYcYTucjHzmz7qTgzBkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ak0up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08b07232so6484275ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560543; x=1795165343; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=Rp0BUCefxQBJM5epUaMxLnv0zmrBijhwUYhdWBmfPKs3d8YkA/+XXvjb7vtheMec1d
         GZduaHtJmBF6WaZHOFrChktGNfSK2iCZgLlL6L7LoP1XlmvrffIW5eZP+Lkf1Gc2n8Uo
         SJaDmYKy8OApJXPjvfMPczCRBUqCIwO9cIb494TZpj/4CPUuxlVOVneGEQCnyLG8l51/
         l9LPMDpOT+NFkRdezLL1L9jhD6U9cVnQvwt4RQasGrhVLva/+d2h72zXNPXN4atV09Ds
         8514BWjqr6o2q7QL6ZMKZvIdv0A0vTqXRe8zA81A6x3QtyTw9ULTHo9x4Cn1/GJxeW93
         v/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560543; x=1795165343;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=yDGLrmehYj4VKQDimb9+6yJCOcpcaY8V84gFUyREzJ0YyPtSwLgroDZbCGsJzO/5ap
         F4Rqnckt4vt7UzA3qT6RjCcg0E0lWNb9BX89Rjl25Aoj/2xcTrCjVd9+JXWL2MeIKRz6
         +mHs7zfk5FjmYPReWfPU52dy7r3hNMBN+Q/xy+9wSl4011SlGHpPoacG5wyUHPn9FWC/
         GMkLCDlkAQ7l9gH7opMtVzE77x9BAxmQCOXEDnKFRFL9PA28oMD+Ltcz6GRtQ8jI8eU9
         l6ModHqNe0SP8xp44ex6fJGqaCord7lkS8UpydBXhqpTaNGrvxRftbhlqYk9hUDU5xZ1
         VMvA==
X-Forwarded-Encrypted: i=1; AL+hErHUaJplu6i/HXV3ei4/3yorAUcZd1T9iM9Wbkn66Jh+f/dJ5Tq4TpESX/dtvXOlt/whrXKF6jjc+bflaKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x0MRnTsyfQ07ann0S9HSgchxWyDBPYfd2mRy9PY8vooNIf3CY
	4k4lwcLUQ7gGa4cMwc7vjxai95NHt3XHSQkV55LbPxiY0XrMUsX/fcMuGYdUiPMsCrbt3vyQY/i
	POwjzqAdBhVTKa8JV0AL4Vz+wzLI88Q29KgINmTLoLdSqhIlMD2Os4KBVrASZuymEYzmFnUpnuN
	o=
X-Gm-Gg: AYBFou1gHZb9x0vADQdGWE5e6DSCtjtdNy2wGUXdldZeeLIO4FF+e7oql0A82tPFCah
	FqmqWiZ4O4rZVIUW2VANzJ7jUU9ztegDFoFIwGVSmZh7YNPCELMK9dFEjqfAfyD2JOu7oMRcfGT
	JusM25Asd0RfA7bicQDgrOqQ88Gg83iuS/W6FmwsY1sxqUycztw7hJmmZbIkUenla/qqmdhko6D
	/NbP6HdYWCjF1OI72eJfjsHHdwG4OqWH7EvuKDt2Q7F4VG8FC6EGWvzIBoAC3V6SIYceMAxlNMc
	arFhDHG/EUec1+4n4034CT5WXsVJPvik5sOiYKjeQipYpjSEztPaYb15Vq8nTdbwMI5qxwR03yE
	c4v4mjSmfxUhhuKiFAgDFXV+P85Ib4Nnq7vOlKDVumds1fs/2Dgv9AiW2Cn/v4yYvLhusxP3jfr
	vlvFWXsQ==
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18944125ad.39.1794560543524;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18943895ad.39.1794560543014;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f884be3sm7068695ad.55.2026.11.13.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:02:22 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:31:57 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add OPP-table for ICE SDHC node
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
Message-Id: <20261113-shikra_ice_opp-v1-1-14c222a83d6a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAATS9moC/yXMQQqDMBBA0auEWRswCsH0KiIhTic6ChoybSlI7
 t60Xb7F/xcIZSaBm7og04uFz6PCNApwDcdCmu/V0LWdNcb0Wlbec/CM5M+U9BCtsxHRukBQo5Q
 p8vs3HKe/5TlvhI/vBUr5ACVna6FyAAAA
X-Change-ID: 20261113-shikra_ice_opp-8f696fcc69ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX5PIb7bpow8Cs
 LwOKvsr5TaVhm/Z+74iLXGa8f2gQGdvwQMC3ZEqTaq2vooYfaQrT9MC+B24nwXRGarG5qSOCtbR
 hDKfaofjhdRwXFM3BDymArvuk8Uje0E=
X-Proofpoint-GUID: pjOKWT8H6aGEgPbmdlWzBXt9CdJwlYfq
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6d220 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_O5C9CTu6e29N6usQqQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX5+2nwGe05wy/
 m1QhHXeLegPo/ojYwBHPbvcsbKQSo3kL9VROdfk8zBB9qAfMI7gXafDh5y+ZTcRF3tVpBKPFozU
 NPgZGqYGGsj4dIm4nW1Z4uNus0u95Byo7cAtlz8NSA0mBIqg6GdmEg9m/C5bwxC4oGqnWxvKHhF
 AkK/+DJZEf5GMi6nhicjO5B4xBv/B5a5ocNeFuFeQ5IO73WRxPvMqRt6VrXCTM8irXN/aC75rL6
 bzpUvg7g9Ntky5YsGb6MKH1OecVGnqCWWEIIGOYMxLgttno2zDwGaE9uhMwqd6BceSB/ek5eyDm
 EqVCUn475Lnzt4gw8spYMm6AQlMTe81Nk9R7/5BCNpwu8Em5vafB0V73s3CxZh6HbEWbDddetea
 t1OVtmb2ql1wQtSU54xb8iSb/C0x4yC7vdhdDrW4fcMX4Aa7yxVRTMo5hPDTTYqt//vTxXiHjH7
 g5QbiXQawplWJBjMKkQ==
X-Proofpoint-ORIG-GUID: pjOKWT8H6aGEgPbmdlWzBXt9CdJwlYfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

ICE run on default 19.2Mhz(minimum) on Shikra whereas MMC controller can
run at higher frequency(example 384Mhz) too. With no clock scaling in
ICE, it will continue to run at lower frequency and thus degrading
overall MMC storage read/write performance.

Add opp-table for ice sdhc node to support higher frequencies and
eventually enhancing the performance.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
ICE node with no opp-table keeps ice running at lower frequency which
degrades storage read/write performance when storage controller is
running at higher frequency. Add opp-table for Shikra ICE to support
higher frequencies.

This patch has dependency on below series.
https://lore.kernel.org/linux-arm-msm/20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..50cda82b6e94 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1406,6 +1406,26 @@ sdhc_ice: crypto@4748000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
 		};
 
 		sdhc_2: mmc@4784000 {

---
base-commit: bf7672020e0346bfe95ef54570af10f0c4364756
change-id: 20261113-shikra_ice_opp-8f696fcc69ae

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

