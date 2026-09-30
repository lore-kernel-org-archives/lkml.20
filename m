Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BCF34D915
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730218; cv=none; b=d/idnJGn1RUCyyFt981/G7UG++PgHQS4MLMhSt05yvvBZ/gMYvZDi83GhemToWcGc+QaYULtAXT2xPM9VzREZqc5MQ1lOt/n6LpQ6gPQlI92YkdDOmHKayVSs9Eh4+UGkIMMDJWpc1qclK7FYHkqUTY4Kwcv5ScJGF+FDLHglqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730218; c=relaxed/simple;
	bh=SDpHHWh5CqXcS161Dm4ogLxatxdOjgWnT3fVKEyB58A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p73TNs4AZYhi53T8z/LLYwaRA3DX/a+Wyhb5RVa12ZSNAVbNiE28ILZdxUTFzbPQ9ng47OuGHpi8lYItvWfQNPIZtZ9bVa9LC2WITK6qERoabJ0G6MtetG+zc3TNaznO8i4mx1t98I9m1XkZvA+5KcLo1ngB9dx5OHiPJqgMy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=HY1wDJ7V; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="HY1wDJ7V"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b1743e9c7so672645eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790730214; x=1791335014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
        b=HY1wDJ7VyRMmDpE94RaT3VKiDNIzYjyFr23nUYE8S96j6xFQPWuROP6t9dspKJTFxf
         /WdeI2B7fHQIozbeFG3j0llSaLyu2DnlUDXsERbI5+B4I8ObOcmrI7bYJyk8xh2vzn/F
         la6dHTeXLM3u9v2QDOH3V0dep8fPrvZlVVIz1gKUbnEXzsKwk6l09QppxlLDXO4y53sM
         BdtOVXdn0hhKqFb9S0i2ggaNcibxz8pgOjuVu72olouuKyte8oi3FGlVWP05xPpJ1Q+/
         jadtER7Vaw1E3HsxHKDDsmRiTiijsY0VRZjL8oTemEPYgicSGOVyhMEjS6ZBOVnwXms1
         CJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730214; x=1791335014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
        b=JrD6WGTDURYuIcMxNkHCyHtP4ZhxbUOx6w18PW1JlIYFc4iPb/OVJOYzlHJ0fAhQDZ
         AUZf62izsJsPyWJPhArBJLxCurAk2qrR8Omgm7Yt0/330P6HIPUrpXWCPciEaSQnQVCz
         jhJCiW/aqlHn265nBPjRFfkremskNfCGwW2FU8S/tMbzlo83XNW1axIKlPMu+ADXFq/v
         +EiE5NCocZway78CpG6LzBHaexwzyoFQ29WqGkc55MF7ffNhUjkyizmAmBFd8h+HKVoX
         c4wa/meFPna8g0Tffvd6M3taMeYxFOa5sBO76n8nfVCRJMo3MZS3vjZJD3qa7OIkKFdq
         Yc8Q==
X-Forwarded-Encrypted: i=1; AKwUvBycyay50KoTy6p9FSfl7Ru9WGvQRjeC4GbjnLlCRf4ZQ6AJxq4Sbq/GX5fYQWNrad38/Vp/SxJGXVyHHHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nbFo6W7CZKbHgwtxelA64E+SsVCdkH1W/bZSvLUo/Y+Xqawnfx
	qwP3/sbeuke6ykLMQd0JgkIgd4Dzurfo5D/e8L0QCavLKXObuE2HVbXAcx7xUWLZnMs=
X-Gm-Gg: AYBFou2UxDGbNCUlvtjkjwThDdwWC6nphVrKJVVTjgrJC/kU4nNL58HZJd2YjRO8s3B
	+B14UPYO4PIZH0xijaSCBUi3Kkwyokg0IfoprUqYLMcLQrPmKu3uY6hsLgnTp4IkhLgViEnULAE
	O7s+fre7pTPPUmdT0RR+K4kn3uQTmlsME4xggNpysYjfHpxJsKhfwGJIZHf7Hfw1gHp3JsCUQQ8
	OjOQD6waaKCEm8/h195yMpqvsZOE1wZ2LaB4Zy+ERNOXOXDnPQv0hSJb/U9NM4fb63qsUn+cSAI
	Josqe4O1J4jwRw1PNUaUBla8filzRq89l1zyjbkYjJGeKLhjWtb8WUrjW/uS9lwmKYBBi416BX3
	4nVoLWPpdkqao5VY8ix1g0YVnIUKX5/eyVqChK9EYuNQB/HLpo26H4+hVxZCF9+sPSARnVz4dGS
	s/Wk/vYbzC4ebjV52Sds1NQN55Hhd8nnU6Ovd8sMbcbM45246hSbKSaO/1eE1uE4jMInhRBS5Ym
	qzbEi1Eb7vG95Gfdt1xCK1/8NqNQAojsMIQkncca/2SXMHCiV7KQ4ZsHHid/0yBv+TrPA8=
X-Received: by 2002:a05:7301:4e46:b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-34c646ce08emr1028241eec.27.1790730213667;
        Tue, 29 Sep 2026 18:03:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 18:03:28 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 0/2] drm/i915/hdcp: guard both capability checks
Date: Tue, 29 Sep 2026 21:03:19 -0400
Message-ID: <20260930010323.93999-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and i915 maintainers,

Thanks for catching the second dereference.

The code in patch 1 is unchanged from v1.
As Sasha pointed out, on 6.6.y, however, intel_hdcp_info()
calls intel_hdcp_capable() and then intel_hdcp2_capable(). Guarding only
the first helper therefore moves the debugfs NULL dereference to the next
call.

Patch 2 adapts upstream commit d34f4f058edf ("drm/i915/hdcp: Add encoder
check in hdcp2_get_capability") to the older layout. The 6.6.y tree
predates commit 130849f8ec14 ("drm/i915/hdcp: Use intel_connector as
argument for hdcp_2_2_capable"), so its dereference is still in the common
intel_hdcp2_capable() helper rather than the DP and HDMI shims. The
adaptation puts the encoder guard before that dereference and returns
false through the older bool interface.

The CNA record for CVE-2024-53050 starts its affected range at 6.7, but
that range follows the later shim layout. The same unsafe conversion is
already present in the common helper in 6.6.y.

Together, the two patches make both debugfs capability checks return
false before converting the missing encoder to a digital port. Both fixes
entered mainline before v6.12, so every newer supported stable tree
already contains them. The same common HDCP2 dereference is present in
6.1.y and needs separate handling; this series is only for 6.6.y.

Could you please queue both patches for 6.6.y?

An LLM helped adapt and validate both patches; I reviewed the resulting code
and validation evidence.

Changes in v2:
- add the adapted HDCP2 guard identified during review;
- send the two guards as one series because both are required for the
  debugfs path.

v1: https://lore.kernel.org/r/20260929031728.88004-1-artem@trailofbits.com
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

Thanks,
Artem Dinaburg

Suraj Kandpal (2):
  drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
  drm/i915/hdcp: Add encoder check in hdcp2_get_capability

 drivers/gpu/drm/i915/display/intel_hdcp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)


base-commit: 79643295eba17affbd16ca97f3ef04c90266b28c
-- 
2.39.5
