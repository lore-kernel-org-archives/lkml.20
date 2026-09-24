Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C31E32D6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253056; cv=none; b=NdjlXiwTRFHo3eMPkNOMslDpOAXS9JL1Q3FmSRXUoIthSUPdYkbXzCVuhPj69dPY/Xiz4GpDlarPugbDjqdSQUDYh/yCjQjtqyyYfyg5DGDIVJp9pmwc+3Q6zK10c+USfYAAtrMCPiQxHNv8Ysdlw4QkmzpKHuoq/yLzm9/qNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253056; c=relaxed/simple;
	bh=Y2vPvygsden7BH0x9JcmWlAOFiFi6xLiprxeon4Cp38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ShqiMI5AgYwpmDkxfqPdBPdCyyPRPij5WOEzcg3ZhRCT06mb+reu3a+CccQfAYeo9U7XcfXthZXhVjEkL6X/Hl9eLlV0OQmWPbjlrcqGP7tSyGgFuf+C+WwiJmwlLsn3r/IqPaDbw0b+GNLbAT+bQsw6qjo/y0reGmqpVyblkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G7SFuhK6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G7SFuhK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790253052;
	bh=Y2vPvygsden7BH0x9JcmWlAOFiFi6xLiprxeon4Cp38=;
	h=From:Subject:Date:To:Cc:From;
	b=G7SFuhK6Z/TnEfb2AGONc+xwCi95a+DUC3iOJ+NX+8Gnzs62hhG9TacrU7PcwEPgV
	 Su52aAwB47vhwGWhYQAnqyqQxClEZyec5t+xJNizYfyZMMUvXa5s7Plz8bnCEc91cF
	 kH2layYRkLpy+XhtKIGCrDIp1PRqDJBoVUW+IoK7mqbBVa44J1X6voi5SKhVNseKy9
	 UKkGYQ6ahwvb4AWSMUrmYXUosjFISvN3pSZMerf+x/pjdDgBUshprcMbSIxqBvPH1E
	 nseNhu0M7ZqAlZi0WrxHRTjyCP05v4DrkMRKbsjICNF+QG6MpWJgi9+DUTkollovws
	 EcqX26MydoNuQ==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BC8417E047B;
	Thu, 24 Sep 2026 14:30:52 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/3] drm/panthor: Misc MMU fixes/robustness improvements
Date: Thu, 24 Sep 2026 14:30:42 +0200
Message-Id: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ7CIBBFr0JmLQmlxWCvYroY6WhnAVSgxqTp3
 Z3Y5fsv7+9QqTBVGNUOhT5cOSeB7qIgLJhepHkWBmvs1dzsoFdMbclFx7jpJ3+paux8b+cg2ni
 Qbi30F5Ldp5MLvTe5bucID6ykQ46R26gG57wLPaL1Dqbj+AF1qJehkwAAAA==
X-Change-ID: 20260924-panthor-mmu-fixes-a1832dc60908
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253051; l=1609;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=Y2vPvygsden7BH0x9JcmWlAOFiFi6xLiprxeon4Cp38=;
 b=jO3y3kcEcTMilWPBpCdH/Qxa+iFb/m0jQ/1t5wk9GS8wQiMmhamdNWq9zrxl4/xjqowmvQiSg
 jQd5SIh+yyLBj/HIvP2JuqcURgHUgTysfPtxzyFqXMgknAkk90tVguU
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

The first commit is fixing a bug we've seen on v13 HW. Even though
we don't quite understand what happens (race in the flush-elimination
logic when flush requests are sent concurrently from the CPU and the
MCU), it seems that the downstream driver has always been doing a
flush+invalidate of RW caches from the start, and that we were doing
so up until the atomic page table update changes, so let's go back to
that state and leave the RO L1 caches untouched.

The second patch a fix for a race that could very well happen if we
ever end up with a failure between the as_disable() and as_enable()
calls. We've not experienced this so far, but it seems worth plugging
the hole regardless. The last patch is a much more theoretical bug,
which would involve a buggy FW telling us that a CSG is suspended,
when it's actually. I've deliberately not added a Fixes tag on the
last one for this very reason, but I think it's worth staying on
the safe side by addressing this theoretical issue, still.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Boris Brezillon (3):
      drm/panthor: Don't invalidate OTHER caches
      drm/panthor: Fully disable the AS even if it's going to be re-assigned
      drm/panthor: Move cache-flush after UPDATE(UNMAPPED)

 drivers/gpu/drm/panthor/panthor_mmu.c | 43 ++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 23 deletions(-)
---
base-commit: 45585c3aa285854face65293acc95eff73063d6d
change-id: 20260924-panthor-mmu-fixes-a1832dc60908

Best regards,
--  
Boris Brezillon <boris.brezillon@collabora.com>

