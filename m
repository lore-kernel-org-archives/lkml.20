Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174524;
	b=zIwOZpS1lwagZg0IwH6c1YHEbkxOb2Rxm92WISSmxVFG9V1tg61rdmR4K6lSI1WP4uFA
	 zRowqN1tvVH7AaK8jIdcV1DKVGDQ1FcoJCyOZcoE39UZBpk1vSKnTfvyIlJ/5+6kzkedV
	 MgC2ADLj/u+SCbjN9aYfvDTUiTHIEaMAFO0DiB51+gqPMSQarBIiuC1HSe/sDZzq0uLqG
	 dRnVR9kDdXVLccfjVMQh4dYNzMHT2BatC9y+Hi5Bs3Wl9VjvWbYxqw/sKxUimnADD1JVS
	 ZDDMrY/XinPZjs/XRFn6+Yn44CifrkWuOmggsUmLXibvEeQYvUWOIX3aor/JYNDSKoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IJmE3oA/krvQNz+oei6INePC4WWOsJ5JbTHntRya0h8=;
	b=U0YKxGOQ9Hw9EnBB65rGPLbeYqxmprln5GHZ9ffiJJZABn+IAC9Wmm1iSuFClTKnZMP2
	 zZ5TlYKtZGYR4cMTVbdhB7NuWTg/rksrnCcqXyco8AkTHu3ETIwugQeX/jqxSjO0kkAw6
	 Tx3xeQiOJO2x64ogQecd062CxRAxBALn1pBE4umy5U8BV7YH0153ArvTmUXTgCIyvHIPm
	 YildNFrBaqNXkiNntZcUNceyJvmwbjDpH87804MRqkrjYtRu1qiDN3f2fTSsad0EcbF8P
	 GnbGca7OibzYhQWF52FmnEFAKWXVWLtB4eeXyNBNllUyGRTKTSaz9K9jOe3g+9N8eig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=compal.corp-partner.google.com;
	spf=pass smtp.mailfrom=compal.corp-partner.google.com;
	dkim=pass header.d=compal-corp-partner-google-com.20260707.gappssmtp.com header.i=@compal-corp-partner-google-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s1gZMNk4;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5655606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5655606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=compal-corp-partner-google-com.20260707.gappssmtp.com header.i=@compal-corp-partner-google-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s1gZMNk4
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso419536a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20260707.gappssmtp.com; s=20260707; t=1793174523; x=1793779323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJmE3oA/krvQNz+oei6INePC4WWOsJ5JbTHntRya0h8=;
        b=s1gZMNk44S/BMV5H+Vs4/E9t4DQJguKfjDliKTBg41saEz3D2WkUIuco/CYtH8rsIw
         Ti15Tcv964tZ3Sc0wfWkxih5zIVko1/5DQ+nAJ+3RLIFvs28c8xTZ/7uQwbZQNqpMnDi
         hyoE+32a7ZJSRwx7VFWLg0TVJ8bgoXln7izTAvjQvtAeRfz2LHX2K5MCCHjtknjJsrpY
         5U0P3cGcmFMGEAdvOwqgpr+XCCp9FNBXA5PjEkQWYi79Exw0jcx+VpfRznE8/1WxLBc1
         6BZZzCLdVutVZrH1M9CKg92zO+L5lnC4DeHflMOtnTUIe/HvFgm/ysH4/fPsGSEgoHT6
         b2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174523; x=1793779323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJmE3oA/krvQNz+oei6INePC4WWOsJ5JbTHntRya0h8=;
        b=G+0kBvSFJIF4f1ta5mMlpwtwQ68ImwT1pEa3/WoxzVrvznQi4Y0gWahE+f6dsthsPB
         Y0yB6o8Zxp2SHZ7iSgpB5hezslDdrldSCinptHG7yLDqMFcT1Zd+xR9QSKg+oT717vNK
         /mVxreM8/RgW/egk9elhXiOIqKFWm8Yns3qpPv0oHEMSzn0Rrxu8yY61tgnNdrVfgiur
         Yd2TW1mWuMjMWiDax53y81xztqWhpfYADwu/Qlhp4NFxw9Mgr7SUkuNgKRGiFHu51U+N
         BKMblrMx4oWBqW/B/xJcHpBjco8og2Hl9vlzXJGWI4+5wE6TdQ0pxD9cR5mL/zBWJW2A
         WUiQ==
