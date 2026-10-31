Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420337;
	b=dNDAg+ipO+Dn7SSkezDI5BDmOfLHTCTt8+8W9wOh0McvN6jBrpc30mACccipoPzHXFql
	 /fdDakS1vaUrV9DK2D57DAiHdgdGsUEh/C42dg7RU2uZ1vHw2AqZB6OkKQ39qTUSzxzaE
	 WR20D3tI34MJa0DP62XUmk7wrlZo0K1xIUkpkBJKKcufhVC/RCLxKx99hkTQLWsCD0Bd9
	 OXBjLR/0doNpOfdgGoJlp2OmZx4oRjt8V+ZhlcH/TJJSnQzNKO5LcUcOADzAu/3iRwCRj
	 yeHXGcnPPae9GHTdubmisjSTucqAnn5qDgyKMzMtQi3ed4XCeNpKVznn4xI4XyxXF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420337;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hxIv65ISz3oSbnuq9qC370kkn88GmZmcEZ0xPYG7U8k=;
	b=XBe3yTx9l3Fg9tSoweqT6mVeLZBGiDElT3pDRg24X8L0ce/7A5v3oZxoSspzFFYhR41S
	 vLzLIvWUT2g9LfbaYLCvPo3dFWvKt7KPM0U/yQNj0RAIbBFQ0cf+vAzlshQbxGKkfRxxz
	 McaRdX1jQO8YwMcEbgnJ2QHH+fawpV2a83H3itVdhnuLEQUGn4YJwjvMFUbhv0032UcnF
	 9qPH+ofWcvOOG5G6yNoAdo6EFkZT6DYYwmvmYPej8GZUfPY80BXpY/Qq5kGwxOdh6GjR7
	 dD00zbx1/HGI2mr2IsRN/RDHYTiQ8rzBwLYAoj0keCuMW5/vYMCRPTa5eI73PHSnE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=KAr4jI65;
	arc=none smtp.remote-ip=91.218.175.155
Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=KAr4jI65
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JQRBTsLyo1USJxXJkqovGqVi5MENsxtF02GpdlXi6O0=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793420333; v=1; x=1794025133;
 b=KAr4jI65XUqFsOoIvs9+SFceAWMbXu/ZgpxBjCx1ZbXQz6HmPXWsRNnnT0F5JljmWWTgN3rQ
 VLd0Koh6hz9HK7XELNk+jOS8JsSAC36x386kO/mSF5T76YYUY1ddTwsLs24HIOwISbG4kbPD42b
 9yXQJvhvv5V/Lal/qlngnnMVPpNJUv8tgnKQwZG2ZQc5PlqnOo7NvjEx6lr4z/6a0PGebQ3c/s0
 FAuX6+86DTN5lKW0UR/yr+pLHxkKF8loLHIldkeCR7rQUpug927IYl4V352aCP04iwjr2y8InFb
 8f0aar6S5Jp8Rjj9gIrQig/+spDNRd6RjZV5ZcN1wL6LA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d492372f5c77a27;
	Sat, 31 Oct 2026 04:18:53 +0000
X-Mizu-Trace-ID: 6d492372f5c77a27
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
Subject: [PATCH 0/2] drm/amd/display: Fix FreeSync infopacket refresh rates above 255 Hz
Date: Fri, 30 Oct 2026 21:18:24 -0700
Message-ID: <20261031041827.162730-1-ext-github@cwooper.dev>
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

Patch 1 caps those bytes at 255 instead of letting them wrap. With the
EDID range capped at 255, the monitor gets the same bytes patch 1 sends,
and the picture was correct, so I tagged it for stable.

Patch 2 sends the v3 packet to sinks that advertise AMD VSDB v3 and go
above 255Hz, so VRR gets the full range. Sinks at 255Hz and below are
unchanged.

This builds on what sunryze and oystersuki worked out in that issue.
sunryze found that the VSDB version was only saved for Replay sinks on
DP and tested sending v3 on their LG. oystersuki suggested pairing that
with a 255 cap for sinks that don't advertise v3. Neither has a public
email, so they're credited here instead of with tags.

Tested with the series backported to 7.2.13: 320Hz looks right, and
with VRR on, the monitor's refresh readout follows frame caps at 300,
270, 240, and 100fps. Both patches add KUnit tests.

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

