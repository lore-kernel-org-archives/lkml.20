Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650639B4AF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326427; cv=none; b=ekSloJuvZePM0549dOHVhHKIGJfdPhZsZrUtO9jgk/sfDYbTBdfmlEd833o8Fi586Gp+GeXZahqpdYHl0dXT5gZdn/qoscRNN2IOh7xj3sBnbarU99b8/3xpvgkVQBer6A44grNtVit6MvlkrWTNnIduYRxBiOPPH/hJzQKT5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326427; c=relaxed/simple;
	bh=TfE1HXDmuMQX5LOFZmUlH2YF3CEUyGNIm/P5CWo2OHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khmD3lWd4parxbOTKe5XXnY+XMEXNDmxqg+ExWtizlkprOam8/+W/ukgyBtsbaR7NOzHCmWpb2kYkKTZx1m8bWCo2klCt+aoov0jF4jb2FStsdSHyj3smqWqO4h7lKOfZTrdH7bylfOEgMDL4iYHfzr/Zy3/eJTNHxmlZyj5NNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8CvO56Z reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8CvO56Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LebU52389677
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4NhWmEecye
	fJPvH2GfE/phtWfDyt95THJZwcognhfg=; b=H8CvO56Z3xw8BpkvkSlN5gFeOYZ
	dM2P5M2sbMz1Uu7IZxZAByJ/S81glJwcxJzXjA64Udb3pHadz+wuryyKjG7DHcmc
	5BF/eLybbzWxgZc8cJUG85S879PO2GANWN3TMkjrshCSEo6QiCs9Zw8PJkmiA+/B
	lAuCo4gu7SEcazVEHnIcSq3f7YPRwBrmNfDURFIR6ONdSeOgS2bEZbSKBD54LgjV
	map7Jm3DAOZvxarUWcdtG7I8vivSJu02teGsH27NfZcIi8Xufe9uyVeX+Ht2ms46
	iLIUh6tFg0tkty3np1ytqHrXG3ReYybG6YIryMG/p965Pn+ZX5iaiUwnqUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso658227185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326422; x=1791931222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4NhWmEecyefJPvH2GfE/phtWfDyt95THJZwcognhfg=;
        b=tHnOU6UcyQzQmdDKet+bLy6Z4cmLoszF62AoXwGN79T1s4TcvweL7oLUnwbzm2fkih
         VrwRaI221zZ2dRGjdMZUygfBOAq1Vt4qAJ24264gADg5giQJEYtf/Vy3swNCtx/60v5Q
         aKhGDKEfZT9jG2iW9CXEssE+z63txDZAIJelteKGZGi+dXp5EZdzyxfRhQeUrdku7BXQ
         nLqFCKz3KUfJrsYIm9weBNk5iJ+LeykPoejUBMZFWr2fQ+g0EBwws07/LQGPSBH6vgvO
         fGM3xVNmXdj/mLZf0+sXf8TtJO3QktPBBM5kH3MXol0ue1XrKrg8ESTrmEKfgFjHD0w8
         Vgmg==
X-Forwarded-Encrypted: i=1; AKwUvBxOhDp7fJRpy+J19olhJpSatqwdJYDYkseMl4B6dsdb3PL4Wuo2GGIxrCl/H0g9P7GvST48tkkGo+zrlXs=@vger.kernel.org
X-Gm-Message-State: AFuF++m0B0QhtMlIIuDQqECTwJTPeYm+BBb8fZjiUlS+nFkq/hjoaSRy
	uoHTWQEdfY4UFe5CdAzmrkATcOfeNnxecE0VszYSJye2ki07Kq0MBHHSWgkTyBt+pZxaVDC8Y49
	X9tQcS0ZgqHyctADY7k7l7kWT3aMvGgv1w2TEm3vdBHkABQB3RYjM4TkrVBItPk948y4=
X-Gm-Gg: AYBFou1bzlxUlTwf0vP/473M/nRnpijw8GRSsPn4WGvLm9l1jZ7+AqguokcYlSE/4vy
	3X1yJ782Jqmkr5actUTKhgzjPgNaUq9Ei0Q5TBfAL68H2346D84D/4ikr0IxuhO+u7n7+UL7ijF
	ZsO5suLttmNtlfe0P9pFbvTgqGiPeU6A01gF3vpMWOpmk8AnQg9zbg0n0MWN7BHVlod4ZIbkhpR
	CJoTrgH3WUguaMxqAVUVOIduVa21py3OiAh3OPdzT6DnNwP2ul+08IrI74C/WGTMmThHkkFN+sg
	BcuMSmf6i8qTyOarUrencV2PO3UjZQ8R10n0Jx1Xj9/Zjr1HtuEC44kCDsw=
X-Received: by 2002:a05:620a:270d:b0:93a:83d:1d0e with SMTP id af79cd13be357-93e9b7b9108mr73777585a.38.1791326422070;
        Tue, 06 Oct 2026 15:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93a:83d:1d0e with SMTP id af79cd13be357-93e9b7b9108mr73774685a.38.1791326421653;
        Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:12 +0300
Message-Id: <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac578d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=Wj6AohW_YgefuVwW1yUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8DMfh7JeSpIEJFG59R-0pjv2-IxODcbK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/+k1AzEShemh
 dCrtTbJgilJyckrdJjPDorfPLEd/6WBpZbuK5OuvoEpphQc6vUOLyGFTxzFtXz5F0AuBBQrL38M
 GVtwzAIEXFfhprzQYXIv0UWfhM3989A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6mBJbiSVTPzy
 qTi+mWRL8rhGUX3xcvG6+gfaNkkpwyIMjux4KhAqbHwAgdCvBAYkK9ffSDnizZvhMQ1sloEUi4X
 9eZ2OqBi6OgE0gkoKYpoigaqsDLi3SZ/GUstWmoLTUquYM9pjEBkpU1Jza6wUUO5O09R5/Gc7aE
 +iUWX31YOjtKsjjSu+v2q9AlqPfp3pNvq+I4a4NAUK1QMdkeekudJlkzQ2zuzxIQxwVi4uqtvTh
 L7fmC4MCky+4wpOpPUB92u+iPCBSw/cuPBRpN13TJsr13AzsyGA1X1+NVEwYbI13oqmHweP/4yp
 kmweMXESSWKkTx/5dWUrXCHV/V+OAparJ0eYe1WeROa5rS6MnYcC+++1jSV2jiIltLB8uFi0vZU
 n2RUK6cLy//N03Uo/cAHgjVXfB721uywaRlfLTTvQcalGyeQE4Ludh7gTCHnbyL7sxR075PhnUc
 X9DLRiR+tINOY13xHLw==
X-Proofpoint-ORIG-GUID: 8DMfh7JeSpIEJFG59R-0pjv2-IxODcbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document the qcom,sm8250pix-camss compatible for CAMSS configurations
that use the IFE pixel path. It uses the existing CAMSS property
layout without additional properties.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..d561179be48c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-camss
+    enum:
+      - qcom,sm8250-camss
+      - qcom,sm8250pix-camss
 
   clocks:
     minItems: 37
-- 
2.34.1

