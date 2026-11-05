Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911101;
	b=plLap8KvEbulPY7KR+7MsmHcYuTboqYXE9O+8ixkadmt0YZd6mwOi38O7+qerIQk/Whv
	 NlMOT0OPfrg/7lwFl4ZWvOjd1550wb8nUA60LXHJNqYWGhkZGNRBrMo3ozaRZ/T1clJaH
	 Dr7R9UDoHnJT5DNo1OiUGtebG3FAv/YciI3sCk/Jl0PVoR8CNTKj5E9/CV+iq3U2Y5jMc
	 EoO1mm4W4shq/remnrYZ8TahnyBUGhGffEkI3elGQNPGOfrj8AdSqAybWOMAkiFCoyT/p
	 bF5JmTdjKUwUKOHt33AEfqSbU86gaVMRqzsSSbIcUd3q4Gk5sI915jeOZ01FtfSgYeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=;
	b=YLFp3NtPicfXLWE5Dm6HoU2OCbd+F4LrUw2D+fhv9kZs2vk/rHyjdOOBjDeQH9tYLG0b
	 ljzaoETkmQNqEF3kGAaQynwFeRwXGvcxQK/Q/u8bhYsm0QpfAZkHnKaMKlLra3By+NkUp
	 fc7ghjiFvB8PHA5U+rLPWUlRpmpZyOTS2kVnmHKk1wJuPSa+YUD5zffAhwn8+6SpvOBmH
	 qUJdDPBkUACDy1SRwLQZFJQmMnaN34fIoK3eOgMNv3DJ6LiPXR6xrdVKYjEFAMvXUVPW3
	 GQYQBx1KfjhsrEA/elPR0KJwaep9NC3rRW5/BYMJQYopG45nQKfrDuhMee+25wK1LMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAjnHiLN;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2930606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2930606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAjnHiLN
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3021216a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911099; x=1794515899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=;
        b=oAjnHiLNl/jJ/BLax+ZQJIFgYN2/AH7dTV/8P1AdG4udr0g2rP7BE5JsAjsRLgwruA
         KW6LRstkZkvKfbtipjJQ++XfefKQYzAGBBsIUIC1xwe5OC9W5p4HxhhMvSmItkAT8JtJ
         QTqjj51ey/ojFLNd8jVa5SvtlaRCTbpagh1/1yW/X9OcY9pFXtG/JGlwYcvsNgLpAZlV
         LRWd6G2oUGZNzPl6cFUx86YajKKvF7y3xCrzNqm3lUz5rEATdH20xcc5IxoBJxYFWWxY
         mgOLz55m9eY1PJRPV9ZPzrz134QNju18CRSogEyRCicXFhFlZFp2yBpNPZvsiUYW15JS
         1QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911099; x=1794515899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=;
        b=b3uuvrhPt98OchqxIQfzxhF34PAS89ZooNWnudKFpegbLXipet6wPAw3UC4oR0R+Ix
         rp9JtCxFIeQw7B20GGjBskBICeHut8IiEGCqvjfQkktOGo83safcpcLIWfk5UGVVjGEh
         JEWKKsyg/9X0j/fVtce7M688/9HGeRGmlDktg4C3VnGtgjXBE2vV/2cIhF/wr+c3S29t
         hQ5QEXFaE3n+iI2N2E9gSJb7itDNzUSpl2z1oA5duU/4M8l39fQPy1nuyOcbCrvUD2RH
         vLR4hnU1I3PsVgFXCL2/NXpopbEeXzabVl1EUuS8IYNqnv2gUTOSlGgeOPJTUdfsxrh0
         FCjQ==
X-Forwarded-Encrypted: i=1; AKwUvByLrTaaIWKlQY+mW0ZjfIM3Mu5oHPD9/Z4NzpTjE0gPl4D+HuDMzjgu3+tlybBDxaRiOqmFo954VicbLNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DWy2JclEKs8sTbjjuBCN4C/CiVVqiwzYqIIEmpExprGDti+na
	R4rKND4YXrz4Islj2u1Eq695RKs+vxRsInGIiITi31+FLr83+NBY6vRa
