Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0854E73C5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733142; cv=none; b=m86qB1JDZr/Pbb+E8GQu3XAQKxGw3JDOIpzli3+j8BXKGQ+99Z2HdUvWIP3vlvlqbUgnJL9RXaK+XZAxSAvXrdd6CzFT3iIvhiZCcTVWF7A31CuerdtGZfLdzhrQgBa3G/Aa9PqnyP3iGPmj4DDX5eK0GsqAXEW8MDOg4qIZeOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733142; c=relaxed/simple;
	bh=yrWESk565CiF7pWVu3f4zAmz8lqipJBbQUa+EmPfuek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoMDmZqYPK8j3rnowN3xqb0pMSUH2eNWyE09fgAa+03TJ/aYs03KGkYJtFmUhiyq3A89E32gD4jsHALwSs9UCyfaCHaTBpBhiObMSewdJa/9nGKygoRNkrFqM9ORf6XaT4ZqGsl8aGLgv9rERWHF/2O0RoaehLQCQ4eUbnIv1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXM5dF/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLQX+l9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXM5dF/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLQX+l9o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dN4M3746710
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPVi9Zw6kD0
	/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=; b=DXM5dF/hKObvtEbd3gN/IjgjB/q
	03wp7Ww3S3HvzhYfSpM4SW9P7aGAZm2dYvRS63vtJiCvLgGxdq4Wnow0tvBFn57Y
	wsKvT4/oGgC/JJ9ctDe0oHzIwGJD0ExF9Gy4uDif65spp8GaZWcSIwAiRm/wnlcI
	/4vJH/hfbc6Bkbr8MnMseU7A6UloMOKNznjHlrYUcafI3aOXMzn+lMahCkoZRHu4
	vu95U4frlU5n09V6YdJuBAIvUuYCWJhxH7ojsMAUHT8/CGOQ+ZVfVfpBAqZMqlrb
	UCr7pNO2mzhkb1Dq/wDgzH8CS4X/r5OvYHe9XaJJWQG9NO+mooBvAuR+nBA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5m170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7d5444845so717952e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733136; x=1790337936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=DLQX+l9ofv21FD9+A2dTXIV252RBaCCmoyfCR/XfUmQtw6vQcsT3encf8IqnlRneWB
         e98LIF5uuIv784rd70+MLds7skJZzPc5lHtbMD9MvQwFquWECTzfB5hc+mUpNGGrJQJu
         DQHw5zU9J1Xo2ehCKEw/Qm142EW0lwbgka94iUniINdkoAwWYU1tbjs/rWXRyXKLaZoH
         jYsiPcB1CW8GBKJR3RKTMcHAact7Lm1XG+DCi65uo86WW8ULAhtECNnZ+TJBedGQ3Aex
         dMymbOXkxNw+EWGNVR++oqCTnAccqf7SilMrJkEAGljRi9jENp1BE0IT+bAML26vvi/N
         rWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733136; x=1790337936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=G5J6drwjITE1bI41+Uqe26e0YmW1gp68lYADUPboOHe/1N1boqOwYf5BW6Z/12g4EO
         dLuiGi1ZzctT2QoiuDN6vdAVsxJteT96+OuDLkrvDpjBoAvyDgGurBbS37e+QYP8Qn+e
         jPupnRd5kkgPwY3/zLz36gljPjVNNwkxIZR65lpI+ctS2U+Tzm0UQrSd616ZfAoa/5VQ
         gth89XoLn46dqkHcgBzoEfGzF8HhC8L3Oz2bfk1MdclR3FsMOQQj/Wbp45Zro5wDMivu
         FwiBU1o2QKlc8KoEprVJtzlM3Fh7C4lpYlnTjvOC5vlQ2869dmYIBWdph+jQFGVwhsh2
         A/+g==
