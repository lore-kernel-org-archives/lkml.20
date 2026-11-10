Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324961;
	b=1c8vGJbghIO1Ojt8wuNlQXVtaDbwTvuQkGErLS6uNId0w32UescB+VZrLBqZkXnv+oFD
	 Tfcu539DrFCzV1+sooU3V2/I2FigbycfphjK+guld5+Q0qRTJI4yg1glzucnyCwQRidP1
	 M/Jtlj1Hi25buPG/zkIbKIFob2QElBQVRkM5keSog9r7zbtfM2im5V78VR/EuHRkiv32M
	 4ehDkY+OJ2u1vf6hEWM8/cZ87i4GSIIWRXSu/6Cw4FkcdMZUpVhmX6nGiWFMJPJH4Tfx9
	 p3w3CrK1LqhRofzY12Gnumg+Ie4egdxWID5IQpYloSBVnTqXATT2wBqeXsVzaq7MwUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7/dL633gU9pIAb5KV4i72n6S4H4LKkqe3A0a8gUulTM=;
	b=OT2R0ZGTaNb6hln8h8cb9Fq/xB+Zi2m0MPWm0k+lSB2GP6cYTTGiS6+DzsHq6d0SHU18
	 r7Z3+YD0zjDo8+OIuxUWg16Lbho6w2ekUcOPTb5eSmU+v9AbNIxjdvIqinz5wDV7Odfsh
	 TSj1zUm9jJ8bJtR58Xza9HNXfEk933HfOceKLKbXmhYJVMYNxxKCmVsIYk6C8VvJq2xoP
	 CgmSlGdsamUOnmTroT95cD2DmCuYlD1AUuN32hTC32qBTlOMl5cXF7R9fVnq1yJgSvn4v
	 RuoCBXJwepudY9HP1MOmHaHJAaBsm664GoObBCDDlBXkf4ajIdmxAWgIzKIObaiX3Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C0b2/jOh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5E9606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE5E9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0b2/jOh
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c02c106e6so2424114d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794324960; cv=none;
        d=google.com; s=arc-20260327;
        b=XMeV5f9q2uU3fxkXsfzsgMbo4qaoFeBjzzedpuBydIOvtiA86tHq/cGEJ62ewn6Jop
         jwXv1mNtRq+wZ9OUJ3RBsMthPGkVkVErPEOvtw8DNIFbgpdPGnlcLRDH0h+Aq5Aj+hz4
         +HY+ot1r8hf0946KzhABJ99ovemZYjaHFVJpPDUsQglW1dHUADcoEfvfGBU4jITdv4u7
         7JkCxZwVspEM1T5qC3EJYrmcEyZw3LPYtH9NXMliEJZC78dLDjYLqLh0VeMIH/K213cG
         wt3EZp1X6GyIZpFZZPRhorgXYCgIa/AeVzb2XGhEmOyPK006yBGMVOBJJK3t/+LzybIs
         LzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7/dL633gU9pIAb5KV4i72n6S4H4LKkqe3A0a8gUulTM=;
        fh=ZL4WDVKw9kIIioEXrW16akfmJ6AZhtVO8v61mXxi45U=;
        b=QenscpAzXyJRL3ywMU4HQloJQm5xPxuJ6kQ8WNHV0xKMjhcv7Ejk4R3orAvBKp/T/h
         NsoPM7mmijNKRHg7Ok00ELjq5tFsZWT957z3bqsVYl/9HpfEP4lHhqszjS3eO1tkakbb
         eUS51iWndrVbA2Pn/vRUAe7peJPoR492ThcXdOMxAXfC5kMhT+Ce3xc+eQsWFDwx8op5
         /t+c3Zy+3GUB2IauBjbqYiUEmdh9fNg5HXMQ/luVviZBE4x242DTHV0Z11N6//zTntBV
         LWdRF4MKPNF0D/FfPZmkxeOd2NoiPFUEADJQ9kLIeCjYBdOK7ow/KY2mNdS8h1+PEQOK
         tBRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324960; x=1794929760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7/dL633gU9pIAb5KV4i72n6S4H4LKkqe3A0a8gUulTM=;
        b=C0b2/jOhHCQhLU0HPLo28wTF/A4hUUwe5nuPjm1MCJF/9+1XobGxR0NwFuUdeeA/3q
         AUkWOxGE/VnRP9NerWiQ01W6PI/zRpJpQ/Ptrye1Oh50gvsXI0IQw24svCkOR2ftNPbD
         F+EiYp8RbSPxuil9HrYsf3tMcPF+/MfHB0MlHSOZLioN9xBGScYmkdMqASHqjCCSd4Qx
         YFTurw0E4L+9i4ipnT/vSxx2wcZCY6vMCr9dwehOFJyH6BjEeEG772C/VPMRja8vdOGR
         54w1pzPAh+mCd55AvMW/u6tWIHBlovkMp9WlB67TM4TVmlP2UwqWIqkOJaQu1NJFH63M
         T+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324960; x=1794929760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/dL633gU9pIAb5KV4i72n6S4H4LKkqe3A0a8gUulTM=;
        b=M/XiGti6DEx7Y80ai/AjUoX2g8SbXKmbgh7A46C74p1oO5EjySDHhu5fOyS/RMUlxH
         +UTX8UmNxn4yJ2f5h4J59hhHbuAMuxDIEBEM3yeZkw7xDEq0a2EwrMvFZXKJOnE2bUBQ
         oKWAmIDVtuz6iSqF/fCRFf+Beme9ULW7wk80/q752noOU9qDWQOI4kwpdXtfmGMNKu4G
         qo7FXtk+5VrFB9vFW9SGlZiyHrN22QBYay+qR2ZY3kIleP1hzQmQVU2FDgbrvwFp8qg4
         yd93/RPhDrcfYDYKtVmKUMwgO9gws+WQ5fW0BCFL2ynlA/u2DHQuBnmhoEkTlWp/v0rh
         ZsBg==
