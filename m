Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970E550DD8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087163; cv=pass; b=oFVR+JECpYONkYSqt1VoE2B3bWLPWxc8S80ImMAZ2JKyH7Cym3F7RiU/djQSlQRB6iz+4+XWXLIi6ck0OoA5xZu64GUlcUrrzlg89ipQPkqOX1HvqFKOvql7C4g3Z98hBpwZltYps4K/tm96BuxbuHmhthZkuwzXmXyGuNfrOD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087163; c=relaxed/simple;
	bh=R2qBxqr53zWYaC1RJCIbgPO5t5bIKtz6ByZLfGYSt1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HB2QalW/7KlRe4mVwXGt/oHpdcuP2vBZPhqc1PKX8g4qVjY8MLwmv0EPEIfeTgiqDCnZKdwMFie+gl1cn5IppQW6OJHOZAuiw0V1q35+UJ8U/qXfuImWxxr3xmpFrAjFqzrVNXEQu7Zl33eZgzbBwpVdU/HGiC0dTBAlAJJI65M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqKiLLnZ; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqKiLLnZ"
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9a1536864so2931042e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087161; cv=none;
        d=google.com; s=arc-20260327;
        b=i51WHIo/d04PQL+YlZMkzr8S6Kv6OFwRYObyp6P+snArR97QjCMv052umDgQQDJtCG
         8n/H4dIso5lPM0Wm0qEvPx4nr4OPk5B27AtdudRINAEgaIsEytv3p5S+q8SE9erY94Xs
         syWN1bymOHZM28cZrbLDxBWjCdyUXMaNGpX19ndFueI3LoJQ3eXuiXG93QnMH9jd6fqh
         p8lR8Mx7YIL5PrBK9Z+EMpzwVBMXI0YsYHG4+MJaId+IcWNi1poOfkQcf7ciWlShpx5c
         mWlPyFcY2588yJXq3jF5ggy8Dshh98an9jhVwH1SH848ETGDHG8kj7mg3w6D8sptWu6Y
         nhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        fh=Y6oS0kdQ1LnBo5D4mwmvRjt8xuZcPvQat2dQ23SiDg0=;
        b=mRdTyZCvIFCeR0s//ab0OOZWOQHW3svNFizY6j2e9uT/r588RHGvDndj21pKrIRq3N
         DoHEPlakiJFzAz4FZoaPg0SojVLkL4EtfG4mSBvQgpkWc4J00lpSm+xxw+SfVTrDDxeU
         1JgctZsTUl0agDYUkuo0kfyHKDzBbi/DqwXCXkOjQZipJxSnfG9QbFOmWOvRwmOvg/s8
         I5kHH3KNwj+wre1N4gfarucxXON5YolTyRViwmE42S6DCHM0O+zNknFN8fpvu84W9z2M
         Wh1YNN3+dLwRTbi2+5sZcx4p42SjRrN1Ow5uWrn9uCTNikg+pATBjVf/8sCMXrGX/r58
         iVuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087161; x=1790691961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        b=DqKiLLnZyYBsfVvfpnbFouygUXEIaScIX5urIZzGuKd/RGqpnaG0xuJq9dUDN6FDqp
         dfZKnnfbaGml17F0WXllXP5dOXwIYQzyhCgQwklDJhM6XNwGq9KFC4I/Dl3q5BKghSjP
         fmmivsNh520kHMhHoaXeTBPNH8k+pdq337pzQtcC/5j/t9t1oSFrm1HrQJQygB9lc184
         aMNZZmemJl8yzKmF4PWlMMnhRKCg/z9j+5B8DfejiGV5NHqEWdZDkBqk+Rey+H+PO0VP
         hxx1bWdFMbXbk4H1nxF+QudUVv1E83pxu2SEUx4PI2XNXKf6rcxcx3uOJa2lWyUKpQWp
         H3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087161; x=1790691961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        b=Fzw3N0HGxllQA7XIx3zS9S+z9BPkfuD3kOG4kO7B67lq9VCXIEzG9cny6BzNYG0HIL
         o0x+2UF17F1H0SkMJuWVnfZwZ/SaEzBroWneTC9J+wQwlVUnVmn3Wsbj0qhiZndvmWn9
         AxbIoZAPB531QAcGwfeV7uRUOeT0O7b8Ksuw2k+fWeGAm3XjZe/Zulbh6NI3W/gK1N1I
         PylzYaIf9KnfOuIDgp67oF3Sgvaj3VkJO+jBar5kiWYwlEAr9liNFcGjtFy4P8mL8cBX
         NlnkY+ZomRJ87oaNqqq64Mi96d6CBj/YpEYHZZqYtL+tzY6nJIYDZ4jojLXXSPDvy73a
         b7dw==
