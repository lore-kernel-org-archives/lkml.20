Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501220;
	b=ugAtf4nsN2lCeJLpoLwb1QXNpotMtimToQkMS8BRtRI01eWgcvRltVVDGAhbpsbrP1PT
	 dPdkxFmJGitNtezTkoJ7/jVkR+ecW1hlUE1xeB8XtscqkcsuoymzPsiHHWUCjv7n18hTR
	 oIDdw7vIsuQTNVxnc8qqNz+EsyL4JskyucmYDXD/FvSZhbDxtbpnBkxd8dWYGpFalhjuk
	 iF8rUvoXIxHLpBNH2HULYI8UrFXq0+lgofwGdIKcIBguszCR8ATl2LVRmoZSEXOsyJ9aG
	 T3TcJnx3kNZ7cVlNg714u/Sn88ug8nn6bgSoerVKGlqDg+LfOmn+LVNxl2IbQRYuP/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
	b=tZM22HAk9iFRiUtLttqGPxyLRk4SysYnHL6OAiF7hVoHKa7CtotcfNwtMEt9BNTzmt8+
	 MjBGfQys8LsfVJuqbko19LQiI9qe0zv9DnGMF8bit08DSnHbUJ0XeswXWXWN9wfAfO7K5
	 vQILYarCcvG7Wv91xZt+yWFydE+dWn/ppoSxmZAtA0VvKEk/ME0Q0/RkMn5/6e+GbWeO0
	 qazR6ZF/G7r8BVATv8idydM73HrZJ0M7wPrZNhTAF70sf29WdEes19tqXNr5Cu6/rj3Hm
	 sDdJmoNkVbp6jNIztn7wpouUPGKHE8rMH6BDLTO7NVyp1aK2YjSOngDMJmOyMRe/TMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOOolabN;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311460A382C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B311460A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOOolabN
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4481962c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501219; x=1795106019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=bOOolabNHffCQAuwLQ0DkkrmI/0xfrlO3ZGMi4uEqUSA/ruC8Kgzg3IfqETXANiCSc
         nE5XTUMOGB8+pm3D1vOJLl2dghi+dV6+Vf8rRysaZFAcqdtvPVkoe6QXZX87YeIv7qG7
         lfylAT9DyUHn+4Eh7Ynj4HzZCeDttzszv+l+bobVFsJjNhRSkAE3y5pQNLVCbqsXZfvX
         0sFEpdUsLOmCJy7pb/Wb5YJ0zdceVdrQpVM+F7Q5aHZisnn6mlBxmXh9varoskvH9SSU
         ko83HninfW0bnflBqx4NP0nlDvUvEjXEhUVdASmv8xP0a8g+0Ska9Eos+DzE6V4AAGlQ
         ELAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501219; x=1795106019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=FsT3vpsnzsbtipbrpajHn3PgRBR8rK381rerktgI/mlxU7B9gm/O5cY+tb23c/IBjW
         TiKjh9d4vZwxSMVgsVaYUaOBvkTxOtOVncV3Gt5fKxyWgz3eWnSHN2iKrJcuNzUZ75eA
         wp1TLmPy7tEkVpDYLrbI5JAGrUrOY8rFONO6Mh1RieeKKHHYGIv3QR1A+80n1c8IovYi
         iBYSPfNBty69yw6N8zvrCjOr9YtLa3fomvGfb+nhcP0AAXHxFDGK6GvheLT2FRxx1IEj
         VFdYkgCcqrvMHya8lV5qtCB7AdWXYw2PkKuV9jkwqG5T8565Q5UgpfxHew/76wY5WIh9
         v4mw==
X-Forwarded-Encrypted: i=1; AL+hErGCymyRFlbsa1hg9GjZZaeP+3OiogXgpcJx9AenXSip8Aeh+jpqX4jgAoDzp14i5oarCgxglgC5QWOIgRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h6sjAXiFzcH18d8GOKz2YZbUmQRL4rFMmKrkHrfWcYDwX2yDV
	fAfedoMxCmz+GQHAkpJX43N5A8dc+rMMHJiz2fqKOlxRGY35MwZKZmHf
