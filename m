Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530015;
	b=KZQBEITDvJQkriyal6HTKhbwKmGI3Jm67BV7IQHmQ7zfDCut5T/nD7u8NvE/4ebWqC/8
	 0/W1ZvBhcPAWWy1U9pUUCs0sGCIVGAzaBhNu7ENqAZEA+NrvwCkUCYU1Mm5rsWdzAJthr
	 Yx2neV76KorzEea9TUqK9XUcjJMvoA0UlsWJgMdtl95MM/aDZIsKTXALDL/vyoon8h4Oy
	 g6yRvB/U3lAk2TQ2pdgTb0TlXXib2wmg18P73fcurEj0cUDKXk14CmY+EzpbyfnyyxERl
	 GY5rnQTfIIg3y8SgYbYuxOthTsAxJpKeoc2Ixmg2VDn3deSOsV0Oq+DqbMaHul3Xv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=7Sa7EuzODPgC5bkSmwziiOqJ7XjyGe4GIlwE6PhFhCg=;
	b=cp7l4KEMV7Tv3QjrtasMnhbMY+1/+8F+syTqA1QTSvw8JYqnDCrmDlmE+ssrciZ7QrvF
	 vdiAd6/Dzv/ryGHLHs02cMadBKePGTjVJXd1UYMwIqVSn+VbB5Zhhjfb1VuvotmrcSqvu
	 wyT+BAaHi7x0aWDJuAENDP9gcGDNJhvKjarPTbaMS0vA4UN6fh4ybSQ3nQ0koIXe/Tw0y
	 p0KbnPd1H8WFARRsE184eOL1wRh28Y/IE1uTQ5JiMcp/PgUf4r27BQFBgRlm/am05DYrI
	 qhyat2MFWMSzZp0pJJCVki7pmBboDj8LB6xYxy+V4xw/J+kVAJ2VfjuFaTgegvzKphA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMM0swZT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261E606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4261E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMM0swZT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12977905e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530013; x=1794134813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Sa7EuzODPgC5bkSmwziiOqJ7XjyGe4GIlwE6PhFhCg=;
        b=VMM0swZThh3i7/Qr5Rr7qet/lk7hp4aqptKFJUOM64NMsr3WH19czfsDAi0RNCclvt
         2SiTW9YiZ54vAZCfcPUUIhaWdw+uGavPD9WyyK3FTnbzx+zMQfw6TGfrSPNUW7VwkMc+
         y4napnk7iFsF9rmb8RwANkSyJlJUyiMniBFq4atNVVkJP0Hy+VA/VKyNeYcPxk/aQLWn
         K9irpt74R+RfA6OZI3+nIm44F7TsgAdwhwJ8rW3gvEt93/HtyYHJHqnnIkNoKXlwUNqb
         0BFU4KnqUhD/pqw+bTkZwzMBLdjwarxn8HYdIiCoVMmhGiPLHSmmKolvKx3pdnzGY5fB
         S6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530013; x=1794134813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Sa7EuzODPgC5bkSmwziiOqJ7XjyGe4GIlwE6PhFhCg=;
        b=Ly2Gv7ToK1HPUsWY0N5tZSkihokUjNiFXiKvBjnkQ/2rVNDqgo+/mqlG1LwCcKnbcZ
         C7fHVqkQs3GNrMiN0BrjTEu3XglaNcaE4od1M/G82/bq27YIBEtC4p0J54RsykW6Zo46
         a/93SIHVIy/8tVObW3rM/i7fLc6NE1xrfaNlWHr3rHQbb+N+n5jEF5cWCAGaxPsok90r
         vziMp454qksuWOZgygAXICCTW040/5SgcqMuZ4EF0Z+jPaVpyA3kRLbKNSfzrnzJJDy3
         pOWx0qq0fQCpKiEWf+d3VDUg0iGG3URWXY3ds+s6nfxXfdoZomzj7UN/aIReDnOjXgZR
         5RoA==
X-Forwarded-Encrypted: i=1; AKwUvBxwHP2EUo8Q7u5l9PyKy/bRb1iXQQT9UrvEWzmPZE1xDk3JOfM4fHZqz4aWrJwz16OXfRpcykUbrIOqKZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtNjlsAiw3NEFTppl/eZHKvemeK0aWoU3k51i0+97kEBOAJz2p
	zLZmsysSXHh4Ge6vGj3JdE7mr5IM7VzIw3emkJGpgQl+Bdlek7NGujiT
X-Gm-Gg: AYBFou3koL+7aY3XFxYmwf/LA5pswl9LSNO8f+pMXRUCTUj16BbWedinbIIyGvOFwlB
	TE59vBn2LMQ4PQ/GqhUpbmSY9R2X9pcPk3EPlqVSTG2P5pY7EGLHXXF3FqrnoWLW7EMUFsJ7d74
	D8gxwW2TYJNDlLvIZX7Z4KIU7q3RH5Qn3RVXr7McaELYmV6Wy3Bsp5fcmRD0X5/Sog12xGnTDze
	W8IoiKVDX6u4Cnn7EYJ3WUUjSp0e9heCj7PFPAcNXBbrJwTFpM98mbGun/7oe5XwnvUIYxDTX1I
	adFLGVc4KYGCVe8w/44uhF1EiIcxKg3hVJP5TS0eylxeXp+OMi0fOFQYPgNPY/RxhZCLE7dAQUj
	zMbtFmopWoKegdqnhaYhOLH5DpHVNMJwyBilAV5kDNvjV3RgVuyGhhfZlofx8+Fhq4+bkhFq/Fx
	Ed0NQ6ZP1manIJuLzaju5dp7FX8Ywd3YFb5pRAyUMFs0cqDE3UP+IiJxZxNOrk6o91SR7OOOmiH
	xnr3FrFoaEo8IAIeYiFtqTux8Ym/9bhzyHpASEihVThBvmeZUGgTCk4Rigl+q6cxJxZLK9590HD
	LLq91QnFTEpCA6NDVK6JsbzmDRM=
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr168066175e9.19.1793530013583;
        Sun, 01 Nov 2026 02:46:53 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:46:52 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH 0/7] platform/x86: asus-wmi: expose the firmware fan floor
 tables
