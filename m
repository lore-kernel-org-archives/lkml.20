Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450716;
	b=Oxz+N1Uun+d6Sfwa0nDWzN0a45gIrYwn0N4ZKD3d8KucT2+DAQF07kLXwRaS3g/Qejo8
	 F3jNGTDMsjlSRxVfkGjLJ5/C4CS+/ZaSDyqc8B9TnjvJ0r0FpHYt/QJVpwG1Sk/sfCqvS
	 3wjzi7sXJl5SqXTLH8XEe6+55r9yfwc3qdxVZ64KkTwsep557Ixgdnyl2eQdBc1Qf13im
	 cqUHIXPiQAwmSYvtmZbHd5Yq9RHFjBkBiBMrxGoZNlYDMeHcUqRCxSMc9owseQyEu5i8T
	 8wJO079i+6k0KPeSBMN1aIoXj8He6ZcU9CiZ2UadYcKy20memn5cKZbgDWKUor+h+Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450716;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=j8jVLN5GJ3ygVod+jOB8l7G2EGInzMBRKDpZ4K9mplM=;
	b=uDj9mQXMMwyaP7GuftZCnK0akcSr/gMqT8yIrnVpaydqmKMzmiY6RxywUMZmzYj79/0z
	 9oz4pv9vE933IkELEE27JAU4DNs04H15UQV818rSA4DRtTaEwU0FPYd7rUqaP6ObsUqvn
	 DD1qxmGB+htqRkVT9958PCg9Y56f9GAC2i0lYUJvffRKSrsO6eg+pEw23RNHzkfUqbqLn
	 pPF9aGrkswLIA7t5FuBtWCtc4dnpWeH+fyQzYMII8Ts1tBvAAyZ/1L5j6LR94V2bECF2g
	 LkLRoA2FKIk+LE+YLgYKFrALk/mQ/QVGtfxdJMR2jT+Rl2FEj0GpexCs3aXY0/pW9EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7MAbSiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94157606A31B;
	Mon, 19 Oct 2026 22:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7MAbSiq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792450716;
	b=jJAnKVzM2NHB/SrrvUhtry/FMyxW+EI1n8uuWdEnJz0ui0LycKZ6sovoba763oZ6veZq
	 R+JcEcbiKJ5CxjiyIBBdcJX51ejmVE/9LgovqGZwNm4PdDcFKZkse5z9kytFvhZFEslfP
	 0QIJ/NilfQ+5uMdRWkLHxbpVqUNPzmCxx/eaJQfJZFpGymNx5hJli/rSMSQK6md8AWg0B
	 eluA57LtFRYFBj0XFhWENXiU2Wg9hLOT7P5s6svrAh+McVKMr1vTLUL+T2htIwYgb8gO3
	 +LoK2UawIjv56pBKBB1c+IX5GY7f9UWN7u8OHkPKwF2sTF+F+uQ6ZzWM4Yre2NzNrjg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792450716;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=j8jVLN5GJ3ygVod+jOB8l7G2EGInzMBRKDpZ4K9mplM=;
	b=O1fhHLcG9eOjqZQBM9FKA1/DxOD1akrTjil+EyPpXg6ZbPd/uKKHGkLKl4U/NJfSgBGU
	 QMwGNHON+8akt8gOhkKcxzhHWXMKL3rD889aRvowp/LNnJkPoY7Z64JX/P/7FHzK15byC
	 KJ5+Pa6L/XqyEomhmT6sXsxT7o/jqUk1ChzxXP0SpQiPE98iVZhAKvIcUCFuvps9ObkJS
	 dos3jShzTbvwU86KwGWERaRhFXsTT66Qx+FIORLTqDv0Sya16jBRXoFHAM4IJOQ8t1P8O
	 afK2N800DJZVk5xBPL81x2ACDYx4bIAWpTSaTiT5s01WZEoKw8k0uJ+5Jvwu5SAhysw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD1C91F000C5;
	Mon, 19 Oct 2026 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792450716;
	bh=j8jVLN5GJ3ygVod+jOB8l7G2EGInzMBRKDpZ4K9mplM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l7MAbSiq6kMwkEpP8oWqCol031iUhy9PzC5I8eRhuCT3WQvdFs4M4Q89vYTkkcL45
	 I/uOAlfsqnTNcozCq32HFN3JysLnrGW3LF+uRVGmtEfm6uKfTGzPqn8B5FX3BYeWD9
	 BMcJUAkC/5tuxWY9vlhbp2gROAEdGwM+wLKCjC1r2oqHboPqeQFB1zJXfuh7C/2UHs
	 SWPYy3eS3UCHTwD/RoTNgCdWjadh9wuCp+QN8IBpzFMhdVMTbefrEW09oJiqu+dItb
	 m+TF8WxwiQaUthZC/kSJLXZ0vBwiHcgL/yaKkFyptIZPQ80JO9hLGrB7WEM/Pxak0v
	 4Y9MeU1kqBUUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A01B40696;
	Mon, 19 Oct 2026 22:58:35 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Mon, 19 Oct 2026 19:58:30 -0300
Subject: [PATCH 1/3] drm/msm/a5xx: Reset the GPU when resuming it
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
Message-Id: <20261019-a5xx-gpu-pm-v1-1-1d0c313a1412@gmail.com>
References: <20261019-a5xx-gpu-pm-v1-0-1d0c313a1412@gmail.com>
In-Reply-To: <20261019-a5xx-gpu-pm-v1-0-1d0c313a1412@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792450714; l=2441;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=pgmuJr74vl5DdcyIRaMFMXExHYM4RMyzyaatxZzA9fI=;
 b=Gv9+hl0G1oNlCSAMQZdDBTQPLlTR8N5rRKLdE6TIr3kf5oEw6KcNRUnIJ3AFXmW3Uz837tCrw
 Q4l+CQpQpJ2BiXcPolL0CUo0PGxBE6G5MuyEnA7VWLhkE1ekD8UlFzH
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
well. A GPU resumed with GX still on keeps its state, and the CP keeps
its ringbuffer read pointer. a5xx_hw_init() then rewinds the ringbuffer
and writes CP_ME_INIT at its start, while the CP goes on from its old
position, executes stale ringbuffer contents and hangs:

  timeout waiting to drain ringbuffer 0 rptr/wptr = 23/C

Soft reset the GPU in a5xx_pm_resume() once it is powered, so that
every resume starts from the reset state. The downstream driver resets
only when it finds the GPU's power left on; resetting a GPU that was
powered off changes nothing, and on A508 the reset takes about 2 us of
a resume of about 1.5 ms, so do it every time.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on A508 only; the reset runs on every A5xx.

A stall with the same signature, the CP's read pointer past the write
pointer just after CP_ME_INIT, was reported on an A509:
https://lore.kernel.org/linux-arm-msm/20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org/
This may be the root cause of the A509 stall Paul Sajna reported there.
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 16c7335c4b1f..dd0d731df138 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1367,6 +1367,18 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/*
+	 * The GX power domain is not necessarily switched off while we are
+	 * suspended: on SDM630, SDM660 and MSM8998 it follows the GPU's SMMU
+	 * rather than the GPU. If it stayed on, the CP still holds its old
+	 * ringbuffer read pointer and would execute stale ringbuffer contents
+	 * once hw_init restarts it. Soft reset the GPU so that it always
+	 * resumes from its reset state.
+	 */
+	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 1);
+	gpu_read(gpu, REG_A5XX_RBBM_SW_RESET_CMD);
+	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 0);
+
 	/* Adreno 505, 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */

-- 
2.56.0


