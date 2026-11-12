Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458350;
	b=G5sJWUpf+5nYVw3WtTqseZIZyu78FIqqNTlc/TwkiOYQstWPwCnC24wGAWK0N7REbkun
	 jUovxOOAL9d19GcN6BcDby+2Ojy9ZZX1DNzcHKlecPxJBDvC8KIoqFvrKxbP9S6qqEObh
	 M2qUWVQD89Q3NTxm4WeJlcJdr72MNgqNbRLnvjN8r567CYjjVK4XeldAONsWtu9AyUA3A
	 jEpxEAeIGcP5VyDEI7ea2HHnEHyLb8GsXd1EbT5irrwJo1gE6gQ8brG0VhTuIcT3njPid
	 ADouxQPojVXSU6Fb4nOlhJUdPYLbxtMsEglYXFo3nxCtMv17FZHe+WgngourptgRJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
	b=ijbnWz6dEM5Ot09jq1lNNuas5nia6lSg8zX4vShZ5kEj0tjzmslKPgtNHQOf8D9y9k1Y
	 Url14T7anvpjoZ6L1drtQRbQ9cuKTANCow+w60j15Is1OiBZt5HRlVMHIs+0PX11pJAsx
	 jrgQ2gkAXF18N/oQ4ivhRn1hUklsaDBDKcoZ2ec0qqMmjcQ50zlefK8GEjTZEvhHGaded
	 L9KTj0PVhonM/zd3CSWHUYNCCBw0RU9sOtRa+4nSPycHK5TPbw8DX8QEl3SO4l8P7aXR1
	 eAAFO3iqdzfTCQoWvBW7tKrwubHHpNFETHQeVy1lTCAsrJZQWQcgxqbSAFQh2mtL6kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="adPsLIT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F85606B68B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F85606B68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=adPsLIT/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZgIM2514376
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=; b=adPsLIT/MAXwmu1J
	olny8ow7jibz0mkNKaAgA3O8VsDsmQikr1TqyznhfXBTP/S62kyah8qimv0siZe1
	prXx/haXS2sI+Py4bGR769gpQkcHbGCIpjG96pf7bAoFyISzXshQPV+e+5SC2mni
	2jpJQhXkvuHl48awGiTmQ+GLnADNShIXm/10P34iAfwMYBBWxBFWGZY10i2zT6KS
	wNbUNtjS2FpZbBYCdvPtdJyocGhWonPdjtZbthIVcWWdduKH3sDVoSP8fdT/CCuj
	nGnnNHK/fMILj7r1T/NUVelF6T6463mCIcQN+ZMWiRpO7Vaf11feFFPgXpzzDq9m
	yRGytg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1swsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7249659eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458348; x=1795063148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=jmAm4ldbffcqns41F1P7cIGkfYuXgrHsYzcfaFQRBX8rD92yCMV7S4roZAW+k9zgzx
         NpZ7vy1OR5qZTM8RQ3cEbDzGCQdaGzlwOVU1wGerr2REP5D7/iJI5uSpIKprn6nMVBIp
         /0lrS9KhVh5iNf9iMIrkVj/JjWH8xCosBIuSbTUdn11vB4Oq5BTlXiBLvT/RuFoxcB76
         EB2iCv2399tn8qmSq+pkvvoTxQpv612ofDW6CgjdpN4g+ptAaZSZVivNuCfioL19GILd
         6L6jif7LN1groCJ8OZgof8spZz0xVEdK1ZtZrfe+RvLXS3sLFIn2HqsBdexTUS6OiKy/
         WWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458348; x=1795063148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=G6TPqSeETLo3W1oKrS9d9RjIYpcUZsgROzP0HW+Zfi0zZO0zqoF6XFZWBD5oM0y833
         lybausDybGPyZcur0D+StbMColoU3i+n443VSOvxqFIKjFW6UAYidAHhdPKRSkaQ81s2
         td99dZBvtFZFvDPvXK3Ax2bG7k/6HugJ/YOLREWabOQWHGAoyo52NtygyxpsdHyIt+Vu
         dz5ODl/9vgBZOVFtMCwNlbtThszRNhG9Bphy3StIqmP+JxJU5lhGFOOeXDrbpsfqe3dz
         Y3VwumLCum8CzC01UT7t+Y8aR+Pp2pMgVsPQZq6badUEgsUrB3u028vc6S372uYiZnfa
         fCGg==