X-Forwarded-Encrypted: i=1; AKwUvBywnLnXHG0d07b+CwtnNUW5eEaY3DheAIC4ARrC/QQRkPBeYiEdUPN+VS1jVDbOaZWuA7ivnTpaARB0Urc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqeEejehXJX6b91BSS0iqMj1JviIx0HtSUupz3qwP/rEMRx8zf
	u76Pa3Yk++ish9Iwntvfj90xArRwdzY5GiUp9yvZHnyI1zRJV6NL9unEXsYIiuJVS+kLY8ddMUk
	hNRpMHs6w+/BITwHQ6NtQTLG6+fPYMfX7Lc+++rgOI/fXK0XyLdgiUdapFAERLrk7Syg=
X-Gm-Gg: AYBFou3wcPWJ2xzdJBJvzn/AIzkjCDlMgZOCsZVX3FBeV3oEC7QKyfaBij7TKqVQpku
	GYR8wRnwOVqU571H3FlGKTRlVjj/kMdBi7rzGF562YkrVOWJ0WfmEt3DU6kmrycajsNGZBhxg2o
	m5vxG9puohRedeGyRJ14o5lb4DYL+uJj9VxPiV9NZ84Obm2PY4TT5w25Mj4hb51ENfaBSkz3+7v
	6JGwQdyyvOiQ6CcRxGa6zFC04V5WFxIeWV7ImNEWIRtmQjjyq6NRPqYJL7CxRN6qkibKj/qz3xF
	B6WJHdhmPrKVzh3guQ/847YQ55YiTUWQcpi4r8WMslEesfyiGwYu2wcTq5U1WwfiuFt7/kEapDe
	uoJnnUX6Qcm819A==
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048068e0c.14.1789733136229;
        Fri, 18 Sep 2026 05:05:36 -0700 (PDT)
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048035e0c.14.1789733135738;
        Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
Date: Fri, 18 Sep 2026 13:05:14 +0100
Message-ID: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfXzm4pskKs/X38
 JK8x8UxFTeb/AWpSSJK6DhuMCYKaqyikRrnDCRJSy6bG1P+xc1z7n8tBdfmLcAhvoYqGK/ujc/3
 h3xN9YTifDgc3Ke4qc6ocwbD/Oxe6q/0R3iIbC3yjIJiSEjpCFNRuQcegO6loczkOuaqxidmkcQ
 MJMQWdcjX+gtxjtvU8kICjtdduc0wIeC6b/Gg5Lud7JRRMAxqWjBwzC9ik2dR4lrnkKorly/TfL
 4/QO9hVCEM0JDGSX21xztTjQMgyFgVQZeHnJf9NfgumsYXKMSgtQfpTZeKg0GhvbUAQJZ9hJxmh
 nBMbP4M8kWYpDGlxCbUNGeSkJFNy1CpbtjPB2xQO5Bmy7KDYkmnaQbQI8On0sNmcyleF4T2IbCh
 gph77lhbwwsm67+7oRZGzo0hIYqpkagvO+YpN5Bv08iYWxs7yN7ifDdtp+qaYmebPm6/gGTrt4n
 XUzHO3DEJnUxtrJ7K3g==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad2911 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=z2L8r4mWo7kigEPKVCUA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ATBODRpnRRvVZJsS35ujENG55GLRIFFQ
X-Proofpoint-GUID: ATBODRpnRRvVZJsS35ujENG55GLRIFFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX4q4ErwfEz1fH
 79NTjuCFN90yNkb7mO3UbLjILPX1Z7QWNLtpjsrM5cGLQdfi5qHkHOg8uPKU+17dptfXIJNlNxt
 7Ai4chGFps5jBD23pKFxAPH0ES3/E4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180170

14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
The panel identifies as CSW 0x1465 over eDP AUX and is not in
edp_panels[] today, so probe falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
  00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
  0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
  66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
  4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
  53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
  00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a

  70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
  00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
  3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
  00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
  22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
  04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
  1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90

  Manufacturer: CSW
  Model: 0x1465
  Made in: 2025
  Display Product Name: 'MNE007QB1-1'
  ASCII String: 'CSOT T3'
  DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)

Datasheet was not available, so timings are not datasheet-derived.
The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
entries already in the file.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index b66751df502c..29f250e6e64d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2141,6 +2141,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1465, &delay_200_500_e50, "MNE007QB1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
-- 
2.53.0

