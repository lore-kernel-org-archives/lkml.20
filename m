Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E753F488223
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809458; cv=none; b=UXNug+OKLaoTI+Feuwfffp9/3g6ecYX3jztRmy7bwX8DXQPco6642H3wqYcvQCHqz8T9mRxkclfDRT4+DxA8VfzZBzdEwuqOckyFq+fSXB17nVKSyOt56kjxdu6X+g1Gws/6yZ62PWanktp/GlMkG4e0pmY0uMG49FL9byppWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809458; c=relaxed/simple;
	bh=9D/BNSC23S/Qmnz/rEyuzPeALBLDnVdnrOUvYw7hLMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kv1W5uVJ1obbaHt6pyLDxZCQzE5jdi8TRJy/mMwy9H8y6m5fq4j1lKv11+tfO43sx5PK/IguRp1yKaZaUpS+ZotAqPh3QttXj9JqX6hI6v5DOO9KlPjQZaynZLdJkGqiieyKag8XxBo70S8dThOWRImQFXaVX8yjoH/me5d5tJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZkoS1sL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZkoS1sL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so837375a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791809456; x=1792414256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86WcGAeEklYqbgh3KKZHUzYuJQ+5rJGp9flS10qudDU=;
        b=AZkoS1sLhh/T6luH5ueTjj3hvoAbi6RV+N8l/P3AEhy7zPD5AqBezfce1cHK2/QaIL
         YlIIlw3B6O+MBOM0QHOhtA7L3PxXlKgH6SM14fri42+y+570MxK6VXGCfuIqhX+QOK42
         wuwPKPEO66ez3WyeE/XdLxhmFIC5kRv/EhV9swyV0c2aRiqJCBdAIfEhxYPDjSVrirZ6
         ANTmxywg0LB2h6vfjNIZt9yHYseSO2b4sryrD0sxDBvAPkNMkmT774toNkU+8GRftT7Y
         ktlkblN2PMK6IQtQrdcHYUZDMO01tmMOUG292Vd5uaKS/4tY9QT1GlhQVx4OY9uPIMGR
         hVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809456; x=1792414256;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=86WcGAeEklYqbgh3KKZHUzYuJQ+5rJGp9flS10qudDU=;
        b=I5xLFWz9QXxW5Es2fx6YDsmhdgRJzD0Kq14sxYAM8EZQdwnWQskAQgp5KdjrtJ18rD
         5fRgQ/l9A9zvYJogBdULv/pTCpaE/d/0r/1wZ9/4tgmx6U2JtP3qToadXEl97e5FXlXO
         G6BqrAwDw1CdhL51BvynSjbRzQH+ndsRaf5v/UiTdaUkZ8+XVKrQei8UxGNU6iSs1vHD
         mrivU6OgGBx+1G4CyGSEQBtG6FmA+zl7TAVVxzfzGwTNMzMLMajd1mdHB6VIpPCuLcVP
         WuqRTrVRSPXXpgJNDm3R2RMvp1jRXnkx9nuCITH6YQc3mM0KdIoyHfFzq28vun7ijYH6
         p4SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxazmIh+mI+nZsaA8x7Re8/4Nru6QioXymZpfEm3YdWd/ba7kiBIYGIWs/Q24AV1pDjVXZZl39eNYpp7KM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPUrH+mZ2lIcErRBIuDOyW91y0zlJFf2KcYmq9aaQ/LEf1pbqO
	+RNBVm0I2yj8WE/sepEvspd3FgSdgtJpNoeDqb5WKYljni90du2VcsFF
X-Gm-Gg: AYBFou29qvf6gAElCcpJCBpDuwzfhYfr71HOKAgde6F+BtaJQ12vAqRDLd927J7ujMD
	iEAN6QkELVkMvLvmHDotpiOpBhNMpGbG8vL9TrWVYsVXsX1pAkSF/OUuDUdVLP6c4TxGX+Ke1de
	wODgLbT82uHqrSC3dFYLMPBpAkFxHbowP5sAuSrGU9/K/PR/aFqAE0a2gYPXdh1CjRXpnloxraZ
	QsTom+3n0mH6YFKBv6MY+ufgRig4r8hLMt0b4Mh3ZNl34DjfSZXPF/ivsZNq2pjAm05lNWpOvWv
	8HmBT1pLwF1OAcxewt33lnWoGoStfbXUSLlX8+EI5Unk5KyTENIMywVHfCj54doU+iCVK5PhDba
	FdChoHucDt8Dqc9B2fX9+YmAv2N/GsVpFGCLFBcgn/x/dfLy9XVSDTaVDkHr8DvVo1bOEZuID66
	OiuSqk1O6UNWhMiyJL4DGEgqpj0UyP1pyiu1nAmcoLFssfU22lbixW+ENXUmok3sPDz6NFv7/A2
	dKOeT5dUJ2ZCEc=
