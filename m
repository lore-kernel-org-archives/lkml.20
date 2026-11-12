Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484842;
	b=m6EMod9lqPVN19lnTQJ7ZUwPwnxV717HgiwAWB0ZXrSsBwNHDXutJwLxMp64uDMjTNRH
	 ajrfDvdDOBQQYsG2FT0Gy607x4bnxDtbeoTgMeyysx89LaTD+tDCwSywqpkwENmfDQUx8
	 EMutjl6Pwr27CAJt1V38M40e8YChqp60a2ibtAAQ8HLxV8MqsA4XrtuUHX2dNUA6xqgby
	 LTz/U+supqeyEyFKzaRbVSYFqEDnGZCmlbJkOPTHRMEqTgHeIg+4Y7zcb3KSfI+q6dvoC
	 5NkRHEYKfCNA0vINtFEj9SXiLJT0awnLm/DfgZmMXyOMTbGAPDlpL0aZuzl5QS0NRxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
	b=lJhWqdlXFXt3Y7uTYyOGC4kCkInkGXCGOgxBliofzWgfev0GZEzQI1fjqIGn6IdnCVEZ
	 rav8o6obuLjKOCryKLgK5LVS1pP1tOMAfdqJ7y1C/TaAZgHpXpArir5hs3riyPjA9CXHp
	 TLUZmFp3N2SMwK1U1RTcIaZGdyWpEZPkyWAnoAMYIEnynGGOaX0j6U110YVgltGtsu1+F
	 VFovUQCIEbo87SfOP0uX2pTJBKw7B4f5LF07u0ZTPeDrFmqt27hP2lbPc+iwaD252i/Lt
	 LNj1eOrGIiTMDsyAEvoWHhAsbwJP6L5intVV8x8/EfPJ+ZglODamjFYFXVYta7BTqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C16606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C16606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBf9bo442019
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ir4bcmZQPxD
	iDN8eVbAoOquK5iknnaDWcLFSx2kItTg=; b=kw2NHAlstCoLUs53DnzXQVPvSnh
	CdQPJRduh1AC3WIKI7S+VPD06JgicADKxe37p2dzKejFIDME1RbSfsnN7ACfs4Va
	dz+wQ9DVzxOsFLpNL4JN4tHCTLIURkep/2Gztiz97PFYn6QCfHLk0xWYHOiRjyfA
	Z3bbV9KZ8IjZKojHlPdlYBJOStYn2mc1GUmTPQw/VBsB+DNWdq+xaJv/WEOibQoh
	MAjkUN3RSLIe4oFQDEYwsEs1yKX9qIoi/Z+teAKStE+RARphjqT66/2xSqF6bCPw
	Fr4ZzK7ddnyWBPlowcrEAerv63CYMFJ/3We3GtvgkRcjnCyUhVaL463uk7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1aw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:00:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so994761685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484840; x=1795089640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=TJqZu9r62yzm4lBq0iPmGILz01RypeCvNnYbaLBeqLFK/52ltiv1hWN887MzY1Ba7p
         oOdYgXTjb35X+4JP7p6Bx5Z3CDc/QMsSA5iqXm6GZnKrPWwYAABks10nqLyoNAcwgO06
         KThkyj39JvPIds8giY/d51NvCphTg2z3NI2qyFCn2S+f747UaXPlb02Ar2QWeEBXUBNQ
         vqXndRgMaLIcCjgQMKY+Fts9Tv2+vu0+g0fYckL5ojHV+IZ67kyHKyjrHd5aqj+0Cvar
         p57RVq0cdGaYkrU5p0B5w2AVIabTIMJEKVwQlwMTKJzz4vzLmH5umYwYnm5vyzEN/lnz
         UGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484840; x=1795089640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=SvfSEHrKuwDuGGzooXuW6yyNWYk3rVg99S3soxgh8DfofgC9QXPEZeDrB9+xredpSD
         xXXdwi2PoOiXBwCBW/c7JTRioqp/oF1shr969ed/3blqqt6wfaKudp5wb+IA0O2dYFxh
         aeKwTCMjWu9wiEqxzasTFwYvFeaAGpFz05Sp5buNAjjz/OH2C7mAU/Kdp7FWwFAwx/X6
         wFY/xkuXhOvgc9m8AjELne3J90U73hpP6BY6Wnqld4s7w8mLp7WGaKROkJgljwjR1FDU
         DPTMQitGzTYLUtC1upmJaIgoLvCNCstuBGSZMh+D5aU+iW669dCP3WwZtYxHxjUxVYU3
         Plog==
X-Forwarded-Encrypted: i=1; AL+hErG28UyEY0BL7HQMkxRrXYJfJnkOI4Vp1RL9Kt0pjDMA5j0e7hnPAXGRK92bOL85MTJuzcTWbFZ7LpgyVgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f5Qshx0qWLwly5e0afKrAeCXyhlr/vC7k0E49m9DUaf/5kbun
	fa0QTD+uAV2FlbQl6PWjEs/A0KRAOxr9/fvLlQhBCB/1Su46F4bZK09zw91tpxuc87QtHaDPhoC
	zno2s9NP6bTgQfR1LBHRY2JR2h2+F7at3TWsyoQPfq8ZUeB2dw+vRSpUUPObuhU5TOAY=
