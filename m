Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DA37F8AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455034; cv=pass; b=ruknADEMGv1seZjZX5Uzyd4JWNZUM8O455LK/hLvma/sbDCB0gg8/Ap3W8VtNSxyBFH/dHSvnnQ9h7aXXS1I4pPyRzupvlk1ebNFV+Y3iNNXWkaLPznYhx6BjKWRAMfLF5RD6yvpbkGRENozoiVsE4Q426AtVjem+oj4Yv824mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455034; c=relaxed/simple;
	bh=/cm5odrc5jOZr97bScSICssJT38q9Jvn7//m2wToIzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpcePBrVn5FZ8i8TU974/e6Pxm0wzcO1H+mIwKmyVZbQfbF+gJIMLdn9lZ/0pWYvTwGNfixbQ+04L9oH8cAiM4rCjHJArIRe+XtX+i9ObUSKYtvsjjDcL1mzdEGZ66ukcPkjLgOye/I/RyvgNQ9iL4aLXBVqQxBZcvT6bewi6nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=kz9LaD4X; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="kz9LaD4X"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so2398154a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455031; cv=none;
        d=google.com; s=arc-20260327;
        b=FuZT79hFJb2Z2Un6XwBasLAxaRRUaPry1cMW5hfvPiFf8pH/CMccpvcc3UpZMuOCqd
         GoFIA1ZLnc/4MaQ5HBu6P6s+2sIo0AuaaqIq3scLwlq+ldIzL7J32oOWDRDhkHGUbjsQ
         3RKgID8uSHcDXDSY2cLYRKJ8Sf7YOfzhTXwSvoWvz03OvhJ+gTRegf+NjO24mgKC/JY2
         MK9gMBYwy90pBEHqjOfLYvQDy9iwiapKhw4u6Mrmtvsfayx4hxCzRf9MCq253U78twvo
         Llqg9pJvkTCX1gcK+85xsTTDQKki4smvV5ep7K0fyJtsEFBApGkiKkCvC0f8M2TX6GVP
         67NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        fh=q8YMmj0+HxtOW43J7ex1Nrp3HWClx9jFrXZu2ndyJdk=;
        b=D/8/PhChT9Uag2ndV4EyAN/as8AG4Qyvij27ct2MRHLu7k96xi5sFaNpHgUr1/El2S
         6uGdj9NnvLT61VFqCkAQso+Bmr4n967udlflXeapX2Z2dESrG2R0uwQ0S3RJq9rIbh+c
         t4q28eZLYep/bGp3E3WIU3ltmUnFYnOlG4UZ2e0tJobMUfQEKRwM3lC5i/QvGpBDqLHb
         SsQ5htvyyeYyvfRjeR1wlXsYF5fhy3LoQds/bwXmGZWW9oUqq28VX4viUikDcuw7R1AW
         XFGu20Ty27Wj2etFFELhwa6ayxUrZeR787HwP/g67bUtlgcpB01Z1kVl9vQZZysQIGN/
         /GAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789455031; x=1790059831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        b=kz9LaD4XIcS9ab/SpG2XBrdC+Ij675IAXwYnlBSgFxEq2eZmLrRsPAyvm3AkzMBwKY
         Eud6iDDXMnW4XZZa1BmuH4lLi8Xwh/yFsEBvBQpEOoQk4/1oGFcHo7ahvgP9vYaSYrau
         pHTkUBADqHOM1U46EsszbmtKEGokBxtbbPHQ33j0bwhBW75wwzPJDEXPgzokiDLd/vJo
         vkQUvruxFzF1EdxECR1b5W7wElzHcOf3ekDQ/AF1zfttfhXbSnl02Dya85p+nmfcrN6Q
         ibMOqafNP+dsqyFzzbAL76akjn4kdaQTi2EMkn5xOnE+DgSHzNTB19XBMQkALESdpPN4
         AyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455031; x=1790059831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        b=yba0w4mH6NUzyHz6AuNpV+5kAKIxihDB1v9uGIaz3kmAqDSKKjqohrPjeYKrMpD3st
         mFgKsj8SAa2nK1iOHT6y3WJS6e7boj4puDz8VW6F4ihWXLdgJLBspK/gZYfDrDWyf6Xb
         HPWwo8INB657XFU0jyLXZYOi9xJx/sYfTanLmx6OvEx6fwuZCHm+mZHg3Bn/4LffZIl2
         j+O4zMNt3ID8dzxu+FEUH7l8OTd5THe2ORIxR8UU6Q8glnpn5OGTnWsL9SCdUSHhTbsg
         xlTM+ur6S0C+J7mq6IuCht1kkDE+x0YqXT1+XN+E2X8+QIw7N4cTEA3YCvgncU4vygfh
         svSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+Vwx1dpd5DYfbs+djZoL7SejAqRa4jLhUp7vTZmhsK6zDiGLJ1b7P9B5KAld2M+VmPK9zcgnrndQtZ44=@vger.kernel.org