X-Gm-Gg: AYBFou2E2ZzWv8D8o3fp5iJe0Pa7NNcoBEyBDOWtrfNIF2TuIfShMUw02HjkY1UG2Wd
	BP5hY/8JFDrGGZhSaaYip1U0lvDvVlT3y4fVUeDEHRmnJFs0jimKJKEYn11MbfFXSH5Osv0iH0W
	RJ7JAmm2WBh3b2wepTEgAbTdHPOuc8E651c2U+Jsv7PrdUhYc/ZWlAXvIcQ7Y57G9S7rkbih/G8
	a9fDZIw37uzaiGsXF9+bvuPm+a1gCdBnCGUWtxTHnkDARW5VQfaOMNhF5XT7aaYzpJIjlbPyQit
	SoUfHyseKkXK3wHuKMjs9jz35rJjPsQJZwlykL0e2UWzwGycK7iU5JHwPHI5N0/3aSTpi0alsf0
	KByn9xUG0qFgki1zpmpQSqV3LsIIvFfireiBUL9erIXZKihAOTbGUofVkwTc8ASCEVvJ90yaxEu
	FrvHeAQ3a5j7SJKYAq/5rhSwIPoLM+XT8u5OpgkRftgrQkF9Q1LNEezPOQV7kKGSwhHwJH10QPR
	qBIV8eMDcqF6Sx022l7FdfYcHazdEfnQ2mYr6lRtYOGXsEBj2O6R0dmKn/B0e9kfRGLdGSmmYmE
	gypLEtRvn32jdk6IrkLelSmFvo6nj/K1PGPc5Lq3xGqIhLr3IchwA9jPwju3wOlgi3u/ahW1cYf
	b/D9bWeqqyj9p3vSJQgWRk1hPJ78awG3YrpUlglKRWgyx54yD25ZX/eUcdINtVCF6ks+QC80T1s
	ElkrSVwXOq+QP4aVcLz9cRpA5O4R5UbAZxuJbYe5XH2GCGTxwjW8S6+B2CmDu5NY0mkws=
X-Received: by 2002:a05:6402:3808:b0:6b4:5d8c:95e2 with SMTP id 4fb4d7f45d1cf-6b597553644mr323041a12.4.1793911099046;
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57feb668bsm886834a12.13.2026.11.05.12.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:38:18 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH v1 0/2] spi: zynq-qspi: use a flash larger than 16 MiB
Date: Thu,  5 Nov 2026 21:37:32 +0100
Message-ID: <20261105203734.979168-1-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Zynq-7000 QSPI controller sends at most 3 address bytes. spi-nor
needs 4-byte addresses for a flash larger than 16 MiB, so on a board
with a 32 MiB W25Q256 (the ADALM-PLUTO+ has one) the probe fails with
-EINVAL and no mtd device appears.

These two patches keep the flash in 3-byte mode and handle an operation
with a 4-byte address inside the controller driver, through the flash's
Extended Address Register (EAR): write enable, write EAR with
addr >> 24, the operation in its 3-byte form, then the EAR back to 0.
The EAR is 0 between operations, so a warm reset leaves the BootROM and
U-Boot in bank 0.

Patch 1 makes the flash readable (every other operation is refused).
Patch 2 adds program and erase, which need the write enable again after
the EAR write, a check of the bank register before the operation, and
waiting for the flash to be idle before the EAR is restored.

Tested on an ADALM-PLUTO+ (Zynq-7010, W25Q256, JEDEC id ef4019) with
v7.3 plus these patches:
 - the four partitions (mtd0 to mtd3, the last one 30 MiB and crossing
   the 16 MiB bank boundary) read back with the same md5 as on a vendor
   6.12 kernel that handles the 4-byte addresses in spi-nor;
 - the U-Boot environment in mtd1 is written with fw_setenv, survives a
   reboot and is read back;
 - one 64 KiB block in bank 1: erase, program a random pattern, read
   back (equal), restore;
 - 14 MiB (224 erase blocks) in bank 1: erase, program, read back
   (equal), restore; about 110 s each way;
 - a 26 MB firmware image written into the 30 MiB partition from the
   running system and verified byte for byte, after which the board
   boots from QSPI;
 - no driver error in the kernel log during any of it.

Not tested: other flash chips, boards with a flash on another chip
select, or the quad program path with a flash that is not a W25Q256.

Mario Behn (2):
  spi: zynq-qspi: read flash above 16 MiB via the extended address register
  spi: zynq-qspi: program and erase flash above 16 MiB via the EAR

 drivers/spi/spi-zynq-qspi.c | 1 file changed
