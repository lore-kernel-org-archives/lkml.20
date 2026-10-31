Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443495;
	b=Q5hdFeJKUSY+MxCR6Vy9pY7vboNz3IusUvK9kqdrpMLYvEaRb6Juhqzrn2vWa5dx5LH7
	 FM2ZnGlgiaABoNGD6JZYgBZtqmwN9L2c2eABdLhTxK1Vh7MXZaMlYZZfTMVW4net+wV7Q
	 frZhUi8LXjdelzkgyRTTmVPXOYnCI/QN9IdGU7uW0js10MRAlImMTkncxZkbgbipOkBCS
	 wB+B5Zaz4ai8/9Wq7FkS9APh9Hk3uJhrkrpTXCFKJMOIX/p7kSrwlcRjJ/6jrZthDfH18
	 i766FHySkBsaSudM0ui3YbxhiOFdcr6NajnzRsk5CBXR2lGmYVhbCOPUMtgaG/CQfTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
	b=lKG5Oaa/YJIE5tqg8M3f1z8VcBdjmR/cSBekM8XvzeZekQL1mUoWPcoZhMh65Fibt7N3
	 lZy+gspuTwHhBpscQBSdnibEaNfzgowj3LlBLJDRLa5Sg6Q/dcjEIigvo7L+ciJwrKFf7
	 yRLf5olTMBG7CDukxTIOAggtjLzBLn0P3KGQ1zXP84ndDQ9FKZa+eFdvKah4f/nuHYCpP
	 parkj1HXvJO2biBmwknpOLdvLuLMqERTlNcFmftNJ3dJ+O92APeoIQoI9CJDUV8JEXzox
	 kqVIfR4bef15dNIGZ7SFWO1mAu7dxNfE4nEtUohz5pIeQzIluDTvIyUvhtDWRXWe0EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E2606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E08E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d885929so1232957f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793443493; x=1794048293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=UcqEXsLFGpK8HluJzwZWCLWSIIOtM1AqH30p/xVJh+ZCGnhCRxz2BiAmobnXB5MK1b
         C8NxZii/6Ye9x8YoayP6CtCNMiFirmeJ2uu6lrMtSw/FM1dON+/H+7suN35Hke+NMkx6
         8xP3u+LG/e4fDGo/QRVS9cyPaobpsrM+7CC5buc7VV1JrqWkKH4qelgddG9lRpsdyoFq
         so16ADc2UqjedDxp2XyPoZ8UoTmBY3xnh+VZlgfQiW/cn8eWNOnNTpqrUBkxsRBsS4df
         7Yqm4R9ItofReQI2nzy4+116xn5Vc78Ti66dF3eFr0JCssIbdLWtRluFZdovh/x8BEqL
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793443493; x=1794048293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=UDZRYAVzSIcpuZEBNtbCC2+cLg2SZ8BpNcsxbWHEF/jASGNz3VdJJ2G8/Um0dBCN+D
         YKQGtq6xJv/kxU63y9S8NFb4RswHuQshDOSL8PU4WXN91TrxS8oC3LXrQPTBWflgeqVd
         NnBJbnB3eAFDxfZvIq57xG6alZLNDovJP7XQpVo/IZessN9dkclGoVtb6epS+24WyBCZ
         RmsaFzFe0ipiO6T0jvXQ1hmg+Ku6Jm5tuPkJh7YrmoHfV55n7+ErSjM3y7zilXsb2z2P
         yOssIijuJOusGbJX308zSCxEzYb863sScdjdp3Hk3GfyE/4Q9qfyXA1pwMzf6ZREebwP
         L8cw==
X-Forwarded-Encrypted: i=1; AKwUvBzatRhbNVzLnAG8Z2cyJWAbaxxCWHfFKaSIfkaNg/tUD3EkRBn3fJ0UiMA2DDEHstMjV+ypFTCXlcEI0nM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2OYNg18loYOb5YQvd2jWkXxp7WFwJIFtx2VxL6/NYfUnl1q63
	WDV2huk9IN/do0MqZ05v5gOjbLeWe8PhNqWtvzXvpboZIx/3N/Dk5ySUkE2Ai09A
X-Gm-Gg: AYBFou16XrUMkpG1lsuJaH3GXzXurFnTksTSrP62KTg/EGyLQHUnKubYAxRPGzePcIF
	l0RP58L7jlUw9o1JF4f59Jr4Dwp9/5h6HAx7zmFdSMnu1dWhEKh7Wb1Hl3G9/T9vReQK0o+ovLy
	2XLIGBXqzpz5W6hS0lyXtJtgRSRF1DSAcfrBJ+aeKNPW6reGoBfdlGYYBUGPvoIl+JiP8GlCBP2
	OGzba1ADuoScNNvL1GcCgVJy9dhKiB7Bhd1te/L2zIDuAKcpH7iPYrrIESLqz4FqaTPLHkk0350
	2NQNY1q8CUr4fBOnLdRrsUhsChCqwlEYkpgMfb2/rOFrjE2SDTUTXrOq9gl+9zol4bDh7vZpeL7
	MW0NB8pxiLY7C32vDGD+CpwNRok19YB8GftidOAr44YO6WZk1X3oHAsR3pMl7tb1IfjD9rk1IMq
	Y2YzTexVT38/OyD6lvh9nVUSfhBRFWmL2RkLHvk2ZrVG14vXJymPIUSQ3PNDos66XoB75sRtMe2
	XSGFOOyD7jDF51l6pURG2Qxp/YS5s1stJvLR7xRbcMCpjgkJvzffQaw8AW/KcgJwjCQAz+SqX/4
	9WjVR0HD+Ib5pBOw376quyVXrxV1IbaAKZrEbqw9tmnGnOSnBiwNJ6TdRqX4kpxW2FIMvFtodMn
	Lko3fMOkZjv8kESuAT40KURAPxMYLWc5RRDkbuRlGnfve33awdQ6McC40n82+L9NhI9oyRU0TZi
	Yxxnjqt49GShnQBZXYVTzPMfnsIHNPAjE=
X-Received: by 2002:a5d:64a7:0:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-48e6e50191cmr8399741f8f.42.1793443493010;
        Sat, 31 Oct 2026 03:44:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm8093899f8f.10.2026.10.31.03.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 03:44:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/tegra: Fix dma-buf reference on import errors
Date: Sat, 31 Oct 2026 11:44:39 +0100
Message-Id: <20261031104439.91346-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_bo_import() takes its own dma-buf reference only on success, but if
mapping fails, its detach error path still calls dma_buf_put(). That drops
the reference held by the PRIME caller, which then puts it again, and can
release the dma-buf file while its descriptor is still installed:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)

Remove the unmatched put.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: Clean up the commit message (Mikko). No code change.
v1: https://lore.kernel.org/r/20261026055842.96484-1-kmehltretter@gmail.com/

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a local
change that rejects zero-byte IOMMU mappings to force the error path. Without
this patch the forced failure produced the warning above. With it, 100
consecutive failures returned -EINVAL, kept the original dma-buf fd and left
no dma-buf objects.

 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af73..ed35a34 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -502,7 +502,6 @@ detach:
 		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
-	dma_buf_put(buf);
 free:
 	drm_gem_object_release(&bo->gem);
 	kfree(bo);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.39.5 (Apple Git-154)

