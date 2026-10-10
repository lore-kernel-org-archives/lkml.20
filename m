Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9A3BD659
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602317; cv=none; b=mrjqW81Iperqrh71u67fR/edVx29Y0FWy6bBBezD54OoPfUCiDqdsY8tVyodKvHH/tRPijctXCOIqaJE3XlLOTjS8r5Ho0ybZgD8NQNc7YfEJ0NH0OOe0IYtxb5HeQb4+gsvRCWYP9zczrI1JG3HhkMFlsp5fefd6jOsBOpCw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602317; c=relaxed/simple;
	bh=C+Ziz1ERDOQdIujZJrtszKzBRDruUjnP3VYa+b+y4h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kWeCkXAUNgjrdzFTAFQo+mv09n/fv5XlLYx5xsZ2W+rEzlNpeVyEQ4UEfYBtKMIIgkW5VSeYr5KAI+cUMIPwgNCEhLMYHGC5u40oOXEZzEw4RJFC9olAXP5SLBhk8ia0SE5qXj92adc4DjBF6TSePZG4Nyoli0QvzJSr8lx1qlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpKbW4qT; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpKbW4qT"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so460127eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602314; x=1792207114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iquo7lxZUMkQsNr8h9sM1pEZR1NeTEdIK6H/KpJrY+8=;
        b=LpKbW4qTxKEVgGo3I/r3JcyIAHSX1WCkvY0xv4qWOVmWSu6QMi5qVsBZE1c6o7V9Oz
         dRU15wEm3GvUSOiCDkpc8W60mceZztR4+VPtmqrKWb8DyVxcQDAGUQMqu5oFvwM68DjB
         TTqv3ta2ci/nyeC211eYt2VjxWDRlmB7i9ETIq0uxe/hbIjB5tVDlv/y3xKAnZD45T2B
         zZLZBAH9pdNAKcEfqvpgD7NlfbNoH8eIZ5vNztwJifNp2MQXsqOjYJuby074b3K7gszE
         +n82AVHpGt5lNLG1ToQPXG+s4ZxdbWF+hCJJs96ghm7tyRYiGaYJdSUert3z1yXlPZJ7
         xARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602314; x=1792207114;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iquo7lxZUMkQsNr8h9sM1pEZR1NeTEdIK6H/KpJrY+8=;
        b=QQ+p2rL1aQLT8vOPGh0/y4ZFOOYXdwga5aISNbLhn3OeCaz2q0if3njqNBrS5HT7iF
         WLLwkuL96X7HFBsjB4rUsbl6NfBFbdF8FuMmacNwGvRq678LML2lcSuru//ZaVI7z3Rr
         rdlXDpsSpXatIwQ4eXH4gpEjHg6kOdy/1udDsBVfnMQYsDVUkDZwydi6KiG7XGVi0Twv
         eiCIYsET94/qMVGY4PiTU/2zzL528azAhRsDxunM5xFMFL1DxiSL17AuC3EeSRzcPwGA
         XE0/5B6iG8hB7wKkfCoVWOjI+9PdB9LoOkePFjpWXKYTGYEIHzop8pNI1Y4KhmmZjRpa
         xhEw==
X-Forwarded-Encrypted: i=1; AKwUvBw2yF+FM4/jHWI+GI2V28da/0ejViXzL7u1+z11FMuPCFbC/8EZRn1hfBFGc77JWVKsVWx386GBRA+3qvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLed+zpDqiVfQjimwRVfG+3pk4XMQp1ayINHi4r931FGUzqwFW5
	5s4voJ3CNLCxwH4iWgFP6ehDYq5ZE1ssBRoefK/w+GNX7XdtOJTueCaG
X-Gm-Gg: AYBFou2F1XOGq1YMdZ9SRAML+MGNHvE9ZCssqNX2y7BdWEBwNazq9HApmHpNVqwKnmH
	V3Ry3Kw/wHaAwjkzRhNAhpgj8BqjnPkZLdQX8clwYZ7ATrEAfHFyZ34sc1rvZs9plPBdexF1K5t
	9pK7dOakQFdi1/Z4dC0usL/hkU2xTyruLPYgu0nQyCYPrZcIuF9mx7iyxzLaZ5ZVrXNDdvYMYBJ
	MDEF37l2HscwZKwy890dzNNPcMzQBlzHzzLwntDHBhLBXspeN6lRDhhhDRPykewnAmLmTbOzdc3
	7OyjyfL8opi8SmVyWBwKMp9axMe5oevc8VHjEoFK24e0t88qjIk+wnewyJJ2M+tOVriKPEb+D7X
	LD+VaBzcOPduGnVXlOXTLIDy2Q+86mB19t+aeL+uRBx/15kh2bz7HOdRQKSQkXTDFDLnZ7WqJal
	9FZsqfOnbeF9SHXohR80jhBf3SiGeuzRBelaEbfmHH0OeTLskK8BzRY1Cu1KA57xBQhFQgpK31k
	oibLDKqNUE4reVJJRvGizgJXwU1ZQznTmWQ5dRI+KJgH8i/cBVVAJAr/2CNrTo=
