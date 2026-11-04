Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778772;
	b=LeqXFeXTZMMbqILzNFxfiEgnBfjiNsUkqq5e7VPYUGoy4LSaIya3LmoR+90OuCPzcYAn
	 kBPmnqXDG2SbXj88MtxeSwxsujbc5BZrvWbL45bxR5CNJq1bq7sPX9lFQo4LNkPc0yaqq
	 YbppD/vNBFSC28KmGYeVWrgBK9tm/1pWQK9PwEfc2ULcc0dfVjidRJ+HlaI19B2cB3gcy
	 6iWmF3QfZODbEQJx8LjRCi99a3WBrN0qqG1f0Yg0VUbwoZczjagEWf+Kpj9mSkXPW0wx6
	 aM0q0mhGGr+Udr5+aWoCkcrtqmeHChupHL1NNhc8osy6zh7HukpxC9RLZD6Fz7worqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
	b=sc2HoFF5SdGaWhyAOJdf5RaafQYEcPi5Rjcw8b9RewyVGFX3yxuSibsUwlroCP576VKD
	 D/xptUS0S0vbc1kkCeYYxLSeb5ld/43aNIif7An3hPKEHknT6j/LYW3DEM0RjAy/GmS5t
	 RWY5yM8/auxIqCvzmv+4MRjf2MEb5FuIAnU5kOQKLFUZdR7hK3WuaT+N6g13/myH7NC7l
	 ZrahCf+aH8qJYFlM1E6OF2mIa2FJKmCj2GFJn8Xhin7UoHdLRXSGfVGVcx8FOy7CuwZ3B
	 LeTIwBsw95BMcj2o6HPS7fyk+5NEnGH9nOSvsTlMfGjyUY5AONk2ofSX7mP6h+lh55w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/YzGea5";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11615606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11615606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/YzGea5
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso152404f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778770; x=1794383570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
        b=b/YzGea5le2NLiLV9IA4m5eyzDb06iVw5LaO56+9lpfwmtHxUE9VaN2rvT1nZ7oBOT
         3IKmI9pboXsoyQz+huvqZCKrY7Es403vo6U+Rj5+Al5/QJQIlq1am6P40GciachO7cJ5
         QZK3khQmpJPEf3om+GQdexR3aIRby/C2V1ZhvBgS5Fvflo38l8Adb8hMAsDhtaVpxJ3O
         NCRZ7KBNnX3SH3rX+Ii5eQVIAeiUAAGH9Nidq4DYUreQ0c1Q30puugtCkp77B16E3UBV
         TvyNg6IPibiv12Hrwa9DZkHLErg8c0NT/XThUT2E47dH3G9/whqIHAu1YPCmdaEZSASD
         RQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778770; x=1794383570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RkebxhepJ78TZB3fnHTnhlAKTz7Sll4zIjTAt/wCAtw=;
        b=jNElZxOrxE/84kj3LItrSGlvgLNdvgUBp0kpK58zxNYge0c3kfzaRlQ3rWBzvBX6E1
         PXAndPx0fuL4E1W2c0BulycwLODYU7nX3C0FuLesY6YdmoYrbB8ZRnthoxdXIldg+4vu
         2J9rjSbl448yITHsjWphrwLgHzSmZMUnHd7hjzbiKPaA0KHB4O4Ig7yEk8GwN39ocae2
         LSmCZ3QA6dwJIdcR3rOyseNGLVJD1EzDI/JR9Bop2gY4YUAHx4Bz848AoRDJcYeJNCBr
         ea630uP4cbHvNhM/9m7V0SJeu6QoxAgFlgL+tscNd891BG2FWpDWFW5nk2Lm6OSj6hAf
         pi8Q==
X-Forwarded-Encrypted: i=1; AKwUvByOoOKInAC29dsluJwNJXxabf8QQEJNHR2elSzr9GyHlzK+d86zpUqPSWBgk9oEt+s28B+Y+fWdZpYZri8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xERaxdR6BmeGzvAHtSGR+HBDO6/R/0HJlS/+pZAQ+djBlAzyg
	cvWblAUwYEGDL5IO4/kxquNbY2uJJ27SRXOS9oGHBLsiHuU5UNuCrvBR
