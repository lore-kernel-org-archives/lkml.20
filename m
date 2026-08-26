Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D6423EB4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750587; cv=none; b=PpMCrJKPdPuWHTDy6UjDXv9M65Yd+WlgTMaBEupvy9GS/06GvWqz93sMX4pvgtuk8kl6DrP6nb4p2y6ohQLvRN85jT3CswVT0WjBRicjFPRyWPyRstpVjy4kRoZzBGyEJpfLI1VN2pnKpMzn8s4FXTMA2k8aj6rN48upc+8htBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750587; c=relaxed/simple;
	bh=qcDpiJ4AaNaIfcHB3+7d9TBQ8LYaMki9ck1aZS0bXBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDR7nf9oLtCEERhQ3DcIBO/7qsHtaCb0Qw6ZWUz6i6R7yyu6Ego9Lz+aJ0i5bNJZZf2wxvl0w422OgGEF58xW6RD8T01lLXv3/JYNRYQVP31Vndzu3f+z3ztMZoonkh10MaCCzJVY4k6XFipd3fMYXeZqDiiY/mWVorI0SttnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcE+I5cR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcE+I5cR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1192348a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750584; x=1788355384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsHIzkq6RIx3RtCgQAXVkYxzKqk0k5//JakmHy5WmdM=;
        b=KcE+I5cRIqz2lT2zDma/JWpLmx6ZLds0ay8ELbSiyE2flc3mHHqW1ZVwsrm3BYaxZO
         p+hpbJAwMDB52sB81sWjUrL0nX/6Qsp7tzka5KfmxPHmHVHDps6en+D1upADcM6xJPAZ
         7BzytWIi29/ugvt81bRjd4jB8nWJZDja3H0SVS71OWdY6NrGYdEpReriZavyoI/6+1yX
         0TMUoymfjh2JSfZrJLxELZHXXFa/n0xyNJCt+cORArnjd/za12+mGp0RnwNumrYkSd8J
         8oShtKbXjTPHwFrGm4OOsm8J1XF0JrbImwNkZ1eqp1/0t76HlgY0CXsC0DSTT43OnagM
         /W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750584; x=1788355384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsHIzkq6RIx3RtCgQAXVkYxzKqk0k5//JakmHy5WmdM=;
        b=asxGaYff5rAbyL4c3q7q/n/FV7jMvyKX+ELYMTm9XbyxHFUFjljsgTQKAt+1IVYWd8
         dfcKYBmfomfy/ZG5hmfNIVw38HsSErmzFACr3kHr72YWoxPc2yMYLHwKknHp8lYR9PcR
         Da09iyhOngi2w8m6wfhL62tlGMF0EbF24AN9HC/ssbojT0x+lyA8MWN0jt6jAOFy3VwE
         fanhlZGeLbVylVPBxpf99EEZ7SumtLm0hTjEgg7TMz9N5+lIcWSWvVukhiOeYpR/0ffg
         Q9aK+NnvOp6f8i9rwx0Nq7uTKUcfEACpSD7vgZzFGOlfoWkvSlFJcU2P99u4yC1XlEks
         u7bQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaDK7E46BHvIXNvD2LYQUvYyeddHa35Te8TtNIFM93wKB4SGylreGBv7n+BxpvPYzrCRCoeK7SSM2mjK0=@vger.kernel.org
X-Gm-Message-State: AFuF++mA/tv8i27VyZXMYSODWn7VGtfdXmAPaH8WHxxKJy9Fl3V0x666
	7YHd/SLDKtnctlK5CNgtndjNaJUOju7gybkNMJ/FBPXBra0ZvT876rtc
X-Gm-Gg: AR+sD11kFpLAo1LaT0tHCpJ4Fpf6Xb5obvxwxmU99w7kZ4XTd7XFk841uBmt9nBzJ1K
	PgF4iHoxQMB4GGqvWf3lLCbgGNBDuDPgWQGy6faI3D+sEcoiyncZWMNd6YjMTIbUJ01eoFVX0wD
	8enf3/Fmn4qtVCGX4AL8uOoYBkBUAFCloUP8h46bibKSTJwkN05gOOZfBUB/RB/k0c1AfIKjQ2O
	F+nJ3RdfXmjZbFCKVqQ3vkhxoGF4A0lOd2BVJk+6CgTYFGXUv2uTGTSbOzfRHqaOrzOLAEbqqvq
	Lj/TLgTPDeN4QNLlpIdN4jj9la50Ygvnp1LFV6z6mz+2wjO+V1pyAEZsduD9ICrQ2IvPVrOLlMf
	ut2tG0ij+laLHp3QtX3XTvd6mht7HcXkBFj1cJm1qHwoMSmcZvyrYFsKGtgeTTQfQh1pqa3nNEe
	RYpgpLzOyaz8fZVvViZwr4KtKgRTV6V1rvC12Aq4ez9fF6qmK4OcdF+7HcNvO3mxF4B2N2BBB9R
	hDIXHM7JDQEoE43HNtVcKht9TEiWKLyzea+kOd7vSo=
X-Received: by 2002:a05:6402:510a:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6a5df5f1153mr8425305a12.5.1787750583618;
        Wed, 26 Aug 2026 06:23:03 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 0/8] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Wed, 26 Aug 2026 15:22:48 +0200
Message-ID: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
OV8858 rear sensor through the Cherry Trail AtomISP.  Its firmware does
not provide enough information for the existing sensor and IPU bridge
drivers to construct the camera links.

Add the ACPI IDs and bridge data, describe the two AtomISP camera links,
support the Yoga Book sensor clocks and modes, allow explicit raw Bayer
capture, expose per-channel white-balance controls, and add the WV517S
rear-camera lens actuator.

Raw output remains opt-in and disabled by default, so existing AtomISP
users retain the current format-selection behavior.

Tested on a Lenovo Yoga Book YB1-X91L with continuous OV2740 raw capture,
OV8858 test bars and real 10-bit Bayer frames, and live white-balance
gain changes.

Maurizio Casciano (8):
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: i2c: Add Yoga Book camera ACPI IDs
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: atomisp: support the Yoga Book OV2740 link
  media: ov2740: add manual white balance controls
  media: atomisp: allow opt-in raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 170 ++++++++++++---
 drivers/media/i2c/ov8858.c                    | 134 ++++++++++--
 drivers/media/i2c/wv517s.c                    | 199 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  24 ++-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  17 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  81 +++++++
 .../media/atomisp/pci/atomisp_internal.h      |   6 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  13 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  15 ++
 include/media/ipu-bridge.h                    |   2 +
 15 files changed, 625 insertions(+), 67 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0
