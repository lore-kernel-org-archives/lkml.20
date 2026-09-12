Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FB3C2BA2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243771; cv=pass; b=XaTKT5ozOzzqa4D+kBocZrYlTxqZ37LPn8rOY7E1+zWzqMkFX1NR4gy0H92WX2wMQvCwAQ4yQzQ343IYuv9I/D1ZKksBBdc3Dgeujlg74Ul+81BcZ7bjYSV6jom4wrInbEkd4SqvRlrjM2SE5KeP6TEC+xi1NUxrKPWiqAGc1a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243771; c=relaxed/simple;
	bh=n3MqhRx/mXenvMytp/ni8E7dPCtfLaiHE2c3yHtK4ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROyQ6dwST2HGdFDGjnDMg0+z/TVH2XLi+fym7q0MfwZeUNiuHgjJM22CI5XatXaWhGWiSq2/vykU9y/aRTutnbXb23xh1YN0lpJ8YmaeJkDiBh47oer5R/WxG4X5y3pF4jXTfZCVLiVIzwMJRXef0zc2IlEooh6KOr4mOmq+h28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Pu2w6QjS; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Pu2w6QjS"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8625b35df89so47379b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789243769; cv=none;
        d=google.com; s=arc-20260327;
        b=c812x5ove92GaSX4lzCwiavK2MdmpB8AeBu8ke0WCJk4KAPH9EL7+/eHPC50GjEm/W
         qUUx6aRLRG5KQ/WuRbx0bSS4cN4IlgrYSTGvYG9RxaniS/8tYPXCF0hvmg+svNWQJoUX
         AzdW+yMrsS9/+UBkjrjJO4+sfRMwGC0pXDLnGGZ7KTT+Zv7H63eqGz8hqNtHhEc4KjAd
         ltiZ15xH3MQdFozMBIsPokH16T52rw6s6Yi27vTM+3m+ZYZs8nMZXTB9FyeudQ5WD5E1
         D9Seu6wXUGDHExcxOq6jjk+qnUB3cK/7n9EPMz6osniOQ8NB8d3IjHTlMPb50PEck4Du
         fgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        fh=kMBqXC4TyBeUOLjWFrWmb95H/LP+zBZ1LgmFnxnixVw=;
        b=rNGZqL7sUHOTtrFY4CA0gsEJAi7DoYD/HjPAntoQ8z+LLi6AeoAsRqApHFVQyipba6
         DvYjlvC3L+DAk8oDfv+er2BlUm5MCahlcPuv9Td8xOP4USaGFjZi6W79E9swa3IENQye
         rb3ChirLUVxo4v64KPaahoJPG5PubwKD8ZzclV77DyeZwuC00RhXAB5+pWJvy3DdxU2l
         IYph7qnS5+7Nc2mrWMhQG2IAmvPVaAW301h7sFQoTFLdklyTALJHz6updcbXtTuOXnDG
         JP1e2PlkGDOJJO4CMH+dyZ0/IfoiCqffh22MbXpx6MiTL4BfPemKHg++FFKKnlFl/ct7
         gJXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789243769; x=1789848569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        b=Pu2w6QjSjr7W/fUpQJmQ5RUyWMljxt0bHbeptdYU7Q2jv+nF0HexMBHMvNh8L2yPoJ
         TiS6VjhVcWtEIiK7M+RnyX814SoGVi04iVOfo8VRuDx8zAmlM+SxEWqg7Lt4i+EGmuOO
         rKWtaApxAKPzQHOvHLpySibQZqqjpGzv5y8IUXFrpRr6yrvVKAM6KDWuzayM24JDSDFl
         Ghwt/cmZMYGNsJJsy2EgzizdM91UvE5XwK8KXNeWrK7DxcEg27X71rOQA2HcePv01srH
         ccoowyhkoAmVSym2f1xflXIUcTrzA7pXReRvw2ZBQH2H3NVMJA5+l76d48H4N67m7eFV
         6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789243769; x=1789848569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        b=NZKl0r4AuEh5EmxJiTz9mtQYJqKR9dAj3jIeGhJo1i6fF3ysFA2zwx13h419yRF7It
         ECc3AOSNjt5K+WvbYCKAKxnptzR2FSjTHuSAk6UItVMKNWjvdm6ctWc9ye/8+TYPF3sM
         JU0hqfzSqwXJF9Qno5yg6LemYEJZtaDE2bj4FJ5sD719gd1XwLB/kDu8WzSfYgDboeYy
         jfBLr8LxcHVpMAE4YOuoAdLgvx4zjTyM5+AEwE/C5CLCKNeSd97qtT0T+sxcOV12hj4B
         dk3aP7WYeHg+g6qKFc6fqnHjX+zrP9kvJy7LMCXyxHZ/tWcDBcD0mFJGNO4Fx++GbdLa
         e3nw==
