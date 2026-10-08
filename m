Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0A4657FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457655; cv=none; b=pe0v5kFWslX/ldg91OBRYcbPgXmm7roCliG7ZI40d0+QyOWpJx3dekVveM1cMLk34mtdVFDmWKjEblON6c+iZuzS821x8+5Z1YhDY3S6T+WbtUPdHJKin5l13o3p7grYlLEKCTFeV4IWnYRo43Sp5rVFoU1iw4aipRmQe/p2wrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457655; c=relaxed/simple;
	bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTqReLkyvd4xTBkBDMPOYkIg1vt8eTz19r95mVhKg6AWNSc5fAj7+Qjnenb9qxwV0TIrHsxYMg5r6wRDRfgTPcP9sx/KDEyt/ZS4IcTHW/xhAemaY8e/PvJn2wY6t37e0BPdJx6P8QJQtT3kSBJpixgY0rD7KJh94INYvg86MFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkq+4Py; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyqnE2RI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVkq+4Py";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyqnE2RI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbJFb3751392
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=; b=VVkq+4PyiqgFNTNQ
	QSVrgaOx82iN4CJvoOTugfBp7ZkORDePaqXkq3lCNfEWmr07lfOFkBBin0SIHB4B
	Si3HIU+oY9W36w7U56bN03VoMfGPrXXkSuV7XD/yu6zoVwPd61k87LIAhBExWdsb
	EeqfKLkBm5CF8/T4XKEks+wrl1/fZUXc89Xn0fnBQtU+hHXUtfcKHlRlOgbeTedC
	7m1cMKVnxFqqVVfdyBtt5a2kz9TKZbrqXvgpXPBw3I87gdGgOUZYe29LXGVTA7h6
	3u3JmV77k+EeV3pBaKeETkyzip9zo8gar76agFbPeKKJ3GMgk14tVQQf/yuc8Um3
	6YQJUw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sga65f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso8555064a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457647; x=1792062447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=UyqnE2RI7q6rEmRU4hrCvc+dZsUsnida36J4Ghh6sw958sPLGATgmV6lsUKeQcH3vc
         umIRDt2CJZ8R+8Sv6cXW93o7UDLv87vPZlEGT+7/38XVWtPWxiFEZzGXq3FwMW/3GC/u
         8+BI2sY2aOEi2ybDyDasQ/5pGbEcVtbBCshHZ/1PLins1VVrSgKJf4JnwfQggmmPSkgP
         4xYfkgVdDhAZBndlT/iWjNcRIql7jrCWmdbhuQuprXq3ulOutFMQ+LtZxFAy3i6KfKrN
         fUvt1cH4krITeybb6LBUBfAmZZSBK33PZmyZoJ11lmS4dd5PIYWA3gaBPv+tLUwNJq6X
         zlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457647; x=1792062447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=EPH3E5jCYei2AJWuDzVtSV/r3GDoZ2NtDQK6QY7X9nCbiO9W8ca1OPXGGK6evYZoGX
         tjfoSX5nWTtq7Kpl8CFzD2oVpg9PNFm1D1GRIyuTnZcUfsD9lVfqbr8L9AZE8aqNih2m
         MrN7Lbe7379WHbY7M1yUHkJBhgHKSLusqcLLdsHQAw4Y+FfwVz3bi80Sv+M5gV666bCC
         8YZxZ0XT45CSVjdwk1LOo2yErgrTzhvrOmcoSRnBMYnC3PqiQU8/Qi1JVRn/Ve4cpE0b
         +G3FeS33T30qE2NqQE/zeqADcCOMAMCEVSN0XrrqgjT/obi2l6ka9dOop7QT3awx26Bp
         b9IA==
