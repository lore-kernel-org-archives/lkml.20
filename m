Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E946A611
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363155; cv=none; b=m4Ub1faOJFlt8UKNPhHXNVVUVl7OUE5210nnmroookR9u6IZKyMGvzXsQ9AXudPrZwmFLSMKsKOHLG7o9fWjqpKXd0+XCHkaTwM9MKy2w1hmnPgh6vrYxnPNMnCAMA1t9W4rwepyKh1WNEHsaeni5mtHWHoKvaPReAUBPcwPMT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363155; c=relaxed/simple;
	bh=FiL4xTcXDIPoGTMZXRKEFaT7WuQUy5kID7ebw8CmJ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy9wLPuSpqTNAQPmQnEEsZFCMQF/1b5x6Kubq/WA/Bhyed0dRx92FH/v84+vbOHnNzgF7cWHDro5Gdbq0ihM2xkB+E4AaSOmM+WYefRtYOzNms0uiJSkECAoWMTpNhf9JyfFry4EccyjQIQMw+3047KzROrHwFa8pIgEilgJrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUiUtQxD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUiUtQxD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so10157085e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363152; x=1792967952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvsLpFGelrgwN9Cl66Kd9LpNf+fNDOOYoQY8p06psOA=;
        b=NUiUtQxDcxLSIZtOGmPoz7KZakXs2QB0YS0l4ZIJa55v7njhBuB0GfLi6KomNqDJrv
         LU8hxc5cHeeecPcZyAoWmtwpQ6XRBKQLqzq++sGErg/x6Hs5unjMROoYYgOXloI7rFBc
         ATUJ2SlI4hSl21jy+cC+pBl5uJ4qn9BVX0YCKDTOPG1hwpaYfR8dInA3Aiy17ym+UGtM
         86YtG+FBvk4O9RvwgN5Qx0v+9+WScNS/eyz8AkUH+vI62dmvH4cgJvfiFES9iK9i+R49
         wihkUsYRrqZdExyc5Y0/MOd7mfD9FZ8ONeqDGL5+BrBAVSqhmYwanW28XGoFWsRVC7Ks
         9teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363152; x=1792967952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvsLpFGelrgwN9Cl66Kd9LpNf+fNDOOYoQY8p06psOA=;
        b=r6iuaKmBwO0TKEunJHczGhx7+yE0GUQ3+IcuqLuXFuMgNGPWmfm9++gGEWU3qpOcil
         Qzo57Eq8WGtBKxVaRL+jX02Gc82zYReyLAHYj8Owvp2ANZeGQjDbpCRUz5Iy5cJC9671
         WsKSRH4dTgw+YoZ7g8+xw9HxY5vq6VnIQp6jbi2c0P8SHu+9c3BLFOYKZLDJVxuENblo
         hx9YAhhtpEVPQ4WuzOXVgP6RxNIrNrlSYmWWqFvwXcnIUL/Kncn6PvPnqI5q+xt+FCpk
         o6MELmhtll4Z0J6RY9A/ii9xUDYwKV44rr3KrOnzIf7IfNAFNt9Jy7zVqrXc54KM4HSV
         0aqQ==
X-Forwarded-Encrypted: i=1; AKwUvBymR4imfzWhC6pN2ezxZ61QFpymdfSLGF7HH3s2g8/0Qvij9ygNMskZX9RZ6OrH/3rN4tiEa9ya3xgU58c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFNZJhy3/CovznuS0i2TckCwJWm7fHdHgErn0KbkAGrof92Ooi
	jN8WkAwclTUPSqqfu7+Y+q/Zza8vYFnpj99dw/AjJtF5nPypRGrLOJNC
X-Gm-Gg: AYBFou12gcizj7zUvKVAqt1LJhaU0SKubsjA0N3V3/KpLIzKOD7tw1dRYUBOx9my7SL
	EAlunOVInI9miq5Xi63oY6R/0645Zvls4VRuuazs/Q2hd/tLYKr33BQhq839BWonB7ssKenSE+u
	Hw7WcG+t0ZgjNxVW2NWsJNBDJy9IgPU4QJUVl9QNhUozl/vT8LaH4mDTK/JeCyE6m5VVeUifZXK
	iLhDrFgZ3/dAlT9oUlSoy6V6GPkuJrlufATVoMMdyoLNuBcGF2zfVZHBtxPRWKj+iO3MU8CwBtB
	inc0EQvA2MOzEHxP0nQcidqT+XPwR97slhz3VJAD5K4PPxuRrzIDBmhFJBsfr4wmaAyfe9tnwNM
	iwCMnGMg7TVKb+fxQi5+e9SblPVKJze4QgFuD58qnozpkvmAUWna6TKDfJ/ZjgdF+E8gYla2XUX
	yZ4rJQ7ETX3cbyeZ+DHa4t3iMIZEPIgwi2D1GUiTSUXyWUYanqQl/uA8S7NWN0R5iTZ/xjqFgrC
	B844HCw4dRUDOjfQA3NIJFkMe0JZ+W3Q3080AuGQLm+FBilFtGbP11CyQ1kMUkIMiygkts=
X-Received: by 2002:a05:600c:8b22:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a1d760d9fcmr130723785e9.31.1792363152485;
        Sun, 18 Oct 2026 15:39:12 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm16359363f8f.3.2026.10.18.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:39:11 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Mon, 19 Oct 2026 03:39:05 +0500
Message-ID: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011201833.853907-1-mikhail.v.gavrilov@gmail.com>
References: <20261011201833.853907-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The workaround from my previous mail does not survive a suspend.  After
resume from S3 the band was back (seen, not measured) with the TV still
in FreeSync mode, because DC had turned SubVP back on.

Snapshots of amdgpu_dm_capabilities, pp_dpm_mclk and the DTN log, all
at 3840x2160@120 with FreeSync enabled (vrr_range 40-120, the EDID
byte-identical in every snapshot):

  after boot                    sub-viewport disabled, UCLK at 1249 MHz
  20 s after rtcwake -m mem     sub-viewport enabled, UCLK switching,
                                watermark set A at the register maximum
  after toggling Night Light    sub-viewport disabled again

dcn32_allow_subvp_high_refresh_rate() keeps SubVP off a single FreeSync
display by reading stream->allow_freesync, but amdgpu_dm sets that
field only on the first flip after a commit, so the modeset forced on
resume is validated without it.  A gamma change makes DC validate the
state again, this time with the field set.  The patch:

  https://lore.kernel.org/all/20261018221726.27259-1-mikhail.v.gavrilov@gmail.com/

With it, SubVP stays disabled across rtcwake -m mem.  Until it is
merged, toggling Night Light after resume restores the workaround.

None of this changes the band itself: in HDMI VRR mode, and at 100 Hz
in either mode, DC uses SubVP anyway.

-- 
Thanks,
Mikhail
