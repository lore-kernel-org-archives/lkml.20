Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166405;
	b=LDy/nIarxAlrmiN6WHlkHbW2nAcKXv+dAkXyewHosEECmXC444SEYVJqoGYaaqBuOVgH
	 FkVZJj4osF3n6z97qNOZlRaE5zpyjV0S8JFf6n0sLTl4O9wxkwUAwVok19T5IrKPvHr/K
	 GTxZ5RR0VE/y8UD3dekeu5v2e9Drqs2Xf4msHlDhn20GxsKwPWBZzu+0lXf9yVXuLeles
	 03rxCJVBfFmgQPS0lPeQH6llM2aooW08IJBjBxF8WBobEEDBc6EgLRw5UI5ZZqz+ZcTQq
	 43LNwJzGLOomZN0O7XY9wGXmUs+N3GzSvIGxOUtMb93uNt61erPaMBAvFJXJM6vDMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eVRDROiDIUNDs50key7MrVecbdDqxRi5PolkiFkUUc0=;
	b=spwK+2r0BdbAxO3PrFbdej+AK3p7IBnJE0Q0SWvhlBhXQ8nE4UhEz5yd806/hQJa7L6s
	 J0rDQkbGpysMDX8kDwNodju34pxEAHHp7p62kkDRx73E7oBXVbOh8sJRZ+55POkO+SUJ1
	 sqiFVeeTk9RELUAQyodIZnzH1dTca197Ts12clZkpFDNly6LD5NxNMOhyEK1HJYmPqjiG
	 lCHVVjncCfN5KOt+hur2CHWYXaNIu8x3yygG/FUEbWlyv56SlRcx7mliGf9ra6tkFYbcm
	 2dtpwS1KCyW5F2OPBwSVvXSUp8krYJsdvT1OAwYWB8ZkbfllOhIHDIY0P9xhCXVDJ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RECRtHww;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ECD606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10ECD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RECRtHww
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so1443055e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166403; x=1794771203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVRDROiDIUNDs50key7MrVecbdDqxRi5PolkiFkUUc0=;
        b=RECRtHwweD7cE5g2BeDl5p1qqR0hX2+1zIG4eoi+MTj3VSh9sOZEfEPGb0bXqwRENj
         yQKKAPwXIolCj5afEMVLUf+6IhTMdYrye4Pe2joW9noRHRB12EbL8Y8jUrOm2kaMt6Qz
         b1RCPaHq/hY347YPDyjJejSQy1p/BsaOIBOrBSOeccdz7siaAfgFYZ4mUckNDxBjwYqJ
         TbiQdkQRPij7DTlN6WOWWq2DR1QlcPd/j6pkfLpcJC4L48OOy1IOG2lHYBUomcu34BBp
         4CIPpkaJ08SJHmYSWCpQmpHCqmDyZIfzaDojKGBRtjBBa2ydeZVeWeZxTdgFjq1kwRG+
         HMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166403; x=1794771203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVRDROiDIUNDs50key7MrVecbdDqxRi5PolkiFkUUc0=;
        b=TrCLwsZ8NU1+yvTGar888OHhrmNt9zqvUKSLY/1s8+/c/ejV8AlQO0ljjIOQPksrSV
         bN7Y2sc0cCAdcmDWJbyQ1F4sk4qQmd+/baCg/KW9UUM8ws3ivDqHttqFWT1VI2TVDDyC
         tEeW0AesVQF/zRmyNsENA3gcZB6r/fPJfkWpLXUZL3lCcHAjzhkAAOhpPQOYPoNRI2O8
         2xT0n2q5O2riX+iUFYHm6enBqJ5/FpThagWhn38mcjAo8kncY8cN1VmIApaigRYiTuMa
         iveX0yeC4z+YjApZ6kBHljk5Gh0919Y7xHsGKsSeuHx0JEC0NdfhI5cofK9GhP07cu2s
         s8lg==
X-Forwarded-Encrypted: i=1; AL+hErGjKtlWrv4saCUzfNjTL12RNJYcml9b9QYeGYgsrzsawlw3I61nI+HZhfDDkw2hC5WsLDR8mb3/URyQpaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WZue8uRJ64eTqcr/1nk210OkuyvFbPlS2MRaZud2XnvtARtaX
	M1lG14zomuMDBE9hEFWCPwwfhdFARWrJTuEh+JZMM1pBcOy00y9cZJM6
