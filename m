Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229942E41A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767993; cv=pass; b=NlE/mAdIq8GuIzAxG2AFCEpeXWggAEVoSlQzZlkh4yo5Wlhff/mPrIgc+wAAlAKcQhHlZoHClUlkYHIMnRyVKj3KXQbzfbYTfsg5xePRtug3iz6qme7ihwO4NsY3TKpl6fqYIjhxTf/zNJp75Fhlj3Bw382WOCVOAEYHIIdV/Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767993; c=relaxed/simple;
	bh=XGt31Wr9yjCa78+DVzWTnKmcJywlyt/ZVR2TBznQWZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLgz4073vgAlAPTY8gH2xWGvN6dBK99iUSI/4fe9rT8xb6lCsAEzsCPq5xvi7ck3DNXutH2w/UpARz0IcSmC8nULFIjFKzjM6u2T8eKZ3kZylJLkcG87qAA6Vex1C3SMtMSodir3U65WcU1LS4QH5Dc40/9oNO4AHFbAFByzyFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzeGL8/7; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzeGL8/7"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-475920b9ca2so874966fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788767989; cv=none;
        d=google.com; s=arc-20260327;
        b=C7SddvbXaelEljpe/+bsAm3kpAwk6e/qwUs8R7YYQ6gTVnDsebntIFmCSOSCSZURUt
         twm2T2sg+Rdk3h1lmv41XaeAsXCVa+0qYRSrKPbhwjI+NDZ+ZIMnVwKG5nxXNG9uIqQY
         V9LghXuWb0fzcZeTa6VM8otDJ1taWdaMyhwpNN0SK8aTrhdrh8d6wTGpuuhFxancln2/
         HW/lwkW8XtJd3TeGvdZPCc3SbL7U2xZuy77UwByoHZIF/GyV5Zk8Vr0fmiTiHWks/ECs
         ig3RWlEYxCJSzgzJtToT7ZzdY5XHRTIdTixOReLs3Y50H2w7phVZl5X/mmanV9lkkv/O
         5yYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        fh=2oJ+zD80v8062fUmb0MyWgzioyH3qdCXQ2ORTOidmC4=;
        b=WCsYvW07g2LX9lN8R7V8tw8FxpaAaln0K3x7lpAKKohmCacbEvP5l+47292tjIuV1T
         82D5wNCkciSOnY/g8Uaq+SMYxX99I/0UxgHCfSUhkM94tgf15b6J8qKTQ+NRvBBbzxQr
         je6YW6xsJowWImKge6mlERlU9E7UdmsRfdPXcILRegwSzFTvbz9DcjL6/rdWDnhvc7iy
         NRGmX6CBiKpxmOMn6+ishGIl4s/q4o7Ixy3htixhHWS7630GZmQj4eJ+dFDxavCLxU4P
         xil9NFROGGVaLy60xJemFK+dkFc98RnRsipe05+DcO3E1dezeJTyQkNSbEitCYMn4I7/
         biLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788767989; x=1789372789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        b=dzeGL8/7uPV2smb5XcebF4vgpYfrNbGHToMdBjS3bwS0TG6kFF/stnVtXZ0oGTZR8y
         zcrJC1drNYLm6rt+Pu66pMmyPVqZxKIVNcEU+X3HunK7U1Xs9H97FIIXdrKjI67ek+s5
         AiCEElMPIF+09GdNdhdeJqda3YZMVo/jr9QtVhEaj4RM99an3lAmYS5eldLSUD9OPExT
         2bmVD70kQFmT1/6V29aI8hL4UflLrWU8dMc4LTirVJqWhg6HCZ0tkpK2t5iEpTqArfRp
         85RCgYO6VQ3l1/Rx7AXfqnulvGOkix2pPDQVx2mcitJutccgalDBku1mxFJFYqMhCzZ1
         mWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767989; x=1789372789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        b=YgOt6l9mg0zezZomzcoS6AwtiVmVBzaSlpQjFVVuiXm9diRhFxsDvNM1H3vKGxH3mg
         ogXcf4vZaQi0xJwl3/xvs6f7jhv8rGYLB5Q4t7gKbLUe67y0rG5056CQQOVMSBJQzq9q
         aQZnbnt3Nt5dfiL6wjIwuP2SiWrWZRIgG2/61YXPNIm64U3hD0RFlLcpee61ibnh7NGy
         N6nJzBrdhziDlUugsWxHb40Y55LFFbSB+KLaS1133u0xHIbmCa5+G1ysP98dYQkPI8Li
         IBBD231x9M/d+bWdg6Gu1VQ+jkAC8K7yFTwYWu5RBEd7aIeDdL86t1P/IczYHPG++1jt
         Z9GA==
