Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EF35C6BF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816918; cv=pass; b=YTCXaekGExxVemAyFQfJCo7XRKpbDwohRJNFj4U8NlS6LsjGxqrFdbsC8+JnGJblgzuyExmpBu6sBbFl8r5xjPs28h6pp6gb10nOzpeYSScUhkPZl1CrrKQvXkn86njkSEGOGgpukDO+HyBCaykZWM6fs7QxDVfaTcFbhvLBRZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816918; c=relaxed/simple;
	bh=Sm/J1wtsrIqUkVPiFC4lIflqwoIA1NdiD66VgeNqNM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9/Rh9O6U8X2n5q7Z/oXrgTkO/Y24P7PnXzOF0okz5ELrZnMJxYXd+UKix2mIcNOaau6VXqwLuqniIaq7fkf9qavnHWV1Hdc1BFL7JcKj4s1lldHYAZvvjwOElw0+kam3qCLev+ZShVLUdgBGvfNTdsSvNOqWMYNeCutEhCBxpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Ya2GiaK+; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Ya2GiaK+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3403460b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788816916; cv=none;
        d=google.com; s=arc-20260327;
        b=iBdhRRtfo9sZ/ukTfEfvDGZDbgNQDfYulYjkao8HCNjyq4hv1nIeMd1ILnRH/11t0q
         v+6FWqp3wYo4GIYkS+NM+Faphdq7OFIRII16VR+fWUCNAEnTNRvwBN1pdcdehU/aUWbm
         ymC7yowCuNFM7+o1k4Qk5ROdeU8yYdHCRfpPbq6Fxpa2wEtm71AfUXYT8Y6KyVox/mhZ
         ksh9zHs9JVYC51TEuVXQNJNmAq64FmRAxVQrEVnqo2nkKoH4U6WSrUk/o/xf0voPomYw
         qiGx8rreYbp2vCO+rGnh+odJM7glTSBOhw74K854y+zAEj0bNshfgIw3Djr3BgtEQdey
         5IAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wvEN1rc0XoTqR7nkp9AN+9CTT9FOkWFzpWDnUbtpss=;
        fh=Vn2hcMpSmXOn+hMwqPYsijsREq2aI73lm14Q2TdekSQ=;
        b=KTFWt5HlU8Z8d7ag4lZWJqzwf/sHQkSqm1lEpmMNN+9u3t6OS3Q7AVO21cGIUU9O/y
         7Lx6aQh4N6e05w6ckS9wrCGr1SD5EDisLLklr+cXH3SDkRyjWVUqNkAv1BvYgrjKkYu3
         ENOAhrSK/AH8eFnHLvmEl61mF9V4V7pE+Sxtsb+IF15egtI8Di6VwHqYmBaOANnGb2nZ
         mW3JnBSEpwKIJDP5f2EnHld9/BYQoRdVsxwI0TAz0Wf2hNtIsNx2sGZ3Gj5+LAIIOHaK
         Xepb2zHisylFzqYjKHeEbGZMkhP9s2Ng8QosTI0T/0Q7KZQxgECC0LDW4N+Wv3tuZ67s
         Szjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788816916; x=1789421716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wvEN1rc0XoTqR7nkp9AN+9CTT9FOkWFzpWDnUbtpss=;
        b=Ya2GiaK+8AJTfbr9Rv7gtkxkv7uSVYAJung/9mxUEeojJcWzaw0+LWJo6Ml4+xl+LS
         IE60j2KXb8evaoWMmdf+XYG5kQjLgTiU+k5rDAFC//vXNN0dHWudX4ADHsLc8KK2ZrNH
         cKwoNPFvKGVPrris71tUrwBvGVw1E2A5aoghAfDuihO8iUTxedD5FKFvKiGmn3ce0+Zy
         DzrEnjMUYZwM4H0cDuCYbgckN/QgpnnLqx+WW1j1X4JMwsfs69mP42QkKnHXt9V13yuh
         iO08bOV+XBolOwgZNWSjtzLJYQle1ts21J5P43yvoeyn7WSdimz7KiEuM5/RZdPaBghT
         eIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816916; x=1789421716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wvEN1rc0XoTqR7nkp9AN+9CTT9FOkWFzpWDnUbtpss=;
        b=EhHQ3MgLK4HNg80WQSlHKxUY/4HPSKp+1GrQAV/i3DP7d8onN7JIVRzxHkAKk6uO0F
         VkSzDLSw7/yYRPxPPsQ0KZ2047Pew92iczRn5bnD7mOJJUZ/pd+ivpM3tGn+CdoWn2AN
         BRC1u+shMkxY6+otAdertZnXuRckEUW5OqhEy0mY+Cpn4vCH4ULg+p0qCo0+dyLiXZS4
         SPvlb6P4e5T3ZzLfnj7jU6kGFE6oA5SyVTGgDcCa3IMjKCDVHBCi81KSwwZL9LkejCkg
         h9LrGyP/pfVC5F21UJc3YwlYP6cUgv+lby03FcQ1z1/uNTtQfM3CmU7Id0KBAS2ySM/d
         aYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNxie7cj3GIF3gzBRYxPseE7xlgvV8aacv0A7IfeJRYtXPLRGFfPCNjk3tTgADdycRxiJaZ57M7seUdYk=@vger.kernel.org