X-Gm-Gg: AYBFou3CsvnC2AHk2rJ27ODt7aHy0/A9Bo69Dio/DRsoeAHCabegUAGc0D3GcwEQMwS
	em6M/Tk7a1lz4tx2sUV92JR6XqGFteKJ6haC+Ud6GyWw/nxFk+T5pb0uM9nca0f5FUADaPVmP7m
	9CY0+TRIdUXbC60JvXBeqsuqy7Hr6rWh3Ts6sMT4npTvWH8P0+349CK/BGts94b3RRzD+L7oVbF
	yCkxuYhRDwFjrEhixWYBlUfI2U3bxFtBuU9NqBTRDifzAUWNrKr3bnlyY9gZRAOnGehnBnOYnvw
	yAnFn+BgVIPTd6IxW4KHtdCm5UjJRXiidDY6JwoIbcZ9BMAX6cvk1yZIt9lKLSCvaTOwG491EM/
	nt8qOkJkbOU2gEICrUt/QbXe6ZZBJfEq+E23ZqHLcVXdoTPE/qlHdX1qc0voUeHWrk5RjhxFYr6
	2dByLR3NdMnJuPw4LZDXAbrOnBycIzzzA+ZiV4L0cC1/kN5JmgRO6u1ycq5NnPi+LshH7QhErI5
	P/i+LVT79rjss9ebqWm2JGrbPXv+l/x3DpG05uwYZGbaKurgU7pCfJ4kuEZod7D6Ov4UWM2lv9m
	IsatmJZCNc42CNpoXqGfO6/1iBMUsC+/j7SqwoqAc+7epA5I7uFsS5PAsBfcykJd
X-Received: by 2002:a05:600c:19c9:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b963c855cfmr39830655e9.22.1794166403387;
        Sun, 08 Nov 2026 11:33:23 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm105422115e9.1.2026.11.08.11.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:33:22 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sun, 08 Nov 2026 19:33:09 +0000
Subject: [PATCH 1/4] drm/vkms: use the gamma LUT of the state being
 composed
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-lut-v1-1-f762d70ae4cd@gmail.com>
References: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
In-Reply-To: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

The worker can fall behind a commit, so crtc->state may be newer than the
state the frame is built from, and the frame would mix planes of one state
with the LUT of another. Take the LUT from crtc_state->base.gamma_lut.

Clear lut_length and channel_value2index_ratio in the else branch as well,
so that gamma_lut is either complete or entirely empty. Nothing reads them
while base is NULL - apply_lut() returns on that - but the next patch
decides whether to rebuild its table from lut_length alone, and a non-zero
length next to a NULL base would have it build from a NULL LUT.

A zero-length blob takes that branch too. It used to leave lut_length at 0
and channel_value2index_ratio at drm_fixp_div(-1, 0xffff), which nothing
read either.

Fixes: db1f254f2cfa ("drm/vkms: Add support to 1D gamma LUT")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..1d5658bbd493 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -609,6 +609,7 @@ void vkms_composer_worker(struct work_struct *work)
 							  struct vkms_crtc_state,
 							  composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct drm_property_blob *gamma_lut = crtc_state->base.gamma_lut;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	bool crc_pending, wb_pending;
@@ -625,19 +626,22 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
 
-	if (crtc->state->gamma_lut) {
+	/* crtc->state may be newer than the state this frame is built from. */
+	if (gamma_lut && gamma_lut->length) {
 		s64 max_lut_index_fp;
 		s64 u16_max_fp = drm_int2fixp(0xffff);
 
-		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+		crtc_state->gamma_lut.base = (struct drm_color_lut *)gamma_lut->data;
 		crtc_state->gamma_lut.lut_length =
-			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
+			gamma_lut->length / sizeof(struct drm_color_lut);
 		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
 		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
 									       u16_max_fp);
 
 	} else {
 		crtc_state->gamma_lut.base = NULL;
+		crtc_state->gamma_lut.lut_length = 0;
+		crtc_state->gamma_lut.channel_value2index_ratio = 0;
 	}
 
 	spin_unlock_irq(&out->composer_lock);

-- 
2.55.0

