Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864F2D2486
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172765; cv=none; b=o2UMcVVLzHGnt0oh3CFup1MoSCSSyBFPCMHxjE4vRzuSUCeR6dcewh3r0Zo72w58xsZzRJinuNFRDhGokqnwOLZkxfLXkv+5jix5Kc/VPWCt12KvKAyxkVFULGBLLrCrdOdEQ19EMM5H4caWiUj6fnElckTHywduSv/MbShFZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172765; c=relaxed/simple;
	bh=0FtrdynX89ZdvXSorAfB067Tek9Jlb72fifsepqe35M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaaqp6AS5xmAwQeLfSdduHDJTmJXZpAbqJpeJlP6a7sdZBYqpn1Z7goqeM1cTrQcNh/KNYkpXVaNVOI+1cASbjJ/0+NPBq0T0Unv9KfZ8EVEGNdoALwAYzpc1hiVKPXXun9VvQite2M0NauUTgfMYapYiJ0MS+MAW9X2i1B+h90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfauB4V/; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfauB4V/"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so340726b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172763; x=1791777563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOeXE7gUlczOfqxA6NR8t7FSwxpoodASCf47fVlz60s=;
        b=rfauB4V/fIrbkASJRtgJz3HGor0c6q8kQxbu+vBAcLmdT1EeNXjoaNXRzMgcytnTp1
         fiWuRFw2kHJ7dQ1FQXKFxM9xW+OOWjOzNQOuPrbuGfuzUaHJh8OKbL78ZzBuOaZyG4uG
         iyKlIb0HKRPD+kPMS3mnt8/p+Awq+i65tiGSz9iZJ7wqVKfdg/AOztACMHepZvRorawT
         4d/Y8kQ6BJ8+HuWtAsWjxJVcS/itPv6o3eCxMXToLjmmqcnr0dJsqbwul73ysUbScptg
         Cp3zh64KLLOXh4yZb591HDhs2dIraSKH8dgEynP0LDWIRTWk4wK2BxbGJwCM2GGN8n8j
         F3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172763; x=1791777563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOeXE7gUlczOfqxA6NR8t7FSwxpoodASCf47fVlz60s=;
        b=p01Ynji8OaUAaFinQfcqULGFtlfaYRz3lAKUIykSbfSK+Y2wlxw6AxBeo9IBd+Gx9O
         KAbTko2c3v3Rtms9IvOfMOqeA/cWlQMFrnI1zZpPZxmjx453p2QPiDcz7UYrG5OOZdWe
         BgiyEJGEBAUxcpGfEbUqStgyiWyCD0YZnlNIRUtGEf/kyJjpbnwwibpSgikl+ZczlKT3
         3V61Q668ivecXk27DhXEMgZzwE+/O4/UO/AORcLMVQR/TL1trLhWilXWPIBg52QATxgR
         9KRkKJebygNWPxWoju6ogn1eH9x+yiLQ4nq9T9/L5uqeNN9r0X3+I6njqRzBXokfgNPX
         pM6A==
X-Forwarded-Encrypted: i=1; AKwUvByq7ig/lgHSnT2H4uebPsWcxcSGaI+o7z/3DDqaXxtDkiClM7DxXuMX6+pRACVVTBrKTAoXrZ7hl9okneA=@vger.kernel.org
X-Gm-Message-State: AFuF++m7dhiOWjGAUe/1vt4KiQNO938Jc4657EbHi3IABMPB3681y2wJ
	4xcFuy/Myisws89a/kEMK51jdwG4x4EPsb1e0TrY6vGdOM2gmjW/vz6C
X-Gm-Gg: AYBFou18kr7KhuVqB25gY3NL2W71HH3oQhpAXnZHjO+PHS6Y9xpiOBcjkXPqNhfE/5v
	k7N2CX/35h/Vo93qE8ceyPOO1bqoX9b+AnvfgVlo/SiGDgv5qam2z/2yCP1nJCFgtPdv1TWqpnQ
	E6/fabQVO55p7rwpMrq9NlYCqnanvWAWgTCMiRXXOM2KdTy+ysK6COGWa6AnTGEzYEOqevWXMAy
	5/fo6fxwPZ2/fKImvPW8CjLoX/KIKq3WAezg9Vf1kp1PqurPmrJb5U2xIx+DX2FddmBA7Hx3V1A
	x0LDpbtT9r9MraN5sacvJIJAaACfx7Z5Vgo7CE9X8YlUGBBPqjgWUSqxfFP7CKZ5Y0pPSTR/+8C
	iHvlzEbKXujURjlkoG2ejNeUSavgE4I2ghSnm+v/SoDJCia/DKh7IRMN7B4+KbRx/O2+uEj6whM
	AL5hbwDA7hOZiGQTTx+DXEUrfXo7yOYD9AdRsbv+zgHMdzfRWS0MvH8zYdPMZi73ukoF3vJyHdj
	dG9nyJihhpfDh6w9Y6sXB8=
