Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678989;
	b=h/05pmPmlnzfUfE+srFz0RQULKwU1t1yLAuKQANt9jLTJt8P76eWcmT7SAGMWUh5s8Cj
	 TCrVgN6LLQ4K1tIvD1uirfk5/6c/tVViNPfIXI836lfFaot5trZAqBoc16HplDLs0rzj3
	 fkKuY1QoBqwfKTCK5Vu+KehTHEBR+CxKcfkf0kts/rbpt66PDrTAPFT0MxrZ2Dzd1Jq6g
	 sEA+r+L9ioKk1NJYKN3kwzPvHlEZdRrCIe+ffYMYDC0TayRJiEfpMyz8kVMsRKj2hbUWS
	 jA46t73xCwNc/VqahO10FVqDY3OY5mELYktFcZIjwHZPS0/ymsBLzVxRqdHY+61hYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
	b=3wd0vjNVBzQAf+u63wIQJCQr52bqaNRiICX4y4eDoRd/eHhbqCDvE1PQuQKrbMXgmz/a
	 Bqdv9b3ZzyBYg9o8exA1e6wI2QRNBgRW1EScrDf/u7cCBO4f2v9/mD/6zLnS26QSrKfdR
	 7/+0zBBsw0fKx3R0f5fe3KVQJNqWDA8TsKf7pBhrro10rcKX/cQiY1Tpx+6bRwRimt2eA
	 bC7TuoTfXaGrUcCiv0/BWBnFprARmih+57rUSAZFRSUKBXDFsl1EGaq8BHlU1+fr6nA8O
	 2IQjRUL0FhjaB1r//B4gPHFmuMq8+T7BUc8qM2NwPvBcaIZaav0oLgbyB7y3hIAZkqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E98606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E98606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso541653a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678988; x=1795283788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=HWETsPeag+bFtE+dRjzmPX4oXUDvXcr1yPp6iuiC2K9aRI90hNzOpKjddkBhlmGFU5
         IfW3DrJ3cMFK+1y4ggpGyIyyk6xDe7id+7rgJ0YMcchbzOSL+GGQ2E653jcFq7oMLpTP
         BPMZ/yTMr60Q1mY0x2oKj5i8cmpm8mFaSozBSsdr2BRosfeLuw+NqrvbJSu75HKngLyA
         X4w2NbMkx63qiAteY+gaY0QwxJ1QAfQnzO79DPaSpJ948IOpAMjOv1M50AumrisJQuTN
         MJGiQPy5t8ns7SuIIVyZC5ed2I9+b0aA2KkxnoyeSTEGNwmkp3esqZszJg+faGLFp5zs
         Vq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678988; x=1795283788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=s0q/xCNv7Vh41SoWYya5nZ0t4Z/xZgnoYPTbxlrdS8ovu1fQ/Hwpz6ZYpjb8mFSuKM
         aotuONFAnPUiiCfDWKjnjT9dFHdEPkUe1yigPZWySfBtf7KPF09GmDy72wy4McVbYQ+C
         KX2DWplVEbZYqKZk5R8B/IszdWF9DChRFFOJ4q/vUsswcJdSgqLgENqWynNBVSYyFbkr
         zlqeD8XHla7cRPrTIq1r+8/4lrnfjfvEB17JLo6MmWmIQ6W7VBXda6NWESX17ZY8EAdQ
         bvE/ju28UnT9HzTszmJaZHBcZscdhGiR86zLwuENvmmt9N7FmIZMrYu/m+y7+qbSXyJU
         mW2w==
X-Forwarded-Encrypted: i=1; AL+hErGebBUP9JaDTESDx0GfGLGXzCAdQhYTHX28e6A2iWWVnUcSzSdsyC3GvXxIi90G3ZAo0SUz+04NrQRHqMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S/eGqaqZR6XBlkRFQiLgGvCAjnvULANvQF9Pe6PoPY6fb51kV
	Mal8pBnmoGgiFGio+nuEeU1bbcLsFAC2RNQFWTj9ajcefea3cXRv3HGE
X-Gm-Gg: AYBFou3z2anjW1/ef4nHBGxDtXjtKGSmT6xG2hpahYqolw+5l3MaNLLtqVbktv0nTj5
	4R/3EvZtkUrDs/4SSXtnh1qhnyQ0v++b42wo6t4zptdYDVN2QyCMB0hb4w//ZauGj0+tOtgpOop
	Jtxs2jdE4OVYirywqvH1wucjxrQSiKma+QNX0a284NZzE/iKUg0g3qkHbEJ3eNlJU4P2Ab9/omV
	kSIcT42NbGyuKCfSAtpN+TAUm7WYJJnR6O9KD8BQ9Zut1vdOzBdOYKHlTJUrSQGymCh8q0BYNd5
	K1H0LMBuFcCKmw4bAY/pInynVcN7RBJGxtJsVjYaaAAyyr2E7Uyr5iYtjSeZ+E8SvfcpMyEwD9k
	8cxjE3hu4hff+9kOXEjlz0GK/0300Ujzo9mSE4+WwRbCjzYQyprrQGYqu/GG2jymSxOUkRPeC4/
	SavgkcpBzTPi4IZllSrdO3+5Hkbb0N029vNPNZ+pwX6W2j3pkwkFyJH/z9xM9GcRAyyjodSeVz3
	1rZb1LXt7O3CI6TJM6B+RzzgYPMbAm7eDaoqTeN58g97/XaywuxiUo5fp5pg91tZ3rdlp7YqeZY
	lFe4D3lrEf32ijj5qKaSwenhumsz
X-Received: by 2002:a17:90b:5608:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b1b07ef0camr5928750a91.9.1794678987564;
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
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
Subject: [PATCH v3 3/7] platform/x86: thinkpad_acpi: Sync LED core state on level writes
Date: Sun, 15 Nov 2026 01:48:10 +0800
Message-ID: <20261114174814.62153-4-kmatzkaczor244@gmail.com>
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

kbdlight_set_level_and_update() pokes the led_classdev brightness cache
directly after writing the new EC level, without notifying userspace and
without any locking.  Commit 06da5325d02e ("platform/x86: thinkpad_acpi:
Stop setting led_classdev brightness directly") already removed this
pattern from the sysfs path but had to keep it for the proc interface,
which has no LED core path of its own.

Move the LED core state update into kbdlight_notify_level(): stop
updating the cached level in kbdlight_set_level() and have both the
sysfs and the proc write paths go through kbdlight_set_level_and_update(),
which writes the EC level and updates the cache under kbdlight_mutex,
and reports the new level through the LED core, like commit
07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
device") did for the ideapad FnLock LED.

As a result, writing a level through either interface now emits a
brightness_hw_changed notification, so userspace listeners see level
changes from both of them.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 23 +++++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index c8098f317..657a19d11 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5108,17 +5108,17 @@ static struct ibm_struct video_driver_data = {
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
 static int kbdlight_set_level(int level)
 {
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
-
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5183,10 +5183,12 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+static int kbdlight_set_level_and_update(int level);
+
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5245,18 +5247,21 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
+static void kbdlight_notify_level(int level);
+
 static int kbdlight_set_level_and_update(int level)
 {
 	int ret;
-	struct led_classdev *led_cdev;
+
+	guard(mutex)(&kbdlight_mutex);
 
 	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	if (ret)
+		return ret;
 
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
+	kbdlight_notify_level(level);
 
-	return ret;
+	return 0;
 }
 
 static int kbdlight_read(struct seq_file *m)
-- 
2.56.1

