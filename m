Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575332;
	b=X5vDqZFJ4KU9Z1q+k3WjCg+Qwo4wLheIQb1+kJkQb18jIx1hM/W9Jpefk9FDUsENhS4j
	 lAL322fSWn5SB6EB1Qx+Ws+0EIY6kY76Z7fPsVswIo66Vbam/rIb1AUCYJgWH1aIX0Amk
	 lxVrMv8Oq7aEx6xsqtip25Qqwf8gvsDg0HZHhxz3sFy3tDQw+O+8u3xbIYIByoo1RxhO1
	 9yx6B9g/rqOjbVByY7u1JHuQaSmT22ZEc/gvIjF+K2XNLORIeQDzRDLEcXmvwR8LcO72g
	 cIZppMaMWsLVZ7IJfNSfn5PbC25wpTmxDtxyEM+DmEp9lMmxjMdFfkSPxvA7INcIYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=K4MSO6pcyXAftScjjOcAhCdWHBG+owT/f6hFef1DRbg=;
	b=pk1GibDt7LExBDxjCgV5127fLRERG5tX0oHUWYB5+zFQ7ySGL2l1FNS6J4pRfida6YbO
	 JSg8LY9feTnMQ/UlIu5DpcnQMtcWxIqeCEUGrd2DicArYcYCGx4hrW+jLTvTIYrE/Lo/x
	 kLHUuXpsRYW4ImvIjS3FJ/IQxp35TkG1dvWA6S6TWcVkz9QuEYsEeldUgC9qRv4tKQ2x0
	 opaNEwd6/ctICE4qDcv8wOhQh9heIhLabP/Q9OLmoWk0Qy14w4/eCPGTKgVGVgYTsw2ka
	 84Y+ucV7q6z65slqSu+hbtH6iS3Jk6QB+Y68yYDzY4nFOmZvBvfP9iRBlTEG3IU3hFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUktLfXx;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424E606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B424E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUktLfXx
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a77811be24so14481865e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575330; x=1794180130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K4MSO6pcyXAftScjjOcAhCdWHBG+owT/f6hFef1DRbg=;
        b=lUktLfXxZcnq43AsThU2sU9/MXaXPTkr/o4HlhnqXcibSPn4aapPw7uXq9V284o/c8
         UAxMpVErCk0g4NgKqrhFNHlabB/AEqk0LNNCJQKynPmGNOJ/TvI/6hwQkQCPzJg0+p4Z
         +5HJ78XzxbP5D/mbuyOHrBdEzwHtyLRXQ4rc65wlcKj9h2CyRit8xpDO43buEWmg6K1y
         x5N5mH5c/DidgtSNFoCHe5+gvGqV1w94nYe8HvCXs7Lc+HdeUmqnzqQvIJhJ1e8oD3zk
         HcvcRxpfaSu9T4wfq2KmWq9uBHzqqsD44xEgXKWwe5xpztUA3m+ztPbi2Km/HEdKDXOK
         sTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575330; x=1794180130;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4MSO6pcyXAftScjjOcAhCdWHBG+owT/f6hFef1DRbg=;
        b=b7ZSh9w5gfR8SKd7n+KA6/JqFxpcqLw2ceAcjcZKeYfeXtXv35K4KCtXz0cjMUtsM7
         iQEIpoFBMYvKPlcElhP6Z+SARAFb+BPGpo2U92HCDCc5P/uZ6agQhPpR37wLg1OBnEAq
         XGn6OQq85bfAGgs9W+5Y+KL5tXEKyt7/bCC8oV1prFDluYl2wUSnqvx00c+llOmp7Z58
         3dxBJkj3WQHmsDEGG1ne2qH73HPSmphAdec+svyjmQQpoR4k3WAK4v9StHXE72MlNRFB
         vQ0Mt2R+BURASd1lAEsXidQ6x3uEhiUPnl1Z5P2kCByq38kLk6NgAvqt7BBJNu1OB1/R
         bPcw==
X-Forwarded-Encrypted: i=1; AKwUvByDhjueBjbA+dlFoUrKTRCa8Q0Rn5OO9aisYq2f7i1ILN9w4ivb22TZWfB0WZXuc+9ydGp35akT0j8SpMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxyBZ+8AzpCP2OPECF/xFW3piAwOOPAWKbjOE47Sf2fXKw72V4
	roicaJ8kidfrjimkfp/Lu3S4ikDcJbu96MH+8wBXsZiu84aKwiJPMtS+
