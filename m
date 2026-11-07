Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794083173;
	b=5Uu/fTnDOxZHnfoEL56DGk920STpeLis+okKEBnFZvuSNqXF/INhj9u1MUkaWosA3zzf
	 1RdUnvxRFxqKF9owQKMAJsaF6i6hzfPjFOPzkuHCZSST26DKEV0FK5dkFAX5J/mr5NCqr
	 f5Oi+JJ6OnxN2cXQDwM4OwV4AjPYE4+Zt99tCZNbMWLRsnHGw4JyjQjMIA+moSMhJlYC6
	 qLx6TSmRLKzQ6p/LZeUBKzxLjL9UDD+E43Rl8yoof86lc1s+5KvTb8AxpjiHJYGYlw4KK
	 WROguJtM2Co72XnoWOw6rjJNl0L+DgfU/A5ANOX3kkr2cdK3UwzDBS7xBCfN3Vcaicg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083173;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GIprRia/RJ9SCW3Nz10/Cuw3C9XQlfLSKDzw5fbfJpM=;
	b=mJGXpcPV7SzT+eQBFUyU+bejSYgnj9LuIOSmHW3AU+XQfqxu+O8m56VxCqz4WknYgBTf
	 rLMncsrzB2ff2q/i2RVbigBABZMkyoF9gin0+z4oXF3okbcXJOVc3veWCXQk72FyPodF+
	 DH8p1+l7Gw1CfdbdK/24hyFWt819gPH9is7SoTGNPahj650rEyj2vSra2YMrpwbhQ/tvx
	 tqUBrN9/gXcvWKzNA81TBA6f5LqFG/Sop6sL9Sle1CWa6jpaMYqEeArcO/R6qGddbvh8g
	 LN35z6vARCWVsfICIgBVdw41Z5REx1CgTRFQhXh/vnfen0wwINJZlhc/QIIqqvEFhkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X562X8Et;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED114606A33C;
	Sat,  7 Nov 2026 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X562X8Et
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794083172;
	b=sDhwv3TH9yV/llP290c3TnHfs3TO4SaG1AUh6eFUmI8AO1aCeQLa9CLLEet/z1VQ6lu3
	 YOc5XhXks3lh9v5EuRa2qOC34+VkCkvZZZD6AhnvH41jpXZlrRZtLRkR0c1B0tX9e20uI
	 hU+nzsuuJH8xQdUVJvyAJVKmu0YAXTmZiIbM7jfqdbOGGaRtgoeuL65aCUAre4bcJm5B0
	 9yVLojO3jBMbnTDfYfIPK0HPcT6nRB0izwi1q9SjjZqse4TfB4cN+sKGQ7HPDQp9I3VSN
	 OIseP3Nl4aDeAy5hyThzGZKHEMnZ37R+q05zc/5q259J5crMtkaqxMBLtSsjFAhbDwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794083172;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GIprRia/RJ9SCW3Nz10/Cuw3C9XQlfLSKDzw5fbfJpM=;
	b=R7enfhfeF38UW/FQQ/m1DOmjMqA9ytzpOasVkWeD9ztxoRnH4hoYoxA20O90onthy4UQ
	 +f26M7qDTKzlq1uZ/yMUcqR3So4cjrWraKSL/0R6rnkkvB9X0FKeEQWdOJeSIHlHZWiw5
	 Cu4LZB9uilAk/Yfiwhvlxa8//D5UTwVNnugkvdtg04hzCQiAuH1+/ZUjhtyNeRZgyKcC+
	 f94+6AAmIJg8xMwZGKG5ZX8vwp9dpDxlQf87NqXvvwmL4hiIPKR0NwXRI/LWiSADN7VSe
	 YTqogxNjOzLdUbZ4+oOGBvkHslNA85yebIX0YlyMcj6TV6uSP9mBhxqv9Q6qAfE0Q8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 148CF1F008A3;
	Sat,  7 Nov 2026 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083172;
	bh=GIprRia/RJ9SCW3Nz10/Cuw3C9XQlfLSKDzw5fbfJpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=X562X8EtoNhDaJzVbOyxJH+/t1rUxpAs2cHfhfnmG1JMAOZ9pXIhROcUTgUBTLhUR
	 WyeBw/u6aaizrhvv+1QnuknY2eXcw230qhOE/+OFNeUv8YL0A3HOs9+yIeC5Fdjc1j
	 OrA8QgXX5utkXx2hXg3gF978pMZNyH+s7tAxOOFWAFbuni8nxAFE7HK8z0KodNDvIK
	 jmgA7kkVJZplDwftPHt7trfUOXg5PTqhNGukYcGLA+A0S/45GcH79/VjtPqsYkfRH0
	 aXK0pKBL/uXw+q2F8XYUQavqpbn086v0zNqRFOZqvFkIC1RLpZMBitmEqp7XhHVX4/
	 4VKFOUQlC1FSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 94F7F47CFF;
	Sat,  7 Nov 2026 20:26:10 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 17:26:09 -0300
Subject: [PATCH v3 3/4] drm/msm/a5xx: Hold a CPU latency request while the
 GPU is powered
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
Message-Id: <20261107-a5xx-gpu-pm-v3-3-e2480408abea@gmail.com>
References: <20261107-a5xx-gpu-pm-v3-0-e2480408abea@gmail.com>
In-Reply-To: <20261107-a5xx-gpu-pm-v3-0-e2480408abea@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083169; l=7433;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=/JhjEL22ii7W3xtMdsbYk5EVd1ODpfhSOJcl87x/rEg=;
 b=hY+iT1s8tq99aKO8Zxfxj7ClVUZkSZGqc4dnMe6jcnFR1ZG1vo9ulRR7htIx2/3tL8+jhzZZY
 OTJafopTzkaBUVregT0wy4TEarLgGIIhb8KlPFOJRaovoXDGgmjC9+W
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

