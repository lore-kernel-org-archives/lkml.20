Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269111;
	b=Ar4UwkEXCRQJ2gJVsMc3d5JVyuEv1uViIV64gSz5r0z8yua+SAyN2EDzuZf8fPAuEtIC
	 xBdedTeNWRiFgKlDYqGEfPd+OUiNS7y+aBbuUC9W+90n9Rh+KlWKE1SamNMJ1Ol2lTfLR
	 KFpsyTA//kX1XP3HI7rVyebHdMyb0CvNulf75VpiQUoYFcjXyI1zv5aseF+VrynJbas2p
	 kJj0SbM0dKMW2Z1uM5lcBivGLzcDLPBHYOwsty6OeLsZ5E46TdErzgIu6i4MjHSfdI+DI
	 juphOOUeJjNxb0jB4bdiHGBrg8+IgdNjEVxZD+Gim+PlL1zFx3Ona66bEMCL7q74zbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
	b=PLOwoQqx7a/3DL2fA3tqAHE8uoGtmwa2u5aLkkRZkpONfTH3zcIl4KrYb50Jq/dOVSxG
	 2+Dgv55utIZSgx20+p1omv2sYYnDh72eXAebnM1Q9+p3CgUEEel/at8S+aN/2Iwl9DiXW
	 CO0lUqxXwcaBfg9m2V8nuu9YA14ZHFBai3mBCS1ST3tHrQb3HcAQQRIROsvHbMFJVbZnO
	 AwISuYKjkIhsG+WBxJVKWEtshAZyhhPBTE7K6pKaNj0xEoqkx5bdbkHM65/6Ya1zoG2ii
	 vCrnR0pXRWKbvk1SfHTxeXdehjUPP2RH6JaiTWqIlHjFrV4HKpIb1I9eojHgZOt8TkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+wWjgYF;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FAD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FAD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+wWjgYF
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso306111666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269109; x=1793873909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
        b=g+wWjgYFrXu7uWr+ib0KPN60R46KlHADQzU7vwIhA566zrx5ORLw+w8+7YsBDV88ds
         3REIXGF3AbqDgYQLSR94m+U7X+Bl7W909iaL7FukBFUdlgyICyufjCskoBczTgAKkW43
         9h+1Mx88VmQD6SW5mPA6NlMw1OatOTlyp5akBFskWhE1eJFWtYX9EKtNz2EPk6yW3yOh
         PtpZ7vZ3oyJyVm0knAWPea5rCaXJIKcid90WuWvJuG1gFLiy09y+q38awghUeQNESpzK
         17BTntQA9yhqTePIaeD6woSHGnAwE9DbX5jKOxYiV4G5XxxzjwgkpafedcLZN6TnCdMz
         5RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269109; x=1793873909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
        b=knILZkYepZ3tF/HmXDaP+ZKI8kKXpAK2qjeUWaremMt14LqomieSMdul84A65aw/Gt
         c7kHrht+/XVxYK4eTq0sFBYXOsVkiZEqKy+NCVDFdCGVTB+z0AHvmJ2RyHr0adeCC4Ut
         RvEwXDY8Vep7wdOue9/JDrptaLAIXUWZvTX06bRTsEEoTNb0Zw17SGgGh/t4WHT0bhqz
         Mm3ZUORmdJ5wsaZfF/wouNebXkkv8egzRgJj4Q2Lknm0o4L8QO6g6qvk+mRWe89aTiQ2
         lwdIJEDnEwlanaRVxds2HvkMEw7olwK91tK8ES3icsStLMgaqsKTEL5Uss3+zWGPnCc9
         O9Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxVnVzhVZikKzFCK5LDeWqKCsFaXpGzdcCkPkbxEtGL5lSzL4OJYj9+Zawea0s/M0GNQtqAqCpH8yNR8FI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt87xEHAQTPP7UT/zv9rTnqTmbw2dT2xCIC5D9Y7cW58X1YSqs
	NTvX8h3oz39I1JoupD83hO0p7bQVznT3AAU1k0KMoD40HaOfKSzzV/dN
