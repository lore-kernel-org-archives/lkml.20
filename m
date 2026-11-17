Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922714;
	b=KfXFVg79OPWKKk+wo1zLUcRc6P6BUVePCahDfuql5UbAm7XQRvKXFS34XfSd4KCRRaWd
	 EVx9rMG7QxwPZrAg304AvOlhbx6tLre5y9U0EDKfkgZoUZL9UsmpDOWWcLC/L3waIoUOp
	 h3r0Jpm8y8WRv949Inih+lkWCvHK809kX+XOM8L5zF5TPbA0B7OTye0+3vYLiuBPPtaNF
	 Uy1vkRqhBI8FOcE2uZn+qxAnHl1+Z340BsmK0UtPazJJdru0xYsdD1rloMO4/nHKDzyC3
	 w1rxNuW+bczyWhcUo9vS2DwQFtMamBrGA9H1LCwk6noG5ul4hEZZ4Q/m8R9XXb+BIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHi2iyKrkOJUv8b3zFfqQngor77DkZcradjrW8iP/wU=;
	b=FvSPW0oilY+xNsmX8h2PkC3OfqKdtO3Ttvbg/QLeDqXeiAsh+RfAhY9fcgKopDDXeUQC
	 D3OgaZ8LX6E7foQmzfYWub9hUfNq2MpsbzG2i5L23g/73AAqoz2w+U5p9wSgRYmAD0XWJ
	 k7gITHCVJnD9L/8I40C2G2sHfyRyfEHf+cQWBbyRyvOFOkGrJLmFnve1K12xB1y9n7i9J
	 GmiOGsoTN3DamYvT/ibaB0iw8Gbt+XhKAyaPjDDFLeirOBVjaM8m9n7Evhv31EeOfuthR
	 H33Qdb6/fDvzOvqmqHrP77v+t6w9N9tMAIPx39imc0LNTkAw/ii+pp3QRrUlg70VBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dPRkBF1i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0dp1+2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20658606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20658606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dPRkBF1i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0dp1+2x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC18if3713845
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WHi2iyKrkOJUv8b3zFfqQngor77DkZcradj
	rW8iP/wU=; b=dPRkBF1i58yoO49duPXJs9DEwy2QCVZLcAB8T2dVF8n481xOvRl
	cCOdB32wUEiAo+GSc6gjEiTfxii0U1Y2c4T2feDAeE92uuSaG9XepJrd3sP41Y+t
	QjBTO1UnobiYTENO3h79OmkV1U7h40829iJKRecRXdAhonVq8YRfV5BmOm8G8HsQ
	Cd0DN9knJpi4ZgLaJFO5HW1eVUqkAkvCco4PA2xR13DYJa/DjQ/vB+eKs6ge4BYF
	96st9Jylq291JPr4k/wILBWHy1g5fD1YKYIt84wfXQtYZhznpnWwGHLUC0J6278G
	mNKM6ah78a9+U13f+GG6fcPjFfsw8Fm4ujw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve1n24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso432769485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922711; x=1795527511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WHi2iyKrkOJUv8b3zFfqQngor77DkZcradjrW8iP/wU=;
        b=H0dp1+2xePkld2gw3v7b1xk5IXAsFFcewY/OuHaDJKH/Tqo/Yk2VaIlsEa0DhNP0Qn
         kpDGksTsIKb9JYZjbt4hqKKsuUwJCZdyAhL1Zmlk2rQT5u3Oo3wEFlZXlAdimqWLPsGd
         wsGEqlDfkDJxsf2+RSExtwUYJSxahuSvEweL/yZ0v6/0gnKuJNpZcbjMM5W2qxBbuVdz
         Wghk4wlZNF+xzmv/Rihea0MdYW2DThbUOaw2yUR11rQ16dILrqcricXZ2qmhHiwrpEoq
         ndOsQ/pJJeAojIxD4tj2dkEHlvgaHHpLT8IXwzKnIBLUoQdI9UyO4begBaSe2qh/v6S4
         oJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922711; x=1795527511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHi2iyKrkOJUv8b3zFfqQngor77DkZcradjrW8iP/wU=;
        b=JO0FrfaxbG22S5Ny7h4wGIRnqDNcS+kst9cT7ZBo8BJ2oBvyafLDK3W5JqhfBV2HWZ
         jq379lhwGDdqG8xx1f4gRbhZakzurjd9uGtowBYuC3bDfnb/msL4ytqz4q/dZZkD6Shq
         dSAXIEKBc+vI1ooR1RunA84+l8DXZtAm12XtbDQaZNutj++vaVd3f6ObtrB0m/pPGEXD
         PC9GQmYVBWQ3ytUdoZ6EPZ+pKytZrkxT7WivPL14/VWehke0cMJxo2ySwZGytZ98mhei
         XcN9NJv9DNfaAayCgCEV7BWWVD7ykHLquTLHGMz77N9KhqgGM5FeliungphgYNbZx+qk
         ROgw==
