Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4A3EE1E5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750802; cv=pass; b=dEB8BBJ1dx3drO3QQz87jS3STEQ4yO0t5GIfqQ+6y3Qh43rZ/QBv/ADIQFqfhjXup54Iq8G4irTpWLEqY4ZaN+zOphdEOXR8DGskDGJie4ErWH68xzhgItdc8dI9mEIpRVpyCaPQDKrapF7icNqgOQWgS7pO73BRm+r+jqEnXrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750802; c=relaxed/simple;
	bh=PPyU/hz/a4Na+5pAT4hhG8x3kDuFcn+kPX+Se5g2BoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fokTq53+8FDN6FHuQk6VptuHc2/zd9H6maJd+8/hnqrudGZ3td5Hjf5gB0MwVQZ7bl2yXyhP36aeEJPAvaSHX0gb3BP+95wI0LqMsSqTgMKQdZmlepRmbDhuYQRNr7WQaP9hpfvrUrdwjMsVrdFjmDEHJNjBpcjKJvgfpSQI1Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5VB0O21; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5VB0O21"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-451d8064238so657615fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750797; cv=none;
        d=google.com; s=arc-20260327;
        b=U4oERI8Oph2Ejqn4hdZR0ClF0AFtuNOABebQY8E54REAiw5Lgkkh8bih8RAuKfst0L
         LrwT/W129aw9lr38RPAgH/WuIFJYl9Pm5FlR4ScHJ3w844+K+Mc7mkUbuPVvkNe7nwzI
         pMyo2sGnbRbttRND/zU+5ze3JaOY96YsauEF7s+FvQyRvIlieBG+1I70O0xbQ+tpJHfG
         7NL6EBWu8e5Dmg64pErM15nI3TWVY1qKZ5/wBMotrucUyFeRo/jbPGVFFQVtHuLy9w0E
         hF+/MR+qZsctweUSNVJ8LSKfuEse+FW0bLzoFqbSYCFhlCoM7bYxLlapPqj/3LZHWso8
         s7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        fh=5IScIYny3Qgubd3zMaG+a/OwlpFOhAbfrsmg+zwHwwM=;
        b=ITtlIlC539HVpyPg3+gPSXMN36j6nIWgBgmjuybjJ9/rA3JeHOMPXCOljaFFZyjp9P
         QkcK7LQ71npT3HAZ4muQb3X1gjlpINLW/lnOCwQVXXfdJEgv9EsVg946yOl3JCUifo4O
         kDRmhs/funTgEv6t7xj7soZ0hG0UA4QDW/VF0xezzIEwm+wrm8e0xcS1jlTx3aVANL+S
         dQRSJklrSklOrPZpxFluVPGAWEnGxnbbAWLqhEAr4N/mEnToOemeOvWAelT0qtx+ldCz
         QXTKxd3weaE0vysXycWKD935chudkaDjs/ycFLyfa7kvOggltdc2MjAmqoHZRm86q9ZZ
         JWsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787750797; x=1788355597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        b=f5VB0O21Nql8ySw+1SsT4k6WYugJHStg9aTUot/hSdc/dB15NxmjbX0+REenpjOe6I
         mA0woCQcfZQ1HJvH7WBkzd/0BPue3FPkK/6DvenVT9JjorUKsqfkP60UPXLOvZcQDqIs
         98cKeaa1MjjoIwimixGvaIrv6tpf4Sdxan6vXXSju8llSamOBz3gqSqHDD4m3hBTpq+X
         awMUMrtfFHqb8AKV9OlDBkZ1Txk7kzbvCayh+5w24FhY57DTLz7ec1h0docw6MDRlx3U
         PyA/CSieDTwB6wAQbYMXuzIFFcFahtvy+ZtNDMk1K8yt4MYhntskq3JGQ+fkEIoCDQQB
         Q7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750797; x=1788355597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        b=qnS1JhxMAJG4s2GZflHNZYmX/oP6fyJnQROVgcp4X3p3KR/NXi0kyV6OK9Tr63ACBe
         nkT1qzMY5J4Mr2qagbIaIyUv0vt2G/Skk8vch6Fi4MiAoB6Qq+nkm799IN75tXdbdYh2
         uxkNcfPbqNR60a2p2Zw56+pfmc04Sjeegw24Nw2/9SURfruAS4xMb9wrO9tqSdqO3i7D
         CxJw9vW7sKimqYs4qFCsqvQGHjUWENY27zzbc6t85iTCeUbIJuxpKcXkXzTi/ltICZo5
         J58ZTXdJhmAhcHODD/4ZqfBnWJ2ZFXc8tTSeH3AjJ46o1OFoHXmlmptgwoLhhwigShLv
         BD+w==