X-Gm-Gg: AYBFou15HKEy1Q4xGs/wA2KyFhRu0maydjmXV526qJ9+p77polJGaR0eZ3R+kQ/LxVE
	q/m6rySfDafukJsHjFTBqh6IejhSu+ijr/g6gKQti/CLk+tRca2186x1ii0xTfkTLbYhuD08HXo
	Qe9z50JvHTGW3kI/OOkDGdhWEHKShzznZMH8J+0Lzq3WoYmNxezGaC/lAU0TjAOyZO+LKtYzNlm
	S9M6oP3EPyTN16mEeJ90UP58GuicveX6S34tGFTQiFqt/LvwPS2Kq1e9pjY2nlDjjE/HH7mNybC
	oSEhzID0r8GqyOahcOauR6MQ2clcNMZzbOqJIESxoh0BzSbJ5ctTQL+fPjQJV2Zmy6KtCNPEY0C
	VelX0DRlGPhqToS38BZuAkcV7H+GZH6lh7OthjW3e47ty6cPXj84vxFOe0sQH/MjEvVJYT8RixM
	iIKOG/uT6fzWHVdLpjVCNcqeEF/J/lcouHQWt3TZB+yASl2FKWi+ya//+4TpWsCpQ4QBbAnwPaX
	iv5ds9OPDL47q9sMADxs08NwThK4DgR9+vJm0m+G2a3HIFKwTwS6AM3aMF2W8qZPlRzwQ2lHgZj
	JzorYxaFnv0eNZOJFwOK/IoXmJfnQ8vE1g==
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr202114225e9.4.1793575329980;
        Sun, 01 Nov 2026 15:22:09 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm367155575e9.3.2026.11.01.15.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:22:09 -0800 (PST)
Message-ID: <9c9310ca-9c2a-4aa3-b03c-83fbaf17710b@gmail.com>
Date: Sun, 1 Nov 2026 23:22:08 +0000
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
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v2 0/3] drm/amd: Enable 2x1 tiled display support on Apple 5K
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

1. Calculate the pre-OS framebuffer reservation in GMC v7 and v8 using
   mmGRPH_PITCH and the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
   vram_start so the full [3 MiB, 59.25 MiB) Apple EFI scanout surface
   is preserved during boot handover without vendor-specific quirks.
2. Point the secondary DP link to the root eDP link via an EDID quirk on
   DCE < 12 (covering iMac15,1, iMac17,1, iMac18,3, and Polaris-based
   iMac19,1), latch the secondary tile via DPCD 0x4F1 on the root eDP
   link, write the 3-byte Boot Camp source table (0x310) on the
   secondary link, keep the secondary tile out of D3 power-down, and
   unlatch the TCON back to single-pipe mode on suspend/shutdown. Once
   unlocked, DRM's DisplayID parser populates has_tile, tile_group, and
   tile_is_single_monitor on both connectors natively. (DCE >= 12
   support for Vega-equipped iMac19,1, iMacPro1,1, and 2020 iMac20,x is
   noted as TODO.)
3. Report all_displays_in_sync = true to PowerPlay after
   dc_commit_streams() whenever all active streams are synchronized into
   a single timing group by program_timing_sync()
   (timing_sync_info.group_size == params.stream_count), allowing SMU7
   to downclock MCLK at idle without modeset underflows.

Changes in v2:
- Patch 1: Replaced the hardcoded 64 MiB Apple quirk in amdgpu_gmc.c
  with a generic calculation in gmc_v7_0_get_vbios_fb_size() and
  gmc_v8_0_get_vbios_fb_size() using mmGRPH_PITCH and
  mmGRPH_PRIMARY_SURFACE_ADDRESS.
- Patch 2: Dropped the DRM_MODE_CONNECTOR_eDP override in
  amdgpu_dm_connector.c in favor of DRM's native DisplayID tile
  properties (has_tile, tile_group, tile_is_single_monitor).
  Renamed tiled_peer to apple_5k_peer and set it only on the secondary
  DP link, removing dm_helpers_wire_tiled_peer(),
  dc_link_is_apple_5k_secondary(), and inline explanatory comments.
- Patch 3: Made the PowerPlay sync check generic for any combination of
  synchronized displays by checking timing_sync_info.group_size ==
  params.stream_count instead of tiled_peer.

Regards,
Richard

Richard Lane (3):
  drm/amdgpu: use pitch and surface offset for GMC v7/v8 fb size
  drm/amd/display: unlock secondary tile on Apple 5K iMac panels
  drm/amd/display: report synced displays to PowerPlay for MCLK switch

 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  8 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  8 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 .../drm/amd/display/dc/link/link_detection.c  |  7 ++++-
 .../dc/link/protocols/link_dp_capability.c    |  4 +++
 .../display/dc/link/protocols/link_dp_phy.c   |  3 ++
 8 files changed, 75 insertions(+), 7 deletions(-)

-- 
2.55.0