X-Gm-Gg: AYBFou0PXJEi5M00ZbFxkNec03u5Kd6BSDuNoqeX8c+s8T8Z1FtZc1cqk427QtXIp9h
	uWwcR6igNNfWSjrSOUwhN67tYIm6TcseTkf1guEcuA00THc0vNVBe361kAj5fAWYbRUKnPpCfNk
	XcYgqoJh9nZasW+klOH6zR9eV/0MlmfpJF1BQZZVa5cGd0Sqw0iZS3+ubWz2WbEixtrkP1BBIWU
	IbTl2Nw9iwTk5cR/k/d9rqtSs3Ergs/bWCy1Fby357a4utMh4heIhjPp25qr+MeAVj+I5R5dlsR
	Sx6MVgPXRhjWQvwiGshwkIEogZwwT7eV37dhRb2bgRFnCcOOSSLZ2IrNhcN3n6KoZP4rnQBt4Bf
	aiBqH59Hp81b0bwq/kHVWkmxwZWmF/ECmPzFIRYfICjhsdLmDZOTFr9mt1dZkIYNxlhkEFM/ZYa
	b7ybz2mUbJNoWZZ5ZXDOo7zMK0fz5h7h7CJNOBhAgPGCrR0nPog6rTqQx0262fUFtwiRt+xt1OO
	YmjjFAIIs78QL6dtIHPrEoXrEfxvXvBveX3bThKjlniQH3qGLhLDOJTI3tg0tWraDuLlzxwltRz
	QW3lfhfzggVdCbv3RiEEajF/WlYdMgzTqWSjAoCk+eeB5Ob7o4HsC+0pX3PnbJ0=
X-Received: by 2002:a17:906:730e:b0:c40:231:6eab with SMTP id a640c23a62f3a-c49bdf393b4mr415116466b.16.1793269108982;
        Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 0/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:21 +0100
Message-ID: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The Xiaomi Monitor A24i clears DP_ENHANCED_FRAME_CAP in its extended
receiver caps, and through a USB4 dock it does not sync without
enhanced framing. v1 kept the bit from the base caps. As Jani pointed
out, the spec says to enable enhanced framing for DPCD r1.2+ without
looking at the bit, so v2 does that in drm_dp_enhanced_frame_cap() and
converts the remaining direct users of DP_ENHANCED_FRAME_CAP.

amdgpu DC, mediatek and hibmc already enable enhanced framing always,
without checking the bit.

drm_dp_get_phy_test_pattern() still uses DP_ENHANCED_FRAME_CAP, but
there it is a bit in DP_TEST_LANE_COUNT, so it is left alone.

analogix_dp has its own copy of the check (DPCD_ENHANCED_FRAME_CAP()),
I left it out, can do it as a follow up.

Patch 1 is tested on i915 with the affected monitor, the rest is
compile tested only.

For nouveau I converted both dispnv50 and nvkm in one patch, so the
watermark calculation and the enable stay in sync. Happy to change it
if you prefer another way.

v2:
- Do it in drm_dp_enhanced_frame_cap() instead of patching the
  extended caps (Jani)
- Convert cdns-mhdp8546, it6505, gma500 and nouveau
- Commit message: the sink only fails through the dock, directly
  connected it works without enhanced framing

v1: https://lore.kernel.org/all/20261028162941.62762-1-dmitrymalovanyy@gmail.com/

Dmytro Malovanyi (5):
  drm/dp: Always use enhanced framing for DPCD r1.2+
  drm/bridge: cdns-mhdp8546: Use drm_dp_enhanced_frame_cap()
  drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
  drm/gma500: Use drm_dp_enhanced_frame_cap()
  drm/nouveau: Use enhanced framing for DPCD r1.2+

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                 |  8 ++------
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 include/drm/display/drm_dp_helper.h                   |  4 ++++
 9 files changed, 23 insertions(+), 12 deletions(-)


base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a
-- 
2.50.1 (Apple Git-155)

