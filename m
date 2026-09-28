Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406894DE71F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607105; cv=none; b=c8AoAUNcXpW/n14wtifEGuZP9WzRtEqjxGBuRpin4k8FNfaGxSFJix7sZq9jcxmUzYHg7yT5CqjLFymgfDFcEMWayWGExsBrkSZ9/jbsxG+GUW0EdZHfEwsm4oOchH0kegHh32/4Iavs9u7VPDzVIfJMxzU3jYm4+HRmUTbz8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607105; c=relaxed/simple;
	bh=VHh9BvaOe14A405lLmF3EkfjMXNDD6EjGQjTA5nafkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfrysI43YuxVQvrUYwW9GrNkLsCnfWHD2WxOSdUsk9Z3bMB/XFonLgrQZYXPzXacaYCssN6OwjPaGsrfFjS4guRMHB72d6mtDWtipOBvxgvj0da4ePTkQ0V1p56Ykcc9dxhkaVkFOp8weZDYvK/G+GiJX4sxeMUq861MfzzUBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjB2xNLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmWxSuRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjB2xNLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmWxSuRQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdveq2755812
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmhFpeTSl3y
	9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=; b=OjB2xNLT3Vvmx41LEuBZ4RS1fMg
	iOxCiI77/a2CG0vdIQ28rTFdXWsa6FV01kowJEY3qK5gqGQQTikzSC4JwKISSAtT
	OFCrfT0dOre0nAkFQFt6IGATjjO85Q7/sZhltGs6LwEDX/z+ZimYlEXRZASCD2He
	Nu8Ol6Hby7j/Dq8pftzsIdv1G89Lt8q1BoPXfW85MPVXOYu22qHx0GhSQyJfdS+Y
	aoBxxWPire03NyEQnLoRIaHTPl8b9J5dAoyNw/iJCGADk2JGpGD5gkh4o6RSIz0B
	BOTduHVBop3B5q9CvzICVQXKzaLWKEIB2AgQmw1Fz06j4ycemUkPvSq+eqQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubj393-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-986e5cae3a9so1712241241.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607102; x=1791211902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=FmWxSuRQu3+3EFHV3nPgcegeZ2XAq/wEMMu8MTxAarrZizwCe9Q/U9uOyFihkWYRTc
         tgDno6qWIDgyNducGIGvdNc10V3b/7uZRpJVLRFqz8YPb4zDi1BaoCrfI8otvcySa2Gz
         hMVE/iBoh8HZOpYV5BSkFiXuVpVSSIFPAVfnjaETHqaBjo75vIZVj9PMXHahld7rUdJ8
         EXzZTZenljJ4qihjQ9V+ym/8QuBQ6Oz8ZtcAkU8EDLc3C+RenuJBspbElUpPyFuqVqxe
         rOgUk8JlOi/X5EoYdezV+nEy3Eud8HN9a7XA+nnTwXGcoPsMb5Ac5I76aQb1PWX+qFcZ
         Jzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607102; x=1791211902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=ZTrMHJSGROszO0L6dH9U4+6mfFY19bbXMEATEMKq8Lk7hRft0QSQYaByIduk6MMlRG
         f9VJR0lvSJISPGCFJyi/z0Gk9hdnaBd3pthM8wxa+si0S2POS4IsFzmvZtAdz24W3Yby
         pADXfOEox3dJQkEsLk2PZDiPxXXZGE8Oqi/vI1HPvqHDhob7DTxWfT3XGt55eblzpoD4
         7TqCKIIkNFWeD2dkcui4Z3SscX3EKk/Sl2nv85Ae9lnCQWPLyLDh3ajQDOXqbeUS2U4c
         lzUwOikHlt7fkFoLtUdhJAO2uT83Mt3uSMs+ojznKG+cbg9wb9i+0sfZaa3h1RNQyzsd
         RCgA==
X-Forwarded-Encrypted: i=1; AKwUvBx/igwXo1tsimkO+AOAHScr2k9wYubgJo8N+5yyB6YWn/jfApSYHyvWKvPreKswJcvtczcwavHQllbZJdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr9eLu9/E59yP9NVvc5jMysXavzNHQrYC8z5Xpoy6qxibJNiXA
	VRQY37emYyMXzMKxJVZrmigu0kqbOmcdr1LZHjdMaQqcavphJI2bRr5iOPYfPbnrWf7EVM3iu2C
	eVHq25NARR+1Hk9k/3lt+pciCPIEe8+Ov23a8Yo1EkigEMHYGOil6VhVkVLyOx1keJ00=
X-Gm-Gg: AYBFou0R46DYUpT81HcyEmuCwNNIPcE5ubwR1e9MBK7FloxTw0Oy7MOhjtUDOcv5lN2
	wCKqGp3xUfL1uBvO7SdQ0sbvr9w8yNb7pi1xA52MU5m38Lfg4z0WH9rKUVlSyKUT9g/nBEOzszB
	DeB+noA7zHSct1X+yu5idY7CZfmLjuAftFLztqu7R7kDC3d/NFPN3K3taT+2cCpQ7OjzbLytB6n
	LG3uk83fyeVPK2pjTAJ6ThpTrT6I7xkCOFNsJojgOGzuxRX7ClCZNd6TuPccRO8OCCB5uCK3ly2
	iyxQN2hbhnp7dqQyMLKAwIF8abJA5rD0YtwWot95Koz0wJtVAhKrRG/Z2fIvr6AGxiNP1rwyiYe
	epIpWNO8BaipU
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911101137.25.1790607101818;
        Mon, 28 Sep 2026 07:51:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911073137.25.1790607100373;
        Mon, 28 Sep 2026 07:51:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Mon, 28 Sep 2026 15:51:20 +0100
Message-ID: <20260928145122.1337186-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GnWZcnmnLIX6u42mU7pwb7xFjUnqIei2
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba7eff cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: GnWZcnmnLIX6u42mU7pwb7xFjUnqIei2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX9Ebnzya0q3/0
 ro9tgRi0fn10Fxhv1z8K+zPMa98jP0WhMpYWpkZzN1B8mlSKcxoMown2/rDPSjDDmMvscoLyceh
 lD0xjewt/bQhuTRsyzncI8ArK7oLBZ6u56I4u0ZjZMcxdbY9CjPBHSIMC0nI8tfwK6WhAOgQ5s9
 uxGx4FC9CYiuKhy+CquzQrk+nTVukxUsW/jNyx/OylmQ1uoa1WoLwSq8Qb2N70fAvKF1r11Y4d/
 67+O6ByWA5kTYbWueYDt/SfWDuEocQHnX41rp4emaDSg146O2f0ac5udtCEzEbbPAhwucqtcu8e
 XMKbgDq36+tZ4+QcrH4mhznBRl33nk/w4YBvKZEAWelYoYhajQp7TlvXTopkakltEgRwJESy1dA
 yBoyQ1FA7WVf0drxdjzwMmt223vdFJQ1nhRetrc2hX6uVN1ZA+tEdX9hPGnG64LEhwi7oHMFxkY
 iS5VM+8r/Fjd8XIwiHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX6OU6xVAQfDCR
 oDOu2BhbvifQxkf3y+r+0woz5y/T/7lWkdRXXOqGBb9W2zmve0KfpXB4A5JZhm2gL4s7WN9husT
 N7j9af25y46HgqqplY/9cJN7cXhB6vk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280059

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18a13b4a460f..de4647501085 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

