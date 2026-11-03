Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721203;
	b=IKKhaUT36GSamyafcKnIJbXCbpdUnp9t5a93MICVv8CLLeIbFpEd9ph4pmRS6SM9FrNj
	 ZZmoSwmepl4h5GsDuX07GS+TPQIrFDCNscTR+DbWRsMMfs1UCfBQAt2KbGTKqcAQVZpW4
	 TCC+6QIX/0CUjSeiGlNoCV0D6C6sCsP6BxrmGoH/oWoKq4rWFocWBfx1qhQwMEppN3bNr
	 XNcdPWyoOGKk9rIeL2bu9ET/QUVpJUOr0LaK4kFh8OnzV8t0ne5qdfV9X4C9q/LO5OXkd
	 vYCYvOWFq7/9WLUa/25bT1LW/RA1/173qXSWWX6njR1jJyTWefXefXPkBEHZuudRc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
	b=iGVHz+K3nhECAvzbFlCoYAW7rlqCA9IpmKKUnW4GTwtS+YM+3LQtkCsnjwIHednq2oil
	 GeHJ7SMphIsM5/sCgeNvvJNdLiwqWbd0rJdC5w2ZQ6NnaVezAhYEs8bQB+KijrBiIItzH
	 ufHZvAogB/8hE3zf5h0p2oLQWmiDPDGtiy76Z44kEw3iA44k2FqbuluNh6S66YJogfdiR
	 91a+A4cezyt3tZ4UTFJNjNmrhB4rgX+gGRGA0QkQOs+lUAhXBO0HAb23zH3G2xft+AhTJ
	 B8Xh7xnf1kabxk3yEQBvylUjJFiHtowjWWVj/T6g9MGM0x0Q0L9M3lly7KlrzYmfkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46C606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA46C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso17936385e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721201; x=1794326001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=tSNX67subyw79uMOg4DSMsKrL4qoZR3fWMirU+8bRpPuHGhaWmjkMuROfHKcpYZP3e
         oE4uUjh/767qBQ9+CO+ovt8otMG8ZjjJjjDA/hN7HWBE6LZ9/1w9/VFAs6dCeyFyMaDa
         NejxEV3MAUgDZ2M/wOqitCqlG2nrLA8PhVVvV4hoKsuwwlbGHsRqCj23u6ZCywCohzp5
         rQ6BKIgKdt7sQYmxWVQTA6CFM4OPVOfdtnBAKEJKQW52gE8VLax0Q2iVSto6qbfaFaCi
         qnHpuYQYpLZm1l8fo9nwOiSFp4GOOlMyMyIzvBZgk/gTIMMG3alnfapmXv7+KJOB3EHH
         Gw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721201; x=1794326001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=NDuJGnXepFxN0b81E7Wm73FUxYCgXfFdtCKP/mHlWh/KdY5mrBPEqfrGl9s+U2DdgT
         bjx5XxVHKEyIMqmRyoMbuz71v2nf1jJsSw8XYbh+cMyPujLoy8jNkHzhzhdrrgIHXTYg
         OKjMSFtWBNLv598RJmYxfVSij2/s/jyaluvQqWayHlNwSkm/W1SiCHGzsP+ND076zL3V
         CC4NOBNsn1yDdbb1MIZDlgC8yFmaTOt0AiZk2/9tXp6BzO8vw2Om3xtLlUFERrVtgnmu
         QZtaMKo2Yw9Hakq5STyTgRCgKeSfqx5VTrWe19Z45+JpANkDd2aT5/TODeO43CsMUn1r
         cUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBye/nvqzUCrclu9Reghh8SZLY9kRoe1DADNTdiFiNDRbIwqQpd2SThxKJKVtIG9IeIzLev+CJdluD5BYhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z/K0ZfKt9ce7NEEWTFWD3PRbGneI0abvRrnrgwNmVh9Mw1zLq
	SjHFYe2afTOxNWZRl/p8GGtBQmiHLrQ7Pt8DWFkgGgc1jWm2vhtz2qkf
X-Gm-Gg: AYBFou3Nm2a5xW0kvtXEfx+sn3Z7CVqodvsfi88TOXFKxcO1qa83K0zQrhMqAJfnIDm
	PN2bsTO+MzXbizCP9PjvW47IpSEEUBZoclKtzcY4BGjpj36MPONDizcdxvXte4M/kj4krccAtqC
	dBl3o8mGrhrCfIiLP9qmLaFFVR2UoFLnVylz2KmpHQbl2OFUQyIEXytq2t6QocokZdRxUEIo4o6
	057EpJ3CE/2GhGlL3pvXFiIwQVa6AkHiX0j03wDbdI4CKyZVo/z9QWkdlcVB1vTawB/imNuFsSi
	w9k0T4MUsWaaQtwK2e2riZZ2+xPjLxOi2+0TI6EixqaYmbREq7ZF9c64ZNIxRilJ72IVu8EsKyA
	C4UWUaJGUVxeLjQe05rL3VsNihEpjfRWwHaHPPc3NtQGJYql82CJF54lqJNGfyG3zx4pNmFLlqS
	NEtCru+gwh6IzXyBBBd4snk+cKVsoZ8kiLhcReT614cRiBRvQ82L01n+fBOcO2SCAUyigZBeHtG
	3gilwn2vxopyHw9FAS2Wt/v5fMquBMyaTHJbMwj7+YAREw5mgIiA45eLgyek9fWCeZ0Uio+Lu0r
	9kXMrWa6n0G0Vj3LZLN5bbrHXrzbrawfbhAPtgjVE7SSfEuuNN/LCwJWCVgP5k6uW4dPyAvP
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr237110155e9.1.1793721200982;
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 0/3] GZ302 rear camera (OMNI13B1, OV13B10) board data
Date: Tue,  3 Nov 2026 18:53:10 +0300
Message-ID: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series is NOT meant to be merged yet. It puts the board data of
the rear camera of the ASUS ROG Flow Z13 (GZ302EA) into patches, so the
sensor can be enabled once the ISP firmware supports it. In the v6
thread of the ISP4 driver [1], Mario noted that OMNI13B1 would need a
new amdgpu entry and the matching GPIO tables; this is that data, plus
the board configuration and a small sensor-driver change.

