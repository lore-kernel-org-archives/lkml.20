Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409759;
	b=OdZ+L2Sq1K/GfktsZKLRa0OHfeAhS+F3S4ePegii2n8ZONWTSHHba63BTdwMqkbswdII
	 7HqXiQSg4nNB5f5lpVf7nhtVbVnEPtFRVra6x58eqDaWo9UgNZ8FJP8RhfCHxBM7ERI/x
	 ZvUcFklxm2KpjkgQPcudA0nHdjczhrrF0OjTIVXgeaH4a4L0ZIRjfeUjNiXdHnbjKCyL+
	 w4eb/wK3N4dqTfeLKyI096icpFfLwtcR9u0J6+kjjRV7s7cfu9zqKA+oFq948a94NRvFT
	 7enKI6Dm67DCLr/yBSr/S0KuX6ompJqPOjlbLbL4G/UVemmm+wyOZGXtPc/XY7CWbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
	b=EFqNyAaYgVR5/a1AfKowEdCNDNnbh6CQz4jj4JFLHUDs+vWoKcs11NYuTw3aNr5jb7Mo
	 krAnq4wLKKAPC0FxgiSb8C05XtKuFikOngtKkkhDmiTfsHoF/HPN5HwUuN67O7NyA9TSN
	 UceA+/xFKSSv1jsZ3vM1q9hzx2CkeW0BaC7tMvsO3+gXxPBR6kfqvkC3FSvrwjUu1WZdN
	 II8UfOt2qX232ILj61rMZJgR9Gp2jDkkvXugtKKcZIWIVyf8EhFewLVpG2Xtrzd9tboWl
	 4TI3KOzL0JV2RjmEoQTliaLPWVaYNa2+pwPROqabhSM4kaMA3XlP7+Qu2a2r3oTY6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJpEYJSL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C577606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C577606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJpEYJSL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so29592035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409758; x=1795014558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
        b=qJpEYJSLfx0nZbUUaNUXPByZn6fF1ZsSj1Z6iydSSwmjVgo7Foo7ufVqPJ5bDyNAtV
         u5HGJUvAGOzpTNdAnoeSJnMerGSbxBVt79ItmlzC3QZ4oqIWBpTGkIAYy2oxJorHAWXr
         3cS4ab7nXOJX5sA2BxrS0uB4oMYAtPbnCxQD2QGFk9fiHgeP/sI5k1XK3OgBhpZ+AwMS
         Q6EXmr6FdSHR8JJECCHAuwwRGLmcftGfpcYLl3BkCxp8URhutezFdtuWVX3peV2/kFIF
         dKW7BtMwt8ccGELwsCrtOjazqyD/gGxqI4JHzq6NHiGEgAl54MwUBjOnSdSUcgoxy67Z
         k16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409758; x=1795014558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
        b=w7A1WfuO2YF7nTq+goi73N7ViuUAgxRwakwXmj0pGOIAMq+icN/JeVf1BjulVrXl8A
         3eCt1zDZ5th/VkY0tJqN72ndPIIisaDRiaCURp6gSDDJxkNEcBBs5i+BgEm8CJHHBiYS
         hy2t+neHQrQXv63/xerMWWqfiO9ucP/F7T1+rh8cQz+gtvsg9zarAgCjwBVURTSWhZFj
         mzr0TpHxh0wApDcmnJtt2ZIbnsMvbMABMIBV96yO2j+Q56/FOjIsKb0oMcGeu8yOwhfV
         IbPlI5G233MW7H8TbDXrfbzVS3XZAs4GHQtC546KXpAk4R1gAt/7Xh6qwmTUbI3hGemP
         3PzQ==
X-Forwarded-Encrypted: i=1; AL+hErH275mvVwiNvxs9mL/yPhQDXd5S+nYxU3XjKkysUz7Dmbp717KadvJYyIMa0e09qYG8weEm/jAXTOsl3Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NIxJesLLOptIymTR3c5UUCq9btgdnm1Euk5Gf9NaINu6sjykE
	ZH319tvmqMIwGTu1m1x2byR8COACn4rW/N0Q0fvkEHclQbcLB08gr4KF
X-Gm-Gg: AYBFou2+QKzku/8ItayRh76AVnVhtYp7Up7awCXmD7UdPdQtpWGJav8l8eEc0CETvra
	yN8+kjTCCxHgjxYTjgRchs9VSaAwchbdcrCfVji8A9c7iJuaf+DylLZ0MZeznGumkrNwjvfaNAN
	so4CsPMtPZLIEBXuQ1uPVYItiOCn18SgwnwRRhYQYHAjM/H0Sv1BMij/eT9hov8k2fOj0jhu0Js
	TfDsjRPxSblCRZcWqD+HNd+ymN9Uztgi2mmdMwMMO7tCupLHRQyHtNZ2JamZDp/hdol+cmbpuPx
	Y/15kCHTnDs+Wv6nIRH6SQQpGhSBXaSIjVFyikrFHyPUjAlCyCoOpSeURn9o0u3OGZ6fv0PLduI
	1vZvnNMY6EpUdhnf+nPA3J6Q+umBiTGbumTWqc2e+vw13DwohjDYInpKg9LtijQd5SfbGT5CdPL
	gdQJ6uHUtC6k4Hm0AKK+4nJFspsttbr4tAwEnnzzgZDAhquG4LlCzRYWk/ve0z+lr7cU13OMglg
	ku3NKopmj+tV9I+jK0JR0rvVQgzRPG5tWtsBZcoNajn/jJRJTxnG8LBi9SQurqVu4M2rmNQn6s9
	unnTzKMo7dsNtEbnyoZx
X-Received: by 2002:a05:600c:3f18:b0:4b7:76b8:348f with SMTP id 5b1f17b1804b1-4ba08e209d0mr61133635e9.19.1794409757501;
        Wed, 11 Nov 2026 07:09:17 -0800 (PST)
Received: from sd-lap ([159.26.106.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm10866498f8f.3.2026.11.11.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:09:17 -0800 (PST)
From: shadyabh <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shadyabh <shady.abh@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Wed, 11 Nov 2026 15:04:35 +0000
Message-ID: <20261111150435.75965-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On the Dell Pro Precision 7 16 PW716260 the firmware fan control
cannot be overridden using the default SMM method, writes to pwmX
are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
policy also requests speeds below the minimum sustainable speed of
the fans, so one fan repeatedly stops and restarts every few
seconds at low load.

Add the machine to the fan control whitelist using the
I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
disables automatic fan control, the fans follow the requested
state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
pwm1_enable restores automatic fan control.

Tested on BIOS 1.5.0 with kernel 7.2.15.

Signed-off-by: shadyabh <shady.abh@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843..250d8c1e6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell Pro Precision 7 16 PW716260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.56.0

