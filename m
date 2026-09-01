Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3A59B56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254072; cv=none; b=GD08m+DNUHgoIElOsJYjRIySAsKUIPkKUzbbzMXO7G9g3vvaj9MdLmHpN+gB3UkoUT7qfSKW/HvX+h4u/GtEa3OmwZ+1TwGBMtcrkbjLqaKR+j8h0a3cJYp45KldqUnKX86l8mVRvqTnER079KgD5sqce13jZTvtC72ouJxdlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254072; c=relaxed/simple;
	bh=i9nsNJNXIDUF7HC2HqgXcvchw6qqq6G2LQp0MeXMf2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NCVlTvpD/JWzkYyIW7Ct2j3b6M4omhsSBmxNPyDKJnJPBoLaLMav2fM9f5OL2CWo5pJjDna3RFGS7nnXC4fggrx6YINI+g8x+/I4CxasN2efQzSCdLzcoiddAVLDP6buGOBMZhr7gMN9Cy4hSFs++xhUO1Hd/vqw58Qqjr7xZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxoO5vlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joymaXg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxoO5vlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joymaXg9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179NuO1282747
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ULmFFgEiINmKjW4L916IW4
	QN0kL7zSoYDbJRuA1Ywg0=; b=gxoO5vlc85xehIWD67UWyL55bvgR77I5XyowKh
	9WHh/fVm+6/4XTLdUWnN/kjvuaz9+pBB6hqlCX2+kNWygzhGNXpxD9WRQMoR6tkU
	j30ZVsQ+wevOD79vnLqmTV1nQsA36XlFk8Xp0DHfLrtzchMt6hUQYq6fCLkR47yk
	9qMzpwdhoN8T0L1UwD1iJdaRva06pCbw1AqmmhEzvvE/t/53SQOJXeeRQw5L1l8a
	Aj3Ei+d5uPoQL/tOwZAsaKuDGjjmdFX9Np8UHsCHn0P5GKDPv++abGJLZZXiuNc6
	sR8j7emcJnxb0mEWauQOwZDom9EzHkl8ehle1kwLm8MI8x2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9qcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:14:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so705471785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788254070; x=1788858870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULmFFgEiINmKjW4L916IW4QN0kL7zSoYDbJRuA1Ywg0=;
        b=joymaXg9W9lzjVFTObwzo7XQZZLObQxQ1J49z8KcNbVKfFTVm7kvYAPxbW5yiabjCa
         ydMgnGWfOUqjMyAshd2NtsGVBzmlMYXhZjckRHv9ZbtoA0dDOqryJk7iqF5ebXePlCqp
         PybUw/D06UyZ83BgftAjMUq0vyi1hbTDY1m94SeI2BrFMPUJyjTVEBjbcQNIjJBrTSbb
         0nQAqOZ2YAKwFvQ7IjeOBmhA4oc+8fTTOOWy6L5P6FHnUHDjCmve6OC8ArBohitjvyEV
         XSsh96Sj/L1mSkbkYQYDGPwz+zKcBEIPV0j0dGG0WQN9+FKm7PJQeezTSgZqOjCXxos/
         5xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254070; x=1788858870;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ULmFFgEiINmKjW4L916IW4QN0kL7zSoYDbJRuA1Ywg0=;
        b=d/z2mMOseDgYh60H2uT9rBK2PSHN8TZyU1OAI+Za85LHf8j0Py2e6hZHlx1D9yDBdY
         yNhDi6TzTY3vUWMMI52A2NDTF9UqQ/tba6DMcBb+74rLrmkcVeZr95orJIfeTK7El8i6
         xvLm7KF91Fdu0Sq0syvUFKITwxigjUiVUGNL6302yGJhKWKnWsGCU1uPV+BATntTvDXj
         2B+5+lS3LlZXroKCBm68Yi62mOTsWyZVEyfnlD8so2rxlWOJVFPkvxH1OZ5XEAHrZZeP
         8/3fZ0JdNvm33c+wV8oI9OVtP3YzmdzexFtjUzVsGmUoRmKndoSmywpl3/FYDRsCYE82
         4+Aw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Tu7zN+dUY99+0yAh7gDbswHW0ubPrPQz8vWBe6UpX3SwJwif3uPFRT3VZ6jlnjr0mHtV0G//U1lJ3cI=@vger.kernel.org
X-Gm-Message-State: AFuF++lM4OYwnSjF3cWmiKJhrJ+bTawuh0aBuRcfU9cMPddkITZX3Q55
	IVFl8L8+kQ5YYh4LGD9nv6GNsl/hswH/N+46iNn1j8jZdomO76HGbC5Js7V3Tlr5GwvXYh7hSjb
	o+rjfCiXVLZEJ6JZvkPoQcuMDPn1cjyDdNJ81h2FYVzU9wKvd4USyENzRUqjGwCYofTxzXmDh2D
	o2jg==
