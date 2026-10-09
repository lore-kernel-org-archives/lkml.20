Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016914EA367
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560115; cv=none; b=Cziqz8a/TE+pags6r1ybSv5k82GbtkSkNrO3/6B1bCXxnN5NZ7v5+y4oIYuST6HfxfAxp+7u9PdCjQitnO+aAlGzh9ScdzQPfZvaSphucwLImNPI8f0dEnFynRdhKrK38tPY78eASSE1xGtl1Elnf3FBY5ZTlEnG8F6DRf2+xOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560115; c=relaxed/simple;
	bh=vHzDO/Njhccd+8suQo5aq0hHa112CnSGbrWTB7PvTCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CK0dqGCxc1S57a2mC49QuQxM5G9RVgyVlbtslpVY47HB0f5E+QdRy6OI9QI599WRiGTzXFnNYddvvb3wk/YfgfBCw8pBgG64urhHufXr+eqZVIE09uNk2NyklPFAnO4EsBuv9IFXKThM5jhWwCbFmWefmcrbjxmu04RvKfa3fvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ueth6F9K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ueth6F9K"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so3069531f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560111; x=1792164911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izxmWzhWymqhQF43ATaLAqZjx1TQjQJSOpVFPY6esDM=;
        b=Ueth6F9KUjPGqFNqwDffaf85ick8WUlXehQBrYfVRd7JqK6s0b1yJhb10I+cn65eF/
         BPJsxsxd7jNXgJtMSjL+HAbrmiPywO2oEkgKQ3MuoC/FkdAC+Y7Y0FE9D+LIBXbau64T
         0sVegB6luZ47Gc5oNYy+R7UfhOnHP+oE5FZwCtDacIl7C/v3T0sswiBAESpcZAsFllI0
         BR3AYW1818k+OruU27ReroymSbSd8g6T005YW30M+pQmVihCsWa1+GhKAP/SYGY3hB68
         ePACxZ8GOrBZP0A+oGs2nz+NWrKV4z4dXlHz+F+dJCwXQ04iUfKSePWVZt+kgtk32GtH
         0vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560111; x=1792164911;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izxmWzhWymqhQF43ATaLAqZjx1TQjQJSOpVFPY6esDM=;
        b=QY9ZwUbJ31AfoUiJ5wZdO9ZFraGF7IW+Q5vnXktF10WyW/t5z+OX7QWZXM5bCJY9k7
         DQBvzIg4op1TYZbPPzHrMLalr5pfHVQOPmdvXoDsptPJgD0GM9zh2Eb3I9AHT3m7+5Ev
         wrWPPBP2YjL+ovDMgIXHNhG+507PUlyzMybPkyGaD6RK4IfDEvwcJARwKxnVzngSY1lA
         xvSu7ZobmoM8+gbpM7wXxBSjy12V6pJktWaDqPZAafVjLOObtUwdLw5fbT84Nhoo+1rO
         +J3n5UujdCyIEZzP2kOze3PKCCtRDVdUCTVYZFw0l/FpCx8OWw7sz//lqOaIr3DNk8hQ
         VcXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZaSTS/PWG+e/+wgm4mMASKpynpZijDe646LS8Nvfw+rUc5DXQqi6lOkipdzhEyqOqy2dxpotfQA6LwJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYII+rlQ2JA6ob7QCGZ9knVwNoJIJgnbgGsodqfzFjbA2gVfZBr6
	JkrxtvxaKg5MGm1U38ijwEcsE67cnwsGtwlzZGpntmkRfT1DlswoVMbC
X-Gm-Gg: AYBFou0qFco9curZdGxIPlc0HeE2oCU4jBV1XF5ooiVygBUv+m7Xv30MmtYZalUih01
	mPj8w7E51ikf/waHjW9vy/S0kZ1LAq/s2sP5U1OlJVMJ7bxHB2ZdcntDAcBJb6q0WHnDPqm+uuD
	p2Ebei2p6OUzpiE8c4HTZ/dnCFNTeWQI9jenPEt/eN2PLfo5KYc3522ikERjHcNfYhM1/Ntptq2
	aKCQH8B0etnmtGQFnN3c36XZjBx/D4tQoBRbhhxevRmiUaFLrJ7sBUOFpA3DrluoV4sMlLFxkj/
	3YZtFspqBrRu15yytfzwpJ3G4ZmwPfelq0cLldqOgvHLNtaLm5812UQmn7AG+ch0+Z1NWIwsiyC
	NVSsvQfHRUvd6ruhMGXwuAYauSdlBGoT9wt5sJekIXOqPGy31UMnJRDcPn0ZcKvjWhNAA2RBzNT
	SFRqNq4XjHE3mpN2YUW4thL0u8tF5RykpaDFO+Mdv941gkaJlDCLusPPxH8l2Bg/OvTw/qM8Z9y
	8IJGZZitvB6Lx7Va+V6rrTw1hKj+mzwm/K4y7Fgw/vVt/2x7p+oBfenzQ==
