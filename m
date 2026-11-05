Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874018;
	b=T22Yp0hM9uvxh8Icwm2gMN0EVRUJIaDRiE45Iz8S0iLvMfUCyFbrzMOtn8ijZNzGAs3o
	 P8d6oKscNJEJMEFdJDDbqYcBg5u7FPeoqIQEUkozP29TqLc5IB7EdJhtxMW5Gn+fhiMfZ
	 vfh9zCDkozPggqjgXKgGYOGIF6uWETV/74uV76/Za8rAAjNqRNXdK7fjT0jV3XAS+f94+
	 7vozbWY/9eDxWrztV21TLAZIEdZYSCPRcmSQo5QKJStZs6AUdYeJQ/ZWVw5FVmiOJN28D
	 NT66xhQa7La5XJ4CQFupULCq4uyxNW//9k5jScF7NrcCwLVQr8wLaA60SjBp2P4NdVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
	b=x9ZwNLxOItKl0nGmzUNnfa56y/EUSq+1gKr6B+OhZFOhbdX60/bVSfxmo3lAjafp3wk5
	 /Cvtg3nCN0bVdAMqkM/mrr//M7FT3L98u7GHt5LEYuBL2Llloc34M5jE1+Swv2So4HVRh
	 977nxd/dT8obBYi+LdayWIrx+9xLSwTsajQ7fqZtygQq/oYA+robQrczPBfoVeN+0PCAQ
	 Kdad6qhKchUoEs76Zui/P6hxahMOlZj88AoNGGMrMLgJRPaRLl0BGR9GI3Pp6sL2eWAIg
	 aSwICGnCE8oEWy4mSD2DYj1AbYc/Qj4FlsnJdT0ZmXBlN5sUCqIkdSUcd3LRdW+712Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC8606EE86
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FC8606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tSvL4084589
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8KVmduvNfoF
	ze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=; b=KsPyVLGE8BsXOiEYbjI+81pY2gK
	0T4ptHO7o+8cJcjCv9DFxUFLTupEhZzLoB3C/VYTYtY5fUZV4H6te7pl13A9mPRM
	QhmBBg+/SxvYcnPLXhqPbTLS8rGFuh0ePGXZqJZP99kgEueQ1Uudhiw4XkH5pJH/
	A8WVKRqvVSdRx+P4NNg43KbCRr6FMzwNnPeQ1hbW1nKOMsL9OHrzpxULwMSrCM6p
	s0V8KQfhg9+EuJ2fSlfT2DjLtFyMbDgwPnxKA1KaNda5uNVPj5DQqs8fVjwD/tE7
	i1J8e2QQwgZagY1gwUZJ59UW8BNthy4knGK8tK4nTeNGa4eHRM8MTcDuoig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr3te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso660864eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874016; x=1794478816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=feIVj6ianq+jmxxVZFS1CIlPM90TiDndE0xF7/otll3BpOvPPsdq54HnE6dUpdctO5
         wWrHS6Zyfoy/VrJI5U1fwqrRHKSfT+11uUJli9ZyTWhmQCmFjVImyHuaF2Nm30kd084u
         yhCTdAwiO0fCv8/Jq9U0CRAtcNUJNIrgQdZJTrCOXqyA1eeKstDEhW+1rfDV2NTADgDt
         vJ2jSNZDIu+9/qlVeyeQAQwQl5zIJHv1NO+mm30R1BrBeNRzYPD7l0+tktzfXVfxHDvu
         6lhriOb3/EGIHbyoFeriT7EYInB63HQ92+E/lks2RVaE9ZsxVYeOuxw/szkooyH8vpn2
         4xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874016; x=1794478816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=temek9rWEt6fiZCW9hjYssNaelpBv8+5joTWrKuVfC6vZwc9UucuUpROLKqQBbcNuj
         72rKBowsW3pU5nWa0EXiS12E9Yx9gOA9JLFyrRzbWmAZ1TWmcUgRBVww8tsfuyDSKieY
         BEKaVrUxOkbKr4mme6z4C+Ga0M3FDdf0PX+s9T8F3c16VsdjcrHmXQDXE8zef4pjUGyH
         J97HS5eaD/W+L8wMhO/jURixQED5sjfflDyuHeHhV2vQfq25eiZBN/VuahXjasg3Z6hi
         mHfMhBu1x0O6rJaE8JL3a6Mnxd4Z1sE7Z9quXjtjJJa7JxJeHWS6jBTGdedqjQejSWsz
         2+3w==
