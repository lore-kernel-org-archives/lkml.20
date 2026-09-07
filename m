Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE448F837
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782647; cv=none; b=PwEofxrrFRmn+soKV2/KQrStVg+92jHdrhFRUOEd0sD69xejG3G9SliwyttGcS+D1KkxbM+L3T3ygmC/HG4ny9mokt+bmY64nc7LfF0joIycexgwxlCCMN5A4YUgRTJZTMfNANXQdM2CPNHVhAV5TFKtr4rRpxltxO7xGtrDZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782647; c=relaxed/simple;
	bh=WAzemNAMBlLHCy0LwRLtLcYV4tH22L1qXU3EjulLZFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZ4yX0Y+AqXnu0aMzUmU/MzS8/WezBoxiLOLsZBDya9yIAUniLOcXYVqIB6WxyQeTX3O4g2WIyYC1e17AqTKZRqEjHf103+9aOq/XcPBon24TCutsiHoZR6omBEZin0oDjTk1oHKBTiZM6zhUx/jNV45AE4mRxEQLT0Ow8IUKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0G2IQKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqsoVaIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0G2IQKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqsoVaIR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmuUs3349032
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=; b=V0G2IQKitjbPpFxS
	SJ46EyVV/kWyfnM7OSrv4AR3EFHkEvE5wkW25KCrJlzejAmvzWFCr2TIchCirvLm
	gh+x7idC/G1ZMexwXC45mFh1MP6sZYqyhej5YrNmywEF5PpEbLZIXdzUUk3j21eZ
	mXGq1NXf9ZQ+/cK32IEleUGgh5IUN3rDME+KRI8Vos2wexzwnOEwEf86FA6uqdk/
	wo5OH/SurkT9nA6kFFNmM7EePoLyajwY/15rJspxR8P5L+vyE00h7Da5HFEgGdo6
	N8OPEZTzw9TRmbxFZOeULspj1l4MBAgHIW+G2UsMC6BZwbq3q0KwHktuXsLxjG/3
	nb41gw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0nrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:04:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so6033400a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782643; x=1789387443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=CqsoVaIRSk3itkhJ2U06P9mTiXL79jtK7jXvhYcj9q7JxtgyD1iM/tGKDhVPD3SEK7
         y+rR9dzEwqxf5XMg3tLAi4B2KwC7n8flg0mBLtf9juowLm64AlcCbJ8HY17UBS/Wy2Q+
         HtgW67lvGacXnfAawZPBd7vTiwJlig/T2OfqioS2ZAi3xOXxK6mIsxsSHdGI6svJKkhV
         kqHEBiGcsLon5bgntf4w+yedhQw6DdVk7uHaqlIgNRXDOKyfN3CPb0/cLZx+Xc23ICwu
         Y7X0DjmVwZ/LYJUGtFc+h4XlSHghjSeJ3KtSuPZjO7d8p1SF0apaSmt6LjR8Q2HSSbya
         Du/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782643; x=1789387443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=qRtOZAQJC/sdSBsX/8f3P0PmTXNODEBORlg8PneQpUDqGNWOMH92/Ajol4XID1MLht
         1Y9Fz6/+3PNHqI9XHqV2OSc5VOktBplXMsckSg2gA2RPuwODLTGs+uKegF+nzu6hM5o6
         JTlO4i4sYlete0XcF31uwzpeurdV/XPLN5R4aIlk0y/oCDROVLbz8X323jc93yNUj2rV
         JYuKpMkaZh2Kcnho6jYtW4Y5rci895ARc9lIQdUrkXIXb55jO8NhOhw0C4aJDclYMbCc
         5JfRREuYg3/3wcq7Qh0MJuDZ7grNn+Jt308ep5DngUTYg6AA3ZXSnQ/CuhzB8Vz6BppV
         L3Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxwouybEaKBMcF2+xEOT79qROHvG+ElIHIiicDwgUIzoucj4nm4WPAQ8FLlapgT2O11ocB01YrbgMReCYw=@vger.kernel.org
X-Gm-Message-State: AFuF++naZthOBhpb8ZxtVKTuXFrkvUGMbL6FF0Lbq8VtCxQf8bVjumiU
	EiLubUMMn7g49vLfnGk1+TF6vU2GUaJc3Oa/sp4++FqQZpWwLsdqCNjoh7zbOarSaIrPXWaSyIw
	Qe0UpZP54lNFrrv6PY9d2KnnvC2OWPTz5NmDIMQ4M5r0WubkBeD2uu5zcjLKs0/3ZW3k=
X-Gm-Gg: AYBFou3djcQenDzgVeOhEpx6EmuZTJmSqQFX21eu9cgbdI94okZVTDsbJz/Z1R3DoCc
	Tq8qKHBSyk5t90slSScq4ARayH5kBtAtfnyxf6Tuvfj6LC09nfhAq4e1s5LkvXalKGWV1dTlsTa
	QjgpcpIq9i6lejXlwT19ikRr/5Rwq8cfeyPimg00hsNWae4kV+gbTp201Bbuotd515V3pNGq9kv
	Ckmn1l3QccaFAvScrOSiWUS4C7hF01oGAqTjkTen2R2SozNrqMqktlg/AaWCkE3uFnBgN1bLWZ8
	9ygs12Ph/MQ5ZE3ks9Whlg2mtIcCd2Mll+pDvDWsbnVPnfFj8eZVwi14t29yNotaSDh3q0LNki7
	1BakUGuVsIfx6jeSuJrJxYDbnjsVEIB7OqQ==
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356186637.4.1788782643526;
        Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356089637.4.1788782642990;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:33:36 +0530
Subject: [PATCH v6 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-shikra_crypto_changse-v6-1-0676f61894b3@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9ea834 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jRqT4ON8ILxQsZyXINzHq8rP7GOcxVWN
X-Proofpoint-ORIG-GUID: jRqT4ON8ILxQsZyXINzHq8rP7GOcxVWN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXwSjv57YWAlbe
 +KKXFGGxySpaf/U+H88zTcV2QzJyr0/3q2G2ZtS9bx0iMNic6HUCIkt4H2S0yRVwkPD27YmptVG
 T3kKC9Hg+Wryvz6SxvZ/Nu31GgdMk6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXwu6RddLSIQY7
 bRluGiGXGVkV4MvGNbpGoQgrlF76DcBIjGcG0W57/FjB57Lyea6gIq6ZM48xKiub7QNO/t2WBpV
 CXSLnSUSxUgMhQ/h36nzOIMF5T8QYBLtq+mr7atvG65I1lwCR4y+h39lf1G8LnxRdHeZgwHtUpj
 zsh78LvYnw902N1VtRTQleRAHW10mU6sTBsU36RZYvSaTYyvAp25FXH3XO0C3/EK3xys33NwdGi
 5Ebt5xZqGQFHKG15Fp39HYb6Pw6wesjapt3Zqba/i4y4gFf7GqTfBisijoBqxCFbezqaleNAhw9
 5UlKqLinjdfYRTjS8v7E5KlbanKfgYWwO+qVMlo0/SWYjYaLp+OXnL86JDKWsKJsqPIbgdSFvnm
 YDKg2aBioWbhfHoIfvPDXb1UbcKZD2XDNcTKoYopTfbS8118Un6SLujo/hT5NUcXYdQ9VU89BtM
 cB+mj/q67CFBcYEyjDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

