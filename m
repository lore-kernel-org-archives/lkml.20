Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669697;
	b=wtOZEAK8lqOL37nPzsuHc8bYEgoRo2seH0jTs/A6bcBjGdL42G3+XZ9beCcUFiqElwoE
	 aoV3afL7LVyCB0YM3G77EprS5SlbXrhczaCibXhS2Bp970ii+TMSzl4tnQLy6qIPcEve+
	 HBev2cTJF4wX+LtmXvgXcSJoj26L8SbsytWN/4OFWvx0uEL1kfuBvRh6rVRIVOuQjCN+u
	 ij1SYd0oZreIwCM8RtUlnzqJEO6QpKPr/INO3d8rjVuhGQ39BqTXh3KessW9IcA2yWLEV
	 QKIosyK6hsVp14yl+Te0Vq0Lauf3bSOkeFZyAk2a8e2AW3H3ypXZTi/iZT9gzfa+feA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
	b=1RjSQsLMtEO/WUeVghL9PPFNQhAy3+vLPUsLL6Eppa1+2all/48mKzCNiiWgvW9+yzIu
	 nNio/KE6/RDAot4qCxG5pA5eImf9qntoPv1WO8reU7pcNj44SeJ5rHr4o7bOd235+xXiy
	 K6fWza3txf8irDClp7jgXAZ6N+L5ueyLJV3o9/sR5Td/A8RE8nfGsRyvsTyhSK9nJ5uTv
	 3ljkwzDVdtTH4+/V/R85Z9z2UHows2jYrYIohkq7b1Olz8JfweiQ9QF8ja1NdW5TmrxYB
	 Pis3zon85SJzDkyOlI2fuRSm9oGH9f3SBQdFUBNgN8PsIijmebS8TJBw7wd/PDZoO3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ESbnkt5d;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509C606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8509C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ESbnkt5d
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eafa528803so216187e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669696; x=1793274496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
        b=ESbnkt5dekiRE8QS7OEXU6PvZUYK8n2gep4QRwLR5Nw1A2wPA/1ENpscwnIe0LXukC
         0/JMZG2RMGJRrus9iVFiIDsq0DNtxn9JJJusDyBTWT1P75FFk+xpC1d+8fNCalx0n9ku
         fKTJtrGdmYVuV020mORyy0zvKY5ww76ovUsaHAFxYm9n2oA5dUqVQeX2OWny2ngjccSe
         vo6mLQsoK8hymg0H573VjaB5+gq8L9cMgPYRom+K6JgDAFB0GqSBqBPHAS3SSTyJjxyV
         4zVQbEJRUiAmdmz+FRZ/Wk73zy+1xKL9nEMeY5oFlMiogvvpxKZkTWy0RbSl9w6eTvAg
         qg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669696; x=1793274496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
        b=IYcF0qFXADRIx9d8u8ZAePBUSDkT3S1426pi8sb1A8Lotl3jr/eXDjZT8MRyWKTQvo
         x6vjyilbZdQ02l5SnZDU+pm+6veEMJHLoQ8QtCWAwVkgR6VfRpNvVlrEXppZYlIVZ9X/
         XOtQUdTamfrCCdWMRQjE29Jqs/CAv6dCegVgvzib2qJutEKEUiYC3wes1bRODYK0Kz04
         htsNbT3DYgu4sybYsef3hK6/Tqdgai/5WFogzuLWEmwXn3vje0zdOgTkISYaAHpqJBQc
         bZOD0iYuxc4xELG63DZHYgYgJbXOO0rhNm4L8R7Yk2RzLcUAIeMTTzGwS+077pJA7lFp
         wSgw==
X-Forwarded-Encrypted: i=1; AKwUvBwycmaYIPx1g3tTwCmXBFrbSFHm1LS5DiA66Mh1AQ2sEEkWbpmXXWvOooZdyUPHCdUx9Wd/zDI+RTqbOL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5DfTTsUjE0S1BDqnr+tuGFlA+CUDawss09IrCs4WpKVPntVLL
	wFhSOCvennR119inTNsemv5pmi1mVqtl9gQ4ISaOR1PAltndfzYDx72w
