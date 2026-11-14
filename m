Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651765;
	b=3UW4LJ7h+PSPHCrZtgTAdps2RcO0qtBcGrNsqLGPfTraoZSFJiFJhBl/Z+uPyolCtj5e
	 pr4LRqLMOqE4Xo7E8nccdEcoKxwtqZxzdH0RKQBz7+iz4pGrh1voAowMVIqRGYwA3B957
	 F3jHE8Ab2YvFBQS+yHAQl/4877qhLnjLVAXhWCv+GL+tdP8UQQ2gr++WvTV8YVF/VgyrG
	 QoNg5ROQ9Afi9iiqd+EEExuGNiZkzrxEsF8LmR7MEvDiqz5b3D+tip4ZwcPz9x7mvEhUr
	 yCsSXCtCHh++KhwsJQ/LcaoGVockBondaC2ukZip96tBtFa3L/IRomXRyY0J8ibRppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651765;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=0a134dRu9X1Ur1sERYIUKdBcEn24h4Yr/weNnFMNKh4=;
	b=09E21tesUQneWbUYcwLUe52a2vgEdVgq6pv7kvnK5Hi3C47ykFHmJXtGtp5Ka/7X2LZW
	 QYxpNNfSkjbgeUve7JiGWF5/CiLiSkdX1oL1pEvTTAZbQhwem63uwUPGunO3epx9C969B
	 WAoTPeh4a5LALYPOo2m09A5etf9zbljpLz+6VpC4D1kdPLvM+708csDldYolFzFZPmGFU
	 BdBTR2zDySG1zmAIY12v5cCnfn6OBRpJFY+j4H2Iu7vKqQXuB1+ZWMN018Q+GllHAXZS6
	 2jm16m6zFowcVA48ZpMuXgTKSkIlS3sMbjaFr25y4nRDjT/HbPghxtw0tSMJ+fi4fEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8B606A329;
	Sat, 14 Nov 2026 10:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B8B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAu2-000000003aK-0npT;
	Sat, 14 Nov 2026 10:22:34 +0000
Date: Sat, 14 Nov 2026 10:22:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: rkvdec: Fix the HEVC reference picture set
 handling
Message-ID: <cover.1794645268.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series fixes the code the VDPU381 and VDPU383 back ends of the
rkvdec driver share for the HEVC EXT_SPS_ST_RPS and EXT_SPS_LT_RPS
controls. The defects were found while bringing up the VDPU346 of the
RK3568, which uses the VDPU381 back end, on top of Christian Hewitt's
VDPU346 series (last posted as v3:
https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com).

Several are memory-safety fixes for input a userspace V4L2 client can
submit to the decoder, and carry Cc: stable like the EXT SPS RPS bounds
merged in v7.3 (f0b9d7e5be06, 796b5c6d4f16, 052c5ed5a1d9).

Tested on a NanoPi R5C (RK3568) with Linux 6.18 and the VDPU346 series
backported: GStreamer fluster JCT-VC-HEVC_V1 stays at 140/147, an FFmpeg
v4l2request build that sets the RPS controls confirms the reads and the
short-term set cache, and the VDPU381 refusal removes a watchdog reset
of the RK3568. The same VDPU381 back end was exercised on a Radxa ROCK
5B (RK3588): H.264, HEVC and VP9 decode through rkvdec with no kernel
message across the fluster runs (HEVC 146/147), a per-patch A/B sweep
and a 30-minute stability run, at the baseline throughput. The VDPU383
back end has no hardware here, the code-only patches have no reproducer,
and nothing was tested on an RK3576.

An LLM coding agent did the analysis, and helped with writing the
patches. A second instance, given only the code, reviewed the series,
and has tested and validated it on real hardware independently.

Daniel Golle (7):
  media: rkvdec: hevc: apply request controls first
  media: rkvdec: vdpu383: complete refused HEVC requests
  media: rkvdec: hevc: bound the RPS reads by the control size
  media: rkvdec: hevc: bound predicted short-term RPS sets
  media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
  media: rkvdec: hevc: cache every short-term RPS set
  media: rkvdec: hevc: check the RPS scratch allocation

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 52 +++++++++++++------
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 11 +++-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 24 +++++----
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 14 +++--
 4 files changed, 67 insertions(+), 34 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0
