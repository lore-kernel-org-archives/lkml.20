Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40042F6FD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121974; cv=none; b=XtesG2HVpDIel94ZlptoYjLS2pQeWKb4wpJ+2LK+ti72yIIyHvhXjPrbHGaXIIh38KHXTDiu14H/2kYEMGZfolB2M/YvbHZaWSsrxVDV5EKqHkmbqivlAho37qiN/DzvYm2jkvq+8ltid2ynmvnKNcGv4zO75XwngkYzyjAVwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121974; c=relaxed/simple;
	bh=3l/uI9OLyqRLWrTfCZNHNfE6QewbrNbl0gZSzNJVuUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K7mD/A8KwygNx5TKEE090/x4joUh8ZPt/xWFaMRFtxjsNVVIi+w12rRWoNRT7/LspRjgBjT2xfZnfXy3JyMybPAz6ekGhtBfIVHXwTLZN62eJ/cq2ULSvWCNMZ2zQO4CKu2AhWqjBerF/24dkTjIgIDuWEkuSdWbXYBRvxC98Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcbZadmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwXa7Cy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcbZadmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwXa7Cy0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqB83464050
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R0/zG07kT3QtxUbuc9FfqQ
	PsCy5wzyWfyugpD7RCpLo=; b=YcbZadmXsXRNqDu07utYr1TZ1lA2cW93AA0GNn
	iMI9d1WITg8+hYOpP7aeubNQVn0GQylKYppz4tBlla924JWC4+7hLDI/1jaZTKiO
	Pl6VOHPAXhY2ZVXBm/X+1So08jjYO2NL1CUMT45OHCvA9RxAnq4HMBbdCrNWc+7k
	xbFeW2HFpiVQhpE2EZ+0AGmJKnTnHRtMICCEnsU5FC3feIBzJbIzp2vHDqZq9Dt4
	khRJUmOpl3QcShy3maqhOmyD9GZ0jJsDXrZ9UE7MUyb+thrTMmZmSrZKVRATR44N
	ApFfbK9S7KraWIO90F3cMLhYa01s6lQR0RJ1SxFbK5eDXtIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr955x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso140628385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121971; x=1789726771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=SwXa7Cy0XaS5s/WY+MxIidPgC4a+iZQlWI+6YKPg0Jy2wxxrwfereI53Iz0Uxgqmka
         SMIwUsmZZC7pR/iQdM+DmKnmGXPwvvtRCqFczhCzDCDAxhzVd9a5suvqM3NUGQrYmlBF
         fxt+Z8f/xzlNp46Tl7/Vx6CCKj2OQfxSi2y/1+Fs+EHgqIS16/k8DPYnS2QVWYib/3uh
         IW6/3PHDFlt6nYrB/LhErvffQsXSzHgiPJSIAPHHdFMlEAlOrf+XQRnizsIwF6cU4ajG
         9r4fU1vEALcUirgX/9bP9Ls7hJt3eg1GjAAmXKz4jt3Ww4JQcJPNr5BEWOndfuUmhtFs
         wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121971; x=1789726771;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=E03d0JDlR2uU7FZtB6bMDJHTJL/rsO1im9t5bydgvBwXG3gyo0wpIPcJhRHJtYtcFd
         hIgJ4LKQMYq8yffoLM/Ii3fks865vcRu9tCmq1YvQKonVMph6JZ0I5vH3m7gcgWERNi9
         0GM9wVDntfTryulKRh6X0/op8U399GqFNnPrcLN59XeBx+OSp2OxGWE50BnSIbbCUUo5
         /QkQIsyF3MCchSJI6g1SYSxUE2zT7nRrrjkCHGbpM6v7EEGRqYe4klRYVEQTBnMnA2t8
         3m4zJsStsI7aauRp84007FgjqzgfKqczftoPosXrwuIQvMANeW1yiKvjrLMevY4G+C73
         ndvA==
X-Forwarded-Encrypted: i=1; AKwUvByjnbM7oWTjkaIoiAQ0QUVozHSo6ZxRnT3WvvZ2gjtXR0PtQ9YS19hghxTT0oPLF6jvDANN3zpwe3sv13Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kTuDJASHE85lwyKGOP//eLMu7kyvBlyP6rWEnVNBrREGN3sxB1
	/OgpSvFjnjlJAy0dYS5Zoixj8o2UmsVfNfTzoPDM9RZFOvXhV1PVkxY+xLvDCryeExb7jyxN7TC
	ZO6uEg7VAvPhfpKoGQvLZL8R6+qrP5GqidMrir5JbeWiOP5qh5JF5/8733E6O8jrh5Q8=
