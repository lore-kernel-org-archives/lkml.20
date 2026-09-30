Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1530569F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756310; cv=pass; b=ZI1Qh858j3J8fN6zuZw+jZF8XbOzTddM3oPWArM4xSDBwxyp3biv1ZD8BwPdx8G0hZ12AviGW6yK/R71yPuV1+gGgU4DtIf/ldhQzx04DHH66KExc8EODJVm7LjD3WhVhvzWnrhm6FxgiQEuayYeopTfTvcPF+SnZsggCs9KWDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756310; c=relaxed/simple;
	bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuB0k+1x3pDeY7SsRICIOnKAuhmNj4T2GhbJDwQ0LSuNI0329Gj5pREUM/MTFtBdoTU+toUJCZBuUEnFJkxly5qZPjuKiiDYAElQBNkHYw6wKfCx6j1RJXlfY0deDuxue1D1S0OWUp9+MqH1h4Ee3ySc6smwO3pg51WCd30TL7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN3YWQBF; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN3YWQBF"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-675617094f5so1586224d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790756308; cv=none;
        d=google.com; s=arc-20260327;
        b=BpGLb11NiKBIqG8LEnetxRe27CjEHGXBWCpe70MjaRaH0Tg+E0NKPYJmI7sFogiF4/
         2pZE+t0Gx1NEQkBxK7oOcGIG2HMvT2aomKlNrjLSlI8sUMYpYL2ag5qkQ5HpYVFrXDd1
         B83c+hP/ylAIgQJyjKf/rOu10lvGTaf4AEtlKb/NnbfD6KkS/XkmIZHTPCOTigNOQ8ld
         nt1jnBfVIq3TY2IWc5rm+DSII26z1+zQsT4gXk3siu5y0zPMQwoqtguKNwcmCvXPtkUB
         lj9gKw27loBl6ziymZUkzPT7radIy5ePWQc7CXdAOKilS5hqpkZnSNeP+FRtddRIp+Jr
         PIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        fh=OGMXhloGojGkUd5hee0C5e0rAf/9CU8mi0Ab+J4ztXo=;
        b=UWhoKTK21NBnR2EoTfpw62ABlmEH2CI+RSDUIId92WDEMVc4yRbsV+zUXNeNVknCtk
         BZ9dfxQUO+RY5xGwXYibgqvHE3skYp+LTuyUCSWYcp0sc5ZwWuwmNiKxQ7JqAJ++Bs+d
         S7ZUiTB9s9q77nKNCUUaxNJ8z2H3XwOddaZovNu2l3NXUHJ64yxhw0P3CCBYd/wxga+I
         G7FB7lTkX2P0mArshgRSMyLSAgkhRdOgy7lik7OhZPkMTYmt8I8RdFS2/xclbv+TLAsh
         mUzWfAr1cMUqGkSHwa7TJMmZLVG8tvwLoHI3WV9Io2vEQq4ErrXu3qp2P5lXobs19iDx
         jMkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756308; x=1791361108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        b=aN3YWQBFFzSNAsj2eg0q4f5LCN1vV4dpYeeGoy1SLaPIt4oEGIuQUkAiL2UY6owLSW
         HP6nHC/HdouTBrIDQHQv4zry8n+5Y5NpqHBtLoJBT52DQoPA+5hAJ8rPyxI2VJW4EtZk
         jGAyoN72oGmoyfCSaHITqcqEQZ6Th1ksQ+J74Amkqzf9Ds3rEyofk1UVQjfFQaGLD/BN
         Vr4huwQOWmUGE/2HG1WaB58TBiuwG9cR1kYKOmqHhGpX79TOFo3Zr1wC/VlYOQpivnpq
         R8xKB0p/hAmZOzVMFleusjB3rZjbah13jrfiTpfMZcPbAzDcI4iZwO5Akx9RovfMt5cl
         vhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756308; x=1791361108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        b=U44lF/hq3isIxN35MznW0PGAhqj3dVg25VjqCDsOiCuZNSuPaFVoUOn3/g8i8T7383
         Or0sC/TSk8tTfsXk8jftIaLTuiSFp+dxWQdkd6v2T6ZbBUx8vLradEjlE3u7jT4KZ6Lx
         NA6CphpI9ukQD21HR7UpK9EPX5h2PPtmFZqP7+CjHR5gzgzg0obFiHgsmzYZT0Tkd131
         N+63/i2JOMux4A2PEbVIJMGBfhy3bR/0iDCAJnthyXi1iqL1DZLVYEBSGkJ1xpQcxPZ2
         vvxth0le1RHRbHiD/X/9q4Jnna7ia7hKQKv8B7l60rPVx80937yKJm4xyAzqv8ggQlqm
         SWsg==
