Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3E92F7EF1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458450; cv=none; b=oJkgJJ8UGZqpRQAaPn4NNy+jVprw0uPyl0TXD5iVnbzvQRXvHm9StjJLhMH77rrBPcd+dVCPDwA6syDY3rLP5t1vUNrb14cVYtb/8ObgkuDPqO0xhgN5lLwkpSY9dJXggavzD8RRDeBcff6wdnBBnL4wYvxxhv4z5YCNwr9ygro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458450; c=relaxed/simple;
	bh=3e5iNBzhY6srgLd7PlabQ3as+tJdr6LGFFaympW3GRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qcyj/AOZCdC9Y7ks3Am6xfqx0xmMftbwS49kqtvl1WD65UB3HCRt5u7tMhly1q0SMWVyXE9dy6PTlWwL7EJ3Z8yifCTd2vSMFW06BugDbXpzY6JAQ3Xk2pE5+CAOHe28LJaxGNdWwMi+ESKOY1xJbk9APCJSjrTMmHMhKD+VzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu1Ag0+T; arc=none smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu1Ag0+T"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a2ebc73ee1so23659111fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458446; x=1790063246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reJctIGiQbHHtQqBXNj1e8Lzl4odeNP0FCDfrK7fh/A=;
        b=Vu1Ag0+TE8c3stibjW+DpfG2LNsNqBdp4DMsVmmmHjFrTlmJNvBCgrlzuMTExxMG3z
         gR2q76l83QJhp3PYaEQaqL5NSjdVhMWnbFXA0gLW9mqX5Jq6l99lrJur8xU4YMl7dVOG
         jalan6dniXojbse9jnA7Vm/Wb9Vg0VvvYhNRDZCdqusAwQZFEB69k1rtNnH1UmCYBJhL
         g2VKE2ORB/TTZFqrfxQtD2LHY2xcj6hpqAESpiwvXPZgFWeL3UnPeMQ8LpbenTqUjLo7
         +fa3XEN0b2GI9dUOsxJb0umlyxKg5yNu0LZV/hzr0DTzlQFxz8HDoNjVLLpJUEaMqjKN
         u6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458446; x=1790063246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reJctIGiQbHHtQqBXNj1e8Lzl4odeNP0FCDfrK7fh/A=;
        b=z57RPIZHJ+MJZpCEoFtyfz/yTQ37kURQvgTkzepa4WzcddcYQ6/3Z28/Fh7gFpTIcd
         6fM6IEc0dGTRLolVdrkMRpWipEa3TFO+v9O1s7qzy2jFiWVg72QRtWiNENUycF5WPI2q
         PVzwocYHcKnngJBg87uqgAbuteTBGPLl4sr6xtAtPW/jYKI8XjGcBLqeauti+hUC58lA
         jDFrtl9W+qwei8QpehIDydx7n+gjMFkd12G2P+1H0TIK14lIZ9GY9wu93r7xx6coS6Go
         TfuUVs4UZT92eShAL+o2+57/T0PQpCXf8NaLgR3V/HW+QVDQ/tF2WAV/la2Z9+7DAHpL
         0uGA==
X-Forwarded-Encrypted: i=1; AKwUvByn+k5mM+sGs7NMKVS9U9Kq2nht8ztmBBJCtLx3hmmngrhSp48j6/H1Xf7k5e2xR4QFb19k7bf/vutaXlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxGwr+sVJcRRmU5WoAnhkOlkv8yJonxjf/uabv8MyVSlLK2hnk
	A9R0LIA2L09CZ6tDnBbWfjxIyew7CLokRH7XczsHEwmlgH4lW//1vF39
X-Gm-Gg: AYBFou2KG+wRO4Y7WFv0Ufu41wenoWuQgK5BwVjhtU7NeKu/4fzeL+mBl1zy7F40kQe
	0sJDM5GA6NFdUCqhZ9x/Hrz3G+caLbFCAVkWjjNQ3XRVn5RLJRNAbLIKa39yR7m4m0VU5O4CQS4
	oTUKR46mzrPXJdjjQgfjWqnwy1YeKyM+kLzS7qdQjLgWMCwaiRDorqBxMeRbRqY/tVhVhARLF27
	ya+stXLK2HS8AarSJv38JtVL1Tuv6ur/Xi5XWVctE/LzMS5m6cb93oanU0XpqL1JGHsS5uaz9Ye
	Vb4JrTqIpDiN3oEsKKS+aZ7m9Z1fA0OhgZKlKMFX3ycZZvmqNmv+eEz+nHlbR7rj9hNW+NcMK4N
	32yRKgpSfw/4riwvmq2o4nmeUV0+GoqbhJDsBANBhwjpuUIc+j0KjQKHesph5QK5z8t/7cm23sg
	clgbgFDDBveUM1K5uclfh7U+jR8NFQ70jaMD9lzq0cm/j5ycnxJelacz+LFlyW0Jj+KGFIwo5Me
	ZoINOVmtzybB1+p
X-Received: by 2002:a05:6512:10cb:b0:5b4:ef51:8cfa with SMTP id 2adb3069b0e04-5b8ae68c142mr2989522e87.8.1789458446213;
        Tue, 15 Sep 2026 00:47:26 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0469a8esm3090013e87.50.2026.09.15.00.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:47:25 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sasha Levin <sashal@kernel.org>,
	Wayne Lin <Wayne.Lin@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Alex Hung <alex.hung@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	George Zhang <george.zhang@amd.com>
Subject: [PATCH 5.10/5.15/6.1 v2] drm/amd/display: set new_stream to NULL after release
Date: Tue, 15 Sep 2026 10:46:09 +0300
Message-ID: <20260915074611.9133-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WenTao Liang <vulab@iscas.ac.cn>

commit 9fa26b9eed6195bf840f39ac183b9a6237548755 upstream.

In dm_update_crtc_state(), the skip_modeset path releases new_stream
via dc_stream_release() but does not set the pointer to NULL.

If a later error (e.g., color management failure) triggers the fail
label, the error path calls dc_stream_release() again on the same
dangling pointer, causing a double release and potential use-after-free.

Fix this by setting new_stream to NULL after the initial release.

Fixes: 9b690ef3c704 ("drm/amd/display: Avoid full modeset when not required")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
Reviewed-by: George Zhang <george.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-68236
v2: Include version 5.15 in the patch, as Sasha Levin <sashal@kernel.org>
suggested.

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bb5e3a6086f2..deaf98957cb7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9293,6 +9293,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	/* Release extra reference */
 	if (new_stream)
 		 dc_stream_release(new_stream);
+	new_stream = NULL;
 
 	/*
 	 * We want to do dc stream updates that do not require a
-- 
2.53.0

