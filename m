Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793666872;
	b=vqtcszWN4qMSp245tSyALVMl1CBrheqOxTqWNl5v3tWi63v/93apFwNTlH+nk29CEhuQ
	 rIr60Ytr8JMbB91T8jVkCi1/nt3yujsRg0D2W37qTNLpjYL12bVvi59OqduP4yKkrpA9O
	 cb8b3sBUfqOoHNvqipNtvCP5Z3jptbxAwY9FlJ+c94MT/etE++xDSaAt9Dpt3QTAb9/J2
	 R9XqB5tA/f6x+Vx4Pt8Xf5vxk8V4wkMZ0Ma0v1NTtsPDnroBP+9naJcGtE4GMgL2djCTp
	 s54XcSi+eFNuO8JRp3cdN1jTF1s+MvkffVQVZybJEDoHjn9ObFvoBtjr20dkch0kVaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qmH5OvatWzBofiEN6YsVBCfdM8VLN8xm2S+OiSeq2qc=;
	b=1YapuyKCeMWCzY7TCUs1M4qzk5m8updmz9kz5eIOfx0K6vK4tSGi+avODh1tdnxvNZBa
	 ObdoSb3+nrNeI+CuLTsgxV/kALBe4UWmNzAssQm+U2hGO2d8R3F7BryMPV9ZaAqjk/LJZ
	 /1F0J3lCIS6N1OJ4qQfZeJKgWsBkwlDlcjALCwkHiyI5vORAV7CKyPnSQUQ4kf5XR1kay
	 KK6mFbev6geVNR3psUmFFU40pYrZM2D3Orau0PDx3jtJNa9s9IQVR/FjUD1AAWSxNZUtz
	 s2MyA4s907MBKn/dsa9S2DXspEu2QLoqVcvEYmMwkOIPrdUa/33kvGDWq4CKDiTtbcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=NE+5SyMU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62E606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D62E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=NE+5SyMU
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so584463a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793666871; cv=none;
        d=google.com; s=arc-20260327;
        b=F6qT3NGX9xuLbVW7lUatJYG8OcS+o7qqJme2vcpu126/EYb9+0vcO9jyB95+Ca8NNB
         iW0XkmrsO2V+J6waYieg3Mv6z2PLkJJ35rc/RBAQBHX29je2r5BYdW8HxiNAqdyXOOF1
         Lon3HphasDe9XjkF65QUjc4aea/F924fWT3jObnOMhmxN/1gZABoBTj6uCJsn0C3jP8S
         tyZJjyhDZlp938gSTaBDgpsA9NjTgZ/yAneeCJF5mL4xKsUfMGXy+HO/SrFoIsggVT/z
         LDYjAbEAWgaOyz7kDDipQmpW0i0APVNYoRMz2Ej81HlMDbJpqJdm97fVnGCSKQcGZkh8
         aDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmH5OvatWzBofiEN6YsVBCfdM8VLN8xm2S+OiSeq2qc=;
        fh=VIE+ZVFgs57fQ1oplWRK3ifrj+1+FvBZzO6juZ5B52U=;
        b=SDa6e9Nh5qbzguPNksfn6hzjImILYvaE5kgPxlXTpZqj46DovzHwnvvwanLAyaaFOU
         Q439ov8EzQV031l1IiBXuY0LMvcUPOBkli0PYTrpXYSfXiOE5IOb/vxkP4wqbLcdc+yc
         DmATKixKnZkXG8TKjEZ+zlGfW1cAMxYr27v2jykwvpVfk4m+rjaiAilz/q5eTsH69hzx
         roDtC8BzTjjQqckyKd99ckxQZL/BchBebtDEIIF8cd+IgqThK1Ae/Nylm5LU/PHXXv7b
         qqrunXWKHl+gSOplVpL6UWoBXmNaFtB5+gzGj3turfJn65p/cciN6SeAtCltYaVxd3Zz
         VdNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793666871; x=1794271671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmH5OvatWzBofiEN6YsVBCfdM8VLN8xm2S+OiSeq2qc=;
        b=NE+5SyMUfN+gGxZQPx0GVzjzJeWngBa34Ls/rh45/noiG21jaRtB5aBI8BrctrYY09
         b374TBrKwJW43aNm3XeK6M7ItT4nrAosQEfR/UOQZYSgpdnOWqAiHtz3SNuy1WvOuV1c
         2tLrrZN9w5H4jY8do/0mM+ixJdkEFG5OwW4kpKP2UYYQzjybupKPXfu9O2gKZIsSnB/7
         Pv5Qygy0gs5BcaIAkygAUskAhuvrx9bcsw6nf8P8R4fPLUNUEyzVDKBKmCGMx/5YLecR
         19z5pz2LtUth6gsMZEoc5+5WblkJBZuBhPLzCjeUFP6FeVYUfd8udpkjIyuDbQ0kGJin
         mi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666871; x=1794271671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmH5OvatWzBofiEN6YsVBCfdM8VLN8xm2S+OiSeq2qc=;
        b=IGfS+U/mNWtoBkSsxtY1gw6irplW/esqtZLigoXV91muCEyE5Dlz0skJd3+3f7wl+5
         Yn/4kbTu2FO0z2exEQ3a+DnJc6JFbC6EvYJhWrHyQHaVewzvOrMaLVO7R/S7nTZq8ZU5
         DpzWIg1gIizzkpVRLzj8T4wGx/KxuteUo1uCidf8c9XUj+YSpybl2cAHvI9nU1Hhpvfu
         VyZ8zBqK+tgwkazQfhsE/Mw2Bcui1TIJQ1ujMxDhwGM+1an8pHwZOoH5oY1FN1AoaTL4
         KUJ++tfJ1Ax84W90ygZqjuB0Y4CzXb3XpzSE/n1yI6r5gVSwVudSGX6QTADnRc6Vg0Wd
         fw1w==
