Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714132;
	b=iPHf64g0UliTf/SiHaG9a46g4cAW6ztZJM/zrwn/V/BWynUG4rcxwd3EjMEdHlL7MA1u
	 5b4X+RGI/LXa+RxBHbxNRn8MuA+urmGPwz++dGX4pDAosWDVK6TKM3cSdPzwENXowxTH/
	 7c/ezHg40zp+St1qyc/2F05h8AAMeV8buoEZfrvAzQuH+qDtta6iN1OpH2Ga3CVfuvp8e
	 WeFE2rWYpKHlgl8J9wZDXdUumpOn3UrDon4N/xoojPNoksiqfvEqbHXTGU41Yp1FTiOJN
	 6o4BrYiXrm8S2XMFMTsFI48BxACITIeroZcRk1Pltx6aV2rWQM0W+wwc7F97nVuCXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
	b=fKXXrgBzAzSskg9jMvo+iF7NM77Yt0jvib39+ZKZXaU9yrokwrzXJ2yzqgp4tQZexaHS
	 M2FlmdHA/IMikXq6AOmXspasWYyVuu7NqCErBNLXVIknq0o6xrxDsYIOlQ5fasuHV32Q9
	 E4lT79fFIW2181eqzy2S/0X5uWMeCU1QYX8IST4FIIlj1maN+HbG7nbLwf622ZmwDKxuq
	 CQO7+aSSrkg7XUKcDdCcob0kQALE6I4BvpmYi4JVRTmIktJrFJ5tkts/9ajZLt/x8Q348
	 fftN4upOP4lbsgvBtjjQ5L4VGLUp+If3qL98/QXCVPVwJvlZ/ItaxUwunwB77kJtU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D8606D81A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A7D8606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awwFvkUW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5bw7QSg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ9tp2651032
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W48oLRMSiXk
	fxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=; b=awwFvkUWXB5gXi0PDBFZI7xgHg3
	TNARVUq0NgBtbeIS9lDJ5ARjBQyRRoHKYDJizfWR06NusFgBAj655Drux0pvnbra
	yAm1OsXLWHI2A67xKFm0foTuOtaqfWFyIxVYJldRqxE58ITLK0W+171x6Foqezu0
	/TobNU9vI4fzsMR00/4uGqfJN8mytRUhHb2U/7hrYmPsSFb2CLqXWiwyAfTyXVj4
	R39pBnlRxN0zKBhNNWTizrgLhchv9w5mNf2N4P70OPEESbpeYXqaoLhlo46v6gQg
	/A4FR67XgAJCVoPnbCDj6z9YHnCZGay3y6o/uX+aMCMfhFaAjhtSyHQ24OA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r41m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9017642eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714130; x=1794318930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=I5bw7QSgfiWgI6P14H3osiEgKO/zKMIkLlvJrY/nDeDD2Sm0p95okcD8qp402l/9to
         AvccmrfCl7GfuiBpgRrJR+BpwYoVXUaL+wjwjc8Y2gxEmliQIA3xySjjLG7tbdPhFAm2
         Lm1+p8czE0f2/b2NUEkaNZIqzgkaTykcl+8DMfB2zq9tAyfOtX7r9WPXW8LhVR0hvVg0
         X4oczbwNubDv3O8g00R9WX23GcDPE8aUM1HLKDgrcMwi6bY2Xzc5JOM4ihdbFbSFyJGs
         VWEmf++N19/3SV4+pGVgkNXVGwZvn9bPeX8clntqnu3dMqWa9P3Sbss1Rx81JK1CCpub
         Pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714130; x=1794318930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W48oLRMSiXkfxhfTWuzGRkhGlQ7vgGpxFZ6rRuLSbuI=;
        b=R+i6vxagmZl5mxreiucQYVfPCKUvzmvTNRLbujC9L+hXbrHozaM1WY/iQyTKdihbH8
         4XXpocYpg1YEhNygw9MkR7GijutaUGCBVEgLdAx9mZATZ2I4nWwdUssAEAQU4flYWWg8
         yLNP3NEUXfPm0noKU43naBLLxpnOzIs4EjcxgM48KWSDg6o38mhb+Lgwrj19UiVmEteg
         3nYWzq02w12OPncHj4sGNWkxSnCqE67SgmulEOQsFmiYUhlF4LPcjxL8xbTNEpXJlOwt
         ao34jZFodLk3imrrq20Pt1hgAaxDWaT8/W7GwjFCwOxI+FRUQtQj1mWFAAYYYCOIrawv
         hKqQ==
