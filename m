Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616140;
	b=xOeGQr+AnfyNm5q9Js596tOzYWrA3wStO3YVudMXsu4IWotnc/xkK2zBz689iSVgscuv
	 b5gkja8gxVMxlPI7hT0Gn86D6nJesa7vD9i+LmsJ3mokTQbAsJlCrC2SO/cDU0YnNuuQW
	 0gu6f172Xg4uAgGPGJRIGLk1q3ZDiHee/0Odf1STHx4wg7gVCYHSLjjQirXr2Kdc6vm4Y
	 12hAQYQKDysSE5+rkpJXKH6a4Z/NuNvyVt3mhoun0eQ8W7+lhtw67ZGuKbGAMuZl8XZnP
	 ofEiLc7GAv7NKw9zykwyYYmw5Q0ZMezl14Ii5zBx22gxVarGYNIY5U59zRlfVF6Wpzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=0xayVVTw2VscR3/bDKWbft6E3teSCIbG8UWHXwr5guCGpkOF4p7kqaasxUP0NJSnx5Qd
	 3EsPebsxsa/IzybIZbPiXAfYfwW/poPzh6jhh60Ql3ua6Pf5VPHCjYuOBRnvuyImHNpia
	 +NCNQ1s5P1eiera8amestDXqq+n98esqJpRkCUWySVgzO9c7kGfvikcfummipxwHB76tL
	 1IF0NsV4gNCB3ZXIUk4jRx6748teC9jfxg6wbpCpAdInE+AayfF6f5bJf5jLOycVOeTws
	 v4KtCd0/W6yuCZ60L/79xxL7zxNX8vtLDqTSmrgSgJgBYvO1XJR/auyyAICs6Q1mpXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FB60A2600
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013FB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASD43440483
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=mvcKXKLEkI6U6XF8
	/MSN+QFKX4Nb3WCXOdK+nO6AwDX71ZlbEdYk0Zy38uj8lE+Q+ugEKIfECbRYZaaL
	JyeaEwQrTAsit2hNqFvx+uqXXuWCwdM+IQNofX5cjr5cS+bUsrOPAVL/n/t6S+AF
	x+FCEqL/nyXNteBDwrVByvhm09Db/BykPRj+RLbV4QT+jVWquFIp6Cc/DMiQL49Q
	VytibPYRBJPxpzR6uQikGPh0wp/ABYRmr4CWbkzDd4k4Eu/BK+DlyGcuQnU0J1cT
	V97J1bRGmcbDigaubZ6BNss3cpo8VFIwh9ZG6KrRA7AGqEnBWViPStzl33SKm45y
	qhLiKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201xek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:18 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5641cd2cc13so2946293b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616138; x=1794220938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=kASAn+9B0B9WwHKDoj+ar8KmE11y0wG4LbM541s7TfgQ9ZKR8bwlwv9PzD1DW3Ts/o
         FF6O1fZD2Vh5A2w5vtrPSQ6A7AsNXM0yk7l9JhCNdtxpFag2yvSskomdBhvP8hGXdqgX
         s6xUuGu59l5Shxx2UaKbr5P5nP8IS5xC7rw/20Bh6Zve1aBh5aDnjyz2fl3KujV5QN6L
         G93EJPzLNkXGdkWthXOGFOzDDKY5oCu//61LhoWNqfRZ4dpQyG93+0sVKReePJYoyWv9
         G5+2BbJGRZqJABiC/YX2r0+MyPAZsr3rej6fEbGojM0CCIo8EMkPslOaAD7/y24Yfyoq
         XdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616138; x=1794220938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=LiFRL5HfJHggKHlLdSARzQcsGnG0xE+zVoNDNJbJOjHlx3/7HMAD0Hzaa7puxIBSIK
         uT029gvt9e/rn2lCgrC7itLkjr9i+jh/modOW06cWQeZBKTUBV0f5M4+AlRQBa3OEIRy
         STq+VJo6RYqJ5Ci6UEeM68rhaDPQiB3S2tJm/N1S/K9X22LMPksRiN40rnOpw1plio0T
         XgfHqI0LY8YD+qA/k8sT7MjyCrAHCpb8WB+oBB9rC5ekoFXOeNbUcRu+Id5VVPxC7QUp
         e94kgmzcWR8Fr10rfGjxrXQizByLXy1I3iUY16+GrTOVCpx6cjrJUEhXU7pQmgsIKIN4
         7UKg==
