Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B71325701
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766170; cv=none; b=eFn02puUrgWfOhoLDP7o7QZSmAk1ubekQCrnh8n0MquTwqwoZo71ajPBPzlvo+V4eJXOQrwNHeGc62KxX7EcQLhJLrauLXPliH/dfmZfdiCABhXxEhE2smPhcyelkIfneFfBgdWZwTxE73PpKeKJgVVkAkHNyJIuULUq3r6vuJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766170; c=relaxed/simple;
	bh=BcoGTFgxq5fYS6WZBPHUj5zGnw1RI3LSPrYJyU426iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/PtuezVhBzEmYjJzX6UbKxgkJSncSyMG1hI9Ik8CEC+3qJlYxSELJIMqWA4PazKFNqxGnzn8sasWNGZZenYvHomsX7aerJHeFMqPn1Exl3ZWzZna4ZCgM6y6HRHSm9xZNYIdohHKWlT3Gro67hnm/7cRBtrBQXdBKOES8w9Gx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3ULPW3j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3ULPW3j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2155519f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788766167; x=1789370967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yC0qOZ3brQFy+kstfMcuNRxfOjZAsmCWrFwiG/10zA0=;
        b=G3ULPW3jktP470ib+fVuEGjanu+gyHJxMyES9GoKQOLGebJTGxx5idjtf+uiG/gLVN
         5wrc3pkK83scpFiG8i/6fJ0Fh3in3GQUuGktXd3lRZDLMFhM2TBUGE5WYpoef4z4NPlG
         00wM6nSciHlEBePMY7z19EksL5XIVOK03Q6PhpS3tcyalPSti6yylrFR0SGUkB3fc/nA
         c5r9IZ3/8m1i2RfR/LAtSO5HtIwMqxf9lBIg+Uwj393gTnHdoyeqM51Xf10SIuEch7Es
         PvNxjcRThnRjATCjEyVC/LDp3MDViMbk8irGijzdDQVkOqcHq6XGh6krPUb2XKS69cTJ
         8tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766167; x=1789370967;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC0qOZ3brQFy+kstfMcuNRxfOjZAsmCWrFwiG/10zA0=;
        b=gNzyQANVJlqun6Fd9J3HMfph77Fs1BOWriPU1wPNfrJJgAT0FM6PIgQw2IU/UMBm4q
         78Ndg6sjv5BJQ5VhOh9nZWC27p3sV6Fofz+HGh6NernBGgWkBVkC5atr+8GXF82oUP/S
         evKeCIybRZm/oCCvscgHZuqquZCmGoVe246x+PGnx/e9S5L+yYjjKhuadxYsn5mWaxkk
         U09d8MzXaYIVkpjL1rtkc+oXjTO2mblML8aMycDoMudFh8eMXD7ZiZCAyMa20QXZzmpU
         cNjyTO+gzS+SY0RmVquKpzGLtA2ujwOqnCvNo/LIbJGqOCvvp3idjYc7tKVF7iVJnE/s
         +G/g==
X-Forwarded-Encrypted: i=1; AKwUvBxm+HAz7PBjhYK9pRMu+F3r11jKnujWYl4JXLqFJ2BHbdheWxUHamUDeg1P87Z54PQq3a54TdiXqCkK2XQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mc8I9QZIbwbrbgJ06z2uEhN8Xd3DaJOGjK0R6RdSRrkhwuo0WE
	SiNVzwmsZCZFLHoLIJr6Jumvz0BAeMtog1CMzywvuMDsaUPdjTTtBrwi
X-Gm-Gg: AYBFou0wW6+0NyOGFBw5UPdQBSpZJwomHIY6Puc0+lvbacYcGgR4ZgtZoDrx4d5el1N
	sDz5PhyWJD1evvHkSk3Hv4Sa5VLGG7/852NzfrZOJQhwyQgekYh0S+pXnVyg2wKH2DdDtnljRaC
	oE/00QqALdDpI+p5ajQudnC+mxq5sPxeOSfJgA2ictBzaaiBxBk9osmFvnSQoIXmohGRmXv1NoK
	4qC30HY8X/ElIMte4h/EDo6Sv9L+qT2I0d2BI1YOnebdkq+d5r0sLTD7G3GrVyDmGNvLUWxmMT7
	4rfxaI6fCcW8I2I3CcmD46q5ZI/WrhIs5IzIK+jqms5wfOAWVN8eYoHVrOD6Ik6LSClh0EZAqGw
	ZTrv/8scEZMLbdqgwRaqNfsub5EwZm9mMZMRYJoE+KDUa+S9X/NVtzEIymytj7mazP19vt2yXwn
	pthyEwJ0XCA3TejZ62OxlRPBayz0L2XVbXAhLk69OGa8l4WmJqBCGI7MN1rs5iCmNrrf9ajLNxA
	RsCSO76di9FGguc3kx/yqTUiHFAVSeYEwBAAPvObF9C3vE8hq6ILEKzoZetNSrGbD25Ce8K5gLS
	mMZTy+RjGT3BtBn+g+GJLZ1xbe+EtX5MdG4hur4kppCf1ldIFyIcqbl2BHQR+WHH5kiUOvSZUzs
	nUQPPbepnmnJFCq1iyCsXPDKeL9/OspsVNtALZbWoGtk/3nKiVUf/3l/DbMngvos1tsjgxw==
X-Received: by 2002:a05:600c:8b8c:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49cf7f4aea6mr198545235e9.0.1788766166548;
        Mon, 07 Sep 2026 00:29:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm188034735e9.0.2026.09.07.00.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:29:26 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:29:24 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Fabio Cesari <fabio.cesari@gmail.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: isl29028: fix runtime PM reference leak on
 error paths
Message-ID: <20260907092924.00000e80@gmail.com>
In-Reply-To: <20260907030751.3da628d4@jic23-huawei>
References: <20260906131203.125407-1-fabio.cesari@gmail.com>
	<20260906184358.398f3f1d@jic23-huawei>
	<20260906221517.201877-1-fabio.cesari@gmail.com>
	<20260907030751.3da628d4@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Sep 2026 03:07:51 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon,  7 Sep 2026 00:15:17 +0200
> Fabio Cesari <fabio.cesari@gmail.com> wrote:
> 
> > Hi Jonathan,
> > 
> > On Sun, 6 Sep 2026 18:43:58 +0100
> > Jonathan Cameron <jic23@kernel.org> wrote:
> >   
> > > Whilst perhaps not best practice as such, it is pretty
> > > common to just not bother checking the return of pm_runtime_put_autosuspend()
> > > at least partly because of that annoying -ENOSYS result if runtime pm isn't
> > > enabled.  That is what happens with the ACQUIRE macros for instance.
> > >
> > > Do we have any particular reason to thing it is more likely to fail i this
> > > case than any other?    
> > 
> > No reason: both functions already returned that value to userspace before the
> > patch, and I left that unchanged only because the patch was aimed at the leak.
> > It makes sense to fix it as well.
> > 
> > v2 will take the reference with PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() in
> > both functions, as Joshua Crofts suggested, so the value goes away along with
> > the manual put.  
> 
> Why the if enabled variant?  I think that only makes sense in places that can
> be hit prior to runtime pm being up and running. Maybe that's true here.

Yeah, my mistake, I suggested using the IF_ENABLED variant. All reads would fail
if PM is disabled since the macro would throw an error...

The regular PM_RUNTIME_ACQUIRE_AUTOSUSPEND() is adequate.

-- 
Kind regards,
Joshua Crofts
