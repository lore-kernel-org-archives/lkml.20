Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFF3C10B6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970998; cv=pass; b=HCF3sdDluiD78qzrZHmf4nIjCXXhyxfwRwjZ7+OzQHZ+clQWnazznYQU3481YnTpOzwsE+dyxdqBbvk1eNb/K1+eXnsQ7DB2e3ohsMKmC46Gt36snX6IKztiQ/ajB/7BqJ1YDbf6Rws/hWiEnR9CzJ27pHxes9n/FYAiICBusT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970998; c=relaxed/simple;
	bh=1ioCZTbb41W9FUOixCvFBhIck+r0y9BJGbVcKNL0CmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atZEeK9EHsjnLnFL9WDJrMhzhdJ8emEMOJskwUSPdckQeaI2Ym9LaTwQAe1JFAMmZhhY2ElmywahZG7SL3O/ei7cm+3tn9u47i7KWv2wIM7d/nCIkqf2vwUmstvl5Aus4RyE/fmxX1STJoO1lW2uV3XFaHayRU3ffOLEwvlT0qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shneLzs2; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shneLzs2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso19508466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970992; cv=none;
        d=google.com; s=arc-20260327;
        b=eQbmjYYeVQNWJPnyaq+hW1g4eaaXHYxzywk6+auCqFe8vDJX9QOPm0HggFB5PA9sA7
         VDij7FseN+qj3AyXN552k+QqHJr/m/91Hs8jURhsOcBmfTFtKrSfSIXT3l0Zl9eXHda3
         svl5oSJzSJKgQJkXPX1sCmldi0nah2/f9wI+aqUoAv8iOMHstQmAZ2NO8QjDiVSQVP3Z
         4p/dHGE2IZp18BFQWt1UhQi7fJWueIAOsjhq7YN8s768ui0rFnDjHaN9U6WG4bOtHZhx
         U+rdwEW8LYveuhpQCqTBamzdj4OlBZ+gB8Oi+RqYAat+L+Jbhcg/VJ/FOvGiR1sPp7eN
         gsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        fh=gP1JriRfE+TmH8DxBxxhhkw5J1qopg5U/unZYWTHGto=;
        b=EOsQhrrcYauGsG+RtjvN8YLSxFeARplAcQ+ppUoOcdMvdxRcvVN72UAk2VhOVg4B7I
         O4WwJx87k/h2XrIVmPPeUDywNKeblHwO2OKcqNXHVOGt0Q1xJMiHJm8jppm+aN5bE9oJ
         ChgEwB5TJ5zD1yzY11jMoRJlWexZh6+4pOlcJBWx07XvNIHaarzi9kKyZFORrum2loME
         tAEnN6PJ+nqcgcuNM94FzOSWDrc6A/uH2ghd6b7A5A5xRrv4d3cal9+IrfWrNzwddWe+
         9YztQAz+AW8gFMC7j72W6CDlklqpi+ofqZ8/wfKHUyaKME2n+8Mu+6AA9O0XYYdzouCl
         Bk7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970992; x=1791575792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        b=shneLzs2LcbQqXPDXmIKxYXwzvwAachuoY+x8UQrViCAmsHLcjX1FXUmxsAaCB+kTt
         yrQMiLHtIa8sb8Im1a+kTcoTFRewgZu9kIJmtwi5xrHXdKGzWjwFvc2bcoWWxVI4fXhJ
         6vKVtkUGPnG7NZZZQP8huarE6qJiozTZaQZc9lUq8q1zRE8qYY6K7J95RJaK/sStE5ec
         8hBEA94tN8ozciaenW2v2o0yn4HIRbFDrrV7LAp0fog4ylNqUaBDun/nAgitycpXjuhy
         Qp5oAmSxiZldk7XSYPRdpgqOPxNCZ7gsTP26qQf/cRhtXmPV1fvhGSqhb8POCYQ0edbE
         2rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970992; x=1791575792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        b=0atv/zFWkFwjnYC4CFeDnctcytHdpd7vIk7sODE0jPd084Mv22Pif0a3xjrez4w4FI
         q08wGN4KkmLvFxqTzseh2pTQQGNvDE5MDYWo0oSQ8eHND33SbsZeWsUol+ErhWSfInv6
         +J21945YYJx86GKmqOgbtg5eae6xE+ryIWp+CIUmyrtJQuqXvetulOkb+YUFx1pyaf+X
         wWGFpvyNzNr97XtCbT1Lf9Rf2zkewBFCjVQTIwAQJ6n8Uy9l5BeO+/E+muK1iVObJS85
         PXl9Dr6asBFrGxpeUp7TqjVdLyY6PAfzwXXZcq8c+k2R5EjakDMFPVp1dbY6jy2xDoqd
         kfBw==
