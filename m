Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB804D6C3F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830507; cv=none; b=gmKYcChegt9I7Cj0b3kt8tixx0MYFKzmY462uK2Rh8MHVDVemrzay6OlizOZ/Xj8obx2yl/YogYkCwZjzuzlrDd3heKAdnSunT/25NeB8lw+TF+f/ac/j7ioWZm/vKdm6f8PtbbagbKrW8NqJdhU+F0NiGYFw1U7w7NKqCprvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830507; c=relaxed/simple;
	bh=OJr4F+tRV0On7Irv/rawfuCiJMAnPUX7BfkuP7XFgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCWJeyvHXBENVyYbu/K1QEeehAY2XiIwgRETV4s+X1D97U22uDJyvkhkh8Bk7+RYqRVpi3Kd/qK2YPKbbYU/2Sam1LAhtTKaGBTL/GwY9j+dD4UhxKbl4my9BFnmbRCEkQUVDfFijpKuwEl9/MzPacnNGfDarerdMTvIJwv7jG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcqrapjl; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcqrapjl"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e3e525cf4bso1731881e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830505; x=1792435305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=gcqrapjlMlahksyBmjXYnNSh31y+H31/MUknDTGUyXGwyqINyd7j6W2K+5acAa5zTq
         cMKmseABjOg6HkM8XQwjpqcBRqDAGzY4ftqLg59kZ7LtxZmX69uC0JMzgBd+brY+J6ZJ
         YSxre2go1IP2dSgWFzX2DYR+XVLb+fbeEBvaL8ppY2d9RkPhuHYH30LGQIZwpAX3WkdJ
         9qplQFPuTO8NTvXAeScz1W3Z/eefIR/NB0GCzCNWjFCqDTEbtVOHEeHEmx3Bwiu2a7DU
         pgqRzFi+IQlz77hpbi93cThVFZNmf/KNXJalYaKjPwS6qONUPvyWoomwMMkugefeWXdp
         w6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830505; x=1792435305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=QwcZZGLcEWvDd/QzMG5OhoLCwprAFr8qmgyCSgG9/VqHNebgdCWdN4TIhzYlHU+t79
         /vJvz4yjhCNGzZyZB9B+W9QImURnxi85McHiGV+pv93PE41NhEsEUEuza27Dt+6jAJMc
         WD9m4OA+LJ4kMs9t8j/WA+luMCVlGXn1/8UjEF0lEiA1dj1uRRxdzbhTkk/6OHZAp6k4
         DqJOGLdU2tLej3fHV67olbXiu9gbOplLIHk9DbPUVwRx8a90bEN3ayM93mkfJH4kBr7A
         f+6bevZs/pIr7/XdF3axxcXjKEklM6XlrWFLur56W7e5mibirNNAGal3a+7/ItCwZ7qV
         JyNQ==
X-Forwarded-Encrypted: i=1; AKwUvByWU+Lc3OM12i7i9hszXD7pZolm8YbGr/SG48Yqg4YI7xdHZvh/aQseez3Z9oVKmjP7/YOhvBvd+PK5A3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfrzIcntzQxjnYz0t6wT8gdeUMk+QkY8C8Q+A4TnWMg7ir5UBO
	r28RjfRJmnNvYMs0feTxyIZStHbKmMQcXOjFlrWDWtyCGo+UO4n5HOh9
X-Gm-Gg: AYBFou1M/eENM1Cr+hz3i51/KQO42cLXjSJb/P3dYYhZw3l4Qsi/k123Exv3tWWayJO
	cW0Ij7wXwQcGfMYsrTH84Hc0k1rc+erOgm22cfvsh+fPColGgD4pXnvrlAyXrTPxRLEv7ZpJHG7
	MABXJug+G/h/FDNZq+wYT5M5n8CB0LoF7dJLPBaTPjcmUsT2OJd0l2vjTItkHXiKASE5mRJppfu
	C5BmPOYuvzJpCj3Zat4LVWq6idalCwAQ3qrKuvRGxNJL525Opd0v/KCROF5Xa339DuFtv/1nDwB
	+H4WMrOlC+6Q6C58BnwYDgQH8d7R6/EypkVfUJV8mdMCQ0k6Ybc++PjcpxLY3eKgsFA+J1Wwy4L
	qhpvxS5kVJfDe/pzu3oW1lAUztV/uKvhh5XYOIxaJaxnm5aP0ZoC2a1K20sQwX+Y7Vpx6acQbrG
	7d/Ky9/rylCiZS/Uzo/iZcGX85FMJOqra9Z8p81Hcm2TDd9O1lUF99EubBu6QBfDpjqi2pWGzpg
	BqntZ15S59QkY5LQ2AJxnraJO9/02dDS+bOVcgjAJ/50ARk4YSFhWvOnGYtapHHx5UeJerGYPAz
	Z8rgJ85XGTS+vERxAg==
X-Received: by 2002:a05:6102:80a3:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7cb37405c7amr3420126137.33.1791830505277;
        Mon, 12 Oct 2026 11:41:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:44 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:27 -0300
Message-ID: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this follows my question in [1]. Andre asked why not extend the A733 I/O
bias code to two bits instead of switching it off, so patch 1 does that
for the main PIO and patch 2 gives the A733-R its own descriptor, as it
cannot share the A523-R encoding.

I have not seen the board fail with the current code, and no A733 board
DT upstream uses these supplies yet. What I have is the old and the new
helper, copied from the driver, run on the host with register values
read (read-only) from a Cubie A7Z, silicon revision B:

  PIO SEL 0x01155550: a PJ request at 1.8 V gives 0x01155750 with the
  old code (PE goes from automatic to fixed 1.8 V), unchanged with the
  new one.

  R-PIO SEL 0x000aaaaa: a PL request at 3.3 V gives 0x000aaaab with the
  old code (fixed 1.8 V), plus a read-modify-write of +0x344 that the
  manual does not list. The new code leaves both alone.

With both patches the kernel boots on the A7Z (RAM boot of an rc6-based
kernel): UART0 and MMC0 work and the voltage selection registers are
unchanged.

PF and PI are not programmed, and neither is any silicon revision other
than B, as reported by SMCCC. The A523 variants behave as before.

I found nothing to change in the DT binding: the a733-r compatible has
no a523-r fallback and the schema checks pass for both controllers.
Andre, if you meant something else there, please tell me.

[1] https://lore.kernel.org/r/20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (2):
  pinctrl: sunxi: a733: program the two-bit I/O voltage fields
  pinctrl: sunxi: a733-r: use the A733 I/O voltage fields

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 ++++++++-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 15 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 57 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  6 ++
 4 files changed, 101 insertions(+), 3 deletions(-)


base-commit: bdacd2542f3c1b2b411fa86ee1f39de19cce6562
-- 
2.43.0

