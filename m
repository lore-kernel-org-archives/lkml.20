Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661118;
	b=G148ejryJfnBrKFqq2XOVJdC5fo+ItCfEUgLL3TuTSNudH0CQx76ICDLKkG84dNPExoW
	 paLot1kPTyq9g5pjS5nx8Y6cFA1QtfqFxJ6+DrO5leswr8BbW/z0WiPGSodeolPVnsire
	 2MKJTkzaUohHcfetcaux3yrjSsOwNNFydtOkpbxpWcEV1ae55ku6YwGL9pqeWTvhDWvBJ
	 JxTlPIbJ7CnBcSYB98kO2kkmfblJJNetMkcmQN2E8LKXj6pJ8DEmYwEv/ThthvfcPLG/w
	 YY8YNEgJ+wd83RrKAZ/WRX97CeF6ZKN5mAThS2FPxsYFD3ZKYF6DfKs1nDFUMyqAlJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661118;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=X+1hRMf6PJJ+U3BKfeC7Q6VI/pjZSymvyopj0O0hLnc=;
	b=CUMl7Rao3gwGT6ik7vAk3bDSH9uBuRI10aX/FimF6Itq44NSFxOVtHb27Iru8bafSY+z
	 ivKE0jsKlRCq4hv878DpQfnr/IvIfbh2Wdt0V/F1PHcJm7HUUn+8cjNGGgPMh6adhm1W3
	 N8Ut4CzdlrTG0mJxwINpX5YgMLu9FuTff05RbJzyxEaC9DPXncQijqbAfbyb+KawvGPEI
	 0AyTbdKX2uJnfysId7RkeIZCG2OWMVAm5FQXkPIVswqPqrZ88FYCAw7J9guRIanfoRKkO
	 lsEvI7vDiqEaNRiHlCwmQ4ice5zJXzxJKfD4Kr/rcG2NK4mDf0rm3CdbOyZHiV50gPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHh49cJ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AFE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHh49cJ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5871F00A16;
	Mon,  2 Nov 2026 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793661117;
	bh=X+1hRMf6PJJ+U3BKfeC7Q6VI/pjZSymvyopj0O0hLnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XHh49cJ4VpHKgOx81awsd07QxDBtTnW0ZhWZMRnLJSL7Iq7i0rZtg+CiK73xPIdH8
	 teUuDtuCT2Lm2ifTYZE5u3vtGQ/5vkIvk50fhCLMKic7ZMcrGX9kLCwC3Xcgpyazlb
	 17qBhZztASSiM8SrWK9b/bvBD3yofgW5kkyVDTuK4NzrZdntxqo9LZP8lGBQRt6Kh5
	 97aMXHPsLiC5acV3eKKiC1XcdaqtCn6RUnlHSSFYIwm8faLVbgwmT7a0JuB6/GAnST
	 fdciJEp6SC1bRd9zuDn0qlUEHKPiPdrtRPsONuvD0VcfbA7oplUCgVzkpW4XRbWUCq
	 mAO/VaTMnxHHg==
Message-ID: <9c15c580-e62d-4726-9d4c-911eb9378241@kernel.org>
Date: Mon, 2 Nov 2026 17:11:56 -0600
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
Subject: Re: [PATCH v2 0/3] drm/amd: Enable 2x1 tiled display support on Apple
 5K iMacs
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Richard Lane <richardlanedev@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <9c9310ca-9c2a-4aa3-b03c-83fbaf17710b@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <9c9310ca-9c2a-4aa3-b03c-83fbaf17710b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/1/26 17:22, Richard Lane wrote:
> Hi folks,
> 
> Apple 27" 5K iMacs (2014-2019, iMac15,1 through Polaris-based iMac19,1)
> drive their internal 5120x2880 panel as a 2x1 tiled display using two
> 2560x2880 streams over an internal eDP root link and a secondary DP
> link.
> 
> At boot, the Apple EFI firmware initializes only a single 2560x2880 pipe
> and leaves the secondary DP tile unlatched with HPD deasserted. Because
> the secondary tile reports HPD low and requires a vendor-specific DPCD
> handshake before it responds as a DisplayPort sink, amdgpu currently
> fails to detect the second tile, leaving Linux limited to single-tile
> resolutions.
> 
> This series enables full 5120x2880 dual-tile operation on DCE < 12 Apple
> 5K iMacs so that the internal 5K panel behaves like a standard DisplayID
> tiled monitor:
> 
> 1. Calculate the pre-OS framebuffer reservation in GMC v7 and v8 using
>     mmGRPH_PITCH and the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
>     vram_start so the full [3 MiB, 59.25 MiB) Apple EFI scanout surface
>     is preserved during boot handover without vendor-specific quirks.
> 2. Point the secondary DP link to the root eDP link via an EDID quirk on
>     DCE < 12 (covering iMac15,1, iMac17,1, iMac18,3, and Polaris-based
>     iMac19,1), latch the secondary tile via DPCD 0x4F1 on the root eDP
>     link, write the 3-byte Boot Camp source table (0x310) on the
>     secondary link, keep the secondary tile out of D3 power-down, and
>     unlatch the TCON back to single-pipe mode on suspend/shutdown. Once
>     unlocked, DRM's DisplayID parser populates has_tile, tile_group, and
>     tile_is_single_monitor on both connectors natively. (DCE >= 12
>     support for Vega-equipped iMac19,1, iMacPro1,1, and 2020 iMac20,x is
>     noted as TODO.)
> 3. Report all_displays_in_sync = true to PowerPlay after
>     dc_commit_streams() whenever all active streams are synchronized into
>     a single timing group by program_timing_sync()
>     (timing_sync_info.group_size == params.stream_count), allowing SMU7
>     to downclock MCLK at idle without modeset underflows.
> 
> Changes in v2:
> - Patch 1: Replaced the hardcoded 64 MiB Apple quirk in amdgpu_gmc.c
>    with a generic calculation in gmc_v7_0_get_vbios_fb_size() and
>    gmc_v8_0_get_vbios_fb_size() using mmGRPH_PITCH and
>    mmGRPH_PRIMARY_SURFACE_ADDRESS.
> - Patch 2: Dropped the DRM_MODE_CONNECTOR_eDP override in
>    amdgpu_dm_connector.c in favor of DRM's native DisplayID tile
>    properties (has_tile, tile_group, tile_is_single_monitor).
>    Renamed tiled_peer to apple_5k_peer and set it only on the secondary
>    DP link, removing dm_helpers_wire_tiled_peer(),
>    dc_link_is_apple_5k_secondary(), and inline explanatory comments.
> - Patch 3: Made the PowerPlay sync check generic for any combination of
>    synchronized displays by checking timing_sync_info.group_size ==
>    params.stream_count instead of tiled_peer.
> 
> Regards,
> Richard
> 
> Richard Lane (3):
>    drm/amdgpu: use pitch and surface offset for GMC v7/v8 fb size
>    drm/amd/display: unlock secondary tile on Apple 5K iMac panels
>    drm/amd/display: report synced displays to PowerPlay for MCLK switch
> 
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  8 +++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  8 +++--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++++++
>   drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
>   .../drm/amd/display/dc/link/link_detection.c  |  7 ++++-
>   .../dc/link/protocols/link_dp_capability.c    |  4 +++
>   .../display/dc/link/protocols/link_dp_phy.c   |  3 ++
>   8 files changed, 75 insertions(+), 7 deletions(-)
> 

I'm happy enough with this approach.  But Harry and Leo should comment 
on it.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

