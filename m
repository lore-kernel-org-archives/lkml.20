Received: from a9-115.smtp-out.amazonses.com (a9-115.smtp-out.amazonses.com [54.240.9.115])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582333F8A1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.9.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882419; cv=none; b=Msy8pCQG/BPLqLDY0mFX+mcGDAQCfRoa+VIAKsLDq9PigZjUaGVTQOn9Hl+KEUqK+Yv5Xf5lMGIxpZXMllnPfZduYbXEedQ2RUB0S9+tx8lfHtZfnNRFcTPH7jWhc6NPIoizsJtRZUtaoJic50lZUn44mDj8sLJGal9JjIqmgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882419; c=relaxed/simple;
	bh=/JlVWTdwhTBUB8/H/BDtpjE2OsVjhwuSB7CifGEAUJs=;
	h=In-Reply-To:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=pnGbPJ5n3lYdhUioX/xW24PHsTT5r22OpcrkS5JxGo6M2o21YKYfNbKz0O6U4f8vRZgNfEfs5X5EbpKnDccb3y0izUywOTTnsHMaSpmCM5OrWdGg0GiHIdv0w3mkKpQFUaoUefojXmka/mBC/E5NLJ00so+/PRF5V73yvygdEQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=send.bugs.sh; dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=CMAcY5EQ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=g6mIBXwt; arc=none smtp.client-ip=54.240.9.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="CMAcY5EQ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="g6mIBXwt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=bugs.sh; t=1787882417;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=/JlVWTdwhTBUB8/H/BDtpjE2OsVjhwuSB7CifGEAUJs=;
	b=CMAcY5EQGew0r2WoickSkCurzneM+FNapJNQ5P3dGVWJgQ4k0KyO0bAmJe2+Km76
	9pz9v7sfg/RwelZeZ6hDTXYCiSy8uTiOaXN50zk5qepPnakF7G8hIbCu1zfEnVnWi34
	v0WMmtAc28S6UOpmCEIWwXRieyVFnHlepgvbIQgU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1787882417;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=/JlVWTdwhTBUB8/H/BDtpjE2OsVjhwuSB7CifGEAUJs=;
	b=g6mIBXwtVsTnkFZANAvhEVPxH/bJX7BPQuznb/h0glx84d9U8Pjva7m8koUVEuh3
	UJs36xpoYp0KZ6WiKRPgBr/nsTs91TjnW9fp8ZWLw0T0LUG3FbI2kknAYXiTsdpOPqP
	G0VKL7Rc6TJN+qQXKJUsjwgZqEI9+At/sETyYdp0=
X-Forwarded-Encrypted: i=1;
 AHgh+RrfmlplnUJBFsVOtH9kLJ8lwk0oSN1JvS8Ne92Ay6JdISXYZh8FOsoBy7KCgefhHuXZlOuvlVUo4vOEzKg=@vger.kernel.org
X-Gm-Message-State:
 AFuF++m/ByejxA7oj5chCybWStvTVTa0PpXgMA+XF9dSfjYZ/PmYaEm2
 uFe1X0N98ycDckI0yiKFAc/73nrPghjO/53/p2prhyWGe3MbnOsbY1cl9ldU8tT1Dlz8spiDtSU
 Cu/J7my00ONQOzW/C+NrmcTFylblIz4M=
X-Received: by 2002:a05:6402:27cd:b0:6a1:f8ad:6c0c with SMTP id
 4fb4d7f45d1cf-6a60d3ab0b8mr1451537a12.16.1787882415445; Thu, 27 Aug 2026
 19:00:15 -0700 (PDT)
In-Reply-To:
 <CAPpSM+RJKziJf7enrZ5FMy-uxJp1Fy1M_acVXy+v3WskU7jJXw@mail.gmail.com>
X-Gmail-Original-Message-ID:
 <CAMb7gs9wbKHRVDeTK7UDmYuaKV0B_+=tNex2FR1Drxutj9smAQ@mail.gmail.com>
X-Gm-Features:
 AcwNN1Wy2Dm4bnd4lCENNLDKILHv1rn2oosLd-oeupZdG0SaWlRxm5joLuuCG24
