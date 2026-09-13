Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB33F926F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330396; cv=none; b=dVTLrUfYuL9+rzdR7FS1EA7YrQ/CiuZMXROp9Fd5JXY/B4hn+FiPxlRxyDul+Ydl/sW26M96nVz+pyXtI9FSe0fxtACxNdQBFoyq34QTY1bnIfRl+Hxt1nvGfV6KpwtJmKsHUBoJCKS4d3+bk/W8E/XBgdEzieNqw1LlbrXzRRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330396; c=relaxed/simple;
	bh=XCQ4uLOtQIf9aETISztlhfv1jRCdhtxmDsK4T5/ZHHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfAuf2EojpyFzq11kjluOdX8fFOrlfEtkopSs6kdIx8uSexfQcfgXrerK9HWwy6LV61tA99K4bCamDGUnnIrhr6GrZihoenX9bmZ2iBTu6Mvp46zNQM8fcEsTVa4oSBqjhz7khiZRtBt6DnAoYQIl4d9YPdg4yLl6YTjfr+VmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pinWglbp; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pinWglbp"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so1491805e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330393; x=1789935193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI63pWsfdSJI20sdD0vd+vtSvoq1goZ0P9ovwMMqD68=;
        b=pinWglbpJ2eU9omoeSX5g72GiBMt90rnqvF9zwcNk4JW5w/0JdkgYEKX891iIBvGRz
         KATvBVp0sG70XozDAu8b+3TwgdFP9zHOdXWNNG/wMobOpcDCXSxWhm/pve5/Acx/3zSC
         ceKo4f/NDqtweZTjW72XUQFN8egGkTlpy5spLfhwb1F8PFpzWcwhn85vTKkCOQmU1BTg
         vChVUAcPbHbiiqaHnmc7kP8CDSsHpD7qOHFAZzqxUuTTB6sh/JWU7jZ5mRy2TWfxjxv9
         cG5bGEvRgSF0Uy7uwK1+YKMWKF9zxro3hnT+AGBmsAKdMi87YFRotCQpdIiQNzoubA7t
         u8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330393; x=1789935193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI63pWsfdSJI20sdD0vd+vtSvoq1goZ0P9ovwMMqD68=;
        b=E+RifcG/jnBrZgvpxhhNl9L0ujtr+BXwNags+G5Z8TQMJB3NjKPT0g7cHa8nQSoFuW
         +DFeGy/cO2+Ly1yV2IFPTzugvY87cb8xt8nNPVr0hWZkVkcS02Drlx61Kt4BOCtDGfSr
         +EhysVcyDOjhke0eo6Pwrs8O+VDH/JtJmwfmTMtL+AIUdKWRDoL3Tvf5H6IJ4OOyAr36
         aW4Wf90WRzcFEdEJhr0zhkfWOjnVLuEtS9XEl4reaach/d4/zK5YJsvDguO5sZg4taRx
         ULbCsFvSp/0YgYh6H+S0iptmRZH0VwEH5GXZMGmlL5m2nU2OlE2CyFAcvPORS2Ls4iEK
         /6lw==
X-Forwarded-Encrypted: i=1; AKwUvBzmeiVSOJuMHh5vGtY5nEIQXB45DsyjM9HkYN1kOCoWH688QPsa2bB9QZajvzGaKGjkG6ZTptsGS21rlrE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/cyC/uMSoeDRE6s5hIBzd73BQ/+PADJKmH9YdXw2icsQkIB1j
	dWCVpTWHJXlLUDRxbL+ZDsW0FY/U1MxcAVFteWP0dyYEzznWPn1bSr1J
X-Gm-Gg: AYBFou3sIJ9iRHGCc6+mO1d6FwRiGusros1L2RAX+O+qDBpP4/2ur0of9fZ+9I+6X+j
	sUD9xqB/Ux1943jxRo+PE8NYtz9fot/I2iWl1JbfVzh4FQumKM5/Nr20LQtGpbNw5TwzKbFou2F
	BmvUPpMH81K5musTuLqTe6RNHb8b4hUH54vUwIcYeDOkzwlIyIuJ+cpZVNvEup/KGr5cud5ecx8
	hLaxy1zWmcqxJm1nQX2m69jBnESEjoTbjOlJ55tsqYX+qsJxNQiuYx4E3bOSyavjzBpVsaZiqgu
	sFamWM58g24nZFW/j55Q0jns4NMSelH8HGxVble6lG119YULetyXcxxEzAgbSI+0ECzKeFU2vaq
	ZDWZ5ZDAhI1628zAE4LEm3KOIz9I+YXmxa9KBfmKqMkeXV3u0bqXz4JToWO2RnAmEoeak59tviH
	3lSywczKrwSaP+4doZkemlkYAiLwYqL0Pz3C4EUC6jze8PIUBTBqf072iVAVHsu/KUgDoPS3a5p
	A6OBc5zVX2MZB4Q/9hg/gXrEx+Gpbd6oBhCvTVvC0IU
X-Received: by 2002:a05:6512:114b:b0:5b4:ac27:6bb8 with SMTP id 2adb3069b0e04-5b8a0299d52mr3093358e87.12.1789330392669;
        Sun, 13 Sep 2026 13:13:12 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi. [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:12 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Risto Pajula <or.pajula@gmail.com>
Subject: [PATCH 1/2] drm/nouveau/fifo/gk104: fix legacy video engine context mappings
Date: Sun, 13 Sep 2026 23:12:24 +0300
Message-ID: <20260913201225.5975-2-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
made gk104_ectx_ctor() map engine contexts privileged by default.

On GK107, mapping the legacy MSVLD, MSPDEC and MSPPP video engine
contexts privileged causes FIFO PRIV_VIOLATION faults and kills the
channel during VDPAU decoding.

These engines require non-privileged engine context mappings. Keep
privileged mappings for the other engines, but clear the privileged
flag for the legacy video engines.

Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
Assisted-by: LLM
Signed-off-by: Risto Pajula <or.pajula@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 5655eda52..bbeb33cd9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -180,6 +180,20 @@ gk104_ectx_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx)
 	struct gf100_vmm_map_v0 args = { .priv = 1 };
 	int ret;
 
+	/*
+	 * Legacy video engines access their engine contexts through
+	 * non-privileged MMU requests.
+	 */
+	switch (engn->engine->subdev.type) {
+	case NVKM_ENGINE_MSPDEC:
+	case NVKM_ENGINE_MSPPP:
+	case NVKM_ENGINE_MSVLD:
+		args.priv = 0;
+		break;
+	default:
+		break;
+	}
+
 	ret = nvkm_vmm_get(vctx->vmm, 12, vctx->inst->size, &vctx->vma);
 	if (ret)
 		return ret;
-- 
2.47.3