X-Gm-Message-State: AFuF++maqONgWdFWsAr5MbFI78ZV+Nk1O2yn7bl9H7uaZ83vKWTltXC+
	nUTub3aENzWXYy4gFWMUEEz4bIStuAwE+mDXCoAI70aHxz/de8Pyv5MQEEh8KQTw0XckdVUQ/Ly
	mKr3LPCo/exALBHHsyycsgYxcYaMdFlzr7FDMBdf5
X-Gm-Gg: AYBFou3YFUG+5CS1NQ7+8eGwOEyvCUbo4Tj8naU1eDRvFvFSOFoqHml26Ks/Jx4J8Ui
	T/tUBVadI69WWua/GZzTPjGHfrgv3+1fzxi6MW5HZdvHR4kQzNS5C8i3EtZYwTXImYi8u9ayTbw
	kBwtzjhYyb1El9h52dHAhbCQKrugmaMhLtLwZf8e6476MyU0lF8ZkpuorFXKQkYSfqotiuURT5f
	lEbDNiT9q9awFWQHvK9O2FW5h7aiRWcK2ejEBG2o9hQJaJ8tBGz6HJ3OkLx2ORCVe3di1hImIG5
	iWk7fRGUENUT7IYOQU1OnQRRZc63K+PtZ01/F+4BR4kdmh9sObGbUeYuINTJL8parW58du4NFSE
	ca8zqekAFpCPNjmCWiP5V1TOgjxMS2yELWfU4iNGGeVlErQ==
X-Received: by 2002:a17:90b:3e85:b0:39d:f97c:bb2f with SMTP id
 98e67ed59e1d1-39df97cbeefmr7436489a91.3.1789455030721; Mon, 14 Sep 2026
 23:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
 <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>
 <2026091348-sheep-showman-5a20@gregkh> <CAPpSM+RR1ztW_iCnSkYCm62VWsLYygXr2hWEeoikKk9Q8HKR3Q@mail.gmail.com>
 <2026091546-spoiler-borax-ed6c@gregkh>
