Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227537;
	b=Sb8nHAfj1cKRjSXcvtYSXv9CMeqV8tSL1Xsu8W2eSuL4ua0gqiR95TGD3bAKWogVPx+E
	 KoUdDrgqpEHl90EFC+zu9kAY4b/APxY4XaiOah5wt9m2P67y9QGiREwqs0PtaLB+WOP1f
	 KUSXNz0E30hTzEqqBTL98oEL2Cog4o0D75kqwALNpQ4fgty3vwS9dN29Sg3OfQ1lGhpUg
	 yzkDfsBYLW3wzLNUf+cPclolFta8x8E3FivMbWBvFYDFB7kYs7t2527MRJdshDmRLDnY6
	 X+zBmGPOFBGf1Yy8MOCYua+ZWRUDwo5jI/pSUlN1MuEZuZ+ckvm17eOCc+ZHRVwc1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227537;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eerlHc+2nw9LU1blteBgbDf72O/+xt2VeIxgqcPfxtY=;
	b=vbVm1Z57pZTdJ40eJfd0QlkZG6NONjuE+TRR/QjSdHB+UZYiAqhDgT3iwCna5pZDyG+q
	 FFwlHbDx0bxsU9+HTx8aIQTjMSAbcMuhWfGgneNys5HO3Y5VXLUAB2532AYEk33E7FJWm
	 i1VQMG/19Iy3AT8NoI15dzHmmY5aZAcgM8O/rndXpWDdOavKuj/CCnjYDXBw9N4T+SDLO
	 S0YWOugIDWreR76p85kC5Ph46Zqb+G21cfj1ViEFRG4FuPV3ffdSqnUE4APl/vqVyOhHs
	 y4qssk7PlR6BYvXre18QD6Qq58dign2sSxsbo6Vmt1cO/DvhVcnWzUYlWa+vcwURhJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5MBBv6Y5;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12058606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12058606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5MBBv6Y5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794227533; x=1794486733;
	bh=eerlHc+2nw9LU1blteBgbDf72O/+xt2VeIxgqcPfxtY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=5MBBv6Y5HpHr3wguQtHSBZaHetMylu67S5tbrJtq9xyxFfFjNu8/uBGd1+RNzDsYl
	 MjN1jdQRTG8BMp3We6zvMpRGVYYq1FA5lmyE9gEiKOFPf4ILHQm23xhGIl3wz26Ej9
	 x8QTTpJYMBNWAqOJchCYkaMyyD9R4MP9lsDuhSGIP3hEcj5Qh7Eb3xqmceKyfXOMm7
	 aKGkXW7/NW072roRpMqRcoAB/BUx1QnMX8NguugA3OaP8qazwGbBR0wxRhnROUm0nf
	 JDclYc0VCqAAqKNTz5bDFh7+F0Ccf8o6edAX3zjuWP1pByPCSxbxmKf2yhzZ2JQMqe
	 o55mTh2+LBgMg==
X-Pm-Submission-Id: 4jNTgV4YVsz2ScQG
From: Michael McAllister <me@michaelmcallister.org>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH] drm/msm/dsi: avoid pinning the command buffer on every transfer
Date: Mon, 09 Nov 2026 12:32:05 +0000
Message-ID: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The command buffer is already pinned by msm_gem_kernel_new() when it is
allocated. Calling msm_gem_get_and_pin_iova() to fetch its DMA address
adds another pin for each transfer, while teardown only drops the
allocation's lifetime pin. This leaves outstanding pins on the buffer.

Use msm_gem_get_iova() to retrieve the address without taking another
pin. The allocation's existing pin keeps the mapping valid until
msm_gem_kernel_put() releases the buffer.

Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi,

I ran into this while testing display teardown on the Moto G10. The DSI
command buffer is already pinned for its lifetime, so this avoids taking
another pin every time we fetch its DMA address.

I tested this as part of the G10 display fixes on 7.2.9, including display
power cycling, suspend/resume and teardown with the compositor stopped.

Thanks,
Michael

 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d92659d80f..64fc54dff4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1428,7 +1428,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *dma_base)
 	if (!dma_base)
 		return -EINVAL;
 
-	return msm_gem_get_and_pin_iova(msm_host->tx_gem_obj,
+	/* The command buffer stays pinned from allocation until teardown. */
+	return msm_gem_get_iova(msm_host->tx_gem_obj,
 				priv->kms->vm, dma_base);
 }
 

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.39.5

