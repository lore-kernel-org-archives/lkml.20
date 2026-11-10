Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316536;
	b=3Jt1Ni17NKbItBC0h74phXupaebMNfvV2LlGvoPPwdBVc0378JWMktYfFJu0BBO+FGPY
	 sD+7hdub1lvc1FVZx+KRDGUtYEekaRek+8zPnC/zopsnTvcrtZsNfDIpdcY/F0pOl/ErN
	 OiUlAiVAGv/h3gX7s0II3izv2LsfW7AsCy4wKYVJluqfVp2nrJfoYlQ0OczBWOqB0bcho
	 1XxbGPXQji8gI1Ni9HBkjgkodFlmWnZjb+TX5UBl4+1WfVGMUBB3pWio+U4B0SD38eW8j
	 xOaIMTevj278j+szaJvefWQLB4bLRfHQdN3FHfnzZKlV5MrQDZ0BbYjtP3NGUiQIadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oh2e2vjuLv+CFo3ixnoCrqgK7d1srk0NoRqmzsamSCw=;
	b=cAoT/U+JCZFKw+KOTevIyuu2LmaGS4I8EWzyFLCa0Io3hPWZCgDOEw8hUxnlCcg5lHdS
	 OH7XVlwE8H5T4ElJCI135gZKXn8wopIa/k/C7dI6CrZFkzj4YOXV+WzgyR44zHJeyh18b
	 ecSH/flf/fE+bbkMDRmiBUGtC6TNkwP+6iy0qQyP0QfV55qknRoMiB+Vq+3Xx0CZ7QRNY
	 5yHKY3JwyoDgYgQKW/zpTTMALhzy4U64RNN3MvSCdakghxDb929tVfxtk3q8YbPd1vYYG
	 49+Kzcr8VFY/pylU9N4VMj6HBJZTzeWbS97yq5ProbGQAS55FsiQG4CErOqR+k/oXzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ2G9GGo;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A3606B6C7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731A3606B6C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ2G9GGo
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so3180207a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316534; x=1794921334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oh2e2vjuLv+CFo3ixnoCrqgK7d1srk0NoRqmzsamSCw=;
        b=JJ2G9GGo7RwAB0agkT7XXrNx9vNno43bNzivfbxPjou3mfty3b3Y2Qpkx7w8abs+6W
         P1dAdmsTB8rnwxo2W0rS6fdXUUtVhKqgYsRoOVBnya/rf67YOZfCPud96CsFp3zXK+Gt
         iaT2H7z0nbgH/bQX9G/C6cAEX15c8Q0TDt5P/GqoTZ5TupPghIS367MjqbHqcDgINsec
         TVe0GIhy1jLk3vf83ilH1O9CH4whgp+kWx77CQ39fKnaTgs0cJf/8KJAi+KVvJ3VV4lO
         EbotVfyIdnvpcSP0hJ/FgaD0a7dMr1wGdVlWOClL2qBU896RpTlJVsvTyieYyhUVRzGz
         mzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316534; x=1794921334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh2e2vjuLv+CFo3ixnoCrqgK7d1srk0NoRqmzsamSCw=;
        b=YrN+SbkZTHZjsIOzh/sWd/6LUiQZlFXpmfeUaeC3V4iV95lbxvrT/zVVY5+StBMYAX
         X3339G5w+02GM+I7RVrBhu6pOwSw0XZVLM1AHnMxN0w9psdbobWPR45Avcc6wJn0+4HK
         G+ZDAggRRSeFwBEzrBzwrJlDvRwep8Dl2SBXMB3Lq4SRJhhgmSxK7zlECHdp/OHlkzp3
         L3DJpakoR7aTwrs2oLhMu2HrF+KeQ7LuT1R+lQ7YuNKhmeHw0+I7eUWsKLVnQVeqO5DP
         gpjIaeolBS5nMVmIuMpyXMezntL8Z7gaWoBREU2IZck5gfZDj9qmCNIXvj9vq5zR1xr5
         evYQ==
X-Forwarded-Encrypted: i=1; AL+hErGECeBWOuumMbXw4gjMjNhVX2ngUp/yhaeSpnYiOfPks0k4TDbqVyJtpVhk2CyF1XllR1e+3uVa20a2cJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uTIAWGRQQx+RfU6XK4LlZn5eKmv4UjQocSOpu0MdB3/IJwi9x
	6cF4morDzgrr1vk2G5NvPGi6j0JwGQQtuBLDiHR8gWCtlzIBRHDmBGjI
