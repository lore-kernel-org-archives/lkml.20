Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6939EF2C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792268420; cv=none; b=E/QE/MnZL5o09gEL0nDOZhhNoFFNEQc3O6SadjlKWorha7eR9px8gwmUx1dCUvXf0eP9Gfc6WSaY4Vbhhbsi8fsWdDmEcZCvAPBoQU5Q8unFXyHWFh2DQBtTkgW8ByypPAPU4IIs8QQ3YUgbEgPqLjrzaihYZn58QHiKFThBWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792268420; c=relaxed/simple;
	bh=iOj45D9QjveBgDHXCRQAAzL9Yq6CKk3ChsV5jSGC1lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDXUS3CKe6gBf17M/coLuYHdbTbDYpIPsQdnya6FUXKeOCVOKnShFiJZjuChzdOAPcH2mOJwxRP0PL+iXmRNLQqATAoGJQhD+0j6Kg/nByFTIzSzML+K/3JauhC4ED3zvcH4AR2eBGC7ctv0lbq3z/x4H2aGrW7sSsXvvD6bDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YON0DWgG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YON0DWgG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so2423805e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792268417; x=1792873217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzxrQpRqiMxGfds7uvrOMz2fXfxEw8AQx180UBPaRVo=;
        b=YON0DWgGN6Mfi/4sF/8gI+tiuKKQL22E6m9fR0MR1uDgCJjG6j2gehScbJDJ6ECg1h
         dJoswkdUm2OV7xS70Lc5l8flzlAUMDEIqvzpqGS0vL+V8sHD+K4yc+dChq0SEDz5AhMK
         mh1xZqKLKU+X4NlrfuAL05HuWUads3T2UUG53H/aezXaTPDdnI3N5ygaLQaiRRHK3jal
         O+pxju9dYWCG3ehYGImy2+gznGREl6isRRhPII8zpRqBpJKtXJKt3az5+ixmZvGSE+Pf
         n9Sl8s31b9/kkoWLwe/fUq5dDpkjUY5phbgplNPL8Klt5MwmeCdvbHCrH5bklReC0i1I
         uAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792268417; x=1792873217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzxrQpRqiMxGfds7uvrOMz2fXfxEw8AQx180UBPaRVo=;
        b=igs09mFpuk/AazFSQuk9Yq+OlXqR1sR2Jz//6saFTT6EqrzhXJHt6amMCVvD3AKjf3
         UPNG+9/A3OP1YdCtaxwA8wlLG4ngt607RDVyHoxc0vrZgClZ3w1whOgU0TR28wlkPF6E
         9aJFUv9qDLYCM/vzizz9TvlzR2cF6x39un20W5v1gmrnqsaiIOobc1XeWMFL7+K8jguR
         Eb78OjzZaAwXeRwJbiPHF/D9pDMO93LVgfyarjhh+/GEq7VRtROKiSxo9dLn/M8SRYAq
         5TTXG9HXYULm1OX3FX64a3jDotPyaPt0aMGB2qo9Sp9IQUh472i+dnCfy3IeROeBBivD
         dHsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdBXYGGcbcD7wndvUX+1qjJmDBTz9RfnJGw/M7e0zP779sUGCOMswoVcr9Gwc8WaAfT1z6wXUKd9WtSbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxw7V04xS82caCaSWUuCHE6aFzXqX7BuMwc/URIQA6UKFC6Miw
	bF1o10Y+gxoVK6Bh/gtYUTzmNKQMfzLbTklepk0H5WV93dHmusuljKjL
X-Gm-Gg: AYBFou1krKY+TbB/0+yQA76lU5eiNG1YL0/ny7wlFNCcFu/+fMaJolNH9UDAEafFTzL
	aeC/00F105Hcm25ecuxcwUqEUxG5MDzuYswQsLRDG+xHJT9pjhSyWA6c3KjSjoWemS+AhRolEXF
	fxkoclT9kFfth8MdWUH3UTkUbyHrs9yecMmqP/FcH0xr/5gCk17zbeIptCaZLaEnXjleLK9d0xa
	7cmHHJa4buChDesi5r4eZOM7IT1oxAQzF5oT8SsgVYcHGMhAKRMEFJ4lo+HbNLH3HMqyBFK3VtR
	g/3e0U5QqW3xsk/ShmmhmXNWr3IXV/rmgAG4jxeBaNfKDWrNOn7vNmyDFvwpO7JxkIBXuQdLJUh
	oPLDMB2FJBL/GzXrC9UOPSMdpnYyH6Ep6yGXVfXlIAzdql8vQ7svUpp2V5GHYjhAmgHkTPrYVgS
	ESHkMpB3BLfF0yM5zTNKTDsYcFwuz/c2OGraG5Q/ophwbo2jhEJXzwWRkCP6ZUhc7xV4edZ6ckN
	Z9vzYOU5h0QTgDD914fMk1iLs0VhOamfYRUHLFN/tsEkIlt6/0Gqj9NcxTj2dD6CaTJOUsJ2ZlV
	zJLhB7YKaj62OG8qvAwbnUrzczNBiOt1+oge3TE1azw290t/elQ0cOinUP3E8o1BYkH1mTVqJJw
	pf5E/TYZzlMJHMYmgbw0atrkhD9L58d+KmPqxpm+9g6MK9l4M
X-Received: by 2002:a05:600c:4f42:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4a1ddca9066mr49709165e9.31.1792268416816;
        Sat, 17 Oct 2026 13:20:16 -0700 (PDT)
Received: from systembl0wer ([213.194.212.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm191084495e9.12.2026.10.17.13.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:20:16 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:20:13 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Dingisoul
 <dingiso.kernel@gmail.com>
Subject: Re: [PATCH v3 0/2] iio: gyro: mpu3050: add missing trigger cleanup
Message-ID: <20261017222013.3ada690b@systembl0wer>
In-Reply-To: <20261017192151.15986386@jic23-hlaptop>
References: <20261017-mpu3050-fix-v3-0-d6f29f335a2b@gmail.com>
	<20261017192151.15986386@jic23-hlaptop>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Oct 2026 19:21:51 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 17 Oct 2026 07:19:19 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > This series fixes an ignored error return value that causes the device
> > to behave in a weird polling state and a subsequent use-after-free bug
> > reported by Dingisoul.
> > 
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>  
> Not sure where signing off on cover letters came from. There is no need
> as they don't form part of the permanent git record so DCO doesn't apply.

This is actually done by b4 automatically when creating a cover letter.

> Series looks fine to me but given others have been actively responding
> to previous versions I'll leave it a while to pick up some tags.

Sashiko had a remark about there still being a possibility of a UAF so
I'll have to check that out either way.

-- 
Kind regards,
Joshua Crofts
