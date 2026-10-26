Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054718;
	b=Zw9ld+kIIvn9o6RraL0oDlueQxvNBfh9b/ehM2iMya0z3zhb+xduGxalXJDc2YTkVFVu
	 feN+Bc9Ro4H90gXmQnsMTnROHCCAW4UI1+giui9wQ33Ewuf/HkIUXgpsEr8hQGekOln+v
	 DHxRBRsfApEc56YfzH7veUQbE8+YgGivJx42t5IQIBaR/LTBa8DBosWc08Q0AZgDByJyI
	 t0BB0rkQ5Zf4fXtIU7bnfmA1Pdrt0Or30xl6AjekyGKX+vXlzbHtU2FvSycntNhihEL4q
	 D8dWcrbrVHq94YbbyiGwxXDWMNJps4LdHvX8B6PRIvhKO5mk+Z+xm7HpyclnDX8X/+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=J+L7bw3dA5fk3lxjoeNRPOpOrA1fQj1+m6AAzdxl9Ok=;
	b=I/jvXvSIksFqUv3fW9P37sgLaLIPJMqkI+e1Z8HfAssMITDcPGa0ofJqLWEhHy8cAk+q
	 2fdygJRv2cJxZsL949hJJ61FRa5wI/Vo5s7RO06zILY5AhKeN7zrVYLfQBHtL3X2H2GRr
	 0YkOdJrHKAZEebrdafCk5EOSWlf3+7ZcyJkxcaghslTaiJFw2bV47dd+rhjfkK3gpUwJV
	 x+XNjnYKRSVABdVykB0ZFmh9FMBnN+0Pk7Ad8ODEuaVd+KqrMbgc1iXtoKx4k30nayKvk
	 Vvp5cwo4Yh6uK51ZQuyHvkPElFY/nExK2D6ApHwNtLYhOSZe9ZBCZng8l4lglNP5kFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="CiE/jSI5";
	arc=none smtp.remote-ip=74.125.225.134
Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18099606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18099606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CiE/jSI5
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a1d25d7d5dso13787065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054716; x=1793659516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J+L7bw3dA5fk3lxjoeNRPOpOrA1fQj1+m6AAzdxl9Ok=;
        b=CiE/jSI5KlOJz5YYDydOfaXsyU5zDnWFDt8/wevtgaLGyuhQnQUI6LAMq5DF5JRJ3w
         aFv4ujNzVSbGvSQBQw/nR9SvPeKkEVpcn+owWkEsLyouhIN7lZ4/+qr90b0PNGbndDWE
         wMnelyBs0CYaO/+f3Z89kHtscGOJ3FolZA3CPQInxiFknk7IHbVqJ7VRS/jzPh8wuij9
         RP7exONvW35Hjbjt1Bqc2qvSJw1D7R9Ocn5drB8S1I6V4g/4RWAENFLUlGb9tOvyQfnD
         peqESkvyct4VsekqpsbyW/QqknFsZ1/vRlJtMlMdujzcQkJg2ggKNZpGUr+ErcVznTEy
         upwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054716; x=1793659516;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+L7bw3dA5fk3lxjoeNRPOpOrA1fQj1+m6AAzdxl9Ok=;
        b=NUSHTlqueDniOCYfymhc0kuZ0pfrq3tAAUSBY8IeTRbHbgf5YWzx8tYTTgYaBSGN0q
         Ul++cuBTsKxtm/yXJW86oKsevS+xoFOLhGo5AtBhqAYxecq7EWTVqjuI+f6+C+fG6EKs
         umImaIJRszkSMQMt8uxPf9rQM4TUDfv9glO56Qbr03YN1ESjPOz5j4qJ2xer4SzvNOdW
         r2lRUXME1PvuPCGyTqlAIDWhXWgOGAlL8V9fOSErc0XbHCRrurhLSJfBYaPe1ddeCVqT
         5+uK5uevTL3rNmXdORs7mn1+DFJsZ2wTH6Z10BTXFsikfsk0M+m21xmVuoJ9WqQbOWYQ
         rKoA==
X-Forwarded-Encrypted: i=1; AKwUvByz2N0wY8rsz2TwglhRPIWXXSTzWL9RDfQSJ93EkA1uBUGkF1TQdkniOEn/6QxSfrkhkm3caT/XmZ6C04g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO2bZH4UipQ9maiFrQkRrmyX2Yv797UktyebPp2Ira1dnBY/oz
	mDwX//fKwgRtrrrt1GR3LTh8cFcpXphiIqHo8PzZ2m3FsIzCYVbkoxuT