X-Received: by 2002:a05:6a00:138c:b0:845:bda6:574b with SMTP id d2e1a72fcca58-88af258b861mr9121382b3a.5.1791172763116;
        Sun, 04 Oct 2026 20:59:23 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c79273dsm2879126b3a.40.2026.10.04.20.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:59:22 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: wacom: serialize mode changes with device removal
Date: Mon,  5 Oct 2026 12:59:09 +0900
Message-ID: <20261005035912.910925-2-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005035912.910925-1-jinmo44.yang@gmail.com>
References: <20261004111353.118025-1-jinmo44.yang@gmail.com>
 <20261005035912.910925-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_mode_change_work() takes both siblings' struct wacom out of
wacom_shared and tears down and rebuilds them, holding no reference to
either. wacom_remove() cancels only the work owned by the device being
removed, so a worker owned by the other sibling keeps using this device
after its remove callback returns, and hid_device_remove() then frees
struct wacom along with the driver's devres group.

Reproduced under KASAN on hid.git master, 10 boots out of 10:

  BUG: KASAN: slab-use-after-free in wacom_parse_and_register+0x4fa8/0x58e0
  Read of size 8 at addr ffff88800be431f8 by task kworker/0:2/75
  Workqueue: events wacom_mode_change_work
   wacom_parse_and_register+0x4fa8/0x58e0
   wacom_mode_change_work+0x333/0x7e0
   process_one_work+0xa3b/0x19b0
  Allocated by task 11:  devm_kmalloc <- wacom_probe
  Freed by task 82:      devres_release_group <- hid_device_remove,
                         under uhid_char_release <- __x64_sys_close

The same object is also written: wacom_feature_mapping() stores
features->touch_max into it, four bytes at a fixed offset, with the value
taken from a feature report. Closing one sibling's /dev/uhid descriptor is
all it takes, with no privilege, and a reference on the hid_device would
not help: struct wacom is devm_kzalloc() on &hdev->dev.

Serialize mode-change workers with wacom_remove() using a driver-wide
mutex, held across the whole teardown. Any step left outside it is undone
by a sibling worker and never repeated, because such a worker brings the
device back up through wacom_parse_and_register(): stopping the hardware
outside the mutex leaves hidraw registered on an unbound device, since
hidraw_disconnect() is reached only from hid_hw_stop(), and cancelling the
delayed work outside it leaves init_work armed on memory devres is about
to free.

Cancel this device's own mode-change work before taking the mutex, since a
worker blocked on it would deadlock that cancel, and once more after the
unlock, because a report processed before hid_hw_stop() can queue it again.
That worker can only find a NULL wacom_wac.shared and return.

Because wacom_add_shared_data() registers its devres action inside the
group wacom_parse_and_register() opens, the wacom_release_resources() call
under the mutex clears this device from the shared pen and touch pointers,
so a worker starting after the unlock cannot select it.

The worker also snapshots both shared pointers and returns on a NULL
wacom_wac.shared, because releasing the first sibling's devres can drop
the last reference to the shared data.