X-Gm-Gg: AYBFou3OTSKc3RPY3ywP3VacpRiO0lXX0nawDh5eG/BlwiWBEN5SRxbmedy6DnwiAMO
	vkeRlZX9Ilf8fEF/p79lcRPT9u1WRVzuMdi8hySUuOzN9yJWo0H+8+TopbFCSqPvXl3i6uzZQsd
	DZOBrYYjwzMNluMLPkHloVehLtUlr2d0Inhk3tElu2fvThIUAklg1I9cxdlbHxkN6ze6Pzy4l+f
	dtCGvoCNyu+4ALbA9l5BhE+07IJPJLQ4VtqcMW+/37eAoEo4NP9FPfq0hQ5cIRGXhTiGH/IQd6M
	VyKx1qAE/qpAFel1ttscvFlPQ6GnNE9Th/shlz2aaF+qbp88r34u18jT7wmhoV6fBdcvtPLR+jU
	EaCfC5pTByTqS7umDkr31u84=
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428011485a.26.1789121970693;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428006385a.26.1789121970317;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Fri, 11 Sep 2026 12:19:08 +0200
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtYp4j6KuKhTeKMaDaaVoSxd
 7fq8bv8/wIuWcXh1C2Q5aWukzWETQd0izYKKjfD0A/7/hgCph1ycfT49Goj0kOi1Rm9ZKWCNFl
 Rq8IofIjMiThuA7TanOWq79/pfPnba7oLlW8e1vUDf+FcxYsAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3l/uI9OLyqRLWrTfCZNHNfE6QewbrNbl0gZSzNJVuUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WkbigijgzSCRuQNSOIRr1rGuWGDT76rKNzT
 krVAAxPWjKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVpAAKCRDBN2bmhouD
 14KDD/9OZ56pJjMJxchjiHVJke89vPGIavObIaxQ+1RR7VDLzc79myeI6P4ZU0dHYhe5NSf9fLw
 gGTtFdVLbeD/nR24yar7reNktZz66JugLdx41t4Xt+3/xtfEG6KwTLAyqvXS13C1hxa+skschFK
 dH3tkdjOotbAOQv0eCBo0UBBjzHTELSs+EaUVo2dqGVXmmDTspnwlw+/Qf0NgH83W0W2E6i5rGP
 ycnHVkfwA3oktEEBcSVUAd/apH8FJsDpAuFn8/+Emix6T12POgq1XSraI6q89LOGWxxQajFputb
 IZUbdp9EV9NIdGvxrNkFrv0Vl7ZV77TxgqR1xr0O+t42oPPSoVbz41JN2PMC71SPsMJAq/3YAno
 j2mYrYNhaUuqONzgnd7AXKsGdKgd3MlVyOmi5O4F3fSk6I6XvT+fgasgnbnsgVsmfUHUT/8nRFw
 zpzQHl8s7bg03V7WhjF8n4jSZYhzMUZX0nz9ZzjTWwrf+dCYZbkz9iUNnOnD0BZvN07YnKKvsyy
 l+4y1hL7qmLG2mX48KmHS4eMyN2y/M+VC8lrfi92P3NdbJt0m0GeSQUDgXWKhMjqpKgLN5asTkQ
 xpPLfFA1ua0Lfl1ERZhKImrpqoii704bWvr643YQ7WAHHqx6YkdYHpy3hueJW6GcHgPPsFFzuYO
 NXw0hNehurw6m4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: sNkq2xIsQQl6XQAqNpo-GNKmByQ3qae2
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3d5b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qxZVzdGA1PWmyomorPcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sNkq2xIsQQl6XQAqNpo-GNKmByQ3qae2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXy0jupQR7Ahri
 k6EJR+vCeehmvvo+6eDiNkYOQigyQAOiDoVsscCHjK+uEcHwnOM5UfXhd80nG6Ae63K3fbBnwKj
 IIt53+IooL59C65cs88E2y122/gFjRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXxxgMi0lXY9by
 LKjp9MIwNjVWraklVVp53X+AkW0wcNDjaN44wGBSUe79ZmWE7hJ+oJwKP1M3U84q8oCaTGbI9Jc
 xAaZ6KUvPtLv2Fhhnjj6sZ5rfqZSGu/VCMBcP8OoUt4bGuXivt3WiIIeZB/wpC3qiOO/jREzac+
 paiXvJjv2Ma0XsKGw8F6K/iBS9psHfZdvVOVTLUrhR1RPGNjC7ktEi9qcez24Xy/a6LbG+/t/Nh
 G+neRx0j47viu6G6mSR78zgC9AHJcYa6tS0MnQJ7WiwUADsLL9rU7R5f4G/MlIlAifbg6EYxtij
 kwhNHds8xYG1WUWIsxF3pUgWHV9YRr5AGZx4rfjTuW4ldRTXQpMLdDbxtdknvAQ3B77fgVJIVyz
 z/KNZnkYlWA8Fa0GO9k3F4T8XcZkYwDe1+fUPUyCx13GkYiXknBDb/Pbe2Ldq1DMImqyp1YhMkm
 z8vhNAflFvg9IXXd2bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110143

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      arm64: dts: exynos: axis: Re-order nodes to match coding style
      arm64: dts: exynos: axis: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order nodes to match coding style
      [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
      arm64: dts: exynos2200-g0s: Re-order properties to match coding style
      arm64: dts: exynos2200: Drop redundant blank lines
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style
      arm64: dts: exynos7870: Re-order properties to match coding style

 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
 15 files changed, 421 insertions(+), 412 deletions(-)
---
base-commit: e224ecb509d7a636a89bebab8d47239f83294448
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