X-Forwarded-Encrypted: i=1; AKwUvByhJyn6y/Cq0WcZBOmrZSrIf/CJ7ISGqkNiBFedukgluma6ED8t08NEkfGQfuUWjzyAA7hhDItZfonI2Uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgCP6bjUJDh3YZT9kGtGgAVRxYD674sBlt9tTP+odCz+PpUt6K
	OhAmRIAR5XdgY8xiyNg4AtlajeQws3CvgosGBVcQnHtC1AVDdqWtxSDLCojVciaaSGrsLA8IrIP
	qQfKfGbYz+VY9OZxO6KtCQCer76KCYh4=
X-Gm-Gg: AYBFou1W0wLSMgI4tfV7+JXU5TZLjjWoyxeNgeV3YpyxqYb8TFtTPykhFOnMCIZiQT+
	1b9mVfzIEFQWqOD5CmdgCEhjYGiYTEKBbA206XySpZIfRzipPNAT7W7VUINnAtqH7P8Olldl1pw
	YVZUz9w7n/n71ERKZF98iN93URraIyTTJq0IIhDpfrWF9+mU0EzfysYuxWWJGjCRQwAb88csgbB
	hek1LETS1oBcYLBSaLkIxxPn1iSeBCHyMpMmudNkR8xPVTAQijkaF/wBl5zoG9bRSqFGD9yDq6h
	Tsc8OeG9Ydr8LCGsmQJo9rhfbkiQfRB/3P5I4Z2ftajHg0bvzSJaXTft/DE57b0NkcX4rRy35wP
	P1iKKWa/agcQ+QKyXNCAIbdVVcqoo0VwWTH2mTBi4MOaj
X-Received: by 2002:a05:690e:13cf:b0:675:47ba:21a4 with SMTP id
 956f58d0204a3-6768349bfd4mr308769d50.47.1790756307994; Wed, 30 Sep 2026
 01:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
In-Reply-To: <2026092925-licorice-strode-7905@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 30 Sep 2026 13:48:14 +0530
X-Gm-Features: AclHuK_fQ9URWr_ZY4d0cgR4NEkNAs130gJ-YJ8xBkGvtj5OC5gTvkpWKLx5ddY
Message-ID: <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > u_audio_get_playback_srate() unconditionally locks and reads
> > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > without a playback direction, this results in acquiring a
> > never spin_lock_init()'d lock when a GET_CUR sample rate
> > request targets playback, triggering a lockdep "trying to
> > register non-static key" warning.
> >
> > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > before touching prm->lock.
> >
> > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate =
getter")
> > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
>
> How was this tested?

I have not been able to test this since there is no
repro present in syzbot.

I verified the fix by static analysis of the call path in the report
(afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
in g_audio_setup() that uac->p_prm.lock is only passed through
spin_lock_init() inside the "if (p_chmask)" block, so it is left
uninitialized whenever p_chmask is 0. Leading to lock splat issue.

This patch is compile test only

> Did you forget a Assisted-by: tag?

Sure I will add assisted by tag

thanks

Deepanshu