X-Forwarded-Encrypted: i=1; AKwUvBwdKScnqnYpdYDiZ70y8iMe61GC10LCYkQhc6wHAAWr8urrrQOsWZzXy1aHXmaXLyRdE4ix2/Sj9KH1XQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3616i/imhM2zWuoBBzsGT29LGSVrn5BTVqB0mPWfX35s6qTSj
	7hjZ+UQ8yvrHAzLx4bteF5APh5LAuwdhJ5VPOw9lGilrfogYpCBo6FIxAczm9oIlV7k6QT2B33i
	jWm3ZcWs4EWe2HBaCK0qeuHVKhaq+H1itKHkUOnoQN36f9ktP4AXKLvOxnWVd1L1IVk4=
X-Gm-Gg: AYBFou1xV/Ekir1Sqck1tf67sZa5E682Ixhu7izfz4xQbOwVgC1ETYjOXTO+zi96UZ6
	fvP28A6t26IAN7Q3qo0fJ5L0fppU54UT/VX2QKBhC88ojk1WPIxqAZWO5olkBPF5lnRsWk+D8+w
	LCVDWIdZrGaK1ofrNMdmvkoYqAK9p2hm24bUy87G91jKELIPNk4MZ9xP7foKrpj1AkTpVtQfnZG
	T/D0QHm5XF8olXOK5g423fHrr93isRHSeS55gtA1Kby1uaGplkf6ANVDwTS/E+gQMxOTMTbnOFQ
	OZdWJTSi/qO17ahSIMs4Qw+pLDUcWqOb4YnO9OHa5J6njF38bLcaQmtlDpc4JS/iyxmVhfh0bnv
	vLrXnyrvTcHM6erKsgSLtrw9s+PshNeoPhgct/UQYDA/vWD1nBvOUSTzQlaAPhDSBZ60LDnCY3a
	wUlN4wkFFoq+uc+YidARm1CMHIop9xPGFDgSYTvH3lb78MtbdDrJWA8JEmj6Y=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522666b6e.56.1793616138188;
        Mon, 02 Nov 2026 02:42:18 -0800 (PST)
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522644b6e.56.1793616137662;
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:09 -0800
Subject: [PATCH v24 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261102-kaanapali-camss-v24-1-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: M0VoDmjw8AW_mHmWvchimtu4Ov0R9f6y
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae8690a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: M0VoDmjw8AW_mHmWvchimtu4Ov0R9f6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX+gq8VHPK3BzW
 +yhiPbGRsmZ6vIvMd+XosAwulNEwToBkRW2q1M30gQqUXETBwd43azkibW89rbp6i0fWy16sCfq
 6yaBb/l5xORIpemMpNgb4GZS38etFE0Oz62qFwuq1j29xWkihoi1YrMRYXkacH74NAOunJk1CsY
 5Sg0jvykraOkuyvUVJUtdGJpESkkwcD/lvViFeQ+4m8CFPYu75wX3438MBgakpWoJUAZZphjyrX
 L+GjWwnpM7J+zE2m7I1I68BNyspKyi08uCogorBho81UOTteDW/Fi0EKDfPCrCoHk3zsTbsiUSk
 U1Tr3dp1XE50x1JevBtcHiw/CFmF2G4xxv18VKhogHbJ60xP0GsjvG6sfYwC+er4GAb2NCYVAHy
 sQGPyzP/Sc2YF9r++Uq0XOiJvZmwoFCU3EM6XBtWELkPnIBdfCZD+RUL6/a5IuTQZ0jb3RyiAVE
 HR10Wu6gsgo64fWneyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX0ri/Ig+oOHws
 yD43NGYhQpRtLXbXeXGKVM2JIgQa8DBc1vZ9+P0SNZfwREaa5j6I63GT9e2jYCDznRV6vLM+Ymy
 0TbCTt8DqItgT6c/o2wiXW5F5MnTmeQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

