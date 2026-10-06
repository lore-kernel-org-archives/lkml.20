Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698153C3F67
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285263; cv=none; b=cAOsmf8FYpMeL5qIWPxdP3tzcUFydXVASPng86yzyCjLALVDQPbVTVT+EMwW4QkBZkxqNrR3Ic7bvt1+SSIl8IkT5bkngZcPYMEb/yx72VSjIobu2iLeJspZOTuau7d28+iN3OVmdrsBa3gdEU1Phrb1RLSbXOFh3pzGmkZriJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285263; c=relaxed/simple;
	bh=y2FohgVugKHcRrwqSAgDn+CMIOQiCYuOFRGzU94UhdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=quFExZsT343uv6k8w9lonAo1Tg03wY3ip1R3JmOg3pbp1UdTmUL2aGvGDH+5DrO6uB87roRG3TaZltXNEbAizXlTI8cbwRcMziKCrSZwtNWYlxp1Egl5y+3G8YnH3nTpXugQLR1PbNlY5C2swtzEasXzbM38+wQvKXagiLWs7Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Rq8N6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtOh4Jyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Rq8N6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtOh4Jyl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ASPev3331230
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Pfmq9lmoce9UQap1hkT3q
	E7NyxlVsRLj1bFCy4E4gQ=; b=O+Rq8N6VhXndwfhf7k++0wdmAUqZ7x7cbxhvmd
	bB3irwOLtBxugrhNhiKFAq9HhLMNWrfiJgjQCgtqAVN9kGWiAmk1v6WheewnmWOE
	xo9rsqKWwieve3uYM9UGrcNQHgl1ZKQpm7X75XZPdfbRHcLtv+rst3I/ZcmCCxjx
	ZR4NiLZBXU8a0KTcsUF4kPMRfPcGxQxtWLywpW9moV/nCI9/kFxIY8ng4utPtY2t
	ielrtBrI6S4tKE5ppmtTtKkEjU3oEPkNoJT6qdYrJ3bOBJQqUyfzqtjDGndn4Jsz
	jxE9v7Q8OuD7bbVsK5Xg7dJWcl1f4dJ/iL4UCEcERzV0dIoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4y91g4d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:14:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7ab1ca9f4so2491159a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285261; x=1791890061; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Pfmq9lmoce9UQap1hkT3qE7NyxlVsRLj1bFCy4E4gQ=;
        b=jtOh4Jyl2J9S1w5Zpb543L3X/GyrmBv885RRFWPY7AfQ5l5J6xwa9ivr8g4qF2gGei
         oGWo9aiF3UrYe8TIleJzvJt3bYEjkjTwFxnJErM6rUOXppDSEiuXUQ9PvEtRt0kFhWCp
         4ibxNnBau0H5Izgb2trIeB30pW2yFllJqAOHrXFiR59ffHsPHMSYiw3fDRMJvpeYy786
         UjKV7n3zopU2LdCiAKQnVW/z/iiPgO+ABA4s1eWMnZO9qk8ieT9vuegbCK++dGO8pjSt
         1pAtJkfh0ErpR76d/zszSkF5WRTiWOKGfHQs1JwIaxy0A2x04iVgYQspTBNeKHD5CZYX
         ePtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285261; x=1791890061;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Pfmq9lmoce9UQap1hkT3qE7NyxlVsRLj1bFCy4E4gQ=;
        b=L5lHCuo9IU8wYUska3hCqVStdFl5uDJah9ZfuvWkKF5Vhl/Lvhfxv75PaW5w1oMOW0
         +4TS/2GA7f5ATsCD0LMaD+/2hsSFzDVCk0EC/kpj8vX1kDufpCmk5PLr//H5pcaq0/MR
         MVh2Z0WRhXYIUMOPtwBEOeKswuQmvTdN8JMEKSN/4ZNwb1bPJ//gwk4+O0CebVLmpy2p
         OhGcZ4e86Sy/VksjSRAMVwn/PnBS1fk1E+EUjvf/32vooZEric618KCuOWV6vL8OydXj
         lEhfL6sEBf4TtedOZxbHIwCNuF8hdQ7MZrd1btwlV/q+tmfjGFjEIDigvtP0+vbMOtGj
         FFbA==
