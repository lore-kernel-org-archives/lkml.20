Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FF417BC3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032527; cv=none; b=eQDbL6HoabZdbk/HbX1BenoIIl0m/k79MehlGYd0tXH2aOuC4+hjWDNR8kN0NPsVRRjUj9eycFESq/tUdrUbUNn2Lf8Egg7g5fX/QUEs6ogLC2mAiIGC38cZAhB6tEBk+jp+RnY4kXopKv19ns+CeSZmg52hDHr2Vc0gtwGXXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032527; c=relaxed/simple;
	bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nxQ2I5B02qSYT6BoATBcww9Q9QTQVhua9HUEZa6XaVI5dOIfsBo5bP4RRIFqQDG9EtzeE41kHwIMLIyU1Bp0FXvlwCipJuZ/8rtFiglxHk8/pe7DHpaX34m6Wh2OQXgUuv6RnYFDTDfyhh+f24m34aQ53HBRfdYWohqKSx6KwgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeU391y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeB4gmKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeU391y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeB4gmKq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwuEc2300906
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo
	3E/nh92M=; b=WeU391y3EN2EAeWizyqkPS9VYRMrMaNbiAj1iZtZQ8YwMfV6c+g
	tmWEAHFuozPD53FpbZrgWQZ5R9Zkrr4Aa1gtPEbnNSuLuScG7MQtnYnRjJavOaOf
	haOqeJdQCWRelvArqRENAKjM/6+DMPEi89oPoqLxWIf9SLzNupzGSOpVeF/rcStZ
	hf/EYrqJM1O5XcLILqDeZHPHjtGrKKNz+kcioyAqGUWN38e5xQYSNSuEiI9H9O8o
	Cl6P1HsI7idBTp0cl68SJdbHTy23TjxkTAjHrpkEfa/MwobotvqRlWhLhqsxCQ2V
	B0a8mk2eeF7Bgq3Chi04iLHOpERke/5Do+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb1pfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:42:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f52ccd459so32142021cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032520; x=1788637320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=LeB4gmKq7RGUItZafNlj9P1ZtrEXnix+8FdsEqGiIClPcz3PaAB/p5RNp/tgSzXnM9
         Bq7z08oQYTJgAOPorKFo+eVCCdPPnMocFzKkN7EA3h3pkGs00oE6bd/g6gdorUEbBBFz
         WuKNJqrrVthGJirL53EWT1zRxe79R5/8acOTnaaaZBB0EWd7WzqFGMkh7nzftLX9l6Ru
         3nutiWiHaA+OjvppVpgFoS3Xt1A9EryQ99CKg2hHB1nT2yVRovyEkQMl2+yLfo1AHZrg
         S+ZHgH3lvqPBczKDiOwPpiOXTlLzrv4UjZ+27kCJscwbW0dQQU6GlskPnL542WVUhq/S
         99PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032520; x=1788637320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=PYz1eTAtomFKthR5Yt5S1Qbe/nAKRjeyykBBrbIWy1AqZsspw8VseiIXQcfGYW4Om7
         fGAnQDAZib88PMxHM52qdFyGdVW4mCqtKgl4I2W34gne2YYjXyppyAZ4X+XfyTozmWR+
         LZsCDdgsHNpcpculThRCGPLmrczRSWrwGEFBrh1pkkLfdOG2Nd1pNbTPyHD4wwEyE6Hi
         SwsBBokCbGOWzfHF+UgNNjveQbgYw4c7HbkFpWD9GupCjHLVLfM62MobM8AVsCn/OcPM
         ygjGVpgm0o+2O3mXTcbkp8wAv6JhbAWr9kY4v3+cjZeCmruV1GdXGF342Uw7fIXN/dEG
         5Mmw==
X-Forwarded-Encrypted: i=1; AHgh+RrFLUPyfNeQvZOmt/bQDSqbS9FY+cjYWX8fK+QrtWgRhkAIWUW/9jdp1gwY7sUxFVjTnYlTIDJjSCBG444=@vger.kernel.org
X-Gm-Message-State: AFuF++n+OvDk6FbI81bb1/jbdM8ZCoXZ+0qLFRE6uq1/mR+4kVuD9Qif
	xNNxDMzFVJU9boDIFXiXellhZoA0SDTngV0gnvLFER/eM6UvSwgG78RGl0DDb6ZT6RAsy8oN7Vh
	3KeHvelRAUVEHndE11Lm+iKOIL2OIKq11Vaj7LKLpa4yLbqcdsOSC7qhFW3GfOhr6sj0=