X-Forwarded-Encrypted: i=1; AKwUvBxSe7MqgzlowGmQUHu1XljcjRkUS31qnuOPTKop4kWKku+Y/tOEGnJd99Ewz9oxyT/jAH9Golc8KzSfuO4=@vger.kernel.org
X-Gm-Message-State: AFuF++mgg2ukU+jGndOQk7bTcCtekyBRZBg/icTmsyTph0jgaVTJPSOL
	jlJKGFDDWlqDVGamrcWtFZo1AvmIlANKexzBtBWujMUS1J6YglHcnNk8iFhQdW6rzo7hP5ATolG
	+qlKE+SMfAVVoagcbuyNEph3zWFmNFhwejmbeoA==
X-Gm-Gg: AYBFou2d3oj4dLde3+3MJ6xRqYwTuRmTQTY4d//7RTNuyD1BYd9yaoMiolfLGtZMkT5
	uEzLU9rHUeIZIfwakRkJFXSIq181CH5gndeA5qtDK+qhMuNanKdVEFChou670BNFADylvtqMSrR
	E6WhT4kjruQcbxzq1OC71zgYOR3OlIZMealnAnNH0DCKvaDxKtdlT1hMXoqwOK5sIXkfucOJrg+
	agfWwIII6xik45S61ZO64MWau1MxIei+8D6Tc+6SWWUIvGDZed0HmnYRTZjC8FyEOKfaGMDt2bn
	mFt/IWXRWADSZ/FkuBfADt71RmUsk8I1vW4DTzM21ooxZAPsPNxl2G13dn5IBFp5kB1dtalD2es
	Y7Wcqs/K56Jbrlgq1RnrnU4idXAZCg0lzpJ/uoDdAfLLKJ6er4NyROfEL2ywzK+CHBlkg
X-Received: by 2002:a17:907:970c:b0:c21:9b4b:2690 with SMTP id
 a640c23a62f3a-c2e6ed18a3cmr18544566b.17.1790970992289; Fri, 02 Oct 2026
 12:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com> <arpa-Ps8l8LOwbbx@tzungbi-laptop>
 <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
In-Reply-To: <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 2 Oct 2026 15:56:19 -0400
X-Gm-Features: AclHuK9fCvmhfjw1X8Jezy7cxwwOQzz6bhBUeiEHh3Z9gHIC1eoTF30hT-F_4tI
Message-ID: <CAGEsz8G+bdyroK=Fb=YpgWvp+Z3HOGbqkTPt-dYO8u_+26_ULA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I've moved the work quiescing into
cros_typec_unregister_altmodes() so partner disconnects are covered too.

Pending partner work can still queue responses during driver removal,
so the port work stays disabled until that completes, then is reset and
re-enabled for reconnection. Final port teardown now uses
cancel_work_sync().

I'll send v2 with these changes.

2026=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:40, =
Andrei Kuchynski <akuchynski@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Mon, Sep 28, 2026 at 12:18=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.or=
g> wrote:
> >
> > On Thu, Sep 17, 2026 at 04:42:09PM -0400, Myeonghun Pak wrote:
> > > partner altmodes. Disabling also prevents a partner callback from
> > > requeueing the work while its driver is being removed. Use the common
> >
> > Would the work be scheduled even if the driver is about to remove()?
> >
> > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platfo=
rm/chrome/cros_ec_typec.c
> > > index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c07706729493=
5dd5602c1aec636cfa6 100644
> > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > @@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typ=
ec_data *typec)
> > >               if (!typec->ports[i])
> > >                       continue;
> > >
> > > +             cros_typec_altmodes_stop(typec->ports[i]);
> >
> > Shouldn't this be called in cros_typec_unregister_port_altmodes()?
>
> This should be called in the very beginning of cros_typec_remove_partner(=
),
> or even in cros_typec_unregister_altmodes(). The idea is to stop the queu=
e
> when the partner no longer exists.
> Partner disconnection rather than port teardown ought to trigger this.
>
> Thanks,
> Andrei
