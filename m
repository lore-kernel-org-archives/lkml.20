Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641085;
	b=lr8VsXaESPxCjo/cOYGtfEklpHPEhUt9Xt0eig9p2CHcURXWYH8/5ATqMKmJWHMEyh9Z
	 YDrUKdEts4RQSPW2JnoAy8vJVP+42R31PFEUYvmZZwibcoTCPGzR9o247gwOeJZZfqZNZ
	 edAWY29aKOxH0LCcveJ4eWGexVElpvj6S/9JT2GsztiBmpn26d6TQcLqdKwAzJU3c/d4B
	 ngMU/GJ0YPS9TV+lTJJjCw9f5GII1Bvv80rC7cj0X1Yn6XKv30uhCXIia0CUyfioFhOVv
	 flN4XQ+TEB1ZwuZzEe+SwzGjPxjlPmYtl0jnNpRW+gJWeWwzxD0/c8c8+yrce79iJ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641085;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0Qc2GxRm6ZmtL5R5rxmm+t/gguLUouIujMmTkOzIADQ=;
	b=EyvTOzZzCWjWDr7vKF2ek8udkK40gC5f79JJxrCGFl3jF2cLz/q5mWKTRiy/gIa5LEl4
	 bHv7mtFZZG6dcabHvuIyRriBp0hlXCLe05VaaCBlk8S138T50AKz79UVunNoXc/D27bOg
	 mVz5Nwi3BzAZ4pG5ktt96fvXMP3YmfguesmZZv7fa/8SapglUtmE3cggF9wz8fxtMcfRt
	 jQRV7DGCU18IcwfSNjxJWjk++9+Awgijg48388ogAfTKRGKDW08IOfXae0ygY7MGQfrsg
	 tHhAiYB8wqahOdd5tEEb1kEECoEJCwojNz+9z5hWyFo4mcSsGOTx6SKHzpdFp/IqMbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glQdKfhX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A9D606A90B;
	Mon,  2 Nov 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glQdKfhX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F751F00A1B;
	Mon,  2 Nov 2026 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641084;
	bh=0Qc2GxRm6ZmtL5R5rxmm+t/gguLUouIujMmTkOzIADQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=glQdKfhXfnvLTAVJec8U+gWkjHlBwfd5BqI2P5umGI06FIfjN5vQHJ21atZckMGIz
	 86yWdEC/zXbFO8cm8s6hTw17KZ4oC7mgb2BYmCEfVzJUG9YTUmDUazR6c3rhtPqnAZ
	 jszfU6qR/pYZdSxLnCLexIwZOslLJ+6w+Mf1F9P2CpQvWwDV72XIPjBd2BimX90XA6
	 iYfQRyacHJArM+vI856ZmUvbS+SL01BmXePi/JWlxUHeIKe48UVZ4iQkg3TUeWNi56
	 Z15X4L5HBC4iOWT7jpNpl/D2aSRHBdzqyqZLinETMn/+/NbvO57NuYK40E2+A4g7pU
	 yyQ2sYImN6pew==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
	Mika Kahola <mika.kahola@intel.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] drm/i915/psr: fix up the drm-intel merge of psr2_sel_fetch_apply_su_area()
Date: Mon,  2 Nov 2026 12:38:02 -0500
Message-ID: <20261102173802.1658146-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auijDJ-9T2YhFE80@sirena.org.uk>
References: <auijDJ-9T2YhFE80@sirena.org.uk>
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

The drm-intel merge keeps the full update clip_area_update() call that
drm-intel-fixes has under the skip_su_area_calc label. In drm-intel,
commit dd038a8d440a ("drm/i915/psr: Merge the selective fetch area
across joined pipes") replaced that call with a plain assignment of
display_area to psr2_su_area, which now sits right above it, so the
leftover clip only repeats what the assignment already did.

Drop it to match the drm-intel version of the function.

Fixes: 9665afc4c1d9 ("Merge branch 'for-linux-next' of https://gitlab.freedesktop.org/drm/i915/kernel.git")
Link: https://lore.kernel.org/all/auijDJ-9T2YhFE80@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this applies on top of next-20261102 and is meant to be folded into
the drm-intel merge. The resolution in your mail kept both the
skip_su_area_calc label and the clip under it. The label was gone by the
time next-20261102 went out, but the clip stayed behind.

With this, intel_psr.c is identical to the drm-intel for-linux-next
version. No functional change, since the clip is a no-op after the
assignment. Built with W=1 on x86_64 defconfig.

 drivers/gpu/drm/i915/display/intel_psr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 6fbaa262b31bd..288836d4a993c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3133,10 +3133,6 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 	if (full_update)
 		crtc_state->psr2_su_area = display_area;
 
-	if (full_update)
-		clip_area_update(&crtc_state->psr2_su_area, &display_area,
-				 &display_area);
-
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
 	 * every plane, if it does set the plane selective fetch area.

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
-- 
2.53.0

