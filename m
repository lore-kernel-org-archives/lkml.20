Received: from a14-57.smtp-out.amazonses.com (a14-57.smtp-out.amazonses.com [54.240.14.57])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A0339399
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.14.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692569; cv=none; b=k4udciVG6m2zhCeBw30bz7ARCgcRw0rRKnsCbQiPomQz3n5TXTktF65+a5yjoFiGXS7fz68YXGTX0hACLM/SRYAqOCAzeuGGOAY/Ax2GN9r9yZbbSx+ERCK/yAEgkN6eMXzfUuvZ+XX5F4g6No3VUEJW5IBu2CHLfRr/kYQlrxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692569; c=relaxed/simple;
	bh=4feoQCNVJ9J2oahpqyBpgAsCLQMZvyiLjOF5pjK9Isw=;
	h=In-Reply-To:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=I9WVSu5xg2Mcs9XC05Wdq00F/fMDQYFziFzI06dQh3nn7HLmFgwpULvJ23RvD04yi27d4lHCby9IXIaJvltD9X6w8W3RR5jCdD9ObypJA8mkBL7vo+J6luSqKrSpRCTxar0K/8CnBRuvf6WDXmrzErEtaw3skoKFbSeKbSY0V8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=send.bugs.sh; dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=qObk/+s5; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=RP/Lv9Xy; arc=none smtp.client-ip=54.240.14.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="qObk/+s5";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="RP/Lv9Xy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=bugs.sh; t=1788692567;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=4feoQCNVJ9J2oahpqyBpgAsCLQMZvyiLjOF5pjK9Isw=;
	b=qObk/+s5qVwNzRdl3mXsawRzYrymMlRbtd9Mago/cnlp+EzANA8lI/AzyAMxxu2b
	8zn+uHgcbSWnlILpNWex2YGmA4lIjfZpyFa5RefULbG7HNmPHTgdfnnfJcCh3kexAwy
	g+g9qmeaqVSJU1T3kBlk036GoUOKIDfoUTLXG5o4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1788692567;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=4feoQCNVJ9J2oahpqyBpgAsCLQMZvyiLjOF5pjK9Isw=;
	b=RP/Lv9XylnfFs6rOweJW2hwrMQSz64bVEN3YZmEUwCoAB0hbXFcQA4eHt4yhrVs6
	dXeiKyO974oFREljrxx6cxMe/k0fC73DujL+ZJhZS2s6bXxXLiIQQg5UXOutjJFfa6W
	z3mZpOLiohpgwPGMrNcB+8i5j9mOVKO74cfQruoI=
X-Forwarded-Encrypted: i=1;
 AKwUvBwq7RmYQT4iMbNaQfdIhtTntKuUUNOkG/sZDKJHCxuBxQtcR5wmo5C/cqyz+KOdiJKxxZFOdNUDRXbaHsI=@vger.kernel.org
X-Gm-Message-State:
 AFuF++kp1tkJzny6Qk4dFYFVXqT9eaWMMNCTqlPYwo0D2YQ/QvZnQqLR
 D5apYbNJmgVDOnNBEJr/jDEQy9Jd14U/v5c6I4FMTx82wG1iLFXnUVX5etnJi5mhHg4K1H/gmzl
 ANrK8SalTjpvTD6DE3lpIhvhmO2Xhz7E=
X-Received: by 2002:a05:6402:3819:b0:6a7:ee55:dcda with SMTP id
 4fb4d7f45d1cf-6a7ee55ddb2mr4604219a12.41.1788692566019; Sun, 06 Sep 2026
 04:02:46 -0700 (PDT)
In-Reply-To:
 <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
X-Gmail-Original-Message-ID:
 <CAMb7gs-C0PpqJ6ixMeoz8PXaLd6+7WY3BS4srLGza4G4fJ6bGA@mail.gmail.com>
X-Gm-Features:
 AcwNN1U6ph0YcQrKA1PISLuvbcjZNYhUcVvuWoTrrhYYY1PS41fYVNW2cVaZTwg
From: CO <co@bugs.sh>
To: linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
Message-ID: <010001a076629601-12166e18-13cd-4852-a04e-28afd876a461-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 6 Sep 2026 11:02:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.yL0noGNZdXCKlJHw27bHz8/I7/GZTaYDRe4l4bGvzjPa1Q4S+kzxKgpyYIxfCxOFAjHX6QJhZdsZN1SP8V3NfEiLJ34m58z2/mmJDZ5RtdRTZ06dzneIWyoUkJ1DSaTbU2HlPz+Zb2/NZ41D3j4FLWNy2FyGjUOa4qpft7gzKcs=:1.us-east-1.QSNtDRXSTq9sAuvRl56h5mypgasnQ5yDLNpVzTnziu0=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.14.57

On Sat, Sep 5, 2026 at 7:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Co,
>
> On Fri, 4 Sept 2026 at 23:17, co =
<co+5e2bcf11e7027510@bugs.sh> wrote:
> > We found a bug reachable in:
> >
> >     path    drivers/net/can/usb/peak_usb
> >     crash   out-of-bounds =
in pcan_usb_decode_buf()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7=
.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"=
)
> >
> > Config, environment, the sanitizer report and a C reproducer =
follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> >         patch.diff  https://bugs.=
sh/b/5e2bcf11e7027510/patch.diff
> >         report.md   https://bugs.=
sh/b/5e2bcf11e7027510/report.md
> >
> >     This is an open science project=
. The code and the full set of PoCs
> >     are not public at this moment, =
as we intend to disclose our findings
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

Thanks Geert, for the reminder.
We'll learn the documents and make sure we follow the documents.

Xiang
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- =
geert@linux-m68k.org
>
> In personal conversations with technical people, I=
 call myself a hacker. But
> when I'm talking to journalists I just say =
"programmer" or something like that.
>                                 -- =
Linus Torvalds
>
