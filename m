Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900886;
	b=5jl1FeisngFHXGl0JRDU7bNGxlRy4eA0+t98b/bro63Z1XG5v4iDcWVjCdf2slQgeUqT
	 Ok01VwKpNJBoUmIkdr4jnXhxk+UW8yxPYHFj0YSNQWz3uTSa1Xilf5E8+BbylDn0THJMi
	 ZGWpvzz377ymP6Nl1u2OrzHEYYy6LqVMJM6ay7OP3x6+cwnHLJcb9nn5PTvAjJN3CGyGT
	 b0OpxOl1QDorcV4eaRJDfLHQa93I2Dj0lHSSfPqRUEvgTv7IRoGAXynfXaqGxbOtOx2zg
	 5nCj5g0L11rufMiGGbOWIi3R1pi3TVPMYcbKbJrDMNiKh8Ng+KMyUKNzK+LCp/Vi80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
	b=u8G9qDJtGO8FJJ4w5o+a0NH8z/begmtnyO2g2oHnRwWaHqfFYLiOOvh931yqzHb0ZxT4
	 fI9+WdmcWlllB3npzbCEeY588jNvFm6h4Re5bVDdKcWtC9KFKHdAbI0hMqs/ENYcN+mRB
	 i1d0OizAohI7eD833pcJBrKN8EkCg5BthabQzZgUYJDXV2w5mh029oMqpxEHnvczM/7KZ
	 2oRMaYF85puSMPheyTDoW+rEO69hciS2dDV2OK4WbmZgEJAUYpQUxuIi109wG1mxFqv3B
	 KzxOI4xMCve8wmovaAfWOxzBb/qvyIbFyyMW3CPV9tTNiR95RzszydJ8LWCpabrHSGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UcHVUAhj;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33864606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33864606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UcHVUAhj
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3432509c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900885; x=1793505685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
        b=UcHVUAhjlOgC5vn+r/DfTojBQILIlvC796CCzLjdttaWMezCI1GUNgehXALAKecE1D
         lmPt1BgkKzuiENImuapUnFft0fV54XJWiF12/HPmRCJlppWOGTMrEfXchqp+FiQa4Krh
         rADvqEcrmwAQASEiYlXEQHF/5F/L+6l100i8qytWolKaeMUfyrKBzjW0XDgbKJ/uruB/
         v+O9P8yZIiW5cBlkaRyDAQZwFVxvCodXp81DLNrhAoICsKpe3EYbFFzl75NLCR78rR5y
         3mqPBHwZHkd9x6ZtK1aMrh6mjpJjgXjSu8vBSH646/oA/ugNCgK41C2PQvFKzj3awNmy
         IQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900885; x=1793505685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
        b=JUJkWKIE5RCpj/S7CWwTLxsllbEDOQ0+oK5syDWcVrsstuloFmjbcJX0k/kcDiMcG7
         UVcWgtdtQzS9cuMlzF8w/L73H/DkwveW9yi0dWbiu+v5jkoJ5DK+5UIRVMQQ4OOUGA20
         LMcJ7MhMsFzwFTR0/ezry1m5jcWlab0jP5CpL93qoJTskVjbd8Oe1I4ScS6FOaJA1eRR
         /K6uXHWhuCjTYZ2jKaWjLOoNGoJGiYJlSGB8JCtlRi+xeMs8LpkYHYTWrdQHqXTGM8vV
         AKdBRAPw6v+tFKGDGU1rGNp8K9QrwXcMrz9632WAXOECEekOcMgoGhEEXGNMco4M17xD
         XJKg==
X-Forwarded-Encrypted: i=1; AKwUvBzj42KxtyXw/pwQ1YXiPrx7q/pSHqrwHz1wtlgI1Hik904wbFPWVVljVvSE9YfTP7Tm7OO+LOz5KYrrFVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMBh4HlRlkPZQptEdAMU7tFv/MqjPBiHiG2ZXiz0P07fjLI2WU
	wA2sQW+fZZ614UTOXGMPlM/L19GPX5ZppXvd2gyo3rh72H0x7cBsRiU=
