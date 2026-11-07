Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093788;
	b=dmN8qAu1o84gbesPfqUR9eSGQkFDiXv6m+xL1FoXeJqbdhVdV9zQoYZ4+Wn8wgQEUqjQ
	 ThmV41DaoKXbIwGFGg7agk6kyfepIvugRtQz0KwB+oannnFqTwzgC+M1ZKTIg9xmdLyO/
	 ZKC4ZMc34LrVgq6aU3u/Wqjz2/lHU3PJRKU6hmGIoK6eXYeGbOg4Mv6cFcW8fWp/FLnhV
	 aP6a+NIuItuDeXskZSDJvyMVYuvgl1U/sq5y+d93Adggun3Y9ETw7nuv4EEr4813GkxcM
	 uSLOSEvL5NPyEGUM8U3HF3gdbCmbOqFm+wAHjTB2rGTBxDdTWHzw/JpOhC47KrErrig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
	b=r+LzdXxWY67TRTHWJ0hIz4rRpCph7wnD/yyL2JNDJCObmwJhoyNkqGJOy1mzMtK16h0h
	 US0zrHQp3Wnkp/vOieVAmgyuIS9TT9/nnIvs8zWIUgOSao1GakPASq67ep0qBjwVYKfCN
	 dV/2+lTrSbx5KoVL/2nsiJcldx13OBj7w8GmvlwY99GKc0sqwfTZJGosFI/SNitW3jjsp
	 dfPiS0L53Nv+Tc7Il4nvte7k/aRoJmYJIVBnsbE4Urt0Szwa7/xTAOe8O+BkW/newX+HH
	 TnXNGjgrkj1evkgOC0jgncvgJsO7tRoPqXRwHqEZoKAKq7Sk3ETtMviCQSXf6nnxu7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma4fc6eW;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF0606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBF0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma4fc6eW
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8451a619da7so36441a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093786; x=1794698586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=ma4fc6eWvBe5WNjPBf4nw7Pf7ew5XdJn+YxFNYcJYRdN64XzE8uFNevvZywhwJQORf
         nsGpgxERAT93pZfzUOdMucAg1MSbj8nAQ0rZIHCeOB8n3S1dGPR+e8w8wF+2KLfm0TU5
         76tLV18hg0rYLrrPHVzqN3GjUFykngbQ9hWkUb8nqls484qhZvDypz93AEGZOOy7qbbu
         MxUYj+giVcYtbI+81mhXVDIOluXRQ4mZHIewdE2DHiGOkV+fNgwpjCzDVtDPUQDM6AEF
         56hRUwy6EXSDFRbqkCr0slV8/iYr86fkyPC5ahVfxQGUcTtdu2seC+g3dwU6fNzCm+3z
         W8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093786; x=1794698586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=OZTlnKzQzdMU8fVqwQca3OCneryuCt0A97yEd+0BqkoK8+LVhSS79sc51DA5wlVpSF
         dOLwRYxRAtLBWr6kHBl5YHNEbjuNoXuztdr/4tabi1cNPr6ATP/IpCGyRiAdFFrps7Eo
         gpHay1tVj65CxNsRky2AV/klWxgnOG3gHrlVPRzXaDhMzvvrt5NZZV65Srk61j4KQwM0
         bT+REI7cr7saicW1WAWRxwXVAKiob2luVpARFICZ0WG2c0pwPu0lJRKfhy/keLA6p+uz
         JS49q78JPLAoHveyvuyAkixXoVVrrWxHDN62tGXyYmM+H0EHgvoK1rdRzy6Qbz4KyT5H
         U4/A==
X-Forwarded-Encrypted: i=1; AKwUvBxTjN78jmPqB+Cs0drCE7cXiRU8t23rTrm2zdehQP1aGmLVbHEjwQF3ulsOvK+25FNfJTXV4pM/qYQ64Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zTqKi63OYq8t2opbaV9wrz92G9eCVXctqlrMlO2HA06WDnYL9
	WlEN6FyG6+DH+GmCqGpTAfOVL9fQFqB5V06jqo6hb02dxjn9U9t0dU0P
X-Gm-Gg: AYBFou33VayBLnb/k1V92Yo1JnbkmJ8mdydV2q78gbS1lpuTVQr+NsRfGwMZrNOIB1i
	ODI3cEPxBTAJVHfGk6FNN07I0dG/vl+fPj/Lk7tkAR0cvpYfj1zY1kf7XFqfB6CZ2UxkWfpcht+
	2daEc3ashg0UJmyD7kEeAk5UsKazW9WDK9djaBT20G8uiOJC5C4IzJGVL8ioQSlEfpNgDbHlsRn
	AQwYqeijlA4UY8UPlWhi2j8EPXH6VXsEnk3gOEn2ckeQn6PLuVLHRJyyjcoNaMjxQ4Yhay707du
	J7Vdenbn0p8fD0bMquZBeVjWCocItSy7Wv0uJDbGY6SAOSn3x+DqI/1SWpicRBjeE4HvXTJ7lzz
	3BLq0ufZTHhbNcgDcPh3JxO+qxsJvhu4ADdMxe0oE2XvS3ebKm8hN/CA5X/dipbjXib5s6fkOIa
	r2+n9kCEKzM+ue4upI6tgc1riMLaEUXiiEnc+D1ILd2ODf4rOlfw9h/FoPdCAeudlvS0ZLYzXpK
	NQWq1rS+edAVn1mVINStQt/83DPwI59R7ACRUDqGZPOD1pbVfyJPKQiNgb73ymKKjJ70uq8483z
	IlvTPOzZEToyr+1abCi3zBtUfeacGWNSNw==
X-Received: by 2002:a05:6830:719c:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f5084013emr174501a34.24.1794093786653;
        Sat, 07 Nov 2026 15:23:06 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:06 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH v2 1/2] ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 17:22:24 -0600
Message-ID: <20261107232225.3838-2-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107232225.3838-1-samuelslg03idk@gmail.com>
References: <20261107232225.3838-1-samuelslg03idk@gmail.com>
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

The Huawei MateBook D 14 AMD (NBM-WXX9, Lucienne) uses an Everest
ES8336 codec connected to the ACP3x, like the already supported
BOM-WXX9. Without a DMI match the ACP falls back to the DMIC-only
driver, so the speakers and the headphone jack do not work.

Add the system to the ACP config table and to the acp3x-es83xx quirk
table, with the same quirks as BOM-WXX9 (internal DMIC and 48 MHz
MCLK).

Tested speakers and internal microphone; the headphone jack could not
be tested.

Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp-config.c                    | 14 ++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d4c8526c..32c4d6319 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -237,6 +237,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+				},
+			},
+			{}
+		},
+	},
 	{
 		.flags = FLAG_AMD_LEGACY,
 		.device = ACP_PCI_DEV_ID,
diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index eb0e9a6af..fb675774f 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -364,6 +364,14 @@ static const struct dmi_system_id acp3x_es83xx_dmi_table[] = {
 		},
 		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+		},
+		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
-- 
2.56.0