X-Forwarded-Encrypted: i=1; AL+hErFJbg/9Ytb8RZJ6FP3t/Y09Y1d5mID3dvuHtNcDItyCnSHIe/Qrk4B69WpGaV6QpQWv84r9kRpTfHQZKrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EE/rvmdYcrStaB2GFAH/AsSgnk+YqW6FGq1RlKUJP05RK13hS
	q4L1tl5ZoBXfgnfbWXHZo+nWnI5exG6EfqnBZLMO1/eEkvyJEdt60p/G8OdkYq8aACjEREKjHEB
	leUNdeY+hrdTwr8DKzf7fFdAL3obDBq8=
X-Gm-Gg: AYBFou0uOYhLUlC6bmviCweT8Ue9T2mnDNtdrCL1hTA0k1C+EDZE66Yyen5EO0HsmQR
	Q5xmP9drjdjB1YhXio+G4I4fkvnjdfnY3Gd9GaPUGcz6LJfLBVYZDk6Ypu0dnCc9ZWZP+SurDoE
	qiYLvzZZdsTemDW8YxLyuUNlyDLMvBr7TCRDJEldMzgCGLXn6GuadtLixjbnngF+W9R/hlUiYjh
	dGzEUbNH9ZfoBlwegRKe+T4K4vtIoi8QHok96mHk6X7Q4aB+FRG7kYf+jOA1GwLI75JgeSUbZ4e
	z7ZPBLwzXLUj1yXbanrTb7JK32cGlGUW7wHeMWbldiZswfeOcAkp/aVG6xuEbOOXvqpJvuR4epk
	Bh9orVBk/WpnRHS9FopOyrVqLRW8CyjvdIPyhu59SZ2aFUaRMuXP5TUdfcti9q9fdCJFcx9+k0W
	WOJgRxUjsyenHVxycmlc1vXPm5ZLNC+q1aUrrFp9bC5Oa0Uz5TNVa8lMw8Vg==
