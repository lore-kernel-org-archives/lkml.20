Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F4483BF3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394995; cv=none; b=f9xZgmqM3xtXnMZXKYnPADlgb6LieVU0FWyI2PKPrYoKE5WrCaPLa7fOtHeNpwDBfNIx5FAIQFZclmIj4vcKf4L9Kk4oVfIy7MIAfMbEoLrfY1DcPQwLI1F74ItfOJULIAzB/nT4yfhDEW5tzUZ+JBmvcHBGh7voD6gYBlS6v4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394995; c=relaxed/simple;
	bh=TUk/f2h5dUmQhXAbNJFZQPS1I9HpuENXc/lJ6dCxZEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sImz+Xft30kFcgD+kGO2iYp8h/9ClxWqHhZCDIF+RfHn0jOYwteXZz/Rsa/NmbxZ1KDKsuFBkisxVCba5qjXWAsM7aGi8hJH7nPyDlXkEATORXpZCVRwS0EUYTDkMqNyHQzf5m8i6zA3Sgc/AX+vCgFXPzTNrYVddOMJhd2RQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fovdQcVt; arc=none smtp.client-ip=74.125.230.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fovdQcVt"
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-3a5d1645d85so17148931fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394992; x=1792999792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmCIEe5EaGzU2U41ZTSvmQME4aOaTYAEh4vnVX7+bKI=;
        b=fovdQcVtvAmL1ZU+/wl5jZSiyUww8uufahjFR0K21SE2qem6T/FF182URjJ1kQT7Hq
         vD0tAv6c5GFVKwk79zK8lX9AgaxYrPcUP2j9PoEy99/10TJFREqXAcGdsdCm04KT8ePT
         n9RbRG7d6wAhDrb2EXoQZzFc/wBsJKeDbH6Kp3V3JiVeJrTwLS/nOi8bba5JfPvjhAPR
         JNA0TaAQbV+1wcAwpG5Ggnjk1PY0vpYGDHfe+7tQahVxKtC0nn+8DPaZ7dYK7emv7GjZ
         UL8A1VYNudJsbzraMyR6I7/yvTzUp+hsmyRbqq1uWCRvlAGzOBIXyqjIK71QISxS6dSG
         8Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394992; x=1792999792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmCIEe5EaGzU2U41ZTSvmQME4aOaTYAEh4vnVX7+bKI=;
        b=tsOor1S7k25zelPFaCK28AEJx09CbiJExfnIUwjkzRkCMVe4Gh/W+c2iTwJ/Wq1PTY
         eapnUn2Bhuzm2ZVH4e2VsycTVPRByTf096/HpdQai0zmAeBL4HXqv+CUuunstcB0ng7x
         VbOGboyQT0JVWz7W3odc4voaIHqw+YBCDfSJILwtW0l6cZwI3ff7YzEDSLfuTXo3c2sg
         tHmad0ph6pKrd7oNfUQDL58OWkCx+02gEdvMx6KrzY9+kNiVQvt4SfL5s7JwDJQWU2ZU
         dDZfPwZy724bX/dbKA/fbfvGv6kmV8y3379bTYpFxIBEmO9ZkjLiMoG8DRwE17RODw6D
         lJEg==
X-Forwarded-Encrypted: i=1; AKwUvBx7zEk5sS40w3ZhRc6GbI33fvpX9XIZPkrj6ysmD52FkgJpww1xuVZCsk9Ss2IykuqHpr+jVKR51KHDwhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTesZUfuijNrKmUzg8P7J76hVL1iIwAG0DpB4w9zPEd5DHnVJg
	uVLtAq4DtEQijlF89PDHr0x5k7DANzkciyrw91kYDsVTrfCVKSRPjfgG
X-Gm-Gg: AYBFou0BceF8YDcf7Ao6iW5mM1cF/whF+lsSE7hiaVeT8l0njF31E3BonFEgWjhgEkp
	x+Amc5ZzFIIFniu+fJI1l6Ojh1vB8KsSRjy0EgQ3InIdqsYDksjNeKglNvF2pbr/LTyvjokZCsT
	M2kYzWV4ZC9ylqIx/1KobDQTunYC0yQGV86ASKSoZwHE8VCf9r+CEbc0NCHihwDPU3h7npdN5n0
	GWUJMPTbTzGD+KXRWKhmMmybFI5tr09LmOH3MqcUWn/fm2ngYv/TegK4M1R28+Ak/R+8uD43YXe
	AaUxEhfr9cdo/mXwKYAcEBc7wXlSN3jKNeS2SsJNuuxVnVxmq+e62x7zGGyECVgUT7kirycfZFU
	1qsUuQ7tv/f8BNj3oB+X8jygb5nOB/C+wic8dTvn18hGbxMsVEK20U9CC+tllzQ/at4S1nDQ2+J
	Ixzsro1fRYleLim+4jIiTiFhtSOA/2DqCYA7+FC3P4J2mLEYYeXVAZMvqZCNNc3V0EacoPn/97w
	HMZT9J9IsFSnrM5
X-Received: by 2002:a05:651c:324b:b0:3a3:3170:5420 with SMTP id 38308e7fff4ca-3ab28f5a366mr14469931fa.3.1792394991368;
        Mon, 19 Oct 2026 00:29:51 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab3afed52fsm8290511fa.8.2026.10.19.00.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:29:51 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dillon Varone <dillon.varone@amd.com>,
	Gaghik Khachatrian <gaghik.khachatrian@amd.com>,
	James Lin <pinglei.lin@amd.com>,
	Austin Zheng <austin.zheng@amd.com>,
	Bhuvanachandra Pinninti <BhuvanaChandra.Pinninti@amd.com>,
	Kees Cook <kees@kernel.org>,
	Wenjing Liu <wenjing.liu@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] drm/amd/display: Fix NULL deref in dcn401_update_clocks_update_dtb_dto
Date: Mon, 19 Oct 2026 10:29:37 +0300
Message-ID: <20261019072938.10074-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Why]
resource_get_otg_master_for_stream() can return NULL if no OTG master pipe
is found for a given stream. The current code dereferences this pointer
without a NULL check. This may lead to a possible NULL pointer
dereference.

[How]
Add an explicit NULL check and skip the stream if the OTG master is not
found. This is similar to dcn60_update_clocks_update_dtb_dto().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b6d508533fa1 ("drm/amd/display: fix a crash when clock source is reference for non otg master pipe")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
index 6ee3da89d058..135eeef68ac4 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
@@ -538,6 +538,9 @@ static void dcn401_update_clocks_update_dtb_dto(struct clk_mgr_internal *clk_mgr
 		otg_master = resource_get_otg_master_for_stream(
 				&context->res_ctx, context->streams[i]);
 		ASSERT(otg_master);
+		if (!otg_master)
+			continue;
+
 		ASSERT(otg_master->clock_source);
 		ASSERT(otg_master->clock_source->funcs->program_pix_clk);
 		ASSERT(otg_master->stream_res.pix_clk_params.controller_id >= CONTROLLER_ID_D0);
-- 
2.53.0

