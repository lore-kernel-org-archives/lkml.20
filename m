Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2613EFFBA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560929; cv=none; b=hWvCsrGQlpq5RMxEK6C/CMLbxQXC+lnlH0BfUJFl6MV7utayViRdq/I0eHjGOL0ILba5Q0k9hrXRY+tg1q5cBt6A+Uk9GqslxUWiPPMBYyZ2196ReVP2EPTSzX+eXuhR1z48HoWFVKcB4zw0JAsMDueyNfA5wnzAXm/9UZnqFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560929; c=relaxed/simple;
	bh=DqlshfivEwgnrB+qkDvakP7pvIL7ZOxMkNNV0cMvHsk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jRaVgb83Wvb9VP/WAfOLdApWVzOEdZXIyXlcvRFC0usq3dZrgG/uv+Ec4nTDmc9jhGRz8NK19mM+WFIiluuaJdkCYMdtNAHzqArGL/L6eEjC0vf3KCy83+cvwFLrT1qtliCPTB1Rkjaq4gnfH49QP63BnepE+ZX97ZiLjjAkfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUkD+v9L; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUkD+v9L"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso735258a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560928; x=1790165728; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aayfnjV5p3GQV2kJBDU3d+V6F7p/7t4V6z/4sqcizKw=;
        b=HUkD+v9LvPy+cCczmd/P1suhuDlH2yanOK46C+XKmg4doVR/eI2Pwbx4IioenIP+rR
         QMegF6Cj65xc1fAcq2iAdJwhsgwA/cYRS4d1/gCtBix6v4xAAP4ik0aSJfnNUvXg5aXe
         l0TiRh048htCYnQBG4xJJjtwhL9qfCYy1XrA8OW53VaoZ/NvTZuoWzYox/Cg6s2qMaAF
         aPz5usg9kMCw4rmmS3KpWA3c+PT3dR7s2+t363LYrQPwLknsdAehM4QiTCQybJrtax8S
         vGZHinoqzh2VTA0pfEhbubi2bmR1pNeWpqLBHAAO1BehgESbJxz+jTFioWa7jyjD/gvq
         Zy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560928; x=1790165728;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aayfnjV5p3GQV2kJBDU3d+V6F7p/7t4V6z/4sqcizKw=;
        b=nEwFQDU0PLnR0lwY0SljGzUEn8bNDj8n31XEjdnSoS036kyMIZFcQRywQdhegs+V/3
         GOGvkGEFmO2fVQtFGIEeI1hWf2dHNUum47+h4nQ+pLrJbe7/Xe9TgKA1zQ1l3eM/Ello
         DakHBJG5JndGI3wZ8K9Q6xH88LOUs0z9oBQSq9Nq3uzZM4ZsuCoD3gmM4ywn1WZsNflD
         NnQGuOQGG6L1G7FP5kfknmzfY6w109kw3C+lTAB4PEmow1wHectilluwELjoM9RMtWvo
         x5Ie1WdTkr3VSXErbKY2mzzrqoohVZsMX13VE00zQm1MW+xlLn3/K5GvcWJX8fQSNj2i
         2Stw==
X-Forwarded-Encrypted: i=1; AKwUvBy+PfBtp3VEO9sczA9IDaVKHWYtrevkPo6lMZltnPH1VBi7FK56mk3dd9rgu80aZUJYsDuBijccH8MQF5w=@vger.kernel.org
X-Gm-Message-State: AFuF++l18VtpFwEMUV2D05tTZyENhgDDypo+c/Fec4T7lQ9nkZSuJ+Fr
	HXBfVcGdGIc0s4jJHj4Ae4fXSDnoBpEsO7F3X/uJzw1GCFHrZQm0xkR2
X-Gm-Gg: AYBFou0zN7l54gJA33iaH5lM++Ro2aDFcLhmz93VT6OQLYQH7MFGFt8WXL4opjj6PEG
	mbZk4z1xmhBYQ9m7yrFdWcRNN0UH/qyRabwa+8lWoUJMaAIzsn3Y1TYSYF/Y1b9Q/RSpH31Gd28
	9Ca+GMftqmgV6/T3eFlfmK+H0aK5nS8cep8o09iqkACNEWuaemrc94LNL5D6TbJk6iYhAp9L8lf
	p0YZYmzpJM/23suaMsucMDEOJtaiVPXWrl8DMowIjT0DDbiA6FlFfeEX9Z2pEhqK/fdRMkwlOjj
	QdMwSM8wZZzfRwALOwMYUp8maMH5XggEGBi6krXaLcv+RPUEP7D/k1+9PUqWEAn/32TYc6R1+84
	oNox65/aMiIYWRa20z8cJdKm89H8qFe/OxrTTkQbzmIomiuGXT+ZtOeK/g/5FYyuMKNHPkuaJ5Y
	+v8Ii8ymIKDiJPeRm7vjvliIpJ3EjWgk/YGTF7BDo0eRmqdHTcqxUohef+8q8jZaxEJlTPsw==
X-Received: by 2002:a05:6a20:e290:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3dd5f7a9ca3mr5599543637.25.1789560927153;
        Wed, 16 Sep 2026 05:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm1512489a12.18.2026.09.16.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:15:26 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH RFC v5 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 12:15:22 -0000
Message-Id: <202609162015.RFCv5-0.lhw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

v5, as its own thread, addressing the fourth sashiko round (one real
Medium, the same two Low false positives).

Changes since v4:

- led_mc_calc_color_components() now runs under the zone spinlock.
  It writes the shared subled_info array, and the LED core allows
  concurrent brightness_set callbacks for the same LED: sysfs stores
  are serialized with led_access, but trigger events call
  led_set_brightness() without it, so two concurrent setters could
  interleave their component writes and the thread winning the lock
  would cache a mix of their colours.

The two low-severity items are the same false positives as in the
previous three rounds:

- kzalloc_obj() exists in include/linux/slab.h since v7.0 (Kees
  Cook's overflow-refactor series); this driver builds against 7.2.

- blk_rq_map_kern() takes four arguments on current kernels
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it exactly this
  way from scsi_execute_cmd(). The five-argument form with the
  request_queue first parameter is from older trees.

v5 was re-verified on hardware: per-LED colours, 100 sequential
updates, concurrent same-LED updates, concurrent four-writer updates,
and unplug under load (zero splats, zero leaked LED nodes, clean
rmmod).

Everything else is unchanged: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual attach
until a notifier lands; SAVE on every update writes the enclosure
flash, wear uncharacterized; NULL-parent LED registration to avoid
the sdev reference cycle).

The open question from v3 and v4 stands: the driver is deliberately
not wired into Kconfig/Makefile/MAINTAINERS yet, because the agreed
direction with the SCSI side is a split into a SCSI transport helper
and a shared ASUS Aura LED interface, and the wiring would follow
that shape. Is deferring the wiring to that split acceptable for an
RFC, or would you rather have the driver buildable in-tree from this
series already?

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>
