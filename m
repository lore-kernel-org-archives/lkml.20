Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307513;
	b=FyTkutwIPb3GNL6wmGRuvkb7sRfDKl89e09rV/XSGxTeP+ARCAAmTS+7yEtynshof+UG
	 oi3w1GTiVN/uWoC0POkQGPosEE5SvD3Lxjb2yvfwwRqnLXrkGC5Pgxxd7Kagk56KYHqmX
	 LVg5qBXo/0YCtl8nQEecR7aTRzuh9BiRG5QqEU5rATw6ZFge0hAIvwTKOaOxmKHwlt4UL
	 MR707tSjwJbr2Hfgr/GsVcpJf8a6AnbMVy9OHvb7iuXvCAOPObY5t/OP+jBXxHu5FR0IK
	 gDCLFIubbePDKcZ8vjXrH/r+85fDACmzaDlUCzkD9o4Pf26B5xmTJ3SfyLoDoEMauxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
	b=Y1ZV2NSdomTxYKKRWWT7m5qVAtC4+q0pHyDF8vgKmfJBHEBY/Z4c5kRvxAQJMqrkJDEP
	 mkbGmLtTHdjpKEclKLfB/OvO+0BZ2EZrLB5wP5ePOBLFCS7/C+eviMf6j8qXBo3WeFckq
	 sJ0Ygyvtmq1Ehod8MZ3Tlm+VIGQB/ItkT2Cb8qzI1AkqP6Z5h5Ji2B8zaM4a+JicmopYy
	 MH7Gt9WuJQHqBNCCS9wMI1lj8Fhy8zxN6JhOt1BCCHtZF0he/Qd/j154023tIhVTpslLn
	 bEkHqiTtHyJ3q8DtPyZ4sbK/8Q46gcKsOkG92JeEQzuZibLNbCEnOgHypMEHv/TP9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB0t9wmP;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB0t9wmP
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53653e30353so38937591cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307512; x=1793912312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
        b=oB0t9wmPgxAC/S0fDg3EZs7xCLtVK3YHshZVTDa81EOsjFHNhzJYqakVjqFy+QM90c
         aGy6r8dUnJoyKyIthAVQMMK7qGtV+KjP97OHeWh2k1hlFxH21y4EnhY968eNhjUS279+
         xmT4FlkMkP2dqxFWPqHfUljy0sPL2OTmcZePbh8LbmwDEPwi+KkFcDj/2FGcaeIAa+wk
         3duqIfxCufkiQA8Qh2Gsd8da5rik5EfsU67F1WikEoFcLAcxfiWzlYqj5jJGssIWq7Bx
         9b+B2J6EK6UJzvUbn0nj1SSVviHuQcRxtJN5xfJ1n0vVvDay45j/a14H38BpaNoevm5j
         njgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307512; x=1793912312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
        b=ILdfGIQMYAzfgRDgU4uXtJJV25aTXv+BZH3SAegdyMy4rv79t4Icek7tZy2wMiEuSv
         +KGLORM7YGqTt5gGXoKZAtNokrRGl2aEV82Zo9zeGAMaLNY22QJbAyQyVHfUqkbfuwNc
         xtT5u6zaBfjJpGjIzc3+yLuJbs1vuHzCSRAY1K6IKRd9Hhjf5WTWTGHPpmxYsXAKq8PS
         VrnTLukY7b3s8LUeWtkm4DLQgfQ6EtxMQwe1Ss9ZEP6h1dsUsn3Us7dOR7KxobnrfXXh
         t9PsTrQ88jPYg0n/UDYLgbpNjPNa+CQko+Mojc9H8spIRH65lk8x2F/dfHU1XamoaMb+
         DYQw==
X-Forwarded-Encrypted: i=1; AKwUvBwYI9f19lFJrU5gUpZaNS4xq49X+pAsMWGPvGsYad+hMwMpF1/m2UFiqss4y/EXtm+ygZBtRGhngyrEjek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ34f7c/gIupBCuxB82Yt83osp5YZ0s+DaSD4mp4zJrFuVqQqwu
	qyQ/OiOUymVq+UzqLq6CYxOQ2gZoGP10mDUjRwbhLHmTPwIlyGJlLhpW
