Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025430ACE3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813991; cv=none; b=Ab9mHsZ6di4wep1YQTvIAlaxwE+JzyYHmStkbSId1e2E0WLXV0tkwMP0s3ASmuDa0GBy+kzqQVsCQboY3pFKvRwElbePGWxhVZNUg3eJBsr1US9ZaWowLA9hcz2iHDLxwC3m6hPtecsWqprG6HC61j1oPdXlFKe1nXrwhCjzPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813991; c=relaxed/simple;
	bh=GSSfyFGNNq4pQYKo+hQzH2CnwwYSzKuqLldYn6rPMUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XHODcvcmXF4rKEgnEuiCdYXIdjEBiwgH4HJUdyMwaAw4NTOmcV4nz+kDit6/GVSUdbHoGBnmCYtdbt2lRQ5iLJfm9Q6Hj5NXP9tqL53GWRyJEDpvHy6sae1rxgj/3g8TG3ojSiVDjx+zqj1DaYYoELACJHvDNbA63eZ75c5g+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+pA/gMy; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+pA/gMy"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52cd38ddcdfso44840741cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813989; x=1789418789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VER40sFOr0PvBhXNUCuY5FdhQBtPHE4tZxDhsZnhadY=;
        b=E+pA/gMyCI9+i0kTWPX4HbSfd2mUzdmYyl3fChVG+9MIzNmRFlMEjkr1wU1jr+QRkJ
         acaxtznH4R9qWzygvBvyc0r8m1y6Gfm+9uRvZXRJSCVasVBsQFOmBnaSjHeO/xtY0djK
         OJjXjBqEIMSINmjIgVFw1A4JOZQ8C/mDKNkO0tkSchbbY0VJCHYilXdHTq76WsVMZyV1
         aY8PXs7dFt3FzCftIvDfb6Xen1UQ+pVerrxkjmCgZoK4cr9J7De3TS8Q4/sjqVE0WZSm
         O5jAYJbF4Zx8UQJ+WtpRx3jGiiKV00iH39z5MMCr6p7NQXnIn0LOWVYpQX3wXMAzMjFd
         aFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813989; x=1789418789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VER40sFOr0PvBhXNUCuY5FdhQBtPHE4tZxDhsZnhadY=;
        b=e8AW6TKohb9YKb6Rc4WOAm4vgHaa+70hZE3K65I3s6Fl1JZ0RsIFYCARYPKMEYvpkW
         iZTsGpuYgzT7GXdGlcZkpNpsGtN1tlwL0AxzQdpKuQZpMSYXqaL5PQWI8YlPbMXwMSGx
         oBGurs5rVIdvw85V+cfT7j8s/7z6RwyAKflHB/7ObUnXG+dmxFyiPTymYlpYkiUolv/G
         Op4Rm4Lhgx2TPS/qpk7vjCDE+QxR3OBzTB7Qn4Fyvb/Ot/eUnKaskm1oVUHxf4iEesxR
         4mqTIuomRha5wwKU4i6Qt7JD/N21LdeZ71JOTG3kcy5HLU8+u+bAlFSc60XExHO/Lv8l
         PS7A==
X-Forwarded-Encrypted: i=1; AKwUvBx1plYYF5BmjsBihqhJTU0jMf3U7B5Xsmy76czPJHmHCDYRpQ+m2vcbTH2bjAMrCxqq5UwqBQ5xlDDkvYw=@vger.kernel.org
X-Gm-Message-State: AFuF++md1c4oIj+Elc4IDvGjk1W4Wizud/hseh/M31zCq9LFyNN/kDY8
	v4QaB369i0Po184p5N6g76FlMkJUCjqcXbocXGMVcf7LlD5tBVAiJoAp
X-Gm-Gg: AYBFou1hzmoLUg0RQAxHyR3CMckxsXwBEl2u0GF3DRuwJdJM1GGpLbi80QKxDE9/sOJ
	ehvxnHbs3wse1YRFTG9cWXz9pJlEGFOsDzSNZLs4Yynkn5ClQP5N86wg6MwOeuiQtkXDv/8SSAp
	4yrh0TfxwDq3/GwHl1E98EjA9s/Tt+Sma59wy/i829YO2W1GlvRZrXIlQDP5B3w6kpCiJuBUvgc
	/daTWsuOcK8a72AMLI+n6YmjPeSiZ+fzZOEJcoPMUy5drT4rBkmcGOwsYpp0oA+NAr57HY5nSGq
	hSFn/ihn7x+E2rEk5tLlsDeZwYqVAMw4nP5ZMVjTdfwMU6dRNA5PMup2t5zYYP71tvql2Hf0MVs
	PAK2HSNRu5rktkELar3EBMCiAvJkudx/OJ1t9xAaWeGhIGXWlVXsFterdklgsigI0uZGgHpEmIt
	MS9WVB0aIFO+yGvW8IM+jfUhCpHzxIBrZ3Hi/3FYYCd3N2pD4w
X-Received: by 2002:ac8:594c:0:b0:52f:b1b6:a4aa with SMTP id d75a77b69052e-530547fb02fmr294840361cf.4.1788813988866;
        Mon, 07 Sep 2026 13:46:28 -0700 (PDT)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054180b0asm95479811cf.19.2026.09.07.13.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:46:28 -0700 (PDT)
From: Changyul Lee <lcy8047@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/etnaviv: erase context from active_contexts on open failure
Date: Mon,  7 Sep 2026 16:46:19 -0400
Message-ID: <20260907204619.645774-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

etnaviv_open() allocates an ID in priv->active_contexts for the new
struct etnaviv_file_private. When etnaviv_iommu_context_init() fails,
the error path frees ctx but does not remove the entry from the
XArray, so the entry keeps a dangling pointer.

Erase the entry before freeing the context on that path.

Fixes: d306788b6e1b ("drm/etnaviv: allocate unique ID per drm_file")

Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 08aca9035fc1..ceb8c00d66c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -79,7 +79,7 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 					      priv->cmdbuf_suballoc);
 	if (!ctx->mmu) {
 		ret = -ENOMEM;
-		goto out_free;
+		goto out_free_id;
 	}
 
 	for (i = 0; i < ETNA_MAX_PIPES; i++) {
@@ -98,6 +98,8 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 
 	return 0;
 
+out_free_id:
+	xa_erase(&priv->active_contexts, ctx->id);
 out_free:
 	kfree(ctx);
 	return ret;
-- 
2.43.0

