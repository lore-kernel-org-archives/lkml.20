Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF593DAAAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651386; cv=none; b=jHo+PJA8xIKI74QGpnsfnQDVUPUPlP2uyk9pRD1MR+OWRfsqL2xXxtRXFA23bpdjM+VIoCjXZPqAjjHeRkkLi+XJd4h8X2NKB653wYBIlcUnA7nus7axiNLc7PAn6C0qSmjAY1yDQGWvmphp/u/2xs7BJPrcL5pux1eu89HUoy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651386; c=relaxed/simple;
	bh=KmIJNsUoesY5atydphD48c8Zsg7xImCdjEbRvBc8dlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kREzEkrQGXFk9M3BrjyR7k9sJOoy0WDlioYJuomWkcjxURuS6g0TKPEd1ss+B9KG2cj811Qu4sNwHQJ/32RJw5AZVr/uNYJXHEkiokEZ70OTAMGH1yyFzkTH8pVuSjyG4gQWgB7m7bTJIpCg1TbXFBx9bYkMvO8TAO9SOcp/ZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=QLyaUJT6; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="QLyaUJT6"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso156265eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651380; x=1791256180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ovbpo2QnHvH7arny/3o7azxV9+me2emF/sy5+OVOXY4=;
        b=QLyaUJT6TzcwpTmyg/ztAf2aRAyCd4kmkt/Q/hDXGmpIX2pKtzpguqMUNzImpkV0Aw
         x4kxDApgCHjnqDXnFjekHp/zcUMh+gvNyJAIsrPHh+424Fum+xukyeLuJRVW/yYbCCN7
         V58xRdHNcrr9i/+fXbDfn/DhdlcJ1yVWi/k77VyJnJhhwdeb9ep/WFf0TfoUT/ytk9kL
         cWdr7ZgSqAZRo+TjM5rzV1HSGjE6h1vvj83NdmSKB+heaoVBZMpOGXbzZuPBGW1bi5N5
         axh0Sor9BFvd/TCeYsOqUFPL9KOeVaMwYr92OhJhplaFS5GyHfBVH4B6hpOxFl+10Wlh
         GhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651380; x=1791256180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ovbpo2QnHvH7arny/3o7azxV9+me2emF/sy5+OVOXY4=;
        b=D8Lu4pd581Zy2elDmgsJTUjQVUURmP68y7u5beRiNEBtJzQT6/jlU/sbapsEkqVz1/
         0FVENIE3rt6VdI2LCCrbHMl+JS5tFUBMt4R2b1PcDAHL40YF7d4vlXrSCkWc5bggH479
         57UtkTqfrBXJR/aw/x1hswZNSBkPB2DIvO77WVgWfaYbmiowE17v5YrjFxv7qHcmoMJp
         mwnmD6roaQKCy3jQvrp/ossNYUwC+OVHKK8CpmYNwd+jpKy2DewsulD5XMsofSPyuoEu
         KvxoBrF5j/5Dn2/eR6g+xRM7/S+RJFc+tKOx2CZILwtrpkTSK18oj51n+N8VABnLvHUK
         omBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF+YeWU+qcEifSQHgHs8YojLxqb68KLOiyz+2WB6zK67O7+R/9ev3o1s/A3fPGXZ34ZSuYvWmzgzThfQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKQ+oWps6bq8KmKljs5UFAJmqmnBRedP3JCHBFNkO5WEZQFL+k
	SV2oe8m8Zn86GeXyqRP0L6lI3LzPZyGAD4kyor5WxtPXrb276jzP2WOgZiUMRIVhj/c=
X-Gm-Gg: AYBFou2hz4lbE5oGMH4axtfn5rzvOj54CP/8RHqo+RYqmVhv3iR7szd7B91G3XQTejw
	yvuvMdldlod9pZriJajElCHVZUNRK01ygaLbQA69ixxl5rezgzNLNygfTKhFrUr8C+J4iMIGA9T
	gyaxcgyUHi839hM/l0JFKlYyPuYw/tIMkL+cO9hlCrj20I2bNMhSsOfBOHdyHsUdYtWb0P0P6KY
	lFtZ83C2xSxIr08F49irm4DGyQEEsZIFRp3kzzfMh5XvHpxpxZ1fu2CW4YZI+JoEmd/s9L9xI3Z
	yPuTjesvFedWYQ8zBqZ/mkiKe8woTPERHU6JodaQxLs34/Jkf8pAe5zOT9qahF5gE8ezwKnaOpZ
	2S6FmO0IUx+hzUzAlqgqE5zWS3kSxvOWHxX9zyoR2ZPHMsyP1R6R2Qe+ut7RbYXVVAuevCNQScE
	vep/aSBcPDj9FOGac/qMMLb7OgczUwg5I+/24bojU8BqqxEcORj8DvlZrJ3yaf0IaTYB3kZlp42
	cKwGZ6uglKtyq+TWoa5cWaNZK8M1g+JqJlTHZ4ELrlOom8qRh4xDkNjvrE2uBP4UhG8qNB3KqDX
	2SpC4g==
X-Received: by 2002:a05:693c:8955:20b0:341:225b:d6f with SMTP id 5a478bee46e88-34739c07f1emr6241228eec.19.1790651380153;
        Mon, 28 Sep 2026 20:09:40 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34b580fc50asm927881eec.14.2026.09.28.20.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:09:39 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Allen Pan <allen.pan@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Charlene Liu <charlene.liu@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
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
Subject: [PATCH 6.6.y] drm/amd/display: Add a dc_state NULL check in dc_state_release
Date: Mon, 28 Sep 2026 23:09:34 -0400
Message-ID: <20260929030936.86941-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Allen Pan <allen.pan@amd.com>

[ Upstream commit 334b56cea5d9df5989be6cf1a5898114fa70ad98 ]

[How]
Check wheather state is NULL before releasing it.

[ Backport to 6.6.y: implemented the same guard in older
  dc_release_state() in dc.c rather than dc_state_release() in
  dc_state.c. ]

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Allen Pan <allen.pan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm amd maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-26948. It adds upstream's NULL guard to the
older display-state release helper.

The helper is used by display-state cleanup paths and currently
dereferences its argument unconditionally. The patch makes the helper
NULL-safe.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-26948
Upstream: 334b56cea5d9df5989be6cf1a5898114fa70ad98

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index bea18f450ac9c7..6ba67a20eb4846 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2302,7 +2302,8 @@ static void dc_state_free(struct kref *kref)
 
 void dc_release_state(struct dc_state *context)
 {
-	kref_put(&context->refcount, dc_state_free);
+	if (context != NULL)
+		kref_put(&context->refcount, dc_state_free);
 }
 
 bool dc_set_generic_gpio_for_stereo(bool enable,
-- 
2.39.5
