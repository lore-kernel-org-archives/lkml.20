Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CB374E79
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371256; cv=none; b=WfmO3EW81PIiDxw+xCHgpH8LbXaXcc+4bUGVpS8LyoXYo5T539/5FUSp2RUws+aHriU6x1uZGiZbhq8ODzyxpYs7DT+pklENdEsAqQfrMicQ8p0DIb6MeN6RmtKsFkyBw3/XSG1f7+LvX0n8VeCJPZuWbtuQ4QSm6lPVMLfV4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371256; c=relaxed/simple;
	bh=RSO5hJPt/u6vxLaap4YM1BOcxseAMLB98i5YdofYKNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyYI4IvjjCcOkMa5fZznFH/YfDlW53tdh0oEJNuHh+56wsnGF3nECSCS0CZJ5jrjiePKs/NoVwXoEp1KF0OII+pKsDsJKPOfYBfBsiLYQoN2UsL473iqY0ZvF9AtcwVVuEznXCaoaBBRlTu9XGZaTjFs693XeCUsKSUPZPt+K/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE8GIO/h; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE8GIO/h"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39266382df6so1256556a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371254; x=1788976054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ajJdf+X/nuYZVAyiO85HtOmnTDxcjy4YZBTuYBU9do=;
        b=EE8GIO/hpF7t8arLp5OxtZ+FzhEp+XhRTET/3yVvZP16Ijd2qExS3LV8fAr8sNm8jV
         GDqaff0BlaJkg0oO6L5XYLL8oQGaEzwB41o6qwOTnYKT8N3YNwsTDyb4wqsIC6FtvoPJ
         JthULVAUnI/oAvG7HSOF8qWD7cSIE6nK6CxOYpbVF6OLIa0RkFj0OAJesjy3yjhmqghc
         9p8h5WoLKUzrtMr3SfVwx+osovE2Tf0/Tj0wDfpQopxTOZV+eW9rbJvqwdHOn0iZnEe/
         S/s0GdMAh7BPzXFXz9cPCouC2fUZavvnmCoow84gM5YV9eOpVO6Oqo4fpNa7stC/UmLP
         Q+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371254; x=1788976054;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ajJdf+X/nuYZVAyiO85HtOmnTDxcjy4YZBTuYBU9do=;
        b=JHoGL8s0OciVACFZ9fokykM4idHvbE9cNamWm7cc8ohMDRt/GtD15rA+eH6a5xWQrZ
         RRteaNv+0zah4jihhohKxGiz1iQ+10ApCvkR1zDNXnJVCHZQrAT0MTgxT+mmCzoBSJ+w
         LWlqJ/gXrj44np+c8qPa26kQySX3BkSFaIPo14ZjUKuV6mh+m8tm7Iv9r9ke7YMxzI3H
         LsqnH2/dzIiFeqaXugGyl2L/GaUhNKI67z1oUKrqnyEMPH/6AY+yZKFxcJXVSbvxtYxM
         PYV9j1TCaxz5zPyNZzSQBAWBpi6s7Ps5UvtdSrTTGvbB2VeMcEcC9z2zF22ePlPwtz4k
         hxCg==
X-Gm-Message-State: AFuF++kvRi8SMqsiB3viQ3NWPfr4IOb/KHFVYlcnSt/JqwcWBK252jKF
	HH7ZWfksvO7EQQiJAyxg0v2uiM+WH/W5U9AI/GITZnFAL5+gG1GQ+UEl
X-Gm-Gg: AYBFou3/wjW590HRrTNXP2dDLZe6n8aR4ABu0CSRWLA5+6k04YpHnafSgnIwhXwfZhC
	TFvrVuTplHm5ptUM1GhnlQWeX4VVu5nD6yyYJy2OiQfETKYurEMOejvp9eoCSG3F4hJt7w0XTve
	Nw/hhQ25UwwBjxoCEX4vyTKyxFX2I68dmIqFaNHQXoIrW4NlD51U4o7g1g79e12JHPin4+DzWFh
	4isEf/QrWRMrO+4xfoz1EECFcscuTFJH046b5DmoeNlcVM7QwkOgGanWofM9bGCku4EE8Nj8FPb
	u3zlrDlulx2/t9J+nFod3l2shaX7dZHY/y9jNZQ2el2+7nVUvE8aOoX1fjbL8cZ+Ix+U+Yqhuuh
	gdb7M7vN7QKYHlk6e1+b4S767YdbCzptQOeFtzl6mcxu9a3rjZVYOyoTWGLn5owkIbsVHEKaXx5
	XhH3gbyq99wGfJHWC89P5/9+IWRvM8X+7Zn5aGv+7q1X84GyoyMFTFe8D4u5woQGIYYr+j6/BMT
	7CYng==
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr9248404a91.12.1788371254420;
        Wed, 02 Sep 2026 10:47:34 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:33 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: asus-wmi: fix FA401 series keyboard sleep strobe
Date: Thu,  3 Sep 2026 00:47:15 +0700
Message-ID: <20260902174718.16228-1-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes the keyboard sleep strobe effect on ASUS TUF Gaming
FA401 (A14) series laptops and refactors the TUF RGB state/mode
interface.

The FA401 does not report the TUF RGB state WMI device (0x00100057) via
standard DSTS probing, yet the EC supports the state flags required for
the sleep strobe animation. In addition, Modern Standby (S0ix/s2idle)
entry requires re-asserting the keyboard backlight and power state at
LPS0 prepare time because display servers and DRM drivers blank the
backlight to 0 prior to sleep.

Changes in v3:
- Split the series into 3 patches: preparatory bitmask cleanup, FA401
  DMI quirk, and S0ix sleep re-assertion (per Ilpo Järvinen).
- Use FIELD_PREP() and named GENMASK() definitions consistently
  (per Ilpo Järvinen).
- Address Denis Benato's feedback regarding userspace policy:
  * Check the TUF_RGB_STATE_SLEEP flag so the kernel honors any user
    decision to disable sleep LEDs.
  * Dynamically track the user's active brightness level
    (kbd_led_last_level) so the sleep strobe preserves dim/bright
    preferences rather than forcing max brightness.
- Hook into ACPI LPS0 s2idle dev ops (.prepare): ensures brightness and
  state are re-asserted after the display server and DRM drivers blank
  the screen, immediately prior to S0ix entry.
Link: https://lore.kernel.org/platform-driver-x86/20260902032353.16106-1-idotohors@gmail.com/ # v2

Idotoho Reimon Simanjuntak (3):
  platform/x86: asus-wmi: use named masks for TUF RGB commands
  platform/x86: asus-wmi: enable TUF RGB state for FA401 via DMI quirk
  platform/x86: asus-wmi: re-assert FA401 keyboard state before S0ix

 drivers/platform/x86/asus-nb-wmi.c |  13 ++++
 drivers/platform/x86/asus-wmi.c    | 120 +++++++++++++++++++++++++----
 drivers/platform/x86/asus-wmi.h    |   1 +
 3 files changed, 118 insertions(+), 16 deletions(-)

-- 
2.55.0

