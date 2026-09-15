Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B22E737F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430520; cv=none; b=cNTqj5VmJS8xSK0riFOyD9mWEkOCnLEhlQv766LUEWo9Hj4GmWE/8tdgOGjzkbDy9p3jEq54rtBK4P2rZBZbS+VYvAaUEg2v/tovhfnKbbGW4Z1Y+lLhd2IR0BiTKr+mamgmOX23LPCO5Uv/VxgyT76Bs+D/kYHXg8+/AzKnlB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430520; c=relaxed/simple;
	bh=cCK5QtljhNwwltZ3gjweK3kol/149Oy3L0Nfhf3Vk4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMlpYl5ec88pqpGu2TNMdI/9LScDTxSTmNTumXnSCKwK+geJArJy14jmvyWOdLa0PhdF7h4FjHzcLT54WmY62vZyx+OH7RW/k41LpAsvpUTxC6FvwI5A/KkosY3hX4Ps2bd1o0FrXILPZy1Hj/yhT5nG01TJM7pmYJOEA+ssGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNk5wgjI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNk5wgjI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso21228755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789430517; x=1790035317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45XCm1gWXVXPQxvqd7V6pmmwz0pMn952uodMWyHXxOg=;
        b=qNk5wgjI3pUMSnpjyaOCOvW5O+ezNYZK9t13OHg5LRsb0B6fxGQkbzjyUJhMWdzT0k
         /RVRtHCL3jAeF0M3HNAhVGSNhR/LerPIN+yTTRkJzeJEW5Pq9V481N3vLqshD/gQ4Uwk
         0TgOdUIHBbEWIXJSp+ToFXToDGVmglY2wsCKOsiKn0YBrCfo+720KGt/l1m6yMxKl00E
         L6hpZe88qwDXu1B/ZYbhXvPNZEMFPtlRRdB7UgBvAwd3BCATaiG86UByQukv4R/2MlwK
         4xnOze4rAn8zvJbSICr1bGcBjT1LomZq2T4LJxQkbEJxVzkTnu1ojGgrVaeR99IfgtPN
         GrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789430517; x=1790035317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45XCm1gWXVXPQxvqd7V6pmmwz0pMn952uodMWyHXxOg=;
        b=u6JYwHCFeEsF6oFKBdL7x1xHvbDXA2eWG6w8Dqg982bgrT1soDG4wkGhdlhHpt1A/w
         tChN2ANwFJZqjk5aIIMmuSbEfRbEbnMNll5HUJIC0jXTPzOeWbPxMIuSejt9T33ObqQG
         gWs4bUQjbYEEsT9cl1HwrFOHjBZiRoF8xFrMUFHmQAMDjJ0/uI5+YYK9TbPB6yMbNMxQ
         zG0+Ljd+7EPiB8BPvkxfhpQYZ2lyWBc+kbwbLu8F9ZX2kE6kY0qtQe7VPIWU3INecH3b
         itxA/d2coA0xF/7w6OKp0Us/+OL+Y/Tec3KUA4xR6zkEMmB1vKcTK4UUZogev7/upnpn
         Udvw==
X-Forwarded-Encrypted: i=1; AKwUvBwwWcCrfS1kY/UbB6Nt5y0k7yigWstARb0WqvpnNX+fxQUu4+De59ThxchowqDa85D5mexBWHiWeSmWVvk=@vger.kernel.org
X-Gm-Message-State: AFuF++lzlEx5X8AdbCxVVgxywrSyTiOTOayAbT37VJpSUsziZzAvReF2
	YT8mEBBQp+pQRSFvqKvY5KWk8S5C2eV3+tniL/l++SZtfqtd4XigYo36