X-Gm-Gg: AYBFou2VgotTjfhjaG2ZGAqFa2MeDYmvAmcxVhsJIMlTMIS9LyU4M55Zm8E03mE0zm5
	tQ72CiNbE6OIY3FjuvggTB67GbFhP1IeRak/l5IAQGs9Tv6Yx5yKwFOr0gOIlTbml0rtxciGMFp
	Et9nlYRDfaKj9JTCmrfEaDsUV5fSkNFsvfLr24VbgvgQOohEobyaX3r9oYH1nc2qijoW3F6iOCf
	oTAj1GS8iBv8274e7InEz4cdDoczvW+X2PycNqLvf6v03lrR9/PziH9X9bbDR0tl8+gj9vnv+vv
	O80NWWicCas3Q0BmWowW+B6TgWHLUbCa4kYveuEKLCzllGP6LgoKT0Q8dQIGEV+2ffkSCfvO35l
	9dWeM8hfT1yn6QJXynT73UCdCtiYjq+Cs13HzqQlbeYZg8KmjEuwo4QOsDcvYyUIQnRlsPHXT0f
	B+eCgiQGg8BKH50YmaGtbqTeU9+i4sI+splNKxGlbExYontyNOA1OJvJf2P3w7SgcgV3lZZW5ar
	ortLWa133XYDHjngsct4tc69M2tUM+5azr0uxwe+DXKb6e31whz1+lKQTgUu0IWelEq331eakwU
	wxm9DRGTPjerxxUZxfkNUnX9a8kUNM5eqMkY0EykUkoXQzO06pO0X2lDeaHfTiHGerOreINGNwy
	X
X-Received: by 2002:aa7:c6d5:0:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6b7571c10acmr1542857a12.3.1794316533631;
        Tue, 10 Nov 2026 05:15:33 -0800 (PST)
Received: from desktop.home ([46.205.207.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1126372a12.31.2026.11.10.05.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:33 -0800 (PST)
From: =?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Relja Vojvodic <Relja.Vojvodic@amd.com>,
	Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
Subject: [PATCH 2/3] drm/amd/display: Wait up to 1 s for slow sinks in FRL link training
Date: Tue, 10 Nov 2026 14:09:55 +0100
Message-ID: <20261110130956.160024-3-andrzej.piatyszek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
References: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LTS:3 gives the sink 220 ms (320 ms at 16 Gbps and above) to answer an
LTP request before the driver gives up on the rate. A Samsung QE65Q80T
(2020) sometimes answers at 10 Gbps x 4 only after 225 to 967 ms, so
link verification falls back to 6 Gbps x 3.

Wait up to 1 s at every rate. Sinks that answer within the old limit
are unaffected; a sink that never answers costs up to 1 s per rate in
the polling loop instead of 220 ms.

Fixes: cbb8e2044b9e ("drm/amd/display: Add DC link support for FRL")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Andrzej Piątyszek <andrzej.piatyszek@gmail.com>
---
 .../drm/amd/display/dc/link/protocols/link_hdmi_frl.c    | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
index 78e62bfec..97b2b9b74 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
@@ -612,10 +612,13 @@ static enum link_result hdmi_frl_perform_link_training(struct ddc_service *ddc_s
 
 		FRL_INFO("FRL LINK TRAINING:  Poll for FLT_UPDATE.\n");
 		/*LTS:3: Start Link Training*/
-		/*Start FLT Timer = 200 ms, or 300ms if link rate >= 16Gbps*/
+		/*
+		 * Start FLT Timer. Some sinks need longer than the nominal 200 ms
+		 * (300 ms at 16 Gbps and above) to answer an LTP request, so wait
+		 * up to 1 s before giving up on this rate.
+		 */
 		num_polls = 0;
-		if (link_settings->frl_link_rate >= HDMI_FRL_LINK_RATE_16GBPS)
-			poll_timeout_ns = 320 * 1000 * 1000;
+		poll_timeout_ns = 1000 * 1000 * 1000;
 
 		flt_poll_start = dm_get_timestamp(ddc_service->ctx);
 		uint8_t prev_flt_update = 0;
-- 
2.56.0