X-Gm-Gg: AYBFou1vBVL2SmdNc+jU8+rprESUBdv5nz3R8agNNSHXdjaQl7PoDZk5iZ7zdZhKBFm
	esSZrJPeVZGn8oGZD6FiO9qKuvvDlWIEUfVddr2lp2Ov9tPJIUJUvhgUBHoYzJjSlwLxYNkxrqd
	qnDDHnliX4Qh2XCI8Jk5NVP6gyFnaxbDfkNd9V2rKCoVmeULxuCLat7QJ6XPfhfBnsv4OUTrhyZ
	QZr4Z9o8Y26uejVolQsc79LRKDxcWpl4Qktr1Hds9BzNZ2NskBy1Owpux4EVDsPVs8YVe4i+rN5
	fWgAMWb6wVGMBltqP6w8wNfOj6lOBc83BsA6MX0doo/k4C8JZTVzUraS7X65YkhtKqKX5u1g+Li
	IqWUM5XtVpldwYzieI1l2IW/hlbAje4/YMvXaoxrRQqUacqZeO7HsQIRorJFSFzsctGNOmD+g+0
	nPB4AchNFLXafSbb33YHzeiXvyc7d06RtGDlhMrT75v5PREmLcuh4pcbnQuVX9cGYu7yT+MtPDS
	Z6N64M98PWBrgnePvR8y9J5xflu+c3PpGpFvfARlok/Pv+/3VUHCM8PquIqqSXAcvCA18JmS2b8
	p4ZmRCjxBxN7dKrGkLj7ntgaSGZDsYEXdkOf7NWlKUpD06rXGOi1/eA37pKLNSt+plkICXFxAtW
	At5/mmS8wMWfDU8gK4WrH/2n6+o0WZDqZ204JThnV1QA6Jnthj+NN6480gZXtJDuw++lHNWxm
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr70385c88.8.1794501218632;
        Thu, 12 Nov 2026 08:33:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:37 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Simek <michal.simek@amd.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/3] ptp: ocp: support the WiWi production Time Card
Date: Thu, 12 Nov 2026 08:33:29 -0800
Message-ID: <20261112163333.12523-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The WiWi Time Card (2163:1008, subsystem 10ee:0007) uses a
Celestica-compatible register map behind LitePCIe. Its bridge does not
support the subword MMIO used by the XIIC driver. Add an opt-in word
access mode, exercise both modes with KUnit, and enable ptp_ocp on the
revision 02 interface. Other cards retain their existing access modes.
The series does not enable WiWi flash updates or change LED policy.

Patch 3 uses the platform-data field from patch 1. Could the I2C
maintainers review patches 1 and 2 for an Ack to take the series
through net-next?

Changes since v1:
 - 1/3: Drop five explicit inline annotations in the C file and
   shorten the platform-data comment. No access semantics change.
 - 2/3: Wrap the offsets and expectations flagged by checkpatch.
   The four test modes, register offsets and expected values are unchanged.
 - 3/3: Follow NetTimeLogic's PCI revision convention. Replace the exact
   image ID and per-core version checks with a revision 02 gate. Reject
   unknown revisions before FPGA MMIO and retain the BAR/MSI-X checks.
   Report the full build ID in devlink; select capabilities by interface
   revision. Update the documentation and wrap overlength lines.

The revision 02 driver was tested on a physical card running build
0x0000800f under Secure Boot. It bound with 64 MSI-X vectors; the PHC
advanced 3.000441080 s over three one-second sleeps. SPI NOR and both
EEPROM clients bound. The PHC was UNSYNCED at probe; this test does not
establish PPS lock or valid UTC. Only that firmware build was tested on
hardware. Subsequent edits to the tested drivers remove inline hints or
change formatting and comments.

On the rebased v2, the XIIC and ptp_ocp objects built on x86-64 with
W=1 under allmodconfig and allyesconfig. Four XIIC KUnit cases passed
in an isolated x86-64 QEMU boot. Fixtures exercised all 256 PCI
revisions, bad PCI layouts and multiple image IDs. These are not
additional hardware tests. No full allmodconfig or allyesconfig build
is claimed for v2.

Codex assisted with the changes, tests and changelogs using the board
layout, machine-check evidence, vendor revision rule and v1 CI reports.

v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  36 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  14 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++++++
 drivers/ptp/ptp_ocp.c                        | 163 ++++++++++++++++++-
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 341 insertions(+), 27 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219
