Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E69372EEA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330733; cv=none; b=as6mNj2CKm1ondiqn8vmn25bVmP+uxUVVkbDM3mGrBnkSAMfD7tqRPp88C+ZUYBP8Bf4TRcq/rXHqCoa68ucZpBjjYU7Y80QFg1xpWqLtM2EEP40rVYcjf34sG7H19C9oAxfrXG8rliURDWHmw2DN10LrPNeu9hq7GJibUhP7rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330733; c=relaxed/simple;
	bh=2l2YGOHROPjoB+ppCxB7sSV00aifTaAJqud8TC2bO90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWWQn/Vpd0utfqpIk+uC4762P2i9YNZxlKuhh5kdyiRLJyTElRJkNU7sRMKh799BZF9Y2uxF0Vv+uP9jjGj/PJUITeb6M4rffjHEperstIWidqWffPCSrDYzx9sbeeSLwZUMmtLjgBNghiOOgCGqUs5Dhhjh7g0N3tU67fyq6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2i6cSaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbbng7rc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2i6cSaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbbng7rc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0CSP2528797
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/pIRG6lOSOL
	+GZKPVs8yVLiClfTIIPVe6IufCgoLClc=; b=M2i6cSaBkZXs21bNWZoi7ORzYoj
	m6W73lcgoKMEbY2QChsfyTrci5O9eZFwXCDhGtfzaNI36yhj8zQK1X4yCRy5HkHC
	/9LYvq5IAvS7YvijXTkbCPgU2V4vEV29yE6poz9r6IL9gGDq+IdndN6tojzQ1P8h
	1l7Y2SFAciUy1p8/o0o1Oru0BFe+x3phA3I6oEdjAQrhj1YUAblkTUpmshKaeMKq
	ERVJZDPwI3b28pNCnIKhPP9qGCGq1P9bI2iu4kHCALwjaq8gwImhxCAKuFq11omv
	W4IS8AQRriKV/56wEU9IT6y+GyU8qKfBQnu5OBC5Go+Zg2GK/EZFWaxkKlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dc1sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso305427485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330730; x=1789935530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pIRG6lOSOL+GZKPVs8yVLiClfTIIPVe6IufCgoLClc=;
        b=jbbng7rcxDo2H6DSkueGkxXWSrT039EQUwi3kHH3DSnPIqD5bL/HWsD2Yga7GsX8px
         AIFuqfhXMdqNnUccLeBiKH/nF9uFFh/M80soLo6b7TUqkQX+EIZQ36ro0nW9nmtRWQm+
         bIWxzBOmAUllSQ5LVnH5tsdZpwn0iye26ViBQ+RCB5HWk1o95AcKPN3V48oaA1bdDxp0
         JLgxbt/ksAtACFClJAoPRoJ7k79xtihJF+TrOex31ov4miiO68DycAP1/QWJLDmzAjLN
         HTe7Qdd0NrzGBEq9r7+8En9k5aCHBvkQWMBVl2DKNad2mMn7zayIHygYAiyFPbUPYmmV
         AzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330730; x=1789935530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pIRG6lOSOL+GZKPVs8yVLiClfTIIPVe6IufCgoLClc=;
        b=pAxkhvcVz+zDVmFkMrmSU/9+eT2vN+FXJhpPkHa1aVaqCWYo03iK/gpgDHLuGlfEeL
         wXo3cXGlFC0jIVO72lC0mh+8+LAtWuA1QZx4YC/G/DqBLmaS75LNgFP2mqfzXPT/gozZ
         KIMfnIxhZ8cbV3KGgnVAZFn0uuqR1gTxOYhchxHr/6hMvMPHO2Xl2yMRxNkFogho/XMh
         FETWnxplm/CdTrOXJFKGH2+P77GEAlaC5sZINtqk2ulYXAVAxb7S+B8btyo9t44Khgg7
         qcAG1xjpwflVTDSczC5lVm3DJZnBjThEsxFMRt2THez9sxv+gJh00K9gB4pNHbPdcleX
         mC8g==
