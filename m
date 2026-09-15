Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA7361954
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461862; cv=none; b=QADC6l5Dx97xnXy/MeEc4sTbANs6Dr1AAYrvHH2oNbbk7eJwZRO6t/Xqmz2AIU1/y3AnHl80gDS9+TCkZo4kq8KFyZvTynwR9jLl5mAB3WLTSv7a8nfl9Xs4T5LLhdyoy73Gt5zAAN6hsLZ+wtOeoahj3xlWTOB/ahlmlsKnuA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461862; c=relaxed/simple;
	bh=Rp9HFCeTpaamawVvosZkxvLwFJvE26dAepDe6I9U1TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qk7WLWfzG9fCBdOYWMK8NHyfal0F2VaI4RnWFw+3kcwa8dQ6hctutE71vTxREKQk8eW2jBIhavKY8MQSgmhWkkpO5G67qJqbLL5m61LLjbwFRVKQfAdrBT9F6ZxaNqLVuI1A8xhWMEumxuaFyBuLoNv1Mv3wYyfsi/4u3maK7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KboxuY70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBZB5UKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KboxuY70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBZB5UKk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z3jd3486817
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0udQrLqzKNhbHFqrd87zHb
	u2tdMfn1BRnc1snQGcn38=; b=KboxuY70AI2Vp4VL5UYHMUssxlmZSlsDnPaDw4
	nVAtnnU5AGMDPRtdskF+MZUh4ulIk3x5vYVOaPSPckSoPCkw2ugIAJ8rpdd9Ma7y
	BGSa+OSrW8vIiQV+hWtwDXpO9hpEDvBwO+YeLk78Q/YQT0R0R4Xt8FTl2tNrJTyQ
	SEbiGfk7++JlYvf0+yC2k8VrYrpc2sLIKPJ4EE9hpiYQcP+h3IgaudKBc0ob2SUv
	shK4jOZFt4ZGmHsOAVXxPwurb+Ux7prUUPYbPri26ZxNNiwFh+vql+a6yhcoLtNd
	qFPK+HM6xKu+x5EYWonxVpKMcmAkYZogNPqqAm/MAkk804ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerm4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91043af01d9so84040986d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789461859; x=1790066659; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0udQrLqzKNhbHFqrd87zHbu2tdMfn1BRnc1snQGcn38=;
        b=FBZB5UKkKKHn0fYct6RHIUMa3Ygu+Q5AxE93cd3Z+h3pvgjm0sEuAEPKVKq2sATA+m
         3BEXDJDhlfkz8ii5/3JckYRGsKBDpMRNs+BmExzqf0TCiXz9J0VnzeUckrvsJZgofbJA
         DQRIztsK/aBmVjFNRk7YJerVoiiQyV7puqigSnETNpmqovB9sLPPzUhNQINLZHXwYEBZ
         QNWBErKEJsI8YFSK5RG1nLVdakBDhjbnUABetN2Uq+TW6DMWfaqSb/1CnQMl1rRHUrnx
         XSk7GsQaQ3k/KmgyTuc3sK+uPXR+qigXq212Fkog4f/m4ukPTkgi2NuKUlmaWPF46x12
         Ybpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461859; x=1790066659;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0udQrLqzKNhbHFqrd87zHbu2tdMfn1BRnc1snQGcn38=;
        b=XUGqDvZFXG7mpSh2hUw5fhdiamjPxsatZfjFDoZxUkLJas7YGUDMSMJw8o1P2hcL1M
         +Hv3TcsvpVuK7kJYWoN02IB/AGQpi10E4bXl37W3KQG43jUTtyCPs4uESAWKFPiGdzkf
         Ni6IloAbN4v46qRh58y3StHTscO/W0RlrFU6t35ke5nZ+R3HRiLyZ2kw2cMpWE2myh+0
         S1DvnviuxWfv549kLO1DAWMEnf84pyIlUXC2090PqWF16VWk7G1WdjU2rroGvnC/CoTf
         NO0VVWooYkCvOmslJ2VYLYG58cCW+QPieEnB/T/i4OBwSsTUv4gFTXx3+WpB0ZRXJK2Y
         vlWg==
X-Forwarded-Encrypted: i=1; AKwUvBxmxUTeP0wquuA9E/L64lmAhKFE0PA2jonJ622yGuiUweHPFVt4HG61GfClO4/cx7hFfCRHkhPfTunLiaw=@vger.kernel.org
X-Gm-Message-State: AFuF++nPHxx3LA5rOJpw/c7mInnzoZqrfNB1IECrEP2GL9l1FSvPUaey
	FVTmmWAiD5iz6ytnGvrL/SZ+MbJNxD8cjgsWpBcdxXcavJ8KZdQIX6JBoq1lL2J12YOJ4yju4gC
	7hlAICiXBuAPz9yzhXfpAS1xTRovBtN/Q3OksgQeaJkL11X7qlhZdLCxoZmTKb3z8g3E=
X-Gm-Gg: AYBFou2lbb8mB+636zhOWsbPX1j9BS7ZEE25097NOy97cEJrVDZjk+MSUhXN8hV/MtB
	1Q0saI2cDkSd2VwYG/T3AGT9sDDD6YxfoZykaYhkqu71WehUkD//5GgBh1WsXUP9hcaVY+rlQ9z
	FdMEAXuCIW97AjCwmtf/toTxfQhhY1iGFQM/8B7CBOB+CDbMdWX10yGs4bp3ry0kOC+eheGoGKV
	frG43yJe7tHdPzgLvjU6ZNQSWqhXbQktCPvI1YgPjhdJedXB7a6Dy8IkgUaTQ9KK8V7TOAZJnZ9
	nIGv/SeZEv+dGL4iNTifQ+G1HijbYI4lBslRUT3hDfDKVUXQPrsEyzFvAJaHXsAdfPYSO8ey5gI
	apMeJYx0=