X-Forwarded-Encrypted: i=1; AKwUvByy5C5SrnlmBvsDK3IORNsyX1csbKManJX6NJ82v9gBEGuQgmHou4k9xmag4dg8yfJ7g1WkI3udhAj1EuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vr4d+lZQcHrSsEVIF18YtZI6ffN8DIdRmyE5f9wPIoJFIWT+g
	9cWE2/wXoBsTwqF89TdGDdUZiOvRtTB1iqnwq1CQO8vMiKLCSCe9fpysMoDOg6+iRSofEwHREM3
	SO/btev98afi5CUXr7iY+ekSBCh2wNSu8Sg3P2cgcHRrZgnrBfXTtkxLNmIXl8ojIY8U=
X-Gm-Gg: AYBFou1/JzHWdJJvJK6/O18hFJe67PPvRn0orB45qCcW9ML5pbklI0sY09BCJK7x0En
	o1iMQ7yDmb+6CtY4kXsGU6j8xz/jgki20eF3ux3e5sFRbHUphFgZV+ZlnY5TZ6g295b56jQ9HrZ
	F8hbQ9y4Y9XFPiCIA3bagFwOEbKEK6qO5UTmlGYJUkNObgEYHyXih3iz8npeCKTKxq3XjDDUHqm
	Swug26SiCyojqOXGNrzFwY7cgvUY6e641jxDlrrEJg9ZkCgL7hMHjosdAEt5qr7W0IYya6KbTlU
	DURKPvoVraiMuS13Q9kM61Hthwz+GLIKqxA1HaAgekYnjxYlhXndjLuLNyMLMgx/e6S8uLdUQTS
	V5stk0JKUkDCy+d1Z52L0GpT3g6jnUhFmLZIKkSzWxMp0seByaqLbtTGD6z1+kpx8pdaDt0t32H
	Ye40QXCMsy3XVUEOUguOJJCxEmvfz+wdxh
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588858c88.34.1793714129546;
        Tue, 03 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr12588814c88.34.1793714128944;
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Tue,  3 Nov 2026 21:54:45 +0800
Message-ID: <20261103135445.2049110-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: L99BHTouiYZNurRh10B54FQmhCjZffpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX3cQCT/AQLM6w
 Hb74uDMeXVTIs21PRiYeXLFHxycRVSkaTRdjebLx4FBEhnWrfBD6fn3IzA+C+MEEJza3eQC8sH2
 ss5Fe/8flZhhsqTR3W4WMvA6wXzOE6fF3pJ0rEwTM267gxK8wnwjmxJSLtL0JYs8eKF03NUrqz6
 ZLwFok7hJvgbr87SG4cm1zkqkIDg5TBQJgbxalR3wlLjhSrck5GKmc8+I19WoKon6U5tRh579ca
 ucinwIlR6h87rDuugUIFLweMpyARHVD+2e0G7PGWIMw3b1r84/YJPlKjgTBC22XMsAz07ULDw+6
 TiiifVqR6pEVB8mmStsqDUP4kgvg21ZSoOKGDocWupqyGWJ08MN0TLDNfdi94aSwHt1qa+uOMDL
 +lfFQZkwsnjAUE6FKD8OH+FaFxjiaCHhJqBq0x9Q0KI2T0jY+2DS7CXgo/Hza9L8IcW7V+jgQvJ
 9SoC1wZRVXAICkqTsVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7EKMrfovtbiB
 035k6Kpxue6x8Nog6B6zEybSGtOg9K8ef2k+sEA86FrO0n47qjD5GZodT7vIxUvs+EQ2/Sk4e7e
 CA1ilwNMEGd33FzHuwSqPlkkp1Lc6T0=
X-Proofpoint-GUID: L99BHTouiYZNurRh10B54FQmhCjZffpt
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e7d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..ddea691f1c6f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +433,34 @@ rtc@32 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