X-Forwarded-Encrypted: i=1; AKwUvBz3hN/ygTi4z+ZgWCOANVFFdmC+g/IkUNzvJMgCtwO8FfWY/1tnZK8+Y8VC4pz+Apc1cHBn4Jkdz7I9SfM=@vger.kernel.org
X-Gm-Message-State: AFuF++nUbljQ3fHZv8VaeJcdQAoJ/V3Rta+5lj0lz9i5qU9RjjOgvxMs
	TC7mggtx2gLJl6fx+CbLPZ2nLQ4oAtTyA1W9opCSkCphLbYuazOGc30yEHVAcK7o62Oek7YXrFL
	e5ohOemFhh0zvgaGY3hfKXYrYaRw4WoGq4gKHw2Sr
X-Gm-Gg: AYBFou0Ih2v/igFgkDn9X8CeJGetnBXBYnb/EBfaHCl3T89+JA73XTdI8+8pMuDwp/D
	R7bizlLjDgrS8U7J10kA9u6Vapw7KVtBdDXglMJPl5M5Jj2o77UY6Fxk+DYUGb4sFeNDOSpDOWH
	Ifk5uq2RgPZk7/gjsGhEv0k4nCRC1S4tZY4lNtyG3JA1iVgvb6wAHtJUbkTgsviFyiJurojD+GE
	ogxYBfcy2atNkRPinP6+e/fchvEaXKrCCVsx4ukVnyA1Bm8OKGita8vGS5pyLZvy2HLd8120iNe
	13Y+BFtATNDsncxVA/1PbejHpfceRAR+XpPqiHpJD18iHTtm1z96Z4dTsrpVQSAaadSfGa55Q36
	4g1a4WllAkcYpmQfmhn6DSB1TgzHxEiuE8CNvykZGrdXfgXs0BXWASl7cjCG3QDdPCDAS80UEMN
	SoZOtytBy7GmyN0g==
X-Received: by 2002:a05:6820:2912:b0:6b7:46e9:9702 with SMTP id
 006d021491bc7-6b746e9a327mr11595563eaf.50.1788767987452; Mon, 07 Sep 2026
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com> <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
 <20260905104331.6d4288df.michal.pecio@gmail.com> <2026090536-numbness-enlisted-917e@gregkh>
 <20260906123835.56902ed7.michal.pecio@gmail.com>
In-Reply-To: <20260906123835.56902ed7.michal.pecio@gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 09:59:36 +0200
X-Gm-Features: AcwNN1URJq33DPZJB_nkWiVtSKSUZBfD7yAMo8bMmQpNnyIBte8yVFjfPDnbhds
Message-ID: <CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>, i@zenithal.me, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:38=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote:
> > On Sat, Sep 05, 2026 at 10:43:31AM +0200, Michal Pecio wrote:
> > > On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:
> > > > syzbot has found a reproducer for the following issue on:
> > > >
> > > > HEAD commit:    9d80aa4617b3 Add linux-next specific files for 2026=
0903
> > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/=
linux-next.git
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D10adf4f=
9580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbb4a32c=
282cc2ec7
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D7300affe3=
88249d66dfe
> > > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80be=
da6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D121c721=
5580000
> > >
> > > Who or what is coming up with these ideas and even commenting it?
> > >
> > >     // Iterate platform devices
> > >     dir =3D opendir("/sys/bus/platform/devices/");
> > >
> > >     while ((ent =3D readdir(dir)) !=3D NULL) {
> > >
> > >         // Set driver override
> > >         snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/dr=
iver_override", ent->d_name);
> > >         fd =3D open(path, O_WRONLY);
> > >
> > >         // Bind to vhci_hcd
> > >         fd =3D open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRON=
LY);
> >
> > That will taint the kernel in newer releases, and syzbot has already
> > been told not to do this, it's not "valid" at all.
>
> What cought my attention is that Google apparently has some capability
> (human, machine or otherwise) to understand how this repro works, and
> yet they keep reporting this broken pattern.

As Greg pointed out, we've adjusted the fuzzer to stop using this
kernel interface, so there should be no new bugs of this type.
However, we haven't yet invalidated all such reported bugs, so some
notifications like this one may still leak. I'll look into
mass-invalidation of them all, but in the meanwhile let's close this
particular one:

#syz invalid

--=20
Aleksandr

>
> It's just waste of time, including syzbot's own time.
>
> Hence syzkaller@googlegroups.com in Cc, wonder if there is any truth in
>
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> Regards,
> Michal
>