X-Forwarded-Encrypted: i=1; AKwUvBzc58bZEd+4zTk+r8Fy4sT5pmy7wnWUeUl2QjVLaDo87MJAPxA7wKe8PT8K3r4SO8/6tWTQc1o1u9FgtTw=@vger.kernel.org
X-Gm-Message-State: AFuF++lPOa+uKi8CfbPJnwvzV3mI/kwqkaNGstE9J259cEJbA5qIGvL0
	SLlswsH6mVxPu0VMDYDDOD3lDteH9BSG09mo6m2NXle3lxw/e8DzwwL50KR0H8q/dPNVNCEZ7Zf
	M/56mZhDRdzH3aYDe9uGMsr53YFSSMSk=
X-Gm-Gg: AYBFou1YaCeFMEWhA6AvhCmTBtA8Bxa6dL3MpTi2Gb/FOfs/W5lwPIxfpU+V12RqeFl
	YCZppNxpdPlZ9rDK80tP7WaVBQPWAvGWJH7w8iSYyCJK/ZMz8BFUGq/1hXPAbx6zdB5rzh+2jgA
	0S8LPHkHHNq3HgDNQySR3XCA6VfkqvhK3BwAwakhQcc6+s3BASK1seLzJtO+M11pT/weGLa09Id
	cWMBqIe4ZzVHP1MXAbYNM4ZPqSlFn2GNtD2nbxbOx5kiBvOs9WiJCRqhvLO/9KpkO+cYgb3w/Gh
	ECXYsEtuUsZX844/mgE6W06FpahYtiLqjm2jNeS03HqrO7wHQ4tvWsMrP3hZZM3+cDwZsUD5bWm
	465avIi2jU2fHnM1wal5DlkukpYGo2vVMddyyg3b2IdQ80otc0u0x+RYoQt4xVwSuhcmislsHPr
	MArExo2tuPQaBYYcJYbYZllve61HxnMnBmLPrjYgHTZipu9REc9IchwPw=
X-Received: by 2002:a05:6122:8c8a:b0:5c9:a60c:2739 with SMTP id
 71dfb90a1353d-5c9b59c143cmr8717109e0c.17.1790087160739; Tue, 22 Sep 2026
 07:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922035302.167378-1-2000.costalucas@gmail.com> <2026092214-corset-unaligned-2cb2@gregkh>
In-Reply-To: <2026092214-corset-unaligned-2cb2@gregkh>
From: Lucas Costa <2000.costalucas@gmail.com>
Date: Tue, 22 Sep 2026 11:25:48 -0300
X-Gm-Features: AcwNN1VIqNxrPM8IkvNRf8clUfXVQ1DCxuz8v2KE3ex5wE-SuoBeR4i0w3V-_nw
Message-ID: <CAFxsxbpZ7weuZVgdY2mRQJJ+DCAkDHdjwsh3eQg1NBB+9h_qmw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: free cmap on framebuffer release
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg! Found it by code inspection only, compile-tested it. I don't
have the hardware available.


El mar, 22 sept 2026 a las 2:41, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Tue, Sep 22, 2026 at 12:53:02AM -0300, Lucas Costa wrote:
> > The driver never calls fb_dealloc_cmap() after it has been allocated,
> > so when the buffer is torn down we leak.
> >
> > This happens on every unbind, and when an error is detected in
> > sm750fb_framebuffer_alloc().
> >
> > fb_dealloc_cmap() gets called before framebuffer_release() in both plac=
es.
> >
> > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> >
> > Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb217b..92412534239c 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm75=
0_dev *sm750_dev)
> >       while (sm750_dev->fb_count) {
> >               fb_info =3D sm750_dev->fbinfo[sm750_dev->fb_count - 1];
> >               unregister_framebuffer(fb_info);
> > +             fb_dealloc_cmap(&fb_info->cmap);
> >               framebuffer_release(fb_info);
> >               sm750_dev->fb_count--;
> >       }
> > @@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_d=
ev *sm750_dev, int fbidx)
> >       return 0;
> >
> >  release_fb:
> > +     fb_dealloc_cmap(&fb_info->cmap);
> >       framebuffer_release(fb_info);
> >       return err;
> >  }
> > --
> > 2.43.0
> >
> >
>
> Nice, how was this found and tested?
>
> thanks,
>
> greg k-h
