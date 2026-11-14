Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661104;
	b=UjRx/9Vr4FrE+Uyhw6HZiL2VGWBpWKyonaUXzJ0hPwI4lKfN0B2MTRKlSktqaiR6rT2a
	 wz1YVMNSsRzJMdLCTcefHJ/oTiV0Soz831fqoVuS2RHUZtiPZce3ocJCqwbp3SM03NFUJ
	 oNoPmPygtlY6kJ9tRD9zanUOUwlNsxXbTQeHFi4t5hQNhRNOKgvcjZmb8ceERlNk0jzDv
	 JCA4005fnn5uBvPJiWM0gZELT8mNR3wRfvGTHoqRcJJi3Kk7kKoWx6ZEw33slPmVmZPOR
	 oXDWTeeEN794duVz98HQlOF+7m+UTDv+vfAQ2podWPBev5LiH+sSzHw+FMZRZaL79SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
	b=zsX11f2RVACTWOMvxKfCixhZPbuiSKSH+hwtFdP+2zbqk86PIfSg1AEAaPnttvBSRu1f
	 cDqQBnrOLaNKdYH5ul1fz9nwrtZghBx3m+a3hst0bmSXxNPYqnPktH+F/n3Zl3+9448c6
	 W0PFxjZu+oPOU1S4nUI9GE7QqybziNTKrpQ/pNrxUYpUlJu+pF0VR+xYjLKHc+k/ReMhI
	 kEY1aNkb2tkVhvXnvuM/Lop9vDQ17Vt2oajtPdC3jJ23TFtSSFko5k3Ss0UpyCVAFTXjo
	 NVDMdzMVTh3wDLGb7QYZyFo5Op4KIYv74NDxGZMzjxcTJrO8GWY2TvR10rlwoXptjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAlW+kr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMUZ441j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03D606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C03D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAlW+kr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMUZ441j
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wBuC3649923
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j/rZrx6MN30UMQmgv5sHNe
	382bHvIt1HflERn7+b+/s=; b=OAlW+kr8VUC4IFmdyOpDqfG5IUjEHtoo9X2UEu
	xx5io+27xX/pmtyVkLLDyjahu8FgRSPRT51D6eCJFAMVWShJsgkI4pcqDqnyg3ix
	lkNm7vch7G5n9/iArc3ERBhSkdvEM1n6uupryO9bqXGlYoYjcyqVkqsZY2PpbKvX
	ocV38DnS8ep1JBVnAOkWJAUnPeiI2fO4E+xE02+1zyOXiTwH1YNuP5OIvUewy7wT
	JceRYuqmmYfz5Ca2QRdKFHQxBrubsjX2xprsHHRMlmFqKwl/U96WVyRz6p/StSRV
	AU2keB2iZ8LX/d4ziApMHaOL4arLA22TG5z1ISorOlzGDDbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrtdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:58:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so218426785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794661101; x=1795265901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
        b=DMUZ441jEQmJJwJns4vrSU73fsJkWsLmSTVM6RMFmnLbOdX6nZJKSm656GGkcWK+mx
         +QvblMxxca5u2xg0IHW4QOf77istkc6SvgMocHhekD2dptFMEJNWWbE26/vMvO2UJvR3
         iAV8UxLYqJ6OadjprlGKykShaaMhlwzvKwoQF3kxdQcw7549vc10QQypGazSGqE4XZ3p
         H3v2mgQO0rZKwtqXOnVZuULQ7o9aWbRRdutXpysS12GpUDBqvrtxayEVr5ZS1IIJOSw0
         BljR7Taqq/Ns131lrh8K20XgY9l8T8/bUymtE5EfIpP2Wb0LIdLBlqgbIYqPFinBkYPX
         qEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794661101; x=1795265901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j/rZrx6MN30UMQmgv5sHNe382bHvIt1HflERn7+b+/s=;
        b=fvJF6gkKi1rXuB1BZHKmBXeC+nouKbCdVWKvs4K0mfCzer8I5PcT79JXSznm526DQa
         vrVFDw3Vym802AiNC6ti8yoSZIqmVyOVbS66xjSIKp+Lm+gZDB2JQTK0NLRZKufZdlTz
         SYFrm2MCJulXd+Cnjb8uQeGkuL9F+hZChZZyzV/Z8VclIi6oabw8+Y+pjX/3ivZP9AJw
         LJXljwP6fsfnafs+j/Xc+8as8nLBEpWDr3Di3Vol1gUh6PFirpkYwmHMmOr4r8s+Dz8w
         Z3FM6XO0ASRusNMbwtm4kDuib/dfXhVrmtXEiRpmCSR4n53/CArj0iVxGp3PJad+CrJ+
         g4KA==
X-Forwarded-Encrypted: i=1; AL+hErFCR0IcTlEIjOGfpNcD/J4xfIeMm++pK1cLoNdvcbir5PcDXipqdLTbz68J23MItLLkYWOVOKmzhhpkEPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WosN7xLh0MUT89SwVcVnCarPfKAF+/m21KrLFRZPKH7KWahxv
	0diWjKOyTGKbZOtstkflg4wkVN9glX+Q29nH0HbcVGp7n+NFpiw66plt9jSC6FuGHEL7QhHmjp0
	DTspiUO+uYORAocmSK01eiN8q0oFy1ojN/Rb+xE2yo641SBKrLVMdkG6RXO65n3MNfR8=
