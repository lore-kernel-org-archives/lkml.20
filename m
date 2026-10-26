Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042238;
	b=m9S4esq+gF0lTV8NzMtJOKEwxWu2ZZ/Q1TxSRqgMRgh1+VVL9l5V5Ujn7/NFW76INpEP
	 fK/xS3gZ1EUwAeTK9aBYlv4D1XOMV95j37Nq2w1cSKs/b31OhnK+UCI1JmWP1p6nyLrwP
	 iK5boiXW59JYx2/xGaT9ZnOBzJjpYrTgXMplg0gLLKG4TFvCdeXZEDlGj0J5CQZnrA2o4
	 ZLJjHFJB5YJQmHwmP/Y+zGQGfA+QGlzI95DRf/WROcmbLowh+loBmnU63pMQWjQLjD9lA
	 oOqPnOKqfZKZ3ddiPhOoIxCa7e+7FTlpZLa9UFbf+dxJ/B4NRN60irPaFD7ZolJooPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042238;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=imHYWeksaXBeFcKIQhEzRRVpKwqiW8IhQO4lvWkfRAQ=;
	b=SC2JBKpdTWi56davbCKqcFJvRdMwfOQntgwGdwh0n3jgOxXyRqeOl/u1DYd+r8pRtckn
	 GGWvbIMqRgRS7/6gj2zsS9YJti2eZZgqVSCXBxK6JG6l+F+SRgJS+U0ERxkxo8QL53A/S
	 7nj4M8h/NFVNSiIcq88iKXxMFhUD36E0DzeBjwfpMQN0t5rb2D2tPhVYJo1bYWgdmq25C
	 aDDhexRvXvfpnqMIjenTgrplxz4S9zj0CyJY8WjW2nN359hXiXRx5Rz7iRo0tNI20pPEO
	 0dqKu9/WCcoUUm6znGUGweSYXvWyqgQeXxciIgS3npQcfhOBRTFot067SGJK11kPWYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImQUjrQW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C160A2602;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImQUjrQW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042238;
	b=JTRLRJIk7z2fCldhJD4Uogypc9O1KXNKtw4iCHe7ueUZ1V2w8XU9A0J/103In5lpDZEy
	 OOZL/U9IbrYYO8Tdz5SqmOyJdLGZFV6O6RmoMWAMPSAw+oDr3j9PcnBEm26DSH1CZP2MU
	 KWI4O2wNEFppWAvkr3NclhTCkdFDcN+mfuLssx58nilg9nYPRpbHBFVG0Y/RBN8x99g8B
	 rIrA9vVJiTDr9jxLpJRoNhNHBn5Eyyapo7PySFArojssGdvdiu/YZXMFPMsLaHraGc++O
	 +zrgsMgq97Zw+QBU+qwG97yAbCa9ynLnkVx6rKeQBFoLF9El8rgtpIOAOPKbwYtSwVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042238;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=imHYWeksaXBeFcKIQhEzRRVpKwqiW8IhQO4lvWkfRAQ=;
	b=S0Ptqa1fu8k+j94Fp6USwXt3U11wUFAsM+bXrLZSmp803jTyjfPoRTZbCHIODZd9HWpf
	 f7Cs9sicJH6JqVeKwlTh5CXWnruI9jm+M5Jn+8xQJpd1t5hoQR7rQxXjkfS1UN791d0lT
	 XYJS6zbQowDF5Vz80VbUKEYkbqspBQ+UqMGZPlpw0INtgEgMiyKjykpNbt6QGE+z+Vr2c
	 vo6dKKkSTUZKvBJLXAB/VwUximuXGICzat67dKG6W6zZUfnmmHHNnCd50jzZc9hXgkfQR
	 ZXG+ANwd7atjyFVcWlXRSAp5qU2LiOfo+ASJaEXZlQJS/Ps71qLh2g5xZqbJg8qRXYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 473EB1F031E5;
	Mon, 26 Oct 2026 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042238;
	bh=imHYWeksaXBeFcKIQhEzRRVpKwqiW8IhQO4lvWkfRAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ImQUjrQWIT5yxySQ9F6i4rgRybDcEGn+Yf2njEH846y1rZ+b0EBPY0t/rwD5qABct
	 BLLoaE7K5zYNvG1k3bYNLdcyuCDRjDeZJM9GdVZfVGsLU1pGoJDq6a2dG+P1rB1QCN
	 l4b0jIAJV3kDD3Ic8vUj+g2GMSToy6I/+3UbYH/4bTCg0WPye1DRe9B3PPLiM9yrnP
	 ub+4K51q6rd6yflZN/SMCgVYfq43w2zzGPH0ymYbqGKw9H5fO+5oaAjXbZv8C3cc4Y
	 uQaHRmZT9S146LwimJ998iLamfxsRkB327tQxVjgK78voOi8Ke0HhZAetGr6y49Ty/
	 F6QV6yBK+xvhA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C503744E50;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:52 -0300
Subject: [PATCH 4/8] drm/msm/dpu: Match setup_dither cleanup to the way it
 was set up
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
Message-Id: <20261026-msm-dpu-res-clean-v1-4-f46130a8a717@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=1544;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=1MTlWjU8pVgLZ2rHuiYomfqUUR1f16R7qSP8TFUAGH4=;
 b=c2qs/hJFZZl9PaH5Ju7lHaFTIqtDMA0PCv6Gctd3IRZemFZK4sX92/W2tsMZk59NdnPHi5pVs
 zNe817nnNZcCqzQrJo5bvdiv2SU7B6zFb6i/PI83h0WQ3BPW6ccAiBz
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

Cleanup hw_pp->ops.setup_dither with NULL for all PINGPONGs,
matching the way it was setup during enable.

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0ab151369c99..7d092398fc99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1320,7 +1320,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
 		unsigned bpc = dpu_enc->connector->display_info.bpc;
-		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_pp); i++) {
 			if (!dpu_enc->hw_pp[i])
 				continue;
 			_dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
@@ -2303,8 +2303,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		}
 	}
 
-	if (phys_enc->hw_pp && phys_enc->hw_pp->ops.setup_dither)
-		phys_enc->hw_pp->ops.setup_dither(phys_enc->hw_pp, NULL);
+	if (dpu_enc->disp_info.intf_type == INTF_DSI)
+		for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_pp); i++)
+			if (dpu_enc->hw_pp[i] && dpu_enc->hw_pp[i]->ops.setup_dither)
+				dpu_enc->hw_pp[i]->ops.setup_dither(dpu_enc->hw_pp[i], NULL);
 
 	if (dpu_enc->cwb_mask)
 		dpu_encoder_helper_phys_setup_cwb(phys_enc, false);

-- 
2.55.0