X-Forwarded-Encrypted: i=1; AKwUvBwR/fWqajteouGLm6cJ2/VeZafPba1R5upfVFzG8qFNG+gN2qaSRvKYAPGtGzlTuAdQo1S+9UjFFNQ5b7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHqRft2BkhwqA681HcZkkb9/8PHQf6vaCVqeQamnpKRjv++1mW
	t0fRouDptidax008U/BcqDk/crstlWXKQq0OLcL0YVko7HuAhG4uGFdiHArDKQv+rxIdTjS0iPf
	jyVFMcvcWFBcbyvPmW6jekXIYbNOEEPfkSuaEFHyeR7Rglr71+nwpWQcCoMM9Tt4KMdo=
X-Gm-Gg: AYBFou2aoq5+QJl8jah9kt1EVC3btBcecudmkD0ZX2D0ZItODQ+9HZQJ47BpBFclwa8
	i2JCzAZO0lmXhaIpT5idGVycaCGrSyyDkC+VddLj1TcgHvx12X76smlmw4d3MbbSEakurgoU5oD
	LV+i68NKPfkMI1KcRPYx98eRkc/q5YPRI1h0kmKQGgObpmt/lw6ThqXTlvVbjzCWwtKPBUb6HOR
	AVVIX6mAlpPIpoFIFChokvtqy/B90HbnACyJDcl/TC4fBmIov9/fyzfSwkxBWxq35OKIaek52kr
	44EuU65OjMgXAMetY5/I8XbB/bnYY+BGB4NlyAuZJyfSQhnwShQtU6j627Fc0g+NyFn8aIMqFys
	2j461AGoItDWsopt2/kIXvhwm1Ru9aefgAg==
X-Received: by 2002:a17:90b:1c0a:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3a8719cc85fmr937614a91.0.1791285260996;
        Tue, 06 Oct 2026 04:14:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3a8719cc85fmr937593a91.0.1791285260472;
        Tue, 06 Oct 2026 04:14:20 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:19 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Shikra: Fix qce configuration
Date: Tue, 06 Oct 2026 16:44:02 +0530
Message-Id: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrXxGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMz3eKMzOyixPjC5NT4tMwKXSNzgyRzY1MTc8vEFCWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tAKFsiSZyAAAA
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX22TJPPsbeZYN
 oRQGnNuAX1O8SbgvctjiQqGepaS5SyjJWr7OiUQ7YnculLzLqAbHajmEjouNnbgu0QlTlpcpcVy
 7em1hI/4ru/HXATqwvJdvSwiof1oiW4=
X-Authority-Analysis: v=2.4 cv=Ho/jiETS c=1 sm=1 tr=0 ts=6ac4d80d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0oWdxScfMXRn80FIiJQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX0Ow9oB9z0ycg
 Vu2UrJ6MT/vppSfhGAp+5eEB1S2LOPFfLowrePLLn2KuMiX+QNTMVLLz1TN5kZAZeDUAJtwXkyS
 a66dF1KGmIRgL9rxpc+tLssQvCj+jxFmw9ucuXdtR2V6tu0iK053YX0DlH+HunbFs1tEGhIPoc1
 sPYzFJCEFqku40xr/Ve/2boWFMAsh14IL/Ao0c+i3/zaQlJC5DlQNufJPh+TYNIRdQx8GnRYCet
 ZtmISg6S3dbxdf5AmLcXQenoqDqm2jVsiTsJll5t3MKNrlFv/BQEOHuXsjIu1yHThJ3/XcblCKJ
 Pf5EiJ/PtM6H/OPgyO06qAtoS98iNKkbJXeK+Y5XEanzxFbd/+rznoPebApAJxxt6DZg4s+y/Kk
 tW78Hv7M6/G9eALLTqw+8WqEXAsGSMnjCYXsxatPxd+S0IzheKPGGeZmA4vjncoYJcClW74LIiN
 0KD7NoZqPgfgc73eo/Q==
X-Proofpoint-ORIG-GUID: UCcZaALy8UO3Gz6qkMfJ6-8h9yTU-XmU
X-Proofpoint-GUID: UCcZaALy8UO3Gz6qkMfJ6-8h9yTU-XmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

This patch series fixes QCE on Shikra.
Shikra is derived from agatti target and QCE was using different
compatible configuration.
Also, one more reason to update QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

The current qce configuration will still work but this one is more
appropriately describing the hardware.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

The previous patch-seriest[1] was sent to an older thread and with feedback
received, submitting a new series.

[1] https://lore.kernel.org/lkml/20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: Adjust Shikra compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