X-Gm-Gg: AYBFou1B72MHXJYp5iFgbLLb3/FsJxr0IKmJIEOiNIy3V3nop2gGr1Ahlskmm943NsI
	trlv2p9lPRpxFXcZrV66LIpiY8zt8VXe2xaAlGwdJx/pXLjQavWaEQFwOWSLr7lyZcVAgCHYMeu
	XdwnOH6Xnj9JuUnwBsyomSxkQ2rAFwaGKn95BhK1/YQa1JyM8XqpDj0wQSWCy5KcCE4b0Mk1OcU
	50PkvA9fjcwpcoUsnPldW5Ad+ILfPW4TYmTrgU5YBrrI9bNRdTObB2773XjfyibkTTZljVb1PS6
	q5iy/6ygqa1ib3Z4pX3XUpVDbf+DdEct7mc98puPyoVNwTcH6Wczu7b6wvz4C9hyHlZfxE7zpa3
	8Ae9yGsHBRZI17uMa0+1c8hv22yTIXZLrJNYf/6gajL9JeBMpFmyhaOzOj4k9aq2TxZ/ZjFqbvq
	QqUzd3hPQ1N7d87BDtqaveqnIEBJ6YJG/LRqUKgBrHv0dV0qw3m1OLxy1g6R/CrOQ0jXiGgK0qy
	I2qeVOFgJo3rz7QwaHBi+k05s3Lx6LPFXDs3HaYX+53nx4O13IUXhm9Iw8cUzdvbm3FIHQ=
X-Received: by 2002:a05:6102:4498:b0:7cc:2712:cafb with SMTP id ada2fe7eead31-7cc926ac31fmr1668407137.15.1792669696418;
        Thu, 22 Oct 2026 04:48:16 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.104])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d117c005sm6177793241.9.2026.10.22.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:48:16 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
Date: Thu, 22 Oct 2026 08:47:46 -0300
Message-ID: <20261022114754.865669-2-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022114754.865669-1-mptagliari@gmail.com>
References: <20261022114754.865669-1-mptagliari@gmail.com>
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

radeon_vce_fence_emit() ends every VCE fence with VCE_CMD_TRAP, which
raises the VCE trap interrupt (IH src_id 167).  cik_irq_process()
handles it by calling radeon_fence_process() for the matching VCE ring,
but si_irq_process() and evergreen_irq_process(), which serve the other
ASICs with VCE1 (SI and Trinity/Richland), have no case for it.

Add the same handling.  The trap interrupt is not enabled on these
ASICs yet, so this does not change behaviour on its own; the next patch
enables it.

The SI part was tested together with the next patch.  The Trinity part
mirrors the CIK and SI code and has not been tested on Trinity/Richland
hardware.

Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
Cc: stable@vger.kernel.org
Signed-off-by: Matheus Tagliari <mptagliari@gmail.com>
---
 drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
 drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 3cbc6eedb..eb94916c8 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -4847,6 +4847,20 @@ int evergreen_irq_process(struct radeon_device *rdev)
 			drm_dbg(ddev, "IH: UVD int: 0x%08x\n", src_data);
 			radeon_fence_process(rdev, R600_RING_TYPE_UVD_INDEX);
 			break;
+		case 167: /* VCE */
+			drm_dbg(ddev, "IH: VCE int: 0x%08x\n", src_data);
+			switch (src_data) {
+			case 0:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE1_INDEX);
+				break;
+			case 1:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE2_INDEX);
+				break;
+			default:
+				drm_err(ddev, "Unhandled interrupt: %d %d\n", src_id, src_data);
+				break;
+			}
+			break;
 		case 146:
 		case 147:
 			addr = RREG32(VM_CONTEXT1_PROTECTION_FAULT_ADDR);
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 4681ff286..af3c4026d 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -6347,6 +6347,20 @@ int si_irq_process(struct radeon_device *rdev)
 			DRM_DEBUG("IH: UVD int: 0x%08x\n", src_data);
 			radeon_fence_process(rdev, R600_RING_TYPE_UVD_INDEX);
 			break;
+		case 167: /* VCE */
+			DRM_DEBUG("IH: VCE int: 0x%08x\n", src_data);
+			switch (src_data) {
+			case 0:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE1_INDEX);
+				break;
+			case 1:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE2_INDEX);
+				break;
+			default:
+				DRM_ERROR("Unhandled interrupt: %d %d\n", src_id, src_data);
+				break;
+			}
+			break;
 		case 146:
 		case 147:
 			addr = RREG32(VM_CONTEXT1_PROTECTION_FAULT_ADDR);
-- 
2.47.3