X-Gm-Gg: AYBFou1KIWlvhEqFYl2xGDSDrW3VCAgSQc4gI6BXPRJmxpRrVR2bR3KfUllJkmYT3wN
	kFnegpED3NvIO2NXZqfrLFiL4mwqk2A38XT8t+1YiKnbKWh0Bceqvbujui+PD2R/7dTcYUJbo+v
	JnnD9D4YWqQWkGJUTtdrVa2wSVVB2LEWxyhb0HTo8u/wf80D8ygaZ7riVZqD3Ct2PeMmER222gn
	4WAk+uSUiiD1KOR6q5jxMsBi+LoPUkzCU9jD4WpoTU7wmMNexW+v6xNFln6MnaE+jHKJ+8lXHUI
	ZIGQ0RI0kiaGORXYW2e3XbqdpSZSp/fkOglmBnFaAueOznQpen+gqJkI1oSj0HVeVZ+9nFvn2xT
	b5Zmpijyu3xNav9897vzkMzEhKj6A2MMPIKr6YApSWK0Uisj06qJeavrjN4pBSMxCcSPDe4yVeE
	7Q4rZ+WmGhl+7bMjNVcwxOcCfXK6CrLddnlUNnZfquWcVK5UzgXa//yD4fQ6VZnMzyCdfYeRnGC
	IeDcEkwxxUHKy+ONIJWQCiidKJ4QCULn439CSSpQRmfuZInAwhonWALhaF+0naDhGqutA==
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr151336425e9.26.1793054716377;
        Mon, 26 Oct 2026 15:45:16 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm276910045e9.13.2026.10.26.15.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 15:45:15 -0700 (PDT)
Message-ID: <9045e8b9-2634-476a-b765-c42fbbf44d85@gmail.com>
Date: Mon, 26 Oct 2026 22:45:14 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Richard Lane <richardlanedev@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH 0/3] drm/amd: Enable 2x1 tiled display support on Apple 5K
 iMacs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi folks,

Apple 27" 5K iMacs (2014-2019, iMac15,1 through Polaris-based iMac19,1)
drive their internal 5120x2880 panel as a 2x1 tiled display using two
2560x2880 streams over an internal eDP root link and a secondary DP
link.

At boot, the Apple EFI firmware initializes only a single 2560x2880 pipe
and leaves the secondary DP tile unlatched with HPD deasserted. Because
the secondary tile reports HPD low and requires a vendor-specific DPCD
handshake before it responds as a DisplayPort sink, amdgpu currently
fails to detect the second tile, leaving Linux limited to single-tile
resolutions.

This series enables full 5120x2880 dual-tile operation on DCE < 12 Apple
5K iMacs so that the internal 5K panel behaves like a standard DisplayID
tiled monitor:

1. Reserve the full 64 MiB stolen EFI framebuffer region in GMC when
   handing over from the relocated Apple EFI framebuffer.
2. Pair the two internal links via an EDID quirk on DCE < 12 (covering
   iMac15,1, iMac17,1, iMac18,3, and Polaris-based iMac19,1), latch the
   secondary tile via DPCD 0x4F1 on the root eDP link, write the 3-byte
   Boot Camp source table (0x310) on the secondary link, keep the
   secondary tile out of D3 power-down, expose both tiles as
   DRM_MODE_CONNECTOR_eDP for userspace compositors, and unlatch the
   TCON back to single-pipe mode on suspend/shutdown. (DCE >= 12 support
   for Vega-equipped iMac19,1, iMacPro1,1, and 2020 iMac20,x is noted as
   TODO)
3. Report the hardware-synchronized state of the two tiles
   (all_displays_in_sync = true) to PowerPlay after dc_commit_streams()
   on DCE < 12. While program_timing_sync() already aligns both CRTCs at
   modeset, DCE < 12 leaves all_displays_in_sync unset, preventing SMU7
   from downclocking MCLK at idle without modeset underflows.

Note for review: Excluding explanatory comments, this series is ~ 47
lines of functional code. All added code comments are intended to be
removed before final submission, except for the comment starting
"Workaround for..." in amdgpu_dm_helpers.c.

Regards,
Richard

Richard Lane (3):
  drm/amdgpu: reserve 64M stolen memory for Apple 5K iMac
  drm/amd/display: unlock secondary tile on Apple 5K iMac panels
  drm/amd/display: report synced Apple 5K tiles to PowerPlay for MCLK
    switch

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       | 10 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_connector.c   |  6 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 34 ++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           | 12 +++++
 .../drm/amd/display/dc/link/link_detection.c  | 14 +++++-
 .../dc/link/protocols/link_dp_capability.c    |  7 +++
 .../display/dc/link/protocols/link_dp_phy.c   |  8 ++++
 8 files changed, 133 insertions(+), 2 deletions(-)

-- 
2.55.0