X-Received: by 2002:a05:620a:6892:b0:939:896f:3d8f with SMTP id af79cd13be357-93a29939afdmr874519485a.33.1789461858816;
        Tue, 15 Sep 2026 01:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:939:896f:3d8f with SMTP id af79cd13be357-93a29939afdmr874515885a.33.1789461858328;
        Tue, 15 Sep 2026 01:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm36597707f8f.27.2026.09.15.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:14 +0300
Subject: [PATCH v2] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF0FqWoC/52OQQ6CMBBFr2K6dkhbqFRX3sOwgHaQGqHQAYIh3
 N2CN3Dzk5f8mfdXRhgcErudVhZwduR8F0GeT8w0ZfdEcDYyk1xe+FUosCPBYHwL1GqhOJBtDEy
 E0BJB7QP0FlxncQGj01xVujJKI4v/+oC1Ww7Xo/gxTdULzbgL9kbjaPThc4yZxd77xzsLEGCyO
 tUqlzyr7d0TJcNUvuN5m8RgxbZtX9n8bnj7AAAA
X-Change-ID: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp9HFCeTpaamawVvosZkxvLwFJvE26dAepDe6I9U1TE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqQVfAYCAckf4p3mnsz78/zkq2+9hkAy+IIgP3
 pA2AHguZUiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqkFXwAKCRAbX0TJAJUV
 VtfQEACHpV0l8DOxsEPgF78hpbnLGSEfP/kPBBLQHEkPJtjdCvFeZZAnS3gPF1ld0HOJUm3CJNL
 JcUIDl/wdnFb2OA1C+cBeNkgjx+0b4ZqZpqGDXVXLECgYHOQEUbJyenkuml+jb6fdHeUaHl6ScL
 hxp85KrBY5wC7LZv4zAqytApWHJVzigICQbnBVKrh8fIzKwdSzyygK/Pc2Hv4hxnaMgNaiSZsRC
 wxBd1JCzd8JpeUoRj05Y4IWhO1CBPaB4xTRFwNfjorBOWBulQcPg2aCv2RI3zciXvCYshBd5dby
 SSm7mZDXuHs9PBEcWCdEvVuHYPqLqw8fTbICAjwTy4PnEwbehC+ci6YezahLf7tpU2jdBX0FgC+
 oF6Layb1L63iMHlWEp5xadR7qkGmeeWM5qu5dPJQwEWEciJEoJfBOXpN0AfTszXAQ4TVtBqfTMm
 DF3JsHrgo6MICrQfVuLR1Z5Y1ckHB4AwuXK9LyHBsdwg1LotbfO3Pp9sVC2ho2Y1M3NfqG/SCVk
 70P+td1WcmvXNEcLlxuvx9ExvPjoCRw5Z5AgqZXupc8uvViZG3jjwkbgXjBWZ8dE9CZ3ICUKJqH
 CbrjTLY5F6dvHzfK8M6cQzuXhzZj3TsIzwwTnVQ2IwXhwsyX1waMm10xJzx8NtSGmFmgu4c7zJk
 fjbs4Qz4WG2QS4A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEyNSBTYWx0ZWRfX2EElPegXJzvh
 gV4rXzj7wX0yo82MegGiRJGyMn0bB+HdeG9J/f5ScTGRjxOPTPj2Fe0oV33Nn4Yr+boAn+rQXyz
 QjyD+BFAyqSuTA5Auc4gY4ekA9XPWy8=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa90563 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=SzSwJUkbDmbpeLrXXHcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cQoNOypOC-h4H8JPOhmlrKd3jBjv03X5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEyNSBTYWx0ZWRfX/Zu7X0fUDArh
 eTdLaL3L7aD9aVSuF52778/7LYmCxmmEiSR9iuVH4WGnZc3d2WRlBeCPuZcG6esTjo9HrBHFWgp
 jqexj6cb5T6vGTL4HmHtUZsI7BhXQ1QlfDkQjjfWGyPFc3Qc7IIZWgDupu9Pqz/cyK2rQQyG9Gx
 dY6rWByabAo8GgSsMyxKYJM3NahlVp7NwBOq8TZV1X/OfQY/UDgzkDhKGFJYZtkskhD6u98hgQb
 MQ1dejYV8dQBO29YohYM2WqtutTehdWDQysZT1oCZv0o59kqH3/NtBMoKbUAZpfAMxwnwRm4UuT
 B0yL0uIrMfWEH6gsvEgxfEDyA17wFObm3bEiOL19R+Bppd8ylglWEZlDoTeAprRGEtQM8xHoUUn
 74N3vm9niaRxGgmTS8tEjorl3waqUxfllzr9VTuA8xFP8fvXYYij5T0LPyI7ifk9Ak62HiX7wJJ
 tkzRTSI7YvB9I5zBVSQ==
X-Proofpoint-ORIG-GUID: cQoNOypOC-h4H8JPOhmlrKd3jBjv03X5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150125

Replace the raw power-domain index of SDHC2 with the SM8150_CX binding
constant, which is the correct power domain in this case.

Fixes: 876644c76034 ("arm64: dts: qcom: sm8150: Add support for SDC2")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Changed from MSS to CX, which is the right power domain for SDHC,
  as Konrad rightfully pointed out.
- Link to v1: https://patch.msgid.link/20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..e83fe8daa7c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3574,7 +3574,7 @@ sdhc_2: mmc@8804000 {
 			iommus = <&apps_smmu 0x6a0 0x0>;
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
-			power-domains = <&rpmhpd 0>;
+			power-domains = <&rpmhpd SM8150_CX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			status = "disabled";

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

