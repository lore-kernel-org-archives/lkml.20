Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1952BE30
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687462; cv=none; b=hen8AsX1gdH58neoCTTl8h4Q15VuYvpjiOaXyqjqHMFBsu8kgRTIXdnrbf43SrAPLuydEW8S9ScC0axZ8T2qKmc2HHlWnkJwFigq/uJSA0YeDIazVR1KIcc5MsyJXvBbO6AhoxfMf8uMyHAgPQ91j9yhbCYDlXlbd+FbbabzI9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687462; c=relaxed/simple;
	bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UemW8dn9JerY0S3V7PzYnAKc3ZBvemycItY6xXuYju8lU7NgNkt099Wz14B2DiQ8d/Ng3shw2XNkmOQJac3ri4ZuT7X3HuHXNJJwyymxD265f0BK70YPg//8r7YLrSqZHIB0b8+fuCKls/zxK+PqkgPYNTL/NenZ5XIuq2fJtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6hPmdAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4uVXGAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6hPmdAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4uVXGAD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCql4e4151546
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=; b=E6hPmdAZCN3EXaDH
	K3Qn7JF5m/G5mLsVOSSqbimYgm0SWeinMJPYG8unXlQqPY9XO5WszP+GnWjCNt//
	xqRYxBfjIe4FMGmQfzCSlm+OzPgi0B4QZAybLpir9DjIHNlkszbI4xVjvaXVResB
	UnzSlcQwgnZrnwE3arXMNfw4ul7hOQP+p0m0IJoXR0PRm3pRrLR/Egf3+ZSeWK2L
	XW6DgSQDJIgQ0JXgE8UBDv20oPQnok6Z1rj2GDAmIN8DWGRXVWvnHmu9GDyngeiG
	Q50hohQ9wGibmT+52qArm405Ghi7LFTUekdrAnyhgYRne7bcMS/EpFuNbV6og+aX
	Gd5AaA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc6a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a9977a4261so46354807b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687459; x=1791292259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=d4uVXGADl/wbMBPwOQh6CJHOFbwEMw/k+wjuccHh8roByDVGe6zBMZNEJyHUbSiEhT
         8Lqi8ycsAfx8ssjfp/i2dw+Scc4x+hi8U+1RhL3Vle5pkN/vY61RL5MknFDRoSSJzVoV
         m03HzyF+n1s8nKZu1zMK7kCak0i1G4fv6SpQZV8mEnYk2TbiQdHW2TrifFvFrbWkjoqA
         2LCoUOWuHv8Zn/cCM04P/tLHN+wrHM4MYQyaSg+QBGYPBvubtbBl+52gA44dnf48Wazs
         ti6hVNTrdi2HtH6+I1m8VOdU4bDIb+sj0e27k0W4iQ2EG1F23sGZBFHSwfh+EN6C3tuD
         IM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687459; x=1791292259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=UMQqt2GHR7vp6hKJuB/gPiaP9XIn+089BZ5IADAeeWSzQVPnDQwfLJCis84RY3vyE8
         Alp8RSMlXhCTn2IP+9uHm6EINU7dFJKjtZ0Ja2f+bDhPyk5L2ewT1BIKtInTuAS4UK7x
         fU0KrMoV1dhQ+3EjX0mCT85BzeS7EGVpGbZQqtPC8iZYGfoh4xBy7EwEgVmSReX9yiPt
         OpJNOP2K/+/2gyT/ZvPtibP/vu9WLcdPe4Sb3IHTVVKJoT7WSdbhM5LvMSoTywsAHfCO
         ye1pA4RhFhVKUuSkRDz2njIkK12T16iH96NB0JtCVN/MO6qCbKKtJlQ8j6s+VYckYdGM
         zhZA==
X-Forwarded-Encrypted: i=1; AKwUvBwA6WukbdcfATVeKWtJowqtgiPpc11DaJ38M8T0gzBF59QjGOij7UFANNp2nPW2AFRcOiRSf3Vx8PJY7bo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKoEL3OPO4DSTxUIVzhddP/cE7GRGdnwK5Q+RseB+qI55lAXSU
	WpmJX3uIGzNrt3GlKAOxH+YWA92VEeGiESIGX1Ukb8TTS2buq/GXPYVdws3ISN1/Ju+ykpghjvS
	Ua273pMmtPwh+qM1WJ99WogisPKmvisDHuJy34T9p5DgRTFx00Sn+tja1A4bk/AxKih4=
X-Gm-Gg: AYBFou3zgXE3k3ZTZB0MsytI6CCBFy1tas0PL7Imb+keasPF3pKkDYiXvNtRqYHTy6k
	mIORoLW+68IAhsS6W3egFMfKsifWnOph4whoDln+6TEYNiB+RG/bBqPnlfpiJBId2X1nDEss4S+
	6TVDOx3tJz4IgWv0/DxyIgQHfbp7pbKDVChZdiIYpnk8HGw66Ar749C6lBCpk+ZAiPHLt8uT+7s
	3uq9o53Ob1ucdJ5qr+RMvZGiyQ5R9ApHf1Nxta6ag6/gytLjHtP4aT3vVKppXaCPBpxvz1/NSQf
	dMdGhkphTP9ObZ1ygi3jm9MTgPDHckkLTX135WXmb+M5ppRU2j0i8wPoO+xkqRcWe8GQnV51TSF
	ppN81A4K5jG37LjAA58CK9+v2TXMLyT+/fGM=
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906988d50.53.1790687459301;
        Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906941d50.53.1790687458764;
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:42 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1212;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
 b=u4iXrFBZgUFB5iptFcMjRQeUVV5k2ovuNLVXsWXLgTQXraWQ453EYM541qN2VQ5O4pPZBXkcF
 CXW2USgM/CZBNn4CMkNlUCSw2g554xmq0KthIYZfSLLDDIkfPVcYHFp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: ACWPToIQEvcwDQHS42SEdmU6teAjt-pL
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb8e4 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3SF8zXTr3RyN
 7yFY/Q32CsJ3MnuVAB16dIplFJdHLWvrNok8yGbvGSLF4AWamTThLOQclmu3+RnnTHvQG1u3J1a
 Gw/LcqOiaDZ3VpTejd7Js+fFHqGLZsAxJddGU7FEITyUAdUumRYgNkuIWqeQEuD7hyq26I1K7UL
 2tH0UfZa5j/QcqTV3nbj9zH8amMy+wB0lOPc3DfALpCfLZAqFKwTDb24N9nMb0H88sKuqbrRx4V
 Trn0mLP5+NwGUSf79Vk2zyfAqFIsw8kCieYABVjd04snbi5JhT2WlGz19ZFgmSrXTtEkeEU9LW0
 Moaj8tjQqDOI1StVQUANRfF2TImV93ROVzsV6q5cUO00wxj2nvtJioompqtimt1sSV0hc8MvQHG
 jux2pLxwYV4xzh7KQoBG0NoRAT9S28WBBMziDC8+u8H18kcgnE6ejzPYMqCev82l+fno3G7/3j+
 JMgpUHYgOr6jGrb5PlQ==
X-Proofpoint-GUID: ACWPToIQEvcwDQHS42SEdmU6teAjt-pL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1GEF2owxDqsG
 VXlesTNStqPMu94QBzyWG3fNnZAHVz99YrZQf5cE9DEQkbftJ0zCbckX6poE6Ip5IGZemF+jeCN
 W5PxEt3JWFc0O7Fuq+OJL9nNfqOFqYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

