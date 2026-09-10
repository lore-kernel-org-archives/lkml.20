Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD425524C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052591; cv=none; b=rA4U5e7hwDwbTtw1dTdN4ZNmEOrTAaQeQ91Aq+A8zHII7iYuDAhtoF8ykjxYakuMujeHTdoCNk+ag5n0ehaxbndgRU120aRdgkYc3DSiDMscwhQZVsqwWJXl/8ibWVcfjCW9n1ihrotKrS/9IThhhjcJA1JSOWi/v7AdfYIEjIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052591; c=relaxed/simple;
	bh=dHoNLuP/MiZX34znx8vGKptkQj0DrHSQ6SDhwKumKzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UP9fUQnxl7UtRTXmVFnFzGHNIpxWsbOo7tjEsari3zQLdG+23GH/SZx2GtrYcbI0INlU/0JxldbxOWTuDO0+PezzgtKYkVhbcEON0ZkAJ6hYEnmGgX3bXe24zmFRbwd9M2dHgh9+6uQA/FDO2pjk/B5Og9hnr0DZ27aJ6soUhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/MDshMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiS04r++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/MDshMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiS04r++"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADqgV91151172
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=; b=b/MDshMIORZTKmqw
	vJz8QN94jT0yokssQ84WcLV8RlJrZgNgSYBFcKW8TJCgcXn1kZ+srA4dOU3+zcs2
	2NeKQiPKiTT/P2NakpA82017WG/xE7xHZ48tSSl83e771pGo3BFEyBO21ZAjK+nN
	46xoakL4rMDIx9W7yz5JbHrbC3b1azxOyCtbg2thVZk6HuPXwGAwj5tezowTKeUh
	xgVdeuamxNGyjl2HoeoRlbgqTlSjr8gNENVFTChbAWAv9Z0+WkHsz5eanzQan8x+
	hFCsFY/ZfweFnIhoV53/WbaQ2vJQC28jtgN1ezbkD+P+u+FOYz9p+70PHV+vrssW
	lrAxNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts0e95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so5929125a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052588; x=1789657388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=CiS04r++FHPy0xuKrVlCI/2A60Eev6VN4rluUVCHKK5tht8uE2efzH9uzflJB0AFKV
         1RicKeR2ZTrRDnAoABM/WEQGtricrgUSplKjLsRN9nYGV+sqEtsQwWG3C57KlCv1o/eQ
         ApxJwAjz7/Coi2rnAJ6TQ7K6USGcMRxld+g65e4MEfXzBUGnNYUf5rztc5R+ZZNtoaN7
         UDIMACXm0pgP2EPZHaco+W0n1WgS6Q+CIePVg9Qbn+xnyTtwjeWVshjEmvSwIPVCUuiK
         C/yNcujaHPWUWax7Vqwh/lLbw/oUdi+ojTJIFfUTlQCBdoYqpw0TFj3lY54CtbJ3861a
         eudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052588; x=1789657388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=PU8PYK1ZsKlL5cAJsP+Tid3s7gDZO+rsKy/2AgGRHN0QcyITURAjfaBVx+dMzZX3qg
         ToOtELju3pFZOHOejTQ+X31TOyPF6BQQAtKZtyqZuuva8ZFbJ44oLHgf3mzVOgzI/BOL
         YcYxh9lVCd4jjcTAARpXflPBKtTwGr//nwCJv74DJevHdjqJ0OL6CxYGlsVnGp2unh9l
         /a+x0/Yk7afuk75F8FKkDMVedLaWcQhFaEbOVW+oAzlZOAECSRXMI/N9tLUcdlOpLz8g
         jrDqwEb0O+VWDS9T1vKXv9wKeDYTMDgcqEGC373AcTVucqd8AwDVWt6sqXUUOQFfE6Zi
         jnqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8AOuJ+DEazZSkINJg8+MMElvQbZRG+H59VdHA6PmZx51HYtS2f7aB8Eh6X48ii+E3eVFNrF/OnljtLQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n767qaeKbk+1CaEC/W8jAGbNTRnvKc3ASYcYFdhSeT0lckdwke
	OFKt6auTxChZWxokKpHDQiEiJkYIuE3/J5/p7TRwXOvu/TksyOTU1D6+Lv5WtOvbJfyz5NzpQxC
	x8leh2v+4IzkK5JA1SA8p/HcS/iUtpyfjWlKQtOVw6EPQqgQ0Q8kG2BvwVSTQDnliY5U=
X-Gm-Gg: AYBFou0fGDuRDtZdL8YW80QEdVJJwM9S4ek0uWmX/x7qO3ZWh/+4DFzMxp57bEwcATS
	PMv5S3zU3rRvftcBbnKZu/3NvgK/uXbcsXvM9AI0UkzIFwA1bAJ0f7onF2NNHfOaoeRq0bVAjyd
	fpDREBZAGX0/ZjyBPeUU44lCsQ3OVr30AP09F2xDqUUGV9B/4TnGKSqAQuj5Gs6iEEg89IjIqRA
	M+RH896AbcHJM2NBGXBKJuRzHFFABZIRXGyVMvlT8n3TyhgbzJvzN4qq2WurCJ85idsLDXFE1Eo
	Y3v2uYBPj3AMeJF/tEOdCCuM0zldnigbppLoWdCXxEa4YEgFJe8zBUf0prchOeKOpJZ5bQY4Y/9
	wezWbOo6H2E89dSJ/LClJnpbjkTjL
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67376194637.17.1789052588032;
        Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67375892637.17.1789052586239;
        Thu, 10 Sep 2026 08:03:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:38 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2c6ac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: PArYzSgBXy0jqFJuoNMYaP5EbN2_O-Yn
X-Proofpoint-ORIG-GUID: PArYzSgBXy0jqFJuoNMYaP5EbN2_O-Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX2r3g+hUaO924
 zpVQavxduPEmVXEhV+/hh4i4TUuCI9bl/hPQVzkDmxd6UnjiYlt5hxUcyU/0T6E9833085pFW48
 q1yp0CJNLD9+MmEiRtjNK1xTWkleNIE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX/hxZ0TDm2IGt
 6IX71P9nBzEEwkCqmnHvx5T+9mg7kFpk7s0K1ZHSvtP0ooNOiZA3RbfQvBg/TIXnCGWFiJQ5iaA
 EC0Jah7+wVr+t7SF38sha4SAifuq7Qtbjcl/ItZXBhY5hjOz+AWukU1sRjo9G4fZ64fz+tH0Jjj
 es7iCt3rflS2HpsewpxBDYr5lYBljMnl63czl+uu8HI+McqM4qYYojNSCzkvYSCg4GK5uMwT+LZ
 i6T1GaWzlwMKZGu9MJiBv7BCrOwXHP5GdogmM4xN/IYbKzPGDYEyz0PoTsNzBzH/A4WBQWPXLT9
 dpU8KmD28fyh+rie09l3PUX4B+cCsswYw8+6ENAQZ8ptUGhyuth6LyqUI04MwhE+XhH0iXBOZPt
 ipgvHbCQ/Yg/jOuXKfQjYrL+lotXKgehzbVTntwpyTZXfMC3A/nHPmjYtv0ZYgsmPo411R9i1j7
 tiZ/N4xi6CmoVidMXZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..0e7116d33bd7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -51,6 +51,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

