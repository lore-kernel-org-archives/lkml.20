Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042240;
	b=wQTTd9K36QDKqI5CX3VagwZDy9/03UkJX7Bjs71HgBLxgk7hGANb0paMkYB04XAPPHUZ
	 XCys8P0ZAcUjIoK/BeZNSMKm7Qhu+y+XRL42M7Ii8oaESYS5ZymKvqpC9ehXwja3NUIRL
	 fMAnVn6O5wvH8OKeoGrIUoTg432H4t2rONLjORaLKJ1HL0o77shmAV8fLHWmA9+Zn4pBy
	 KBlJedCXqg7Xq2PdMR8Ak1pyuMwqGvJvsj86MJwL8pNf/VVLmp9SGXkUe9aLrXhfkznKF
	 uKR00sQZVeZaOWiHiJUJou/MSR8gCJbsHAZMooePk6XaVmYN+qYl/PiW90dI4w6SrdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042240;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m6JQuiiAvAgYD5P15vse2J1auiyKgGQSXV7w3Qubaxs=;
	b=JSaHy5vY05jC2pxL27sKhA7bEEc0HAl6z3k7xa/rAzVaSB5TcALOhVN5/zsPC57ZIOiD
	 Ueu9lYSbytxQqPsMbZDhh1UBSV7QbnkbAucsAgCXPOpN2yJNBNhuWNZXrd7AFN9FczmzP
	 mTCnqdVCjk7yI9wIE+t1xfg47TvmfUW5gWNtYXKLC+ftH+DHQW238yQySENxG9tXNC/lD
	 BQdyAVBu19wh+a1hVpPBHhqMtzI/rvLUMV/pMWIc3cFmMfqVtwB9CIwhnZj69IByiUgT1
	 yH80fhXar9hp5RHAqN7uHcjBeFSozdWC8Ich865YyLV7fhzV3IIJhFbATrremAXwtAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4n0CBhU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C1606A335;
	Mon, 26 Oct 2026 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4n0CBhU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042239;
	b=zhEj0wSvD9+j6a/pz7Z5qCOUV2rejkNv61mJMheqvcN/+Bmp+j4eVpGeCDT7ttOZ8XoS
	 mW8DTpvtpHX+jXBxjP2YpzZzYkzDpUzr5bUfCjHu9lbXykOG5b96keOe6DPGowbebUuHB
	 yvIO2GTBABJYWpF3gEa3OLuYIk4NvzWaI++V2WSevitL3r9x+idT3dFgCjMKqJXT0QUTx
	 rVvR2hGNnagIkxfoKAsGvVUNJrYXEUH0hQR+BkYd1jWF2lWQdpGSwjq18y+kD9SiRgdqN
	 52c/8dNVNAby8GsVqoxM2OIh/0wlHY8rtxrqu+sDtyUjZM/ETPaDYyvqFs6/trLhTdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042239;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m6JQuiiAvAgYD5P15vse2J1auiyKgGQSXV7w3Qubaxs=;
	b=Yf7SugHUK4bD9uJW7S8Nj4M5PeZ8D6qYHc65Fj8xWV1F8Aqy2hDiabPy/3CDGbqcmRCg
	 5tDXT+8GSqKhq6SSmHEAaQwo19Pkpv9//UfWzT/7pMBnTpcTo2UqhZZRNl6gt7xb0OiTw
	 3UeaPC2Km0tNQ9tIzlsVWhd3IMwmc0uh1OMWhyzjm4irycEfhkIsKltxDHo/3QyXI92zm
	 e4h5u0r8KGJuft17keIndR51QszwqUDyhW1uS7dpz2cLDuli2nVQbrDe5Kkdv5no06Q5L
	 5RU9FuplcaoWSEUW5YJnRAM2zUEdzP89NgPiM3UyB22uELmpScs1djdcAizkrd5KGvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5A661F031E6;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042239;
	bh=m6JQuiiAvAgYD5P15vse2J1auiyKgGQSXV7w3Qubaxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F4n0CBhUCYnGNj1cWqi28pTIOvZsA3SKRhrT0hZ4hWuJL9mAUB4S6qORi4bG8+EUD
	 eavjIO/7EDVEcVzWa1Y3fCY9Q6bIwE2dJIYH4inRDMAO/cVSxwFpU8ibD+FkoAESdF
	 14kES7EBwkmfo+ZJLMBwQ3GTsIaT/7xqir8CQsVd+GccEaP2lFRCSk7pprq8zC5Mc8
	 MRorNYvxJeuiZHef7JnGPP/8uG7pE30IiMb+fGoTtLMU6SrMS0d0wOcRIIMUG0372X
	 njqwcfz6muWND44UH6nwUvbQlbTHNQY/WRhX88tYx1aBluXAKJf4pn7SKKOQGnH6GL
	 /M33KTTWLIsgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DC2D244E58;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:54 -0300
Subject: [PATCH 6/8] drm/msm/dpu: workaround res re-assignment issues by
 pairing enc/crtc
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
Message-Id: <20261026-msm-dpu-res-clean-v1-6-f46130a8a717@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=1740;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=3eiBb0uy0PBNKjp2IH6yVXShmpVfE6rEzfXROTQjPv0=;
 b=ycxSfaEHnf/r9SC/zlyhmgTTleLJJJn92cKvzii6Bit0CyIas1C355iPIhMAqv0NA6PlhVHZC
 dulUR+CXhM7DEBZrrlKO277amomkcrzgmo04Y0S7FeLxt7KmbuRk4vy
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

Consider the scenario with 4 crtcs, 3 encoders/displays are
connected. DPU resources is nearly maxed-out, and mode set is
performed on a display which has acquired many dpu resources.
A new crtc is selected by kernel drm for the mode set,
and during atomic_check, the previous crtc won't have a chance
to release its old resources from global_state before the new
crtc tries to allocate new ones. Leading to atomic_check failure.

By having the same crtc for encoder when possible, during
atomic_check each individual crtc will always be able to release
old resources before allocating new ones.

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..13099d6e3ac9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -879,9 +879,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		}
 	}
 
-	/* All CRTCs are compatible with all encoders */
-	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
+	/* All CRTCs are compatible with all encoders.
+	 * Nevertheless, if enough CRTCs are available, pair up crtc/encoder
+	 * for better resource re-assignments during atomic_check
+	 * from userspace mode set.
+	 */
+	i = 0;
+	drm_for_each_encoder(encoder, dev) {
+		if (dev->mode_config.num_crtc >= num_encoders)
+			encoder->possible_crtcs = 1 << i++;
+		else
+			encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
+	}
 
 	return 0;
 }

-- 
2.55.0


