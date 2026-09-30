Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F94252B4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751574; cv=none; b=V7x7BY8kaYx+acwR3vm+9lARdTUq500TOqVwFi49vZoxBXWDkv8VW5MgG/XToJNRo6dT8+wPOU4HAqVIfSjH4M8lTILe0B3H2TxWTDsAk4ZQlxEIrj0PR+PRb3s9s2IjZLg8xzcYzjvv5NTvgoYOp38V940qF2PGeyVA07sRnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751574; c=relaxed/simple;
	bh=7JfY++iI8gHfgHqKJfxSarJhx4kdjmVjYiluOw0YWYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qi6lKV2EC5PcSYif23CFpadfHm5Mj9qMCPz9H4jukAlPKKfULPTLMKHUcv/ZOOy/PgzBo1PCDzaMJVS2hNg57XHfFcek8+SklICIYp6YMgPKbf3zK6Vuo5chswViNLDahB20ymJZXxrE9dlNQ87BWCC8AwyCCqtVbsalvE+MPbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0J/09Ak; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0J/09Ak"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so38625975ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751560; x=1791356360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtiPJ5UGtiZsDhZZbOoXQnFvgnva+qGhuWA36rHa5rs=;
        b=p0J/09AkHbomLMklHOFPLTOS/6wE065M1GkwXf/fnUD4jRynstsa+G043exwQd37e0
         JC7VVfbxNPWt1FJ62uNK8JVQzT2b0xDfL8nNaf9pbcJI5h0x2VhrJDHuvfpCGI/D6N50
         wprXp3u6r4/jFvBvGCjNur/yYY/8ViVYPmBrI73Sim6iSST27Q/ie18+ylgiGReC39i1
         Coc7qxy/uD1Y0K3m0kkCePskkrmeER3nemlxA3VF1K/AQp/LpdkLtWK4se1faXxRvCWl
         3lsbXXxValuNzry3M/1PE1NyJ/67Wies3TUT4g3shFJhtOpdny9dBJL257hbmX7iy88U
         6zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751560; x=1791356360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtiPJ5UGtiZsDhZZbOoXQnFvgnva+qGhuWA36rHa5rs=;
        b=y7efkvr0vlKC4U4ODj6wE4o26qwk566oG4O/RD/3dBXIx+X5PT0qSe/2TekusP8Sky
         d0jYF+7eyHgO2R+z/54Z1Xh/MzF3/KJFQHYza+QUcQIWAK6ygiJI1JwrUhSD868lxl3T
         6rBP8BS98QK/OTa+dW1ZqXef6tjpWxEBWZ7hYZZwhcGdxZySPgmg+3yYwvuaMcm1/QqD
         DUqq1+2GzK2Hw1nSaOlFp/xCLdp3+ERMSiv7fbZCBBvRzOqKnGGUJwApoRWj1oAC8Lyn
         +ff9BGaL0p6YoElpnzZdCZb6Batbe7Qt0OtWVwFWtqjBfTUbtCCggMibki6+RXFzsiEU
         e4Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzrAgdpB9j3nevXPEJLxIPX30qFA7jRnB9BlNBvx4tLLpQ1YSglRWGRkUp1zGV5nXoUKtrlsyCzrxoRR9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWGeP6n0o4awRPEldyl5rM3WBD3rGVY7qxyZ6NG3vwrfg8oWIb
	d1bbbGBcVO42WvZ5UGCSxT4zYR6QfcoA38p16UqWoxRu4h2jE5h5zYAC
X-Gm-Gg: AYBFou3+iLvXGuxmk9Kn2EiRaCM0rS+997tnqqDPXauIzotSkwPXtlI94s+R1SQve8w
	Q7aSCjOFkql+r7rstR06hBK5oB36PLPRhbX8ZL7mcFi82DHfb6S8a1N6qn0PaBjI50A5J+iRp9h
	J6LOnr3NRoP+D+8BHG/xZpi42oWJrhb79UKo5pP+UKedx/lN0+VAMRXwrifRkkcD86Rfe+1FSW3
	dtbXX7Dk94RN3Nik8BhwiRoE9aHeGmK8WBLI05PWjBlxsR4t1Se2mMqej4s7n2wEqHknmBU6Vw0
	GrUIQrTUsDf0DuWIrrAB0tbZyR5nWfIWbq9KvNhnBbO0zehh2gilV463DFwslcxSyAl552/xT4R
	XoA78GresPlf9kmCj9UuRbxiez1ig+ukuD8OeHtfJ/36i2Aueam7iedJdmXZQBnWrShAWxrcxNW
	Aur51j3/Qh5GSWzR1QwmPkQC08zvn0iWGoxIkWL3+SDrVGeAfIBZ7FMBlkx2yKITuBe4M8Beo/p
	0Nb3HvUlqYGwjqv7Y6mMJ3nK+CVQbqmPrMigOAOeODv6Yd9MyFGx/4owAE3kon9EK9fQKs+X5yR
	4Qfq0OpD+Q==
X-Received: by 2002:a17:90b:4f4c:b0:3a0:49c5:d3c3 with SMTP id 98e67ed59e1d1-3a4d18f52e4mr485973a91.53.1790751559670;
        Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae9ffaesm2010442a91.16.2026.09.29.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 4/5] drm/gud: Fix bulk_len divide-by-zero in gud_flush_damage()
Date: Wed, 30 Sep 2026 06:59:13 +0000
Message-ID: <20260930065914.393939-5-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930065914.393939-1-benquike@gmail.com>
References: <20260930065914.393939-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gud_flush_damage(), if pitch or lines is zero (for example, if bulk_len
is smaller than pitch), evaluating lines = gdrm->bulk_len / pitch can
produce lines = 0, triggering a divide-by-zero (Oops: divide error) in
DIV_ROUND_UP(drm_rect_height(damage), lines).

Add checks for !pitch || !lines and !lines before the loop in
gud_flush_damage().

Tested in QEMU against Linux 7.3.0-rc3 by setting bulk_len smaller than
format pitch during damage flush: on the unfixed kernel evaluating
lines = gdrm->bulk_len / pitch produced lines = 0 and triggered
Oops: divide error: 0000 in DIV_ROUND_UP(); whereas with this fix applied,
zero pitch/lines checks return cleanly without faulting.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index aa7792966287..fa726e3d849f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -340,8 +340,13 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(damage));
 	lines = drm_rect_height(damage);

+	if (!pitch || !lines)
+		return;
+
 	if (gdrm->bulk_len < lines * pitch)
 		lines = gdrm->bulk_len / pitch;
+	if (!lines)
+		return;

 	for (i = 0; i < DIV_ROUND_UP(drm_rect_height(damage), lines); i++) {
 		struct drm_rect rect = *damage;
