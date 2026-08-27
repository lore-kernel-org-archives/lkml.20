Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F369265606
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797286; cv=none; b=BmmREuphX9UHRA6aXnLgPSqvDe/DggepyAzLAPW1LwyZ7XuLBs2VEQZEVWT/qoXmamUshRc/tJp+jZnEatox9ohEy+O/elCZxhnHBZXI+pXlcYYYzN0teI5qMR3C7E/RA80N8G8QYoitV7YU4AcAnSL0W5Ktfx+DbnuPhkNcAHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797286; c=relaxed/simple;
	bh=JAzPJJH+4zwmEiUOV3hdmVYeuzFey/u895DwKnn/vZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JS7heqYb2C4GFmv0ilsZxJR4fEjtZNHS0N1bJwUKah2GZJMwHMUD4vwC8tMOAxP45lYH7RH+uWyGygl6o1loobWhluPgteIvGbjJlb5jvpfNJk/MV4j2/q/8a72N3CkEoD8C5f0NdaI7EB4p5x9QC7ax0eMFdYwpefOqS0nEpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJ+72o1A; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJ+72o1A"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39641d0dba5so1042394a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787797284; x=1788402084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
        b=sJ+72o1AxUV/TX1YB2mufb+nMJqOBoVaFoApt/vFzPLw5EdLwj9enUBkIivQ5DI1g8
         +3elCb2Ii0324Fjwf1Uj5mme84aj5bjNBxyxYBoSlWw7QHEeWFZjD8XOC5cTv6bEdXyj
         9NhrTnPz94UbmP/C6HzvHqauc+pZcti5zD84LnjsUjiOFKBQgVMspc4t25QHQcBJ25RQ
         y2jD/DYcOYWtVUAnOq47lYumHE9/nHPJ9p8QbZXBk32SNNeQndBb9+8PERGlSJ/uffTy
         Lb74mPEeOK1TXNtpnuo7hevxB0/XxlWEW/c2h3oZHRe1huI5tV+R7zGmfri93MePS8K1
         zeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787797284; x=1788402084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
        b=pqML7eHp1+eju3DZB+6llx4HxGjo0jYSFOGfkciOxmxN+JWXv5s9jZEmLhX/OfhEhj
         KdgbIFlPDfiKttqCPxD520JOkWc9wn0hGk36S8KvKmYXCeQoQ4s9SpLEOpVuKk2Dy5aJ
         d+E0xxzBAJaH4HZhG0rRALoMdGHqp4Ow4gXC6eqp+vKutIu7IvqqztwX6kiAn3ZYnyZz
         eVFvq70795giaeqdfxH/VSyVqk/zhgkP8qSxtTUqzDebDHrByBpa934AgLV6z4lCxwLQ
         DFCxBmoelreI4l9lLe28njxV/AVcCvftzJez46qVAAKueVYrkIzp/Iw21fOlXfGhtHT2
         GTXA==
X-Forwarded-Encrypted: i=1; AHgh+RrH3wl4UR3kvcz6ds/WsMIboyT1vd3+I6UKqLZCeaCMfulFilUCkMxzaBvlt9H6MNlW5xb4DRKKEFL25Pg=@vger.kernel.org
X-Gm-Message-State: AFuF++kP0XDEDPyAugdk9Ue5fZ7YelvM7+LX3hqWgY1Bk5Tl7oSAWX7w
	Yx98VLtWts0ab+1GMrBlTjiGtUxkzJCefcUDkXbekR14Hd1UGiRQUa47
X-Gm-Gg: AR+sD13ErZOb412aDXrviCPD8afCczgIPl34NMo+tJ3YQLEoXmx7IYjrvBZWrYJvHHc
	CqHrHHWldJoHU0QtKSRrAeRZKpx768oaNaHN3xajoT3/zKtS4uQeT9Sb19Cj025B/qmu8rGBu7S
	hB4x+Ebv0OKVJPltPveUi7V4qbPIMOgG+kQIFoS1yLba6Ejkp2pLfsvhoPG0aUJV65FgZLq8WJ5
	YfgvDVMlDzIKSG8bumY7TZw4GXrz1nBmnVGqnl1eav9wRnkygYAxLNgsRYZLQkcK/vmGgvs7igt
	s7a/rENlvrDU71jFvzNS/eaZzWG7z5r5TJo7NQOi6Eonwb8wk0X28bVrwUJDEUgbQIVs7MB8gHF
	SB/6UfaufOTesMsM/wLkgkisVv3gyQFIpkGALKHb3EduF+R3i7Ca0kHcYdnxvrkkilETAvstp7z
	LcWcl7hX4jkK+4MPcHWumbu4k/rdm63cEjvEbSrkKYXUtlj09dLAW5GqAg6E73mSD+lDQ/kHehj
	hVvJis1f/0v0xv2PCtCMXa8vg==
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id 98e67ed59e1d1-3966d203a94mr21084902a91.8.1787797284194;
        Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
Received: from DESKTOP-BDFNLNM.localdomain ([223.231.133.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm20850538eec.6.2026.08.26.19.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:21:23 -0700 (PDT)
From: tarund18303@gmail.com
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	tarun-tarun143 <tarund18303@gmail.com>
Subject: [PATCH] drm/i915/dp_link_caps: Validate max link rate
Date: Thu, 27 Aug 2026 02:20:34 +0000
Message-ID: <20260827022035.3442-1-tarund18303@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tarun-tarun143 <tarund18303@gmail.com>

Validate the maximum link rate against the source-supported rates
before using the maximum link limits to calculate allowed
configurations.

This prevents an unsupported link rate from being accepted as a
maximum link limit.

Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 7b6cc6055da8..0934488153bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -710,7 +710,10 @@ static bool max_link_limits_valid(struct intel_dp_link_caps *link_caps,
 	    !is_power_of_2(max_link_limits->lane_count))
 		return false;
 
-	/* TODO: Validate max_link_limits->rate against the source supported rates. */
+	if (intel_dp_rate_index(link_caps->dp->source_rates,
+				link_caps->dp->num_source_rates,
+				max_link_limits->rate) < 0)
+		return false;
 
 	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
 	allowed_configs = calc_allowed_config_filter(link_caps, link_caps->enabled_configs,

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.43.0