X-Forwarded-Encrypted: i=1; AL+hErEFPw1UVTtkyZGNxx2x1Ean7kgJjprdztHv9Ubo+sjZh8tmHe4PzHwvcY84CmP4mQs5Gg94GdP1qrQM1ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D6JJfcmq9czp/yWJaJXf2aA8ezqkhuT3NoAbH01nt1Ym9rO9u
	/gi7ZoSUsy8x8Di3Z9bZ4071qsZRLpUrD2A5nQKgmcdwAS5j16pboZg/Bxb0Y7bsHl8D8SVRZqm
	jMovDYn2VrPSzbKRsb0EMjD649m5At+P9nzJ/IiliFgfYOYFkFff/vFTHDigJQby8jjCBZnIkCy
	8=
X-Gm-Gg: AYBFou0jXI90gSKvMJPbd1Nn5ej6PdCaVj52IgNk77kTSvJT6zd9WD6Qc2oeQ5CYRJ6
	02GgV1D2j6bCOe07m11pyFhErN0yO1veBaf5uZoAXw87isSGKvpumaUaZL9a6u04GwxpaE3i/+R
	DVV0OXWs52HNgL+HJwmqZ/E9FDwZNsVHPz9dqdo396CjizA6ceI1eHSugxnhblJb2I1qHvb6q/Z
	GFIj3HUaUcX4cYJvq8yRssM1YXXoU1F7l9MuG8RfKJUUEIAptCvJ4C9msKLwkDnmoZxNUKpWNHN
	Uszwt2GpJZcCcDYBcpOCiEtNA1sp5DNcS21kMwZ0d9l/A9mfQSZGUFKpE1wj+OogUIH+LQky1Gn
	qmaS+oFM10Qw6h+FP+8oAgh0VyLjHK4lODB+jWX+Nma/bu0l4aqMmFdjqDUFl5d7SbycaN9E49v
	GepElSXwjo+xBvkMP6+9MA+Fx+49CPrFbmfgyr+XwrH9ql0su1UzXLzjimEwsW772k3JEELUjhj
	hRMGO2ltvpE
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184226eec.28.1794458347960;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184211eec.28.1794458347452;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:08:56 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261112-imem_restart_reason-v4-1-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
In-Reply-To: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af542ec cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ALACj5omrQlX90aA5P2Ce9OCBgNlwwOC
X-Proofpoint-ORIG-GUID: ALACj5omrQlX90aA5P2Ce9OCBgNlwwOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX1a3YYwHNSOAd
 fi4r+otFRLCmlts8kcPK3XVkc4zXx96YmITt0Pt/zPXXj7VwkaResrjqBl+oy7eny5OgdbVSPki
 XHQ/3v8MwikHjIyryt1XW7CnVBu30/cMAPOrbAL7OiLGrGyyTuBVgINxLLIooZy1rczacQaL/yG
 SZtPtcfDZS+7ZglCAnmpG5g7iaOr174ZnhuBhbg5gadhXr0j0lVb39pGMuNwa13+q0XKAvMMzGN
 v1lmWxZzfKcaYFy0YJeYzLzv6ui4KXSou9S4PnE1ju3mgXupB9eawTuN6OWOUhu4yFBickHayc1
 1zxpgDEN93HiggX0nLcRXnpdS0qq5wy+7ky40Zwrfz51Rr5Wved94pXCiK9NXNdC8Dn1sBYNztL
 V0XQvm+BhR+crsGqfndv7NxAQUnp7TpR5Ur4nwm/YZOVylEqMMjERtWdgSECHz+02hzE9SzFiJ1
 a14yNkqa1dSyTwz7ieQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX5Epzk6rOJEoQ
 cJbkmEUmAn8E/XiepyhUUufQ2/1tl7GES2F4Ei32/8ysIJfHIfSzc/EBXjwzJuVGya9I7cT/Fzx
 62pMhI4ffmbzLczdsKzxNEJAr2uMUCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index abb7a8391b46..b50fcd6e91b7 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb3: usb@8a00000 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
 			reg = <0x08a00000 0xfc100>;
@@ -841,6 +856,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