X-Forwarded-Encrypted: i=1; AKwUvBzJbJzJtdI8++H3ifBL/R6yxpv2B+6weyl24FdlU7aDDzbeGtIo8zh5aUcuVRvVA0vuMAFP0JxbKo44KHc=@vger.kernel.org
X-Gm-Message-State: AFuF++kiCy0sWzREuos4q9qTZOc3P4Lte29rjPX3IitM1I3wh2kS7D6+
	nwTOmSpZMWTyer43GhxQJRI3uYdgB3TgomBzD9avtU88Qmodc3jHWmKV3PUSq2jcBsQi3w/bHux
	xkAOBX0crXp9QGfoGMFwHdbC4eal9Yx6VyYSxts3YmDL4pO67MErDN5enbPiXDFkvHXo=
X-Gm-Gg: AYBFou38jv/EzAgjCc3WFxm117yXGNYb2wbhIXhqCgiAHWlftyl7N8gvHVGW2/BhwMH
	eedShgk75TVC/3mO0YuXhYAfa9qcj3LZ26QDjBU9VivcxFzK667bsx/xx6Chy6Zdw6gjSvKolst
	eoRoG/KTDuBsX2u0vABAGeFhdngCTcif0AkplBHmq2+cja790HkP7sPNOOtS+hWxfoQ7Rl5jPVC
	o3Qr8ZP4SgdSv2KM1xZQk7TsIJdyJdQ2cxZpG912Zhbaz4dxtaKuKIwm7xasgVYLeOWFj9ymtQ6
	8voRLNtTprswupw7y66y8SMfpak6Clrr1TJAxqiZ0sMoGd4ROHtMehvXBDQQuqwCeFbk8xR+ryx
	FksF6fSj4sCTDyA==
X-Received: by 2002:a05:620a:701b:b0:939:a9d4:7022 with SMTP id af79cd13be357-939ea0e36f5mr1901697785a.8.1789330730015;
        Sun, 13 Sep 2026 13:18:50 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:939:a9d4:7022 with SMTP id af79cd13be357-939ea0e36f5mr1901694685a.8.1789330729614;
        Sun, 13 Sep 2026 13:18:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
Date: Sun, 13 Sep 2026 21:18:33 +0100
Message-ID: <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX3VoBqwuQjZOa
 UXH+7V0HDQmON6JXiyMgYsjA7c2Me9pcBCxxiOo1xvmh7k07VjwAsQO+cy7byeYwvaI4jk1m+2w
 zZDn7ijlO4HPMoXF0S6+y8cnaDzbfxBUHTJk6Nvx1//mmA/ZoxBlGIqtxH0vNoUY9KZeAbLZANS
 QRh/ysJosMKx2digb+BtXsUnzJ3GgG8HJRtYynVknm6F7dTB1FNatgxb9zfxWfKdE/b5zu+f6uW
 IhsMUDkJfX6nwmFatt+GNwwrHAEg6nkCACD45jv6XdniFP8Ntti0XaI++9H6iflXqAUeoJ66q/9
 s45m5WRPh79VR3BR0LpB8Ik21n44qE/z4Q17oyd+OuHFahdfi6wwlDYlA3yEm6A9j02iUEIu7N3
 FRWL6+fbZgy3wq7X9VjhntlJacb55KdrS8rBu8GIxrWbxrmogKjQbTL0UbHct1JCv2keEhX/zaC
 rlzj558ouowf2AfwRJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX3PKa7N0mVf2C
 GVUEYO67z85KFQG8g543eXM1HYd5uWzxZpaMj1kY9HQzk35ufk33pcVfogLwJ6v2MsAYkMzxFO1
 FmQBpG9q5zw++XrlNfm1prKsTKqAvSY=
X-Proofpoint-GUID: ms4mFr4WhhSJpi_tqA3HLpMOVNYwzPC_
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7052b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OHByPvKFZqPdRaoOVeMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ms4mFr4WhhSJpi_tqA3HLpMOVNYwzPC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index bfb49b647b96..15ca62c88901 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2140,6 +2140,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1465, &delay_200_500_e50, "MNE007QB1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
-- 
2.53.0