On SDM630 the GPU was observed to stop executing while the SoC is in
system-level power collapse, and to continue once the SoC wakes. Its
interrupts have no wakeup route through the MPM, so it cannot wake the
SoC itself. A submission overlapping such a state would stall until a
CPU wakes, and a stall longer than the hang detector's threshold makes
the driver recover the GPU, which can lose a frame.

Qualcomm's downstream driver holds a CPU latency request while the GPU
is active, qcom,pm-qos-active-latency. Do the same: take the request
when the GPU resumes and drop it when it suspends, so the state is
available again once the GPU has gone idle, and on destroy, which
unbind reaches even when suspending the GPU failed.

The limit is a per-GPU catalog value. Only the system-level state needs
blocking, so the A508 in SDM630, the A509 in SDM636 and the A512 in
SDM660 take 2336 us, the largest entry plus exit latency of the CPU and
cluster idle states these SoCs share: every one of those states stays
available while the GPU is powered. Mainline does not describe the
system-level state yet, so until it does the request blocks nothing.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Changes in v3:
- Take 2336 us instead of downstream's 424 and 518 us, which also
  kept every CPU out of power collapse (Dmitry)
- Drop the request on destroy after adreno_gpu_cleanup(), which stops
  runtime PM and the GPU worker, so nothing can take it again before
  it is freed (Sashiko)

The system-level state comes from a series not yet sent, which adds
SDM630's cluster and system power domains; its entry plus exit latency
is 14773 us, and any limit from 2336 us to just under that blocks the
same states. With it, on an A508, no request gave 205 and 272 hang
detections in 585 and 634 jobs, and 2336 us none in 416 and 479.

Downstream's MPM map lists the GPU's interrupt, SPI 300, as 332 with no
pin:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L62
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-pm.dtsi#L585

Downstream's 424 and 518 us:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L117
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L126
It reads the value at probe, applies it when the GPU starts and drops
it when the GPU slumbers:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno.c#L887
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno.c#L1451
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2753

Tested on an A508 only; the A509 and A512 share its CPU and cluster
idle states.
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c |  3 +++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 4 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index babd320f3b73..ae9127940a22 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -55,6 +55,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 * the GDSC which appears to make it grumpy
 		 */
 		.inactive_period = 250,
+		.cpu_latency_us = 2336,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a508_zap.mdt",
@@ -72,6 +73,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 * the GDSC which appears to make it grumpy
 		 */
 		.inactive_period = 250,
+		.cpu_latency_us = 2336,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,
 		/* Adreno 509 uses the same ZAP as 512 */
@@ -105,6 +107,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 * the GDSC which appears to make it grumpy
 		 */
 		.inactive_period = 250,
+		.cpu_latency_us = 2336,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a512_zap.mdt",
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5b5429033986..b3f9bbf997c9 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1061,6 +1061,11 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 	}
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	/* Still held if suspending the GPU failed before it was destroyed */
+	if (cpu_latency_qos_request_active(&a5xx_gpu->pm_qos_req))
+		cpu_latency_qos_remove_request(&a5xx_gpu->pm_qos_req);
+
 	kfree(a5xx_gpu);
 }
 
@@ -1360,6 +1365,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
 static int a5xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	int ret;
 
 	/* Turn on the core power */
@@ -1367,6 +1373,11 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (adreno_gpu->info->cpu_latency_us &&
+	    !cpu_latency_qos_request_active(&a5xx_gpu->pm_qos_req))
+		cpu_latency_qos_add_request(&a5xx_gpu->pm_qos_req,
+					    adreno_gpu->info->cpu_latency_us);
+
 	/*
 	 * The GX power domain is not necessarily switched off while we are
 	 * suspended: on SDM630, SDM660 and MSM8998 the device tree attaches it
@@ -1450,6 +1461,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (cpu_latency_qos_request_active(&a5xx_gpu->pm_qos_req))
+		cpu_latency_qos_remove_request(&a5xx_gpu->pm_qos_req);
+
 	if (a5xx_gpu->has_whereami)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a5xx_gpu->shadow[i] = 0;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index fb05f1ca3e81..07a36c05be25 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -4,6 +4,8 @@
 #ifndef __A5XX_GPU_H__
 #define __A5XX_GPU_H__
 
+#include <linux/pm_qos.h>
+
 #include "adreno_gpu.h"
 
 /* Bringing over the hack from the previous targets */
@@ -48,6 +50,8 @@ struct a5xx_gpu {
 
 	/* True if the microcode supports the WHERE_AM_I opcode */
 	bool has_whereami;
+
+	struct pm_qos_request pm_qos_req;
 };
 
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..fcc382f4a9a1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -118,6 +118,11 @@ struct adreno_info {
 	const struct adreno_gpu_funcs *funcs;
 	const char *zapfw;
 	u32 inactive_period;
+	/**
+	 * @cpu_latency_us: CPU latency limit to hold while the GPU is
+	 * powered, in microseconds, or 0 for none
+	 */
+	u32 cpu_latency_us;
 	union {
 		const struct a6xx_info *a6xx;
 	};

-- 
2.56.0