X-Forwarded-Encrypted: i=1; AKwUvBxaSWUPNVKF5ZAIgEsHfmLKDTcQ9CfyB8HlPm71P3PdAhUSIio0eBat6H6VrWiziQx+gp5Dc51cdE0Dewo=@vger.kernel.org
X-Gm-Message-State: AFuF++lf7OarQ9sg3FuOqzcC/nyNm0j28k4tOu5pGz7YFqFUQ4T9DK+H
	nr/2ash6VSJede4AFYXSNG1JC0AkkjzZXUMymza6vL8nMezIsqbUxSS3PcUKg46dVKczIfbRWWl
	sB2FUtifr5T9DkTzlIxW4kITGjxb31uCKBxjFBty8B3cR7s/7+C75kpdEcpTdjVNpTQM=
X-Gm-Gg: AYBFou0839WELvjEzQFTYgsv8fgFbBa15n5JhzoOe0uUg90KjLUWFNIuwdTKtci5Jml
	qnq9Yb919a1YTgmG6sbztPWYAUpdtt5qcb1Du6nFsQeUPEAhZGXYfHBCCjKmkxbMI5MMSbk7A7a
	317IIViI+LQ6/qpnfne30N2TkE+IWVSu56Tx5ZaRBkYSlbCCNt7174JZLh7PLky+ZimyaLFVHMq
	K7YV2YfNWeqpH5fA2abk2FYnGfQyXp4iuEmK1OSMeb58hzHcfRrJsFIdkL3OFKHE8jPXJNPlDWy
	IrpJsNuipDYliu1UZnE4kSl2xa550fyH5qC7XgI+O8l6QJcBThYYcoa4VB4HXopqj/jlspgNQhI
	IttMAYtuP/bqenHx6QpKgDJ9i/R7ezYudbxD2
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294494637.30.1791457647315;
        Thu, 08 Oct 2026 04:07:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294453637.30.1791457646875;
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:44 +0530
Subject: [PATCH v2 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-4-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=957;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
 b=lMRtNXkMwmKTW5qGmC4AwfR+ZaCKriQdL7Qw8wmr5KDC8GawWLpjaWKcgMPLaAsT1rv/OHml2
 40nQt9hiXDVB1pa6auNbnoGY9z1Di8cITbPm8dBQwtpvVysxYCg9v0x
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: f-2qKqR_n91Gpr6_-z1h_JSjX3UJ9vPB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXyuIMa6IT8N2P
 d3xdavMwkTgICp58DLTAALColJQJIbqxn1i8YP4hpIEdPyWenAcRWgkMeYSyAvHVWCjw8crhlMc
 khYtRPK4/VVE/BWqxYxgswMI3jCyzoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXzIe8tUTmCj6n
 YKd432H1/XeOKGjZx0zrIKvxG6AYZ4pxxIBSVJW2a1mCo0jGJNnDVEO8/tcZ29MP4eYwPJZXVS8
 DU6jO2wQo/rPAWYzJN0IJqbIN/enWBCP/yEFryJDNOCyn1PZHaqkfWAmIdGKACBsKV3bCFRhGSJ
 IJVd24a5oRQdP62itIbf+Fc8TGXnQCtYplvMq6qNtW1mdRJPTqoPjYu/FtukwZeD99m+kBgpVJv
 JBHF3Nq7xpHBazaYHs0wNWcZBzmjs86IIXVZi3b+SDe6xlKYDDGZianX7k37PA/CNk6unxekl7O
 MfcQ7wCNr+sWlmuEk22caRIVW/qjKEYssekukf85ZDOjD1QNEpS5yl4wnGFmWjxrNTVbRkvcenZ
 LH39wySIVcOmfUQooMoCizQIzYQ1Coeo6M5GSO4YcdXRM81j7hxJWdmK0BJmOrMW6nZxWBrJ87R
 hI+PfHfKxuPWtGxvWrQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac77970 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: f-2qKqR_n91Gpr6_-z1h_JSjX3UJ9vPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Document the bindings for the Qualcomm Nord sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdac..372919ff9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

