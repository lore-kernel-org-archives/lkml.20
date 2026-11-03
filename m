Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721213;
	b=mYbnt43BolPG70LM1+GCKiTuSE8TXx8iePjCHQG5bFko3BJz9ThfRlJ8fC5t7wJZTLrd
	 MH2uMOOt6o9LIA6T6X9VLjql2d4RrkKOrZ3Ehn7MkIUDpTMQ+OjDsDsIPIZpWDMk+UkiM
	 phQEeZeFH+OBT3LhMkuo19u5HqSOldOQ9wKd19XbhiUj4BPi7FB803pvIipql8sgYdlQO
	 EcxjlQR4avFm8nlOOOKKGRJIw7WFPLtRXJC0Xuo/2ZPmvM735AHxxVYN1e73bMT7jalE3
	 vr+zSLbluBy/pNzvgZT6AbFT84/RRUqDk0FjHBI0mQL0qngkR4zLjYmt+5cPihLbSQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
	b=HnAJHTHeby1Plv0iCCKhlMQ9/8Beof1UjGK+NWL/tINUiNFLqbM4po7MFh9Z5MbC/w6B
	 An3l03s9GQbCOL+mmwvczTnJ7+SFjGNwTU7ZrI0ezqIXzt7RUEP46rni+CqSXfvWSv1Ti
	 IVOi20lLk6iqT+MHo/1OgP7dpR7tL04jJ/rQFWzTw5VR5UFPlr59WNW11XGWwO1N2kiz7
	 vdM+uJDaJRVRq3uicZVE2J2a1kvjV4zjJ1NMNnQPtkfgaxWBJLQRJTYUjs122QJ5TLZgc
	 hFKIyxq5Tv9W08QTQcsKvzTwKuHoq0AvmJhKZJaBvw8mPuKfpftfy3me6ymDgOcLo3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D230606D82F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D230606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1bc97805eso8661925e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721211; x=1794326011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=cV1rfcaPqw5g4hra3OliVPaZNo6ZdIE9kz5vixcXtW8Tfcy1T3Fd1n3Qomk8mTQtoI
         CpwV91/ivTc7kQ83ItiGXYNE8ylwa+AsAircAYdQm6ZwwjB7P4XiRmfKM+vE4jEG34Ky
         o/4C6yfjE8hT44bQiK0txjwN9GJYfYPlJfGGvoMJUrQGGYAtowQYH6GIoGokPjSUvtmv
         rEBoIKAbNy+l49cfORY/Y7SbiazcTqcB67q8IBSAIrSy73fTqo4/KjNSTFKw43puoHE1
         aiWcFLDFiEkTGYTmfDSKA0vUw3dHJP67zgI+JsxiYKWsnckfO8ZbUN7mHtN9DDpUFG4w
         IniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721211; x=1794326011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=2hdke8KHrhePvektI7m/ucbrZ4QxwWTjmtbilQ3A8ExvHYt9oYw9KTEwQQo9crULxu
         jKVPRV8u8wKpBVTy1hA5F/+hEB3ww70ptniGCG9eM+eSuro3dquipuQ+7PGiNZ88+mXU
         X6CwqFUlzDiBQ7OCCzRscmNeiFrKkYE603IaIecuddDx+9L7tMb4enWVR7gngAKHmlzv
         LoJgKL4cHJ6ys3gIFtWlE2s375Lz0S2C7471CrmeSBMiAtvQL1p8oLZ86/pHVLXa/wCB
         fYV0Fg4mTHZdW10ITFIF9unQemGrmp2x2E5KkHZAAhYN4bYshZwHfirGTPVUK6CgVJ2e
         DfRA==
X-Forwarded-Encrypted: i=1; AKwUvBy7BqsRuRezTJZj8efOPXf/le+uuRoNjDUKg5EYvnrvRcOpAkTUcj54bsBeam27ktGUSfac0X9Z+Ad01I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ChD8LI3In7HimOo8B2JMtiR1A2o37Z0lf0yrZBEW4ynAvRXRA
	PJdEII8WgpsirSsmac5NdDH0u31BrPUStxVO0V+JDa3Sq9Qw8urBAH5h
