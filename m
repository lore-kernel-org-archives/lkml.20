Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CE469826
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423882; cv=pass; b=uynqVxulGWMVpxLjC7zhG+P9245wDuz0Q+P7rPhRuk3ZvWK1Z2dS5tfST5220ZE0mFNSHVgTDtVH+GoQUnhPE2sQCLn7ijlPsnxWL1k/eIY43dryoUEPzQ7kNiJu81FlHb6mFsMNSAVErD2SfyuykSA8UnySWbCVbsbPGYyPQWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423882; c=relaxed/simple;
	bh=NcB4ATQRCdpaieY6u4UOP1AJs6mx8wh+glgXQen3/xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJBlVQInX0G+FlAFpd936kM9sHuZweYjR5Ix32Hq4gZC8zdUbx9aEAUpGlRZ+8xuEqpaaVTKkmvTGoDtO8Kmgazv6kuBusMnzAsKyLWE6oyL2LYxRDiIC6aqdbbtjQT3z1X0l+KNHgE4MkG8VBNGyKabyEU1GGv4TewY7RCw/6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Pl6xeP98; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Pl6xeP98"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6d28aa26cso28841025ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789423880; cv=none;
        d=google.com; s=arc-20260327;
        b=h2rgGtSkBlHcm6aDYK+u+H7VQpx8/L78HhVQFAqVOcWyywlMqoh7fLAz8xFFNoA2Tu
         yBtZ7oE9NhbK6GXWActld1jWIiNXyKJfi9/F+ig0E3WDvvGyZwfVIAzhBpcSbzVMOvnl
         6Zt6T4TSyfwR/Kfk66o2iUqB8AftCaecB3NYYFfPLB5NIN3qAqBuY+Fl4p8KrADL1dN0
         nuu5XCIIace6o0ZoS4Cpon63yyj6emNqJ6Pwt8olE2Sm5DZBFHX5eI+GvSflTv1vfoOv
         AvYAHnGg6U/3pXjltgt9uPGfkT4kfJx7PDdCfq7dJ5Si3zRWeW5GCswC7D6xS8l7uUix
         RvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        fh=VVy3+3OmKY4R1U3kkm53tGjSvb4sTV5sgixqGmQ1m2A=;
        b=ahlicd6VY4Oy5xFdkv4Aad/7Mz6ZCozMDbQNaIa/aUjEGP1TLcey9PpREvPh07V7e+
         K63gt24TzzfIE7Af/+RKAAghAs6atVh2M1pIdjDGMWBFRaZaVvfGMvQGp1gjT2yGaMQZ
         XJMMwzU83LjKo/wPGpcsdg2q/v7TDExuEboepXtDB5jUGynRFjbC8U2Ge9z9aerS4LgB
         OqCKp//uwCApHs0BJmcKzcoYKhNGlX3WhiBze7kRi1fP4lmoYkrhbT1YFuRvEGcTT2VN
         tBN2CaHAYnjogkFAXkEgrjqpYI720Qj8Bzn0ImsCsjOu8JJYPFx7zXh0yoVADRqtnDuf
         JViQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789423880; x=1790028680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        b=Pl6xeP98qWQ7cc3jycgStF1pnTxIpyRkwtkrBofB9HUyfNsvRN8IGR2jvAD3My7Qxp
         fnalI6HsHR9eYiLySKfYfacaz71HqT0RuuJVO4j4s15bvAxuX6Fq41b6VxwtVprO1zjd
         VHecroC4gUdisjFdHiE+sT/AbmTU8/8DrufdCE4+PyRiwc1JyeI2e07w3r0aay1HACYU
         QbJewlKCppdhj9Efzh71YF4JPbuUXymeUUQkB5COMEfHiO4Nwr4lhwO36pLSqEdQh33s
         XgJF0iKQnc294S1+2BDQbCqmT6RI3seIovADLEQQxwWjtXc66ys/lnOxDYRcVp30zikc
         JGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423880; x=1790028680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        b=eVCDGIKajkOuhyKGoOp/m+XHYsXorYKUgbhwh79q9v+0HU64ZndAVNtjctr6JQlsyC
         5gvADwL4CbA+3A7PVdbTufF4eUeK5snHkOn3eTe81GBPcDRopZmCT4zMbCxn9/gFAUFu
         R0SeZ40A9YMmm0tV0O9YP+HzT9Abdyt6fW2w6SKWekg6aHSoE5crFqUTOmlpapo6bu44
         qkIa4JBc+/WyCt1frHcGN+TUv2hzeH0sUvY3tnOHLXIYnlfEobBDTt/Enwp7kRFoHUfg
         OBGXrw7g5/2ZbGXKR6+4XrV1Y5JS+eGWcsHXnJQqYVUS1LdAOp3YvvzupWPektZzdn5Z
         fyDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0jI7QQMaA6hdehQLVDyDBG0qLH1s//PQv9ISOhrlXxVNOjHqKkICCRP29M5o15iebus/0Vm8QKUGWR+8=@vger.kernel.org
X-Gm-Message-State: AFuF++lc3ebwP8IsH/CbThzMI4R9Wrtqxv1QPOaYa8IRD2rcRReYYDeo
	9yTjuNHe4myGtpvnp0d6ek4qVBZFTZqt4G7KsZ0X9KR9DQWpKu0iXjXhH5YxNOLKyO8hHmIDqkC
	yam3pi2eDMaYWiLYKCRTLF5DTPXeMkHbGaw5jdWPu