X-Forwarded-Encrypted: i=1; AL+hErEHBz9C9Zg+SgKLrFo6nq+Me6RVXZsKpGZRKBf296UJPrv61NfAXwlhCHxW6LF5uNvtqXQxvJ+pwUVIcxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BaS5An5iz2LH1TWSOH7Tz4XYSjcKXpZAqj5nepBC140p9QdSM
	jx5rdjA4lkv8fxx2KA4+SvviD6Hpx+yzfpffpfmqVEgPdpLZiA5hued/0pICPXZfouUrA/gmUoW
	DCSe2eGjO78Ds/5vBcTEavUUPwYMcSq/M62xR9X1x9NrxKYUJPzq00HKcTPEym9ij2gsJN812i2
	Y=
X-Gm-Gg: AYBFou21NX/LRIN0hQTKwf3HRxx8RaQWN99ZJuuXxrWcqNbc0tutYOS2CAe8WltlJnG
	OQ5BXUJUhwSgjXqQfVxSQlamulhoUQWD+KSnr4LsHYL3DkCLz8D4EMSha/4gsC43CO+KwZ2FXHR
	hBynaI0mBGWZXXwf+HY8r7ahecKYxj0qWLkeoRZTuqqV9i41nJg9Dbt99uX38ec+1rhEGtpVSe/
	qzI2JKJIN2xXYJ60INNeMWbqAfZLm/7rC6Md0sjq/FHRwDfTmsLHtXGxuFuMc52cb/A9ZgZKfJ4
	BRvPS4u1CM2kdpwe9JV5f3pC43LJfV0AFtoIcMESfv5E5H4GM99XPxOpKeA1Rh/v3w9HZKdARaN
	Ql6vOzCKLKghNq986Q4I7FfVPR1vR3eRqcYL906U//KQwSImW/kYYfwLJYOLV0Q==
X-Received: by 2002:a05:620a:2814:b0:947:b201:fad6 with SMTP id af79cd13be357-9494bcdaa81mr2150773585a.68.1794922711266;
        Tue, 17 Nov 2026 05:38:31 -0800 (PST)
X-Received: by 2002:a05:620a:2814:b0:947:b201:fad6 with SMTP id af79cd13be357-9494bcdaa81mr2150771085a.68.1794922710735;
        Tue, 17 Nov 2026 05:38:30 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm4080746f8f.46.2026.11.17.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:26 +0100
Message-ID: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FWANB+HWH82amt9G/6rdxgpfMMm0j/Dld6xBen67XVA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjRUsfWZi/N+Ux6xXYz6FxZv+hFxjDLainwa
 dzfHlj+DCeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY0QAKCRDBN2bmhouD
 1673D/4mN57b6/ppJ2VTKzphZdCANhMReIwqzcssRklBTiPvCEgviY6aLyEZDZ/9FEUOllQ7zzT
 dUmQPMVx3PQqrwSUfaLQ51xh0p02208CcUI/1iGDju/hy+OiaHxQSO4n1vlzsI/t6V1m5pi7SoH
 DliovFHNHO68Iexfigdk9ct8uoQOLuOOXu6HZhM6uaH5Nyfx+DJWGAjUB3+9JVNPmTFT9lbYvOD
 usnHnapYauIS/n4HDENuofT1yiSwx8bxp2rquZWLY1qYlWhcVf9QJJlDe5nSvo60bgLCm47N9Us
 RnvIyT01Qu9eOoTLhei6umUaugi7fRumEhZimW/Di6iUidm4oeY4JqeBiAF3Izqu4l95hxR2TIZ
 HGfgYKukPwbFt0sXJ/JBHPHlWGKPkUWJaEthw/myoVGItYi4I1H/eDYomLBsc3cunzicDCY+9fw
 MmSHDnRxSJAJuN/VtDh7iBtfQxaTi/QZkVFoXwumj5z92yyOWEbTSRwXr+yegoUV1PRZcuVu7RF
 uHXt4vWO68/J+0whbeWhOYo/rwwDLmwoF0ytUo4CYuhh78Wr+zH+2fNoVlKx2pEggssklwmngyW
 LKBd8MqJMg2X64AwQxtDCGrFU8zsPY2HvLRnsVmIKRZnxRvDkyYwq90q9xl12Ay2PafFfGTZIRF LWXveUP8B2y4HlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX79uunqu3S1/l
 icFtIARttzmbK3OgNtD9wJ1qFD3jMp8puUrog6SnPQLWHL8IsoYchGL/i6uFAagHLjU4g4FMCP8
 74E+6tuNiJ0s8OVbFm38v5PfQSvW+u8=
