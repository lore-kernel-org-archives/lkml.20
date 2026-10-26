Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046367;
	b=LcY41dAbmkb/G2toYLpTaYe/z+rC1iCEmbmbyzG3/eU06HZdvTbbWcYBlsrJ70UrPLdN
	 kWKjuK+FpMPlfiiy0/uvkC2iwk75VM2R1vImK3e6O71aMd3cytkPkekfZVw5yqeoyM8+l
	 SjfN7+MEikE8cGPh0SDUhJbaGB2H/bSq+i4p/Yqt2cMpXWLhD5kVUaOYbQVLp93JPuyYq
	 T7Wt6Wxc7EVeRR758bREdR6j5J5E7xJMZMpeY/j04O14EaKGxHoREZGjaNwHPrEi9wYPX
	 kcVvPcIP1QCVeDu92OZkifIznHoZryjD3avwjvNnOLnO+gu7Kpj8Vn6ilLGS8zJousQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046367;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	b=njFF8IN08Ke+lk7vD5etYW95FMuGCMcOBajsVlzMIo9bULPJVZD3sL7htRCbL2yb/Y5A
	 OxjEEeB82Hf2evf67iYuIQCUP7UsxuDgMTvI7nJ6F7BzG9Mx1F/sfFiHsh8HAg7Bs+m1x
	 U4NE4l/WZeEBxkzkS/Wck2oiCHeFn+3d4dunFMF/Ci3BHIDhZlB9HYZLzt7xVUNLaNE/o
	 UoOY54Iyiwa5wazOkipE9CDZZI59thxvFxrzHEzZ97wPFzApDNLj0uCnVpEbhiDThmrZ2
	 2sFVqt7mZ+8tiRhBOP+WiUe5LSA60JROPoXfqWJLSq2iSx27FqX/DviKcI2YBMYEmAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdHs6WVa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48923606A32E;
	Mon, 26 Oct 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdHs6WVa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793046367;
	b=ftZsnhlL6QO9aXpUTjGIDxFZl77RE4f6eHlMrciUZqNCoJY2nNfWpEHEIZVesr8+wJcN
	 983eHSOU9LGw2H3P8zmSJhAOYEP0nN/rr3Z6Vdios+RaOm5uZheNhGOsKhuY0FrMIveXD
	 cFfvBqIptm+NIBUvw2Az1RJbYTmDY3BSFd1WJkbk2jt5o4ASRSsVFR6Kkr2sbXw2x+jWH
	 AM8LjyuoADt7Kfcr8+mdsx3JYOgU1EGD2kRZitXbmTeMKqdaOAxQPIvux32WPgLTbH4U3
	 1pzuASTcijRX2EMWCNHalfn0C6iK1yCi6uVgHYSPlC3IC70FbbS4vwlFfgbqBgifjTw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046367;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	b=FOsxEslVomg0TRFNTPhfXTt9ygxmhPFZCwFk62BDbZ0MFZ73FTbqdOiQ5xvR8E0IOaO9
	 XQ6VI/7oGGtk2wlCWZDulsrr3il1jWo1iME/WS14dYKTo7xStxvZZtaN5RNZORGNvJyNs
	 yYIqEHrOSIwoX4GBnM05vLPV00vONXYQs6OTax8iEI+E8XxkAUY+TW0HACPqyDV3Y9V0W
	 1N2LplcAC8gy/BLkXEepTGjsPwhvmXp7ECUACeTUQtMQQiqR+83pwv3c7K9UosxDeZcEm
	 SxWtNbRyG8sJ7D1KoJTsV5Bnz4n6l5G5YIpTkfBRNi2635Hdwjm7MPFdobkUVB8Im6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FDBD1F031E2;
	Mon, 26 Oct 2026 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793046367;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kdHs6WVako4Z6HlJI8pXx0/a5mGf8EaqSIK2d+6Z9SQfCiMQ/ayF05LCh/u+XPlkc
	 e2VF43ZOGJllhZJ/yAvx4z86W7yuJve71nHW1TCxazOoQ8/7NGTCWxsZURbLzFfkfn
	 YjeAPIGYDmct4HUX1aUVG+jMz/luAWM0rC4ygnh8IjeYI8GkHQsHn7a3Kh9nrsxznp
	 RDHdmqlAmjzZTlthTjO9oW3hlOaGSyJZWKIAI7AW3962CLKOSrkn5f+/5K2NM1jDsG
	 KM599wKK0JJsYyZC02UZu7Bun+uFAo284AvUkBkRjogGNkNG5X6sgSnwvW4ETWbkjp
	 CP66oyWBZcn/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09AE344E9D;
	Mon, 26 Oct 2026 20:26:05 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 17:25:46 -0300
Subject: [PATCH v2 5/6] drm/msm: force mode_changed on color_mgmt_changed,
 not just ctm
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-msm-dpu-res-clean-v2-5-3d864435186e@gmail.com>
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Xi Zhang <xz.ca.cn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793046364; l=1219;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Wo3tEP0RL/iVZrlVbjqizqGErC2YhsS/kVeKWgJ1UBY=;
 b=xk2S9U22PiVIjh/lxg6nCCjNYmmmTTw7ync+SZXmMp3OtYjWmbKZMhqvg3FSWrZdNIOII1xcQ
 wIOKmLLp4abCAAdIvtHphs0zznDHCIhxkKPDjmYlueo9cJKH3x2FTSN
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

dpu_crtc_atomic_check calls dpu_crtc_assign_resources when
color_mgmt_changed is set, which is unsafe outside of full modeset.

Set allow_modeset and mode_changed when color_mgmt_changed is set,
not just when ctm is changed.

Also would fix
commit 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
which was reverted.

Closes: https://gitlab.freedesktop.org/drm/msm/-/work_items/102

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..6f0f30b0728a 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -195,8 +195,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
 				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
+		if (new_crtc_state->color_mgmt_changed) {
 			new_crtc_state->mode_changed = true;
 			state->allow_modeset = true;
 		}

-- 
2.55.0


