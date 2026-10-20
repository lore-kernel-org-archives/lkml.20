Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792461912;
	b=HR+HzQruGTUa3oMxtPP4gAEq7fXmXKXUkTPuqy2NKhRu/FNPqUfgJSzfBo0X7rjRokn3
	 BhzQ+iWDSnduSjVERjZ2JZO0g6bRJtpOWkzB0esq0tcwQf/f0JxQ6rNtJbScOLKANgX5r
	 3XM4dwG6Evj70/P5cu+s1uCM+0U7rMxl2OF1X0vltlVNoF1jNlCsyZhXg06uI5QD9TdHm
	 flMDt5lzdnds6cUHniB+2viWdqlMGMd5a+AXs0EYz9AgseqI/KoQ7fmGyEPHC48EZiZND
	 S66U5yVbi/DD0jJUl9B0mLIsvv8WdApE/3AF5Mz370n/K1Wo8BwKIyfJsph+ZqyJziA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461912;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=56TFoPsC+vIT97tVs05l7Gvn4lxIguQ6q9+6FgEk53M=;
	b=SYUq9trEySbUGwpYFIsV5j7BU9SkeVxkj8lkd8N19lwPYx0vgX8TzjkivrSu6r9Gn7bR
	 dfK43zcZPRQk5wDA/CuS7z6GgHI6vF/X1JKevwaRwhWLTkDLZf3pK8IFkx8KPqNSh3mRL
	 6ecR6c7BXUPJ9a+iBs5s+PnIO/D7pBMMuwhJ/J+msudPxXzcH6SoykyDqktOl2ya/1b+b
	 jxInIwfaQWS8jaC3CwKWuQZ8dcVAjIYyeGSQhs+VORyjiNviQMFi+vhLmO6vk3i+nkWDW
	 DI7KKbQ/97wImaMPuD4CR0O2IfXcF1lA6MvMRArk2xdnEjaJejzYN7C1ClsZymrWHHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6WQXDeO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA381606A31B;
	Tue, 20 Oct 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6WQXDeO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792461911;
	b=APRatOqawGn+f52FwZ368LIBYgPOkiXnBKPJyOlmnn+H/SP4SL3ADwL+EIp9TJP0uZvc
	 8/h7E3VQJOVzIjHWvxvuv8DpW7olbCF0bcZ+CGjNfs8I/gHfGUAO68tMwXlfZidVKsMMx
	 7ZI1nyCEFKJ9Z/nzOgnjePcKBtF9OV6t0SoRntIx2crDagyPFApTdjGCg04AZl2NAGUmy
	 XVhgZerN05gjv4IdspzRE/YwWMZU4q8qshqLzft/reioEEz8/FYwxsjIrjv9KJ8djdeuN
	 oinZn0rub3vbHHn4FPzM4ubtJ10u+nLaHLWmeZbTQfit0yB4cX9l0c2ngNqd+Oa6jKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792461911;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=56TFoPsC+vIT97tVs05l7Gvn4lxIguQ6q9+6FgEk53M=;
	b=DuTAt6bqXHVMOwDmBM1/srfpwzKCoonfq8Wl+tYJSES4q82hHhdQBZkYtmPmQSVDvYlR
	 s7TbgNRVS6QBdpi73aLohDWlesuEFwYAXYEQ1aR2QaqzzHJM7v6xrQT2rkGCP/XT7ZwW0
	 DerssFDZtWMNBBiQbZHNA0aAQ8nupUb8wng4MPN+AKv5T65ZdD/Uje7zF9nhFaWd/9Ct8
	 U1Q2hYAyQ+ffBVDXjawA81SwA19N2EdL7HMzjESFewzgwpylIeAPc2CLQujIdF1FJ5nFi
	 K1zdVnifY9ouMxqMYDEyvgBgX76nUtfeG4+mxjK/7q2aixX+zwjwmG0ZYeUvPK+Z0yQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBE351F000C7;
	Tue, 20 Oct 2026 02:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792461911;
	bh=56TFoPsC+vIT97tVs05l7Gvn4lxIguQ6q9+6FgEk53M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h6WQXDeOPGYQRoaamXNtl8jnaKXLJqt4pz25tByHcIj8lbn0F/g70Lll+vY/1iLyF
	 pcLJrtveudknpvpJ/fNijEPZn006R3J2NS2ZFwwGbv29wo3QE0ViWag7heX6NSNZEs
	 +T01szafsrQeZ4kkVYAxyJOaVa1YTEPkvhKU9zKr45spLmfwj7AK6DT9RYw0RY75V4
	 dqTYDu2rv+SjXEd+/oMtoY3lYIdMcM2nPBZy1GFe7t8TDB5O63OUGe9NwDkVyD2i+v
	 IeFxN85OVqi37MIsrBTyzCRDUoRHp1aKKEubbpxFLtxxJOKOPDS18y7jWFtZI42Uu0
	 5Wj5s+BqtJVHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 36001406EA;
	Tue, 20 Oct 2026 02:05:10 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Mon, 19 Oct 2026 23:05:10 -0300
Subject: [PATCH v2 3/3] drm/msm/a5xx: Use the downstream GPU idle timeout
 on A508, A509 and A512
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
Message-Id: <20261019-a5xx-gpu-pm-v2-3-457aafbb28da@gmail.com>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
In-Reply-To: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792461909; l=3585;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=cXuE1dXmmOJbBZYxHq4v0R2d0f35xmFnvdicm6SOghk=;
 b=OHX4vOwcKNj78Lk57JwRYXlkrGIlgp78CZmbPydjAaugZaoJkM9LUE5LSGCk4X2KDYnV5Vq8I
 /AdT8DHFLDUAftLWxF8pm611fjSEGmTQgxBijbrVQl03bu47Cyjg4Vi
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

The A508, A509 and A512 took the 250 ms runtime-PM autosuspend delay
of the A530, raised there because quickly cycling that GPU's power
hung the system. Qualcomm's downstream driver powers these GPUs down
after 80 ms idle, qcom,idle-timeout, on SDM630, SDM636 and SDM660
alike.

Use 80 ms for these three, so the GPU powers down, and releases its
CPU latency request, sooner after its last work.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
The value is downstream's idle timeout for these SoCs:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L71
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L73
SDM636 includes sdm660.dtsi:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm636.dtsi#L13
Downstream reads it at probe, restarts the idle timer when the last
work completes, and slumbers the GPU when it fires, dropping its CPU
latency request:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno.c#L901
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2981
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2467
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2753

Tested on an A508 with the previous patch: 1381 GPU power cycles at
gaps from 50 ms to 3 s without a fault. The A509 and A512 values are
downstream's for SDM636 and SDM660; tested on an A508 only.
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 7b261f045eae..254bae06af39 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -50,11 +50,7 @@ static const struct adreno_info a5xx_gpus[] = {
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
 		},
 		.gmem = (SZ_128K + SZ_8K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
+		.inactive_period = 80,
 		.cpu_latency_us = 424,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,
@@ -68,11 +64,7 @@ static const struct adreno_info a5xx_gpus[] = {
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
 		},
 		.gmem = (SZ_256K + SZ_16K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
+		.inactive_period = 80,
 		.cpu_latency_us = 518,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,
@@ -102,11 +94,7 @@ static const struct adreno_info a5xx_gpus[] = {
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
 		},
 		.gmem = (SZ_256K + SZ_16K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
+		.inactive_period = 80,
 		.cpu_latency_us = 518,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.funcs = &a5xx_gpu_funcs,

-- 
2.56.0


