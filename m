Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6545372DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080771; cv=none; b=o7GYIuuw0YM6OrGE/pg5UBQzFNVVDAjaQi474Tp9ViTw4lc+IcxL3+iUcGLC14lv8y1SQEz1Qoo/V1hgNyON0B04QQ5oij8uDQG3Fg/rS2lev0slmJhoJ2UeONETyE8PaD6jSHryZkgHgfgC+SwXNH5yz7REDr8pyvUlW8uRg0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080771; c=relaxed/simple;
	bh=G1rCVG0dFYgkD70jsqhOgIwiWXW8VEW9SvwYy5t2zgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vybnbj4o9mYHoRjGQx70fBwyaBnfr9UQGwX1fm1hlTyOu+NHWlpl9nLsmOIp2DMeH7Kgzl33cUcq9sKZKHSpA5Kc4NYzXTkTlQUfyQBgV4sWRckn7mG4DAJyfrx6LMZstfrmZf5c0WUjvgogp7qAuNFYJEPOLtB0/4q6z6WUYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFgxg8uZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCiRvG4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFgxg8uZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCiRvG4M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPIPX015297
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YH0B3GIKgdIgYq6KPJcykm
	lfsGe55OsoYn1Rw5B9E9w=; b=IFgxg8uZII+f3Sw3wUL3G4+WKHQJkEHjE8v4U2
	KTL8x3zxM5fAkUkGVQnAYb5c+PiQXu8NjH6AQ+qvYHDeClTmAfiFr1Uegxel8FKu
	jhpWfIW7zLLeF2wVElfoO0+k4NDjzmmVUb8Xt5MtnxIkDc6KOzo34IFPxlpTTP09
	lAKHBt1ClS3cjRyB6ExlTcNnOjEap7tz/jt8dFG27Ecd9lknLmdAs4eUyB36tcMA
	1P/vhwH4G43YXMNwIATS8Ch5hkPfa47vNMDQdC4le7okD6UqD+KPEx8ohtpeq4E+
	P7X59MS3QN/A+WB1rkAEdd5Rjd4ztzwqEzEmDnu/TAeWdU7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjys61x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:39:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd1631d291so49864435ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790080768; x=1790685568; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YH0B3GIKgdIgYq6KPJcykmlfsGe55OsoYn1Rw5B9E9w=;
        b=KCiRvG4MIFxB97ndlcrLoEcRMQYgO3jDcp9sLs+4/EmXR3iQf2C/JbiL+96sp+KBPC
         FxEgfqOFYmVxbSrsG/7lhGtJzcVqAcWs7m9mnW++yvIh3w7TW3nzqsRy+giczC6z0G/C
         /lcjOppqJpCygP0RdQQMMU4uy+GbfrWtF5Zf2N4e0Pe7VIpX/+Ybu4SSsfnJlzkZQv7s
         dulQf5EkNBghPMmTT9g5nnQ0kI0GD7AKKZeuMKGw2+YpenYSuuVTdecojCtpA3qbK78z
         n+vTDNpkSu7aarQg0egzanBMtQ/31AUoYAcFvcmLJpRdI5KXTBFKBKCLWy3647IZOikF
         x+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080768; x=1790685568;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YH0B3GIKgdIgYq6KPJcykmlfsGe55OsoYn1Rw5B9E9w=;
        b=L3ZN7yo6iZGHjBjENPNlRPhC+DTmT38Cv3fYHVH876K3PGP9z4UWs/HM6Rc8dnxFcV
         /qkZFbFqnCY4LzVpT8iScGKkIDkR0TJzrsJOmRhrZp9cSt1wcag787PYIk8VGHDQHEMS
         yGBG/9zw/D9M5hSvhXpj9dvzLE0oX2m8unzCOeHEiGCdxTvoKovlm5zj1MjnbAhF3y4a
         yADqoD5IrSDMfibm3lxf/9q6D0HgsXfKb7ZNc1TS1zu03muZTEBfXThnDUPt9WnbTCr7
         XXAMRvmV4aKSBsQzALzzJnVa4cTeET7CmgHPWwrpJheQdQy/+tUdaekvypv9eRqV2whg
         5uOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDLCbkduXIChMYuOxH6cxYrROSGHHHpzqMDE/jf53f+HFGpIvWOnqwf8pUjmaCPcbgvWKm9Qc8BtWywa8=@vger.kernel.org
X-Gm-Message-State: AFuF++l+MiKHFTAmlpAchPIS8Dn3AsuuTTkE91mUfFxVoZMO7VFE5E8j
	RjDx1NxLSy9JeYEVtjbzMOGSZIsp8YtNPplJ8dn6cRu9W1QCsgi9d65IAGaWqfnGdw73P6Oe+ve
	/C/sqCM4gycwsJReT6m+e1mBQ7rqC+JxdFxwwyy+wDagSeV1aovzm0NHYw5GGK/pIQw==
