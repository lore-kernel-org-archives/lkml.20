Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042241;
	b=WJbQybgrmFDW9xZVXAHZVcQuN8QrEPA1WoX3hbsPYmolWHacztcz5eGkLyUaQlKxw/wJ
	 j4zG4u9N1z+TIJWkd6lInGjNSs3cHpHElEjd+NwFwZL+19guFB+CK1MBM7LlKM6rWEEHq
	 oSSoXsV5ySIrfCNJM0iLEpZ5rmgQ7UtRxILvV+DheYhq+sKf3We6xVAon9W2vrZ/HBbkZ
	 7dQPG3yzGiSTvqt6O0fT8W7w5rXKsoJjn8p1ErjW/EdHwYPrphQ0I1vauPjHpPIr16EIc
	 pf8oQMifYTnpvaULKCb2xVX4y0qphceTu/T/bCpLwjNOuY0P+fggbx+sJmlJYcv4R8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042241;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	b=lGD8R8MXhqNC0akA92grtYdbjBf3tvZ+nMoeqaNxSGL/g4RBFKmKHA2a4dV3lNZKDEKW
	 aa+CP0h9X9eEXNS7+s4Mwonbgzc2fNIvOjsA3gHAfi7vop3GOp9hMdwstihP8Hza3pBBT
	 IHEzujrEr+z1buc48fYby3P6cmB5Ra7Zsi3DGg9favr+kZ4pGbRlrkgtl+Q5Cf5AvdRwl
	 uhwE9kTfBjF4Z7Db2u3DatcilkRgm2dNVJleYVyDfq0k3YHBIqof6+RVNsSfcMPlAIWnG
	 cT2sAB+FCf7c7RdkUgzCJ6ZtX5LP+1+21DEIBRQZugWLM8Y5JZFbWxFjhDDlv8mGU2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Us+cBCcJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A2C60A260E;
	Mon, 26 Oct 2026 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Us+cBCcJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042240;
	b=cabIcGffNexV246wSdv72au5KVzUY/fixq6wBplUpJGslPnvFpSNsoJMXwl0kxTQbcVD
	 LnS0lkRh3+H1iIGLXufiriskGtsvm3mWeP9mFjD2MMAwe4QJt+4M8Y/F0c2LBXgFC73Tt
	 1Rgj+6vKp8eT5nLs7DwKV87ELKdyqeeKX6l4d2Rg6bw+lb2AM9RBpZ1YWZqlwXWuc8Ey2
	 ZjSgL6GiS35yEIq0X1alanin4sqCqa2R7EKm8im/ew0GLG6uQGk1cSiVuPtyNr/iNItY7
	 M31bKP6eVrfEuu9ICPruszl7u3tXmWovsekhZDEQZWysZWTjpF8SxKIV5Mjn8gGjCjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042240;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	b=lRtvmNtjfrWDbl3LKNTIf6qqUfL5FEE6AyTe1BzW2uzMeW/h/jgLMlgRlnRUWPH/JrKc
	 kENEXMU5awypCIAO08ZanevO4xyqD7yrseu0BpExIk7FDGR7KJxs0pnfLrbFffuBjiXoe
	 5Vm84kA03cTato/OWl8Jx+UnyYbK6JTsZcuLxDQ//dfZy6oYPItVsHOqNOpUuxGMFf5Ii
	 K9xVX6eNm8gosOCZFwGP/LqM2HIaH5Ncr5veN+l84g9MdoI4IEmiFfIjCliTbwhWstK82
	 +1Y0iaYqpCbyNhA2BG1/kdjC8Pa1DMg02Wsi3QfbS/nLQPxDLWp3YOmPRZDMA7ict3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D47FE1F01828;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042240;
	bh=bUzni0iK/C+PhtxdHk9zeTrgmQXy4renjbgo9cCUJ7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Us+cBCcJbAn3Q+yLcgwyQHQby9XUeGr9p7f2jxnJtte0O8MWoiPXsC+CCZ5JJQi8a
	 n9INEvY2OVVr2ou2zlexFanoHDSYr2dV6S/exHzjV36wg3mIgJgT7Tt0L0DU0/mVqa
	 /TpoIoZoLUHIaFABITbzpojIp6VNOH63AJFU9Zfz4+1kR5+rD4lgg5gnKFacZAlv/T
	 cXOVZBYuYg1wFBpESzY2R9/ZErYuQqQfYU1nFJBi0L7Ks1+C+yhJvXlDXq44FmBDhS
	 Af4flbgvyHkU6mQBQ5FeeDasVr2tdzQ7VHyPvlv5tk8DVyGHpjwMk5eyXus2Y+ZlSI
	 pc3BLUBDBSOgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7F2A44E5C;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:55 -0300
Subject: [PATCH 7/8] drm/msm: force mode_changed on color_mgmt_changed, not
 just ctm
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
Message-Id: <20261026-msm-dpu-res-clean-v1-7-f46130a8a717@gmail.com>
References: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=1219;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Wo3tEP0RL/iVZrlVbjqizqGErC2YhsS/kVeKWgJ1UBY=;
 b=Ka8elEcmKvRmXT6MxV7shh8QtW1BUM34m8jO69Pppxv34hT1WkBIwW/du7byZGl5q+mivl9sR
 dI2mCiPGOpqDqqYH8xMs8i3CNw8qaTypCBy8azN6b6SYsV6VTBNx13P
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