X-Gm-Message-State: AFuF++moUU6xp/DMP0hNCvnvknc0eAKa4JmI2YLr08kpKeQHh4UGSq3B
	1jhu0JE/QdQFuder3MgRtw23nXtncUMkw0ZXxH/Lrrd0F+1I0dKSujivfyxd8kEkH3/lSLiwaPp
	5gOzGAxAdRcKRrG0K2q159/EntAOH/CRDBAa7Do7K
X-Gm-Gg: AYBFou0pRwaRqK0Dly3Cfy9NKvyQ+hnJS3lPbmuoztkm/KSsg/yM7Z7zmaRllI2PHuj
	lvPZIbRz5c0sVIgIMVV0yrr3ah+8nXxfhGwCGX7FE6gNjdbvptqLSHzJde4iyvwrPH1TbPbZ+AM
	qMFpdG3QzyJ1hrVeFdKnEMiEudNJ7zYTK2n/Ue6H0HvM6v+M3uN0ILPntenhOwn6JLVLbtO5NhL
	VXalT9HHXU2UZlceFY9ZnDVF/1nUavZ1o/wSRrKnXjvSAzEi6hzYIijYZa/38YjNOjZtwnunWfY
	8M9swAtP82IHXMkYf2I24j/MP+KKtxOJRAs0LNDQmLBaBoPQXsuB6ryDcopAX7yxNQOWxiovmX0
	=
X-Received: by 2002:a05:6a00:7705:b0:857:73c3:446b with SMTP id
 d2e1a72fcca58-85fff0cf277mr22406237b3a.26.1788816915742; Mon, 07 Sep 2026
 14:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh> <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
 <CAPpSM+TXw-BGgpdZtx-bH5GEQvzYHxj_wDkdPfUT3Tcn=mtmEw@mail.gmail.com> <CAMuHMdW5Zux92WES0REoejf5FO2h9KgRDCcLbN-A_kyJyRTxCg@mail.gmail.com>
In-Reply-To: <CAMuHMdW5Zux92WES0REoejf5FO2h9KgRDCcLbN-A_kyJyRTxCg@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 7 Sep 2026 14:35:05 -0700
X-Gm-Features: AcwNN1XAVB2_zHSqHk9OYAeFu6WEmpXutR6V5_IuRKLsQI6uDVNe7s7y---6HGQ
Message-ID: <CAPpSM+QNdSFyDwvPs3NkguaLsmR4iY7w01Z=WGZ0k0y8jzzhGA@mail.gmail.com>
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: co <co+5e2bcf11e7027510@bugs.sh>, Vincent Mailhol <mailhol@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, =?UTF-8?Q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>, 
	Oleg Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, cedalion@bugs.sh, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 1:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Xiang,
>
> On Mon, 7 Sept 2026 at 00:19, Xiang Mei <xmei5@asu.edu> wrote:
> > On Sat, Sep 5, 2026 at 7:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Fri, 4 Sept 2026 at 23:17, co <co+5e2bcf11e7027510@bugs.sh> wrote:
> > > > We found a bug reachable in:
> > > >
> > > >     path    drivers/net/can/usb/peak_usb
> > > >     crash   out-of-bounds in pcan_usb_decode_buf()
> > > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > > >
> > > > Config, environment, the sanitizer report and a C reproducer follow=
.
> > > >
> > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >     If you patch the bug based on our artifacts, a tag would be
> > > >     appreciated:
> > > >
> > > > Reported-by: co+5e2bcf11e7027510@bugs.sh
> > > >
> > > >     Everything in this mail is validated by the reproducer below.
> > > >
> > > >     We also hold an LLM-generated root-cause analysis and a candida=
te
> > > >     patch. The patch passes an A/B test: the same reproducer panics=
 the
> > > >     unpatched kernel and runs clean on the patched one. Neither has=
 had
> > > >     human review, so both still require validation before you send =
or
> > > >     apply them. Available on:
> > > >
> > > >         patch.diff  https://bugs.sh/b/5e2bcf11e7027510/patch.diff
> > > >         report.md   https://bugs.sh/b/5e2bcf11e7027510/report.md
> > > >
> > > >     This is an open science project. The code and the full set of P=
oCs
> > > >     are not public at this moment, as we intend to disclose our fin=
dings
> > > >     in an ethical way.
> > > >
> > > >     Happy to test patches. Complaints and suggestions about our wor=
k
> > > >     are welcome at:
> > > >
> > > >         cedalion@bugs.sh
> > >
> > > Please read Documentation/process/submitting-patches.rst, especially
> > > https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/process/=
submitting-patches.rst#L928
> >
> > I checked the document and the related files, and I apologize for our
> > mistake. This email should not have been sent to you, as our system
> > failed to identify the correct maintainers for this submodule.
>
> Thank you!
>
> > We have fixed the issue. Thank you for bringing it to our attention.
> > If you meant other issues, please let us know.
>
> There are other issues, like not sending patches inline, so they
> cannot be reviewed easily.
> Thanks again!
>
Thanks for the feedback.

The patch is entirely LLM-generated, and we don't want to =E2=80=9CDoS=E2=
=80=9D
maintainers' time by asking them to review LLM-generated patches. We
believe sending LLM-generated patches without human review is
irresponsible. We'll make this clearer in future reports and clarify
that these are bug reports and that the generated patches have
limitations.

Thanks again!

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