X-Gm-Gg: AYBFou0gqNYa8w5bqkh/YKVB0Q1pQD/nJ4u8wJmFLwpC4XYHaNXJdsve7m3ySdxmQvs
	ixbhkNFAOTpdneOqAnSrchYRvm99FRA+d55K0H0KwCk1fHZzLYCGmRTiB//VAzICN417FEgMMSH
	2JQaGBfgwEgkX5HS4SNw6OauHVsAZ+0+mybSgJfXPtV/WXZE5D6LXwHcPJqHRGf5gsdAyVjH4FQ
	MnmTHIdj8GhnqVFnwaRzbY/myxP0pK/v92wHW0FGnHSTCg7g0JQgdAxPikn0XVsGqj5YU6Os1K7
	0uBPwQxqXa2IrjncHX2FUZZVk+vpAllyqzp/N+sss9KPIsr9L5AwKXpF2GXXXEu6Nq+gH4r0sdf
	aJ9gnLuXPk5BWMCMXbbI5N2cQGlpd
X-Received: by 2002:a17:903:1aa4:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df60b3c1afmr12055495ad.39.1790080767984;
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
X-Received: by 2002:a17:903:1aa4:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df60b3c1afmr12055185ad.39.1790080767496;
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308ccsm9265805ad.42.2026.09.22.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:09:15 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPJ2smoC/yXM7QpAMBTG8VvR+Ww1U5hbkcR2cOStDa2Wezd8/
 PX0/D1YNIQWysiDwYssbWtAEkegxnYdkJEOBsFFxqUQrCfXzAlvltYxlaeSa5SFzlMIj91gmL9
 aVf+2ZzehOt4E3PcDoZbBcW8AAAA=
X-Change-ID: 20260922-fix_l10_max-c7390de98d73
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790080763; l=950;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=G1rCVG0dFYgkD70jsqhOgIwiWXW8VEW9SvwYy5t2zgI=;
 b=Fej1M6tLTP1ii0ZqzqmzwzgOIz8MDdbliCWGtJeUsmfjqC7G5AHeik9ihRMv+a2bN0u/ks/fO
 lKvlNlix5tEAgh7fhY9dXaqwI6+nF9EP5oUZX7SuriIvOS5pzdN9ATu
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 9BD7YWM0ZOXTqQsQc9ZzvxdlVAxt6Hra
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab27701 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=giemrxp5VU2KOmXfWaEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX1/fMpBwjSKD8
 5zTG+WiSixVbLR+z1nLEEJOD/tOp6C5GN/+DgpNTn8jAip8/vXK7rH5ciMU5aY4bIA9bIFEEK0Q
 pGtOAqDT0s7TQqKeoiTeB3wu5f6F4c4cxLWQz0F+rheW14JF06aA5TzhVzujFOKIoVE51LW9bAS
 4+TjC5nEEFmdOejSV0gZSGWK0ysgaqlp0dU0RsaZvdoSLYEU02vvS/IsmI5UcgQ6fQrQbruUeyY
 mDceQyqskfUBLXZAZJUEdY3hpyt+xETxEPzXI0ZfZxz+HA7UKFlF/y17vrItxVHdGCuNvSpKSdU
 YgG+a65T4hOeaW44ptOk62z5lApORhCBg9shM3fX1rzWcUlihNlPCGsI3Yj3SWAYxroTvqL+cQL
 j7IQBtwZahrAZ7NFxwIjloi6J0JD5595EC3VwPWmjqMLAq6ofauMZyZdtglBk/ouDWFB4v6HUvd
 e2uz+wM4cmt0sTDEgCg==
X-Proofpoint-ORIG-GUID: 9BD7YWM0ZOXTqQsQc9ZzvxdlVAxt6Hra
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX8G7F20Ph59uH
 uyppwXt+m2brbZsiBgPlcsTe6cYgOet+bUwLzqx0OR3oozjekgLu2LXVK9CoxyV9k7NyWgimGA1
 fzVxxycSwx8q/n0BuwbrB6Ac+ooV3Ho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220184

Update the PM8150 L10 regulator maximum voltage from 3.544 V to
3.3 V, matching the supported voltage range for the Shikra IQS SoM.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e58..ba8c93f01546 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -172,7 +172,7 @@ pm8150_l9: l9 {
 
 		pm8150_l10: l10 {
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <3300000>;
 		};
 
 		pm8150_l11: l11 {

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-fix_l10_max-c7390de98d73

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

