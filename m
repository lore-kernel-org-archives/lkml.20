Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE04D9560
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284466; cv=none; b=hF8UR3c2csYYSBSGGPAQ7DdLlx0Pt2KzSij9GifEAQ8J9+Byr441viUIbReV/AraDuvf1xZQvfTW0Emv13omb+zwTGgy1pOprAvEvu9Xdg8CsJoDMXbJozk1W2rBAyWrsvcih+C8weWSHhTw9n5iJixN9CQQnYcufwRtlBLYEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284466; c=relaxed/simple;
	bh=Y7JZMLyY7YrUSh+9GBf554nNpEvfCQ22IwTrhoQREOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnMU8xwcRfK0d8UgPmiiAQ7wi4EMWF12Cm2B/vCe+ivC6Gcr4AVdGYcrCkg8ZBWYWYO1W08jZGJNDasaqPAkw2Rgf8PnoPmtxy3eK+KvdhtNIEdn+T8XeqJU+WluCsyasSURYqbksN9fnhY7M9OvD8gV8B0ogUuuKxaoTtIu+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WrClwfXg; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WrClwfXg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=+VjMkZ3tS0FShslmwCrFzVtn4w0HMmV0NCSm3WPMU3M=; b=
	WrClwfXgez2i+pCVgHdG1ExAUSjSk5192q6JO7nf70cTdDWCdfm+w76uhGZ1HckzKeZN9AXLI2382
	WJE2SZeZfIOb4FbZ0LiVfTK7DV4yYR2nkljIM9CavC/yd55SKVlUZKDiQl4xprC1TPARWqKK2K1YA
	/jJvfG625uqa8SH6YSLGgR1XlImAZbKthnYgbzHRC9IxKeGUd2ooeJz4ztc9QrMKtjJAuY7IdJHG3
	swTY86Hfcx0EqPnv7k7De8T+2aEee/QKlN/GkBWoRbZCZ18Sz98jX4qjtWKQ05L3c1qQ0znz3YtQs
	vx5SKX6hQWBS3apY2HPvIPOhJ6y5O7EOFQ==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlj-006qf4-Gv; Thu, 24 Sep 2026 23:14:15 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	aurabindo.pillai@amd.com,
	Aurabindo.Pillai@amd.com,
	christian.koenig@amd.com,
	David.Francis@amd.com,
	harry.wentland@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	Harry.Wentland@amd.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] drm/amd/display: remove redundant cast on amdgpu_dc_reg_template printk
Date: Thu, 24 Sep 2026 23:10:09 +0200
Message-ID: <20260924211410.867686-7-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924211410.867686-1-mwen@igalia.com>
References: <20260924211410.867686-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0cf5eb76e2b4 ("drm/amd/display: Add tracing to dc") prints and
casts uint32_t fields in amdgpu_dc_reg_template to unsigned long
unnecessarily. Just print those fields with %08x and remove the
redundant cast.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 26c85d95bcc0..7de4fe355c5d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -57,9 +57,8 @@ DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
 				   *count = *count + 1;
 		    ),
 
-		    TP_printk("reg=0x%08lx, value=0x%08lx",
-			      (unsigned long)__entry->reg,
-			      (unsigned long)__entry->value)
+		    TP_printk("reg=0x%08x, value=0x%08x",
+			      __entry->reg, __entry->value)
 );
 
 DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_rreg,
-- 
2.53.0

