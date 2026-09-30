Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794E4DDB3B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772383; cv=none; b=G49BPCjPTGFD2+YodSg/vh+E7eock1XGkAVAU1iFvUWiIJXOFxKFIzxZiSSlnpqiyANPtRQcEFCxlXW4qvZSfk2PTLvjGa+MHk7DxITFkCDRO6C1w16NOgE7poSdyr31sgmbGEPEqsCQDoyhFIprwJbfh+AlwBUGG+PHImysQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772383; c=relaxed/simple;
	bh=dLk7fWdCBteALwvoZRaHU9oeqXBvnyQuhJNHQIKcy48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAY2ztHy9ZZNG/GBiAg3EGVof0FZhCSu+X2W0Zb9Qs1aNm0EmwsrJOyh9hpazBUpvzmykf2RBN387La1Y7mQW+8t772wCGGAo7U3/gXv5qLAfKeOR0FBowGSkDpQWhLryZP9lUcvAWzUiBLBtAwgWXqDVRhiBt+YXP8/yq8bgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqfTX7sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUBsTJIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqfTX7sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUBsTJIe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7cjS3547308
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4c/LfuCxFPo
	u3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=; b=HqfTX7svJQrBKUBq2i4H1KAizP7
	+vtBPJtmvY8oJ8PdCWTMhhQW8XO7ruatv0+gQqFpdn5q/1v6dmJUsZI4vpOVj6Qd
	2OIQM3Zb2dlXY/cRAtNOCOfzUEOvfQt4oivT7Xilbn38uOx8c/y+pylWIUIz0Ulm
	MT1jEOuxdCDIPX+IKhmsgGXeyQJ5wx8+615UtuFO8HsHneVqZJjvGiX/NUxgRcJQ
	oA7PRj9UdaUZnD7xtT/j4x+SfbITyWFcNFpUs5D5q+XcTvYJnMqJbZGxWL7H0fPb
	sm4ORB83gOqU4NVEWh+vr7rsD8ONvdtuykmxJnr9WmievdWs3ZbIFeWr2wQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141m1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b335ce0f18so710722137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772380; x=1791377180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=UUBsTJIe4kStHVDl01KDjm8hDQ5/9ibWHUTkcSSzysILZw8KJw9LcMB/HU89IoeJwo
         ulyFQRlwCcCON3KUk37uHXi3eWzCiar/8DT3f7cVLiTphG9/83kNuRac1mHXRDUfjvJp
         0yRfvK07gitGzfFJzvnP775xxmn+LFh9avH2QKxvHbISTcQLffTNKxiZfJDAYzHCNU6P
         D1acSeSSPL7NUBPv4M2pcbjVdjyjUYV4HcaRx8oMgaCXznkj2u2wodnaNDBq800ydtA3
         c04icwfmX6ZcJUlgNSzIkgXlaudqZudBdi/YhSBOjzvo+W9CE4zrNfILGwUwmWuxYIjn
         BLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772380; x=1791377180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=aFOXLx533SHSE7W7jvOl64JADgnoj0DWBSFqLkp5TrH3wGPYQRD/9nHEPl7s1gZHFT
         1dVXdg0VvRMAhTC1eLCiasUCx2jPdtIm8pkezp+3s80LNBU7mQX/UrlBq4vp4uDt2aMu
         qIGpLZPdHG/DYAqOFMjqOGuitpFTgD5UPCF0CawM8JO16wf/rUr5b14uxDw9MZx7UTYM
         kGhXYq+K9XXbtIjKCAQftTkLqfydjK70MuEd8PZxGcVLC2R39RIfjtIQvXoG75SCH4b6
         +trfcs2bUOEkiE/9tths3rUG/BMLMdsuPwvimuNvjqUVh7Oy0Tkqq9Re9oFfGqUTveKD
         q0xg==
X-Forwarded-Encrypted: i=1; AKwUvBxPRHo9Rf2h0bUNs8H8ZTc+97g8UbcHZ4/uU67HNkJ1f15R3pb+aLFEXNWBAJIudzEPA6DsrwTds81AFCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv2E8ItEfqeAhrVIvd7FMJYghBXX13fhWiXPjBR+CYYEq2I6gl
	ElKzwZM40fX/lNwjXDTjlxMUeZuzE61axHub9GyphVrIMAivRP1vmymuolFzEVFEPToXI8dadxZ
	Y9JybZAK/RE1AxqN6D7BzTnKZRxpA8r9SxuiyLrhtwDg9kHhVEbM3/SpqY5/TZPJnB9E=
X-Gm-Gg: AYBFou3oL+wAZv0LLbYw2U+4Av4aZdDLTJ0UZPW8sA938JVr4NR0bGVQYBu0QgrihXu
	nO3dnmJtlf2sxom+CWhWk8aLwdGINlhdPorYsbde0dk6Y4d52nav5pF1F2W6DM9CB6nZgSRjXiN
	V91xr6b9FQ8n6L5JaC2gzUbOmsqLeuCzls1X2xqNYD7yJvyLnwpnRy5DL0lAVhJEHzjsDYh4vKo
	L9jZLyZd6r/JHI1cK7wrkrEADRtVQ6lMZS8hdoXxRGJ3c9lBwMZrn8Izu3jswipyUN5ocSSx9CE
	WN8Q/0x8rtDoluCEyjcwB0cCZXvNlO0MSt00ZGD+QwoIrgrLG1OQCI7cItpJZPEXHw1xrimYu6h
	XggpIVVhYkWLp
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188604137.4.1790772379723;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188588137.4.1790772379200;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
Date: Wed, 30 Sep 2026 13:46:03 +0100
Message-ID: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX24/v6l5h+Ewq
 CRumyaXPA0wY8Vxj5xo2AIlXUuBJVZI9/XCpkB2TV6cwAvHjm17FahOcrpe8I1QckkCKPFAHOiw
 xc5UajjPI+GBJPLqY6Juw8wdkTbwL44=
X-Proofpoint-GUID: tHy9p_UF2aJP56G5T-0cLfdzsSe0kUsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8nDpNyTzzZL1
 tORcwP7R3FgxrDkRNvcKYYxX9aPUVk6lDXgy72yXeFu3pOFWESQJnaySTH/sjHe66Pk/IWlhEkY
 KCFM7QxBZdAPDGguBk6RcAcm1D67VVtSlF2+aMuQdImBIThquCp+JErix8kvNOJscvVhLGySgCo
 Z7LPYZlp6xHomLbqIYWJu+Bjl49Zz+V2RewMWoV5GhxBvAsi62K12+KzVUIR0TUf8HFgjlNFoEW
 rIZWuwQNRI6eZyvls69icAyeaXgLR7brmV02UZO/o/YtR4s5SJdXn1poreOjKsob8jK1pN1lKZm
 MKbSpqFCQYD4c4ia/YusnqK4JNhlSUwVoS3t2QOiQnYqdvlcm7lr9Jzo8PUAwco3QX9ywlVvsOO
 bCWs0dHyUhV8yGlWunjFDkPyUq5VdR+B57Ls0j0P+AhUfQFrEvkEYkYeKWi5t+g60fT/dU1bZ21
 1IJA8LSbF5pr9Ii7OsQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd049c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1S9TnuZ4X9D0nYt2MHYA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: tHy9p_UF2aJP56G5T-0cLfdzsSe0kUsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec
support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..7a889d888383 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

