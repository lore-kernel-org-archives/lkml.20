Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36434A0EF0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008122; cv=none; b=HtYJLE6q5By6/SC0zcLxNwqh5VGSYffj8qId1BMtyLVy6JN1ohYAKTjkJceJivjeI2wysjWT/bVEnaEZ5sok7QkzT/JP4guQzkBXF1lULAHor1PC/gZEqdq951AGREcJMKeg3Z+VWpVje7e4iWtKp39ofxlSnIuUmUEDAkF9Os4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008122; c=relaxed/simple;
	bh=AraGOmUhC84FS0Mdmdiw/5saG9mLg43RiPkoBq6LS48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PEliDDupDm2yOwt4QGdxs4DMrvwKBunTSCGv6UpIjMv6hSs8DSvagZQZDwhghYJy6ptZ1LMia6Tu4MwEcZ3sdkVsK1rd+U1JjU4xr/QvitUvh05vuQTdug4VqgggKQE0oVDA+2Sky1VZifZCkRj3iTaUgUwyoPBYjXkDeHUKPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bW8HzrSH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bW8HzrSH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db710396ffso456455ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008120; x=1790612920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/keQYonBcmZ/ZuTxv1Ljqv5iISMw6Gg/s3/qwKvkbw=;
        b=bW8HzrSHimkroLKOpPqRqxyROx7zuFGEg2wHUAHZ6TEQLAFjOkElEDBLp2icwenAtJ
         SBDISUBDnArVpn8GmpwdHsCq78MATnOjg/HyKrU9LdAIgXni7F/IfUhZXH70xBwubi7j
         teSSJ5oFnR2uUjgmHP0MqCXJUWBjUMEdjLPIBYKKvnHbJ/OAWdBOAmCSAjypbc6xsNd1
         ht2kW31beF1Pq4b8RQ/LQy923P5WZM37G8xZiTijf7iOKPLOhCgulTfNNBJ/XfifLEiE
         VoKvl8kVDEmLQamQdzcYDwEh3mWgCOfLwvGlNJxENzYPiGAlViwk9GLggxEGNgailnKM
         FXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008120; x=1790612920;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/keQYonBcmZ/ZuTxv1Ljqv5iISMw6Gg/s3/qwKvkbw=;
        b=0gfgcL7cO078e2uyDPP12lAz2IbcjXBC/KY491pwz96TtnoSsVHLs964PQh6HhB4O2
         qrRMrrDgr7d4tvPXJqwuXK+Fwcz7UVLdGOVCYA2WxaLMNFwtm+adJyFiNfQ+1wl5Ifsg
         z2qJsZkqBNLVmvWgH6mzmpgV/Gfl1DkId/Oz4mmK9BQG9YJeTahFb8HjoCZpkxWVoCea
         uGSVm+2qurqXh9RDagGqA/cDJDqNFqGHumHxOwYmKmIUHTGju4Aj3ETr5qyt4Fda9LVi
         5Ey7xZw3dCilRYS1OjuOhLXzQejwmo0Z4ee4+2lhgPhhh7Ddkc1o5qWEBy97cNo9bZ1F
         MS6w==
X-Forwarded-Encrypted: i=1; AKwUvBwgMSxy9F+1JAISUJV4cZkOkkMia9kB90MJD2EyyqbZuYWoZ2nOwmOfXfkltetNl1kFAWNh+WLKuGkWurE=@vger.kernel.org
X-Gm-Message-State: AFuF++nTWJ7/fM2UrcLOOV08psitNwcTfsFQyl3qvUKULRk6QVMavMv2
	X8pGbFxUCmVwMF7jZ4j3qEYWqRxSagM7+2FQ4KqcSsWbFX5aHUbjOU+q
X-Gm-Gg: AYBFou1M7bfXXP/dKK90IXM9pG3vuwbKwur4cr7JhiniuhKiIFwEoRsk3wH1YKKLh9+
	p41+2APDD7dEdqS9v6GoI3jMFsnlvkDXzZLt1wnWgFyusGnwAV7gMErE/BjCAm161MZbRK7B8IV
	JHfBfep+Eq04gHQGAymo3ZltUYOM1VZO8LCQ2T3tzG9nR6OmuuzwT2XYxjxTOvX6OBmdjOkGlf3
	NQqW6cgjXivkwS30bWQgT6daqgENoVeURcyf0ECgzqg6C5tbmPDp1l5QFeCYpSM4xt/U196qPtP
	BlgSi4alXyutT4mB0bVtHua9FFnnNUY/WOeou00Gc4/xT3J6n/WIovBn1pDVYbt3sqFMFoQQ0/P
	ultGMhRSCjvHhJh7q8prfHeIjd+JRfOmzqSadUzuLeIOIYkpKXoktTEpPj+gZgwoIBBnTdCdbAC
	0LXDodAMYK38+J7zF9ReB+fxiaCxBCEehaTJsLKMoOsEfwzMnsZ1Z7CZLfvrOyiTw6kYRXm4TdS
	p5d2t9hT8FV1xpuj2fPtVjjSt+DvWF3Zg==
X-Received: by 2002:a05:6a20:72a9:b0:3da:eff0:c162 with SMTP id adf61e73a8af0-3dde0112089mr154097637.6.1790008119918;
        Mon, 21 Sep 2026 09:28:39 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee0fbasm3746033a12.25.2026.09.21.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:28:39 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
    Maxime Ripard <mripard@kernel.org>,
    Thomas Zimmermann <tzimmermann@suse.de>,
    David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
    dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
    linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Subject: [RFC] drm/lima: context initialization after handle publication
Date: Tue, 22 Sep 2026 01:28:34 +0900
Message-ID: <179000811427.1227592.4716389146886977098.idr-bug-58@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I would like to report a possible context lifetime race between
DRM_IOCTL_LIMA_CTX_CREATE and DRM_IOCTL_LIMA_CTX_FREE on a shared file.

The source reviewed is mainline commit
5dd1818b15d98d4a20806cd00b1b40320b06004f.

lima_ctx_create() publishes ctx with xa_alloc() before setting ctx->pid
and ctx->pname. It does not hold mgr->lock. lima_ctx_free() takes that
mutex, erases the handle, and drops the context reference.

An empty context manager allocates handle 0 first. A second thread
sharing the file can therefore try that handle without waiting for the
create ioctl to return. If free runs after publication and no other
reference has been acquired, the following order appears possible:

    lima_ctx_create()               lima_ctx_free(id = 0)
    -----------------               ---------------------
    xa_alloc(..., ctx, ...)
                                    xa_erase(..., 0)
                                    kref_put(...)
                                    kfree(ctx)
    ctx->pid = ...
    get_task_comm(ctx->pname, ...)

The two Lima ioctl handlers do not add serialization around these calls,
and drm_ioctl_kernel() invokes the handler without a common ioctl mutex.
Both ioctls permit render-node access. This describes a source-level
use-after-free candidate; it has not been demonstrated on hardware.

A draft holds mgr->lock across xa_alloc() and the remaining initialization.
It was compile-checked as lima_ctx.o with W=1 in an x86 allmodconfig build
at the commit above and passed checkpatch. Moving pid/pname initialization
before xa_alloc() would also remove the post-publication accesses and may
be a simpler fix. That alternative has not been compile-tested here.

There is no Mali4xx runtime reproducer or KASAN trace. Would initializing
these fields before publication be the preferred fix, or is there a
lifetime guarantee elsewhere that rules out this interleaving?

Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM

Thanks,
Sang-Hoon Choi
