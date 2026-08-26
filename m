Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928ED424664
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750935; cv=pass; b=HT8rthlnFkfU38xIFoeWRLisvv+aR1ypdxx3P8Xld2MNHjG4a1qZEUYs5XUg5Q65Ujn4Ag3QcTRBMFbNdfkXsu7+gjaGMdNehX6NQ0fiWuHk18Ws9v8wTQ6WMf/ity9aynMkYozPN4N5g2mjmgcTjh76/vOWH3y3LhMk0tst72Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750935; c=relaxed/simple;
	bh=+VLTGuxNrZSVqZv6ytH0WhOOdBFfC+XvJLF1f1/v9Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTnlJr0iO6xjAweJlF/7XLURKpnRqIYC3U7KVslmioIqybyNrZ2mSuyQCy89NQs2ZSQuzK56rvP38YrKnImYBO8K8rR6SwN+nphyiusbZJIZEyXz/xvZPBTTl/F1iyxSgDyxphcEnnXsBs3UlIqlAIXcmgJiHOS1QyNLx/g8GYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QlZIfvXU; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QlZIfvXU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52b3934af3fso10374091cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750932; cv=none;
        d=google.com; s=arc-20260327;
        b=hvzPBwO/Oyh0wnia6VugNJ0ip/tQYh+gar3NjdzjP+u4rt689Pgs4GR0jAadR5rk/p
         OUs/Y0bojf9f8NZ2QAdRhuWZp0Qawf4R+VMFmJFt8FnsYx/pr7Rc7oOE2xo+KDabcony
         txS2+xSFxN5d7zYVtvOmnGGn78EprSsAjao096BQUK7uKmytTUVDP6FwFi2ZkvWv8Q0h
         wT++cULCitmG5qszPGNtA5TnD/5UrslMeAajb8Tos1W2oSy722M2YnnXZukV9UDwBbEN
         cE7YWGzuEsr8hPWlioD/vwlpPNiK/4vXdvLzEYHZ599/1aDKFD4Z/hBsr6PR5Ky229nn
         wKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        fh=Op1oUFABTP7poFtWcAHTCaLSosuqPOwqO0N0SxDiFJk=;
        b=A1Qa98uHUTuqgc4dJK7WGWl1gkke95Blf2/08EZfONNw2vdHg+QMHc0uxmcRL1x9OU
         dU4KPQumvrjVOCbAJHa093hHyhPWknoswCRFXAQ9WBEoPM9ONy9uv26VFwBzf+tK8/Z6
         gBFjhXI3yOoqYfhEMqTb3LacXVWH2dusxV8zztuPnJFA3LGWGz4xvyUyKDh2j8GqI9HO
         DI8qUJMeFmGfmlljS3E0PgQGO9//qAxd32w1bQ1vvZ2dYmJv2RTfW+utBOyrANl3HPf5
         It8AC/t85ATB3p0B5dwdKHmY12degc+KX+Q32dY2WyjguWHA+Edin3sqSvUVK+i3rOE0
         4J8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787750932; x=1788355732; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        b=QlZIfvXUawWCxHu1ZlH0mKK8reGfbU02xu36Pbg7w++0WpZuz8zaAbzD2huK/gbnDA
         2Le59+0835uTU2g+8t3Ij5oGMn3VOh4aH8apOCVPePhH7HNMzFEo4HCzin7dJvM45+9n
         03VSa4D4HEDOZ7YaorG1d7meLs8HXwpTHgq/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750932; x=1788355732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        b=qtV1NSxijpcBxkicZhWimvnDRL8YiGpQkAoDmy9LDhEPPDWN3LtZnJj4JV1pEeXPMG
         eA4D33lRfA0XDqtvMBUQ3zYiUlCrr14EA2bkZo1udqEnEBb1RxU+cIQXzl0lQXvw1Bo9
         4zDiha1MxOC42F40hMh6S6KSgd5kTBuIPYQTpDzsXA+Jfy2b3o2rP2TXSozO2EzUcDU1
         k7A9p3Cyh8hEMlGisoB/7fOQGv7wIJKRATztXJi5NPiVtQU7FQp58JAiQauE2ArOCuuK
         LHfjaVt4uBbXEXXUQ20JV9E5uJ8DY2TO8QrGAc5EHvOMRKnR6bCUpRtb+NQPmxcQXDjM
         GDWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVo3a2G981d5FpFZlIk8KQiYS5aoeT3DhN4oIIYWWpOU6ZmMDlTuBqTjTPHvsTZVlea2FvOuHmAjjy8qQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n7h43zheMKaXrTi+4zSPllrsAVAlzXiOEAjP/ERO4esSHlm9EI
	xZaljAz+K4J3g3uFhsHU0FUcsSmmF1blRRjw8aeKjaDP7mphUSCuWNT/gZpoCBD9LkGlZ3r1YGf
	R2o9S3NMSu41V8e3M7GjnrWBkMPOnCynyrSxRHhIV/8RDqvnTUWlZ