X-Received: by 2002:a17:90b:1dc1:b0:3a0:eeda:39f3 with SMTP id 98e67ed59e1d1-3ab3aafac4fmr6499105a91.24.1791809456102;
        Mon, 12 Oct 2026 05:50:56 -0700 (PDT)
Received: from b4send_258f78389c344e02.eml ([23.155.4.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3962f771sm7634732a91.2.2026.10.12.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:50:55 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Mon, 12 Oct 2026 20:50:47 +0800
Subject: [PATCH v2] drm/nouveau/sw: prevent NULL deref of disp in vblank
 methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nouveau-nvkm-absent-subdev-null-deref-v2-1-8b15a3f1c371@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKbXzGoC/5WOSw6CMBRFt0Le2GdKwy+O3Idh0M9DqtCaljYaw
 t4tuAKH5+b+VgjkDQW4FCt4SiYYZzPwUwFqFPZOaHRm4Iw3rCs5WhcTiYg2PWcUMpBdMESpKaG
 N04SaPA041FzLWvGqYh3krlcWzfvYufU/zqEHqWUv3x2jCYvzn+NIKnffv5upRIYtsbodGkFSs
 Ot9FmY6KzdDv23bF5qNAU/sAAAA
X-Change-ID: 20260812-nouveau-nvkm-absent-subdev-null-deref-f52db5c24408
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 Zhenhao Wan <whi4ed0g@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791809447; l=3997;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=9D/BNSC23S/Qmnz/rEyuzPeALBLDnVdnrOUvYw7hLMw=;
 b=EjYVQoBJ6xfZQoHh8JqdMA3zViHlPBACAXRZvdK3Aszn9sbBVAZ7oNcqK6IEHDatxfkwImc/7
 QvOFnSStI5VCtBFFJdX0SXubQOKx+LQwBQlTOYP7bRY8+bvvPJjMtMg
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=

The NV50 and GF100 software-class vblank methods nv50_sw_chan_mthd()
and gf100_sw_chan_mthd() evaluate "data < device->disp->vblank.index_nr"
to validate the requested vblank head before allowing its notifier.

On a headless card the display subdevice is absent: nvkm_subdev_disable()
(strap-driven from devinit) and the -ENODEV path of the NVKM_LAYOUT_ONCE
device constructor both leave device->disp == NULL while the device
continues to probe and still registers a render node (DRIVER_RENDER). An
unprivileged client holding a /dev/dri/renderD* fd can then create a
software channel and push method 0x0408 (NV50) / 0x040c (GF100), which
dereferences the NULL device->disp and oopses the kernel.

The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
already tolerate an absent display ("for (i = 0; disp && ...)"), so no
vblank notifier is ever registered on such a card and the method handlers
are the only path that assumes disp is present. Guard the dereference
with the same disp NULL test the constructors already use.

Fixes: 79ca27706a03 ("drm/nouveau/core: rework event interface")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: LLM
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
Changes in v2:
- Add the Fixes: tag Lyude asked for. 79ca27706a03 replaced the NULL-safe
  per-channel vblank.nr_event bound (0 when there is no display) with a
  direct disp->vblank.index_nr dereference.
- Drop Cc: stable and spell Assisted-by: as LLM, matching how Lyude
  applied patch 2/2.
- Pick up Lyude's Reviewed-by.
- Patch 2/2 of v1 ("drm/nouveau: prevent NULL deref of gr in
  GETPARAM_GRAPH_UNITS") is unchanged and already applied to
  drm-misc-next as f569473c1393, so it is not resent.
- Link to v1: https://patch.msgid.link/20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com

To: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
index 0171cdf6f639..4cf8cd120c76 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
@@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int subc, u32 mthd, u32 data)
 		chan->vblank.value = data;
 		return true;
 	case 0x040c:
-		if (data < device->disp->vblank.index_nr) {
+		if (device->disp && data < device->disp->vblank.index_nr) {
 			nvkm_event_ntfy_allow(&chan->vblank.notify[data]);
 			return true;
 		}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
index 0cfb1eaae6de..b202e11238a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
@@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int subc, u32 mthd, u32 data)
 	case 0x0400: chan->vblank.offset = data; return true;
 	case 0x0404: chan->vblank.value  = data; return true;
 	case 0x0408:
-		if (data < device->disp->vblank.index_nr) {
+		if (device->disp && data < device->disp->vblank.index_nr) {
 			nvkm_event_ntfy_allow(&chan->vblank.notify[data]);
 			return true;
 		}

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-nouveau-nvkm-absent-subdev-null-deref-f52db5c24408

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

