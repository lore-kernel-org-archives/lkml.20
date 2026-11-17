Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911483;
	b=11GKCzFOqUNhue8FJSgL9T3VzaW4RnRuKV54x8E9dD/Qg/nJ3owgqvBzI4eyqKZNtnOK
	 wW+QLcfzDtkNS7Fw67wMPWUP2vk5fTC24LR/3vrPh4yWmY4ZS/GspD8FMrtm1mmLLdI+c
	 jqNMh38EuH7H9FhgCsdjeouCeDxFZDSSkUm0qwYFA4La3ZQOi1GdXn8sBruiiL07R/B0n
	 celzRYGR/rBhTFpYxnE/giZEebx0uR8Fgzs3vVnAOR+0hZKFvx2gbM+CHsjred7I3E568
	 Iy/8ARGlCmYXdkCyOCxbEOgmqjPYv1iDxxvajVy7tZyLyJ3BZL7ThkBNkHv6GUCiQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
	b=3YCacyzaYzufK795M+XzPLOG5qV+fh/bpdfviUlWmVLxyawsFUY3HCocJrZqsq95qb1o
	 SsMaS1LnR3m1WlwAki/qLO7pcE736xARs/ME76veGuRLpFMTrwuLj/v7Ap9MSukrogXKV
	 c9U48CsktKk0lmt8fIi/WB/GMK9RuYAcxOAJ5PeAzWYthM+pKAkCbTK6F1y7c7sfu9HqT
	 OsQv552KboaFFP2+jCZ88NNp8B0gc7xK5v4izt+eh0cIA2TAgteGKnrWFkaiMMiH2kNvy
	 8JOST0XTcsieuwnpTQNvWLNNBXgIyx+Lt82Zzrz030VL/nBotyw/49Hh+mK/8jAtIWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpjxiuA1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66C606A8A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F66C606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpjxiuA1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so28512675e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911481; x=1795516281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
        b=fpjxiuA1j0GuHAe2aLk3KqfwWlK8JsqosfEM6uJIZe3Ehh2Hbqvkq7flsoI/6fleZ4
         VGAgewCEXvooTvOTKcWqQvdgpy3vIvepCZdk73/ajldX7TOBqerZ/dpcatzuF+jT7YGj
         dpwtcUK8S8R0YFaQYgJrTDcUsK9CnusUdGEhbkI6S+1VXj3d30BEmGbgQSAPItF77lKw
         1+2661r0jXMORIcM070JWUAFxVdeLrIjvjQ7f+E3hRNROkcPlkDaHMNmtAhNK+87JpIJ
         LKCvtbpSZQsZ8d9jEh+KOcDaesRa8UDBqKg4fT4yV1GFxMagE8QBT5ej1iybH4y+0nyu
         tOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911481; x=1795516281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
        b=mEliDoXuf4PsyY89hIK5skGPFxu7cYrJb067Zyh8yhFn8uGUmKxg2MeDDfxj67h6za
         h6dzOXhOQeIscc/2peaVCPS9AxYqhX74YYJMXBenC/ng2L8hjqFLSqr8fo9eWxGgTQaO
         T40hPODIkGok6o3kJca5136SYrC3H19/K9a+FQpieKwNBpWnCppNENZs/0jsiLXWVtBt
         tI2pXRo9OxNsn970pPJBnBTI5hlZ2iV41ZGYntX9KHJHjBaW3Tln0AuIWwBD7LaYuNAe
         th97VFKUWj1nCvi/AolkBgEysmFARDuzWnsLa90XOCPA7t7l/w0vKHIL6GSoOtcT+y+2
         5dnQ==
X-Forwarded-Encrypted: i=1; AL+hErE7RUh5nVEaoj0Hv8lo8Er8KVB+0jeJdAgClXgqcM/b9t9YhW984+QMlb5BhKryb+1qCDssFDGW8cnu4D0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B5G6GdgQu9QPNEswrb5dcarRwv+te6UorLfI1HfdaZ0WZqQwu
	cCPSf+57CBpvVaM/S3SpqAQDallyLiWJHmZptlD0pX3XLLLEgcKoCL1P