X-Forwarded-Encrypted: i=1; AKwUvBzkyW//NH+raYxUbx2uZFZbGJ6x78dEVBNzTZazYUkIwpi/RMO+srL1GfxQ4vUEjjAzVciTBTo2XyFuUdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ai1HRAwoIXwOI512DlFNe1ME2+CnaOIDiWsgVNhLSD9z3NfgY
	it/URz3IoqMPuvJna1QgBwo7Fu68WiwF7601l38m2Qjj+Hzg9SH8DzmnSzmJmi1Cr6vPzNnW66b
	0x94TYmacKlDMdw9+rupX7eLT4XaCAHT7CU/a4T7NZjyTA453yVAaR8mWAJM7JgcFNLQ=
X-Gm-Gg: AYBFou3nturXtlW7gS7K8tT8wJLIJsh86/EQ9HVv/LLj6XXsCzUeexmngRZcfkS6vSU
	9LJ3fDqUTAu7sAAZb15oTNmJ28kfR9loUOr3oz7zsD1lBwcDho4zKJU+who5lSYofM1QoyyNxHj
	lACJ4hWwL5IIGKyL+mHygMlHA84pa8x/2hAlPYGB3iSpKFYfucffcezcjJHOw/79FJnAgfK8S0d
	ave/EGlJuqEsQ8Xo8sdjiz9JBBtdbHH315ZWKLHN3Nt1raPyh9vX4tcHEu5heyhnsAbNdVP0vGw
	kO7EehNvuYZR2++kKJ3u6tnLpJFZ8cYFbHJEga0mvnuLST6Rc8X1fKANbb0Xg5CUC1COoCOW0ow
	lVR911aK7+qUDRtVino7NXh1Iz28gQw4PiPtmmfNDVyskvAd0olqI4LhqA4mHIZTu/ykoJ+CM2D
	sOWQSodFiV
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963300eec.27.1793874015927;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963254eec.27.1793874015320;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:13 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Thu,  5 Nov 2026 15:49:53 +0530
Message-Id: <20261105101955.3732723-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXzxWOCo3V01sE
 Yzi54EevvYNyaokdOht9aXNxcAVOrk86KNuWLbSUCaLvP9ouxLpNka/aWKahYQAL0QYZFTdNy50
 a3YxsezG6WW62zFGdx/5AN4IEbY7q/65R2TfqMVsiLuAEvu/GxsBkgUrtIXAyDcvOVmvRtpGfZ3
 ALTHxgtQ8ZwNA1FtIXVkoSnB7WaLWjjUQHttVqLuqF9X5h9VRtPYXLvuxtZmrP846zs+ln9HmS5
 rXadEmfRJkRRkJ1u3q0ToHyJTvhswR4gS0Fgs+JhLsztAw305iiuIwaVvQHOU5RjW8kqYOWmeoH
 YeQav+PmSkaNI+irTezXz3tPt96IS218wFFpPX6AOV9NShGghyli/lvu2CQ4jR/6DAYtSpWKdPW
 cQyxRZdgfjFymSNGUF1EjXhmFfD7B9d96126jo7I7o20vJhux+i23ON2U91Hok+NLskx0WWa7xe
 nk6ZbBw66mIHPF/tHbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX5U4PqvItgWzT
 k35DsshjdwgKmpD0Wt3qHHBiyYp30hiZYfASq6SlDoQL4+chucKxFB6ONvGXQqJvPyZS2hYt5uN
 Lm1igWZxir2rdtnaHw5uNOhb3gaC0qw=
X-Proofpoint-ORIG-GUID: SWMwOQiYGDFzCrTz-qCd7U5djsTA8QCq
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5860 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: SWMwOQiYGDFzCrTz-qCd7U5djsTA8QCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d..a489932c7b1d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..591ad233f90e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4843,7 +4843,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			qcom,ice = <&sdhc_ice>;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472f..54770aa7376d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -721,6 +721,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