X-Forwarded-Encrypted: i=1; AKwUvBz2S87LPHlVnpxs0euz33qvMfzFRoAUDqEzPJHlMKjzuoOQlHZ0gZnHAmF9Op+p/Oe8WEf7mwmHtzm0OWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xi07P8a6J9OjdvNRXWt8KA1KQLWyuwMVr2GFeC3eg/NqVkJc6
	cPENW36GBDQ8YbbfTRRXnP44O0Ces5YhPKH2NKikZL94DiZKfXdO15RsF4iX4QBGTPUYiuKEGNR
	j2NznGIcsr3hQTlEKygdHj/gfoh2ANDdjfiyjPSiJ/1zNqPUTGCkUrg==
X-Gm-Gg: AYBFou0sk3TpgaB5AmXITAYeb+KauVYh9zhwDxbDGdOg64i6IUkxn9qpGH8QhxdZLMR
	gt+UeaMNo51I7iJvXSdxx2NFrC/xeQZQxxWv96BNAVWzzxEYqo7bjPNK6EusbE5Zv54GDzidd1l
	mVPx3BKFm6GQYjsyGdPOuu8mqxPj9dkmzoznCCSdHA0+pon4npOY3LE37bXlJpo1bBly8SFvj97
	l6epHs4ttxwhklfrj+3vvivybC1vy+46RhmhQreWbwceib4lgbj03Id4dweAFcM7YyCETLvzfN9
	TWVi8N/0xCXTBwAVNF17ZdAUBaXSSGrJIs3Spl7pA9qj+ysVgTe34jsVmZk7aI69ube+8ld3JXo
	N81a7lb5kDYsifP16K5NeEpmUB9D4ct1EABqMxqW3MEpo+ZodGukY2bp1cGMGkkj78SNp
X-Received: by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7 with SMTP id
 98e67ed59e1d1-3ae897aa7aemr9873041a91.49.1793666871426; Mon, 02 Nov 2026
 16:47:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAUqJDt1pXQ2KVBvMoMiDrzz8ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com>
 <2026101814-strut-endnote-a0b5@gregkh> <atYj06gmgCa40q6T@google.com> <CAEjxPJ4zV-YE9vRJ0=DgjuQY5gjXwRa8hcd0KpgVtyK_9AM+oA@mail.gmail.com>
In-Reply-To: <CAEjxPJ4zV-YE9vRJ0=DgjuQY5gjXwRa8hcd0KpgVtyK_9AM+oA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Nov 2026 19:47:39 -0500
X-Gm-Features: AclHuK-H5LxOjKqHADEoKlThTJbWl_uN7gOPX5dElTGASqVVMSHM9dmMRNjNZS0
Message-ID: <CAHC9VhTzV-6FbwCimrdUHuyvVhmUfzwL8PtydKx7Xq3Jkp5mmw@mail.gmail.com>
Subject: Re: BUG: selinux-testsuite binder tests fail with CONFIG_ANDROID_BINDER_IPC_RUST=y
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:33=E2=80=AFPM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Mon, Oct 19, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > On Sun, Oct 18, 2026 at 06:53:49PM +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Oct 18, 2026 at 06:36:04PM +0200, Ondrej Mosn=C3=A1=C4=8Dek w=
rote:
> > > > Hello Android binder maintainers,
> > > >
> > > > Fedora Linux has recently enabled CONFIG_ANDROID_BINDER_IPC_RUST [1=
],
> > > > which turns out to cause the binder tests of selinux-testsuite [2] =
to
> > > > fail.
> > > >
> > > > Minimal reproducer (no SELinux involved):
> > > > # git clone https://github.com/SELinuxProject/selinux-testsuite
> > > > # cd selinux-testsuite/tests/binder
> > > > # make
> > > > # ./init_binder.sh
> > > > # setenforce 0   ### <-- may be needed if SELinux is enabled
> > > > # ./manager -n &
> > > > # sleep 1
> > > > # ./service_provider -n &
> > > > # sleep 1
> > > > # ./client -n -c -r 3
> > > > Client ioctl BINDER_WRITE_READ error: Invalid argument
> > > > #
> > > >
> > > > With only CONFIG_ANDROID_BINDER_IPC=3Dy the last command succeeds.
> > > >
> > > > The issue reproduces even on a kernel compiled from commit
> > > > eafedbc7c050, so it seems to date back to the origin of the Rust
> > > > implementation. I'm not sure if it's a bug in the new kernel code o=
r
> > > > some bug/wrong assumption in the testsuite code - can you please lo=
ok
> > > > into it?
> > >
> > > Given that the "real" binder client works, perhaps the test is wrong =
and
> > > should be fixed?
> >
> > Apparently there is a divergence of behavior if the SELinux permission
> > `binder { impersonate }` is granted to a process, though Android never
> > uses this permission anywhere.
> >
> > Thanks for the report.
>
> I would treat Android as authoritative here and fix the
> selinux-testsuite to match unless you think there is an actual bug in
> the Rust driver.
> We originally implemented the binder impersonate check just to make
> sure no one ever impersonated a different sender without us noticing.

Unless someone knows of any other widespread Binder users, I tend to
agree with Stephen that we should treat Android as the standard at the
present time.  I may have missed it, but has anyone posted a fix for
the test?  We're at -rc1 now and we really should get the test fixed
soon ...

--=20
paul-moore.com
