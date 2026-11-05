Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868107;
	b=NbjY3ZrPL1iuhqsUYRXyfe4WfOFDFV9VX4t77xufSqSyv5/pujkJrY1DOK5qDfjBDRjr
	 +vtcMFnZlV7OdSEvQ81tFzDvyRvcWqTokz2W/l0cXyxkpQFppyoMLmgjTUOYMwA1cRChI
	 CyQtdZ9bUzqsxqSJ+UcgWZQFV2Vs7JmU2Qfn48ukE5QzUXEW+bTbCySh4eGH25LT2Aa3f
	 LPk+BzJfc4XPwGe6tcouG2kNvOIvomfq5d3dQNvmYvexbey/ZdG67jK6gFikoY0cNZN5p
	 RkgwK8tc8LV+L4Hdn5emaIBzdagDsZ2GVr98+qvtxoixmCKkRZYVY8mTWKQVDRvEURQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
	b=4MTGpnVWY/NLO8J1+2PRuaT8bZoPLF9lBRuSSxipJ6okcFk4NGvyEFHykXI7vP3kO7VT
	 fTscRFfkeh7eTsFHezcEoLjIcnVHhpJE6YgNnPhKDL/xSJCK6h3tAgtgASXKVFrHLBlsC
	 jgtjc8GIjP9IrTJImmcGT+lNOTQBUdF766vdTZWNXYWCIcCmiV14sJlVO5EjUzCrnaAQF
	 lD7fFAKGDJ906At1nmdofWW+uJ889jWra/aNvGRSM+FZlL8RiHS3BSGEvC5oK8f2UwxwA
	 QSqx8VRypwiOkR7IVK3zCDPfxzKMdijVcnwb2l+ILuMPYx+dgNwhy6w6Qsvzjm4eYzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeW32GXY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B93606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B93606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeW32GXY
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c75267b0fso16954596d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868106; cv=none;
        d=google.com; s=arc-20260327;
        b=T4BZ+st7Xd+Ye8eTMHkvhEbEEOB0QSMNiI+J5MpIR0cHjQGpfHFSUY2sGTRjuBrLJv
         lZiuKNEayR9TvfJLhCBnNhlY7zYmFznsjpa7VINvF/sNrf3Hag88i+oVzTtL1I9yrFlG
         5uBN8z4vFfGK/1v9P8X80sEtBJn1JA3Nbaq0riYDtX6XhwC3F2j3Klc8NCqEM4i/UIPk
         Odqq5U7EMaqzo7U5mEsnGqyZ0pdfaIQqkgk/u/vY+zzHpd+S6p7xXfXwHbsjnoics25z
         wRfd1cw1+5qkS6GNlgRe+cM43HshR0PQYfXhoKl9P/Y3JmMNISL0VdMR9Ez9iOiclQwA
         4p8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        fh=0L26f41xcBxhjI300gomiIhShUCo6BAmLrZIYnHj7WQ=;
        b=KhmuRONdtHyO8rwajowYjqvNuLhoLeeshCa9ZwW4+bjbCRpyX1MiF64elYWbatrYGh
         PPKFcvLp3SZT8pKwYAMnwaP3gtOo3TUWG1nyNqU1uQ9IpkGBBh0X+w+dnYQPfIvLdgbj
         +ykenw2jjh6J+v+x8AXI4SZ48K3XCnSqWgwJPUB17lJ/W0T3uNNZEkU222kezW6DTR1y
         +oFsC/0Aqs4rSJJfxZa43MeHcKb1CwzysJoJfg0jUYMt0Z4vbPdiqxaAN6PdZF4BWctb
         ldWEcxPEjVP+uDj4W0Y/GoKHDevQvpP6JMY39bj/PXU0KTQaBnoEOL7aynSaIez4HrZ5
         Z7pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868106; x=1794472906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        b=NeW32GXYI4IXHBLfdpquStVNNlDIljX9UgnssfdV5uurN8qpkuM0LdQRkz9lc3Wqwc
         6B2VM+tOI24z8yfSj+PPDpwV7XEh7YrnZlmIqtbCBR6H/WEf8Q0HcjqltxF++232vK+K
         v0aD+nkzj7iZ0m5VpQoV6TWRPLuaku57adUNHiDFvGIS4Cg2FghKmU+ZQJtbn4R/goQs
         2XEX7G+VqviNgF5cnogVqTxQQLI6Fw2kSXAuD0bsWD2gJdTZZg0+yl9tX9ucNeF11sVk
         lY2FXOinw4sGjtgu+CDWamCUiDb+qutzcO9vnyRw69hrNyJVdvvsYn5imqTLdyV9yYbG
         mH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868106; x=1794472906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        b=puZIPfxaS6nFsnqWZ2W1D27LYDu4pvmk1X+N+b6iLV8I3+5mvWbx82xMKabtqX/S8z
         LLjGqBJgMcfaPzg5yGT3XaknGRyagYwJJUmmgWRbn4FYnXKQlfMbvcpzxxETn2v4KFq6
         BVS1Uk2LlZzHJJVDkpUrBEFufEJ6i4KnFAahypPEZz2U4+0qCLgv1yNB5kOTqBr8uM7N
         yhvOgI3ucz64I40wFyE3nNUZmga247RymSS+4qpStOr+a4KdT4c1hOHyb8gVldH0haH3
         67EeGjyz2j16C5/0Z/75oJ9rcLCtSIa7TiVgzC9Sy1s+2nyHGcVpRP14nxNiLhqSlfiw
         kQcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/QFa2h2gRLmoM9cCI8JqFRRhxlcb06Pfr6SdtTfOvXHWGQXsJHn7bFNfLiN8An6oPfgfK1hMyl5uEG40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sTMT9BAS2wUwuxoZpuQUSPN+2LXl8pmGQkRoSAjRWLrIrQN2m
	In9X1S8ViNx4dnhIxgOaumpXI+0PY/13Q1dI8Sr+x7GiSkl9eFHMWdtrnFgV0fl2SBMMVgmxyy4
	rJltrjNfWy7hK6m5y3tO49yb8RqiHKn8=