X-Gm-Gg: AYBFou3BRbmVp/mBSDpKOgaqfRe0cn4sCyzn8ZvQTVDVC5PXCzqU6eFMBy020oNKvWH
	7cIW4mAc3gTIEBfEegmLE9BTaHK4IC39pIwB4JzsnGd1mW7zsQ3MirYwVn91JO/urM/R33sSTBq
	zRfPgeCYgpiJOLoHbOrJ+2XEcKOQUq4PC6IQjBbxMrqg7QKlxNz6Yujl6v1JBXdFzO1jOalAyYV
	dqzD3o+f2113hW5UPtmZ4hvC3olHrcMGDbaU5SBXMsFqo4z67aGY/2zONQmB22Yyc3Ka2Gycl+b
	0a87oYvrDsVpbz4c/urrSK5vadFWDl3cYqrY2XJSv4o2C9gpxGJTIQJfDZdCH2ZSAyLcsaeH1N/
	7x3RTxn/Wu1KTdNd4nSK/LejysSmUq7aWQbDJSRMvEOq6oRFSD15tdwkGu/E+j9wit3SjzajyF6
	UlWQyg5dK0b74gkGmdcyytPnC/3SgUf6S3KMxhSkRCzbDE3G176mUEsoO1JYlVtdlRwRUPDXTXK
	5UwL19zIbPZCfaL9wIpN5JrKDiIEPueuLnU6Gw+g8Jd/do75IAINytphFAKdNbnyaBF4LX+yy6G
	5CGlJuyei9XLa0U=
X-Received: by 2002:a05:7022:5f09:b0:15e:6541:3099 with SMTP id a92af1059eb24-19933e10e21mr5393203c88.7.1792900884823;
        Sat, 24 Oct 2026 21:01:24 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:01:24 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 00/13] Fixes for apple-gmux and runtime support
Date: Sat, 24 Oct 2026 23:59:36 -0400
Message-ID: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This series fixes apple-gmux on T2 Macs (2018-2020):

  - Fix interrupt handling
  - Automatically turn on dGPU when a external monitor connects.
  - Fix base register read/write
  - Fix power handling
  - Improve documentation
  - New module parameter to toggle boot GPU.
  
It also adds vga_switcheroo runtime power management for T2 Macs, built
on gmux power control, so the dGPU is powered off automatically when
idle and users no longer need to toggle it manually.

Andre Eikmeyer (6):
  platform/apple-gmux: Write switch state to EFI on MMIO devices
  drm/amdgpu: Add Apple GMUX runtime PM support
  drm/amdgpu: Catch register access while GMUX keeps the GPU off
  drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
  drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
  drm/amd/display: Skip panel power savings on eDP links without a panel

Atharva Tiwari (7):
  platform/apple-gmux: Fix power for MMIO systems
  PCI: Disable pcie port and access on D3 on specific amd devices
  platform/apple-gmux: Fix MMIO interface
  platform/apple-gmux: Fix Interrupts for MMIO systems
  platform/apple-gmux: Add parameter to configure boot gpu
  platform/apple-gmux: Add check to detect FSS
  platform/apple-gmux: Add documentation about iMacs

 arch/x86/pci/fixup.c                          |  30 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  60 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  45 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    |  24 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  14 +
 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |   3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  19 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  19 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   1 +
 drivers/pci/access.c                          |  18 +
 drivers/pci/pcie/portdrv.c                    |   2 +-
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/apple-gmux.c             | 377 ++++++++++++++++--
 include/linux/apple-gmux.h                    |   1 +
 include/linux/pci.h                           |   7 +
 16 files changed, 554 insertions(+), 71 deletions(-)

-- 
2.55.0