X-Gm-Gg: AYBFou2iSvkEm0bKYob7csjVVHdAcGAkwd3ZpWU+4/MnUickKiDXXordc/bfFLh2/IE
	CQbdDxRM6bQDnG7YCh7Ll8EdpXTxQVX6P+VMtVOtqEUsvqMkmY2hH38N/MlUJJYoAvNoluGPFJS
	Tw4K6m1g0kK0ZLNrNYIAhmzt8vYXQyVRt3Jdh+Is+Kd7D4N1eDu8ljcfx/Nz9d/8Q4u432GFW9G
	M59x1SALonSGbmwG61qxgcV5corjwvwEiuhNzFgpg8QnnI9C3Yy3OBUl/Nf0Jr90OSyLptxO+fK
	yANKun58qVNE8Vq9gTuATz0Ovlbm6jLHolR75lzSR4FbLXo0yQDRSEY9kE2Asz3v+sArRVxG77J
	DOPcnVsE7OsWkTmOtarGBOd6GtnDQGRpPhOujNAyU324TN2/VNg6POMYBFzhpigsx0QUUj/1g9F
	DVQIUatAB87pufP7akWFTD85eJV0rvBDgcv8ehBHqqLtqY/XJQlk40DitT7i+jbH7Eo90T0jHdD
	/eUe1RCT7RGzLHdFxo2QVBHMwK8dQoxOYHFUuHe+OyNgPSnLdaqQibZwaQQsCu+fJTbOAno91Rk
	rwJBNAt2GgDyIyaFUDD7ODwMMQEy9+0aABmmRw8LDp/dqDhRlsrAT5bqw+fIQukZQ2Vt08vBpxQ
	WWUhtW0RYszjNdverFCtC2jcNxLORfena456eA3WvtbfnsuH4WFs=
X-Received: by 2002:a05:6000:40dc:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-48e6e30721fmr34220157f8f.11.1793778770275;
        Tue, 03 Nov 2026 23:52:50 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:49 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v2 0/3] drm/panthor: Report fault information to userspace
Date: Wed, 04 Nov 2026 08:52:38 +0100
Message-Id: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gb6EUWvIi6KJhqQVlotgnh3i
 8u3mHkgURRKMFQPRMqSJPgCU1cwb86vhLIUg1Gm1Uo3eDh/biEiu2s/UTwHzAatVa7nrtO8WCj
 tEYnl/r/j9L4fPFXOTGcAAAA=
X-Change-ID: 20261014-panthor-fault-info-v2-330a9f771fd3
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Paul Toadere <paul.toadere@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

The Panthor CSF firmware and hardware report extra information when a
fault happens. Two kinds of faults matter here:
* faults raised at the address space level. These are fatal for every
  group bound to that VM.
* fatal faults raised on one of the queues of a group. They stop
  further submissions on that group.

This series exposes that information to userspace, so the
VK_KHR_device_fault extension can be implemented on top of it.

VM faults are reported through VM_GET_STATE. The VM keeps the raw
AS_FAULTSTATUS and AS_FAULTADDRESS of its last fault. Queue fatal
errors are reported through GROUP_GET_STATE. Each queue keeps its raw
CS_FATAL and CS_FATAL_INFO, and the ioctl returns them in an array
indexed by queue. The kernel does not decode the values, userspace
does. Nothing is allocated in the fault paths.

Changes in v2:
- Report VM faults through VM_GET_STATE instead of copying them into
  every group bound to the VM.
- Pass the raw register values to userspace instead of decoded fields.
- Keep one fatal slot per queue. A queue stops at its first fatal
  error, so no allocation is needed.
- Store the uAPI structs directly in the kernel objects.
- Dropped the recoverable CS_FAULT reporting for now.
- Bump the driver version to 1.10 in a separate patch.
- Rebased on drm-misc-next. The queue fatal info is protected by
  events_lock now that fatal events are processed under it.

Link to v1: https://lore.kernel.org/r/20251215115457.2137485-1-lukas.zapolskas@arm.com

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (3):
      drm/panthor: Report the last VM fault through VM_GET_STATE
      drm/panthor: Report the CS fatal errors through GROUP_GET_STATE
      drm/panthor: Bump the driver version to 1.10

 drivers/gpu/drm/panthor/panthor_drv.c   | 26 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.c   | 33 +++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h   |  2 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  5 +++-
 include/uapi/drm/panthor_drm.h          | 52 +++++++++++++++++++++++++++++++++
 6 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 6f7098738fff3ec7393f924343188cb8e6ebc5d2
change-id: 20261014-panthor-fault-info-v2-330a9f771fd3

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