X-Received: by 2002:a05:7301:5005:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-3537e0be018mr4878090eec.22.1791602313825;
        Fri, 09 Oct 2026 20:18:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm11160281eec.5.2026.10.09.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:18:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Qiling Zhu <kmatzkaczor244@gmail.com>,
	Oleksii Kryvenko <diver.ua@gmail.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: fix deadlock in hotkey input open/close
Date: Fri,  9 Oct 2026 20:18:24 -0700
Message-ID: <20261010031827.3306077-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit d6479c25ecef ("platform/x86: thinkpad_acpi: Use
input_device_enabled()") changed hotkey_poll_setup() to acquire
tpacpi_inputdev->mutex and call input_device_enabled(tpacpi_inputdev).

However, the input core already holds dev->mutex when invoking a
device's open() and close() callbacks. Because hotkey_inputdev_open()
and hotkey_inputdev_close() call into hotkey_poll_setup(), attempting to
acquire tpacpi_inputdev->mutex again results in an immediate
self-deadlock.

Additionally, locking tpacpi_inputdev->mutex inside hotkey_poll_setup()
while holding hotkey_mutex introduces an ABBA lock ordering inversion
with hotkey_inputdev_open() and hotkey_inputdev_close(), which acquire
hotkey_mutex while holding tpacpi_inputdev->mutex. Finally,
input_inhibit_device() calls dev->close() before setting dev->inhibited,
so input_device_enabled() still returns true inside
hotkey_inputdev_close().

Track whether the input device is active in a driver-local boolean
protected by hotkey_mutex instead of locking tpacpi_inputdev->mutex and
querying input_device_enabled().

Fixes: d6479c25ecef ("platform/x86: thinkpad_acpi: Use input_device_enabled()")
Reported-by: Ali Ahmet Memiş <aliamemis@disroot.org>
Closes: https://lore.kernel.org/all/20260930075829.53484-1-aliamemis@disroot.org/
Reported-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Closes: https://lore.kernel.org/all/asDVVtAXt8YVbZ3C@ThinkPad/
Reported-by: Oleksii Kryvenko <diver.ua@gmail.com>
Closes: https://lore.kernel.org/all/20261010002413.30007-1-krivenko@itstep.org/
Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..40e9763a12f8 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -1887,6 +1887,7 @@ static u32 hotkey_reserved_mask;	/* events better left disabled */
 static u32 hotkey_driver_mask;		/* events needed by the driver */
 static u32 hotkey_user_mask;		/* events visible to userspace */
 static u32 hotkey_acpi_mask;		/* events enabled in firmware */
+static bool hotkey_input_enabled;
 
 static bool tpacpi_driver_event(const unsigned int hkey_event);
 static void hotkey_poll_setup(const bool may_warn);
@@ -2544,10 +2545,8 @@ static void hotkey_poll_setup(const bool may_warn)
 
 	lockdep_assert_held(&hotkey_mutex);
 
-	guard(mutex)(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
-	    (poll_driver_mask ||
-	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
+	    (poll_driver_mask || (poll_user_mask && hotkey_input_enabled))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);
@@ -2602,7 +2601,10 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 	switch (tpacpi_lifecycle) {
 	case TPACPI_LIFE_INIT:
 	case TPACPI_LIFE_RUNNING:
-		hotkey_poll_setup_safe(false);
+		scoped_guard(mutex, &hotkey_mutex) {
+			hotkey_input_enabled = true;
+			hotkey_poll_setup(false);
+		}
 		return 0;
 	case TPACPI_LIFE_EXITING:
 		return -EBUSY;
@@ -2615,10 +2617,14 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 
 static void hotkey_inputdev_close(struct input_dev *dev)
 {
+	guard(mutex)(&hotkey_mutex);
+
+	hotkey_input_enabled = false;
+
 	/* disable hotkey polling when possible */
 	if (tpacpi_lifecycle != TPACPI_LIFE_EXITING &&
 	    !(hotkey_source_mask & hotkey_driver_mask))
-		hotkey_poll_setup_safe(false);
+		hotkey_poll_setup(false);
 }
 
 /* sysfs hotkey enable ------------------------------------------------- */
-- 
2.56.0.385.gd3acb90ef8-goog

