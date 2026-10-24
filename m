Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808986;
	b=kng8z866dqwAC3pheboBKXct5J/GeDc3pPs422HVE/QUeMb89kx+ss29u+ql1pOavMYE
	 vFLYHz2uZtPnyeftUJtras4UJRrKP1ZNp5sdIimDp1c01kJIdpNNN4BLHFN5XdZmzZQ21
	 88L3ceOJKkx3WA3XOej5lAJ4i/GNuq2Focr7Jod1Bvoj155Q+nkVjAbIXWIfG/Zu/nHa+
	 XdfrmW0sd3PW/PJi5vW1JqrCoMnMYSXVG9rGUCZh4qhYLRt3s3g8v3fkBIfXpCHTUGnvx
	 nvpVkMqnhQzw5FtTYvC3HaRaJOXzUmrmh4IYLmXoBVmRnuTwxqiDxLIwu/6WBd/tVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v818dsjJiTLRVDVSMrkwVlVa2f76W/AoAfUq24SdAxw=;
	b=s4qTjJ6gbRHYmOXLA8wiuJmiLVHyza8whOwSfBX0KBCy2PCXvxor0BXAu4RSgc9aLE2U
	 tZEWEnE/dNuaJL5u9LCbX+zs6fIaoWu+GPV+ltWhDX6ybjJvSIcfwDAfgPZf21qZ0UInD
	 y5uUBI95JifDL8nwoi7THKY3h4C38T6iakW/YXcDoEYbK5PxkyWgi9t6E56nKxZXXRIsv
	 eLu0Jqd9qYhgr63TiWbSbZuXg3oeC0w9w3AFzXtyZGoTEjFdbnKSOTLxvc6XRycS9q1ml
	 D+MPesBif0AvY09SyNKefzz0o3uWv/8/7IPjj3R8qYL+VA27yZYHZBXQ+qUUB2V04GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=lJ5Tks0A;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36343606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36343606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=lJ5Tks0A
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6749240140
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808982;
	bh=v818dsjJiTLRVDVSMrkwVlVa2f76W/AoAfUq24SdAxw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=lJ5Tks0AYuet+rHv0CrgeqCerTEfhwgyq7HQbwl2nH+agPzTiUePzG7WwoeaPFK2b
	 /bYO4WPXQk0bDJPJ/GLcAU8KiNC+IIQJ2NlEnKzQGxOkpSoWs6NtqASQuNqds+6/AY
	 pg3ENswPnidMov72/QAkshrSTNdKf2OTnCmwdF76EfhcUDHlVh1ARbdXid5051mN+A
	 JoUKVQzOQTZKgb5iWPGyCJykNCAKhBFJRXqYOBUdywDkwg3Fma7iiuw64L2y2Tl29I
	 Ns7JMiYUGomFdpeAgVaDWddmdniAnsMIwv0EJz91raCEmloCed4OCLBomMlfZBWq+z
	 l3em1lewXpbsBF3FF4NdDp99DGAnWhIKLbMNNZj17sN8OkkH3nBl4UD1g5DFHVCvya
	 uiB/oiMcmJMaC/bs2vNLQrcfGKXLdlO43e/EXd1RyI6RsRkdTvYWM5C6kXiJzWjyDu
	 gwpOfIwXdGpMs1c6o+Un/mvO0Z8ykonnUUAV2cyfge94tPnGH1J/TBr91irhoNdZdG
	 osqX6ixc1IYZJNdU/rJ5T/Oj+nfXidoSDg3u0/xVPCN/ZF0KTR4hsFvmd6/kizUAKi
	 Q8gQBTmJiIQsCLt0Xun+XE0sqQb8XLXI8QU5fgObRfOhhINgVwLfWgf2mZy3CTCGdH
	 +1Ov2gDH3GSaF7OKz+FS0Evk=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so348738a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808981; x=1793413781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v818dsjJiTLRVDVSMrkwVlVa2f76W/AoAfUq24SdAxw=;
        b=jOVo095/M5SudrTE6pq3gzPttrQWRCjEkqVL5+zXubffRl9RWC1TyA9jMRpUMmbX6B
         c6fBQyncz8mcBJbR9kbdESwQrRC18tGOmU27Q7SxivRQGbNOmfjs46vt9NBeh9OwPSZG
         RL3Ju7+imrQJyuilGSIyJP4g3uteyzkYg4r+Hb1529c/zYSqd0FiHVQb55renQ+SDZCn
         p2nKvmQ7gA2EB0pzad00wx4b42oSAgWr3WSZspOCkqYfbhxuqZxpgjdpJUfhSOYmZfgP
         H+EaBudUNKdvFw82nuXI3m5f5iYz3e95oOSUOfBAgctXHmaQXLzWc9QuWWmnAPPNOnLl
         bHKg==