X-Gm-Gg: AYBFou2gTUQAdI/4RnDrJXghZTYosaW5o+wS4i/sDTPvBxv7MC0IVTuZNhg/1or2qWa
	WfMcDqDWgOGjA3FP8wbo21FfVD10UFRxa+TlSZndk6EDJ/A4YaEifQuFaHCxa17bRbFQuUrwP5I
	wI3XusWRV9GMItc2OMbUb3MGQyEMf8zR6BiAqnS/j6vqNKROJqs63fPZbx5FJBpgEcF9oZWC91l
	cs1/tNiHcamqseKUs2BQawRt4Xh2KsJQ8asqxPbZz1tm9rwL1jeP29yq1Mo4cAuW6tqdGu2k/mA
	jJD71S+GOtQYB9xnKqGspIRFNhUCY4zrdY6kdNVxqA151QM0u/y4rU5wXUJ6jLKP4PKkuxF89Xa
	N1Wm3J6aAzXRYDl1XpLv4wa7Q2Mg5ZAV6F5yO9aNVOnjpdwzW1cCyXnoIoXLOvLiBEAcBn7ItIC
	2Muv8cUcJ54rw6I2GsEYx8eg==
X-Received: by 2002:a05:6214:5d0a:b0:91e:8cb1:b856 with SMTP id
 6a1803df08f44-91e8cb1bcb3mr50976416d6.41.1793868105578; Thu, 05 Nov 2026
 00:41:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101200428.16959-1-rosenp@gmail.com>
In-Reply-To: <20261101200428.16959-1-rosenp@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:41:33 +1000
X-Gm-Features: AclHuK9RB4mLTs1goTvN9X54_7uH3Et6Jl_r8Cy2cfziD_nx9SDo27jgCkGyM08
Message-ID: <CAPM=9tzacWJenKpU_-zbCOSupybgJjXFV7SZLvT+DNBs5fZNEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm: clear use.enabled when subdev init fails
To: Rosen Penev <rosenp@gmail.com>
Cc: nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, 
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:04, Rosen Penev <rosenp@gmail.com> wrote:
>
> On Kepler boards without the video decode falcon firmware installed
> (msvld/mspdec/msppp), every other VA-API decode attempt binds to an
> engine with no ucode loaded. The submitted work never completes, which
> leads to a context switch timeout, a channel recovery that cannot reset
> the engine, and eviction waits on fences that never signal. The process
> ends up stuck in D state, or killed by SIGBUS when it touches a buffer
> evicted after the wait times out:
>
>   msvld: unable to load firmware data
>   msvld: init failed, -19
>   fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
>   vo[5444]: channel 14 killed!
>   WARNING: drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:117 at nvkm_runl_rc+0x2a4/0x3b0 [nouveau]
>   [TTM] Buffer eviction failed
>   WARNING: drivers/gpu/drm/nouveau/nouveau_bo.c:1092 at nouveau_bo_move_ntfy.part.0+0x9b/0x100 [nouveau]
>
> Tracing nvkm_subdev_ref() and nvkm_subdev_init_() shows the pattern:
> a reference taken with enabled=0 runs nvkm_falcon_init(), which
> returns -ENODEV; the next reference sees enabled=1 and succeeds
> without running it.
>
> Clear use.enabled when init() fails, so that every later reference
> retries init and fails cleanly.  The other readers of use.enabled are
> fini() handlers that use it to skip teardown, which they now also do
> after a failed init().
>
> On a GK107 (Quadro K1100M) without video firmware, playing H.264 with
> mpv --hwdec=auto: without this patch the GPU channel is killed within a
> minute and mpv hangs; with it, VA-API decoder creation fails, mpv falls
> back to software decoding, and no faults are logged.

Appled to drm-misc-fixes.

Thanks,
Dave.