X-Gm-Gg: AR+sD108KdtwwsMerGBpAtZtd4m9gT/OKae6z3adtfJybdq3tCyAgXgM36bzuJT/iOX
	qrxfQvIwQkGCLGiucR505GJ25QW8Go0rgRwf0k4UQ/ExpvJCwdAw9gZKGjdT0j0SsZ1SixaIAcc
	5pu2GbwsuJr5m3GKBv/UXKVb5Ewh4ITy3FcTSUXME1C0yjQw8jhqvUXqdYKj23gUElWQ4bxTyNU
	6ATtp5xdAoZV7ZXYDrCrKd5ERUIhOAHmb54CD9TYjCXDUQ5WlWNblKY45Vm2Za4d5+iWUkYezFO
	JVC3Vu6ftdUYEQxVE8yPTNpTuiExx7SisxaBGGTZRX+gUsdub3Ppk0YKRchzGMC7b2pTqHwJnll
	4nkNDbzyFIbgtqAnBkTVg8EBVIDCnFe65qRwnVLwVQDg6NKjw9g51j4yM0cgtC9Q=
X-Received: by 2002:a05:620a:4804:b0:92e:535b:e08b with SMTP id af79cd13be357-9394815b03cmr866210385a.33.1788254069674;
        Tue, 01 Sep 2026 02:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:92e:535b:e08b with SMTP id af79cd13be357-9394815b03cmr866205785a.33.1788254069242;
        Tue, 01 Sep 2026 02:14:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a560fsm988963485a.24.2026.09.01.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:14:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 17:14:21 +0800
Subject: [PATCH] drm/panel-edp: Add support for BOE panel used in
 KD116N36-30NB-A001
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-edp-id-boe-v1-1-f5e2c44255f7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGyXlmoC/yWMSwrDIBQArxLeuoIao75cpWTh59m6yKealkLI3
 SvNcgZmDqhUMlUYuwMKfXLN69JA3DoIT7c8iOXYGCSXmiMXjOLWFPMrscC5l1Gjk4OGFmyFUv7
 +Z/fp4kKvd3vulwTvasvWec772FkM3ES0RmgnejUoCn2KmNBoi2SFDMEIHxVM5/kDY18ZAqgAA
 AA=
X-Change-ID: 20260901-edp-id-boe-c00b2d69a256
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254064; l=1756;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=i9nsNJNXIDUF7HC2HqgXcvchw6qqq6G2LQp0MeXMf2M=;
 b=/WXOyjLScUVXnRi9E1oCHjV8UdLtQsqV9wIOAcSq+3XrZqszLtoqSynw7dk1/TCXvOQfoRBL2
 PLAS4Jja2K8D1xWtKKbdUhCB8h0sB1VHzMOW9ExU3hAsWTT1JlxFsvH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: ThukK-NKHZ1Rkj1tuox5xafz3YP-84xE
X-Proofpoint-ORIG-GUID: ThukK-NKHZ1Rkj1tuox5xafz3YP-84xE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX1IqHduDJO9lf
 xt36Mhs8BwVUzRhu/GWxKuFSGEltdYfid3/C1Z5x47VofPhYc0/2OMTFCHs1OGfGV8cu4gmYtii
 EeUmFJqxlBqvKnevbcYWhwV6zLyyYDM=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a969776 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zjCu6LVzA2uhXCqqzrgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX/HzptPHUMzdX
 AxdOLZT/WHgcookQPen/SXmR8lwIjtzvMwvw7miT4Esjqhdj419mN9/973W0qmDEmyHLdHhLK/l
 tGXMcssS9c+qM9ls1b1A+1ndCYK9MQ7GFJLaZMMkWjD3Jx4BoB8h5ALFXjMtSRfzXu/YN7vS0sM
 JRJuyMCgJfN+Y5ND1krL/PBEh7kluCOzbZrMo8JJlfvSAbAE6jCYW/sdoSRomW+9+HPY1/+c6YQ
 JbYFFlFbscBw9tJJmTi5qoXW6QKYo4NtLlAet91BywS8DtYRzs3mElFG6OKoQUFiqAkmP11WVV3
 OIxarEfIQRYsvEfTZ0LXBaTTgBCSUvfdmo7xHLu3PZAhJr98ywCho26bt9V0C5nXqy58oTmZjP9
 Bf2RTg/Ht8df4INCZ7jSr/np6cbreKIrZCecJy9a5a4NkRnftkcIL/f1vc+RHLFvFYKg1GfBYIn
 QkaFqrFP2lfKLF4R1uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010081

Add the BOE 0x0b21 panel entry used in the K&D Technology
KD116N36-30NB-A001 eDP LCM, place the EDID here for subsequent
reference. Timing values come from the KD116N36-30NB-A001 spec.

00 ff ff ff ff ff ff 00 09 e5 21 0b 00 00 00 00
01 1e 01 04 a5 1a 0e 78 0a 24 10 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 b2 39 80 d4 70 38 4b 40 30 20
36 00 04 8c 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 51 56 31 31 36 46 48 42 2d 4e 38 31 0a 00 b3

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2b455369ed70..591e0ed03612 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2060,6 +2060,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0af2, &delay_200_500_e50_p2e80, "NE140QDM-NX2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b21, &delay_200_500_e80, "QV116FHB-N81"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80_d50, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-edp-id-boe-c00b2d69a256

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

