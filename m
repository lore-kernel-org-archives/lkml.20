Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679042;
	b=IP5F+6+5yksER3Ad6gGB6dSxf8g9OYQDxd975la5tHOGNmK2NO7S6cJLxDr+v2WJRcrE
	 RiUZ972TeE3Pf1/+FoObXh0pWR3aZV60soCzolLQOmV3hc7rDlZdk3jkVclb/cp/FqIwl
	 c4ZsRjPj1cmGEKHM0ajQ/hkWdp1B0mzpXRg2cTnixl8BwaWzedaE6NuqrsWdb8bPB3eC0
	 crnJmanSwe1GVc0scSy70Qr1twQdq1fHdP4v2vNIttQLPpnZJiyKENPcB9x87ZcWiaLlw
	 3jytlf8WOHRP+XlYGwJjO5FnxETFp01YK2rbTVfJ2/7NoSGI4xVPprPjFD9TcSduxgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
	b=sMNKWIqvqtyiS9CgGtOzdSUWbXR1Cjwg6jE3lWkLKXYrAzda6DJ7pU5xaD+GPWh9Ogbw
	 YrUXx3WxtCueaTmMBzWL/7nANH/KNGZAPnmPSn4OkATQTpfmrz7xDNQ20mgSVz10ccszn
	 N+P5kAb+gM8y+gL6nOCPWzkDQqkfOwiPoH/Raw4n9M8IjCrhfpQOiysbnb5HaeW1EAbo9
	 6ZJhUuNxXsgoTjL5E4jhCq8SksHSh1scOW60wkwYUcDWDZwtca1RpUi7807j7A/XadvkZ
	 BlcPccT4Euy6WRCu0JhwYd6T/11HvEmPl5DMqKexldODDJRObit+bX5Wkt2C6dzo6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47B606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F47B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso541738a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679041; x=1795283841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=iCB+37cY8eKgy+4WFCdkIv/dFsfVU2ctUo17GkuxpB6SE/rjfoyLA7L0eQYOi/lhwL
         Z4Kq8VrPDZoYfRBySAO1ABGHPuak8VEJTLXKkeU51h/VcfDh7RdTVaXMCl5hFXtyHGOp
         hS+2dNuL4WamTDmBaeYNz2ygW7hugmfTW92ob4PenTEC7Mxgwr1EWVF9XhC/rh8kpBNv
         CU5e6krvjFBiPQ+HoB+i0MeNvI43DA+UxzjOTH6gU5nsYpwTDjg8dGzgc0+CCG1hTEKa
         8WzEraYLXqoLtoDFxy7ekEArepYOA5MZfpYSQZwWEri7WZ5XaNnrmKrN9BAvAiY3QU40
         f3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679041; x=1795283841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=S1APPP3dJymLABm/zNRiwHqawbXPMPx55JNAWbbiGGZW2hiRp7SOTYb+O2hOEr6J+g
         3mOxk69ECUMuxvbD2DoZv+Cmg4VxeneZTBH3qos+zNhq9homjFc4TLLJZ+Q/QkjdZf89
         j34Y8kdCHVgz2hcG2XBQQ75bqI4qSP4Ik1Cw94YzJUZIk0WdrfiTm7bXS3MBA53Jpxgy
         b4zQOHbh5R0yyS5HW+lRcRd8zzBSYLk6he7Z+zmas7WccKV7NmInvwK5tScQ5CRSb6aY
         qTeYYk/5jyWJBM+ai5pEWJ83zL2n22lYhLNNLJgcww3NKB7qRsbIlIdXTeKq+47PEDRb
         4Mkg==
X-Forwarded-Encrypted: i=1; AL+hErHzynh+svL1wuP5cxOHgTpH2vca0+qMhG+sHrT7SCTjGZm1bMsCJup9/dKK6F5A4HQCgBil7vNSSZyldwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HWkl/Y6lkHQRiHlnhFpGoQKLpZJAnBmoZwCB7rCZGEtySVc/F
	G7Aqf5hC9Q6kEuuuRoAAy91WbhTOLVAt1JQwY/jYiBSUuHOKNm3XiNPd
X-Gm-Gg: AYBFou0/p73HcUejUFtE86JUtZ5s1Mpms4ECQr4RzKk+luHcILVqK180XRIU9ZOGzJ9
	IQFb/v7X9tJuxKBYfmJsvejMH/V9GiLlJL4OdJNV7nD6isr0H0F3Ch0rgdfAo53d70y+ZF3k0eY
	58KvyNRVUjLeXiJ6ibT4a1JyP/o4iD5LH2ndo2jiFdDRbPHux71t17dP7FspEYZyZ7ktmofZ2/H
	11cniILlSDlMQBWbUwU6NF49FB05c5+cTMgJeG/T+a/pg0Ul06l/FSUXdn5rVuYMTV3qbZstG9d
	GDtw5E1qKZROvxwn/jZRXs6etqUs5u1otFE/GF/6cpXw6R/3fJFuQpk72k+r2quF6fIub7bKVca
	tyAEyF6q09cmAnMfMk/5dqAWMP4qtpr0uRdF0p4BmZjKnrkultSqDLNR5TIQZsjNmyYMXuvTGzW
	CjBpV7n75vTrbPeCJFl4K2BAK+5o2cu/6+L65P+PDQq4u2v964YxgSNRHtGuljFfkYvUsy6rckF
	TvNYXoRyRjdh5i4wCxHC961BlQltjiW1gTHlldkw3nY9il4u1r+wk8/8Ww7aiCaDYyg44dhhF/s
	UmhkEhdwmC0kd0R3iWW+yXeCQzKv
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr5481995a91.40.1794679041160;
        Sat, 14 Nov 2026 09:57:21 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:20 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 5/7] platform/x86: thinkpad_acpi: Skip LED suspend/resume on auto-mode machines
Date: Sun, 15 Nov 2026 01:48:12 +0800
Message-ID: <20261114174814.62153-6-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

On machines whose EC supports the auto mode (MLCG bit 20) the firmware
takes care of the keyboard backlight across suspend by itself: on a
ThinkPad X1 Carbon Gen 14 it turns the backlight off on suspend and
restores the previous level on resume for the manual levels, and keeps
auto mode across suspend; after hibernation from auto mode the
backlight comes back off.

Skip led_classdev_suspend() and led_classdev_resume() entirely on those
machines: the LED core no longer enters the suspended state, which also
removes the window in which userspace writes and pending
set_brightness work would race against a suspended LED.

Machines without auto-mode support keep the existing behavior.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 681b340a1..f9e2d324d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,14 @@ static void kbdlight_suspend(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	/*
+	 * On machines with auto-mode support the firmware takes care of
+	 * the keyboard backlight across suspend by itself; keep the LED
+	 * core out of it.
+	 */
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_cdev = &tpacpi_led_kbdlight.led_classdev;
 	led_update_brightness(led_cdev);
 	led_classdev_suspend(led_cdev);
@@ -5327,6 +5335,9 @@ static void kbdlight_resume(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
-- 
2.56.1

