Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219AC35B632
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537541; cv=none; b=NuU5fIy8jkFBuuZOOtd9CFIPo9kc9Aumru5gqMUbvoCSBGHXEBZZQRYXS3RxtRBdeh7chPqVrgFSuPY0GDn9+LLKRs/SP1uI3sMCgf5jgnHU3SjWrn2rAK6Oq96j1G5oHLRRxx4MopFADoavU3lntKTWu54yLN99OwFxSqj/eH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537541; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kex+aQSPnCoS+jdsHTkHqjIOsyc3EF8qupXXhkrmvBgIShpq4XE4FO+781XTBghk6ifaNis3n+EsVY9OlPkKz+XWtmrla5+6q0NFc+RTM8+UcmiN8kbGg+xGmcAi4FoGJLcWLiSLoGjGV5r5Lss28IsSKbUSNWMjh3R4Bjbj7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0DXtBBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAM7BbIj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0DXtBBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAM7BbIj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM3Dvl1932237
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=i0DXtBBwQGoiqnAp
	nmbE1yp/fGlML0upLbPC23+jatyfuwvUrr+moAnPYT2L577w0+Jgx33Bab/XQvdZ
	ovjipyTnHkcCY28Jhex21Nb4ZoRJmx9MWg4czE3W7V961AWev1HsK+GpaMDYP5Mq
	OHdN/mC08qP1SuavZUvCsdbnyAWZCKwadDGDLNUlXaIbNlseWVU+c/W+MrlCIgDy
	B9Xadla9QyEVJ/ES+6o4bXV+/LzGR2ojn7ro0PJzuJQHq2EgPC9+7mZbwVaNVeb5
	MzIg2TYNUBH308/R1xId4pMcXHVcBW64B0eyaZKpPsE4MTHuIPmZMjLkXRNQg5vz
	Su73yw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9f9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6575031a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537538; x=1790142338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=GAM7BbIjsXh/HJeYuoRnb0FcdiFNaC+vEEiZ/3vbXn33QpvaCAuWRtiRkSRiZzVDSr
         DkvVY99WWXtH+vUXZeDMjT5guCSIqAxPzKt/P8DmjryxHN0zC3OcNOIGIc1/7qfDdFC+
         gY8JYUnGxNPix4Jl1tJPBgwST6bQVr5OI/vrRyAAUpW4dSPVxFlh+OIGs4Z+el42apuj
         ThH8g97V1DL5JEktuXqjA5gnk0NmcELY/U2Y2rSIjVN20jJ5oeoebXpmNYnoRlY68itT
         ++hHcuta3NlpXJIg3FP1Rd4w0xwOWrg0Knd5gPyusmTBBCofY5Kmfrxs6UlwAb3eorQo
         mp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537538; x=1790142338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=OeK3UgZdYVqjGgim7V6zyQ9yrruAML8TdFPbXtlbAF6Rvp5inkVihX2PcqjTJvn6/U
         a431CcSwJYCh4bqjMP4mfh0irwjrKUsVPX0K66qWau8rl/3d6ivCEmn69NKqrYNs68jO
         jrwJn0z/6M9gtYac7tMI7iNGc+VchHeMslCl9bSLoLXSJMdRFtmO2759a4kBNHpM7ULU
         yPMeBlacrtMNfQ0WE/yjvZCqjLUNcoTpuiATynEyCIJhD2UYEAyd99RWzmc3R4FNHI5N
         OOtQn0xr8Onz6RqyjA5Iw/LpE5nMJt6Vxq6OBGalft7poIw40GpFGr5+prT55jD/Ua38
         wlPw==
X-Forwarded-Encrypted: i=1; AKwUvBwhIewnQQ3MJhSaOOvX4GNrqkcxTnjcRu38st5fl1YOfgW2MOVbftDWpUL735/2V4qRoF0Gh+OpjmhXXEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mFy5Csc0n5GX9JYV7DwteMaqkE0/+yNVE4gGayHVxkJopW1F4j
	YP2JVzQF8GiqrNvec7M0LGyNb2xqbUfmIHQxzY6ANMCVufcRCkwWYHJtNCHDa8wZXm6UAuAND4z
	portdGJmJCselK2OighX7F0hdY4xFs6N1yGISuszEEOyLudkb3dw/Vi4iy3Imjqja1FwT6uVFfX
	U=
X-Gm-Gg: AYBFou1NWU/4hlvSvXQJoE+x3+W+b8YvwJI8rdQ8AvCNP/NFdzV+hJoNKtz1cTwskkW
	D7mpDoj+yjsLybH9BG8dgANzb6WTTulCM5vHfFqvwR79Ioxakcz+L7mwwfl1weuwjWs63XIG3nj
	2k9gS5DbHiImxd3x397qi+1b+NwARQ5ZaCBLtN1XbTlgZ5cfLLf9F3wOyoMxwcBO1q00eBgjGSQ
	6hbTmlU1Ks6p/R38DXFn4dj2xfV8mlxwzvsOeTtcMOU93jiidiB4RyhZTI8uCmK6Ns/8uUYS3w+
	AEelkle1bP12bee/JfIoMRVS2AXosqFfQTpuxufztHPFkvbUPINKy22w0GV8RYbQfaZsiPWTRNV
	/o9u4S7q7FytC6A+IwkDean0UVWBYPpE=
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2946064a91.23.1789537538352;
        Tue, 15 Sep 2026 22:45:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2945996a91.23.1789537537886;
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:23 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-maili_camcc-v2-1-f30b394bfd50@oss.qualcomm.com>
References: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
In-Reply-To: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX2H3UWRxx9Fup
 tqn3h5bsgE9GxmIfGxD3INQdLEJsWMlDzUndzwZKK3wPO/ljYlSl8NvcMYiWSxT29Rz0aJlGFZ/
 o4z33AVDHnK5BaVigX9os6t0NB3r61E=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa2d03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LI4zB1HvYHgsDYJy5L-rC8fRwh9VqQ1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX0xWkMmJxNO8d
 BESGD80XbZig26ThX1Vib9Za2vV0KdrG27LuS4AZ8VCV5KqTNqQXq9WsjECJxPlld3xGuixgFgf
 2NMw5qHIi9uPEjNZjYR6hvFwrw0NY+Z5Lk+XNR11EcYweXJkRgO8qdqS14Aon+odhYQ0IjO6YTY
 5wgRyLZ6kmb8P90t4S/Z5UnqxNPIkz1FIS8d7OlVvVfjRHk4/9dITIWdQ8mcX5QGKCgq7CIXypw
 XbdNKpN0JzBC04yrYUjiTFjDdRaUfoyOVSqnZ5o5U2WDj+r3Ad4MnRgJTv++jVLSC0GIKiq3go3
 HvANaYLjg0E12n1daCSNw4qkIw9A1CGtIVWYTN+0G9v32jv72tFU4oq1ME6XWbOrCAttrBusrLK
 +ar5ROpnJTZNGwVAsI4C3yrU9M0sJPNIZacX+wI41MrM5B/VJEJ6s4fHxzaggSib3qYT/FzwuKC
 7ZVbIUgIsZX6JuSJwLw==
X-Proofpoint-GUID: LI4zB1HvYHgsDYJy5L-rC8fRwh9VqQ1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

