Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E044A7CAC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636586; cv=none; b=UKt57q3lXlpjwwXLn52RcbtVKCW8tFzCqxMEVsI/QZJzH2T6uD3picn5LXgLodrLZc4B8J656C0w2abzAjlg/lQUPJiiYMH9Q3y9m5q1naBLnIaAGIkt11GwR/ZWO0LcRyCliF1W/6Ao9sLaY1Knj3z8mrX1Bsy9CcoU/xfEV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636586; c=relaxed/simple;
	bh=1kvBvnU1XqG+LB+Mu/IPw77rDx6+TGEn8znDEATvlDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAKP0PrJF2jaaWTlpEUB7yog2HLLpj5ARr2n8/DVvn8UJYuX5XFajW4VozmUuTTX/QW8NrkDHNShmt7qcYy90IPFcNK9h927f6QToI87I5CSoTTzBMOL8porUAoks76XK3/KM5TbsMtbLxhPAIc+qDvg9KP4luitcXq/XK2ik8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoSbUdH4; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoSbUdH4"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1517bda04a0so227910c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791636582; x=1792241382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mthh0Sv1VUOW5+w7XlTGMrRo8ZjYlLW2iXmgZOV9P4Y=;
        b=RoSbUdH4+RXXvTNxJDmJgROevcokfEtlhB+kRQDpI+mDuR9erirySRkE/TvTdTxvMv
         g6ML8zVCrDcUP3LjLYz3g/8GVhBbeWrdDwrhmLZeUVmrfWiI/BQ7Q26qN+dkHkCPm5d2
         Es4AlUBW4zsjfIkwjDIILA0TeyIWk/o6nKGaq1fu8+/bHVhe09Zzlw8BtP63/SLwbvX2
         sGyx1MatHGVAxMMlYGiQR20QBF++ggBoNoW7jG/XtCXuHa9KgYFoZRW1EaXgCMJD9yKB
         e/Q14BIPpq34wFWkxS+bRiscL9OgrORZHjpikBI93v/wiNFj8zxAYVKRZg1VwIoCyYzK
         eOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791636582; x=1792241382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mthh0Sv1VUOW5+w7XlTGMrRo8ZjYlLW2iXmgZOV9P4Y=;
        b=bCtsmTyiMHcfUgBTh3sL6sUEaLidT2YTt5sJQqs+kDH/TMR0cbN7u+zdJBJp24eZog
         mK9OzjB1DwGTxPVF70yrH16hmkiV0zQatuFo4DMMyoN5SX3DMvlXHHT3zrPaIYUIdOQ6
         THwc2FZ3WJdveQb69vYgqExTlEQ8zI8V951ZPkAzqjFg835DWVBtLD8AW/1+wRoVp7aF
         wLELJNIjL38dhxQ3GOPKaCLSKAqjlItDk2AmDqIe5tFy/+I2HVq584+IJlLT8rj1MmAl
         yl70JIgw/Somc3W09+X74n9b/piw/cgqQld5H3g8WaNoP3Ghf0nFHhbzLnt+tEj8rUPB
         Zksw==
X-Forwarded-Encrypted: i=1; AKwUvBy7O9lvwO1NJjR6gSqwwIyvrVkDGflAGz94j3JTCGOqgGhFHiAyjUWTiMSWhMV7k09nhLfJl1g7lCHEytc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPPmHRYhYeX4ijryoKmAyAiAdDrrSNLvPjHMZNnTLLwJ+xbl63
	NWkGV6oWapq5InGSxMPtsByOHpl6+EHpbSJd4W0t+cKQ300mFVNozN0s
X-Gm-Gg: AYBFou1Pn4VSYf+p5Lxl3Z5k5N9KV45rtmvcx4+CzKNy0dwBJvNErHCweBHq/GKoS/i
	SCqgD/tisMw22zsncjr21QuCXAT67N1IF+I2k5CrA2ZjeeiV0MLTs9cG2eZfwfYucYvTEh3H1jQ
	QYUEe8CHkqw3KDPyokiCDoCreQxxAPBl4Jrg6ZfpdjEWi51snSy14AEzdGlq/Cgbc0iVKPiuqIL
	0pvWW+siE/vaj52g3tAooj9IXsN6AF5bis59OGnu6XTYLBZV4PaV4310+UK6PVNCMeghbfLa/Sy
	SeBQTHoeRfizbMqizA0s/bIfYJOZY3zph9MHXlwlBW4zRaIeAgZOxqFFWBMM4vzeF1g1VlM43Mx
	bNTxIIlBQb/ZCrgZwfOgtdDOFDJGCQMVYqNmJhbsC0/+9Zn/4bMfW0n/u4QzIV3jtjq3Vw8vdKf
	AMiHQKtj9ORb/oQ+I9yakv2gpP+fWeUs3cU2AxgNnQefNbFDGvOxj7bbazf6ESEADH3Ite4h4j/
	ZiYb92bjAbCzf2KJfzUkDQrbTk=
X-Received: by 2002:a05:7022:3a81:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-16a5afe51b5mr6320260c88.14.1791636582095;
        Sat, 10 Oct 2026 05:49:42 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c920:95f0:34f7:c1ca:5f91:2fb9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm14204812c88.20.2026.10.10.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:49:41 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rafael@kernel.org
Cc: lenb@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v5] ACPI: video: force native backlight on Dell OptiPlex AIO 7410 35W
Date: Sat, 10 Oct 2026 18:18:30 +0530
Message-ID: <20261010124830.116750-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

The Dell OptiPlex AIO 7410 35W (board 01KP8D) declares DELL0501 in its
ACPI DSDT (status = 0x0F) even though no UART scalar board is physically
present. This causes acpi_video_get_backlight_type() to return
acpi_backlight_dell_uart, which makes i915 skip registering
intel_backlight. The dell-uart-backlight driver then times out talking
to the absent board and the probe fails, leaving the machine with zero
backlight control.

A BIOS update fixes this on some models (e.g. OptiPlex 7420, board
0914RT) by setting DELL0501 _STA to 0, but Dell has not shipped a
corrected BIOS for the 7410 even in the latest release (1.37.0,
2026-05-28).

Add a DMI quirk to force native backlight on this model so that i915
registers intel_backlight and brightness control works out of the box.

Tested on:
  - OptiPlex AIO 7410 35W (01KP8D, BIOS 1.37.0) -- confirmed
    acpi_backlight=native produces working intel_backlight (raw,
    max=96000), DMI quirk has the same effect.
  - OptiPlex AIO 7420 35W (0914RT, BIOS 1.27.0) -- DELL0501 absent in
    updated BIOS, intel_backlight works natively (no regression).

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/acpi/video_detect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index e3b69f876d24..1af14e04e597 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -883,6 +883,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7770 AIO"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Dell OptiPlex AIO 7410 35W */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex AIO 7410 35W"),
+		},
+	},
 
 	/*
 	 * Models which have nvidia-ec-wmi support, but should not use it.
-- 
2.43.0