X-Forwarded-Encrypted: i=1; AHgh+Rrqt2cg3TWbNT6ZruGTyVRkgaypxt9Kwv0yp5VnNIXxXLUm/DF/ibao/UQYbI3Aj/Nvt8hvlk8iAWKXtkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nBy/oxtjJtjUe5yJhLUrep2xjWu1YoC8JbJWd6gxdoBn7w1eOr
	BYDNW8NUoyhp9WUZFNGI+Ro8wGOHfmQ+0/GtlCcF4XZo/cg0ZMdK2VOiJGwG3YhJXn6cz7r+O01
	Ox6a2fB8qkH26bMxQso4Qgh0DNKppDK66prF2XVc7
X-Gm-Gg: AR+sD11F20J1eB0siQQoqgb/YQfASIv9vqPJiJqjv0ix6vWR1KrCx6kazzC9BRg9X7x
	yGBise/SOLEp6RdqGo1R0WAvKZRlnZK65AcvII0spTaumK3XqAkrkw4HEXs6fWq+sEvY3YwbxuF
	rGACWoBbRRzb7saUPp5/uUI5/vnbcnMeTIhliftqgt4taSuwBzC/BM7Q8r7F30lCnl+O0lQCqH4
	584XOhxTnHtLrLA6nOoe6LCPu4aVNntVkyhc4o56kUtDPmbH8AGqEsI5lf51DKaz7puVB9odr4U
	Ta2iFQI8uM8Dm38OWXS0BP1Pw6eTGBx4s4urzoi9kZLkPWde5edK7TsQy+qI0TS14xrzawTW8IP
	VXCuV66A4YaI2HrBckU7LLfUCvqgVKU+I/mIcMOP3KORuoC4ZCoTawAxEIj3vAuwNA3ojOxLjNN
	J20PydI/po+5TyAw==
X-Received: by 2002:a05:6820:1a08:b0:6b1:3427:698b with SMTP id
 006d021491bc7-6b1a0496fa5mr6594994eaf.18.1787750795474; Wed, 26 Aug 2026
 06:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh> <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
 <2026082507-ecosystem-giant-0b79@gregkh>
In-Reply-To: <2026082507-ecosystem-giant-0b79@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 15:26:23 +0200
X-Gm-Features: AcwNN1Ukp9gqLT_Z82SDZ7L72P37HiiIWWLnUCjIe39LlRn1vZJuzZxoH2pucek
Message-ID: <CANp29Y5hnOWaqGw8BbPu1TCr00TbvNRciYvs_VCd6Jtk=8kSPg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:07=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Aug 25, 2026 at 11:04:54AM +0200, Aleksandr Nogikh wrote:
> > Hi Greg,
> >
> > On Tue, Aug 25, 2026 at 7:12=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
< .. >
> > >
> > > Please do not think that this is a valid path for syzbot to be
> > > fuzzing...
> > >
> >
> > Can you please elaborate on this?
> > Do you mean driver binding sysfs interface in general or something
> > more specific?
>
> That is the specific thing, don't have syzbot do random bind/unbind
> calls, having it attempt to bind any random driver to any random
> hardware device.  That's not how bind/unbind is supposed to work at all,
> it's for developers who "know what they are doing" and you get to keep
> the broken system if you mess it up.
>
> Same for unbind.
>
> This is a root-only api for that reason.

Thanks for clarifying!

Some context from the syzkaller side:
Restricting the fuzzer is always tricky, especially when the
problematic operation is just opening a file and writing to it.

We normally constrain openat to:
1) An allowlist of safe absolute paths (so it won't open /dev/mem,
etc.), blocking any other path starting with '/'.
2) Relative paths under CWD (so we can still fuzz normal file operations).

Here the problem is that one can mount sysfs under CWD, which leaves
syzkaller full access to everything inside it.

Tightening the access to /bind, /unbind, /driver_override sounds
reasonable, but trying to catch all workarounds purely in userspace
(e.g., creating symlinks to these paths before opening them) will
easily turn into a whack-a-mole.

Would you be open to adding some kernel config option or a boot
parameter to disable manual sysfs driver bind/unbind and
driver_override? We had a similar problem with writing to a block
device while a filesystem was being mounted, which was perfectly
solved by CONFIG_BLK_DEV_WRITE_MOUNTED.

Best regards,
Aleksandr

>
> thanks,
>
> greg k-h