X-Gm-Gg: AYBFou133lpf2b6LMRMhOgyzuMvVJqf3otWuqvqnvDrpZ4t72vkhPSypKfsUx8ZMq5Z
	ni+0siFBbGiY8ZrDwimGZKKWUSlbdacRNdFlvhPzK77utpHr4o2WzgqyhFVkUkmfUlUx1emet5a
	jSu6jL77rfj71gFqh/LU1HbFW6AJ50UzMLAZmLw/CfIy+iax5M+MPF+sUquvWkRKD6K+lbuOhkr
	cp3OvTSfFwqs9AvAKNXQelywkotaG8kxTOO1qXOwI+kiMcAt3QCP/5Cpb9hT18nh5EetTyi643e
	szZ3HVTcRiNM2pxudYT/uIxC0EebQYmKTmi9FLlxzdNAmaeATteKx6KX9u0DHPqaCgnAIzYDKBD
	p9SBPNNAeQfzkcQDN6r9Zm2dmEkV+32n1qJuq64gvjeF4/4tKtDw3C8kJKXgKCAHblx7wUMegBt
	+xE4XxcIOrPFVvOMscFr28gVw7n1dtsGFKERUF/5e9bEocQcae5WVYtmxMsmA/jdbv3ZqYivHsw
	ykzBD2RY4P8+qPfxjfmgLNvXu5GVqvsj0xxNgQNLf2nvnE/69hpl+TzvKxr6OWpQkPwG0T6mlBe
	P2NOKQZLSmUEP2qBuu1v7DaZ9oslXoBKopEk+wTw4TuWs/hehxUBCFA8GR0Vl3EmPi3p
X-Received: by 2002:a05:622a:50f:b0:536:71ce:5d0a with SMTP id d75a77b69052e-542b83f1f2amr3961121cf.74.1793307511973;
        Thu, 29 Oct 2026 13:58:31 -0700 (PDT)
Received: from holowork.tail3176d.ts.net ([71.104.86.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31032c9sm6006136d6.21.2026.10.29.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:58:28 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: [PATCH 0/2] drm/ssd130x: Make the SSD1322 work
Date: Thu, 29 Oct 2026 16:57:49 -0400
Message-ID: <20261029205751.3513474-1-holofermes@gmail.com>
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

The SSD1322 has been in the ssd130x match tables since the ssd132x
family was added, but that family was brought up on an SSD1327. The two
controllers share a RAM layout and many opcodes, but the SSD1322 takes
command parameters on the data path and differs in several commands.
This series gives the SSD1322 its own family, shaped like the ssd135x.

Mario Limonciello's connector luminance series [1], not merged yet,
sends the SSD130x contrast command to every family it does not know.
The SSD1322 does not have that command, so whichever series lands
second needs an SSD1322 case there.

Testing:

  - ZJY 3.12" 256x64 SSD1322 module on 4-wire SPI (mode 3) at 16 MHz,
    Raspberry Pi 5, Raspberry Pi rpi-7.3.y kernel (7.3.0-v8-16k+) with
    the ssd130x files from this series in tree. That tree also needed
    commit 3dcb0564c509 from drm-misc-next.
  - Without the series, a modeset and a full white frame leave the
    panel dark. With it, the frame is white as expected.
  - A KMS client at ~200 fps matches its rendered frames on the glass
    through a camera harness, at the default clock and with
    solomon,dclk-div = <1>.
  - Backlight brightness 0, 64, 127 and 255 moves the contrast on the
    glass.
  - solomon,dclk-div = <3> is refused with an error and no init is sent.

[1] https://lore.kernel.org/dri-devel/20261002190030.211356-22-mario.limonciello@amd.com/

Thanks,
Fabio

Fabio Piparo (2):
  dt-bindings: display: solomon,ssd132x: Add col-offset and dclk
    properties for the SSD1322
  drm/ssd130x: Add SSD1322_FAMILY and move the SSD1322 to it

 .../bindings/display/solomon,ssd132x.yaml     |  29 ++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   3 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   6 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 277 +++++++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.h             |   4 +-
 5 files changed, 310 insertions(+), 9 deletions(-)


base-commit: 21803a577cc692d01307102799f795a606871212
-- 
2.53.0