From: CO <co@bugs.sh>
To: linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <010001a04618ab92-cada0ad2-02de-47c4-bec7-6ca282667daa-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 02:00:17 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.yL0noGNZdXCKlJHw27bHz8/I7/GZTaYDRe4l4bGvzjPa1Q4S+kzxKgpyYIxfCxOFAjHX6QJhZdsZN1SP8V3NfEiLJ34m58z2/mmJDZ5RtdRTZ06dzneIWyoUkJ1DSaTbU2HlPz+Zb2/NZ41D3j4FLWNy2FyGjUOa4qpft7gzKcs=:1.us-east-1.QSNtDRXSTq9sAuvRl56h5mypgasnQ5yDLNpVzTnziu0=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.9.115

On Thu, Aug 27, 2026 at 10:31=E2=80=AFAM Xiang Mei <xmei5@asu.edu> wrote:
>
> Th
>
> On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Aug 27, 2026 at =
12:43:58PM +0000, co wrote:
> > > We found a bug reachable in:
> > >
> > >     path    drivers/usb/host
> > >     crash   out-of-bounds in =
xhci_queue_bulk_tx()
> > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.=
3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > >
> > > Config, environment, the sanitizer report and a C reproducer follow.
> > >
> > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >     If you patch the bug based on our artifacts, a tag would be
> > >     appreciated:
> > >
> > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > >
> > >     Everything in this mail is validated by the reproducer =
below.
> > >
> > >     We also hold an LLM-generated root-cause analysis =
and a candidate
> > >     patch. The patch passes an A/B test: the same =
reproducer panics the
> > >     unpatched kernel and runs clean on the =
patched one. Neither has had
> > >     human review, so both still require =
validation before you send or
> > >     apply them. Available on:
> > >
> > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> >
> > Please validate and ensure that this is correct before sending this to
> > us.  No need for us to dig through random web links, right?
Hi Greg,

Thanks for the feedback, and sorry for the noise. Sending these before
we had settled the format and talked to maintainers was our mistake.

Let me make sure we understood your suggestions.

# What we understood

You want patches that a human has verified, and you do not want to
have to follow links to find out what a report says. We should not
have sent what we sent.

# Where we are

We want to help secure the kernel =
without wasting anyone's time. For
the past year we fixed our own bugs by =
hand, so we know what a patch
costs you: days of review and discussion =
before it is clean. We are
grateful for that, and it is why we do not want =
to send anything we
have not checked.

What we can check is the =
reproduction, and we do: we build the kernel
at the commit named in the =
report, with the config in it, boot it, run
the PoC, and see the crash we =
quote.

What we cannot check, at the rate our LLM pipeline now finds bugs, =
is
the patch. Judging whether a fix is right for a subsystem needs someone
who knows that code, and we do not have those hours. So we would rather
report the bug and leave the fix to its maintainers, the way syzbot
does.

On the links, we would ask your understanding. We link the config and
the reproducer rather than inline them because both are long: the
config is around 250KB and the PoC runs to a few hundred lines. The
links point at bugs.sh, which is served from a public GitHub repo.
The crash itself is in the mail, and we can inline the reproducer
too if you would prefer that.

We also cannot host built kernels the way =
syzbot does, so what we give
instead is the exact commit and the config. We=
 are working on a tool
that reproduces a bug straight from the information =
in a report, so
that this costs maintainers less time.

# What we would like to ask

- the format: is a report that links its =
config and reproducer
  acceptable to you, or would you rather have =
everything in the mail
  body? We can do either.

- would a report with no =
patch in it be useful to you? That is: the
  bug, a PoC, the environment to=
 reproduce it in, and the crash we
  expect, without a validated patch.

- do you want to see the generated patch in the body of the report
  instead of behind a link? Either way it would be labelled for what
  it is: an example of a change that stops the crash, not a fix we are
  proposing for merge. Our default is to leave it out.

- the report.md link in the mails you received was meant to point at a
  short root-cause note the model wrote while it was writing the PoC.
  It was broken; this is the fixed one:

    https://bugs.=
sh/b/fd80bc5967eb22c3/report.md

Is such a note worth having in a report at=
 all? It is in the same
category as the patch, in that it may simply be =
wrong.

# Until then

We have stopped. No further reports go out until the =
format is one
that does not waste your time. 19 reports went out in a =
single batch
without a person releasing them, which was our process failure=
.
That is fixed, and we would rather settle the format with you before
we start again.

We respect the time contributors put into the Linux kernel=
, and we do
not want to become a new drain on it. We appreciate any =
suggestions
from you.

Xiang Mei
> >
> Thanks for your feedback, Greg.
>
> We are working on making reports public. Sorry for the inconvenience.
> We'll stop sending bug reports before we fix the issue.
>
> Xiang
>
> > thanks,
> >
> > greg k-h
> >
>