X-Gm-Gg: AYBFou2lm6ToNmH4DUAySM9JBrLZ6ZGocJ4K920w8pV0qLb0CuG5B82JXvRuDS82ipy
	MC0GcR0xh6e7kgHKMtNXHj+FDOCgFHfp/bDnh1pufrYtuWizqTO+3ul31Ns5i4pmKaKE1ZXzi9P
	1ElDmskQ3LZZAMUtp8a2SiWM94L04f+Bvzo5cDDmccTrz4YFvo+rXissOutUrJ0GcJLoE/T3a25
	H9avOUAOMIyKe9EvvssxYeNWtXXvG24aq1KGpVQoGAGHm36skqtRf8TVy9ybVzOW5w0hWc5e6O3
	8Gv9N89lSosirlkxKf5F38w13Kw6p7ezjzFD4Iv2GHOFuvEQ2Vi6uNG+sC1kixr6PKg8v2T77m9
	sA6duNwIGiwlhB7fjBBwgIVWQqICJ7dAdIQYdwfqp5HziBkrR2sEwZmYFKgKEo0HbfnZD94NcJs
	Jm4IuLp9bxbgq8S8p4wvWrziGi82M8WXKiuBN4xv6KYQfXBtygqL/BqmJmJ+8z0XCbzLS9yBpfH
	TNKR5C2dgkTzzVR98YzsocjHf40r6QD
X-Received: by 2002:a5d:64ce:0:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-48702b3ce87mr11660766f8f.28.1789430516532;
        Mon, 14 Sep 2026 17:01:56 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm29896602f8f.2.2026.09.14.17.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:01:56 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	lsa.uz@pm.me,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor quirks for the Surface Pro 9
Date: Tue, 15 Sep 2026 01:01:40 +0100
Message-ID: <20260915000140.47125-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Microsoft Surface Pro 9 mounts both its front sensor (OVTI5693) and
its rear one (OVTID858) rotated 180 degrees, and its SSDB reports 0 for
each, so frames from either arrive inverted with nothing to say so.

Add both to upside_down_sensor_dmi_ids. The two entries carry identical
DMI matches and differ only in the ACPI HID they gate on, which works
because ipu_bridge_parse_rotation() walks every matching DMI entry rather
than stopping at the first one.

Measured on a Surface Pro 9, DMI product SKU Surface_Pro_9_2038, IPU6
Alder Lake-P 8086:465d, where the inversion of both sensors was confirmed
visually. Matched on DMI_PRODUCT_NAME as the rest of the table is, rather
than on the narrower SKU: the entries only take effect when the ACPI HID
matches too, so a variant of the same model that shipped different
sensors is left alone.

This makes the kernel report the mounting truthfully and does no more
than that. Nothing in the bridge rotates pixels, so an application that
reads the property can turn the image the right way up while one that
ignores it still shows it inverted.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
Applies to media/next as it stands today.

Two notes for whoever sequences this against Sergey Lebedev's Surface Pro 11
entry, which is in flight for the same table:

  https://lore.kernel.org/linux-media/20260913153526.80287-1-lsa.uz@pm.me/

Both his entry and mine go in immediately before the terminating entry, so
whichever is applied second needs a one-line context fix. Nothing else in the
two overlaps: different machines, different HIDs.

Separately, and only because it would be a shame for it to be dropped
silently: his version as posted does not apply to the current tip. Its hunk
context ends at the Samsung Galaxy Book5 Pro 360 entry (OVTI02E1), while the
table now ends with the Book3 Ultra (960XFH, OVTI02C1), so his base predates
that entry. A rebase is all it needs.

I have not touched the Surface Pro 9 rear sensor's own bridge entry here.
That is Sergey's patch, which I tested separately:

  https://lore.kernel.org/linux-media/20260913142034.5632-1-lsa.uz@pm.me/

 drivers/media/pci/intel/ipu-bridge.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 952868a..f286881 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -226,6 +226,22 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		/* Microsoft Surface Pro 9, front sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 9"),
+		},
+		.driver_data = "OVTI5693",
+	},
+	{
+		/* Microsoft Surface Pro 9, rear sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 9"),
+		},
+		.driver_data = "OVTID858",
+	},
 	{} /* Terminating entry */
 };
 
