Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418071;
	b=JP7OV6e/PDIrgAs9UaBcLhav5VyQaMZ3X2J+Ox1WZt+cWMb/HHc3NiMozXAQrZIFghtG
	 rkIJUlxyx47vyThF4vWWqrc9kp2leANWUD7usxmTgxWreS8LEVbUZBuj/tkmYWRTbJf7/
	 xHbqpxGZ3uSGB5vvrFjXYSKUfJpUvI4ky9Jl3/tHjcBamdLsDMy+Az290yMYk/n5xyGp8
	 4qciyk88WurBNGEE1mcACA12ClZUuZu1IyfIyNS6giYmldjMhQE72YJLoh4vYXRMJUlTm
	 t7Zjo8llUcyLw8idxQqvhQ5gWfCMiaSEO4u9dgJWq3yhGF4/LGCRrkQv5ipL1gJn0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
	b=aa64ONMH/So9z6QLoFdSk9FHQgoIjupT5sXjUkew0l3wMHjGptKZBxH+hnppFmwkR5VK
	 5SKu7JSyjYJ9qMPfL22oo2jLhpOohyZbwVgfCRhuUjDan3lrfQ70/pcZuqk2DuakW90Up
	 3KKgtkKgQ8Z/Ad0vsdgRIGGKg07S13oBMWU/K4Rb6+/SsMFXzgTwVHw97mkQGX2eTBL4W
	 HVKLB3CoTCYhbihgoh+wT9e+kCX8T+YcjctbilaP3DDEX233dmhTd1kRKpGmQwr5LvohR
	 pbx+703LICrkjfbqcwzod64WAlywMxDeQRJqdiqg/x0BpUzC7B06aotQVB8N1oXL8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW1Etnf2;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209A606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C209A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW1Etnf2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so31691335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418069; x=1795022869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
        b=zW1Etnf2iHetvY9S8Hub9WMWlF1BBzcSv6X26c9ps3XDPBobBcV3MTgCcDKt4Dn4au
         udB1QWfSGnZ/KsKe+Ca7R9yEx2FIoYdqv+UMYk0UiYukL1FEOvUYDAI0qz5cxrmPG1m0
         dPvjKddb2F+kuZqkbjKZaYIs11qGYPO6EiKdjpifaGe+J7cvEyGPONUkk1wj+hxd0E2l
         3JfHGBxA8tJpWUf+EoeCPSnp1cKfnSp10NFy82/8gCEzpQe4zrjRHvkEyzHHHBIP0kdF
         a6qybUy3h2X7OSsdXXR+qgmFHeFMDziRnJFRAYPNQJNJLDCpZnmOMuWVjoeg4jbcGtal
         +SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418069; x=1795022869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfM2VNQvWyi/mqC6r30oK13kaH2l/P1yHvAT3sGGD0Q=;
        b=h5nrSYy9yy3KLzLknNRMNJPJFJYoCSVe3XtFq/YE+ZaqluQCco6oYkYw8AleLNMnwV
         0dUHDBxLRjhTNg7nYnLrynd7QERr5HQcPSG2S5FhQIJYie3ejnAmvKnjVWPrgOnFYVmN
         EkC6pVclKMlMTcOszgx1Dg14ah8Lvf3vlN9CeeQYnI6n421k/clm6f02pt/+X+FvZIkE
         JOAxS1CascPpmWQ85BSbapp1vfqaBGdQ+lRbZV6nc2K+IY6JEQWZaw1jrzFNZCGC0mSJ
         pBupqJB/IB+On+3s6EFQWPN8KPzy8l2+qDHP5BjtXDbWqxhn2TpwLlWR+E8txGdDzaci
         GVYA==
X-Forwarded-Encrypted: i=1; AL+hErHLEhBL57x3CwKsDkvxNNtSDViOa8G9IywSs3rNbe/uK1S8xiggLgjxqrlAthV7rJThqh0wjPwC6oZVobo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d5UdRcx7fqjUw9MsAK5wAixmgOGL2NIEvuoaVwTetU2zi8B3I
	X9yUQmRGaCgq9amONl67PQIIXG7nuK7lBL6e8uVG1AR+GI1fQiOisGMl
X-Gm-Gg: AYBFou0yVmyTLIFAcLp0VpintpV+rGXCQGesxnb85aR9x+t8CT73+7i3xcnBgsVyAhM
	+kQ6PHUrxZGulh4jf/F+xuLiymu3INblpJqqWE39KW+7fQNP4XwI9v3LNNp5QYpM34dAC6vuKTA
	bkSedcbnIfeezbCurijvDdmzzUX6+cp+VF+taAAUsKtZfLj+6pjONVkT5j3hiDBgfatpgGo903T
	H1em189eeetyNTdI/meDroG0+Pd2pDKRQAc2MPK3UDubIgN+ZFQMNQTFoO1yeWnFjLgHfJH8pwF
	Y3iprcVVOM+7/2ZQrK7K3kDPP4wE02X4sfulpYd493imfVFxwqU5Ywfi1B6s0DEk5uB3Z/VKI9T
	eCZ9YwGFM+pkLxeH1e8ZOJmDLDuON0V4IiMBeHBVX6Ak/KsjftQBwagdj2AZNhECFn4/O0I9eXm
	Cs2CkwtaG9wA7V+HDNtP7V2qnjEyPY2QMRt1FZM2XJYR3EUixfCVnevwb+pmzfZaBLtZ1HeV7Dv
	eMtzb+jv16rhujWsBWbdwDRMHlPhVELhmBcM42Jp6689K86q7kMmurNi25BQG4SKcao0HR2yI5t
	xLfKQmXjAGsBgzeRCEOLGkn+qDPQEagst6s9wvnZ5wE=
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr58781285e9.24.1794418068978;
        Wed, 11 Nov 2026 09:27:48 -0800 (PST)
Received: from sd-lap ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm66897175e9.1.2026.11.11.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:27:48 -0800 (PST)
From: Shady Abu-Hussein <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shady Abu-Hussein <shady.abh@gmail.com>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Wed, 11 Nov 2026 17:27:33 +0000
Message-ID: <20261111172733.84217-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111150435.75965-1-shady.abh@gmail.com>
References: <20261111150435.75965-1-shady.abh@gmail.com>
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

Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>
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

