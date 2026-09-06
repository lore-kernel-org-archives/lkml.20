Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54C2F8E99
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733183; cv=pass; b=rr/XBSkz74OpsKZM78xWO94D0P7Ws9OtQVVs0Rd5ABlkUDL4LTqHEBps0AcZzvRrAxxm5kdn7A28i2ufneJYeT5q2Q8lSqXU59mdIPFMOX9yIlXRQC7oCcSVjcX1z9Odb1/TpwfV0jJ7wd5rEa/iUCrSFqpNY81KoR2Xpt3OT9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733183; c=relaxed/simple;
	bh=TYQn8U4IyeaYeTAKZpJ29Jiy5z5Xq4OGVqWutqQzq/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNqgka1ajK/Q2uxrlVmIuNnmbQMTMZIOceBUF6Wgtml/pupyhbempMli44BnE8R5OKbQl+VoIrk1b81AMTe1Y7+6aRtHKsoHaIqILHxpg9g5rKsMAb05/NIbkL6Zxt7nrNXnLidwumr8KpXq5UNjGvofHgqPVjc74SwE+mTTJck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=EGy5YOJS; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="EGy5YOJS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso28755025ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788733180; cv=none;
        d=google.com; s=arc-20260327;
        b=Vk59KedSsyBqwq3R2rVbQQwFvfc1gvihYwzs2BZ62VoHzPnkhyDcg76BmBSg9MB2hl
         k2X1DvUz/2AmPTZHnB44bvotkfR4Lcn0CG81bYr4uyPDi1inWl1coSEJ6LmlIbmSSWkO
         92wPhWG3A3pYVGRCAvzFQF05H8TXRFm0QXSfg7dkPhdtHeYX4iz+KF4u52+yD9+NwCLB
         ey578iEXhwWWOBDW6LwMszKDP51x8rBdDEnlYMuNvryW6cLjlfwI96Tr8Cjny76EITPk
         G9bshHD4NTA4TQKlUB16E1M6dyKfgZrV/1iLsOF+Q2x8RSKr60+tAW5kPEtoOblv5dBF
         1SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5H7v1iDtpUxbbmGGJnlO1vSD1KFA2YvCAej4f/7MTs=;
        fh=bw93R1ZS6ljRXTpQzc++Wu9fKR+J1siXB5kb08xGqgk=;
        b=nHI8m4U3eSLm2DT7nZj+I64dRzUBGyj2l3usA8+LdYYCi8TYAVuNmVTfFbnVdEbFX6
         6m9POitgNgBendEFpdJShjnpSLwRQIsnqIXQvJ2cDOW/voBkWtbmMwtuUzXvg55//d1P
         LCUqHRlRYtVQMKb7WvDbc0d5coOKwC3S8HSaUabZq7+6x5AkSgm6ruGNhfBLLA41wALF
         tr71ZZhxDuqFwUwq82EcRm8zeuFE6KaAgteO/nZOSlvQdY6cyufbdeTIbJwfMjfAxMVD
         hECsY3iwWqVGlOe1md+sDOv9XmJzjIsJeMupjwmVTgM20svA8qQbRyyHj3NcLqrcExKY
         6U1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788733180; x=1789337980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5H7v1iDtpUxbbmGGJnlO1vSD1KFA2YvCAej4f/7MTs=;
        b=EGy5YOJSvuFB8jyT6w92SG5LSKLR5woX2n8cO/0tAdxRYC9J2UivdFLyA+VN1ixp17
         gq9XGar5jgGIvMJKjAmd8DISkg0nQDO6jyO0i6N63cWrQIVALSKmtp+BVeIDNrnKD9AY
         2md+AoQxJOG9ghsP8+/FGwWBslsNkoj6hzVjT+QQEubtIGJL7xN1v1VBbIdVvRWjGR7q
         rXBxftr/ArIUkx++E7LlIqOstoDt3DbbWVQmePtGgAJWeJh1DhABtDrzs225q2pBbsBP
         DKY1QZ9/jXhQeCHI1Rk75L7x5v9mtgrfL1rqiDVgz8iTK3nI1moppHmclk46XCRRZNJM
         DwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733180; x=1789337980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5H7v1iDtpUxbbmGGJnlO1vSD1KFA2YvCAej4f/7MTs=;
        b=oWKcs1aGxOm4oMDOhj6U5x06nhYp1CEyETrbMlQh1QKJ3HiZY1ax4KnkBA4bUsQZSc
         TT6hM0Ns9ktjUR20PYPADxsyJvkW9ptpINXSedSK7aalfkx5AdHoVThGCuvzqsD3fgyd
         I5J9hqikiwgV+QPmm1I+L18j6REO129f5Zsxp0QBMNlxoarQSpUtmUOPUQ4BMcFij/X+
         F91bNinJpHKTC2K2SKOy+zt4OQ/xgq0+9Hqqklp+StTTFyDI2gq4Fduag27xfLB62mKS
         z/it5olvh9E/Qgut8BeHtsMHtvwrMmGaw9VQddA1lHAFmtYpTg633NQ9/Rfb+PjTai24
         dANA==