X-Gm-Gg: AYBFou04NtUlXOacbm48+nOfm00TXlgKiVIm7D5PWd12jSy2bRtZDb05QX8pwMO5X0c
	jyWpQOUoPFowTRnJYDfcGReskzg92EsXNVprCM8RAYKuQWDMEbn/wjktrhu7H8eJwnxDgnAFL27
	IF2wdBoq/iXoqZpvue3ksLy7og0ddPPxMe/vIKIS7tqWdcKifsy2yRXAo/LgCYWlIDbmpUgjdf5
	6H71n386Iaul4bCulXOXSgAb0ThtUbgMEZ0GP0xyKXC1B+Fv3k3zN3MbYtsbuYyxavd56CAmniM
	lSLlk0pZvMY6SjhwOwzyWsY8Sr9vkrazJGRwj6y7DTzO2wnXeQaOqeCJ/W88mfYYdZ12RJE3UR3
	GFlEz1whhxYixplt9PxGbiQ==
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id
 d9443c01a7336-2dd6c5bdd5amr99665495ad.1.1789423879717; Mon, 14 Sep 2026
 15:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
 <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com> <2026091348-sheep-showman-5a20@gregkh>
In-Reply-To: <2026091348-sheep-showman-5a20@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 15:11:08 -0700
X-Gm-Features: AcwNN1UIdONuXr8P1Zw9ERNZdlwWynOnzA0ZnFkLhlAV-42N5iBsZA8R1jXtbdM
Message-ID: <CAPpSM+RR1ztW_iCnSkYCm62VWsLYygXr2hWEeoikKk9Q8HKR3Q@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:19=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Sep 12, 2026 at 11:41:00AM -0700, Xiang Mei wrote:
> > On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > > > This is a bug report, not a patch submission. See
> > > > https://bugs.sh/reporting.html
> > > >
> > > > We found a bug reachable in:
> > > >
> > > >     path    drivers/usb/usbip
> > > >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> > > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > > >
> > > > Config, environment, the sanitizer report and a C reproducer follow=
.
> > > >
> > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >     If you fix this bug, this tag credits the report and lets us
> > > >     close it on our side:
> > > >
> > > > Reported-by: co+66c3f58096d0bde8@bugs.sh
> > > >
> > > >     Everything in this mail is validated by the reproducer below.
> > > >
> > > >     We also hold an unreviewed LLM-generated analysis and candidate
> > > >     patch. The same reproducer panics the unpatched kernel and runs
> > > >     clean with that patch applied. Use it as a starting point, or i=
gnore
> > > >     it and write your own:
> > > >
> > > >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
> > >
> > > Please just submit patches like normal, in a format that can be appli=
ed,
> > > and do not make us go to random links to attempt to get any informati=
on.
> > > That's not how kernel development works at all.
> > >
> >
> > Hi Greg,
> >
> > Sorry about this. We may have misunderstood your earlier reply in this =
thread:
> >
> > "But sure, posting bug reports is fine, but again, patches are better :=
)"
> >
> > https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh/#t
> >
> > We interpreted this as meaning that sending bug reports without
> > patches was acceptable. We understand your concern with the current
> > format, and we will stop sending reports in this format to you and
> > linux-usb@vger.kernel.org.
> >
> > To make sure we understand correctly and follow the appropriate
> > practice going forward, should we:
> >
> > 1. Send pure bug reports without any LLM-generated analysis or
> > candidate patch, similar to the bug reports syzbot sends to kernel
> > mailing lists;
> > 2. For USB, do not send bug reports and only submit patches in the
> > normal kernel format; or
> > 3. More generally, do not send bug reports to Linux kernel mailing
> > lists and only submit patches in the normal kernel format?
> >
> > Sorry again for the misunderstanding, and thanks for taking the time
> > to clarify this despite your busy schedule.
>
> Think about what _you_ would want to see if you were on the receiving
> end of hundreds of patches a week.  Would you want to see a vague email
> with links required to dig stuff out to potentially have to make up a
> fix yourself for an unknown and poorly worded description, or would you
> want a real patch, in mergable format, that describes the problem and
> how it is being resolved?
>
> I think the latter :)
>



> Right now, most developers just ignore syzbot reports, as we are
> drowning in real fixes from developers instead.  There's no need for us
> to go research new fixes when we are having a hard time keeping on top
> of the stuff people are sending us that are in mergable state already!
>

You are right. We understand how overloaded maintainers and reviewers
are right now.

It's true that bug reports without a mergeable patch still take
maintainers' attention, even when no response is expected.

We'd still like to make one last request: would it be okay to continue
sending a small number of reports to other lists, with no external
links (just PoC and crash sanitizer log)? We'd take responsibility for
each report and follow up with a patch, even if no one responds. We
just hope that contributors who know the subsystem better might be
interested in helping us check the issues.

We'll stop sending these reports to linux-usb@vger.kernel.org.
Super appreciate you taking the time to explain this and discuss it with us=
.

Thanks,
Xiang

> thanks,
>
> greg k-h