X-Gm-Gg: AYBFou2Srf9oV5xrnWdKIhm9yk7K8KK01M6Jhj+amU0JpuQ9fJuNW9VA7qJJaB3v9ew
	2DcujdwSj6es7Y3NBCbwYeMbTytNlx+kGdFPN9GuyP0oBY3QMgQkg0NzgvQUSY2AN+sJVjJoLKm
	zsE+e84VGeomn3+23zdZo85Yr8pSI6YGFK9m/oG1RbN4ID1MgUWdLzSsH2GZvUjFi+uZY7OQBul
	lFf7bLfrKYgWSkkmHmm+Pvmij2kIyVmm4XdCTVv6+tAzCzIY2hpOUhNG2KBBIB0k3bucZt0CPvg
	RiyfP/SyjSAYDLzX86OCbFeDD2a1sC1Gl6HMuGE2E64BEJp+YI0k1BenP7xPQhyYukTNsN8UFts
	9JcZscPj1fjR6OHPHswNXM2TdSA3D/5CXUyFGeidZjE25i0rkOyXJE+lRReNz4A/vqO+WWvH0Qv
	6bAzcm4svzWLfblnJjdQYGT6tZgCmA5M8z8NMLcaaMGSjrz/cYMWR9gwvSjginFlGXQ9Buv7w03
	6uuqhOWfHAFfl+9noIor09JGgR3rYcEgLpRdTvvq+Ct6Q0h4xclGFvGuL8bi+zpX/oKoLJnJurc
	xM+TzlHODu4s6TLx2ZDGjTnj87A=
X-Received: by 2002:a05:600c:4e45:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb55a84b08mr272748995e9.16.1794911481308;
        Tue, 17 Nov 2026 02:31:21 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:21 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Tue, 17 Nov 2026 13:31:06 +0300
Subject: [PATCH v5 3/3] Documentation/ABI: asus-wmi: document TUF keyboard
 RGB attributes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-asus-tuf-rgb-v4-v5-3-95268035eef1@gmail.com>
References: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
In-Reply-To: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>, Daniel Pereira <danielmaraboo@gmail.com>
X-Mailer: b4 0.15.2

The kbd_rgb_mode and kbd_rgb_state attributes predate their
documentation: they were introduced as write-only interfaces and never
received ABI entries.  The readback support now being added makes the
omission visible, since the read format is part of the interface.

Describe both attributes, their positional write formats, the write
verbs, and the readback form.  The attributes are gated on WMI device
presence rather than on the laptop model, and userspace tools route
several non-TUF ASUS lines through the same devices, so the
description says ASUS laptops that expose the WMI zonal RGB devices
instead of claiming TUF models only.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5c..6aacfc6a42cf1 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,49 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_mode
+Date:		Nov 2026
+KernelVersion:	7.5
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls the keyboard RGB lighting on ASUS laptops that
+		expose the WMI zonal RGB devices (the kernel names them
+		"TUF" for historical reasons; TUF models have them and so
+		do some other ASUS lines).  Writes take six positional
+		values::
+
+		    <cmd> <mode> <red> <green> <blue> <speed>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  mode selects the animation, 0 is
+		static; mode 9 and modes 12 and above are sent as 10.  red,
+		green and blue are 0 to 255.  speed is 0 (slow), 1 (normal)
+		or 2 (fast).
+
+		Reads return the current hardware configuration in the same
+		positional format, except the command word, which reads as
+		n/a because it only applies to writes.  Reads fail with
+		-ENODEV on hardware without readback support.
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_state
+Date:		Nov 2026
+KernelVersion:	7.5
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls when the keyboard RGB backlight is lit, on the
+		hardware that exposes kbd_rgb_mode.  Writes take five
+		positional values::
+
+		    <cmd> <boot> <awake> <sleep> <shutdown>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  Each flag is 1 or 0: boot, awake
+		and sleep enable the backlight during boot, normal
+		operation and suspend, and shutdown keeps the backlight lit
+		while the machine powers off (S5).
+
+		Reads return the current flags in the same positional format,
+		except the command word, which reads as n/a because it only
+		applies to writes.  Reads fail with -ENODEV on hardware
+		without readback support.

-- 
2.56.0

