Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860B3E95A4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789306856; cv=none; b=abP+nsGDZAjPENU2dXgGrK3H9UoP1s9JYFvTT413IfAj4H8bnvEospJqOnVzmVqzTDQX04wwbLWNhuIPlwHpNbsTuFSqoUMnO739B6ZG18KKTfwi7G5w+gQbtUBaLMENaXtLhxHsY4Nd/WIEVWNj9HmEij7iHTQw4EZ34gm3aB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789306856; c=relaxed/simple;
	bh=vUq7OE8glOhov/9NBs9mV+ziOL9KOUWXVhl29wF32kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYXHBzsba8ESc2SH1Ee2AFNttBL/nf4Rg39TBvzh8UEFs2BS7bbea5IincmdLE7JOlfx/KvP3/3goDPPokuYbFpVb8XRm7Sv7TcVkrSacvriJr7LCDwHPe4CSv7AeuOpSSd4HzUAAn+SiQhxkRe/BaGStg38Kq3DTwQiO3OFsn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYYdMye6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYYdMye6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so526279a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789306855; x=1789911655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9U8XN+wqeWZ2BOPDqAL3IN95g06CNkRCt1kYaktqWGg=;
        b=sYYdMye6yetjLqtrxHBwrfTskPMmuHpQVzGHUu1uBEWKvrSt/BlQXSB7QFdaMMK4W6
         2GQG8FvgH2FwfOpBfwLhfzJLQ9SSyipGFayJVcmLnLJV+VcetlO/F9MFLH2ZUzwgEtpn
         h2Fem1sOoDjDCVrqFt/s/vmWLtIpbCLo32ZB+ftjIA+/9IuC5Gx2mje5pH5Xpni0DGnH
         aAlNjTG3pu7WCPQEFvrsKds5qgD6+q2QfggpswHaCbX+ADaX8UCh9glptXL9jNw7I1zv
         y0CqEsyoKf4u/h0rIQa4ASPwxg5oOP/a88PjMc/rK0Hh5JzRN91+dhtBZRjK8pypKhXe
         9Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789306855; x=1789911655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9U8XN+wqeWZ2BOPDqAL3IN95g06CNkRCt1kYaktqWGg=;
        b=i0T/2IkB4ReZgFg5pQExd5OW0P3aRnu3hmi2FTeI6/TKrjaYePc9YJ8YpDKIe9Ok1C
         q5fgmPOhp7ExTDHwEelYA7JaQJip1rb5/uz/2OhKyIbo0Khrr/4LDFF2v4fLX6wHg6QR
         oe9IJOxke4QI4LLaQr4oaeiewXuLPE9Ksz9TjIFwzWVjmVYsdpZrMvO0dMj3DT12BVfo
         TErzZdt2VHnyAeE4mrehoVA2QYzHKG13sMEZUuhGWd1JNq8vbwmFFsvzG1vKtW5lwaYP
         9HgQHZ/SdCa0iLPdJr438dMjBuFPRANtYM0w1E8swBHDCgrS8AITlLe8N629mP94qIzd
         S9fQ==
X-Forwarded-Encrypted: i=1; AKwUvByGJnjrXyCUMQ0gV8pj/FPbdqNF+/7PwWvkXgzxP/jADyupWahi0NfhFCSAi+pDcvb7XoEBHYnlqDzlWTg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWwHoYlNEeMKam1oNktQuzcLlwrbuGS4o7x+6oXTMzkQ7tlJWz
	Qk+7LoqUPF2CHLTKamfrbpbG1HImTA4nPIEbGuqH+IbEYKD8RaS2kroF
X-Gm-Gg: AYBFou00ABttbaDoIPdnX3nKzLR8q3uR5smpMDYjMlDbk8OBHk3/oHcYfm/CMEE3C0R
	+8z5vIw0woyPks+xl4zKRb/fr6QW75chtBsrrMN6rGWwyFqi4DuvSjrC/0aOZlmWqntl9LQgBzF
	uAtXUn4WeydFnwwmY4m/rJ+4oAXAweHYBUtPNhlq3BI0I3FieqF7VTtHHcQg9AsgA80Y5TCX3b0
	lZF0Pk1epQRVkbvlmhPffiLP7KQCpELBBcCSYeBAjPFw7Nf793ROaHgT4yp1gIyFN5JFk8fF/D5
	LoOJlypr2KY3F/s2+pcUNwA4ktCFMn6j6ddd4x8JFh6IkTcHa4cVenDvrZXL9GmuPBbl5fsaEwy
	8/bKoiXBwCC0I3GhbaHcnnJGT7NJSrwVda2TfUccU4s2TJQaimosQGBr0XFzjgf4MDi4yzSIkcb
	iWXdm56bx68KlRpLED/fqoatCTHT9sKzKdci929db7E8X+pHA5UU4o+g==
X-Received: by 2002:a17:90b:1651:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39d9bbf93c5mr20289197a91.2.1789306854833;
        Sun, 13 Sep 2026 06:40:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm15365323a91.13.2026.09.13.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:40:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: cancel reset_hi_res_work on probe failure
Date: Sun, 13 Sep 2026 21:40:44 +0800
Message-ID: <20260913134044.1562697-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidpp_probe() initializes reset_hi_res_work before starting the device.
Once device I/O is started, incoming HID++ events may schedule this work.

If a later probe step fails, the error path stops the hardware and
cancels hidpp->work, but leaves reset_hi_res_work pending. Since hidpp
is devm allocated, it may be freed after probe returns while the work
is still queued, potentially resulting in a use-after-free when the
work handler runs.

Cancel reset_hi_res_work in the probe error path, matching the cleanup
performed by hidpp_remove().

This issue was found by manual code inspection.

Fixes: ed80cc4667ac ("HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1504de32b1c8..6a21b281a1df 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4834,6 +4834,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 	cancel_work_sync(&hidpp->work);
+	cancel_work_sync(&hidpp->reset_hi_res_work);
 	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
-- 
2.43.0