Fixes: 4082da80f46a ("HID: wacom: generic: add mode change touch key")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
---
 drivers/hid/wacom_sys.c | 60 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 40770affdbde..092e91ed1c3d 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -764,6 +764,7 @@ struct wacom_hdev_data {
 
 static LIST_HEAD(wacom_udev_list);
 static DEFINE_MUTEX(wacom_udev_list_lock);
+static DEFINE_MUTEX(wacom_mode_change_lock);
 
 static bool wacom_are_sibling(struct hid_device *hdev,
 		struct hid_device *sibling)
@@ -2783,22 +2784,32 @@ static void wacom_remote_work(struct work_struct *work)
 static void wacom_mode_change_work(struct work_struct *work)
 {
 	struct wacom *wacom = container_of(work, struct wacom, mode_change_work);
-	struct wacom_shared *shared = wacom->wacom_wac.shared;
+	struct wacom_shared *shared;
+	struct hid_device *pen;
+	struct hid_device *touch;
 	struct wacom *wacom1 = NULL;
 	struct wacom *wacom2 = NULL;
-	bool is_direct = wacom->wacom_wac.is_direct_mode;
+	bool is_direct;
 	int error = 0;
 
-	if (shared->pen) {
-		wacom1 = hid_get_drvdata(shared->pen);
+	mutex_lock(&wacom_mode_change_lock);
+	shared = wacom->wacom_wac.shared;
+	if (!shared)
+		goto out;
+	pen = shared->pen;
+	touch = shared->touch;
+	is_direct = wacom->wacom_wac.is_direct_mode;
+
+	if (pen) {
+		wacom1 = hid_get_drvdata(pen);
 		wacom_release_resources(wacom1);
 		hid_hw_stop(wacom1->hdev);
 		wacom1->wacom_wac.has_mode_change = true;
 		wacom1->wacom_wac.is_direct_mode = is_direct;
 	}
 
-	if (shared->touch) {
-		wacom2 = hid_get_drvdata(shared->touch);
+	if (touch) {
+		wacom2 = hid_get_drvdata(touch);
 		wacom_release_resources(wacom2);
 		hid_hw_stop(wacom2->hdev);
 		wacom2->wacom_wac.has_mode_change = true;
@@ -2808,16 +2819,17 @@ static void wacom_mode_change_work(struct work_struct *work)
 	if (wacom1) {
 		error = wacom_parse_and_register(wacom1, false);
 		if (error)
-			return;
+			goto out;
 	}
 
 	if (wacom2) {
 		error = wacom_parse_and_register(wacom2, false);
 		if (error)
-			return;
+			goto out;
 	}
 
-	return;
+out:
+	mutex_unlock(&wacom_mode_change_lock);
 }
 
 static int wacom_probe(struct hid_device *hdev,
@@ -2905,6 +2917,21 @@ static void wacom_remove(struct hid_device *hdev)
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
 	struct wacom_features *features = &wacom_wac->features;
 
+	/*
+	 * Cancel our own mode-change work first: a worker blocked on the
+	 * mutex below would deadlock this cancel if the order were reversed.
+	 */
+	cancel_work_sync(&wacom->mode_change_work);
+
+	/*
+	 * A sibling's mode-change work tears this device down and brings it
+	 * back up, so hold the mutex across the whole teardown. Stopping the
+	 * hardware outside it would let such a worker run hid_hw_start() for
+	 * this device afterwards and leave hidraw registered on a device that
+	 * is about to be unbound.
+	 */
+	mutex_lock(&wacom_mode_change_lock);
+
 	if (features->device_type & WACOM_DEVICETYPE_WL_MONITOR)
 		hid_hw_close(hdev);
 
@@ -2915,7 +2942,6 @@ static void wacom_remove(struct hid_device *hdev)
 	cancel_work_sync(&wacom->wireless_work);
 	cancel_work_sync(&wacom->battery_work);
 	cancel_work_sync(&wacom->remote_work);
-	cancel_work_sync(&wacom->mode_change_work);
 	timer_delete_sync(&wacom->idleprox_timer);
 	if (hdev->bus == BUS_BLUETOOTH)
 		device_remove_file(&hdev->dev, &dev_attr_speed);
@@ -2923,8 +2949,22 @@ static void wacom_remove(struct hid_device *hdev)
 	/* make sure we don't trigger the LEDs */
 	wacom_led_groups_release(wacom);
 
+	/*
+	 * Releasing our resources runs the wacom_remove_shared_data() devres
+	 * action, which clears this device from the shared pen and touch
+	 * pointers, so no worker started after the unlock can select it.
+	 */
 	if (wacom->wacom_wac.features.type != REMOTE)
 		wacom_release_resources(wacom);
+
+	mutex_unlock(&wacom_mode_change_lock);
+
+	/*
+	 * A report processed before hid_hw_stop() may have queued our work
+	 * again. It can only find a NULL wacom_wac.shared and return now, but
+	 * it must not still be running when devres frees this device.
+	 */
+	cancel_work_sync(&wacom->mode_change_work);
 }
 
 static int wacom_resume(struct hid_device *hdev)

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0