X-Gm-Gg: AYBFou3K/M+L6UlcDnzxb7R39sxSqU4wCb+zAmEc7XgWks32jn4F7FV5qmoONRm4kAT
	c8rmtgEfwVop1+/wJSg2epMs3FfiiuaYDJwWHt9vwJ5joYa+ImbjzPEcj1R7NsfMG7jsS6VNcrK
	6naTvwmG1Jw3S/KFa7uuRQHVe/VMvk6Vrtb4mYreyF94z/VgDPWtPXHzxvfDdZ+pT8+O0j0Gj0w
	hidhPs5pbwFWE5N0MfslHKvzlPmLNPvQW9IE24zikK3GO95khsKKk9aZ6xAZeTf6rNDiqzUxZQO
	boeHNuc5EerEYH8WZ+yQxFzdxsLQVS31gw75633YNOm7awOeflbCWhCr5wPglZ32xiD6FwTCdx/
	n8fhZtJQuhyy594wfwHb900ulHR6+zvJkLBpKZuswske+cyQ8gT7RR00oNJWhzx1hIfGqce/NCr
	tpHPFkgBFef4id
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr812346885a.72.1794661101488;
        Sat, 14 Nov 2026 04:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:6606:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9494bcc695dmr812343485a.72.1794661100961;
        Sat, 14 Nov 2026 04:58:20 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm2134684a12.4.2026.11.14.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:58:19 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 13:57:47 +0100
Subject: [PATCH] arm64: dts: qcom: arduino-imola: probe the sound frontends
 first
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
Message-Id: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VeRWTvgBC/YVykugvltB21SJlgK4
 rsbXH6Lcw7KMEWmR3WQ4adZUyyQuqL57eMLrKGYXON6EWlZP2nznNMeA28aV04WYCxdQNuPDgM
 WKvHXsOj/Hj+n87wAE1/+zGgAAAA=
X-Change-ID: 20261114-imola-sound-link-order-15de4692e7ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MSBTYWx0ZWRfX5sbDTiOhFFTe
 iGmOiGAr0gANvuh0d0U3boXb4S/DwkAwPP6zxg8/T+rKiBayQ8xYCBaYfQEgMmpwAGdXIvEo05t
 fLMZcii/WCVqD6z5iF0h9NMbwl+OTt6YCPTeT5BR/y2tiqGBlAq3AdN8l/wU9Qf/6YcOZEnwbGs
 juT3GCb7+hY7ibkO8/lQrRKMyg4ZpFdp6qQbmDqJOzQCoIY8bg1xCfygb9QmRasq2e1fhct46HT
 uEEmQoq9FGMvgm3EVn9mUQHukfpXs812WnqwyhrCCaQpeCpj5BH7AeeQI7/CkzF+mnIhjusxGhZ
 FjsVlZok9zTvgohC56KGi1M2cM9zsRLKHkWdOHb6QhT6yiffibIkx6H+gltXBVZPiZolLL0gCUv
 tXHfXZhrpP5kUaXefDe6yCtl5EkclqElioJEdp34G5X6Vm0tqzdPvDA+5EbgciFSuN7EKcPCqCX
 4vrowwoc7GEsL+hJ4hA==
X-Proofpoint-ORIG-GUID: wvqycpopGh5RBso8njJoK_VhHJoJhDn4
X-Proofpoint-GUID: wvqycpopGh5RBso8njJoK_VhHJoJhDn4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MSBTYWx0ZWRfX3QleJmb17kTN
 c2K9BZOPsNwe4YrEYSZWCSX/AeTWFkq+e77Seu2rAjPjVpF5M0RdVFT7SFDJWrdFoslkKPG0nsa
 IhdKgrdwrhs/fRXpaIlzXuJJIEbo/Tc=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af85aee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QaMh6c9EJkddkog0sY0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140051

The card probes its components in DAI link order. With the codec DMA
backends listed first, q6routing is probed before q6asm-dai, so its
routes from the MM_DL and MM_UL widgets (created by q6asm-dai) cannot
be added, the component probe fails and the card is not registered:

  q6routing ...: ASoC: Failed to add route MM_DL1(*) -> [MultiMedia1] -> HDMI Mixer
  ...
  snd-sm8250 sound: ASoC: failed to instantiate card -19

List the MultiMedia frontend links first, as the other qcom sound card
device trees (RB5, RB2) do.

Tested on the Arduino UNO Q: the card registers and a tone plays on
the headphone path (all 11 DAPM widgets powered).

Fixes: 61a95870e0f3 ("arm64: dts: qcom: arduino-imola: add support for sound")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
The UNO Q sound card from 61a95870e0f3 does not register as merged in
arm64-for-7.5 (snd-sm8250 "failed to instantiate card -19"); with the
MultiMedia links first it does.

The DTB differs from the current one only in the order of the dai-link
nodes (and the phandle numbering that follows from it); dtbs_check is
clean before and after.
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 47 +++++++++++-----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..3efd80f36c6c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -117,6 +117,30 @@ sound {
 				"IN2_HPHR", "HPHR_OUT",
 				"AMIC2", "MIC BIAS2";
 
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
 		ear-playback-dai-link {
 			link-name = "Ear Out Playback";
 
@@ -181,29 +205,6 @@ platform {
 			};
 		};
 
-		mm1-dai-link {
-			link-name = "MultiMedia1";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-			};
-		};
-
-		mm2-dai-link {
-			link-name = "MultiMedia2";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
-			};
-		};
-
-		mm3-dai-link {
-			link-name = "MultiMedia3";
-
-			cpu {
-				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
-			};
-		};
 	};
 
 	vreg_anx_30: regulator-anx-30 {

---
base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
change-id: 20261114-imola-sound-link-order-15de4692e7ef

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

