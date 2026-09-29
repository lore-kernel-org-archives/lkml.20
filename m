Received: from mail-dy2-f20.google.com (mail-dy2-f20.google.com [74.125.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE222E2852
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651538; cv=none; b=uw9mLn4qn1WD+1cs4lPiUXtfxjx5gryAVq1qqXOCF4xkrm4HBzg0ommcMIYIIDTNiIPcS1rkq6tCDblcjDctFpLUtGtf9JqNv1lwiZvf/LRNY1EodNBYLF941fVLzHnrCHFm9N8Sn6+o0ZkPas1RQ7iZ5/OAt9cjiZNVdzSNZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651538; c=relaxed/simple;
	bh=dsosmekOsd0xz9VUpEbFdZ+i5QTRLPAikwiupwB+EWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmhiLbJCfTbh1LvXmRCGWE8FmJihfSeBIT+PkJKZsNxkJnlhGfyUBxctwX488tgJUgxVLaltxktzIOhPWszgfVpyiSwPu8Af3D+Zmm117bhxQgd2t5YfQGGoDzOqrjFy5dJ+dB2gsDqxO9MJJts9MImI5RA4kpXNAoGPhGKvzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=CEdfKHj0; arc=none smtp.client-ip=74.125.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="CEdfKHj0"
Received: by mail-dy2-f20.google.com with SMTP id 5a478bee46e88-344447f9c3dso1446060eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651533; x=1791256333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYBLb2quugyRTAsa7b71SM3DW5Wwgo3gafQib73WBzk=;
        b=CEdfKHj0qOD369okvqMdksd9Zc7AbGmDq7a5NSjghq8BdY4zxIy2SmSEUEcfOSg/QG
         WsrWCZxinWZ0ukQkihvam/w+iNLXKvzZk/qJLZlzYUUJxwyJ3ZD+a6ZEQEBAcBTOG21Q
         AtszD3Y8Ww+bK/M+y8noLCDzCIsbmkDy+T6c2y3Sd5U1/0TFbKiHHZR7Nwqxx7AP1CzK
         0vvFH4EFkLdDwCkzVoF25Nc03cXydzG/RxoYYZrH0DNVZh5QDgwE7jSGqeHtZWeCHF+M
         AEE5AdnwcjHcpAr/82tFZLwiwjmIkrxQj71XHUw2wjC3Z2AEMnUpc7wW4RklqRUIIUoS
         zoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651533; x=1791256333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYBLb2quugyRTAsa7b71SM3DW5Wwgo3gafQib73WBzk=;
        b=X61Mcbq7EDf2XHO97thpKfLlDEw+p985EDGU6ZdbqqnxnW2UjmBYEkJ3KQuz8ytY7/
         rQG5APqUOEdGJWLKEZClgGlylETxuQG7lNQ6vziri5mcSxoS3eNfeBCgxemzjQisgKvt
         wMXVp93nrHWMW4dto5EnHk66aTwp34Hl1qM3qs+j3/c4qALWCDPh9R2EIY3p4a7Kc+gl
         t13C663cEqD91XVgQV2UBedn9UFOcH1lrDdCLe878oV2PHdFdhAFwmkHFqKegl13Ha4x
         I5XH+0S06jhGfhjq9mpqlqD2OE8snjjUx3E3IYEbM3y9sbT/E2qzmiM5PjGtWK3lRBvL
         C/SA==
X-Forwarded-Encrypted: i=1; AKwUvByfw/LfoB2XVgB9qoYVWGa0/QQ21cZBn6vkr6zV49rEgJGstji8vFpf8/5jAmR2COq5hTlA5XDuGN4DY20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYQH65R3c1E1KMdIcGITYW2aP0GxhiPW7OlX64xFSLHAG13umw
	rn0lhdNux4PP09nbaCRMNKeT9g7KAZVd+tTg831zpYOcbU7016aRIpaKkO7wOMQdcW4=
X-Gm-Gg: AYBFou1zHuHzGiGoYpfo3L/3teyVrw5p1MS8gUuxlt8L6A2OiXL6OjCI0+gcTU9N3ss
	moW/3z7aGllAZW+Yivv9xaOR2sBdnKPI8nhUJqAJFNjzQMwK9o/5rNYn9No/kdZN4eOV71wxaq+
	wHR68l9yrVsI3tolAOKm5dyR0cy2QnTmVefTHxLRZ7xIOXaLIubP3i17AqifEKxIgrR8Qc94qVi
	eKYlx413Y3VByYQQ7hRiXFq7hq3JD2fEQFPAUxjDxicdar5Yg4GaeDefid3DsJ3HMjoxXPIwJbF
	zNduYh+xehtQMgoy+d5Nl64JapTwVApfag2pio5hodNMo8wxmOLF833YicAWSjyB/X44JkBczMc
	t7u3QYKVaxGLBIIgQhoL9y8lxEL3oOZJuI2L8vQTzUfuCWjPwqbXgd1q0v6cLi4uXUgPAXshlVn
	uZImZpOQmh8fc5yM99GEkG0iL1TLh6zjYTnXhq6ardGn7mL7OnbvBzV5lRHW4x0xM/dK9dSAY2C
	o+2zFhamYzpw40AaPDbIBae74Q0wK80erDWOMjQUDoPctbtQZzXiBRDnO/WKiHQHqoW97RmrTXj
	Q12tYw==
X-Received: by 2002:a05:693c:65d1:b0:34a:e4f6:4a5e with SMTP id 5a478bee46e88-34ae505937fmr2051657eec.24.1790651533232;
        Mon, 28 Sep 2026 20:12:13 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343580930e2sm22425259eec.16.2026.09.28.20.12.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:12:12 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Alex Hung <alex.hung@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <xinhui.pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 6.6.y] drm/amd/display: Ensure array index tg_inst won't be -1
Date: Mon, 28 Sep 2026 23:12:06 -0400
Message-ID: <20260929031209.87164-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 687fe329f18ab0ab0496b20ed2cb003d4879d931 ]

[WHY & HOW]
tg_inst will be a negative if timing_generator_count equals 0, which
should be checked before used.

This fixes 2 OVERRUN issues reported by Coverity.

[ Backport to 6.6.y: mapped the newer pipe index and helper to i in the
  older acquire_first_free_pipe(). ]

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm amd maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-46730. It adds upstream's zero-count guard
before the fallback timing-generator index is computed.

The condition now avoids forming timing_generators[-1] if a zero-count pool
reaches this helper. I did not find a successfully constructed in-tree
resource pool with zero timing generators on this revision, so this is a
defensive match to the upstream check rather than a reproduced fault.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-46730
Upstream: 687fe329f18ab0ab0496b20ed2cb003d4879d931

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 84474d5122284a..1f576b2a1960fd 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2354,7 +2354,8 @@ static int acquire_first_free_pipe(
 				pipe_ctx->plane_res.mpcc_inst = pool->dpps[i]->inst;
 			pipe_ctx->pipe_idx = i;
 
-			if (i >= pool->timing_generator_count) {
+			if (i >= pool->timing_generator_count &&
+			    pool->timing_generator_count != 0) {
 				int tg_inst = pool->timing_generator_count - 1;
 
 				pipe_ctx->stream_res.tg = pool->timing_generators[tg_inst];
-- 
2.39.5