X-Forwarded-Encrypted: i=1; AKwUvBziUCPJtkd63Mfipuh2Gei7LpdPuxstC4vXxEc4gxuqiFLU2q6RSR2SgTnVVoUOXNUDWxU3XGvTyjYkuSc=@vger.kernel.org
X-Gm-Message-State: AFuF++lhwVLiefTC/AFfOZomW+ZhiIMX3fhRKtjwDimTdGHVW7PSdfWm
	2oydE/FitmCkMpPNl5VpcJYz0nj0QoCuLPr/LTOhscnJTpcuOr/XWRMF/Q6BwN0JtqBRVxlCcpO
	8ZUTd35gFIePHOXD9DdkdsSfSaWHWRQzENBXKW22x
X-Gm-Gg: AYBFou3Q6S6RagBAIfarM34gS9CQE94nZgC3NJW94nyDajqHz8Nd66cRgWTV9z/wHCm
	9Z63SgnOp2m14xriyLppR1kyU0QmMU0MJxDXcB0WbrXa1LCFTsgybO4eqjIo5VnMe1hV7w+c2LP
	qyBklH2jH+fZmlIs5KvnBCLB4flv5Sc2lq8Urxboe0Op+/+kbOvH6y+jCCWBEBDCn5R6AueJFkz
	cQEo9anP0ryLwLGUsQmC6S+viCmkpNkSwbHHjooCypCrRmgVAm3SYTQ5/IIVApKdMCkeJDWN+Tt
	txtd1vnt3V8imjBp61UwmQaaiQ0sS8jUGU/bs8nh8wyYMMmh/seCDglfBHxCKGeU4/tNpGEkTx1
	ISG9V2nuEg9Q=
X-Received: by 2002:a05:6a00:2304:b0:851:8bde:7861 with SMTP id
 d2e1a72fcca58-86b100bc308mr11287669b3a.1.1789243768860; Sat, 12 Sep 2026
 13:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz@bugs.sh> <87wlsq1lfa.wl-tiwai@suse.de>
In-Reply-To: <87wlsq1lfa.wl-tiwai@suse.de>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 12 Sep 2026 13:09:18 -0700
X-Gm-Features: AcwNN1X1dMySvkFBvnf6VyEpz9GV0R43A0JOxk9_7Dhsosx5Nt9vYTNCh5NQHsE
Message-ID: <CAPpSM+RgpkW7dxWdX0qr0kjVATYxyx2GT_ZD_mgpD6r4WetQJw@mail.gmail.com>
Subject: Re: [BUG] sound/usb: out-of-bounds in prepare_playback_urb()
To: Takashi Iwai <tiwai@suse.de>
Cc: cedalion@bugs.sh, linux-sound@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 9:31=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 12 Sep 2026 04:09:23 +0200,
> co wrote:
> >
> > This is a bug report, not a patch submission.
> >
> > We found a bug reachable in:
> >
> >     path    sound/usb/endpoint.c` (the overwrite) and `sound/usb
> >     crash   out-of-bounds in prepare_playback_urb()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you fix this bug, this tag credits the report and lets us
> >     close it on our side:
> >
> > Reported-by: co+8eacd4fa193b1b28@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an unreviewed LLM-generated analysis and candidate
> >     patch. The same reproducer panics the unpatched kernel and runs
> >     clean with that patch applied. Use it as a starting point, or ignor=
e
> >     it and write your own:
> >
> >         patch.diff  https://bugs.sh/b/8eacd4fa193b1b28/patch.diff
> >         report.md   https://bugs.sh/b/8eacd4fa193b1b28/report.md
> >
> >     A guide to taking it from here to a sendable patch, including the
> >     trailers to add: https://bugs.sh/patch.html
> >
> >     Happy to test patches. Complaints and suggestions about our work
> >     are welcome at:
> >
> >         cedalion@bugs.sh
>
> The suggested patch looks reasonable.  Could you just submit it in a
> proper format for upstream (after verifying that the issue still
> happens in the latest upstream)?
>
Thanks for checking.
The patch has been tested on the latest upstream (tiwai/sound.git).

And I have checked related functionality and ensured the patch fixes
the bug (to my knowledge):
https://lore.kernel.org/linux-sound/20260912200530.1955491-1-xmei5@asu.edu/=
T/#u

Xiang


> thanks,
>
> Takashi
>