Date: Sun, 01 Nov 2026 13:46:40 +0300
Message-Id: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoi0jnq4iHdCYuQ1pp3BiMv
 fuqHr/D/29gXJUNrt0GlRc1LbnBnzoYRspPRn00Q3Dh4r3zSDYbCmWUVynVcDljoERRJLoUe2j
 hu7Lo+pve7n/bnCYePt8T7PsB8eGWSnYAAAA=
X-Change-ID: 20261101-asus-fan-floors-v4-2aba8ff80b89
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

On some ASUS laptops, the embedded controller enforces minimum fan duties
on custom fan curves (CPU, GPU, and mid fan where present). These limits
are not exposed in curve tables or standard devstate queries. Because the
EC applies max(curve, floor) on each thermal tick, a curve requesting 10%
on a point with a 58% floor runs at 58%, while pwmY_auto_pointZ_pwm still
reports 10%. The thresholds share a similar asymmetry: reads return the
uploaded byte, but the EC clamps the value to the point's temperature
decade before use.

Because firmware never writes enforced floors into the reported curve
buffers, userspace curve utilities like asusctl cannot display
unreachable duty ranges or explain why fans run faster than configured.
This series exposes the firmware floor tables through read-only sysfs
attributes so userspace can inspect the enforced limits.

Hardware analysis:

 - Reverse engineering the FA507 EC firmware shows that duty[i] =
   max(curve[i], floor[i]) is computed on each thermal tick. Point Z
   (1-based) is constrained to the temperature decade [30 + 10 * (Z - 1),
   39 + 10 * (Z - 1)] °C, downward transitions use 5 °C hysteresis, points
   step without interpolation, and thresholds outside the decade are
   clamped on write.

 - Live devmem and DSTS captures on an FA507NV confirm these floor tables:
   CPU {0, 0, 0, 0, 25, 48, 58, 74}% and GPU {0, 0, 0, 0, 26, 57, 68,
   91}%.

 - The read path matches the G614PR DSDT DSFL method, which returns 8
   bytes via the mailbox. Values and band layouts for that family are not
   yet confirmed on hardware. The driver rejects replies shorter than 8
   bytes or containing values above 100%, and warns once if entries
   decrease.

Design notes:

 - Floor attributes are non-standard hwmon extensions: they add a
   read-only, hardware-enforced minimum to the pwmY_auto_pointZ_* family.

 - The series does not clamp user uploads in software. The EC already
   enforces the floor in hardware, and keeping the write path pass-through
   ensures user-configured curves are not rewritten if firmware table
   parsing encounters quirks.

 - Tables refresh after profile changes and curve resets because the EC
   re-runs its defaults reload when the mode byte it keys on changes,
   which a power profile switch can do. On the FA507, floor values
   remain identical across profiles, so this refresh is precautionary for
   other hardware families.

Pre-existing issues noted during development (can be addressed in a
separate series):
 - asus_wmi_evaluate_method_buf() dereferences the return object without a
   NULL check.
 - asus_wmi_remove() frees driver data while the devm-managed hwmon device
   remains accessible.
 - fan_curve_store() updates curves without serializing against
   fan_curve_write().

Questions:

 1. Hardware verification: captures from ROG Zephyrus, ROG Strix, Ally
    or other DSFL-family hardware would confirm values and band layouts
    there. With patch 1 applied:

        echo 0x00110026 > /sys/kernel/debug/asus-nb-wmi/dev_id
        cat /sys/kernel/debug/asus-nb-wmi/dsts

    On a stock kernel, the same reply can be captured with the
    out of tree acpi_call module by evaluating \_SB.ATKD.WMNB with
    method id 0x53545344 and the devid in the argument buffer. Any
    report would be very welcome.

 2. Patch 7 reports effective duty max(stored, floor) on enabled curves.
    Userspace could compute this from the floor attributes;
    is handling this in the driver preferred? or userspace(asusctl)?

 3. Registration API: floor attributes are added to the existing
    asus_custom_fan_curve device via devm_hwmon_device_register_with_groups(),
    matching existing auto_point attributes. The with_info API has no
    auto_point channel, while hwmon.h marks with_groups deprecated.
    Is extending the current group acceptable, or would you prefer
    converting the device to with_info with auto_point attributes carried
    in extra_groups?

 4. Naming: new attributes use pwmY_auto_pointZ_floor_pwm, inserting a
    _floor_ infix into the standard name. Is this naming acceptable?

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (7):
      platform/x86: asus-wmi: dump buffer replies in the debugfs dsts file
      Documentation: ABI: document the ASUS custom fan curve attributes
      platform/x86: asus-wmi: define the fan floor table DEVIDs
      platform/x86: asus-wmi: read the firmware fan floor tables
      platform/x86: asus-wmi: reject short fan curve replies
      platform/x86: asus-wmi: expose the fan floor tables via hwmon
      platform/x86: asus-wmi: show the effective duty for enabled curves

 Documentation/ABI/testing/sysfs-platform-asus-wmi |  96 ++++++
 drivers/platform/x86/asus-wmi.c                   | 390 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h        |   3 +
 3 files changed, 473 insertions(+), 16 deletions(-)
---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261101-asus-fan-floors-v4-2aba8ff80b89

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

