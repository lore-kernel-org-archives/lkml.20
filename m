Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C613DD51A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031914; cv=none; b=OjupIyUp1jWudg4BfFi6JVa18UG7lPt3vOSxj1GxZW5b3qrX//S8zDvs27lgaT6spbk7PTW2LNz9JS7HS3DTSKjl1xd7gVDMS7Ra3nuYSLLF7WZZ9rpbAwR7ClnQNtwNnwu9OJtAy2ZFAYSx09RxToyHuXjxTHK4a6sbJl/sIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031914; c=relaxed/simple;
	bh=HHPIAlbg5SKE7ocM9rxmM6Nc1vEe/Zllp1Iqlj02bko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evxr3HZO8+bIM3gMdYMK9/cXHra8ZbbHAO1MZeTiFzJn6jYRs2vdv+TaypfdGpfOFOWNu6WEwUrj1Y1DLY4sGwhIzX0J1fZA/PTXyXs2Dmt+6ok+v2mPOLuY5ZAgbIX7EEVWJPpyngQ7SclhNeiiiSAEYjVVOh3tnS2JlsUV6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igv5waIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeDfzKnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igv5waIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeDfzKnD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENRH9R586377
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rshGCVxoKqS
	MWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=; b=igv5waIWSzr/dyQ5pCLveDd/vD7
	PRxC0g08gEPPTPmCLOAWQbZ8e3aXSN2Vnpw1tYeib1X54wyvzI0DRHlSVsVEQ8Qg
	kPYnDwu1eeJVcNV8btRavd8Yo1LVhjcONRG5TmLyc7ojrjcr0say6wDvu+Tc6BQT
	8PT00HsHj555rBa2BbWvqjHEm1i6u2g6+LhYUkwDYtOpHvAFKGPEeEa8vgSc3Wzc
	HQB0t57WIJL+vGs3lGOEJeAaUzlK1P8hdusMDrYIfIBZL5wJ+gvf+EB6Z/ycYjgf
	98kfoZ1q5MMYTzQRf2uFI3Ag/kVTs32RyM5OxZGjUYY1xJxUXIXd4Z+0Bdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakderj52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so13423196eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031903; x=1792636703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=CeDfzKnDWyuOhJfHDIBfVi/P+B6pLvyzzw+bKcLwBIYRpP+0WQztxp0di0A0BCqqwb
         5FUo8hJslhfKWDImlIFQQdud/Rr70KppOlQP7UMkj3u9aar0smBz8kwc/f9MEaAmNM4X
         g972Cn9oPZt/tH7YdbfgZj7aj0Li2BVxoZu0PU0akttBiKGlwVvWTnLMmDop05omJHkH
         OEkw8lakzpgkUMB8hE5r8doqCBETFRG0wsEwznKWy130EmIc2j1zkQAJu6VMYE0ByURE
         aIRR9T3LIj7J02E2HZc8SjlSj1Z/eZKrQrME1X+0Ma177nr3FhaDRAIb+Y1gdwKVZLpx
         7esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031903; x=1792636703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=fL16bDWTdQf+jDgvXBCLwnlBMheFn9rWCIZbkF2IiFGrMnsBO4D074dw7oCEm8DjAb
         GP9Gu96FIMEaCTaXxUeFRSxTj1rE+lsJr0Z8EhgANe6nYeGePcpwQ0dDKm8dZ4UrewM4
         E8ZfjYWixFonuyQ+KZW4+eFCbZ/W0yVYuFXV2j4znKESsw3byxCyinN9BD2zSKGQCs0s
         TYK/0y96v3R7GFrOx1G2WzptjX+Lyg4ncUNZyJtqVKdh59+uzYK7QB8vhKnxD7d/ynDb
         6/vMhhmXvPlallbz+c3In0QbLF5dD3Jyfh/L2/Czk8H4rFBLEIz2+/MywrcfrTWkDTVR
         A6RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFz9PWOI14iFBf1N0T+5H9cksQ6AaHpwBaTnB6UM11VD7VXQ+uGnp83GbIGZSnXQU1/agZ7zo6sZm23/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjN8jFcwS+u4PO9VGru9j7Gg9ytRGKVgMSYU+GLN5tVO5xUChH
	0kQFl5ea12olj4fLAi/G5b35Wb1QI/JBJcgrzrLE4iA37nfFLrcU+mWGaUjldJ0iFVjbPPOZj3H
	8P2o7aAZArYyOanxMHDxXHLiYWwALt4PgraAxgOL5bGk1MYXGBFnxnKtuhlINqK7ggto=
X-Gm-Gg: AYBFou12QD6OYOaBGjjVEdM/TuuRKd4SqxpyVWBZHs+7rf/646HZyOk/HN5lQvM181N
	mDcz/H7kiUpj5oeRryP1+LY+L/KqCCOHlYRUlaNvi0GA2locMDiIvfRwp4iuD5he1VwNs5KDoUe
	6AG/2+IjiRsETG0DdXvU7gLlxOKCjrjo/VhOXvh/bbBh3U8FdKgNg0HYCGtXERS3yuMopNVUXU7
	ZrJhNJFJ64ihT9wOE5XFAb8LDybjMDydnN/yZcmR5q+Wlapi+t/qLrQ5u4y5Tpdewq3b2lHsLwg
	DyJK5dWKK5oCiHKyu7FnQgTdzrwVRsuC5WPXVqN7qDcSRaHAypWZiC2Ga9O/mCjgaUREcKJSsYW
	iRZrHpxlseDjsIYT5+a0e8Om1lYYKzb6ifJm6Rrcy1P7B7xxTti3chAQtDzs=
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595139c88.16.1792031902709;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595098c88.16.1792031902051;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Thu, 15 Oct 2026 10:37:10 +0800
Message-ID: <20261015023711.721837-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad03c9f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wHr0H1Nf3PWAsYKxetDM51UglOBPSRe6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX7LyXjBwzvGPl
 fi4UxoVkGQsBA3cy7tfyEluz9ZFCT/+gabFc9wtxqggC9yuctRpgWGvUb1Ofzb3rZM9dOlfhe16
 YT/Pb0so1lNNt8di10viB3fu2q03tITdh0Cvqc9gJte2lh0p+F7cr2tu+hk1jBoUmJtH9/3ozE+
 qyKnDaLzcrarvtdx1GJynA/jNRPJ+dnFzyegVOfsH54izUTZgrAOEaV0lsERmkUeyXG2v7c9fNm
 tvcGOx+SKtzKKS2GyMFFxLZ/Yx8FrzjsqaG24flhvrMTBpj+zwoIt2tjTbSa2YoI9olKKEgMwzH
 rYE17q9fzZ7XuSTzdHcjNMrFWEIXp9LIFtCJieajU04McsSJfuHCNHenCLRZ4AWgDc38SEX9Bk9
 jwr/tHIBxsGQSJ7Ri1G3fAhKxMRK0Q5G74ND56Y5kxVwvJXlpI8oxnXCunEjSwGZWtfqEg6gcXb
 CoNMrFAh1g6H1MNi5ow==
X-Proofpoint-GUID: wHr0H1Nf3PWAsYKxetDM51UglOBPSRe6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX0SuNhk+uXKuD
 x2Jm4vmrC+zdj6aRgnpwwQ8H5WaYEiD0gJHTBEwguLa2olEfWuIOJNl4E8Lv9eIueHgwSbnSE2d
 Ho90UnazwnGBbh3WYrDO9SwNmJgumXc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150010

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