X-Gm-Gg: AR+sD12cO1NLgSvnO1lurvnl6YfQ+znhCLeT+0y0KPdSJjOK+pEGw9eh0wfug9Y6o2l
	3pzyIL6eYp4KLun6clQwFppFO4kmzZ38XdnXAfrXBcA0OVLihgEXY9/A+nOPPdqbWRq+Y9MOE3K
	NGAm5f09uKzX9lPX0+wNI7V5DlRJtTjztG7/kO5iv66kG551ugtIbBgty4Ww8k94xWhOQBlx0F0
	Jy2xj6IcgwX1VO2PxdSQ7FTRQqn63iDnG7/62S9wCmGrySvUv6qyYjcvGjHM0CUc/jomGShw73W
	Tbb1xhZPRbj5b3dYQqbEPtQK4q8kuvxKTD5exCvYtaeks59BfrenVtidbH6iG/KoHPOuDMZ7+en
	YuQ2S4aPrp2n7PA==
X-Received: by 2002:ac8:5e4c:0:b0:51b:ef2c:7bf0 with SMTP id
 d75a77b69052e-52e423dda91mr62183301cf.35.1787750932189; Wed, 26 Aug 2026
 06:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9650a974-ec3b-49d6-b6f8-89159d399239@mail.kernel.org>
In-Reply-To: <9650a974-ec3b-49d6-b6f8-89159d399239@mail.kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Aug 2026 15:28:40 +0200
X-Gm-Features: AcwNN1W34QF2PZAcvy3R9PLtw4HgRT6ulwuI-xiElq-21GqRFQaQZlS-b0FIZNg
Message-ID: <CAJfpegvhRK8QqRM_dsdNAxyEAGBNR2iFh1mOtH50QC0gMKyiag@mail.gmail.com>
Subject: Re: [PATCH] fuse: abort connection on /dev/fuse flush to prevent deadlock
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com, Kusaram Devineni <kusaram@devineni.in>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 19:30, syzbot <syzbot@kernel.org> wrote:
>
> From: Kusaram Devineni <kusaram@devineni.in>
>
> A single-threaded FUSE daemon can deadlock if it mounts a filesystem and
> opens a file on it. When the process exits or calls close_range(), the
> kernel closes file descriptors in ascending numerical order.
>
> If the /dev/fuse file descriptor (e.g., fd 5) is closed first, filp_close()
> decrements the file reference count but defers the actual release (fput) to
> task work. As a result, the FUSE connection remains active.
>
> Next, when the FUSE file descriptor (e.g., fd 6) is closed, filp_close()
> calls fuse_flush(), which sends a synchronous FUSE_FLUSH request to the
> daemon. Since the daemon is the same thread that is currently blocked in
> the close() syscall, it cannot process the request. The FUSE_FLUSH request
> uses args.force = true, making the wait uninterruptible. The thread hangs
> forever, eventually triggering a hung task panic:

If the server doesn't reply to a FUSE_FLUSH request, the calling
process with be hung.   It could be due to a hung network connection
or whatever.

Is this special because sysbot was able to trigger this?   Why isn't
the fuse abort code taking care of this?

Thanks,
Miklos