X-Received: by 2002:a05:6000:46da:b0:488:8437:b8b7 with SMTP id ffacd0b85a97d-48dba7b3557mr3460751f8f.7.1791560110956;
        Fri, 09 Oct 2026 08:35:10 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463230sm5395471f8f.1.2026.10.09.08.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:10 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 7/7] HID: asus: Re-send the Zenbook Duo keyboard handshake after probe
Date: Fri,  9 Oct 2026 17:34:34 +0200
Message-ID: <20261009153459.124752-8-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rebecca Mara Müller <rebecca.mara@posteo.de>

When docked, the Zenbook Duo keyboard powers up in F-key mode and
needs the "ASUS Tech.Inc." handshake to emit hotkeys at all. The
handshake sent from probe is lost again when hid-multitouch configures
the touchpad on the sibling USB interface, which resets the keyboard
to F-key mode, so the hotkeys stop working as soon as the touchpad is
set up.

Re-send the handshake from delayed work two seconds after probe.

Signed-off-by: Rebecca Mara Müller <rebecca.mara@posteo.de>
Link: https://lore.kernel.org/r/20260811125548.1975748-1-rebecca.mara@posteo.de
[pisati: taken from Rebecca's standalone UX8407AA patch and adapted to
 the current driver; initialize and cancel the work unconditionally]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a0a04ddb30af..f60f9a8fafbd 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -173,6 +173,7 @@ struct asus_drvdata {
 	unsigned long battery_next_query;
 	struct asus_hid_listener listener;
 	bool fn_lock;
+	struct delayed_work reinit_work;
 };
 
 static int asus_report_battery(struct asus_drvdata *, u8 *, int);
@@ -1459,6 +1460,17 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 	return 0;
 }
 
+static void asus_reinit_work(struct work_struct *work)
+{
+	struct asus_drvdata *drvdata = container_of(work, struct asus_drvdata,
+						    reinit_work.work);
+	int ret;
+
+	ret = asus_kbd_init(drvdata->hdev, FEATURE_KBD_REPORT_ID);
+	if (ret < 0)
+		hid_warn(drvdata->hdev, "Failed to re-initialize the keyboard: %d\n", ret);
+}
+
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hid_report_enum *rep_enum;
@@ -1555,6 +1567,8 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			is_vendor = true;
 	}
 
+	INIT_DELAYED_WORK(&drvdata->reinit_work, asus_reinit_work);
+
 	ret = asus_worker_create(hdev, drvdata);
 	if (ret) {
 		hid_warn(hdev, "Failed to initialize worker: %d\n", ret);
@@ -1590,6 +1604,16 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		}
 	}
 
+	/*
+	 * When docked, the Zenbook Duo keyboard drops back to F-key mode when
+	 * hid-multitouch configures the touchpad on the sibling USB interface,
+	 * which can happen after the handshake above. Send it again once the
+	 * dust has settled.
+	 */
+	if (is_vendor && (drvdata->quirks & QUIRK_ZENBOOK_DUO_KEYBOARD) &&
+	    hid_is_usb(hdev))
+		schedule_delayed_work(&drvdata->reinit_work, msecs_to_jiffies(2000));
+
 	/* Laptops keyboard backlight is always at 0x5a */
 	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
 	    (asus_has_report_id(hdev, FEATURE_KBD_REPORT_ID)) &&
@@ -1624,6 +1648,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	return 0;
 err_stop_hw:
+	cancel_delayed_work_sync(&drvdata->reinit_work);
 	if (drvdata->listener.brightness_set)
 		asus_hid_unregister_listener(&drvdata->listener);
 
@@ -1639,6 +1664,7 @@ static void asus_remove(struct hid_device *hdev)
 	if (drvdata->listener.brightness_set)
 		asus_hid_unregister_listener(&drvdata->listener);
 
+	cancel_delayed_work_sync(&drvdata->reinit_work);
 	asus_worker_stop(drvdata->worker);
 	hid_hw_stop(hdev);
 }
-- 
2.43.0