X-Gm-Message-State: AFq9FYIV7f5khRlKYQ7D8nkQQx4Ku7utRuaX5fTeBuFpLpjZM7kkfJQc
	4Se+s9BoeQ0lGoEIryc5FH75srLCKRgaMfIE7dZBq8OyYqncU3DEQknMZXbmacMOQokCwGiTF0r
	6xzXC
X-Gm-Gg: AYBFou3BN/gAe4cAOoCS3nUUQGP6qqYv7JCTX8ed3OK1Ocl5P7S+MnEapYes9MgQ817
	j4geAkPu0ADVOW2E2Tlhh1PzEuOIPPJnOaJMX3IIvBFnkqMgaRmsBPxHCcO09tthaVVaJzIDgGh
	LRUc2LXtPSg3bACADCuI+UB95FuwEMrUCFRhVXcwXxg8nlFfpz01QHfjzQcWZLwfElfdC2l575L
	0jtwsg0nKhSmYdvtOMQm5MvBG93/0K7KlZCXEyLuJBVIeBEqvIOvvNj2zOJdC2tFrhbzIfosvOB
	B8M7PotaHTTjvgZlVzaM/7GpKLYgExiEjc8519Qejw5swJHEaB0tSvpGMkrFFysPj9A2Yh5I9tR
	kk4Fre3rX7fvC8nwaPSiU2ZMnp1yYV0tQQi/7IEaqTkFJ9YCENzBz6Q5cSL5azkWO4a1tQ7kmAD
	+kpBMtX3aLbOyTh/bAwmyAUSuP9p7mttYnlswiFGNQwrMX6kvYy7931MZiT725dWpfiuAmIIzrr
	lT3CUEXSofYPuSMMyMvfyNGpZlY44CI0qiTDjkRLqjK49BLSexKq4r5cztGy5v5J8UwUiAyZh54
	pV38jB2q1fmrXVV+YTF2swoZfaFVEye7Y1SX+KMiPShHjUZdzWLo3vS1F8fXUIAcEidg434GEqt
	T4LdGamHUro7sfaUNN8M=
X-Received: by 2002:a17:90b:3eca:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ae57e2ae86mr1161170a91.4.1793174522900;
        Wed, 28 Oct 2026 01:02:02 -0700 (PDT)
Received: from terryhsiao (61-219-175-100.hinet-ip.hinet.net. [61.219.175.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5d45a8sm1929049a91.17.2026.10.28.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:02:01 -0700 (PDT)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/panel-edp: Add BOE NV116WH2-M32 V8.0, PNB601LS1-3 HW:1.2
Date: Wed, 28 Oct 2026 16:01:41 +0800
Message-ID: <20261028080153.91945-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw EDID:

BOE NV116WH2-M32 V8.0
00 ff ff ff ff ff ff 00 09 e5 10 39 00 00 00 00
27 24 01 04 95 1a 0e 78 03 0b 55 9a 5f 58 95 28
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 96 1d 56 c8 50 00 26 30 30 20
36 00 00 90 10 00 00 1a b9 13 56 c8 50 00 26 30
30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0d 40 ff 0a 3c 7d 0f 0c 17 7d 00 00 00 00 c0

PNB601LS1-3 HW:1.2
00 ff ff ff ff ff ff 00 0e 77 10 11 01 ff 00 00
13 24 01 04 a5 1a 0e 78 03 a1 35 9b 5e 58 91 25
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 06 14 56 dc 50 00 28 30
30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0c 3d ff 0c 3c 7d 0e 0b 17 7d 00 00 00 00 fe

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 94bc54c3833a4..ee880dff5e02e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2090,6 +2090,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x388c, &delay_200_500_e80, "NV116FH1-M30"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x38ae, &delay_200_500_e50, "NV140WU2-M70"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x38ea, &delay_200_500_e50, "NV140FHM-T0A"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x3910, &delay_200_500_e50, "NV116WH2-M32"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
@@ -2141,6 +2142,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50_d100, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x110a, &delay_200_500_e50, "PNB601LS1-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x110d, &delay_200_500_e50, "MNB601LS1-8"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1110, &delay_200_500_e50, "PNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE007QS3-6"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
-- 
2.53.0