Caspar Adriani already posted an OMNI13B1 amdgpu/amd_isp4 patch in
his RFC [3] and dropped it after Pratap's reply [2]; credit for the
first posting goes to him. This series covers the sensor reset GPIO,
the 24 MHz clock and four lanes in the graph, and an I2C ID table for
ov13b10, and lists where every value comes from (below).

Why not for merging: with isp_4_1_1.bin from linux-firmware,
SET_STREAM_CONFIG fails with error 6 (UNSUPPORTED_SENSOR) for this
sensor, as Pratap explained in [2]. Merging patch 3 would make every
GZ302 show a camera that cannot stream. The stock linux-firmware image
does not start this sensor; on my machine the camera runs with ISP
firmware and sensor setup data from my own Windows driver
installation, read from the Windows partition of that machine. I do
not redistribute any of it.

The values and where they come from:

- ACPI _HID OMNI13B1: \_SB.CAMB in an SSDT (confirmed).
- I2C address 0x10: the sensor answers there; the _DSM returns the
  same value (confirmed).
- Sensor clock 24 MHz: the rate declared for the OV05C10 platform
  (assumed).
- Four CSI-2 lanes at 560 MHz: the ov13b10 full-resolution mode
  (assumed).
- Sensor reset, amdisp-pinctrl GPIO 0, active low: tested on the GZ302
  (confirmed).
- enable_isp, AMDI0030:00 pin 85: copied from OMNI5C10 (unconfirmed).
  The capture driver needs it to probe, no ACPI device claims the pin,
  and the ISP also boots with it left undriven.

Bin, Pratap: the firmware sets up the sensor clock and link, so could
you confirm the clock rate, the link frequency and whether pin 85 is
needed on this board?

Sensor model: as Bin and Pratap explained, on Linux the ISP firmware
controls the sensor, and the reference ov05c10 sensor is not bound by
a host driver. Patches 2 and 3 fit that model. Patch 1 and the 24 MHz
dependency below only matter if a host sensor driver is used, which
is how my out-of-tree setup starts the sensor. Which model will the
sensor-agnostic driver use for OV13B10? If it is firmware-only, patch
1 can be dropped.

Dependencies before this can be merged:
- ISP firmware that supports the OV13B10 on this platform.
- With a host sensor driver only: 24 MHz support in ov13b10, which
  accepts only a 19.2 MHz external clock today.
- Patch 3 needs patch 2: the ISP setup in amdgpu uses the software
  node that amd_isp4 attaches to the ACPI device, as for OMNI5C10.

Patch 2 copies the software-node graph of the OV05C10 entry. If a
shared graph builder is preferred, I am happy to rework it that way.

Patches 1 and 2 have no user-visible effect on their own; patch 3 is
the one that makes amdgpu create the ISP for this board.

Testing: built with W=1 (clang) on next-20261026. Not runtime-tested
in this form. The same graph, I2C address and reset GPIO work out of
tree on the GZ302: the board configuration in a patched amd_isp4
module, the reset GPIO registered from there, and an ACPI override
that lets the stock amdgpu find the sensor. There the clock is still
declared as 19.2 MHz and the sensor driver is adapted to 24 MHz. That
out-of-tree code is in a repository I can share on request. I can
test patches and firmware on the GZ302 at any time.

Related: two isp4 driver fixes found on this machine were sent to
linux-media separately [4] and have been reviewed by Bin and Pratap,
and the GZ302 bring-up is discussed in [3].

AI use: Claude (Claude Code) helped me write these patches and the
changelogs from the out-of-tree code, and run the checks. I reviewed
everything.

[1] https://lore.kernel.org/all/3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org/
[2] https://lore.kernel.org/all/ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com/
[3] https://lore.kernel.org/all/lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me/
[4] https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/

Regards,
Seifelden

Seifelden Abdelmonem (3):
  media: i2c: ov13b10: add an I2C device ID table
  platform/x86: amd_isp4: add the OV13B10 (OMNI13B1) board configuration
  drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |   1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  |  13 ++-
 drivers/media/i2c/ov13b10.c              |   7 ++
 drivers/platform/x86/amd/amd_isp4.c      | 127 +++++++++++++++++++++++
 4 files changed, 147 insertions(+), 1 deletion(-)


base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
-- 
2.56.0

