Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675419;
	b=H0/M7w9PVDB1pTlm7zBoS00lVXiY9VsCkpPrvbPozlsWSY4eBPLp7k6w/J+hJgI4LlI6
	 TR3jIQx1pp70y4jJptyUzqADNwrKR0/S2MFS+U0g7s1uRKeXoQLgSffql/ILLpfRXnTsm
	 xZK0DNPc6Ki541NrfnfoYLE7BFh+qJh73OqEIX33UJxWlVBIb8QhbIKaZ5znti3qg+XIp
	 +bWo9hoMSFL4V1lT/W8B5gCb9vrxQGtkfGo2ZYBjGJ73T1j71cgMKEJic/YEdKmpq3efw
	 eJFSoarMig+kwazHEC2xkAfG6LdLpAQ3ULpMzwmvy6olAS3Cf3xP9nQ8bU9jB/SAi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
	b=bcnJS76rx0LlqH69B5IbIZHb+dQgl5gLp6YMHTP79LaN4Jy8vJ9PZwf4HxbsXf+7FicV
	 Ar1zmFjwgXWHgjA3MlBGNVkgoCOWepkVfb+VOimpwp6Fhi1PY9dNe450QrygwiQXRx0KR
	 YMgUr50smVsJulFdqXBMRzaF/HI0SJxY+WDzPCB6lDZvruVc7iEDHZvt1RsZq6Ep9ggxR
	 QqGGahC0ZYryfgjW7kF2REP3aQ+U/OhHl0fRn+GFVspZ3VbLhz1lhD8HnHQHbrJr5Louo
	 rqEU6MG452326buzdl/WX6KFPwqaLBsDWKVRvXEuV1RLLcK7HwTQOiQiUnwwCO8lgRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B5E606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B5E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4213059d4so760956a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675417; x=1793280217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=AabV7SU6rPc1VzY76I8ieez75e9dF6OE/nlVltNQR563npk53FLXS8Pz8PEqtj/Qto
         fRLsZoR4tN6WZYsR8bYsxSdVehnWO4tO0fPwM8on06TczQAhVjrrdKhWYEFjkAGO8Po8
         EHJpVaBVM5b85V+w9gjRjco9fnHoVwmZcxB8o1VUudT/iDoryZgO+xcGCvlKJXpzG4oG
         JT++bxAoRBbXjBP7ELT9LWZbpTtWypkBUWq2O6oB0rpCdLO4Xu1NgeQlhdMW1H1cHvfJ
         a2S3t006sTmZaqtW5tBpc+rOi31uZltxf1WTMhn0Xi+N5Bwo29b+LYR3/WoLwddLqb0d
         qvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675417; x=1793280217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=KLt73x6/rD8hJzO8ODT5DGF/IdKcqIdPaYsqw0E8QtK0yNuN5xJHEi+Vx5i6YMzaE9
         hgvITjlTRuH9iZNcJ8ot3KVFwVnxMdL8syh5/Smo5elP4zODESADUd33auaB8z9LBpYy
         /JUEOO5vD33ytdVl2ydfOqagsk0waj+lLf8/bzdu/KwH28S59CGIAV6EorHxLw2XsHjo
         yHS3QCCn8HBb75rVOkB++nKJpNYVDbrWXOsDRjQbEFnjN//nvzpdLNhWeIAX2YomZGEK
         pNGIWI7PBbY93HvwnIETtJXoB023+P+yowVlUji1m9wT8ct1Je0u4oigiExPHoA3OvfT
         am4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNxzlWq59K22Q7e4jn5srE8kGy6Q9SRX3PDgNJgtjIUhU2yh205UyVv635OdUAzegT7bsImv/+OYyvkXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK96+DQNU5lIwLrzzJDBkhacDYwpPnLoGhilBwNhvPGmT7YQo6l
	d+J0w6/WjTmy+ZzByDLwGMypr+nr6ljju6ckrPU8ZE2K4VOSYtHpW6DP
X-Gm-Gg: AYBFou1Pwnch+OeiTPEc0heVb2AWN9hyJRhwo09g0g62/YM5DQW//1eI24JLxFNzgVw
	TP+5ZL1tHFozgemrIWqRTXZXMhkU9lbYpdIQzjD+YWnXhsw0hZW8GJc2hRwtQKUA0fBJZ6brH0P
	DqkLO6P79XReD1r0P08RvSn8AhzBd3tRW31LkaY9EwvlwRT/FuI7WXwRliEXkD2ZLMDBqid+2ah
	o0jXb1RkLguNh2ERw8m8jLjgx/ARG6D+N2yqPuqWg0HbYnxlNtxgy72P5alAPr5w3AlPPfnRugj
	S0Bf00KY9xtRcn63xuRhSJ6ygk7JMNSGW6Jpsi/oesAvSFSId33wWsFiG+QB6VkLwtT7S5ODZza
	Jck1EqPwKiqgZYlDK1O66r0gQTbhHHiz5CBEjc8+mPuhGVm/z1Q+LJDHDUnsPJMxBLsyrMTcDYP
	RIcmffaXa+emmKUKCldASV5SywIssMTuQvteoHQ9aCgS75xFQanaqigzwr72vG4PLF+FSnLNI4G
	h8BYTCyN8Q2CYrW3RjFiTlswCnYNpe1Ih8j7t6RtOMgyUrfIl0zZdqmxAMMowh56zy3yp8AFhkF
X-Received: by 2002:a05:6402:360f:b0:6b3:af8e:c88d with SMTP id 4fb4d7f45d1cf-6b408ee194amr4733047a12.35.1792675416930;
        Thu, 22 Oct 2026 06:23:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 4/7] drm/tegra: dc: Expand available registers layouts
Date: Thu, 22 Oct 2026 16:22:56 +0300
Message-ID: <20261022132259.240717-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b0bfa946e6979..5c67928bcabfa 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (dc->rgb) {
 		/* XXX: parameterize? */
-		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		value = SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
 		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..7005df32f485f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_COM_CRC_CHECKSUM			0x301
 #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
 #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
+#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
 #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
 #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
+#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
+#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
 #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
 #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
 #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
@@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
-
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define SC_H_QUALIFIER_DISABLE			0
+#define SC_H_QUALIFIER_NONE			1
+#define SC_H_QUALIFIER_HACTIVE			2
+#define SC_H_QUALIFIER_EXT_HACTIVE		3
+#define SC_H_QUALIFIER_HPULSE			4
+#define SC_H_QUALIFIER_EXT_HPULSE		5
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define SC_V_QUALIFIER_NONE			0
+#define SC_V_QUALIFIER_RSVD			1
+#define SC_V_QUALIFIER_VACTIVE			2
+#define SC_V_QUALIFIER_EXT_VACTIVE		3
+#define SC_V_QUALIFIER_VPULSE			4
+#define SC_V_QUALIFIER_EXT_VPULSE		5
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
 #define DE_SELECT_ACTIVE        (1 << 0)
@@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