X-Gm-Gg: AYBFou3GYrUg4M1Lw+G17taflS9q12SpsyZT9Sr41Jf466gOpfu5X1V1Ro8ROWJ60Bq
	i9cYDNA3Pd6ry+az0NM6E5wUdlbMfJR+wB0q4eJft+znOl99K+U/UefJbqEC028O+3xZFflfayH
	7DFGzdjaYGA+7ruje9DkNmDMFSMiocvWtW2x6behfutCPHbW5Py2H4vGZymfznrf7arMRDWYWdX
	yYawbXycY4D/ncFHtwmY4ayLp/0rToN8+SpL2bH+NF0jblxJL6TQG6VTGbqH6GcJ1xu8pwlleiW
	CDyuQNK4nwUYGGvsmfe8ZC2DW9uGGEl81BwFpX10OrKVQDQsxM8Obj4lKTtZTVRnaCBsAFXu3YF
	SbYsyeothQ/0FSjGNnQao4EgX6irbVJiKTYxxMTtnLUmREkzFRnd/VQVFhhWlusbXEPqRHTDG6C
	JUfxs1E7M2D79wac4j7bQ08zeZUewAXyb9oKNsXw57oLKCbkP5V7jcpanpN308LigHBklGAUHEG
	mvygyNd54Icu+hHrs+KY5lyeHlGVXuoizeOFmuawMh8aK5MZYp5Y7iLQhzRPT/hRry5ue9BWQym
	NSKJPza848C3Z60Dxc1P8zaRl2g5fFTbYerODkW7LaTsHMUcQGw=
X-Received: by 2002:a05:600d:6505:20b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4b23c8106abmr73912745e9.2.1793721211351;
        Tue, 03 Nov 2026 07:53:31 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:30 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 3/3] drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor
Date: Tue,  3 Nov 2026 18:53:13 +0300
Message-ID: <20261103155313.114347-4-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
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

amdgpu creates the ISP 4.1.1 devices only when it finds a sensor from
isp_sensor_ids, which lists only OMNI5C10. The ASUS ROG Flow Z13
(GZ302EA) has an OmniVision OV13B10 with _HID "OMNI13B1" on the same
ISP, so its camera is never set up.

Add OMNI13B1 and register its GPIO lookups:

- enable_isp on AMDI0030:00 pin 85, as for OMNI5C10. The ISP4 capture
  driver requests this GPIO and fails to probe without it. On the
  GZ302 no ACPI device claims the pin, and the ISP also boots with it
  left undriven, so its function on this board is not confirmed.
- the sensor reset line on amdisp-pinctrl GPIO 0, active low, under the
  "reset" name the ov13b10 driver requests. This is the same ISP GPIO
  as the OV05C10 enable line.

Like the OMNI5C10 tables, they are registered once and stay registered.
The ISP setup uses the software node that amd_isp4 attaches to the
ACPI device, so this needs the amd_isp4 board configuration for
OMNI13B1 to be in place.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |  1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 63088c072..412d3992c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1726,6 +1726,7 @@ bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 #if IS_ENABLED(CONFIG_DRM_AMD_ISP)
 static const struct acpi_device_id isp_sensor_ids[] = {
 	{ "OMNI5C10" },
+	{ "OMNI13B1" },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
index 363266f3e..7d6072e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
@@ -65,6 +65,14 @@ static struct gpiod_lookup_table isp_sensor_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table isp_ov13b10_gpio_table = {
+	.dev_id = "i2c-ov13b10",
+	.table = {
+		GPIO_LOOKUP("amdisp-pinctrl", 0, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static int isp_poweroff(struct generic_pm_domain *genpd)
 {
 	struct amdgpu_isp *isp = container_of(genpd, struct amdgpu_isp, ispgpd);
@@ -240,10 +248,13 @@ static int isp_v4_1_1_hw_init(struct amdgpu_isp *isp)
 		return 0;
 	}
 
-	/* add GPIO resources required for OMNI5C10 sensor */
+	/* add GPIO resources required for the sensor */
 	if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev))) {
 		gpiod_add_lookup_table(&isp_gpio_table);
 		gpiod_add_lookup_table(&isp_sensor_gpio_table);
+	} else if (!strcmp("OMNI13B1", acpi_device_hid(acpi_dev))) {
+		gpiod_add_lookup_table(&isp_gpio_table);
+		gpiod_add_lookup_table(&isp_ov13b10_gpio_table);
 	}
 
 	isp_base = adev->rmmio_base;
-- 
2.56.0

