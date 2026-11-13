Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531949;
	b=5ijPACgB9Jqr5mqOzQxXdDrZ9ZgJ2r5DZEPjf7yR6MuOCDLxFrPEQ2P0F9c85JzQhxdY
	 Ztuk2Fnxsqn6G5/UrNxsSz89VKXHz6R/y/2Ib0BTQmW0qPfflj8XZ3ZOf753kncBlKAm8
	 TUpnfpRjTbL4LAtMkWh50cT78Ymnh/NfxDPyOe8qafsOHOmpt9z8SzF/WwLia0tBS5XJl
	 cQcGzyMPLPPVsoVtE52FfBqfR+kohVP4Rs8rj1A2ta6ImiEaRBitBUC0xYrTq3dM656lw
	 cS+PQcQhCaJCdnYGeErYRqvqTn7CTxzksGXmaLaszAHWMc/kVQ2FDkQZzokUmMF6dzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lwUokM8nYvp+7zV+c2465suIhzOf6J8xJJ1hVtNJbzE=;
	b=RW3QwrFDOo1DIeXc0iEBA+wVNu7o4n1OfvJwboxlGwOSBXjlp8KTSZTJAbDaEhA6eNQp
	 bHJhbTd6UfgsSJQm8gyvCsI6O71gWbkkERvuLpptfRdGOSJLGMpI/t0nVSatF2nl6VYC4
	 xkwQOSECUY+vZjvcAGMHpIlBWUPewyZdAflY/zta8b+HjeAmePYijhlpOvXOTzBbu0Pds
	 quXmEcSowzij338iaoIb7GvciXBxYS/AhTxqpdg/7v5bbAkdQs0T1ATGxsIfR2Hc5g3nu
	 4/hfw85TLmpdCxTTv+dfk+YqnQ+PjZsgAoRCt7Nzzbq9h9hHZNtlGOmPCGmDmBIEIGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=iCJFF0PH;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD558606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD558606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=iCJFF0PH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3iaUfeSJheybFmhRCKtGmAwKW8MrZhj1xyUGO3ic1L4=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794531946; v=1; x=1795136746;
 b=iCJFF0PH/bBXXqycUQIXn6N8e6Be/ikwGEQvq7Z4Lk29ygCDykpLLz+PKFFnLb8CatY5JvsL
 eiUG4iRxnpGRDq2HLNtyIHvc9IOGG4aG5bXWMWvjGpQtyBjpe9Kgo4F/K+ZAU5Q4SpIarO96Itt
 Z6uB1qvFCSD64jb0lZ96HYza6sbRqt8Ag0+tS4Wq3EruF52zPE1TMvUFsSShak1V7D7hLSZH4rY
 tU8Ry2gqBNxEuiQKFLphEavyBNlhlDl/A4Xbtv3HCiZ4YeNNa8gIDHFjTPsTO8ahWdlhQK0B84y
 Ql2mnGdwx+e/x6nrAep4g5R8X3FFpiV4l4yVG/4mwvGBQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4dddcff22dcb560;
	Fri, 13 Nov 2026 01:05:46 +0000
X-Mizu-Trace-ID: e4dddcff22dcb560
X-Migadu-Flow: FLOW_OUT
From: Cooper Morgan <ext-github@cwooper.dev>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/amd/display: Fix FreeSync infopacket refresh rates above 255 Hz
Date: Thu, 12 Nov 2026 17:05:26 -0800
Message-ID: <20261113010529.11514-1-ext-github@cwooper.dev>
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

On my MSI MAG 271QPX32 (320Hz QD-OLED over DP 1.4, RX 9070 XT), 320Hz
looks like a 720p image stretched to fill the screen whenever
Adaptive-Sync is on in the monitor's OSD. Custom modes at 305-315Hz put
it into its self-test pattern instead. Windows is fine on the same
machine and cable. It's the same bug as
https://gitlab.freedesktop.org/drm/amd/-/issues/5988, where an LG at
280Hz shows up as 24Hz.

The cause is the v1 FreeSync infopacket, which native DP sinks get
unless they're a whitelisted PCON or support Replay. It stores the min
and max refresh in one byte each, so 320 wraps to 64.

Patch 1 caps those bytes at 255 instead of letting them wrap. With
patch 1 alone, the MSI is correct at 320Hz and the LG shows every frame
at 280Hz, so I tagged it for stable.

Patch 2 sends the v3 packet to sinks that advertise AMD VSDB v3 and go
above 255Hz, so VRR gets the full range. Sinks at 255Hz and below are
unchanged.

This builds on what sunryze and oystersuki worked out in that issue.
sunryze found that the VSDB version was only saved for Replay sinks on
DP and tested sending v3 on their LG. oystersuki suggested pairing that
with a 255 cap for sinks that don't advertise v3. sunryze has no public
email, so they're credited here instead of with a tag.

Tested with the series backported to 7.2.13: 320Hz looks right, and
with VRR on, the monitor's refresh readout follows frame caps at 300,
270, 240, and 100fps. oystersuki tested both patches on an LG
27GX700A-B. Since v3 now carries the PQ bit from ebacf0a7ce54
("drm/amd/display: Signal PQ EOTF in FreeSync infopacket for DP HDR")
to these sinks in HDR, I also tested with that commit backported: HDR
looks the same. Both patches add KUnit tests.

Changes in v2:
- No functional changes; rebased onto amd-staging-drm-next.
- Patch 1: dropped the claim that an EDID range capped at 255 sends the
  bytes this patch sends (no FreeSync packet is sent then), and gave the
  result of running patch 1 alone instead. Also dropped "once the
  wrapped value lands inside their range", which the LG contradicts.
- Added tags from oystersuki and Harry.

v1: https://lore.kernel.org/amd-gfx/20261031041827.162730-1-ext-github@cwooper.dev/

Cooper Morgan (2):
  drm/amd/display: Saturate refresh rates in v1/v2 FreeSync infopackets
  drm/amd/display: Use FreeSync v3 infopacket for sinks above 255 Hz

 .../display/amdgpu_dm/amdgpu_dm_connector.c   |   2 +-
 .../display/amdgpu_dm/amdgpu_dm_freesync.c    |   7 ++
 .../tests/amdgpu_dm_connector_test.c          |  25 ++++
 .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c | 116 ++++++++++++++++++
 .../amd/display/modules/freesync/freesync.c   |  12 +-
 5 files changed, 158 insertions(+), 4 deletions(-)

-- 
2.56.0