X-Received: by 2002:a05:690e:1206:b0:67c:1d44:7887 with SMTP id
 956f58d0204a3-67c5643601emr1815642d50.13.1794324959329; Tue, 10 Nov 2026
 07:35:59 -0800 (PST)
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
 <2026101814-strut-endnote-a0b5@gregkh> <atYj06gmgCa40q6T@google.com>
 <CAEjxPJ4zV-YE9vRJ0=DgjuQY5gjXwRa8hcd0KpgVtyK_9AM+oA@mail.gmail.com> <CAHC9VhTzV-6FbwCimrdUHuyvVhmUfzwL8PtydKx7Xq3Jkp5mmw@mail.gmail.com>
In-Reply-To: <CAHC9VhTzV-6FbwCimrdUHuyvVhmUfzwL8PtydKx7Xq3Jkp5mmw@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Tue, 10 Nov 2026 10:35:47 -0500
X-Gm-Features: AclHuK-QtaUGpHT8dJnVLLwqsnwfmgjvLZ9HoyrzUVY6mTTya84Y2fYg1AAygIU
Message-ID: <CAEjxPJ5nfVfK+Ko4fp+4k-gWkx3dO87HkXs-jnMV14Zjquds5A@mail.gmail.com>
Subject: Re: BUG: selinux-testsuite binder tests fail with CONFIG_ANDROID_BINDER_IPC_RUST=y
To: Paul Moore <paul@paul-moore.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:47=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Mon, Oct 19, 2026 at 2:33=E2=80=AFPM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> > On Mon, Oct 19, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > > On Sun, Oct 18, 2026 at 06:53:49PM +0200, Greg Kroah-Hartman wrote:
> > > > On Sun, Oct 18, 2026 at 06:36:04PM +0200, Ondrej Mosn=C3=A1=C4=8Dek=
 wrote:
> > > > > Hello Android binder maintainers,
> > > > >
> > > > > Fedora Linux has recently enabled CONFIG_ANDROID_BINDER_IPC_RUST =
[1],
> > > > > which turns out to cause the binder tests of selinux-testsuite [2=
] to
> > > > > fail.
> > > > >
> > > > > Minimal reproducer (no SELinux involved):
> > > > > # git clone https://github.com/SELinuxProject/selinux-testsuite
> > > > > # cd selinux-testsuite/tests/binder
> > > > > # make
> > > > > # ./init_binder.sh
> > > > > # setenforce 0   ### <-- may be needed if SELinux is enabled
> > > > > # ./manager -n &
> > > > > # sleep 1
> > > > > # ./service_provider -n &
> > > > > # sleep 1
> > > > > # ./client -n -c -r 3
> > > > > Client ioctl BINDER_WRITE_READ error: Invalid argument
> > > > > #
> > > > >
> > > > > With only CONFIG_ANDROID_BINDER_IPC=3Dy the last command succeeds=
.
> > > > >
> > > > > The issue reproduces even on a kernel compiled from commit
> > > > > eafedbc7c050, so it seems to date back to the origin of the Rust
> > > > > implementation. I'm not sure if it's a bug in the new kernel code=
 or
> > > > > some bug/wrong assumption in the testsuite code - can you please =
look
> > > > > into it?
> > > >
> > > > Given that the "real" binder client works, perhaps the test is wron=
g and
> > > > should be fixed?
> > >
> > > Apparently there is a divergence of behavior if the SELinux permissio=
n
> > > `binder { impersonate }` is granted to a process, though Android neve=
r
> > > uses this permission anywhere.
> > >
> > > Thanks for the report.
> >
> > I would treat Android as authoritative here and fix the
> > selinux-testsuite to match unless you think there is an actual bug in
> > the Rust driver.
> > We originally implemented the binder impersonate check just to make
> > sure no one ever impersonated a different sender without us noticing.
>
> Unless someone knows of any other widespread Binder users, I tend to
> agree with Stephen that we should treat Android as the standard at the
> present time.  I may have missed it, but has anyone posted a fix for
> the test?  We're at -rc1 now and we really should get the test fixed
> soon ...

I have now posted a fix for the selinux-testsuite at:
https://lore.kernel.org/selinux/20261110153110.29256-1-stephen.smalley.work=
@gmail.com/T/#u

I didn't cc the kernel binder maintainers since it is specific to the
selinux-testsuite but certainly if any of you see a problem, please
let me know.