X-Forwarded-Encrypted: i=1; AKwUvBwqbNmQBSlOJx+38yh53wF2EGm4gP2PIEHTzVwMagLCFRloEkUTcNHwedr2KD+2JEZlDYDORoZhUgRHPvU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqPX5HCoG1M06yodWyPnjFDhPddEkPtXrlh6f9iimt7Hplon7p
	cDvcRBT2Ec9FnYZvAMRocwJOJ4oQx96XkxoNFjPMMslMj8eL6YeNLFHo+5hDQcqGeQCwfzT6ZHJ
	y4ZgyuNU1jj4MOTmUuoKcrTaUZymE78OV0vxMTUiw
X-Gm-Gg: AYBFou0JDk97d/2n9jLIwrxOy7X+Tr/9sYc1yDUE9KRARCs9CU+UtszEMiVRKxR/EK1
	vkB8g7YpIfD347E0EinFFa4+LWs0CY6lLgoeew+CGmhvDKvjAlQnyvtwlTUj6IXVcOpaSTCaQY7
	xO2fBCE8Bb6sH+2A/Ail5b+qvp43V9TaEH/b7x/R+GWi1fQ+F2qk35C45ac9S3k79TtLM0ZDzBr
	HqehKOaaaL/bgp4rMrmnJRiO3Y0qjkgx7jXyWAEmEIW9JsNpEk8NzQiNKHWqRAVRQWRCb6XWTT0
	5mhBIlQYwXQ96DuLxM4CzjlzCzaVaC9c8ymnPDylyjQjdCvNMGjcB9Nm6HQH8xUMwbrqHq7+PE0
	=
X-Received: by 2002:a17:902:930a:b0:2d6:e074:9cad with SMTP id
 d9443c01a7336-2db1236f4femr196043825ad.6.1788733179884; Sun, 06 Sep 2026
 15:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh> <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Sun, 6 Sep 2026 15:19:28 -0700
X-Gm-Features: AcwNN1Vz2MmGcMLkBJ7T2ybLOOTijDZznSrnrJaeR0QSfMiYaCeeiqBLLSIaztw
Message-ID: <CAPpSM+TXw-BGgpdZtx-bH5GEQvzYHxj_wDkdPfUT3Tcn=mtmEw@mail.gmail.com>
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: co <co+5e2bcf11e7027510@bugs.sh>, Vincent Mailhol <mailhol@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>, 
	Oleg Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, cedalion@bugs.sh, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 7:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Co,
>
> On Fri, 4 Sept 2026 at 23:17, co <co+5e2bcf11e7027510@bugs.sh> wrote:
> > We found a bug reachable in:
> >
> >     path    drivers/net/can/usb/peak_usb
> >     crash   out-of-bounds in pcan_usb_decode_buf()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you patch the bug based on our artifacts, a tag would be
> >     appreciated:
> >
> > Reported-by: co+5e2bcf11e7027510@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an LLM-generated root-cause analysis and a candidate
> >     patch. The patch passes an A/B test: the same reproducer panics the
> >     unpatched kernel and runs clean on the patched one. Neither has had
> >     human review, so both still require validation before you send or
> >     apply them. Available on:
> >
> >         patch.diff  https://bugs.sh/b/5e2bcf11e7027510/patch.diff
> >         report.md   https://bugs.sh/b/5e2bcf11e7027510/report.md
> >
> >     This is an open science project. The code and the full set of PoCs
> >     are not public at this moment, as we intend to disclose our finding=
s
> >     in an ethical way.
> >
> >     Happy to test patches. Complaints and suggestions about our work
> >     are welcome at:
> >
> >         cedalion@bugs.sh
>
> Please read Documentation/process/submitting-patches.rst, especially
> https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/process/subm=
itting-patches.rst#L928
>
> Thanks a lot!
>
Hi Geert,

I checked the document and the related files, and I apologize for our
mistake. This email should not have been sent to you, as our system
failed to identify the correct maintainers for this submodule.

We have fixed the issue. Thank you for bringing it to our attention.
If you meant other issues, please let us know.

Thanks,
Xiang

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
