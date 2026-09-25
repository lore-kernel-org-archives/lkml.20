Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4DD46A5FE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338933; cv=none; b=p+6C1ZWWEJkigS/2bFJ4fWTD+uppwsphc5Cu3sgLVRinkLROkuS9AlVVEB7QWSk3G2P+yHRkZGt2Hx7Q1VtH++AGD5zn0lesdj8mXP/AVMHiW8cMKwQ0uMai1+zaodCmVjhzf5hcoJe0mAc/8lOk2k08L/qweVFK+CZ34Wp1wxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338933; c=relaxed/simple;
	bh=s/PvtkNVZ4YIzTo0qHBPvGUkdcNJ0VSkXZVSnkH2sMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MSyJSE2UExG7EZK3sPsUj29vcKWISdoWb86JNppzgkYDTaU08r4XMz1nihkaF2R03gAK1uCrel6YNXHsoekQnGTP8AkVuJL26UmW003bu9SaDOceN2v0V0+6YWf6X56f9AefLQIfeVHIfVQ2RJRtpMK3vRtfexk57FdEp1oMc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvMoKYbP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvMoKYbP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso443772a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790338931; x=1790943731; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uwHCeFBiFb/S6cPK4uw5VdO3mz9Lko0oibblDJPiB/Y=;
        b=JvMoKYbPgZowh+cUd03xGDt8C/HYh617X+ApuVZzdhbespxQ/Qfh/u2yhFBBi2eQpA
         9izYkThVQX9X3HgrNYGf+2kbwq/dqEQlk69gIqqHb2CPMwYenVKAcITfxzH28fc1Zvia
         SJs1SKuhm1RGqW4NeUitV+9EYt41gyle+aEQdEHVKd5rEq89Te0wQllZjpSZ718KlJGk
         YM8Eqq4g4ZNA24zCoVTsUOrcxOSxndABIK9EEYk2a1eFf4xgyA42ebTndpECbs8K+Hxo
         kcAewrwwSoB7o9+XsZFaSmcFaawroVsK/vNRezluovIuCTvxHuA1CnaFXmeCeWFqSVY/
         o7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338931; x=1790943731;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwHCeFBiFb/S6cPK4uw5VdO3mz9Lko0oibblDJPiB/Y=;
        b=K5aU9O5/2+j4n4AIdVXk+X8mtP5rrvm1FHCHWqJi0rbaYrv/zPbwwSBl+v1c4sStxG
         /yBip2/nTOLXF5Qfa5YHL597nMT0nnpoLV7Xo/fCre90yKOWSpAc6irVRmtMebKEZshf
         dyq2cSE4hN3U7tv6MUV3hj+kwnEGaOxP9O/geHYn2NwwTflRCpvW/FclZ07Bn/WXWHOO
         mYL7PI4yCDsCh+jNHIObdUqe8yiOmeSZwl1MTQJWvne8M+9y/SPPfirXVviwhivUF6LA
         stDzvdX8do/IbtEnjppnywvkkuGoJ3TG3ZvLu/Z0YgmkN1azo8XAYN80paMiZHZA9pPH
         SXyg==
X-Forwarded-Encrypted: i=1; AKwUvBwEVMSTlZdHsxPQE7tLlj3I31eOqULtSusqti79yRQsDdV3LAFhsWuNICimAK05LhudkWBDKrb9rnJUXiA=@vger.kernel.org
X-Gm-Message-State: AFuF++li2zMHM20pJkitsl/9Y3zeGKSxZ62FTUtpD3CD0qVM5gEv5mwd
	Yf+NsXmO3M545vr9V2QB/oWcWFoG8GLvdNnsmHNN1hhSwrwXsWCtLymTJ9M4wuI4Bic=
X-Gm-Gg: AYBFou2sNZROiwIh28x+RkBtCZ5nvqwaABmBXCcQd40hl6mZDoG0OQMnkROVR7xLZAc
	oV1rpdpT6G/TWm7PUr11ZiC+94FeUPbaK5MVfa5ztZCQ1V2AJ+1A7Z+SyPIbrbtH8hl/Txu3/uI
	JYLKJwHa2799ngSzh9H+3qR/bHb7uf71IFXb2BZG9D6rK2qTwtL75/pNRvKo6TSx3fsvbyHPmS3
	Jx6D4GWje5XK7TUCGWpfiAK2B+tnpvLKdM7r5/3tTH05HooxngCWYJ1hnITvdxLNlxUUIzjyvDG
	yU/MFvKnZ3Di8oPsHw175nChWu+EZmrnPYLV1p4fBmSHBfxeAqmgqq5gY4Bmt1arYDZeamyjvpV
	kJYzpgRJmMuoSbwUnlNll7qNtd6kdLc0MpqEP79HCeXYxJyLiWTxkWBlQq4CjSYvd/OlZELNh/f
	5VoquPd4OhWKRzjgWiaPd1yljACsuL9fs1y0rXxKJ2Y6O1lpFwjz610a+9pw8ZdSTHLgRYsxU+r
	384kuQS
X-Received: by 2002:a17:90a:38e4:b0:3a0:b223:6830 with SMTP id 98e67ed59e1d1-3a0b2236c1dmr1533648a91.7.1790338931135;
        Fri, 25 Sep 2026 05:22:11 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm1229303a91.2.2026.09.25.05.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:22:10 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Marco Scardovi <scardracs@disroot.org>,
 Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Fri, 25 Sep 2026 12:22:03 -0000
Message-Id: <202609251958.ReplyMarco.lhw@gmail.com>
In-Reply-To: <UuqOxFagT_OBL0l5ZYtfKg@disroot.org>
References: <UuqOxFagT_OBL0l5ZYtfKg@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Marco,

I went through your SCSI version in PR #17 against what the hardware
told us while developing this series. The class layout fits the
device well: the ENE mode register is the hardware effect offload,
and direct streaming as table write + apply-without-save matches
what the controller does.

A few things our hardware testing can add:

- ene_write() maps the caller's buffer with blk_rq_map_kern(); your
  call sites pass stack buffers (colors[12] in direct_write). That
  is the VMAP_STACK DMA issue Lee caught in my v8: the payload needs
  a DMA-safe buffer in the device struct.

- asus_aura_brightness_set_blocking() will never run on the current
  LED core: brightness_set_blocking is superseded by the fast-path
  brightness_set there, verified with a test module on 7.2. The
  callback to use is brightness_set plus deferred work.

- The firmware effect numbers from register probing here are
  1 Static, 3 Strobe, 4 the rainbow flow (all verified on device);
  2 looks like Breathing but was not confirmed. Your mapping sends
  Spectrum Cycle to 4 and Rainbow to 5: on this enclosure 4 is the
  rainbow flow, so those two need on-device confirmation, and
  mode 0 for OFF is plausible but unverified.

- If the class core serializes the ops with led_access, sysfs ops
  cannot race each other, but trigger events reach the LED core
  without that lock, so a trigger-driven brightness update can
  still interleave with an ops sequence. The device ignores a
  sequence that loses its leading MODE write; one work item owning
  the sequence, like in this series, closes that too.

The 12-byte block write to both colour tables in one go is verified
working, so your direct_write shape is fine once the buffer is
DMA-safe.

Whatever survives your rebase, the verified SCSI core in this series
is yours to reuse; happy to rebase my side onto the class once it
settles.