X-Gm-Gg: AR+sD139J28qUzNX3ygoGCktN9B6cZ2CMCxXy9qsOc76IijKWPqOJ/c30FUQOqZ3uE0
	cGXFmTx8Et8IyfgKLfQBAG4PGsnP/7VvJmPzqKMCc7ZfpYHzHIX1ujoNZrCJ9DQAB3M2+e4TXxt
	PwEExDQNIARL96zyk9oj349q4lQ5PkOUCE3K36MENfFUC/ZS+aa9YLccWPL84oih5arLsynmTw6
	oSFVOrGqdGtFLQA30WQXglYkQUmACUBuBUAdc90kvagQT7vve8hharjE8Tybzk/5iqDmO5LoOC6
	OjqRgFCGhg3ilixlK+6uG7kvELRKSEflullPty10UwBqF46y9YzT3D8ApJwg9q3JJyF6Dx6Id1T
	pf3E5O4OjsQCCS7g=
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668481cf.20.1788032520081;
        Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668181cf.20.1788032519645;
        Sat, 29 Aug 2026 12:41:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm109116615e9.5.2026.08.29.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:41:55 +0200
Message-ID: <20260829194154.108191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYDrucOEqKbgwzMI9GFk+bfUoET/OAaI0FuE
 1AwPwDyxwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2AwAKCRDBN2bmhouD
 1yTxD/wKCcZV032FBhJ4DJlVj52zDbEY6vtEQN1S4V9nAb0+kVofU2g7A6V3jNORq72dYl2DOJn
 3PSXvU01Q9j8UAWFG3w/tsec32sPcJCr6jSq9KH3RZwujUqV9JQGgnNLCrblhLe/D7/FLiQqMxM
 sRgXNWFUza8+56/+Yp4tz2nkkkbN4Urx00SaVxdeu+CBAtB4GsE4vtDdx8OJ/B6mt4/jvJ3b2cU
 RVYz7quvNf8Jq1bI7a9Tx7l6SfFrJ8kspS+K6VboYo58UAtxsQ8r+dnuYMf+jrC9Hqk18QiSqnM
 l8FfbDE9EmNt0wh5uTsD/k/KgwBNzMW574Pkbg8bREwntzgSl2+jtxFA3jC3KGDSWH8bm4Du+iv
 TiLa3FDw1UIVExBtxTv1WtmQ/dKUF9dy5rTZPnjzYRp0iqottMCyK45pGv4bRMnC4/f+/gihsZY
 M/0h4BeZzJWe5K1kHF1mHXYU93Ag2u+stShAyjLkfKjgoI6G1q/Juv23mTiv+6sQhZggHSp4Osh
 v7skbiV9MZZV0SeAxhHo1dzNLKHcazp1GIE6JLgCXo45NdxiCxx9sOLfeCPR0M+ejE485U6c467
 RqEfFbtJcuaro89VgPDDLEN9V0zZNFkX6PDHCpREw+5GyKf8VoS1XbxECY9aVh/kbQQFHP4jOfM jHVBKmsQ9gUpG0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX/zdBaVE8cwws
 JWjjkXAHG7RIieTKvwSFcj56E2te18XmH1h+zWys77gj3NybB7oQrQJzuXnLCiLOQHjUSfCQIYG
 ooJKWJGpMkPZ/DQy4AH6G1fCi1LfrPJ9SyLE9+ZpZXkMycG/YAsc0zNJA/UlHZS4OXRZkyQVkTo
 lwuxINjsH0oETiUEdyn+rPBZl6KSFV5ZlKFa+CeA2Z+kutv/3MNJQ4axJHmw9H2lTBiYUOnotbL
 BvMKPlJvUyDeIZ4e+i16IlY9sTxYWC7kYskq8pgsNx9CFIFecZWAp81GL7najtJ/UQpjdcMDoC7
 EGahQnLowxaZ0DnD6o5ckUkxO6GEEfH83U3DUM/fvjRrH/u5fc74CJX3lIe5HwYgWsVm0YAH23s
 p0G1Kg3IbGeRGR1f7frFvqKZXw2COo4v+uZlJ42pvw/QxlHNgy1AZkEHNgU9PM6LQ3F7bWV8taa
 YHwOUlIhnhqXpydhaDA==
X-Proofpoint-ORIG-GUID: q2sHyQgw9bSccUXvMFPyGLkv8XjpbvV-
X-Proofpoint-GUID: q2sHyQgw9bSccUXvMFPyGLkv8XjpbvV-
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a933608 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX7BdaWGenVn6k
 HTIyZn1UKnAsIrVSh23fnUJOMGrj1H9kJOMHuxiR6tghCzhM/gxulbUtF3CIN6NW048zfPEqRX+
 B0vUkrF5UOzcAM9/w5Wtxk9gvnLeFqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0

