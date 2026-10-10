Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08B3A9D9F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647790; cv=none; b=jr0Fc22FLfxCCdk3KGsNAa3E/kGBKK2kVXwRuYgg9NHl2E+J4uinJUiVXoLYxxEqh2fCWl3Sny6McWaqN/CUxXfzRlczQqVT9r63ojbQl8Am4KVMO9VxIQe56DotT0b19aapFHoXW40PsQAPlbooqe5g7/UEbJFgVZar06rk6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647790; c=relaxed/simple;
	bh=hH79H3vo8l9b0pOUFINLiin80vIty5FUusR4bujw4Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oN5QY8TCqZ6nIq0E3LmnE6cO76JMua4y9RjUHHYVNa28XYc3PyYrAWZrq+g+QnKDF1O0/DJYD3OnfKCr4dSz4Cn7RbPVfb/KNQU2FtB/VGowzWluu21OwB73+aPILyh8jiGldmYt3xSMCgptfiEDJOtRqQ62SbUYLIyZ73XdR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHQTX7+M; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHQTX7+M"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so5384375e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647788; x=1792252588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1fqqjrYoN5qO5PGqrAIgeLIk3sJV+IoDKwLgWXDiqk=;
        b=rHQTX7+MNXljd16TfFm55gRn/2oG1NDkza2VMyvxK78D41qO36XbjaetBMGIc0sSh0
         CaCVc+C4kBdytwBMzIaY3XIicgpnvREG9yiHZq8sYq37H/wwCIvrnEqDaJxR2Wfwo/cn
         YBrcroblKiMC6yWkcNfw7fpfMbybfEKqPWwPEqmDCZYraNOQbbL2dw2i2KR9G+++7+LF
         yJut5aVyziI2S/Y85UzmSBeWzr5WJyldNK2Ozx4pZlgdOpJdHQm9EEgV1W+ClxSQk2Bd
         +cFuhr20/NmGohuUhuvf0X/Rc0x/1UUsdcBYVAtjmcH3JXe6fyt7QeWW6ptUfxbN0nkS
         dFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647788; x=1792252588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1fqqjrYoN5qO5PGqrAIgeLIk3sJV+IoDKwLgWXDiqk=;
        b=i2LsQLZUvcKSc8iYvk/3jrLfH8je8cPACHn82vLLgpuap6grZuPFvHxeXv6xrKW4wY
         6k/288ZBrG28d3aahSumIasKQcKJi3C2ifFULzXv77byBZW5jb9v/d9LxWfl/qFEa284
         62SGgQA0hOUCqVZUrTX1iiGpbInqn1KrUwIPJv+L/cRU8FtMLu05y+8d5FlioCX68flG
         26AJcA6vxaMLSJUmuB+fUUmnvIK6yoFlnMaj1J5225O0GclMNNgT4oaEDm6M4DUkcd8X
         sPw7b41HP+juEOp/xuf0scsba5PZWh75mslRPFIttk6gWC81v3QO5WN63oYf6M1460e+
         hWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIFEVsHxmiZyKkWfJFIRV73UCVKYo4SWIzaS6OG7+fM9r4YkSlpjsIk8yKX7DnVSlMcJda4puO9/XltvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPOJ0QYVi1h9K4Oy4VS5nJfs88lEYM6NgdR90UvkVAkpirUB+2
	C/TYQps1u6Gn1Oq4xMV01iXM0on6nN4Y5lzROGGTekm9v5wJlhH5wLs=
X-Gm-Gg: AYBFou2wKklp8qJwVKVdVE9TwTZeJoenSXXAkGwvwSHzR8l1rvc2tglm5wvFtZVVZzy
	QBuOzf8tJl/dyc8HWnUGAVs8THux+XSBBQBvf1RGGIc4wnyXlU8ITI8Q/8DlE/BMIxPQyEiAj1o
	+U1QDEMGdoyB4xEMNNbuLrBqz7d69Yg7jyl4krCtg3qmgjrcA1CL3k9UBO7f5R1Xvud/f6n3+yu
	2a4zW9t3IIEsJu2DBG9gEJNCzTQXqM9/aa3IeFFv9dldmkU9aoM4PhXMEgtRm6hT8l8txVbIFWo
	MRblbZRXbV8IV0BIcowt0tEXTzgxd+/GF7Zni7IVjmuikSOLsfWUza5ZJpStZxuS2AK+QS3NCm2
	H5CxTtEDS2ahCWVzUXLIBAKrYJIk8An/Dzc+PjJ580vwSjU6OllO2r7MBIaRO3JePPle+4VUqmn
	8LUXrRlniYgrHjFZmiBXHGDdi09US+rYTOewZgoBVjJa0nyjWaKIrQN4S9MyEJbBxx/4Hm8+xdW
	5vmZBw3fTLWACTwVdBYvO/ZFw1hw9iNUD1aoRo/HLbHCBtl9cGBBhw=
X-Received: by 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr61576615e9.25.1791647787553;
        Sat, 10 Oct 2026 08:56:27 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm138023065e9.14.2026.10.10.08.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:56:26 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Sat, 10 Oct 2026 17:56:24 +0200
Message-ID: <20261010155626.2766298-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v4 addresses Sakari's review of v3. Both commit messages are much
shorter, the in-code comments are trimmed, and the data moved in 1/2
now lives in struct ipu_sensor as asked:

- the "lens-focus" name goes into struct ipu_property_names, next to
  clock_noncontinuous, so it is copied per sensor like every other
  property name and ipu_bridge_init() needs no strscpy() for it;
- link_freqs becomes a per-sensor array, which also drops the
  sensor - bridge->sensors indexing v3 needed.

No functional change against v3.

Testing: unchanged from v1/v2, on a Surface Pro 7+ (IPU6, OV5693 +
OV8865 + OV7251) running the equivalent change on 6.19 - the PCI remove
-> module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series, with all three cameras streaming
after each rebind. The patches as posted are compile-tested only; that
machine is not on a media/next kernel and is leaving my hands, so I
cannot promise a fresh run on it.

Changes since v3:
- 1/2 and 2/2: commit messages cut down;
- 1/2: lens_focus moved into struct ipu_property_names and link_freqs
  into struct ipu_sensor;
- 2/2: reuse-path comment shortened, and the fwnode_handle_put()
  comment now says why the reference is dropped rather than what the
  call does.

Changes since v2:
- rebased onto media/next (1/2 rewritten for the new property
  indexing).

Changes since v1:
- shortened the 2/2 commit message;
- dev_info() -> dev_dbg() on the reuse path;
- Assisted-by: tag per Documentation/process/coding-assistants.rst.

v3: https://lore.kernel.org/linux-media/20261008132614.2456716-1-dmanresa@gmail.com/

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 29 +++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.43.0