X-Gm-Gg: AYBFou2usE3BGSzGo9iOKJ4iH3H9u98inl2MsCISKR+AfVJcbRP3Kl28hG8vaI7dBOo
	Z6UvybsjzDHt1nlb+4bU9htGnVCEO39wQPI/XHqz+OzffE4O9+aUefDnJwzIf1rNJkcEGJzH5Sh
	sB0iZv2oMu1o04ORRizghur5LI1/zpS2WNy/QVto6y0PEjARsnBTUZoEaJktKKPGqjUVu6UEsH9
	JEbkGKcfgGeeOemF+4HLOdvZXK8ExYH+WhLjEpzOIBGF+1h8F1lW9kBcWVIIfSB+sFVLMOd99f+
	rozN2zZLq76oD0QAOmy0PjQz9t2sqbyoRa3ywpxGlRXKNo0ne75Ia/EJ1Xu/r0bfgjblsFY9rD9
	y7Z0TvqU3iYSOMuSaRUfaHVVSEQlLJqtY+f+8FJj6AdtN7l7FixlpyShPToeAUQ==
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873952085a.46.1794484839907;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873944285a.46.1794484839405;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm16682052f8f.10.2026.11.12.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:00:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Fix missing wake-gpios in PCI
Date: Thu, 12 Nov 2026 13:00:32 +0100
Message-ID: <20261112120030.99510-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XRwVuxCDW7jPoUec1ZcnX+Mrz7qzgQAPPCrZ/RAYEVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9apfXDbhXQQ/RyD6WxLabDOBsbrKY5kRok9kc
 JzSJmExpaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWqXwAKCRDBN2bmhouD
 1zxnD/9A9wsqYLVW+NlmF1ZtFAkdexSReqXpkF7A5xHItGhA5l4DOtiKGggZf0AeH8AsNGIEMkX
 kf+AlVFcYV3jprmWQJ2B8shVfFfsfhEBRimLh9RKrVQDHkPR0/EQbTTp32gzo658KavirxRAYLM
 AoUUCtsghaLsLpLWP1HQtunFWEEKSJCFVbOdKHOUsXGijuL82AQTmV0l7K6lj3snzSmZWEC0jlY
 L3gfuYUAUmco270vTtPhXpr6+hA6Dsl5CXpvGiRCFlORizB2WBguUpx67NR155WnnpmYoJMp34X
 ZTfCxghnZQFS6GKxUHSB380FvGTVR5hQ+pyfLrLlbSE7rLErfJw2t7MsMAFUx4sz8e40JBa9FsK
 taBFA74Tk9NKM3AxI5WzhBdo01lWDlu08m5gzf0OVHrDL71oeM9UISkE+pPgPR+AUR2nFwj9KUs
 k5DURpDlfCY+LvxxFgLEVSjdwZAcKSyB6AMbMTLeJryO+GOKVIiujp2RqxucNrA4/zFxfwvPKPa
 0vHNGoprO4pe2oIzS+6GswxsZXIdfERXFHXIpoCuZ2IRhJCKN5pInMfPsCO4sRhv9rFmmz9fLoO
 MdcIGkwY/EVfoHeMm/qwNpUTOLJBbaKZxQPQJ/DHARc0ZH9KC1jswsKD7CX1t9EYkELcpcmPWLe j/trJ480wGM/+sw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 37u681zxMBd-NPMFdjqXuhcDoUbqrXbF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2TXai7v1iO27
 hiJB0kIegiipwB6aHSR41CBuDg71KoeHdHu1M/c36Q1mE9jQRwxrbmnzHFl9scj5Fm6zykw3qU/
 thSM1SPaNrS5q7ISmEPoL3IUqAHHTmE=
X-Proofpoint-GUID: 37u681zxMBd-NPMFdjqXuhcDoUbqrXbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzDwCr0A7puPx
 U7WD4zqLDgm1Ix+mFEgzMzwEjtjyodQoqVqikGXKKlUmluX12tLpTJQzg5sKBSo8AOI3mtpg8wD
 kpRv+SXX2JPQp4hW/+yIi9uOlnmX7W0A0EhZUg/8gYL3okHD8vDCMonBCR2gcE09pEH0vB40YIl
 rV5gcsVj0quOqbBumgCR+pYEP7eIUYNos/PRtGgopTD9jBKXof01rqS2lR3BvKM1WvmEpRdRk5i
 uD53zQUGIMdGEXq3NNOT6LAsIbLAFubN1pLQ8sf3HS8j6biPKEklIZCWw81uqCk9vEY03xRzD8Q
 Hw1ilH0Fj+rvImH0dJxtI0suw5rFPXLjGhrSHF3WyUo6pFIt8RScZ9VCuuTJpeSAm3tPZGopbBM
 wd3JoeOuudbWEPFRj6x2rNfeH2qGwkAj4o3Q6OT3n6Jgc2Z1I/frDhRjtgo6tnoKDHgmdieE/9D
 JpDBzMy9XpEU/ju8Pwg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5aa68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=OK2SU7EW0iCpRKP1AM4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

Qualcomm PCI bindings do not allow an "enable-gpio" property.  Linux
drivers do not use it, either.  The pin matches slot wake-gpios, though.

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use wake-gpios instead
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..328e8be1638f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2033,6 +2031,7 @@ pcie@0 {
 
 				phys = <&pcie1_phy>;
 				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

