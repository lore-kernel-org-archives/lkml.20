Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DB9EED8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704722; cv=none; b=RD5aIijr6xZ8LuuFaBMwSCl3uTznl1Z+6lMLP6dIA7bIj9P4kDpEX4GlLYCOActyteR4C1fb+4Ss4xauFghYxF0eKicwzddbjH5L8IXJdMjZhgv7WobaeRITJ+4RJkSlJkuQepiKN5vaUPvQZ7CLtp1vfJNq4E5D2EQRmsiMhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704722; c=relaxed/simple;
	bh=x9LCMogkgdKO89rsH+DfpirVbdhLPQZ8S0nWxdG4n90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l755rcFhOAgMizMGUOP0lgjxDGLzti8MJgwZ8MDfAm3BxUjGgeL2qhcIb4QXamPbmNWZKf2VcQlu/hbRs9GajXKDHpoV+RshG7/QKZ38QkLVYx0JhdRFwB77GR9w8wLsgSNdhZrSXojWfiLwpE7sTv3fRSQaDMrDzHaPUPKGjMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np7G0Ji2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np7G0Ji2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so10580025e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791704719; x=1792309519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqM+9SRRezlqj4MjJGtTvfOzuMvNp9lIqAkwlEew1kk=;
        b=Np7G0Ji251b45oBYrLnOF1KLzvq/3Qmu3qA6RMMLwKA9pm381cJuYIbSe7mqSrU549
         qTl1M4lRLVNbJiNidC4hb3tvJL7skVj8k0mWYn9+eHFIO0Pn9FIJhOlMQkoDAI0AZOut
         BgMyZfQXwtSgFKdNSG1Uh0eSc/+3uMxH1I6wl6RGZlMqbrOAAZcVuD4c1GEnMAcqJIqG
         PCRm8qgQgF1MIMOtLPcdY7JOQUR/wR2iN/N2GwaiXv9hvd6kG9uEgX2h5/UX+TraLa30
         9UMBxos+ITPCupmWxZL9Fz7XnlypFQ2S4N730Xtb3vsb8WdN3ZGP37AScRAG47nasMN9
         0KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791704719; x=1792309519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqM+9SRRezlqj4MjJGtTvfOzuMvNp9lIqAkwlEew1kk=;
        b=udiN+7tkMWIhYS/8imaa/kiPx0JKtIEkXWrsnIwuVh6uHIEVnsWoBnzj0o1pA475QL
         CWlrTY+lBoSdQzdg6NQ5epjOwbTlTV4TspOt7wdNUrctrApACiiuQzsDSRqCeZMzec7u
         B6OpV/NP2pyUZs/Dv2BCP136PBVTWo/ku4CKnVvxGOftN3o2lU/0umQWlZrCOnYfiCcp
         MOxpNvHujXsIb3m/zgXzbUfzvilqy+wAa8+L/0D5NFEhubUPS8dtRCJI+hgWwwWTn34X
         gJMfkyl0LTQC5pQHGhj+iMmQ72iIaoLIHQWZfRTapqYcvYp5eNWEF3xRpqKLhyT20egu
         /U+A==
X-Forwarded-Encrypted: i=1; AKwUvBxM+u/GxOcBucMxldie71y3jIPSWd1UfZUbNy1UCRsDbNpK+evWedaBxkF2cYZEUOu4XlQRUsMcKBYgFKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9noGc6EGx6FAatzJBp8MNtYj2ST3szL9HMGIp8e9BjOVTGUpc
	XVV53KvwycePhNPEq/NftdHyKq4+tYMtYnvSivxRp/IHT4IutYuh54Ef
X-Gm-Gg: AYBFou0lsd7VfWMoRwdZOrD9V+Zws02oLWGxmUlkmy+vcUdY2+gu7UpgpiyOAIhlH1R
	qTr3KZ2FAzZFKIUKB+goh46aZLYPpzewvDxKSBrv6oVb+ei/IvkYupUD5CQlD4Jq9CGPJIgTKju
	evSanyVmMrEELMRT78Imz8BA4nU1PYZmt8a0LOE0iAKyKjDkTCvJhLE2xfr9SXNXNU4/8TAhmeR
	2syjNynOrrdHQ8SvZkmCnlPhv/Ff1orFbYsK9yx1A8SpdGYA7KxPmtrjiARvBk3vz/D1K2mwmbE
	JPzAtsuOxdZ1Wy8GBq2JC+sXU9kTX7gwhBQ8EK++6PUdYtp0/QJOxVcRz5GLbvH/ZP/GDCCo17f
	HRBV0uOKRqChzztOWvez4oe8fPQ2o2vBX39U6U38XI0PYMVGdZCamzSAEo7JXt0xoN0FIZfcAUd
	3HSoHIEwfaiEvlO/zccNCUMpzOaPKGtcWh2eTtYQaheRQe9cArh0eEE8i6SFMnbYuqC/V1shMNo
	Vuy0MAT6yS7QkrelMh6tnY=
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18e4d12e7mr102284445e9.31.1791704719496;
        Sun, 11 Oct 2026 00:45:19 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm271020005e9.3.2026.10.11.00.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:45:19 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: austin.zheng@amd.com,
	jun.lei@amd.com
Cc: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	aurabindo.pillai@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Initialize missing TD-LUT programming inputs
Date: Sun, 11 Oct 2026 10:45:10 +0300
Message-ID: <20261011074510.2495683-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dml_core_mode_programming() memsets (clears) its scratch structure
before calculating TD-LUT settings, but does not initialize
tdlut_mpc_width_flag or is_gfx11.

Both inputs therefore remain false regardless of the plane
configuration which can result in incorrect calculations.

Initialize both fields using the same sources as the mode
support path (now both paths are aligned).

Fixes: 70839da63605 ("drm/amd/display: Add new DCN401 sources")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 .../dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 72acf12e9251..0ee385e8ba5f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -11074,6 +11074,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		calculate_tdlut_setting_params->cursor_buffer_size = mode_lib->ip.cursor_buffer_size;
 		calculate_tdlut_setting_params->gpuvm_enable = display_cfg->gpuvm_enable;
 		calculate_tdlut_setting_params->gpuvm_page_size_kbytes = display_cfg->plane_descriptors[k].overrides.gpuvm_min_page_size_kbytes;
+		calculate_tdlut_setting_params->tdlut_mpc_width_flag = display_cfg->plane_descriptors[k].tdlut.tdlut_mpc_width_flag;
+		calculate_tdlut_setting_params->is_gfx11 = dml_get_gfx_version(display_cfg->plane_descriptors[k].surface.tiling);
 
 		// output
 		calculate_tdlut_setting_params->tdlut_pte_bytes_per_frame = &s->tdlut_pte_bytes_per_frame[k];
-- 
2.43.0