X-Gm-Message-State: AFq9FYLQnLMlzhb9K+5UF51UqA8AQ0+0hcPPePVY1xohE0xky5wyERG/
	teu2Yj+GY56CLRwYEcQovfZIOoqqOJ4f+POLh87jwVDujHX5i9C2lbKoIaNXu4XFEm6n6kCBwur
	z/ry4T5G21VvU47AvTJWKMt41Obpk5qJVtO7ga3QO2IxMGpNJwrdHr01uZws0h6wQezRJfwiAnj
	n6eoTl+Q==
X-Gm-Gg: AYBFou2Eu9D/JTTE7F50eN0Yfq0lOkoT2w32MBPWR6T5IkDIbZ0NGSUIn4Fa+XE62eK
	lgWNAbCC/3/I3Av3nIIlnPxALP/TU4azZi1+2/BVBK4FXCjgxW6S09K3jxshJpiZy17GIFyDBiU
	YXYE2BYDQ8ZCTqSotafIRDyrD5WDC9xwV0UqD/YhzLz0b7mY6JkLiVDqJ8l+etx5fqa1OCCVBXl
	mn42X1lsFVw31yV4a7xp8M0TLzcsCdnh0wP3/INUb03ASwGYgqoBD5dhG0tGANJE7ZGepGq0Gae
	sPrmn15ScG7825nomwdhZDcdaT1BG7mOzFntRmZxlW+9+x79B6QLWDHYdJokSK37tRGX8Wjl53m
	2vcFTlOJ+RzwJpjyr1cw3yO0fhT5/jv/9lNGbN6QFAQUMkSPj0phWHTLCE6y1qslBAUYHcfsFgC
	yD2aJcN3L8PmgaEcCqoAwee5lrIOVd+ik8oGaf/V95oabHu+BO8WjS9HUN0HCT0FoRl5nASwHLN
	Z1ToaW/dWn0gEijb76Flh1MhggNBrDNRSXJm71Mpy4=
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr1498311a91.1.1792808980720;
        Fri, 23 Oct 2026 19:29:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr1498293a91.1.1792808980286;
        Fri, 23 Oct 2026 19:29:40 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:39 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v4 0/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 10:29:27 +0800
Message-Id: <20261024022930.2704030-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
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

Driver-created serdev clients without an ACPI companion or device tree
node currently have no modalias and cannot be matched to a driver:
their modalias sysfs read returns -ENODEV and their creators force a
bind with device_driver_attach().

Backlight function on dell-uart-backlight is not affected: that class
device is registered independently and gets its own add uevent. The
user-visible breakage is the failing modalias read on an existing
serdev child -- Checkbox dkms_info_attachment aborts with
"OSError: [Errno 19] No such device".

Resolve the two long-standing serdev-core TODOs by letting the creator
pass a modalias to serdev_device_add() and giving the serdev driver an
id_table, modelled on the SPI bus. ACPI and OF match first and are
unchanged. Convert dell-uart-backlight and the Lenovo Yoga Tab 2 Pro
fastcharger to this path and drop their force-attach workarounds.

Changes in v4:
- Patch 1: drop the dead is_serdev_device() guard from the match
  callback, and dereference serdev once at the top
- Patch 1: drop the "large enough" comment on SERDEV_NAME_SIZE
- Patch 1: in struct serdev_device_driver, place id_table right under
  driver, next to driver->of_match_table and driver->acpi_match_table
- Patch 1: merge serdev_device_set_modalias() into serdev_device_add()
  so the modalias is set at the only point where forgetting it would
  matter; internal firmware callers pass NULL
- All three patches: tightened commit messages and moved the v2/v3
  changelog narrative out of Patch 1 into this cover letter

Changes in v3:
- Rename struct serdev_device::name to ::modalias; dev_name() is
  unchanged
- Model matching on the SPI bus: add struct serdev_device_id and
  id_table; drop driver->name matching
- Add serdev_device_set_modalias() helper and SERDEV_MODULE_PREFIX
- No MODULE_DEVICE_TABLE(serdev, ...) support: both in-tree
  firmware-less clients are created by the same module that provides
  their driver, so udev has nothing to autoload

Changes in v2:
- Instead of silently returning success with no modalias, use a
  creator-supplied name as a "serial:<name>" modalias fallback and as
  the matching key, so clients can bind through normal serdev matching

v3: https://lore.kernel.org/lkml/20261023052717.2577234-1-an.wu@canonical.com/
v2: https://lore.kernel.org/lkml/20261022032842.2492572-1-an.wu@canonical.com/
v1: https://lore.kernel.org/lkml/20261021092124.2306053-1-an.wu@canonical.com/

ChunAn Wu (3):
  serdev: handle devices without an ACPI or device tree node
  platform/x86: dell-uart-backlight: Bind through normal serdev matching
  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through
    normal serdev matching

 MAINTAINERS                                   |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 33 ++++------
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 +++----
 .../platform/x86/x86-android-tablets/core.c   |  2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
 drivers/tty/serdev/core.c                     | 65 ++++++++++++++-----
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 8 files changed, 105 insertions(+), 54 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
--
2.34.1