X-Proofpoint-GUID: 9S3o037J0Cw-0vLxe9SacGB-JWzlbjJe
X-Proofpoint-ORIG-GUID: 9S3o037J0Cw-0vLxe9SacGB-JWzlbjJe
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc58d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yhiY9MWdoHe1QWZhpQIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX4nLs/r/3RQ+a
 LTK+WsRxfAAXIfzSZPXTszBiYLof8+etGPuQMnAVrfziPDpPWszLzOtKeKf3FPv8twsI6LIU8W7
 63O3kwbtnqg5IR73/LzMDj6pLi2qz0VdF+Tvx3+jAxnXAjtzsBEcOBjJpkAZhBK/5qrcU0dZt9C
 gX1tXK8srKGF2E2pXJUZEvYPxLNdm8P32Hc65+jr7eaX1h15u56rX88BC0Bi7iux7LUosdfrPlL
 uuRN3cuBMvEt09zvyCaYbXAsQnsJB2TwNey1BH8RN5c67J4aesD16FuYrZ52z9bSL1u/aZV2GnX
 GFscaLrhPI918g0mxLNQnpnIyNbWzvaIlD7RUq1M2zgs1MuDzu/8QDsc22EIJIuALwxJ5Arsdgn
 taDPuAWOvS1KQcPy3w7nqDgLGcaM+xUYznzijQWIPE0RSpIFkXEdXNrbjHIEM0mdA/LySGcLek/
 g7CfQuOY4lxQ6g0Ch6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The usid, sdhc, display and ufshc aliases were never approved by
Devicetree maintainers, because they were never documented as actual
ABI.  There is no in-kernel user of these, although there might be
U-Boot.  External DTS users cannot rely on undocumented ABI, thus these
are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts              | 1 -
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts | 1 -
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi      | 1 -
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts              | 1 -
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts    | 1 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts              | 2 --
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts              | 1 -
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts     | 1 -
 8 files changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ba6ccf0db16a..9641e286bc2e 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -22,7 +22,6 @@ aliases {
 		mmc1 = &sdhc_2; /* SD card */
 		serial0 = &blsp_uart2;
 		serial1 = &blsp_uart1;
-		usid0 = &pm8916_0;
 		i2c0 = &blsp_i2c2;
 		i2c1 = &blsp_i2c6;
 		i2c3 = &blsp_i2c4;
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index ce75046ffdac..3f014c74979d 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -27,7 +27,6 @@ aliases {
 		serial0 = &blsp_uart1;
 		serial1 = &blsp_uart2;
 		spi0 = &blsp_spi5;
-		usid0 = &pm8916_0;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721..277666a54470 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -14,7 +14,6 @@ aliases {
 		serial1 = &uart12;
 		serial2 = &uart17;
 		spi16 = &spi16;
-		ufshc1 = &ufs_mem_hc;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index 63d476523544..36e79b3888e0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -14,7 +14,6 @@ / {
 
 	aliases {
 		serial0 = &blsp_uart2;
-		usid0 = &pm8916_0;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..ffebbc7b60a4 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -21,7 +21,6 @@ aliases {
 		serial0 = &uart4;
 		serial1 = &uart2;
 		serial2 = &uart3;
-		sdhc1 = &sdhc_1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..6fb2570f5984 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -17,8 +17,6 @@ / {
 	aliases {
 		serial0 = &uart4;
 		serial1 = &uart3;
-		sdhc1 = &sdhc_1;
-		sdhc2 = &sdhc_2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a..e737998cae4b 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -24,7 +24,6 @@ / {
 	aliases {
 		serial0 = &uart12;
 		serial1 = &uart6;
-		sdhc2 = &sdhc_2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1b0eaeafbd51..9ceea625238f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -23,7 +23,6 @@ / {
 	qcom,board-id = <11 0>;
 
 	aliases {
-		display0 = &framebuffer;
 		serial0 = &uart9;
 		serial1 = &uart6;
 	};
-- 
2.53.0