In-Reply-To: <2026091546-spoiler-borax-ed6c@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 23:50:20 -0700
X-Gm-Features: AcwNN1VjfPyn5bzDCRPAnyDxIKYlDLoc_Gvi-ECILrBxKgOyGUMipD-10NOD7OE
Message-ID: <CAPpSM+RXw7v_9Qnxpvkm7CZA2AzyuA79eSWUGyMG3nanLeyJrA@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 14, 2026 at 03:11:08PM -0700, Xiang Mei wrote:
> > On Sun, Sep 13, 2026 at 2:19=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Sep 12, 2026 at 11:41:00AM -0700, Xiang Mei wrote:
> > > > On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > > > > > This is a bug report, not a patch submission. See
> > > > > > https://bugs.sh/reporting.html
> > > > > >
> > > > > > We found a bug reachable in:
> > > > > >
> > > > > >     path    drivers/usb/usbip
> > > > > >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> > > > > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://=
git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > > > > >
> > > > > > Config, environment, the sanitizer report and a C reproducer fo=
llow.
> > > > > >
> > > > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > >     If you fix this bug, this tag credits the report and lets u=
s
> > > > > >     close it on our side:
> > > > > >
> > > > > > Reported-by: co+66c3f58096d0bde8@bugs.sh
> > > > > >
> > > > > >     Everything in this mail is validated by the reproducer belo=
w.
> > > > > >
> > > > > >     We also hold an unreviewed LLM-generated analysis and candi=
date
> > > > > >     patch. The same reproducer panics the unpatched kernel and =
runs
> > > > > >     clean with that patch applied. Use it as a starting point, =
or ignore
> > > > > >     it and write your own:
> > > > > >
> > > > > >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.di=
ff
> > > > >
> > > > > Please just submit patches like normal, in a format that can be a=
pplied,
> > > > > and do not make us go to random links to attempt to get any infor=
mation.
> > > > > That's not how kernel development works at all.
> > > > >
> > > >
> > > > Hi Greg,
> > > >
> > > > Sorry about this. We may have misunderstood your earlier reply in t=
his thread:
> > > >
> > > > "But sure, posting bug reports is fine, but again, patches are bett=
er :)"
> > > >
> > > > https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh=
/#t
> > > >
> > > > We interpreted this as meaning that sending bug reports without
> > > > patches was acceptable. We understand your concern with the current
> > > > format, and we will stop sending reports in this format to you and
> > > > linux-usb@vger.kernel.org.
> > > >
> > > > To make sure we understand correctly and follow the appropriate
> > > > practice going forward, should we:
> > > >
> > > > 1. Send pure bug reports without any LLM-generated analysis or
> > > > candidate patch, similar to the bug reports syzbot sends to kernel
> > > > mailing lists;
> > > > 2. For USB, do not send bug reports and only submit patches in the
> > > > normal kernel format; or
> > > > 3. More generally, do not send bug reports to Linux kernel mailing
> > > > lists and only submit patches in the normal kernel format?
> > > >
> > > > Sorry again for the misunderstanding, and thanks for taking the tim=
e
> > > > to clarify this despite your busy schedule.
> > >
> > > Think about what _you_ would want to see if you were on the receiving
> > > end of hundreds of patches a week.  Would you want to see a vague ema=
il
> > > with links required to dig stuff out to potentially have to make up a
> > > fix yourself for an unknown and poorly worded description, or would y=
ou
> > > want a real patch, in mergable format, that describes the problem and
> > > how it is being resolved?
> > >
> > > I think the latter :)
> > >
> >
> >
> >
> > > Right now, most developers just ignore syzbot reports, as we are
> > > drowning in real fixes from developers instead.  There's no need for =
us
> > > to go research new fixes when we are having a hard time keeping on to=
p
> > > of the stuff people are sending us that are in mergable state already=
!
> > >
> >
> > You are right. We understand how overloaded maintainers and reviewers
> > are right now.
> >
> > It's true that bug reports without a mergeable patch still take
> > maintainers' attention, even when no response is expected.
> >
> > We'd still like to make one last request: would it be okay to continue
> > sending a small number of reports to other lists, with no external
> > links (just PoC and crash sanitizer log)? We'd take responsibility for
> > each report and follow up with a patch, even if no one responds. We
> > just hope that contributors who know the subsystem better might be
> > interested in helping us check the issues.
>
> Why not just send patches to resolve the issues?  That's the best thing
> to work from, especially as you have ways to test if your patch is
> correct or not.
>

We appreciate your suggestions. We'll stop sending reports and instead
focus on working on patches.

Our original consideration was that reporting the bugs could help us
scale the patching effort. But you are right that maintainers
currently don't have the bandwidth to review these reports. We'll do
the right thing and move more slowly but make concrete contributions
by sending human-checked patches instead of reports.

Thanks again for your suggestions and for taking the time to discuss
this with us. It has been valuable talking with you.
Xiang

> thanks,
>
> greg k-h
>
